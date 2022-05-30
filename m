Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F665386DC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:41:12 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjOA-0006Uj-P5
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwV-0003yl-Q5
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:32 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwS-0007Qy-0a
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6726064wmp.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N7dS28ODWWgUWcDQHKDWdPICO+TR3n4iZCzHtMO59e4=;
 b=Ax+ZEDwErrDy6Z+rFC3J5/wSWdEOhadDgItfNuBlsSAz2CLxHIbZqG8ISf84fl7rfS
 TswPoeqONfolL00CTG2mjgA3LLzjc619Rim/H4NivrvjXrlht/GoSiJPYzRCEJY0KAst
 xyWyN6lvDMTr/2U35iuh4dasxNcNNb0Yq9c31BGMiP3U9CZ4uiyvjOgKVCbqwUIlsIl6
 UazKGz6hemmOGVRO9janm4BCUg5SBwicrhvZJfZoWcal5gMOKgKhh0CZT5nMs66Egmi5
 7HjdGPhdOO2NpMv5E67v37wySy9ik1pMLBWQHm7+0dvREpG/vltW0cRIsuz0l9jkQT41
 UJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7dS28ODWWgUWcDQHKDWdPICO+TR3n4iZCzHtMO59e4=;
 b=cD1caz5kWo2GznyIfIV/Jdow/fc8xk2Yf61v0ua6RRfP2Avm4XZkqpDaGqWBDcDqO6
 5lkIcRDNxEbGmxlETcCg2bYwvG5cmRXdQche/ggswW2y6PrS89499O6MbO7DlFEs537+
 GG9Rwzb0dJjXdvmmxCYDTCtWS7kzrpQGJTdpr/FykImQCH4DF+nXY+Vm5rBCewfY6etl
 gZGU3+3mu5vzQzSgM8zmXlpFViA/0oNtgYFMa928Dq/Ma7oA4IIFTZIw9OpdfYX2gp46
 IvqEvJprw8+gR4NY+2dLRlVnMbtTj+CwQAu7DjXXjMIAjwlDB/sBEu9WGeVTrkhYAPQP
 PIUQ==
X-Gm-Message-State: AOAM532qLmMLd0srPCXDPt3St5V1mTVPeea65YZg/MspRNgXM7hHDhFH
 6gidI8QFqOpdNC21Lwjg7cjPqgww2BxnIQ==
X-Google-Smtp-Source: ABdhPJx2UD5uOT7uoiYpICyMgyA6Zg+CryF8vqzKBn16/36+NF0jy4r0tkIh6kQl3fQiJSgKo6YTOA==
X-Received: by 2002:a7b:c1d9:0:b0:397:335d:4d9f with SMTP id
 a25-20020a7bc1d9000000b00397335d4d9fmr20043315wmj.55.1653926906357; 
 Mon, 30 May 2022 09:08:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 083/117] target/arm: Implement NOT (prediates) alias
Date: Mon, 30 May 2022 17:06:34 +0100
Message-Id: <20220530160708.726466-84-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This alias is defined on EOR (prediates).  While the
same operation could be performed with NAND or NOR,
only bother with the official alias.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-81-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f33bc9d480b..b6b5980e2db 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1381,6 +1381,11 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_eor_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    /* Alias NOT (predicate) is EOR Pd.B, Pg/Z, Pn.B, Pg.B */
+    if (!a->s && a->pg == a->rm) {
+        return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->pg, a->rn);
+    }
     return do_pppp_flags(s, a, &op);
 }
 
-- 
2.25.1


