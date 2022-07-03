Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBE5645D7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:35:06 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v4K-00076N-Ma
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuD-0006Mc-8c
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuB-0005oc-PQ
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id m14so6029168plg.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=luVPKzasukavgin4n19Q4taZFn3j+af3jyeUe3XIhz4=;
 b=C/eAemyzfdi7SQ0wNM8HnbS8K5cYr/V8RLlK8oA7aseRCfA6h2r0CdTIGVU7sQsbiZ
 0pt3IzlkjjELsfxaburKXJVVIMWLmnx3UmTZZY+SWAi+OoA7VhhOSmnFEVUE2WTEdz8j
 jqr0FO8aZJt29kYXVgk6lvLB2OCdMVpi5xQ+5TdjMgHrfa2p43HBChjWE83geyUSKQ/u
 1vO3lmokVpcmNzrYfkifzjOK+iYlvj4lyX3l3reGgbUJr9dV3y5Vdg8GoL8woxco0iYP
 MCfkD9sIe9+2o9T1mg83upZ0/RWXYVsxAuZEpv7rLeBgQ0RT62ip28AyGeSbsXdzRin7
 7BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=luVPKzasukavgin4n19Q4taZFn3j+af3jyeUe3XIhz4=;
 b=eu8Q2NJWe0OsKlx1CugREkNnCHIW45MjcCKAdsbilWXXHpmms2YA6vwoD5EfTjFn5d
 zftePgtFS3l2GyE1A4K1RCAD2XUclxqifNHYM3TMsPncJt0Wj1il07FMMGfe3HXhlkM6
 JXD0DBqFzAo4WRknUq0zlvKObCTl3ydreQYPnoq7jiOGTTC3kGF5ySOSuf4q/YJqxLpS
 HGWmhkBV9aExZn6hD8I2UXxuw95vL/evn/Xamj3xF+sUHYeJB051ma2Ln+x2TQotXW+J
 qySZylRHGIxTnoxGTfH/ytt5rJ2GjJT7R1C3WP+IS+jtIG+7Zllwpjmym+ehg94TuH0b
 4+GA==
X-Gm-Message-State: AJIora+lv6lAbYIGrn0wr6konGOdkgItfKnrnAgJSDgoHB2q+jWeco0n
 h/nzMTmshThb0ZvOHGmc3TDnhqyLTKLIzlPI
X-Google-Smtp-Source: AGRyM1tW+zcF9lSkRnkTD2GX15KqbcubdbONTBGvVkkqe1TFqENqW/Mb/qfD/kO0sj/czGueUMZOFA==
X-Received: by 2002:a17:902:7204:b0:16a:22f1:f87 with SMTP id
 ba4-20020a170902720400b0016a22f10f87mr29561512plb.3.1656836674424; 
 Sun, 03 Jul 2022 01:24:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/62] target/arm: Fix MTE check in sve_ldnfff1_r
Date: Sun,  3 Jul 2022 13:53:20 +0530
Message-Id: <20220703082419.770989-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The comment was correct, but the test was not:
disable mte if tagged is *not* set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1654c0bbf9..db15d03ded 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5986,7 +5986,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Disable MTE checking if the Tagged bit is not set.  Since TBI must
      * be set within MTEDESC for MTE, !mtedesc => !mte_active.
      */
-    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
+    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
         mtedesc = 0;
     }
 
-- 
2.34.1


