Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A34715A3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:23:10 +0100 (CET)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7xY-0004O8-Io
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050i-TC
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:58 -0500
Received: from [2a00:1450:4864:20::332] (port=54237
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mi-0006G4-4Z
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id y196so9162188wmc.3
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73xR2Mq0ouF8QlBPepTZ6f4sM3isCU/HqwwjiWFia2k=;
 b=suenabLVdPNySF14MKiYlG9tyeo/aKiBXQh4rRjIh9E5yB9EI8gTV2kVeuetlKdzSR
 Rr9sLo40wbt+5D4PO+6yUz+jtHb+ZCktawFFaSDiDUW/gnBTUadNe/lFEKqrWmNqy5tF
 sMMpSD5oyrayAjhZaVXYl2r+FWFvspKoNIPKmCn6QhNLIwFxFm6k1U1epahTw3+YTHX6
 SpGNVoRyIRrSzd22yuLySzJAoG8ofuZAVS0AgZKeOhsWQb4vYUgkwszcpJ639xzR/vRv
 LQxb3o4dmkT4FCEZs3y1xQ9oRORiiv+6jYZsjMetjKzGL9xv3WBhRN3VshLRp7BNMYPJ
 iknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73xR2Mq0ouF8QlBPepTZ6f4sM3isCU/HqwwjiWFia2k=;
 b=HKd3469ZWiylEQyn0Z9lZNfPYA/8CYZjJUwwEBrnwzagfraAWwEe/lTk54S9z7QrvI
 rgvxV9SSXXDkh1AIF30/4i1I3ib/VftDdZgSAjUq+G3LubXcwuGqIhSzj0RC1VIXiHmM
 2nl7/acjuohpUqba2meHTMtOcco/fGQz1qSiUYgEpctEAMaoXrSxBJLmqp1DX16shvLK
 hZa3VLief5h9eghC9LxRSwYgU+g6QsJ1bNo/xdlKQipa+eCdLUX8Bqbg2D01XYRuc/3V
 Ulxw2iN3EveRn8VT2FI1dEl3BO6el935XF7ubknc87FS//4V3mqvJyhBwrPHCma4NcRB
 pV9w==
X-Gm-Message-State: AOAM532NT8s85hikyIhI8b96S6Yjdf2+W3+ezb4iAKUw7Lp24atsSCvJ
 vK9PCmZ2KkKXr4n7JpNM+rw/Qp+K4lj9dg==
X-Google-Smtp-Source: ABdhPJzOVnlWH2U55UDj0xbUF3xNLIvldIgRqlJCfjNA+/DbA8h1/Djtr9yMidWdDEpo/q1AEOy7ag==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr25057905wmq.155.1639249910713; 
 Sat, 11 Dec 2021 11:11:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/26] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Date: Sat, 11 Dec 2021 19:11:26 +0000
Message-Id: <20211211191135.1764649-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
---
 hw/intc/arm_gicv3_its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8561392fdbe..e6b380f663c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -336,7 +336,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t num_eventids, max_Intid;
+    uint32_t num_eventids, num_intids;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -377,11 +377,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
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


