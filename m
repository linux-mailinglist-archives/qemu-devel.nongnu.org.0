Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A882D4715C7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:45:31 +0100 (CET)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8J9-0001Gm-NA
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:45:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050j-Tz
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:58 -0500
Received: from [2a00:1450:4864:20::434] (port=34745
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mc-0006EE-Vz
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id j3so20403901wrp.1
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBlXpUi7Hc739T7tIMt8EUkZsoHbYKvygpVzCX6VAv0=;
 b=oQg/6RudXIkBQ3sX/9WqZX9vpDw8N98BBqqt1Z9z74BWHN7QfbI2n+uv/T6I8rgnWz
 AjfJALJt3h3uZBJS4Sed090WPqQHpXkk+EUE4iCY2GlJN6TeH14iPFl7hhsL1PEq/pDu
 lBnz0NvvROBe7hj4WzvCfSoyEnxaRMCd/7ZavJyfkQdITV3Nw60Kkfi/4rbAa5f0QSYu
 O3klkX4hisf9vFTgSoyFmvbt9I3zaKTbVdOyKMWjArxjQkoCTJTjq1ovd9J3aldmK+12
 s489apBy4mJ0KaMCcPCyo04HiK9nymGggEPH1vAeJFf5GMLUFWGc019UAEEaMejcrOFK
 Ik8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBlXpUi7Hc739T7tIMt8EUkZsoHbYKvygpVzCX6VAv0=;
 b=AY/KmqZxNnjmgenmVcVpBeGXUod+Fi5bX6Lv+oR3c1no0/Tv0ebYWLDydMAbnG8sBs
 a/vqPd0XhBnF6dFmKB6Vq26KCGDKI+jI+t+pHaXxr0eBuHC8sBNhy17z4rJ1Kk/9wisY
 N2Dty5L/PxZyqWKAYvVUaDOHW6Za3TPAm9bOFjqTlOru3hovqty/ELdPdRnZP+Gv5oam
 6vzR0wRa8UOKXWZggWAAA0ZZ+sX5ySDpIk1r0bjggBUSnOg6lAWvKGTOxIBlrlUIoqyd
 hUnMgSadCif1IHOD76zkrVLE187KqDXyc7J5qW2hmy9rWE3+1cWHou+XMC8AIJbYk60t
 2Phw==
X-Gm-Message-State: AOAM5339WEGeX71gdcJRtFiqTrGOl6JpviH1vAPEk/hY4mIFcJYplAdt
 QbmUG8rkT29ifVsb/8GjyKZ02w==
X-Google-Smtp-Source: ABdhPJxXPgI2LcrJ6Cp1pu3sluqPy14/n4S5lQw7TW0+SNX1/5LB3PvDm7Hs5eSXxbVpV4L79CAAiQ==
X-Received: by 2002:a05:6000:120a:: with SMTP id
 e10mr21795346wrx.156.1639249905650; 
 Sat, 11 Dec 2021 11:11:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
Date: Sat, 11 Dec 2021 19:11:18 +0000
Message-Id: <20211211191135.1764649-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
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

The MAPI command takes arguments DeviceID, EventID, ICID, and is
defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
(That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
as the pINTID.)

We didn't quite get this right.  In particular the error checks for
MAPI include "EventID does not specify a valid LPI identifier", which
is the same as MAPTI's error check for the pINTID field.  QEMU's code
skips the pINTID error check entirely in the MAPI case.

We can fix this bug and in the process simplify the code by switching
to the obvious implementation of setting pIntid = eventid early
if ignore_pInt is true.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 15eb72a0a15..6f21c56fba2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -354,7 +354,9 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     eventid = (value & EVENTID_MASK);
 
-    if (!ignore_pInt) {
+    if (ignore_pInt) {
+        pIntid = eventid;
+    } else {
         pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
     }
 
@@ -377,14 +379,12 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
 
-    if (!ignore_pInt) {
-        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
-    }
+    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
             || !dte_valid || (eventid > max_eventid) ||
-            (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
-            (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+             (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "devid %d or icid %d or eventid %d or pIntid %d or"
@@ -400,11 +400,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         IteEntry ite = {};
         ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        if (ignore_pInt) {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, eventid);
-        } else {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        }
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-- 
2.25.1


