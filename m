Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E84F97EA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:22:29 +0200 (CEST)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpVM-0000fd-9L
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPB-0006jy-6g
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP7-0002Ex-B1
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so4106526wmn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kl+2ZVJ+6xTCifWmFmG6E383UT0qNH2bxah0KF3V4pw=;
 b=UvuViJ6HrsF9PkyUGVohQvmwYPOmZ6yWSgOSwjfO5ZxJhLcow/WOYHKqd5temBg4Yf
 AXupkhUY8utXvMbGEOqhO277Mj/8S4Y1UdZRKwXha2+TV9O/61g0vIVFmae+c3O+kkkD
 ztcgNe5xXhCIk7tR7sCdFl4hboYdu1Eae/+p1H+x2SePT1QlYXcV6Uo+HVA63hREaBLk
 AMyx6MZ3UyMJmKbfGkUwTl+4ZYQ60qqX/nQPrcNHZgTpxt8b6PcUIauSMSm3yZAhpwtU
 42k3LrW3WjJTjJACgnTfhsbd+VxNxG3rxde54Mx5Ng5Q0ocvTVU10+mcCamMMHvjEXKv
 h6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kl+2ZVJ+6xTCifWmFmG6E383UT0qNH2bxah0KF3V4pw=;
 b=o2T/dmaAIlSfhLj5Eq6ckiz90TwgvhGy4TVlcftrcKnhqegyTocbB3J2wLHc0OkoKD
 Qlu7ace2BzTEFA3nEFd/rowamtI2gW/oohyXcypSv/lh5lng6vhtzpqLQ7uqGZJN1cOV
 Ihz8FZZCEI4wXutIALBR9dwSXAMjt5BlikLpr4cgapcoA/YLK+PEIKrK4qVLBF7O3sOO
 GrN0ZOLGAiRTgrrTRZx2VOcs+1KxJZza00VWZWk+DCftVWh6yGD+iVLSZPnHWzqoX/PI
 HHdeQ8OX0nJi7RzGw5tDwzwjr0k4Hk9kIZTFCi0vC+zBJucJPMLj6iAIvQDPz5c/vZ5m
 7RRw==
X-Gm-Message-State: AOAM530YNbDJbfUTJDjtwfa1Z9z9U+aGrq6S78wgxDflP0V48ZSrD+mI
 JQ3Jfqz8cStrjrezPN0TDBbW1wYxJlMzSQ==
X-Google-Smtp-Source: ABdhPJx7TCjrXxA0CBoyrPxFESCwrXc5tx3JdTd1y/Csoqu4sdC4jwqa8Y5qkhvUKY3AjUgXecHzww==
X-Received: by 2002:a05:600c:3b99:b0:38e:aa31:a864 with SMTP id
 n25-20020a05600c3b9900b0038eaa31a864mr1661901wms.108.1649427359902; 
 Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/41] hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI
 ID?"
Date: Fri,  8 Apr 2022 15:15:15 +0100
Message-Id: <20220408141550.1271295-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In process_mapti() we check interrupt IDs to see whether they are
in the valid LPI range. Factor this out into its own utility
function, as we're going to want it elsewhere too for GICv4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f8467b61ec5..400cdf83794 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
     CMD_CONTINUE = 1,
 } ItsCmdResult;
 
+static inline bool intid_in_lpi_range(uint32_t id)
+{
+    return id >= GICV3_LPI_INTID_START &&
+        id < (1ULL << (GICD_TYPER_IDBITS + 1));
+}
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -410,7 +416,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t num_intids;
     uint16_t icid = 0;
     DTEntry dte;
     ITEntry ite;
@@ -438,7 +443,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_STALL;
     }
     num_eventids = 1ULL << (dte.size + 1);
-    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -460,7 +464,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_CONTINUE;
     }
 
-    if (pIntid < GICV3_LPI_INTID_START || pIntid >= num_intids) {
+    if (!intid_in_lpi_range(pIntid)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid interrupt ID 0x%x\n", __func__, pIntid);
         return CMD_CONTINUE;
-- 
2.25.1


