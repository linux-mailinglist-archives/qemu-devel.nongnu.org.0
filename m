Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00F6E3BE4
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Apr 2023 22:21:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1po8rT-00031F-R8; Sun, 16 Apr 2023 16:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1po8P5-00063D-HY
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 15:51:16 -0400
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1po8P0-0005ux-SR
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 15:51:15 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1681674664; bh=ei/N5YkCYFOhSlzU6C5cEXq7wKuewyn8v+cdF22JI58=;
 h=From:To:Cc:Subject:Date:From;
 b=GkwV3vzysTkV2Rc66xARggxaHNUPFRUpldDuL7/Yp5gQvg+BWGMcmOmIeXCkuxuA4
 JWM/Uj1ihy5HtkFrLQCZSkryR9pt4b4FaBvllKu9X4uy8exr+CdX7m6Ed2Z4b78Wdc
 6yKB1lvtZym6n1mvSjs13aCmghCOMnof5pvS8Kcw=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Don't require PROT_READ for mincore
Date: Sun, 16 Apr 2023 21:51:03 +0200
Message-Id: <20230416195103.607948-1-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
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
X-Mailman-Approved-At: Sun, 16 Apr 2023 16:20:30 -0400
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
index 69f740ff98c8..0ebcbf3d7f90 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11897,7 +11897,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_mincore
     case TARGET_NR_mincore:
         {
-            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
+            void *a = lock_user(0, arg1, arg2, 0);
             if (!a) {
                 return -TARGET_ENOMEM;
             }

base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
-- 
2.40.0


