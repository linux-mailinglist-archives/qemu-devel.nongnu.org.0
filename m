Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BE48B3AE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:21:43 +0100 (CET)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Kq5-0007bk-CQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:21:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfg-0005Ah-DJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:57 -0500
Received: from [2a00:1450:4864:20::329] (port=52151
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfe-0007HX-30
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id e5so11561076wmq.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHSwNCH5vyw/b88YEepKg5paQSwMAnG4i0aTBoYVuiw=;
 b=ZTvx+Hz7MBeBL22NrZgMLVo//79SaBUYmYIgtrMR2m9UHU9/QoyB2O64wyjw0UKSIg
 vK+2bEOoi5LKg6n0PrVNucArdssVVmWfZgHU4Zb0TVd7WM6U7q7iEmAjqoIXpmJJIr/5
 7KOTlCo7iw+pwYM7MgGa3oz0f5KDOytZu9l91LIm6VNWTTFyzMVAHJ4McfVY0+Pmbh56
 cnvF8ZSUYXhfO/ZJD3eCw4tgyynJxUORNkAE4sOxTSH0LjAj6GR4ic+z1mUrhhRSe5nH
 JDHcg19K4UKhK1Xoe+FJtPpeguoDIYTxYbuLP2Jdi0rwFveWeVelooIk7Hps9bqZGwj2
 aPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHSwNCH5vyw/b88YEepKg5paQSwMAnG4i0aTBoYVuiw=;
 b=HPNuJwaRnDoKpFpbY7hBUU/BtkNyWmqKizX6JwUTHNj6jGWS3ch9UGql7CLYZKrOvH
 hI17M7VfBJRQQPdaLd40PqtPm/ZHvvTABoONoM9MPJ/cDRvVcRsvKio5wKfXZXGE2zZL
 mV13yy6e9bWwlaM6PQTj9UKkTticgTfJ6p8iY+t3jWzbKmPbfOTAO8GKAYjC5XaiSPYI
 WCbP3tO6KWrijrDXnLwNU0yJbyRsaBlZOb7S3pYREU2Eyh6prxFHTdCTtyKS3MKf/cTv
 fa67eDrdVaBhY0vNQ4Vmlv7O7vBPHEFLRoq5i/FcGQvTEC0Ig8XksaFHVgkUttqjAaOL
 S6dQ==
X-Gm-Message-State: AOAM533eghEU72ShKW9XweTRliICVoAZqH4ph/FKQOvHDwCpw419t14+
 4IiD+LIWRzlCc0uSgmQ9oRb1Ng==
X-Google-Smtp-Source: ABdhPJw5qVogQuV2jfl44pTTyWdbG8j5iw5wsCvNEMk6lgEECGetxx6byLLluFpVWtvh92+0sOOf8g==
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr3292021wmg.121.1641921052374; 
 Tue, 11 Jan 2022 09:10:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Date: Tue, 11 Jan 2022 17:10:37 +0000
Message-Id: <20220111171048.3545974-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

The bounds check on the number of interrupt IDs is correct, but
doesn't match our convention; change the variable name, initialize it
to the 2^n value rather than (2^n)-1, and use >= instead of > in the
comparison.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d11fa02040..5919b1a3b7f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t max_Intid;
+    uint32_t num_intids;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -379,11 +379,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
+    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-- 
2.25.1


