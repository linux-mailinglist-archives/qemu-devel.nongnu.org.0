Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A49487B65
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:29:23 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t3K-0005gz-Ti
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-00055A-G1
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:50 -0500
Received: from [2a00:1450:4864:20::436] (port=42843
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw0-0007sX-Lf
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id w20so12321876wra.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wDpp9ELZiyenRroxX962eMlUrvjG30f0+zj0G+7rsMA=;
 b=SNSPQDuNBEXbGgePZeGhTHa3aN7Jzoit1x1QLF36WzSwGo6BxWmOorZSN42iRjTm2g
 BFVjB51FnlpQpy7rJjLkrtVaeWzdLjMoeQjSEBqvxbvLFeLZjua2Ulj3Uf47afUrnzQ/
 QNhsi9rZHROgqXFXDyAoinVL4ReGEVZwRpzLR5CxOIGg+g8GLV4+z1bxtEsT0sR2tWnx
 4xild3WGc67osP/S72iLKcSEM9Hstz4O8pHlNZoSU80bjfJ6XyBWSxlFbC5F27csuBCR
 NN8CAisebiqWqyaXRB9IrylyEgYm/XBS4YVYFRx59g1hSQe0V4lVtVWXildn0aQ2fLVC
 rBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wDpp9ELZiyenRroxX962eMlUrvjG30f0+zj0G+7rsMA=;
 b=lrOEJosamrqSt7vJrPQ15hVTUFBQ8Z7dN6TcMj3TxOXYEYX87zCjgxl3c6S55JPcNq
 w8VD/P65qn1MlFeeEzuJsU3WWXb0u9LEkt8bAgUHAyUhEutajRZxSJOqerkf29S/kPwq
 rr8ohd/V0i3Ww+Ars3CEDbovz3xenJBOBXc/aaIzeB9bg4onw6VpooT6xL4q9CQDUQCr
 AK4MsHF3qVLvFg+2QiS5BVCqom4QyZFT1sx37uuXFtW/6yvfOq+3LYLz0PcO7TvGB2Ki
 /stjPB3WagMCYT/s6WwTGNTCEtRbrtMktBNmh0ZS4jZ9Kuscoiwbp+jwnz0g4o7xrxvq
 /R9Q==
X-Gm-Message-State: AOAM532qHfjFb9POxHb8Ex4CFeJAv66J25AV3uKKQTCJdaiUWezb7Pbf
 IkLBfsQ+YQ9GCiSBVVC5BABn8OaQaP6/Kw==
X-Google-Smtp-Source: ABdhPJykTpff2b6/7sjmsnARn9QuDjmQI8hDP5BMYy0bqymvd4dTi0HPck0HhBQLByPjhEVbxQYqCw==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr6285148wrp.550.1641576107014; 
 Fri, 07 Jan 2022 09:21:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED
 define
Date: Fri,  7 Jan 2022 17:21:27 +0000
Message-Id: <20220107172142.2651911-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

We currently define a bitmask for the GITS_CTLR ENABLED bit in
two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
everywhere and remove the redundant ITS_CTLR_ENABLED define.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/gicv3_internal.h |  2 --
 hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b9c37453b04..63de8667c61 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -289,8 +289,6 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define GITS_IDREGS           0xFFD0
 
-#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
-
 #define GITS_BASER_RO_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
                                               R_GITS_BASER_TYPE_MASK)
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 677b96dfe23..985ae03f5fc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -651,7 +651,7 @@ static void process_cmdq(GICv3ITSState *s)
     uint8_t cmd;
     int i;
 
-    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+    if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
         return;
     }
 
@@ -887,7 +887,7 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case GITS_TRANSLATER:
-        if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
             devid = attrs.requester_id;
             result = process_its_cmd(s, data, devid, NONE);
         }
@@ -912,13 +912,13 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
     switch (offset) {
     case GITS_CTLR:
         if (value & R_GITS_CTLR_ENABLED_MASK) {
-            s->ctlr |= ITS_CTLR_ENABLED;
+            s->ctlr |= R_GITS_CTLR_ENABLED_MASK;
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
             process_cmdq(s);
         } else {
-            s->ctlr &= ~ITS_CTLR_ENABLED;
+            s->ctlr &= ~R_GITS_CTLR_ENABLED_MASK;
         }
         break;
     case GITS_CBASER:
@@ -926,7 +926,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 0, 32, value);
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -937,7 +937,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 32, 32, value);
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -979,7 +979,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
 
             if (offset & 7) {
@@ -1076,7 +1076,7 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
             s->baser[index] &= GITS_BASER_RO_MASK;
             s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
@@ -1087,7 +1087,7 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = value;
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -1298,7 +1298,7 @@ static void gicv3_its_reset(DeviceState *dev)
 
 static void gicv3_its_post_load(GICv3ITSState *s)
 {
-    if (s->ctlr & ITS_CTLR_ENABLED) {
+    if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
         extract_table_params(s);
         extract_cmdq_params(s);
     }
-- 
2.25.1


