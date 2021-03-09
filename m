Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD46332C2F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:35:15 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfKB-0001i6-UM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefc-0004pF-1W
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:16 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefZ-0001EP-IZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:15 -0500
Received: by mail-oi1-x234.google.com with SMTP id u198so10471317oia.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fn7JFzlpxJDHE/tSppCZQRf4vgj66IW9pBItwWFchwo=;
 b=p4hX0qCTFxOOwJM62HuHkgnmsY80aAwzez3f5QmrBkJvHJcyBnW3OZVWMEAGI3iKuY
 ZsqoY9c09tdozB+0vIhulRABjYtVk+QcxlWdCTea7j9VQVBorxKAo+uoDQXAKmyYs6Tw
 7Z4PWt1TTlGe8oRifiJoaBCste59LiI/mgiRqn80yH7vJ8lwF63764oOERhjJoUu70fL
 rXWtlMjiXUUpi7DKJYSamTP3ArM5u+ntSFeSs3vNj2TuxcqE8EsN1yXhgnnTtNFGOIDK
 ZQt9qRbGyg+5PTW81Ty7zbTHjdXy/o6N/2ejO2I+QLWhsKZ6zYAtaHAGboA6UblcTH2z
 ym8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fn7JFzlpxJDHE/tSppCZQRf4vgj66IW9pBItwWFchwo=;
 b=d6y2BsGO5ShKD9UFaN9bT4NoX6142TszNRjbpeNRCNsxGLq4vi3hhY2+Tnh6AM/QQA
 /jdrj12Lg9owUrvDD60hcGrx7QBgwEIFXolE/S3R4i7hIzBb9pftT52To72HcakPA0RA
 jaTNBonq5QvO7eEGCSb66KDP+eFv1uB8jqlu/huUHaqDhXBwW8OMzdX6D6Cd0gCys7LZ
 3JCKJCVame92MmczwfJzx9KQUDcmPy7YyawGT0mY9JO/02ytweseWCknPd859wbeWjzQ
 IWsXqbRyATgmIMQeyCtayN1mEpMLSuvrFPP9rYkYb/jo8vOn/0Y6cNH6QFyf8U73Hdih
 hP2A==
X-Gm-Message-State: AOAM530+1WHW5EtG/qjU7bsxV9Hu8RasG5urzKT890hacy4KFvZ79Lch
 lFzggJFj0DcCL8JE8RjRPkULEGz9mEg66nbt
X-Google-Smtp-Source: ABdhPJx10whY1aelml2lhqnysuuAV03Mfo44j4ftun5M6NREQrLaFzoXAuLLkDBq4+Y/mJcnV17osA==
X-Received: by 2002:aca:f597:: with SMTP id t145mr3397980oih.121.1615305192538; 
 Tue, 09 Mar 2021 07:53:12 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/8] target/arm: Update find_last_active for PREDDESC
Date: Tue,  9 Mar 2021 07:53:01 -0800
Message-Id: <20210309155305.11301-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 981895a17c..224c767944 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2237,10 +2237,10 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
  */
 int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
 
-    return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
+    return last_active_element(vg, words, esz);
 }
 
 void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27402af23c..cac8082156 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2302,11 +2302,10 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
      */
     TCGv_ptr t_p = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    unsigned vsz = pred_full_reg_size(s);
-    unsigned desc;
+    unsigned desc = 0;
 
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
     tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
     t_desc = tcg_const_i32(desc);
-- 
2.25.1


