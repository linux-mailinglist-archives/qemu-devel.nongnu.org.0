Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A949438F780
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:25:59 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLpW-0006vC-Mn
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUs-0001un-Ty
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUT-0001nU-Vu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:38 -0400
Received: by mail-pl1-x631.google.com with SMTP id s4so13948131plg.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDzHPQFAAp6LPiIxIvoRlgxRhbX+S5BFcnVxxG6PSRM=;
 b=jZx2RhZKK3RCYO4IipBfvR1L3pP83zinh2Y287RKOvG5oInrda1EhpgCZ9i3ClIBHf
 3mDpbCpvDIj4jBvKl4RNYU62OSzzZl6gXuk6TrLtRC8ulSykSJtvmQj8zWLoyLCH0Nhp
 o9KfsjAt5iCP7LBxz8+Rcf3XnOPFY2gMBLz5dTr934PM5ZMBHjY0ashXN6yAynPZvD1V
 Zn5lamWptrkIntQoqbuYTc7UcYC2wfWbmgiG10snHLoPP7clF70mnCC/gdyMYO0Y2tTv
 2qM9/i1EkOkqjqzpTZ1SplBtQs8ZmMxQWw6EhD0JDcHzOpPiSe2c5SobKzhg5ZxBNlzc
 JzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDzHPQFAAp6LPiIxIvoRlgxRhbX+S5BFcnVxxG6PSRM=;
 b=k+5vBWVc3c9nmsj2q5JWnDtN+RLF+mBYDCOirhCy7nkQ+xR7vHSQ/50g4zsrqe3x9d
 1x7z7hKxRyNXhSQX/saFzswZ/0pjbP5psnJJ1tx9DvoGN41vNcyjYgl8B8iCcbutRelM
 nKruU52DuvL94CCqO/GQAZLPLwPcAo+lgUBn5yv+DvUfLkmfR4q0trbgCJfZCp2pk2R1
 z5Yc//iMluoSIWOAEJNuR7t9rcNgQr5Zj/EH/Pk5d937aGHpsDVh+SUkIS2mg88pOeIJ
 HG8w1f7NH5sdepv33RPJG6C3Gl4ZdvAbSZZmWdzBnuHnr4TKFBX2gssZlBDa+Qj6cbA/
 yRCw==
X-Gm-Message-State: AOAM530Iz8qHQPV3QN5HtX+r54kUFpWk8vEx4ju+853p0MidIbpjZML6
 tcZeeKV554mP8VM66Wh5BXqp1UZkdVbahw==
X-Google-Smtp-Source: ABdhPJx67nZW5cckjOwkTl0iFfp5dEmPjrkf+QDXzWtlIQH53P7Og1XIHoaAjd1H+qzVs2Iotuxdrg==
X-Received: by 2002:a17:902:db01:b029:f6:4a13:1764 with SMTP id
 m1-20020a170902db01b02900f64a131764mr24201024plx.25.1621904652580; 
 Mon, 24 May 2021 18:04:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/92] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Mon, 24 May 2021 18:02:47 -0700
Message-Id: <20210525010358.152808-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index cf4fa50ad2..1f93b1e3fe 100644
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


