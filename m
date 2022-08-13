Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D9591A06
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 13:31:05 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMpM7-00066e-Dy
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 07:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMpIW-0004DC-9a; Sat, 13 Aug 2022 07:27:20 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMpIN-0002Kk-Nd; Sat, 13 Aug 2022 07:27:16 -0400
Date: Sat, 13 Aug 2022 11:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1660390021; x=1660649221;
 bh=Qdl3AKs8mRhBU+Ik9gzjoy7AEpjWD6DCO/69ZqSKWxI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=UMA8qiaZ3teD4qEXRXG5o5JLx3B0J3hfWsaE/kbSYYB8ya+BVpso+hcEHhkyC5sf1
 eZlY/I0s+vV1LLL0+itRItZy832Iwe7RbgUSQG72K7f4S8Ey0WE8iydgC6knd9nM8t
 ggdIxu+R+zkHAN/xEW7HiCkK5rc6L2Uof7is7ONSqIW4I4QveC1L6HAre54CerXa4p
 hSCMvdZMIQdntDn/QrXxSCy3aJF77jXYlGGFVWkf/C5jMz7/FjHLVu6jydW/38wUuY
 tbxXznrwYrFHR8dDpPXgK+BGVEktBemDKPLBEj6k6u530vvKeBpPOsTL/1p+IKgrg4
 PCNBHRicZJivQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/nvic: implement "num-prio-bits" property
Message-ID: <20220813112559.1974427-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158;
 envelope-from=anton.kochkov@proton.me; helo=mail-0201.mail-europe.com
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
Reply-To: Anton Kochkov <anton.kochkov@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cortex-M NVIC can be configured with different amount of
the maximum available priority bits. FreeRTOS has asserts
that checks if the all unavailable priority bits are unset
after writing into this register in real hardware.
To allow setting this number depending on the machine or
configuration expose priority bits as QDev property
which is by default is set to 8 as it was hardcoded in the past.
Thus, existing code doesn't require any additional changes,
and it doesn't change the default behavior of NVIC.

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1122
---
 hw/intc/armv7m_nvic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..b8959d645d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2580,6 +2580,8 @@ static const VMStateDescription vmstate_nvic =3D {
 static Property props_nvic[] =3D {
     /* Number of external IRQ lines (so excluding the 16 internal exceptio=
ns) */
     DEFINE_PROP_UINT32("num-irq", NVICState, num_irq, 64),
+    /* Number of the maximum priority bits that can be used */
+    DEFINE_PROP_UINT8("num-prio-bits", NVICState, num_prio_bits, 8),
     DEFINE_PROP_END_OF_LIST()
 };

@@ -2690,7 +2692,9 @@ static void armv7m_nvic_realize(DeviceState *dev, Err=
or **errp)
     /* include space for internal exception vectors */
     s->num_irq +=3D NVIC_FIRST_IRQ;

-    s->num_prio_bits =3D arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2=
;
+    if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
+        s->num_prio_bits =3D 2;
+    }

     /*
      * This device provides a single memory region which covers the
--
2.37.1



