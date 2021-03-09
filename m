Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4A332D69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:39:39 +0100 (CET)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgKY-0000tr-4t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6x-0007Ok-5D
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:32 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6Z-0002TS-SQ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:29 -0500
Received: by mail-oi1-x233.google.com with SMTP id w195so8891355oif.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFif56JV+fTnJ9XuXaPYxfPPOlJI5WKkI90jCx4L/Os=;
 b=npnOlkSC9RW5z868zDrdc4wPYr69gdikOhINi9glBWFpsBhMhihFDvJ7uwhiPI0coK
 y89uzWd+LobqKxlzdQuEpMIVV/L0Vtkf/CvhiGAGq84E2jmtXRNRJnxhxkLRrwmQX+3y
 zgCdoQJNSDEHq+zUBEyYlc2dk1oYmLf0npmYBXh+idCl5AO9ZyA+7au76HCkdCjxRDBQ
 bfg7W5NmWfCmlfAOpF06e0Mu9XXIch+Fgq2L3wdvvalrf4A8bGsRc9xLa4RoGhK7U0pp
 3CxM7pWQ06vesdrS8o6KWd8xnOZxyiQwzu5fe3OTSdW0ztKe8KsjiJn/+v7SmSulBIM/
 RXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFif56JV+fTnJ9XuXaPYxfPPOlJI5WKkI90jCx4L/Os=;
 b=fR+tBNUElxO+S1V3LHLMR20hyuccCEy9jYUu8P8hfqlN4ToojYmmXVEL7ZN38ZQ91y
 VgDgcFRdRjqRJHdBTKwQc5M+GzIMqFrvnZCaDaoVlsKUFIek8dpQ6GEyVwU8XfN5srFH
 xd6iWdy6UwtU9XooV4iVBWuzya2QSKcm7W2/ulc/iM+4dUcSNWoj4ta+ppOKRybcJoNv
 G0fAHIX8XnPyW6UIoWbDv2VGfoqz/YrEIZ4AjAteCjbaEfrWXacvjVLb9A82Oy3/dOJa
 iiKtpDe3MJHDmUFu5b/2TpRW4cNkCOkBwfqdsO+vRct1wvfs7hc3gYsg1cUjmB3u1yUZ
 o8FA==
X-Gm-Message-State: AOAM532uNhu5RG66H7+qkYo8MO6M00+huS22xFyqNpP4stqFc/8p9vXs
 Q1FkmybdMuPl3AcvaBPVgPSWYHM5S0Wp4P+g
X-Google-Smtp-Source: ABdhPJxxZR5IIsHbYg6UKMzswDKKh9YaTY9wOuMFZN26tb8wS2a1U7kzf+X3DSXLHxFtFhraX3w7LA==
X-Received: by 2002:aca:acc2:: with SMTP id v185mr3383689oie.28.1615306866788; 
 Tue, 09 Mar 2021 08:21:06 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/78] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Tue,  9 Mar 2021 08:19:44 -0800
Message-Id: <20210309162041.23124-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
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
index 92420d3ec7..bd4d6f1a69 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6395,3 +6395,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
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


