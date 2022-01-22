Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73068496D6D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:47:29 +0100 (CET)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLQ8-00060i-Ji
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0005hv-Mb
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:14 -0500
Received: from [2a00:1450:4864:20::329] (port=54152
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4N-0007gX-I0
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id n8so20194417wmk.3
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWOwtfSkXv+Z1HhHrk1F8pisir4TdF801Jm4JXQ/boc=;
 b=cRHKJGXD4fHJzlCpIfCtSr96Me07yuTweLrRuVelmSCXVT8bHgR5tkGHmjUPyXV2Eu
 uFFfUC8T7z21/56+NKW/MSno1/Qq/IXpw+Q/QKdhuhN6zs0Hs+a3sA3NsRMPo7Cpt8qN
 LnyNPjWOKG0xLW524dRfFimLOms1FzHJjWfYqdqk9BadRgTw8pFNmG+iTrbw9k6n6jbV
 FmW4h5Us6l5tCr2zlkduLrZSrytGdhN7loh7+VDwcO1i5Kp/PO5M0udoDbnqpXa17ilc
 PHb8JYOHDP54tGB96p5uosrk1fMbdQL8MrfWLSaZxnpYr/IRqiq6UsDANzTOXMyt9lMk
 FACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWOwtfSkXv+Z1HhHrk1F8pisir4TdF801Jm4JXQ/boc=;
 b=T2RXvUsLq6lvYeYiRRJSmZyzMu5CLsEf3JXXdDWBWDnXibUa3e1M45NKbDM+gBj8ud
 85LMEUkwO3j83rDWEY4F2wdaIuClAPVdvyG5wsnBShqYBvANpAJDiILGYbSK8Kj9i9Fa
 /bdta95F2G1lVNXwnGedQbNTbhbWGOPx8KcV2Y2JdSCjqBL8yGnkIXHvTxHduQUwogJc
 506FsRpawk1A4Y4gMUgu9AivEIEpaKAdNnQ7icd/NAzEsE3F0oSYmzIZm0jxo4kf0KbR
 HQrLnL/2bv6TzchETp/pSaFTKOfZm6BIJjGYZHFFXXKHEyp9vwQUYAukzP7dY/rjT9UZ
 GBEg==
X-Gm-Message-State: AOAM532ls7EQoF+dhHSm/w38HVqbfa4GPPC+xOZGZ5ElgGnzW8c6nSjW
 D/UdQ8UMaOpBYSgAVbY/JtKXJA==
X-Google-Smtp-Source: ABdhPJyepEexigSfnvjBCQfTS59a6SSj6pU5p7L7YpiVOralDKBcgfkGbvM/cdph0n4K660Ol6peJQ==
X-Received: by 2002:a05:600c:1e2a:: with SMTP id
 ay42mr2469743wmb.131.1642875889860; 
 Sat, 22 Jan 2022 10:24:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/14] hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on
 writes to GITS_CBASER
Date: Sat, 22 Jan 2022 18:24:35 +0000
Message-Id: <20220122182444.724087-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The ITS specification says that when the guest writes to GITS_CBASER
this causes GITS_CREADR to be cleared.  However it does not have an
equivalent clause for GITS_CWRITER.  (This is because GITS_CREADR is
read-only, but GITS_CWRITER is writable and the guest can initialize
it.) Remove the code that clears GITS_CWRITER on GITS_CBASER writes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 1763ba4a671..d9ff7b88492 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -866,7 +866,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 0, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CBASER + 4:
@@ -877,7 +876,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 32, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
@@ -1027,7 +1025,6 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = value;
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
-- 
2.25.1


