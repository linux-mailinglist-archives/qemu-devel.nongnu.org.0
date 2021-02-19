Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC5320165
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:37:30 +0100 (CET)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEOv-0005Ya-9n
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKQ-0000SU-Ib
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKL-0002et-M0
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id x4so8932626wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IS1BUR03jexDGbtzU+PSJD8D9h+/itcod+y02RRRBZc=;
 b=UrBypUjOQx9NGmoTwXvglZsup94He22pr/o5rTCT9ADkesZ/UckebwWcJOFG5u4CDr
 lDykvbdkwzjN2bx0nAVtGQURj1Ic1zxWCiMLr0VHANs/6nyJ7uoVVgVbbImDcdhWs/tA
 smEE3WYXwrA5GPJadjvv7P7PPMEDBXF0n7eymAewhdBHFKRWYpTN/VfXBx2M2K2b/gAo
 1RpDlWNTMqiuqOViT3COwga2qVPWqU53pdNrhVANDjaZywEZgKzubjdwDfdZttG/IgYk
 h8F2Zah2F4JiJknPgPNJ4vXPa9ydFyRLA6D0i8i60Mf9ladwsHkbS7kGHsRjpkJ0qZQX
 zSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IS1BUR03jexDGbtzU+PSJD8D9h+/itcod+y02RRRBZc=;
 b=RakcefuDjlkQy4r4jLqxClrXDiOML/vPL7G81KejplWatN5a4gU0BnZ0D4FAfzD4km
 6DGIHetUk1bdLu1W3FV6loyu9l1UfNfi/y7oHwWIRT9COVabuzcszUb3YVPWKk+0ewYr
 KPsAqgiC2QK7y9qmnbr/bkD9F9+i85ILC/jwOyf6CVl9FW9i9OY+9cfVpB984JuWOUb4
 u9EOOx37ltg1boow5EWXGijVoMgLJaimQR3KfWARNKLA/Olbh7vzZJwYBTBbP1BaHo+U
 3Hr5hAnAcQDq3E+/5NvoQYpxbSJvBN9tas1/yhMf/6ZtmON7l00yMD8zAt1wnckIRnbp
 s/Hw==
X-Gm-Message-State: AOAM532Wtx6Phgu/KYXpN/KD7Cxx5jbAp7nUgtYvkZLT+hjyUjhiApHq
 cBRxj6kFsnQOkVV904GO3VWwWIksEvxx2Q==
X-Google-Smtp-Source: ABdhPJyaYgE0Apmr71Ce7prF2jilem8DVKWr81NMvDYE6jZ9GH1UBAY8NGMWbeYQA8Qfzukh/r+2cg==
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr10152056wmc.187.1613773964351; 
 Fri, 19 Feb 2021 14:32:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t15sm13370654wmi.48.2021.02.19.14.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:32:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/timer/renesas_tmr: Fix use of uninitialized data in
 read_tcnt()
Date: Fri, 19 Feb 2021 22:32:40 +0000
Message-Id: <20210219223241.16344-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219223241.16344-1-peter.maydell@linaro.org>
References: <20210219223241.16344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
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


