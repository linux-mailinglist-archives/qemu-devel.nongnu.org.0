Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F522FBAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:19:48 +0100 (CET)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1snL-0008MS-Ju
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfK-0007p6-Ft
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:30 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfG-0001Ik-RH
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:30 -0500
Received: by mail-wr1-x431.google.com with SMTP id c5so20069527wrp.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8ql6fHzFZ6ob/6tSdR41MFRSlYbbsIprY76CgGUbWhQ=;
 b=PLgKPy0sMj1dQqe960UpOy+TDfSvFOOt8Mov95P3UgKPqmtn5Bu5lrX0xr+wt2AUym
 UQx0pgcwyN17dLRuEzW2NBK0bRMa5kKvnzd6t5Ei8+BEvWu4j+faxKQh0w4Wnfz+vZw3
 EkhX4TzzeKDEiaJvt/ZOY5d1vmYAp7OXKRO/AYGAF/7AIodW0hyu6e2rnacLwgQ2ZAZU
 E2rVU+nVgjDMuBGIasv6IH4w2W4vp6tM9Oaj7TxTMX1ADbevzeIawSiR1uhiYKxOc1Wk
 BNem61Mx95tuKOznY+0apoClXeVJgix6RmaMEyM38RjsYOM2IkPCAMyifpE5CKFpaHPo
 R+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ql6fHzFZ6ob/6tSdR41MFRSlYbbsIprY76CgGUbWhQ=;
 b=PaJo8d2m+5VA8dON5xK377z7QuV5Ylb5G1oQgOwcuWjMUPHvxtQHCtDsTQPUnmKpoV
 +CFKdViYokDebqjWydSyzxx6du5Asfo8bwGbRAVVMt7BgLw4dyWEx/O8t/3MXegXTnHh
 7yVBl83LUgtX7F1XGbqfbbTelhtO22o+8G4/x50xtXXq3jFP3a/KHZ9JeqPQ6qYWjHxm
 sNt4peT7vrvzQWip4ellrG1DGlqcsKLFwyv7OSldoSlaRa3h/HwrVrv/8rf3w82x8Sp2
 nQWRO3kiaAU/AuvUfs4QPVmpJebypcvIAL7Muntxy68byGJeRLFeKtVIn6bMzg+FO21m
 7fUA==
X-Gm-Message-State: AOAM531QYVYYnGwLNJOv58JAxfWUVFNHPJp37TRbWMxmomnu9SQ67pHt
 JSvwCvygFVQjcWL4a49FfP2Di+z18Ogzng==
X-Google-Smtp-Source: ABdhPJxCxhHyDu6p6XpDcY4lBo8c+eSdsCeDU6tAr8XNrp0foZHUWBSruL6ObmzECwIhOswhaVZSQA==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr4714219wrt.279.1611069085480; 
 Tue, 19 Jan 2021 07:11:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] target/arm: Introduce PREDDESC field definitions
Date: Tue, 19 Jan 2021 15:10:54 +0000
Message-Id: <20210119151104.16264-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

SVE predicate operations cannot use the "usual" simd_desc
encoding, because the lengths are not a multiple of 8.
But we were abusing the SIMD_* fields to store values anyway.
This abuse broke when SIMD_OPRSZ_BITS was modified in e2e7168a214.

Introduce a new set of field definitions for exclusive use
of predicates, so that it is obvious what kind of predicate
we are manipulating.  To be used in future patches.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210113062650.593824-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 27cc93f15ac..853fa88fd61 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1348,6 +1348,15 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/*
+ * SVE predicates are 1/8 the size of SVE vectors, and cannot use
+ * the same simd_desc() encoding due to restrictions on size.
+ * Use these instead.
+ */
+FIELD(PREDDESC, OPRSZ, 0, 6)
+FIELD(PREDDESC, ESZ, 6, 2)
+FIELD(PREDDESC, DATA, 8, 24)
+
 /*
  * The SVE simd_data field, for memory ops, contains either
  * rd (5 bits) or a shift count (2 bits).
-- 
2.20.1


