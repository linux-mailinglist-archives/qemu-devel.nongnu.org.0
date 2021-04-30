Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71C3702DA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:16:50 +0200 (CEST)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaVF-0000wG-8l
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmK-0004VQ-Eu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:24 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007hU-AD
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:24 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h20so37235677plr.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bn7hUPo4Fn4gj8R8dHIFe5YgNO7lh3cxv0iB6D6VY7Q=;
 b=Li5SAExOXC1Tq8T0hs1GZHOMpUjWqgmuU/z1uDiOM+DwNbiiEShCeUxO2YuQRH3P0q
 UN/Yz9Mc4uG836Nd361Zo4/uwpALV6VaBqEhhlxBti/Txbtoax2osSx+AAJuRN9mTz9v
 SI5ZXCLa3OcXHfJv+0oBZIeFD9l/SzHjFF5jlwrRh2SxkA5Y6E1MfBsGO8gijOMM2AQx
 DIrOU6SCNaSxKawGttnVlwnyqsYw+q91MX35u8DOVovQcOfEVz37ko4xKeq+WubFsLdp
 nvRlG7hhwK2ezNw89YtUm307AGpp/MyPcpzfCZD55XkZyFJOlwTDsVIqaaoLPgBTNlrF
 I/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bn7hUPo4Fn4gj8R8dHIFe5YgNO7lh3cxv0iB6D6VY7Q=;
 b=A1JEi2U2Vugg594xRWzbS0G1UUs89RI78WL15fkRdqwbSAsEPnEAbtEGxQ4EfPvc5d
 xnJFCfoebBh1hKPeNfnRX5QiOQGbTgH9zQIVTjejigcJHeJN5qumlEYlp6sH6nqfeYXJ
 lQOe3Zi32c/2pLtUOxQX2eOeaiZOfls/f3FXOVyQIDG1SqVHuHxXDdi8W3kBYaOnuEg9
 cZaT4WEaQtzJLdIkN9z5g24tOTz28MwJRXbwv4kdSrg8dEZjp+9mqsKCZ5TJPGks625E
 L48/tvhNsl1+hZ74kjzl6bG3Vum60pIOschz4J6gEfCzqTfUglwPm+hnWOri2Ip1SFk6
 jyng==
X-Gm-Message-State: AOAM530BmJwV3xgh7Hn1XSfpcWQ7ZdVkNpLq6SimaJykv97xBjopgnuc
 p3M7vI6I/U3b8KZYCLMk16RynX3LR/hoYQ==
X-Google-Smtp-Source: ABdhPJyth42XIl+ylEmJ4X+kblc9xdlE/UPKiCdNDrVxv1y+gwRMe8q2jrbu9u49UXpGa5W0kZUihA==
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr6759819pjh.97.1619814579416; 
 Fri, 30 Apr 2021 13:29:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 45/82] target/arm: Implement SVE2 gather load insns
Date: Fri, 30 Apr 2021 13:25:33 -0700
Message-Id: <20210430202610.1136687-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d2..c3958bed6a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0356b6a124..a74c15b23f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6015,6 +6015,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LD1_zprz(s, a);
+}
+
 /* Indexed by [mte][be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
     { /* MTE Inactive */
-- 
2.25.1


