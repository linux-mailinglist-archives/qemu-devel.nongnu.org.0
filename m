Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97C14D49C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 01:19:11 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwxY6-0006ck-Se
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 19:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxCo-0004gq-Di
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxCn-0000bH-BX
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:57:10 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:32966)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iwxCn-0000Vi-4w
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:57:09 -0500
Received: by mail-pf1-x443.google.com with SMTP id n7so514460pfn.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 15:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Hsz/8maEoD8LNzBRllIUSvkdiMaQ8Klvt2hrUNkyAQ=;
 b=Lbh+nyxbeEhTAbWX+o6tIhEA+NwONe0mKhjGLEzbiZTXIIPV1oUHpkHxIGSM0hkyW/
 lk1c/Q+ZyNH3RMkCdQ93fxP5RqKRpSQf3hsuI3tE6DxQnvGumUntpcLK5UFkRSvYqNrD
 ox1Jri14xasKBBKsbN5M3jLv1J7SIozM9pm6H9qMMx121bcIW/w9hgOH0Q3BNb/bi/LS
 uzAbADRXDYuUMH1bLhF5XD5jiotFT8sqsZ0MMJiWPTsB1TFA40i8ilpCIyEpZ8Kvq3Ft
 cxIQo/yTJ/v/siBe6CAqFDJSj5J6kmfT7kLiauL3KRXB6eD3a1LqUoPjkgj3sqjSiCOq
 j24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Hsz/8maEoD8LNzBRllIUSvkdiMaQ8Klvt2hrUNkyAQ=;
 b=eKyVJzqMlNwf9kpBDyvA1H/pzzc4DjyTxgOYara4EeB05PZUL++poWORG0Tmh8UylA
 kvlDcAQwLLIO/NqpT1UtvbB/R3zamTkkiH8iWMn1LQSIXRIzpaxiGs7tficgcJ0r4stD
 3JWY/PemjUI6XiMdeESMPYS0hJ1B9XV15tEXd6V5z21g3dmLjgKCLPxwZsKdHHtOh9U+
 JjYS/JIgZtG+AuctFa9OXLwVJOPPANu++xl5A7sSJ0bXGjSGMkoNDXr2u9EL1rEQwBGD
 NaDFWUhfFuoQmUbwl8BYSu/SkPgn2nR4uD9NORczX9jVGp7pQXuaTbENDYx3s8yY4a5U
 6KMw==
X-Gm-Message-State: APjAAAVVEAGx6n54xKNRiaGY8fH134GBn+wZ9wXEq0u7O4LwMixV6HDs
 Fx/94LBXbzwXFFaJToMvzshIr1Qxf9I=
X-Google-Smtp-Source: APXvYqyEC6RVxHLaP91CuL1BNibRuybMclFSFHi2klUyKX29OGQdTygPib2lotvLtDTb3Rs7MJlXDg==
X-Received: by 2002:a62:158c:: with SMTP id 134mr2143998pfv.228.1580342226922; 
 Wed, 29 Jan 2020 15:57:06 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm3953626pfg.145.2020.01.29.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 15:57:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/41] target/arm: Use bool for unmasked in
 arm_excp_unmasked
Date: Wed, 29 Jan 2020 15:56:13 -0800
Message-Id: <20200129235614.29829-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129235614.29829-1-richard.henderson@linaro.org>
References: <20200129235614.29829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value computed is fully boolean; using int8_t is odd.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d9cf625073..06d72ac9d6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -417,7 +417,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 {
     CPUARMState *env = cs->env_ptr;
     bool pstate_unmasked;
-    int8_t unmasked = 0;
+    bool unmasked = false;
 
     /*
      * Don't take exceptions if they target a lower EL.
@@ -468,7 +468,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * don't affect the masking logic, only the interrupt routing.
              */
             if (target_el == 3 || !secure) {
-                unmasked = 1;
+                unmasked = true;
             }
         } else {
             /*
@@ -514,7 +514,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
             }
 
             if ((scr || hcr) && !secure) {
-                unmasked = 1;
+                unmasked = true;
             }
         }
     }
-- 
2.20.1


