Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE148B45F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:49:16 +0100 (CET)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LGl-0005Jt-Mc
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfn-0005D5-NM
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:08 -0500
Received: from [2a00:1450:4864:20::432] (port=34634
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0007KB-9z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id h10so24085531wrb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+19OihughmoJEL8u1lX7s3OdjR7r5E5GvgmNdTNC5k=;
 b=NcnspWi5FCgsfZ0IvLq/25en3LBApDx+u0lRl8aY8aUxyLL+QdyZKubivzOt5frFUq
 Uk+lrymARDw+sCAmIahgrzWmptzHJoMfwdbLdRYtLdmfDoh3enkZgrQM5+SGIeyXxtq1
 P8+lhwepXlXno9Ku6d3+WN1u1AJE7ZxU198Ug047AdyUEaKxg6cSJo1arC7MtGLbkBbz
 4SrapmHJxM3YY2ex1ck34Egxjxfaoz+mGvvsxG0DyZ2QagP/m/NZkoXFAVLnEc40gMI8
 +GSr4IZSa7SoHnJMa9XS6d0VjOCCnlGO17bzH5oE6u59IjyzRjT1F9ve+muZZ+grWkZp
 ztrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+19OihughmoJEL8u1lX7s3OdjR7r5E5GvgmNdTNC5k=;
 b=xAUR6wGNybt6GguB4bcYHM/D4O0RfEbNoOemK6yIa26rBb/ayxg2nYNZn3NlOlTFEH
 UQS05gq20BV1nWc5I2bWeQmlgGBoGgJXjQ7P1mx7Nj3jCIQFb69ZCwIM4IKKcq0IU1wB
 ho/MfKTEGlGuYqeqxhZykgmzVw1Hm+lNK2xL9eLOWOzDsAP/ZFDLyggg7+MqwrT8WRJJ
 LLRz23o6LKhMXET3nQPlu2/8nlcal5dEigmtqc3/l7ccgW2ZX97fW5fCLbxunvzUZlTh
 dlSyxZsIhh+lKL4+v9pd/Cwu7dfAyhoYhs7FITuY62QUEvqHC4ZL4Vip3d51427/IZ4I
 YBEg==
X-Gm-Message-State: AOAM531cn808axngxTBaiepRoukqcpS7Hd66Gd2Ge/ga5fH5BKXTnduW
 ypahwPwSvSfO9A5P4QikgbNRqQ==
X-Google-Smtp-Source: ABdhPJwSI+hJ+bxdT8wCvrZjCueZwfcBpeE8qa+x5MksGyRxYKE3kD7ZYmWQhr6V+UW2TTCKUaFIqw==
X-Received: by 2002:a05:6000:15cd:: with SMTP id
 y13mr4763157wry.28.1641921057153; 
 Tue, 11 Jan 2022 09:10:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/13] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
Date: Tue, 11 Jan 2022 17:10:44 +0000
Message-Id: <20220111171048.3545974-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Fix process_mapc() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 010779a9fdc..80ef4dbcadf 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -491,7 +491,6 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -501,7 +500,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -520,11 +519,10 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
-- 
2.25.1


