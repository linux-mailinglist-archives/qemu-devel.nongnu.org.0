Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054B47158E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:15:32 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7qF-00005g-J0
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:15:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mZ-0004oI-L6
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:43 -0500
Received: from [2a00:1450:4864:20::433] (port=47073
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mW-0006Bi-LU
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id u1so20257802wru.13
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m/WoaEcAXkHQDQGnYA2VaWKRKb5cvTpqbwK+SMbmTCw=;
 b=h3Ph0Dfws5fw5CWIFcyqSGOd4BHzj+ETZCT7WVSl6xmt6W3Thjony2p7hiWiKwvtWK
 IwKcsCLKPYwPS+TA34DDvlmsvf6va4oFsHlZW3+dj0er+cDtnUOFvBVzYlcPkMpPqDNp
 il1x+4nZHfhKd/vd8S639fKKhATJjyUbv+hshdUYBntkeYGmYSP81yXX0fgh12aBYjM2
 N4UMXjKLrrzf+5M/cp/gcwOJXkjJcCmTx2uAuB//4qGkQjKlotEUh0OWvhuE455wyApy
 82mmY/XMC39iouIkkvqURcvdZwESp8uSpJnMSd3nq+O+FhIuEnVocVIoBBuShDq5Vgc0
 3+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/WoaEcAXkHQDQGnYA2VaWKRKb5cvTpqbwK+SMbmTCw=;
 b=TcwbJ9x3TgSlmM/v8ANnuzq5uNjdAspPeqTaekqA97FEmu0QpZV+ImA0KD8eSR5tjN
 Ei043DNzm8HlBnSjeRJxam3qDMpwYGOx8XHAwoWA53gP6yGnfEftWkcBpkMxNCeF6HhI
 A29/82QNgd/nh/ykV7Y3u1tDgc3/34TCioFnLyDV+oweR92kHaw0JJkBXyA2aw3radlo
 T/bnqO5KxkQRIcVuLsZ98jYdrh3xqx2dHQPihpeJoWvRGmCty47lYIlPyoATcPPL/gaB
 X/cgX+Iw+QiUKvTKohCs+J8cAceFggLmwxqCWP67uqFRrl0xhfo7W0VguwsFgPNiq1G6
 gxZA==
X-Gm-Message-State: AOAM531ZqyXilM6rL7iXw4g2lW1+GJmlazM6OMGwl5eACmvzOHir7Qkh
 WzS1LDK+DjD15v4K4JufAisvxw==
X-Google-Smtp-Source: ABdhPJx4SRFNU7p8nQvtpgAB8WK/xT31yhvdKstuX8+r8wYfyCfSnyfuPN14zvbW2YA06fnqOWSybA==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr22091003wrq.194.1639249899312; 
 Sat, 11 Dec 2021 11:11:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
Date: Sat, 11 Dec 2021 19:11:12 +0000
Message-Id: <20211211191135.1764649-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

We currently define a bitmask for the GITS_CTLR ENABLED bit in
two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
everywhere and remove the redundant ITS_CTLR_ENABLED define.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


