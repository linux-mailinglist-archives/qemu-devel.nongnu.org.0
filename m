Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AE38F7BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:52:50 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMFV-0002q4-VJ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYR-0000i6-Ky
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043N-8F
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: by mail-pf1-x429.google.com with SMTP id 22so21881705pfv.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+Vp7PCJgIRKIEMBm3mLYg2gfZhdkwYbxMZPEhx6JvM=;
 b=Tcaxt00Zw7wS53mtbRQ3eKOB+GGnnwlxy9QohWinQ0I+u39nqEwxSH83jBKmc/VftX
 ioEntWdp8lPKl3+K4t7bBqs24cycqR6yJjHyAi0TU5y2QfBJTBlEBHaPvKhWsUIEMiyZ
 OxTVPlAVDUOgJZ+EIXdHP44dBLUh/1jOa3bMVx4DxzgQXd0zs+YFtAl432tg3jUXOcPC
 j6j8QLzWd8oVI/t18ja7ngJQWFmKMZnjo6/NKr6L6xGVmBIWzqm82eYp1JW6saObUnv7
 7HhfUvGJcvsm0Sm3kzy3zhYGhFSOiJUHXVOIoPcSfbwbD2s/tHCl39cnutkPkAdkCJyf
 UG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+Vp7PCJgIRKIEMBm3mLYg2gfZhdkwYbxMZPEhx6JvM=;
 b=Do16/4tsvw8z7Yw5zaFfOJTEtFwFVCRV0rTZ+sHgW1fz2VpLy8ewnBQD1fvJmNzzj9
 +s1RT6ZpdqWjuyNhUke8cDA/+PUVa+LqOQDFyDQoWIi1aGTJZf7jGd2oK2peTAGPYvg8
 Q7xG8ziiniHGmIRaP14AxBQPTCRsJdXt2QHJBgCAUJt47IpGXjRgeCMnkbwACSPxkoS8
 4o3sr5nZH9tT3DBmFZg939MbNcp76mh9GvRimNVYV3MaQODxT1RITNEoubDO1kOlP8KJ
 WgR5s+/t87oXOIUqfqtzdR3QIBXC4pbSPYzOSBOPSPnZ259i+M61dhn0U+a5jW3Jd9fo
 0qtA==
X-Gm-Message-State: AOAM531Cuz5vzjVVdmpiB50QpU0+so0+W+yNylyjLkzx4I7+zNZFajOe
 AGD8F7L+1vRDp6tCHJ02HWwysqhJETFsAA==
X-Google-Smtp-Source: ABdhPJxz119bKox5wOLULD1OR8Ha/aVigbi6JNasfeoeif4zbKwBfV472Mz9Ra2ML+bYC/OsKpSEhQ==
X-Received: by 2002:a63:d14b:: with SMTP id c11mr15938821pgj.162.1621904851062; 
 Mon, 24 May 2021 18:07:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 51/92] target/arm: Split out formats for 2 vectors + 1 index
Date: Mon, 24 May 2021 18:03:17 -0700
Message-Id: <20210525010358.152808-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently only used by FMUL, but will shortly be used more.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04ef38f148..a504b55dad 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,12 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by N-bit index
+@rrx_3          ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19
+@rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
+@rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +799,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 0. 1 ..... 001000 ..... .....   @rrx_3 esz=1
+FMUL_zzx        01100100 10 1 ..... 001000 ..... .....   @rrx_2 esz=2
+FMUL_zzx        01100100 11 1 ..... 001000 ..... .....   @rrx_1 esz=3
 
 ### SVE FP Fast Reduction Group
 
-- 
2.25.1


