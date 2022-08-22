Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385359BDA9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:36:17 +0200 (CEST)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4n2-0002Cm-5d
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQ4it-0004gg-LB; Mon, 22 Aug 2022 06:31:59 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:56075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQ4ir-00053b-Pd; Mon, 22 Aug 2022 06:31:59 -0400
Received: from [192.168.16.115] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oQ4gz-00GyKO-Fs;
 Mon, 22 Aug 2022 12:31:24 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] target/hppa: Fix proberi instruction emulation for
 linux-user
Date: Mon, 22 Aug 2022 12:31:30 +0200
Message-Id: <20220822103131.381075-2-den@openvz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220822103131.381075-1-den@openvz.org>
References: <20220822103131.381075-1-den@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The proberi assembler instruction checks the read/write access rights
for the page of a given address and shall return a value of 1 if the
test succeeds and a value of 0 on failure in the target register.

But when run in linux-user mode, qemu currently simply returns the
return code of page_check_range() which returns 0 on success and -1 on
failure, which is the opposite of what proberi should return.

Fix it by checking the return code of page_check_range() and return the
expected return value.

The easiest way to reproduce the issue is by running
"/lib/ld.so.1 --version" in a chroot which fails without this patch.
At startup of ld.so the __canonicalize_funcptr_for_compare() function is
used to resolve the function address out of a function descriptor, which
fails because proberi (due to the wrong return code) seems to indicate
that the given address isn't accessible.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 target/hppa/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index cd304f051e..fbd80e4248 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -170,7 +170,7 @@ target_ureg HELPER(probe)(CPUHPPAState *env, target_ulong addr,
                           uint32_t level, uint32_t want)
 {
 #ifdef CONFIG_USER_ONLY
-    return page_check_range(addr, 1, want);
+    return (page_check_range(addr, 1, want) == 0) ? 1 : 0;
 #else
     int prot, excp;
     hwaddr phys;
-- 
2.32.0


