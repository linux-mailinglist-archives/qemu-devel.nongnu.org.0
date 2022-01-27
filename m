Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D874C49E904
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:29:45 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8ae-0007IY-Vg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zV-0006vF-Ta
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:17 -0500
Received: from [2a00:1450:4864:20::435] (port=37845
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008On-Us
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id w11so5581168wra.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EKftSqPbTE2cj73sSgFhaPxNMghmo4WdRClxKMHw6I=;
 b=R8Kd09Avc8C/f1GhlVyDLp/WK5GWmU076hO7f/3B6cOBvVZvhRrCneKAR6g2zYuGvS
 hlkr5kz/maqF5hKngaL+e+CRbPlZqwRXXTHp47YeEIJiIT1icbzp3g/fQ2YUu+D7LRxr
 rFlZ9bG2FO1mFBB5v+8SmG3pXbyb/TOwaPtCw7uZyC5/SqoPzKaPOINNvvdMyXJ/94OA
 FRVN3vDbWrEPZXm25dAzUFCe40vI/fEBAvbqOX1dmmDKfZOiO5ph3Q14Vu9bPqTlm7K8
 xIUehGthUDR7eJkfwAeTG8Fc9gz9+Tww0FlhSCiUgq5ET957njMHZdGWY7DhXMm9lO9S
 Unjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EKftSqPbTE2cj73sSgFhaPxNMghmo4WdRClxKMHw6I=;
 b=1egFb713iCy5OXQTDh4mQhaYIfrwMhH7s7WPcRhnm3RY3OLcNdj8XX0Orzn0Wh5PQB
 MZYT3vc2Lirvb4eNdyVd6xDVn5UY/0U85/0KKO28szQJcbGhlxMW7hlkExCenSisNyML
 pwNQzWfYW0pRuadRUUNfzrDidDGc/Tkmo/JnynLO3sSig2x/s2LuT9zCEoKjurSvl3Lc
 oXQnpq9UbNW756snFY/XwUiPhVvYoHdyuj1Kt8kt6IIySqEDE2UDuSFKh/9ILkyGtzmu
 b/enY6HxT0X2adeGogP6K7wa+tTL6q8GqoM2pbnFgo4NPeCcPu3QubNzrr36nnk3jshi
 cUtQ==
X-Gm-Message-State: AOAM530PPuIpKWWYwC3gb+sBd4c2Obc6JQ26AjMHSbqfpkrVLVFmeO1S
 9+9GBMaeae7Pzt0bdN6n/9OvMg==
X-Google-Smtp-Source: ABdhPJyJ0vDMQpM7k1jCNlNJSXlIBKZe/bE12lz7XpfvaQAA8V6L4dJPtZl1C/1L/CHCgTGmMHZTgQ==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr3525373wro.7.1643298426087;
 Thu, 27 Jan 2022 07:47:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/16] hw/arm/boot: Prevent setting both psci_conduit and
 secure_board_setup
Date: Thu, 27 Jan 2022 15:46:35 +0000
Message-Id: <20220127154639.2090164-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have dealt with the one special case (highbank) that needed
to set both psci_conduit and secure_board_setup, we don't need to
allow that combination any more. It doesn't make sense in general,
so use an assertion to ensure we don't add new boards that do it
by accident without thinking through the consequences.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 327e449f831..0424c178305 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1339,6 +1339,16 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      * supported exception level or in a lower one.
      */
 
+    /*
+     * If PSCI is enabled, then SMC calls all go to the PSCI handler and
+     * are never emulated to trap into guest code. It therefore does not
+     * make sense for the board to have a setup code fragment that runs
+     * in Secure, because this will probably need to itself issue an SMC of some
+     * kind as part of its operation.
+     */
+    assert(info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED ||
+           !info->secure_board_setup);
+
     /* Boot into highest supported EL ... */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         boot_el = 3;
-- 
2.25.1


