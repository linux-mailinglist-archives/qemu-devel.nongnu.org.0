Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47C475763
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:09:25 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSA0-0006Gx-6w
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0006gQ-W3
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: from [2a00:1450:4864:20::42a] (port=42980
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiQ-0008PK-7G
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c4so37352578wrd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3N0iy2J8eRGNFowJGqdNyiNWKQh5DXE+loi7lECLI40=;
 b=UmvqEaKdyDTg0wll9UQi/LVi7KAST4Moggwh9aWhCv+voIiSF/CvHEfI42KmLj097t
 qCXdguAYaLUKbgICfggLj/zknN6HJsS3AF1O11xLpbBtM+C/csnf9ElqJDsCtwSsdk+G
 JitLznrjtIbXwY9MDXTm7SD1sCayBRMNJlZzOkbhheIsoGH04YjtsD+s9nJqk9G2n8Wn
 LTQY5BkyrOzipQy2ng8NliqpRvbOBQIawPTHiakKg4alm8qVYnHt+wgKrG6K39YVVy3u
 OhlXOH5dM1xK6KIGx1ENrbgZ3KyUVqjnKHAR0oJBGC5cqHj3N+c7TRGoM5Cxhbix6FlS
 os5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3N0iy2J8eRGNFowJGqdNyiNWKQh5DXE+loi7lECLI40=;
 b=v8k1N89ieJj5KQ/S/XAl2gJGSFI2qaKJysN/pyo0R//H6327EIOKJRVy7WRURExLkP
 HLcVnOGnXFvFgc/mjG+UOJvdwdDGiQF4x0Hzo0mQlK70Xp893xPWWzM6Pqr8PWebVBuW
 ccA48KA7vwEnAnyDtDd3/F+zttbbx1i8ewv6ECkgLhekjmMeoE6OH2He0I//QXBNfGXH
 /kU3JHbobqrgpvhyAJnaNX4sbJJ+00HugjYmDXFnHk9aycqgfx7YveNyi9mFHgu5SE5u
 U+q6w52tXgAGzfJRsGWMA2/fVgO/EcnZgspBhXXXRqgOFp4lhzVctuYhYUhDT6TKwSF5
 W98Q==
X-Gm-Message-State: AOAM532i2qUrVvO0MOuOZOGJ7EmYIyLzLgl4M7zpCalRLFoJ6N4TCjUT
 X8A247FkjOUcpsqeIRtU/cn9hWNvBINy8A==
X-Google-Smtp-Source: ABdhPJwZYqNABKm4Y26lBzj0ZDUNfk2JjRrJp7iBnOqhKvy3/Ln14Kd3n47yEjLZxW/5y1nostPC5g==
X-Received: by 2002:a5d:434f:: with SMTP id u15mr3999447wrr.492.1639564851839; 
 Wed, 15 Dec 2021 02:40:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] hw/intc: clean-up error reporting for failed ITS cmd
Date: Wed, 15 Dec 2021 10:40:17 +0000
Message-Id: <20211215104049.2030475-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

While trying to debug a GIC ITS failure I saw some guest errors that
had poor formatting as well as leaving me confused as to what failed.
As most of the checks aren't possible without a valid dte split that
check apart and then check the other conditions in steps. This avoids
us relying on undefined data.

I still get a failure with the current kvm-unit-tests but at least I
know (partially) why now:

  Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
  PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
  ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
  INT dev_id=2 event_id=20
  process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
  PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
  SUMMARY: 6 tests, 1 unexpected failures

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211112170454.3158925-1-alex.bennee@linaro.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c929a9cb5c3..b99e63d58f7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -274,21 +274,36 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (res != MEMTX_OK) {
             return result;
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
+                      __func__, dte, devid, res);
+        return result;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
-            !cte_valid || (eventid > max_eventid)) {
+
+    /*
+     * In this implementation, in case of guest errors we ignore the
+     * command and move onto the next command in the queue.
+     */
+    if (devid > s->dt.maxids.max_devids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "devid %d or eventid %d or invalid dte %d or"
-                      "invalid cte %d or invalid ite %d\n",
-                      __func__, devid, eventid, dte_valid, cte_valid,
-                      ite_valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid command attributes: devid %d>%d",
+                      __func__, devid, s->dt.maxids.max_devids);
+
+    } else if (!dte_valid || !ite_valid || !cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "dte: %s, ite: %s, cte: %s\n",
+                      __func__,
+                      dte_valid ? "valid" : "invalid",
+                      ite_valid ? "valid" : "invalid",
+                      cte_valid ? "valid" : "invalid");
+    } else if (eventid > max_eventid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d > %d\n",
+                      __func__, eventid, max_eventid);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
-- 
2.25.1


