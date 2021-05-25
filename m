Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1C38F778
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:20:40 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLkN-0004BD-AK
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUX-0001aL-5M
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:17 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUN-0001hF-PH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:16 -0400
Received: by mail-pf1-x433.google.com with SMTP id 22so21875700pfv.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUNHHrwNpMX6FZ/Id7bckirr0h/yO5yVC29ynoS1sek=;
 b=jAsr3wLnq718wsfb96Q6c+5GsXNQ/4W0rVjJeESdtUZMfbsgqh1qL5Z6oTWwrCmeNO
 OYaUr8a2z6jifQ02/URsWolld9E/4OkGIujBNoEyI+8YdpHYlp4n3oSl8diowWuKHKyE
 g9OG1AQZ+pyfvispYdVFumrZAVxGOPDGlKHAW9YJ9C73yFUVKpUu8+XXP2kjPRjNp5Ne
 4BGWmNdgDgSNUiMP4C1hWxeCdJS9Q4gteDYVTgv/rrAuqU8oT5sznFJn1YWlHnSJHnze
 nvTQvAHSAresrK16NBGq5wTGRzHTDLRvp9CvbUGMebsiwkIT+L31392/LQZMb5/7AOqQ
 NsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUNHHrwNpMX6FZ/Id7bckirr0h/yO5yVC29ynoS1sek=;
 b=iZObGcx4dvCaRD4mxybIN70DVdLyeiNJyC7qrqKw6i5lLpBhBYNVQeZqum6As0GATT
 ga4718wP0kXioI95mxfrrZvzxGOwAJOu8aw9PRDzWxhvtUWAHlPPkuidlXrN4M+k1/9d
 Fb3TOOveV/iNy9h7viTcZVdBT1GR5E56ItPAg40Tgzzhn3CTgoRsuSF+f8JEDjejwS9n
 hWA4+KEnk3JaJGgUT/5K2zHyMozKuObLKdUVWukR/JbRWRzgVQ/7E2TV0UkMMYlSMkMt
 dwTfbOpjTIhsM3H2NmT0mAB5bxIrmHCzTznP8o8pRotj3qh2ztH7ycHSLVa13F3TlTZk
 WBxg==
X-Gm-Message-State: AOAM5318eCpE9Ztl+6iDVS9OTb+Y/RkqujZ1NlPnqHjpjUin6hg22MdQ
 VOM0NEWHPQfLCYBjNV5apwkaPUfP3xx9rQ==
X-Google-Smtp-Source: ABdhPJwSVQ9jp5A9dTr52yeg2fjQ8C+rRvQKmKO7zGkEOxtQSVpHnHh6NvhSH3Z+SDpkWyym7s8YhA==
X-Received: by 2002:a63:af57:: with SMTP id s23mr16469666pgo.393.1621904646427; 
 Mon, 24 May 2021 18:04:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/92] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Mon, 24 May 2021 18:02:37 -0700
Message-Id: <20210525010358.152808-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22983b3b85..ae8323adb7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,3 +6016,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1


