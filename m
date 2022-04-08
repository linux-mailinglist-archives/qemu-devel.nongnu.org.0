Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E241C4F97FA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:26:01 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpYm-0007q1-SS
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPE-0006tL-I7
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPB-0002Gs-JM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id k23so13058702wrd.8
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JOex7zXlNRw0uzuroIWAH3oSHzCyU5BsmZyuU+iBsAg=;
 b=Z5xyUyJtVHYr9slW6m5SYyXHiJXuuJ75Gqwz4Y24DRViQ8IrkcFmponXZVr34+OPDV
 I53o/9vqqxp+TRsFWBTJ5wQIOJ4eHdZIZy/PPldaoS6PfzM9QfzwYZdUr6+H9kt0v7Qr
 p0mniG4q3pQ1as/bJD6LaySREhYsUWxq/PLaU0BVX8OEQ5O0qwVdqETYTZsWcxKH9Uk4
 dNaP9oYuDyEb5OqP7tBS3nNphBZxqFO82WJao+2olauMfTGEvPaoLzmXJqaiPjB/80cp
 ZCsZV8iOhDJtUgfWw78p4gBwJHISqK4fAe0ZjX/YRASYFlvG+hpRFmYEUeB8EyYyElY7
 Uw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOex7zXlNRw0uzuroIWAH3oSHzCyU5BsmZyuU+iBsAg=;
 b=sPAkho2Kfht2pK2VcdEce2Fqp/uH5S4ozzM87O1ppLSsCCrUXJaJWW6DzA60X0snk0
 GtR76eFFH81u3WZxZBRA+ZWriiIQNsUzHjj3TNAiKxWx3+xfINSJ8Es88BcVeQORxmRF
 EeRQ0wx3MTZgH9SwYr+AG70m8BaxPsrsPc4eJNOzj1KdK0GBeit2EmHHrxWFwHFejbQZ
 ZdY5kYKUEg0FFpl1NOFhvmVyistxexld+xUyf1g7gSAtXYoW7im6I7qp0422hugGyLhA
 2l04lnmdGyfm4bUQwp7OroXmHCjP7LMkz4H2MwqXuAU+hn4wCLmQeARWdMejheZJcs6w
 bmbg==
X-Gm-Message-State: AOAM531DJTteLXwIJtyJNJIr2fMrY0xADmsORqI1XcBkcAEeMpNnYoTI
 o6/dqdUbiPaoKOZefXldDoqeZkNPXWZdvQ==
X-Google-Smtp-Source: ABdhPJzBG/vDe/uLUoyQHgmCNpmwPyS4FE6kBOdijircEh0JqqbHa/6QDt5QdhZVzH/OqrWaywvOmQ==
X-Received: by 2002:a05:6000:1866:b0:204:cce:c89e with SMTP id
 d6-20020a056000186600b002040ccec89emr16011389wri.601.1649427364248; 
 Fri, 08 Apr 2022 07:16:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/41] hw/intc/arm_gicv3_its: Factor out "find ITE given devid,
 eventid"
Date: Fri,  8 Apr 2022 15:15:20 +0100
Message-Id: <20220408141550.1271295-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The operation of finding an interrupt table entry given a (DeviceID,
EventID) pair is necessary in multiple different ITS commands.  The
process requires first using the DeviceID as an index into the device
table to find the DTE, and then useng the EventID as an index into
the interrupt table specified by that DTE to find the ITE.  We also
need to handle all the possible error cases: indexes out of range,
table memory not readable, table entries not valid.

Factor this out into a separate lookup_ite() function which we
can then call from the places where we were previously open-coding
this sequence. We'll also need this for some of the new GICv4.0
commands.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 124 +++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 60 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ba1893c072b..fe1bea2dd81 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -314,6 +314,60 @@ out:
     return res;
 }
 
+/*
+ * Given a (DeviceID, EventID), look up the corresponding ITE, including
+ * checking for the various invalid-value cases. If we find a valid ITE,
+ * fill in @ite and @dte and return CMD_CONTINUE_OK. Otherwise return
+ * CMD_STALL or CMD_CONTINUE as appropriate (and the contents of @ite
+ * should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_ite(GICv3ITSState *s, const char *who,
+                               uint32_t devid, uint32_t eventid, ITEntry *ite,
+                               DTEntry *dte)
+{
+    uint64_t num_eventids;
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      who, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (get_dte(s, devid, dte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!dte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte for %d\n", who, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (dte->size + 1);
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n", who, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    if (get_ite(s, eventid, dte, ite) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n", who);
+        return CMD_CONTINUE;
+    }
+
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -325,42 +379,17 @@ out:
 static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
-    uint64_t num_eventids;
     DTEntry dte;
     CTEntry cte;
     ITEntry ite;
+    ItsCmdResult cmdres;
 
-    if (devid >= s->dt.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_entries);
-        return CMD_CONTINUE;
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
-    if (get_dte(s, devid, &dte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!dte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid dte for %d\n", __func__, devid);
-        return CMD_CONTINUE;
-    }
-
-    num_eventids = 1ULL << (dte.size + 1);
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
-    if (get_ite(s, eventid, &dte, &ite) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    if (!ite.valid || ite.inttype != ITE_INTTYPE_PHYSICAL) {
+    if (ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
@@ -740,10 +769,10 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
     uint16_t new_icid;
-    uint64_t num_eventids;
     DTEntry dte;
     CTEntry old_cte, new_cte;
     ITEntry old_ite;
+    ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -751,37 +780,12 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     trace_gicv3_its_cmd_movi(devid, eventid, new_icid);
 
-    if (devid >= s->dt.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_entries);
-        return CMD_CONTINUE;
-    }
-    if (get_dte(s, devid, &dte) != MEMTX_OK) {
-        return CMD_STALL;
+    cmdres = lookup_ite(s, __func__, devid, eventid, &old_ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
-    if (!dte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid dte for %d\n", __func__, devid);
-        return CMD_CONTINUE;
-    }
-
-    num_eventids = 1ULL << (dte.size + 1);
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
-    if (get_ite(s, eventid, &dte, &old_ite) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    if (!old_ite.valid || old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
+    if (old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
-- 
2.25.1


