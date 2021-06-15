Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979FB3A8618
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:10:50 +0200 (CEST)
Received: from localhost ([::1]:59016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBeL-0006Wp-KZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFQ-0006k5-FY
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEs-00012n-Iy
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id b205so9711338wmb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WrtQX3pfoBGhC0F6GqQ6Vwb/f3HNcfAIpvyb+RrPbHE=;
 b=EOLFIYQhu5HMyXO2RQ1N8JLWZivfcFef5VcwlarS+WFL6mYsyIw8emHXFMEREUE/n5
 yRmtEQWVkICmfbA1qAp/CdTPDegzcbHG/6xjCBmJDXQkhEve9qiuqnIRpT2BDMMl9IqE
 eWXHE0prWQvjkf3gv8EGE4r2k6GI+pG9PUFA61RmTPx5bE96d8bZvS4TYensE/gVszrb
 NkCat2HlI5aHK+hfsL1rb5SuhYKChRD20jQQYaEoiIQrozVtgNgHsxAmnwZDpWCMk9Ya
 zblo3b6V8ZrktwoBn0IJaUZedlO2uOah/R+3xOQ8t+G8qYqK/K37EZCld4Mmc37/tiZl
 vsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrtQX3pfoBGhC0F6GqQ6Vwb/f3HNcfAIpvyb+RrPbHE=;
 b=olRNEOBo1gvFrPeUv6GG3aozPhnQ1sJZX2wRB+k2JKiDx5jPf+4LpWdQgGBepjGfLP
 xbCZ47yw4CGUnySm6K0zyijK8lIXfHhkmsvVaYiHjFljjZMP5/BeGvijjzcwYtvZ2/FD
 nn89wGm66DluigKTuq0TKJlejYTRtudQbBSgDr6FMQuip9YNIqnUrEc3i/O2yxzdMxIe
 xYYPonxLuUyIZmqNmjPPSTYBRXhUxyS8wQ98ogifu9YM+YJE/wUAmbzo5F9G10qx2xs4
 Rh+H9ZNIzgJKmUYyQyazsMZWeFkEYx/Kj0Z27ORBvMmoOJWWrUYccqftVFyPydQ29/M+
 FhZQ==
X-Gm-Message-State: AOAM5312V/6LL0/Xn6r36FtengYkYgTVrIWm4dBer/uVBf9Pebpzn3om
 5M1/wt27b1HkGeAZQV/fG44Z/e/lKiYgFQ==
X-Google-Smtp-Source: ABdhPJwYHTxFi/ZMNZ2o6hNuT3kMRsLai+7YDqlscXBm0/QgSKYilPnjO8yeDZ5CuA2CvkcIetfVgw==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr4723952wma.126.1623771868000; 
 Tue, 15 Jun 2021 08:44:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] include/qemu/int128.h: Add function to create Int128
 from int64_t
Date: Tue, 15 Jun 2021 16:44:05 +0100
Message-Id: <20210615154405.21399-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

int128_make64() creates an Int128 from an unsigned 64 bit value; add
a function int128_makes64() creating an Int128 from a signed 64 bit
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210614151007.4545-34-peter.maydell@linaro.org
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


