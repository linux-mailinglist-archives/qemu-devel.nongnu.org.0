Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3E343013
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 23:40:19 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNkGY-0006sb-BB
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 18:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1lNkEs-00063J-Uw
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:38:34 -0400
Received: from os.inf.tu-dresden.de ([141.76.48.99]:43104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1lNkEr-00085l-58
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:38:34 -0400
Received: from erwin.inf.tu-dresden.de ([141.76.48.80]
 helo=os.inf.tu-dresden.de)
 by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim
 4.94) id 1lNkEn-0007wO-Ba; Sat, 20 Mar 2021 23:38:29 +0100
Date: Sat, 20 Mar 2021 23:38:26 +0100
From: Adam Lackorzynski <adam@l4re.org>
To: qemu-devel@nongnu.org
Subject: Arm: VFP regression
Message-ID: <YFZ5YgPWLraY5v3o@os.inf.tu-dresden.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: none client-ip=141.76.48.99; envelope-from=adam@l4re.org;
 helo=os.inf.tu-dresden.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm seeing a regression in Arm's vfp handling, giving an undefined
instruction when reading mvfr1 in PL2/armv7 although the FPU is enabled.
The following makes it work again for me, however this just looks like a
band-aid. Thanks for taking a look.

Adam

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c..37c079fab1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -120,7 +120,7 @@ static void gen_preserve_fp_state(DisasContext *s)
  */
 static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
-    if (s->fp_excp_el) {
+    if (s->fp_excp_el && !ignore_vfp_enabled) {
         /* M-profile handled this earlier, in disas_m_nocp() */
         assert (!arm_dc_feature(s, ARM_FEATURE_M));
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,



