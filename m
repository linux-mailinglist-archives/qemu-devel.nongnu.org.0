Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC75331671
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:46:00 +0100 (CET)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKtD-00021w-A3
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlK-0007Zq-W6
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl1-0007Dc-7L
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d15so12344136wrv.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FhDIOwyJ8GCGcJ/kxHrV64oHA1bgEOV4xBZvRE8WQhg=;
 b=hT5uGpCwAxpNWpZ3KSL0/Eh/LZlaAzOjCKimT4mZP8EsY7h3AjVInEtwSPe9iiRaZ2
 x1oCvWN3Q9hbZTLlVGcHDKoUqsJWC5nZXCNRBTGt9y1dhsHklZUUus/7DJSp5OEnsR9B
 NGwIaGXqR0bdLw0/F/a5qCF/Td7KNT0lHKSGhFeSUlfu/HGQK5DtyypujTDV+bmb3AcQ
 YhEk2Ue090dl+46M22ElhaDdAk6WVgBWVbDyf667F8Hl3Dy9EWkheKSq8K1IPid0bCUt
 Ufr8DHulzy82PuSL2oXthAGVndAWpYy4PIHCjQ1w4kW6EBDPF1L9WrEIYCX5Er0QkNRW
 U6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FhDIOwyJ8GCGcJ/kxHrV64oHA1bgEOV4xBZvRE8WQhg=;
 b=kNS0TgJ2OEv69FjFdJRl+3S13HxFk/egSY+sYGxehksfx/IIGdNrOLd2KJ1cD53I2N
 8Mg3hwo58rk8BX7twFP3k/q/4cizlOmn3G9bS4TN+aame7xpUOBSgFzMjaXpJDPX7rRt
 VakkFqMUiWh4cjHdVFVfCGv/Xu1MbpvC+23LlaFabiWu4W2Mj1+cB3VJDpwsCsh0K5y3
 eJ195kvL72Y8Uqsqm3ePt6+Dz98v6tQJIpUl/5TtB0Irc3pzUOqIIOSz3isIkwfuKbzb
 yw7iZpmEW80pYZh6dgaW5+8RlDIQ0q69E+GfDWppJBdIE0I52hs+5O93yVbcZ16xnuvI
 mKHA==
X-Gm-Message-State: AOAM5306YpDrk3iSYsE0neaPoyHegZCUOwaRXVgE5/kYRqac4o0d6lWk
 bIwcd9MwGoSm428o7WRdQu/8pT/FcqXDbA==
X-Google-Smtp-Source: ABdhPJwXsZqh9wY8fAfwTj24VJkE/GnE4/oGyJ/BMRKN8xquoIe03DPDDOiNz2vGVdkoG2PCmOHyiQ==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr24402113wrg.171.1615224806047; 
 Mon, 08 Mar 2021 09:33:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/54] hw/timer/renesas_tmr: Fix use of uninitialized data in
 read_tcnt()
Date: Mon,  8 Mar 2021 17:32:44 +0000
Message-Id: <20210308173244.20710-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The read_tcnt() function calculates the TCNT register values for the
two channels of the timer module; it sets these up in the local
tcnt[] array, and eventually returns either one or both of them,
depending on whether the access is 8 or 16 bits.  However, not all of
the code paths through this function set both elements of this array:
if the guest has programmed the TCCR.CSS register fields to values
which are either documented as not to be used or which QEMU does not
implement, then the function will return uninitialized data.  (This
was spotted by Coverity.)

Add the missing CSS cases to this code, so that we return a
consistent value instead of uninitialized data, and so the code
structure indicates what's happening.

Fixes: CID 1429976
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219223241.16344-3-peter.maydell@linaro.org
---
 hw/timer/renesas_tmr.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index 22260aaaba5..eed39917fec 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -46,7 +46,9 @@ REG8(TCCR, 10)
   FIELD(TCCR, CSS,   3, 2)
   FIELD(TCCR, TMRIS, 7, 1)
 
+#define CSS_EXTERNAL  0x00
 #define CSS_INTERNAL  0x01
+#define CSS_INVALID   0x02
 #define CSS_CASCADING 0x03
 #define CCLR_A    0x01
 #define CCLR_B    0x02
@@ -130,13 +132,20 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
     if (delta > 0) {
         tmr->tick = now;
 
-        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CSS_INTERNAL) {
+        switch (FIELD_EX8(tmr->tccr[1], TCCR, CSS)) {
+        case CSS_INTERNAL:
             /* timer1 count update */
             elapsed = elapsed_time(tmr, 1, delta);
             if (elapsed >= 0x100) {
                 ovf = elapsed >> 8;
             }
             tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
+            break;
+        case CSS_INVALID: /* guest error to have set this */
+        case CSS_EXTERNAL: /* QEMU doesn't implement these */
+        case CSS_CASCADING:
+            tcnt[1] = tmr->tcnt[1];
+            break;
         }
         switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
         case CSS_INTERNAL:
@@ -144,9 +153,11 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
             tcnt[0] = tmr->tcnt[0] + elapsed;
             break;
         case CSS_CASCADING:
-            if (ovf > 0) {
-                tcnt[0] = tmr->tcnt[0] + ovf;
-            }
+            tcnt[0] = tmr->tcnt[0] + ovf;
+            break;
+        case CSS_INVALID: /* guest error to have set this */
+        case CSS_EXTERNAL: /* QEMU doesn't implement this */
+            tcnt[0] = tmr->tcnt[0];
             break;
         }
     } else {
-- 
2.20.1


