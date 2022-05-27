Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74D5367E2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:06:28 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugE7-00050s-KE
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0001hX-Tx
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefL-0005Hz-DJ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cv10so5270616pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHeO17YCPFCpt+rKLCOncNDfCYaqscqX/LTqWwqXD8U=;
 b=e6B6ohCSkq72mZtoYRcu7l3RQg2jGpHEjDmc03NTs+BooOJ3Fv4VqP3HarwMOjOK8+
 1cdzwe3S7ZHzfDoaFXlidJ43aj9udAKvK/81gBbbf1cSBkn0HD5glaVPpba/MeP7NWks
 B1w2vOJfR0fbpUQA0SNuIArxOUOCAWhaF8v2bw7ywDlqpQ3HCi+Yv2qg4MuYMexFWAgz
 GrEMJldZxW9W3NwwH9x0UjVnF1wjrSvKMi1EtBK/1K6rnQIWMH0RiYGBDmo7QsmGNkfC
 YDklGxlW1ckpiBKMNEWftfsRdkQplNFbKePWSR020xHksuVInCJ6j3cp+Fjf67MlHses
 kTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHeO17YCPFCpt+rKLCOncNDfCYaqscqX/LTqWwqXD8U=;
 b=WzOpDFeThotJLTv7uBX6zlNaaQTjtay0w3kA0cxopzNL+S8xbHSpTlnr94+kuWg+g2
 VQU87JulaDN2WaDqFPchcu7xVn4064JKkEPe2HApEqmDZ2zQrka38cHi+zVBXgx9hUDg
 ZK4sNLuEgJNfTV74EYb9ul+irBFoI/BZrTcPwpuTHqSTT/W7oKS40RYwzRJbPn88+HUy
 owgUR1sCAbfi/jtkFeVCV4Ox/ihVUwa63VIqy2EUAS/a9tLB3uid1Ketg1IGCixATEXc
 +BK25druFYa2Ockcd93CqnU4krb7/bLQhfiTZ0Req9cIT8w3Aez6bjSeMsRilr9AIUwT
 IXJw==
X-Gm-Message-State: AOAM533Kr3EElxe+HGqPAEtURbC2GXnTlTnghLf2gRzTndFzueQeuhHW
 5awRWACSaN42HKg+JJ4w4kKbS01SxfmMuA==
X-Google-Smtp-Source: ABdhPJxAEUuVTujwgj76FmXD4ZLbpIyHmqeA/wB18B66gD11cxEKcd22ZI/1iZwgTdBucsNDUQBpJA==
X-Received: by 2002:a17:902:e54f:b0:162:15d5:fcf7 with SMTP id
 n15-20020a170902e54f00b0016215d5fcf7mr28958449plf.38.1653675985995; 
 Fri, 27 May 2022 11:26:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 083/114] target/arm: Use TRANS_FEAT for FMLA
Date: Fri, 27 May 2022 11:18:36 -0700
Message-Id: <20220527181907.189259-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6e8d8d54bf..5aa3e477cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3521,15 +3521,8 @@ static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, false);
-}
-
-static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, true);
-}
+TRANS_FEAT(FMLA_zzxz, aa64_sve, do_FMLA_zzxz, a, false)
+TRANS_FEAT(FMLS_zzxz, aa64_sve, do_FMLA_zzxz, a, true)
 
 /*
  *** SVE Floating Point Multiply Indexed Group
-- 
2.34.1


