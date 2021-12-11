Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2A4715C5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:43:15 +0100 (CET)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8H5-0006uy-26
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mr-00052K-Nt
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:02 -0500
Received: from [2a00:1450:4864:20::430] (port=40947
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-0006I0-SB
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id t9so20344801wrx.7
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nosYSlY6B8BjGiEgE79mxQI/EMOO+ggHFy7fpPzljqU=;
 b=ox7AOAvscN3ZMdOx+B9sxNJnoafh7hnqLOj9MkCuC1sjg7QwHQPl5KTtKTcWTB6Kw8
 K+Vx75qOkaL1NQhvwN0b8KZUViY8LOZhV2ZwQsziqNGVXRzs4MpxMHA8/wBs+bvcf0V6
 UCc89V++XzXJRfkeemppb7onb42NBqrWoifFKq5i06BObNUcS+MDlG2t5CSGd4CNBmaE
 nzipY7BA6oA17n6PJEC34CfatrK/1pujVCiE0GT661kzXTHRb+E+BapojNNh605wKBdx
 p7LHSGOpjyCxx1Xl+7SPmjbVgFaFLxmZdflEuwoDrU9QdkVklX1fXdAIN6+efQClk8CX
 NhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nosYSlY6B8BjGiEgE79mxQI/EMOO+ggHFy7fpPzljqU=;
 b=1lh5dKbNYRPOHzLF9jXICrUEoRGwP8wyJEeUKdqfW5b2eOpo6CzqgAFWlmfLJxwetd
 NlqlQ3xJk9xTUWvwvJRe01x/bL8L14UIvZfY8pdUJxtueRXFJvZWr+Co9MKURGO89mSE
 kWrUxcsyIqP/i9XYUF/YBs+P1C7E0AfCtHXuUoQbah7VFdVN8j8K4EjPvrWTVKAOkaEA
 8RX7sQb2xzB08nQWv+oUM6btZCOwASB8wF30GLFBUsxPnp/Of4VlJGe1vaBc6ZpAtZZb
 1YUNR3We2pOnCsgzJVt1Y50wNNYYgdUtdAtiZoOrUYrmCfUQEtTSXC3NJ59yHkKohGp+
 d1lQ==
X-Gm-Message-State: AOAM5306Re4oXki0w5VxOEI256quGMJLOJeVGTrT5/WZaw9Ztw5JPx7J
 JXmDtJ6amUNc3YEleHeNdZEoUg==
X-Google-Smtp-Source: ABdhPJxhQujeN7d3J8wXXtQ7fdp7OFd1ePHNz4ZXPl0SyDDykSo2s4pjEL6kyfptla3H77WJmC+KMQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr21587075wry.66.1639249915796; 
 Sat, 11 Dec 2021 11:11:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
Date: Sat, 11 Dec 2021 19:11:33 +0000
Message-Id: <20211211191135.1764649-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
---
 hw/intc/arm_gicv3_its.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5b25347de12..7615e9aa279 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -489,7 +489,6 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -499,7 +498,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -518,11 +517,10 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
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


