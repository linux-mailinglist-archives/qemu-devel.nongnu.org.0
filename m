Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C773629FB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:13:52 +0200 (CEST)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVmg-0001Fa-Pb
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcM-0004LM-1u
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcG-0001AW-Jz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:09 -0400
Received: by mail-pj1-x102e.google.com with SMTP id u11so11009943pjr.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=kOd/CTO5zXQ4xCyhMCXXbMP32T39BI/fF9VisOt/gxNDXGVIqPcVXSiRXyvTU3Xwkz
 g3yzSU3QpNTRXWKUPV6b6IXk9UPvlyrF4MuTw4bfdojODoD7+BqQQ0F6Y0QeBx3tlo8Y
 lroNMS1cZpOkCH3iGD2PrsvOU4jscIiSsTVpcxPWeoBDVyEVS5DYB2KpXGSvTtjqrBHo
 u76AUkcvZoR5BN6FRTObPy34fCNfTPW5l5VNgAYfgr6pb1VmSh/P1Vm5/kcUlmyxX18e
 6jzvrlOHOc6SiLzbPCapQWRI1Q6RXtvVX1uCHHtm5YRQRei/vB0JOAOCcgeyIJlnZaDE
 BS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=IPHbeNNoliW/4rx101t9qQIbV6waAEh4We/NGHEBDYXRAxKUMAbKIeeHyfqbd1eXwj
 0tO/Rsm0xitRK0qe7x7D6L797gznuaj3Fw6QN/jSFd4cWne91p7nhK/skms4Ewi2izHY
 HnjMmHXOC99lrI/JjjgIiWj+i573gE79L71+lkK9l7YqcryfZo1gTA0akoOSqW3VW2cA
 Dgf7HKH8/doUGvExBz3WCFHwl5BaIbhmaJwsFQqECkwJKFEm97JonrATh8A4DlmnGgHR
 RgUdz+dEjpYuuH2tFeJe9IqVn6IW6+WhSRFbhTU0i8OsDqVdoEpdkHZO8aZdVwS+mNBN
 z23Q==
X-Gm-Message-State: AOAM530ikU9GGDOjUVKQDH+8qUJ3DOXI3YRCI3GysoCVnNy/cFo0xIM7
 3F8Sr6pdX3Ubi+tuOqxE7AifmL8PUhsKOA==
X-Google-Smtp-Source: ABdhPJz/zEQLy36uRNUj8+ozed8nt+xXFYBH1w0HKa5fN611+pCqonzNlRk1h5W2WibmFiY9xtI67g==
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id
 b13-20020a170902b60db02900e607a907f4mr11498703pls.3.1618606983272; 
 Fri, 16 Apr 2021 14:03:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/81] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Fri, 16 Apr 2021 14:01:40 -0700
Message-Id: <20210416210240.1591291-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 79046d81e3..d3c4ec6dd1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f5e39b741..c11074cccc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6394,3 +6394,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ursra);
+}
-- 
2.25.1


