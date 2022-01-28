Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5949FE34
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:38:28 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUGZ-0007tZ-GW
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDM-0002Fl-He
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: from [2a00:1450:4864:20::42a] (port=33703
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0006QY-6I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e8so11670346wrc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGXtm2CCFREumE88uavqGv2tctQ72q04jesCEJ5hOrc=;
 b=UXkE5MuOIxoS8ihBAvLOVlUGgUDilUovsl392icdr/SPZxapL3aT09oz7ch9tC6dio
 HmCEEXAX3XlC8fJ+7437fOPZcvsplUPng3Pz8xM16QeRwmaAJihJx46w5DSPIRUu1L9n
 JX9ZwQ8JQiCCgmIJG/CHHcd4JPLVLNsbM0wpkm0/ixsf6yMTZlVU+EKYkWbUW9TU+NZE
 CKH91/bjFlU98t/n/TkysEdeECkMB8p2a3vGXoxWbQeWs9kNHdPjlPWwHHk+HdaOS2e+
 RKPyqBOElLf2TlcpvTbVgpOGnAlGUUgEKfdBzCA104KhyaeMLngQgJBlV4/zV6s6KLbE
 Zhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGXtm2CCFREumE88uavqGv2tctQ72q04jesCEJ5hOrc=;
 b=zxdVEmdZURpFcIH8Wg0BHiYV9ER/X+CRIN2Xvw1OKwkqQ9V7FzTnL9RQ3Vi0jahyF4
 tDhWOnKnzHltuqjNM60VqrS0c0u7tL4ffvfR0qOezqhiPJBnpzBrtHfMtXKojdMiDYuJ
 61DVQiZpCM9aa0skg5KaHcXjQNcSnu4qaSSiJsTTFa48KcWRLw8KxdugKKJUy8WXRPXx
 D1+kP+5G4SL9cd+hWL9lpMvL25NuCGDzoh8OT3c72rmMkUMn5/LuTWvUTdoscjoaLAaS
 2MrvJtj4GjzN2MgNL9KfiYArISsmeLu7RFCoeTWFejkKUCAU13anAkt1/EL+SLsuk+F6
 D7tg==
X-Gm-Message-State: AOAM531k1KpItMho+9K0H/2i2qRUnIbnX/eE2UyO3dXYM/nBPJIon5WG
 fsi7STzCViImrbf2KPQWCvHfgMA5ieMkGw==
X-Google-Smtp-Source: ABdhPJwGxQnAjKrYB36V+Xe6CwAomThGtbtWOVzieFOL5f/a5YORRU48WzioK3fXP7hTNrHkQqehcQ==
X-Received: by 2002:adf:f006:: with SMTP id j6mr7365314wro.444.1643383837512; 
 Fri, 28 Jan 2022 07:30:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/32] hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
Date: Fri, 28 Jan 2022 15:30:01 +0000
Message-Id: <20220128153009.2467560-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The ITS-related parts of the redistributor code make some checks for
whether registers like GICR_PROPBASER and GICR_PENDBASER are zero.
There is no requirement in the specification for treating zeroes in
these address registers specially -- they contain guest physical
addresses and it is entirely valid (if unusual) for the guest to
choose to put the tables they address at guest physical address zero.
We use these values only to calculate guest addresses, and attempts
by the guest to use a bad address will be handled by the
address_space_* functions which we use to do the loads and stores.

Remove the unnecessary checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-9-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 99b11ca5eee..d81d8e5f076 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -591,8 +591,7 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
                  GICD_TYPER_IDBITS);
 
-    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
-        !cs->gicr_pendbaser) {
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
         return;
     }
 
@@ -673,9 +672,8 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
                  GICD_TYPER_IDBITS);
 
-    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
-         !cs->gicr_pendbaser || (irq > (1ULL << (idbits + 1)) - 1) ||
-         irq < GICV3_LPI_INTID_START) {
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
+        (irq > (1ULL << (idbits + 1)) - 1) || irq < GICV3_LPI_INTID_START) {
         return;
     }
 
-- 
2.25.1


