Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016C700C3C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:47:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUzE-0003TJ-Fk; Fri, 12 May 2023 11:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pxUyw-0003R9-TE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:46:59 -0400
Received: from email.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pxUys-0008Bi-UD
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID;
 bh=tMrOsp+vvcy/76tJSH2vThaM6XqpKlpzKpQb9LCFHFk=; b=SrhL+/4ANK92o
 RlgNRZg5dIzxZLsAezONdhaxWasFvru8LijmEMaxlE+8BEOpXnv8rmiijTM51c4Z
 9HHOTZH12r664bIVSI6wPdaV4APJGytyAkZPsgM2z4stCtJNYwZ535UG2XmPQirm
 hEl0fsagSI6j4KpwFCimqleEKbDxHc=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Fri, 12 May
 2023 23:38:34 +0800 (GMT+08:00)
X-Originating-IP: [183.193.17.81]
Date: Fri, 12 May 2023 23:38:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: fanwj@mail.ustc.edu.cn
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, peter.maydell@linaro.org
Subject: [PATCH] linux-user: fix incorrect alignment of pretcode
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2023 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7478fbcd.65885.188109d27f2.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygCXnc17XV5k+pNeAg--.0W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQwHEFQhoTAeKwAIsD
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

sigframe::pretcode & rt_sigframe::pretcode must align of 16n-sizeof(void*) instead of 16n, Because rsp align of 16n before instruction "call" in caller, After "call", push address of "call" in caller. sp of begin in callee is 16n-sizeof(void*)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1648
Signed-off-by: Fan WenJie <fanwj@mail.ustc.edu.cn>

---
 linux-user/i386/signal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 60fa07d6f9c..1f019689ae7 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -197,7 +197,8 @@ struct sigframe {
      * to it ensures that the base of the frame has an appropriate alignment
      * too.
      */
-    struct target_fpstate fpstate QEMU_ALIGNED(8);
+    abi_ulong unused QEMU_ALIGNED(8);
+    struct target_fpstate fpstate;
 };
 #define TARGET_SIGFRAME_FXSAVE_OFFSET (                                    \
     offsetof(struct sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
@@ -210,7 +211,8 @@ struct rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
     char retcode[8];
-    struct target_fpstate fpstate QEMU_ALIGNED(8);
+    abi_ulong unused QEMU_ALIGNED(8);
+    struct target_fpstate fpstate;
 };
 #define TARGET_RT_SIGFRAME_FXSAVE_OFFSET (                                 \
     offsetof(struct rt_sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
@@ -220,7 +222,8 @@ struct rt_sigframe {
     abi_ulong pretcode;
     struct target_ucontext uc;
     struct target_siginfo info;
-    struct target_fpstate fpstate QEMU_ALIGNED(16);
+    abi_ulong unused QEMU_ALIGNED(16);
+    struct target_fpstate fpstate;
 };
 #define TARGET_RT_SIGFRAME_FXSAVE_OFFSET (                                 \
     offsetof(struct rt_sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
-- 
2.40.1


