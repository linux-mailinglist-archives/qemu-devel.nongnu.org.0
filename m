Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE8496D79
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:58:41 +0100 (CET)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLay-000697-Np
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4z-0005n9-Al
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:37 -0500
Received: from [2a00:1450:4864:20::42f] (port=42928
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007h2-O5
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:36 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a13so5907545wrh.9
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lp1oJ9HFOvv8JUdUv/7QWvh4BnxCy5Ok7f/8j3T6Vxg=;
 b=Eu37rzdVMdIcpRW57Yo+pjUs+MZ7R8s8kyVcjaG14s8mW8ihQRHuMgbYAOgaEA+LIG
 olYmx6aS6TH2amumu3AlOhpD1qPK5Y2oJGfojKQiEle1v1CZcJbqUlh4iC3o1rQ8cMhi
 5BdYlJhdH2m1RoqPMHbooiMZi7cbWsnyXAsXJ3u5yZ5owzD/nTQeXgkpc5HeMqzcwo56
 hqv1PS4ulbuDfYpPOhbFt52k2z7K+jpad2JNpqf7KdPtqUPwNUd6Hb5r4pDBn3irC/9w
 wl6D08Dq2YkRyH/Xb4eSGAxUjw8UB66bIqimgok0fwLs5WeDEudGPkxOMWCIPAqNAJN4
 kZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lp1oJ9HFOvv8JUdUv/7QWvh4BnxCy5Ok7f/8j3T6Vxg=;
 b=dkP4N0mfnlNlABLxQtixEZBMxNl3FXgJMc8ALRDa1zhjyWgv31EWwZj+IDztfoGOrL
 tNcUmYHaYJU7of6oXupsJdsBdyBN02HKqwKfpE7+iQK5wwyey9oe2WS0Va+fYVimfAPG
 M2zZqsZlw/k7l46JzIzbR+e+umdL2VGmGbS2PvYlNj61tmgHIJ+isOFz5CouwdTnzUZ5
 igBRC6yvDjrbDWh6YmStgoRvn6XnfRmIEEG7Bf7PTNYT6N21kqiBOJJC1pz2OoWzoO84
 l4sx8b6MTOwd00pfBippRrdKjgMcvv6rfBF2btx6ekYzI9knXr5VYY8VHsiYbxqtJqaQ
 n4Qg==
X-Gm-Message-State: AOAM530SHu1cTuvCFSiUIBO804FzxXK4u5Q4uNazWAIGPu8ThbMjFA9+
 Cm+Q+bJiFsvvrwSXPTjf+CFzKFgI3Z+rJg==
X-Google-Smtp-Source: ABdhPJymlfT3enirToNyVsbxWsTQoWh3gHnSbQWHXzQwRUihGy7WZ4waWDF8Lr4sPxVwnU6ZW8WKZQ==
X-Received: by 2002:a05:6000:16c9:: with SMTP id
 h9mr8452070wrf.508.1642875891902; 
 Sat, 22 Jan 2022 10:24:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/14] hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
Date: Sat, 22 Jan 2022 18:24:38 +0000
Message-Id: <20220122182444.724087-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


