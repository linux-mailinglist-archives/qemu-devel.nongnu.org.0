Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAC39E594
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:35:51 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJAD-0000BU-03
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIay-0007le-1J
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaS-00081X-7L
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso102812wmh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzQMU2S0MPi6LG0qvbJo0z1iKKPaC9Dm6mwYYso4zvc=;
 b=xNHOg2DMteh7TAdIVmaWYo+X/GeDt60xODrAWEl9jKHSEcQigtJL4ufd5TB8jNwUp2
 dlE6ofWdhj+DnercmQyrJGlt0hF23HaGHGwTBUbA6ad3sbDtq7rVNnM6UZJd4jQxXj1M
 lo523l3NpmJwDB1RRBFDSzEP3zsr9SvsZeY/jm6yywBLZ9Jllp+M9+ziDWWZcD6ZTIuz
 4oeVDDsn1uSG1zhAjybfulFhlHozSAohQVyzxAo1Py/3NQqhCO+ocTVFdtTwMm3qIup5
 VPUJfTwJyUgWKEWjUmdnRZeMwNPhpmT1G/txXIlSpunUYQYgKnEwjcQzgLJRWSr2DVTi
 ZCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzQMU2S0MPi6LG0qvbJo0z1iKKPaC9Dm6mwYYso4zvc=;
 b=j+6LXxEYKvMQ+zpGoAkeiWRoJjxbbnRxrHpTZCfOeyzHMPF4q/oFwiWw4iWJqrLFxX
 +cQG5EFYoUkeoOg/uPN/P/VjjhL2O1AZMJudvBSB5nz/bw+kGWW6t6BXsniKis2JDmxD
 BGdK2UxOK7/s0cL+Sab4SIyEJTFt9ExV8Y0ytBdIPN/qmJIfq1XrtlYXZJGl5d3R3te7
 SpUI3MS5vsNOfgnczWHv/FLJe7Alu0nq6tq3iO2xMi3lqS3k4c/OSqRoq5d/wLKKI+RX
 yAKY3X43xdR2Lv0+PufgJ2S6LnV9X/EnQRV8r1ONWm+sU+NwkxY+/+MilYkkWejDqMRj
 0+mQ==
X-Gm-Message-State: AOAM531Zcw1pCBqHzLCXFPfCGrWNcSKJmkdo1/BHXhjELH+ifMxVEKTJ
 m6+mo+yVhMVr2Zo7uzce7aeC5Q==
X-Google-Smtp-Source: ABdhPJwDTuv0HawLnD1CACEFY2E+PN/UxAVNU55U+eX+ehQvqraMBj/A8ELiivJa+OVjYiscfkWMsg==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr93878wmq.62.1623085128256; 
 Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/55] include/qemu/int128.h: Add function to create Int128
 from int64_t
Date: Mon,  7 Jun 2021 17:57:57 +0100
Message-Id: <20210607165821.9892-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

int128_make64() creates an Int128 from an unsigned 64 bit value; add
a function int128_makes64() creating an Int128 from a signed 64 bit
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/int128.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 52fc2384211..64500385e37 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -11,6 +11,11 @@ static inline Int128 int128_make64(uint64_t a)
     return a;
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return a;
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (__uint128_t)hi << 64 | lo;
@@ -167,6 +172,11 @@ static inline Int128 int128_make64(uint64_t a)
     return (Int128) { a, 0 };
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return (Int128) { a, a >> 63 };
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (Int128) { lo, hi };
-- 
2.20.1


