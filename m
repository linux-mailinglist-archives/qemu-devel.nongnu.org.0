Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE4448B49A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:53:01 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LKO-0002c4-M0
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfq-0005D8-4a
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:11 -0500
Received: from [2a00:1450:4864:20::431] (port=46927
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0007L0-FQ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so23366634wrb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpU33ZVGPAyCC9DTXzdZDHcDLe8eur6K3oHNtIfAuUs=;
 b=szDT6OJxANgIElJmFK6SuaPQKe0pFaJNPg6rQJcpyRqt4rkVYc8gi/9uevnCpm6/Jv
 pFMVFbnE4JMdXffnwMk7kF2OPsQPM+ChH+wEhiz4f296p9kOpA1n3sDIv7p65aK4Mn4E
 AyqXkD1Ugij3w4/DBOiBo8jocTT578lM/9PqB6sjMfLbNhDhV4VyNUN68psUoEl/TOl2
 BoKl3408EHGcd4xdnrGViO0R8h8/7/nHzi2l0ifYAV3rCP1kaOltRKEwOPLzc6KNNc1M
 ZdNiOOqAqQT97Z/SIYsFnZ5ugpTNDgx/az//LOzhOvyT5aKjqQLZR9CKqWZD+tWdhfrH
 QdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpU33ZVGPAyCC9DTXzdZDHcDLe8eur6K3oHNtIfAuUs=;
 b=0wQVjsYCwzwqdw7FAi9pELS/VXAI3opsm6H9Yuqtz4/S0s2KCLSw4BnFf32G86X07f
 e5SJrehs5CBxiFGf9ZElihVlSa6JpLkaa3i6LumjNUyMihHWkmOLWwE8IhyZqxkCqu65
 nSFrWFYy+qqgwv5K7MPwthhtsrrMn976DyaUKo+8YHvXxCgkmQdVaeSkkUTHHGEAM9qw
 aBbHhUM/9XT1SjNfFaMyJ9g8FTM1jh+5fka2vpshEmM9pC8lLmFz1YExiWW26W8FURso
 28Dx85PoTDVIWK24EmH1vHjLHg9YGy1AndZPNtO4pyy3UDVlqOa4E0nwhc2v1DwDUQ73
 PwIw==
X-Gm-Message-State: AOAM530d5ARXt1XIXZna6Jpd9xbmIc82sg4WstQxuug339tJG1aNQZSr
 CulnlVGQoyECaTZyJCQkAnwZTn/dSkx8pg==
X-Google-Smtp-Source: ABdhPJztl3iR9W5DfAB4WXN8g0TqV8VKRn2H0FGsK8nBXHXm3jg+Lt0RNUNtM+1tF9xQdAQxGiObKw==
X-Received: by 2002:adf:f390:: with SMTP id m16mr4659738wro.651.1641921059252; 
 Tue, 11 Jan 2022 09:10:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before use,
 not after
Date: Tue, 11 Jan 2022 17:10:47 +0000
Message-Id: <20220111171048.3545974-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In a few places in the ITS command handling functions, we were
doing the range-check of an event ID or device ID only after using
it as a table index; move the checks to before the uses.

This misordering wouldn't have very bad effects because the
tables are in guest memory anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 42 ++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 985e316eda9..ef6c0f55ff9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -255,6 +255,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     eventid = (value & EVENTID_MASK);
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -272,6 +279,14 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
     ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
@@ -296,20 +311,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
-    if (devid >= s->dt.num_ids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
-        return CMD_CONTINUE;
-    }
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
     /*
      * Current implementation only supports rdbase == procnum
      * Hence rdbase physical address is ignored
@@ -375,6 +376,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
 
     icid = value & ICID_MASK;
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -384,14 +392,14 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
+    if ((icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-                      "devid %d or icid %d or eventid %d or pIntid %d or"
-                      "unmapped dte %d\n", __func__, devid, icid, eventid,
+                      "icid %d or eventid %d or pIntid %d or"
+                      "unmapped dte %d\n", __func__, icid, eventid,
                       pIntid, dte_valid);
         /*
          * in this implementation, in case of error
-- 
2.25.1


