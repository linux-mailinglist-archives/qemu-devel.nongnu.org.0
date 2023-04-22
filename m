Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E006EB85D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 12:04:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqA5u-0003lC-MG; Sat, 22 Apr 2023 06:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5l-0003hg-7q
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:41 -0400
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5i-0000fE-2l
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:40 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682157814; bh=BAwx82WpZZmURcNDMQd8RcPycVG7QdU/ASsiJNOYjuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KDLdT4G2hEc1gI0do1PRcYBS3Nm+bUno9RHeMOAj1wQDhN4s4xPq+FnrjbNzpL2SJ
 JnA1WfW1kY2Q0ECMcdSECdN/BS3/HDIQGXHV+ZhchqW1lxzAIOX8z7/b3KWTqYo3Cv
 NxHOS/RU4Bngs1xXR0m0UFmeGKlTGERjYio1ynU8=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH v2 2/2] linux-user: Don't require PROT_READ for mincore
Date: Sat, 22 Apr 2023 12:03:14 +0200
Message-Id: <20230422100314.1650-3-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422100314.1650-1-thomas@t-8ch.de>
References: <20230422100314.1650-1-thomas@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c010:41de::1;
 envelope-from=thomas@t-8ch.de; helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The kernel does not require PROT_READ for addresses passed to mincore.
For example the fincore(1) tool from util-linux uses PROT_NONE and
currently does not work under qemu-user.

Example (with fincore(1) from util-linux 2.38):

$ fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

$ qemu-x86_64 /usr/bin/fincore /proc/self/exe
fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory

With this patch:

$ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98c8..5ec848b459f7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11897,7 +11897,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_mincore
     case TARGET_NR_mincore:
         {
-            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
+            void *a = lock_user(VERIFY_NONE, arg1, arg2, 0);
             if (!a) {
                 return -TARGET_ENOMEM;
             }
-- 
2.40.0


