Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06A53AD45
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 21:43:50 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwUFx-0003cl-S2
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 15:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nwSxY-0001gY-9l
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:20:44 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:47680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nwSxM-0007Wv-OC
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:20:42 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2A66011EEB5;
 Wed,  1 Jun 2022 18:20:31 +0000 (UTC)
From: ~xiangyi <xiangyi@git.sr.ht>
Date: Thu, 02 Jun 2022 01:12:39 +0800
Subject: [PATCH qemu] target/i386: Fix x86_cpu_get_supported_cpuid parameter
 error in cpu_x86_cpuid
Message-ID: <165410763105.21939.3771560937457811643-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Jun 2022 15:40:17 -0400
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
Reply-To: ~xiangyi <xymeng16@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiangyi Meng <xymeng16@gmail.com>

count should be the second parameter of x86_cpu_get_supported_cpuid.
If not, when guest is querying 0x12H related CPUID leafs, any of the
four registers will possibly be zero, incurring some strange behaviors, like,
virtual SGX is enabled by the user but the guest OS reports SGX1 instruction
is not supported, etc.

Signed-off-by: Xiangyi Meng <xymeng16@gmail.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index bb6a5dd498..9fdfec9d8b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5559,7 +5559,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, ui=
nt32_t count,
          * supports.  Features can be further restricted by userspace, but n=
ot
          * made more permissive.
          */
-        x86_cpu_get_supported_cpuid(0x12, index, eax, ebx, ecx, edx);
+        x86_cpu_get_supported_cpuid(0x12, count, eax, ebx, ecx, edx);
=20
         if (count =3D=3D 0) {
             *eax &=3D env->features[FEAT_SGX_12_0_EAX];
--=20
2.34.2

