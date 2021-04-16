Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD4362A78
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:41:12 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWD9-0001Xj-UA
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdX-0005mn-Bz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:23 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdF-0001ha-86
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c17so19147539pfn.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfpadBU7KlY8uj8mgdV4cd4GjWhl0iserVzzK3wcZFQ=;
 b=kg7MgVoCdIUtkq831P9sBFKCsyxYC8F8ifW7uLgIrYew/4gXVD6iMtSessLGWZr+PQ
 L8N30RdkLoszL2Ei82Yb9I/SwkE3EUlMwMjH+yDRvDKsvyAk2lcXeKRGm02VQ0FbUZoG
 vI4iqDHOdP9Pa3UVwHe01SMzvLtWjTeaAHYng6fbJ4MXJ0mGCQTIRYKlXhtNBO648fH5
 /IL6M5BL65/AFrFYrAul0rKlM9q5xwiY48I+EejbShLbfgv8+wkSUWWwyZOE4NhD0xpG
 GE2D8NGm5NdpF3bFrytlDDzVw52JavPMnAS8cTM/nvkkZCF1/bmdrspWucj5tDl9sUuP
 5/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfpadBU7KlY8uj8mgdV4cd4GjWhl0iserVzzK3wcZFQ=;
 b=S74TANyeq90pPGfD2aqvfpTySLyp17PLqtY2oifL9LKoIXA07y6QUAvzTAcJDaNVHx
 SvI6pd6LccAEKsg/zmQfdo00PkqcKgF+PI6RTAgCJXRl10sRNG8EiwOROAvxqJrF3N+9
 4Xqt8+AbSI4SyfZFoUiu9PqddHEG+rGNQMUlhXfQa+zQ2ATyaEZbkZdfLsPQHYqAGPRV
 7a5scyX2azHy2Ve4u5sd9IGyjxpEBElXsI4IbJoc3Qe5BszsxKixsIOZbdG+wORlRTIK
 VB7l7K1c/ib3UTPzinY1+8Q0eZNtDiaeL92d61DpYyyJnenfhZzuzTV40EN/e/tB9iNZ
 qsnw==
X-Gm-Message-State: AOAM530Jn+GF3dPW3MLRL8jlX7R8AuAmIZ7spcTfDcfoh07XrAyerawb
 tXxcykPu6CY1tkxsIvsMPF88PmoyekruWA==
X-Google-Smtp-Source: ABdhPJxVEjkI484dDoe/1E8Dalcoc3xSESxruFAPVGDdCX6vyghybhFD85rGTERlvm4qnbfpCS3Dbw==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr9275949pfr.76.1618607042027; 
 Fri, 16 Apr 2021 14:04:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 50/81] target/arm: Split out formats for 2 vectors + 1 index
Date: Fri, 16 Apr 2021 14:02:09 -0700
Message-Id: <20210416210240.1591291-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Currently only used by FMUL, but will shortly be used more.

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


