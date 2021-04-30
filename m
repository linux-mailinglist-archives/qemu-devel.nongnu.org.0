Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D986636F8B4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:54:35 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQn4-0005YF-WA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUU-0007uN-Om
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUG-0001PT-Rk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z6so8707347wrm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GWTmkHcg1lj0lJMlmsVGKQ2xkh2uHeIaya8Gpbk3GKs=;
 b=EReAoqZC6lt8CJHRuUUf1NWo/TYjIe9zvTxtqHhkh+vvxIKvcdUNS6au/wfoRGX4Dk
 ApbD/c06VoGQFVDcNjLNqGk9DtatDK2Mx5myFUmrnpBi5rPOe+tlD2J2SEQR0iT6D5QI
 tIPtIYyr/lHctdb7FUP3xEf6c48sIqVdf9bGBeph4NTrMLmEx1zcG/VUF8RhFYvbS5nD
 vcGcAyahv3Ayqc88CalIyTCCpb9KOxW1+zJ88qIHKoxx7QGJSfl/CaZHf9IDiUPfVs6F
 9S+2gxQah2FrNGz8hslZ/ib8B73jXz+vigFoTJXCLthLbSNnPbn3PormiikM9dvFESnf
 OthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWTmkHcg1lj0lJMlmsVGKQ2xkh2uHeIaya8Gpbk3GKs=;
 b=uUIlcpuWVihNbPDICqb7DXauChg8QWx+eUXXAoUIxsaoUZ5ScZBs0OxvXu6gfW1q3c
 WeLkDXBCT1J9WRFdu2EWC8IIZPUYinh6BU8C+jL2Tkz+gBT/+deyXIARG9pG8AxbSf8y
 wrX5QU1P/XNIe7eK/wOf9eZWLt4vjFcu9H59Y673inN+ajgHsTuxJNnbG3kpik6VG02G
 14AEqALW8Fe6sYzDLg15IPnBEr06YCFc3/Ho1TMmfiqH5AfEkCXA1CyLema9Ou7l2fCN
 EplYCrG9K/hx+S2jrCXGUiDFcJI3fak6b55JdjIXFe10xgitU5/XADl5KTVz7cyPg53Z
 S5jg==
X-Gm-Message-State: AOAM530eghiMQ87fXJATf3U1gUPWmdyB1Qs25x/Ska/FA7XnGKHiGAWN
 4ydZwj7ap14h+QU0Rt7hqZ8ulYA8KKzCOVSC
X-Google-Smtp-Source: ABdhPJzxHkBWe6gaUdRLEdAGwIw1wWH/3Atcfh4wKmu8xd0ByAS3Tzx1RlFxMzBvhWarCMPZ0llHlg==
X-Received: by 2002:adf:f6c5:: with SMTP id y5mr6012652wrp.121.1619778907488; 
 Fri, 30 Apr 2021 03:35:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/43] target/arm: Enforce alignment for aa64 vector LDn/STn
 (multiple)
Date: Fri, 30 Apr 2021 11:34:33 +0100
Message-Id: <20210430103437.4140-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3bda16ecd8..2a82dbbd6d4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3635,7 +3635,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     bool is_postidx = extract32(insn, 23, 1);
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    MemOp endian = s->be_data;
+    MemOp endian, align, mop;
 
     int total;    /* total bytes */
     int elements; /* elements per vector */
@@ -3703,6 +3703,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
@@ -3721,11 +3722,17 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
+    align = MO_ALIGN;
     if (selem == 1 && endian == MO_LE) {
+        align = pow2_align(size);
         size = 3;
     }
-    elements = (is_q ? 16 : 8) >> size;
+    if (!s->align_mem) {
+        align = 0;
+    }
+    mop = endian | size | align;
 
+    elements = (is_q ? 16 : 8) >> size;
     tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
@@ -3734,9 +3741,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size | endian);
+                    do_vec_st(s, tt, e, clean_addr, mop);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size | endian);
+                    do_vec_ld(s, tt, e, clean_addr, mop);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
-- 
2.20.1


