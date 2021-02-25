Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B713251E1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:03:34 +0100 (CET)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIAv-0000qI-71
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linuxmaker@163.com>)
 id 1lF9mB-0006t5-32
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 01:05:28 -0500
Received: from mail-m971.mail.163.com ([123.126.97.1]:49110)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <linuxmaker@163.com>)
 id 1lF9m5-0001Hj-Cz
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 01:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=eIZ8X
 PZ0x02UJMdHHfLm/1QJKm7gPwZHp82qSZQS0Cw=; b=S1WCxHbl7HaIv+wH00I1D
 awiaE9A87blN5ec6hW4zNcxN3TvLSGSPiK4dnBIdcf2p9qIij4PIB1xh4nU4ILJh
 tIcX2G0u/Lbdi5sphus5c4m3dBXCOsuq+Ys/Gb3xiKlfU/Ff5+QYA8HIdzOhcADp
 n/fecVEpcaS7cth9YOvItA=
Received: from localhost.localdomain (unknown [111.193.234.223])
 by smtp1 (Coremail) with SMTP id GdxpCgD3_w9aOjdgnteKAA--.2664S2;
 Thu, 25 Feb 2021 13:49:22 +0800 (CST)
From: Zheng Zhan Liang <linuxmaker@163.com>
To: 
Subject: [PATCH] tcg/i386: rdpmc: use the the condtions
Date: Thu, 25 Feb 2021 13:47:57 +0800
Message-Id: <20210225054756.35962-1-linuxmaker@163.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgD3_w9aOjdgnteKAA--.2664S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDJry7ZFy5WF1xury5twb_yoW3XFcE9a
 10grn2gr4q934j9an8Cw1Dtr18Jr48Grs0ya1DArsxCayUZa4fKan0krs3CryDuryfGr1a
 ywnIgr9IgrW2vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0CdgJUUUUU==
X-Originating-IP: [111.193.234.223]
X-CM-SenderInfo: polq35ppdnv2i6rwjhhfrp/1tbiXwJE5V150k3O-gAAs3
Received-SPF: pass client-ip=123.126.97.1; envelope-from=linuxmaker@163.com;
 helo=mail-m971.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Feb 2021 10:00:17 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zheng Zhan Liang <linuxmaker@163.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zheng Zhan Liang <linuxmaker@163.com>
---
 target/i386/tcg/misc_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index f02e4fd400..90b87fdef0 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -222,7 +222,8 @@ void helper_rdtscp(CPUX86State *env)
 
 void helper_rdpmc(CPUX86State *env)
 {
-    if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK) != 0)) {
+    if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
+        ((env->hflags & HF_CPL_MASK) != 0)) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
     }
     cpu_svm_check_intercept_param(env, SVM_EXIT_RDPMC, 0, GETPC());
-- 
2.27.0


