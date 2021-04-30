Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FC36F8FD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:15:46 +0200 (CEST)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR7Z-0002QV-5E
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUY-0007xY-1H
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUG-0001Or-Qk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1383829wmi.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D3uXZ1Lv9wdZkoCGMm11ul94vVgk78JO1zl8fYDSF30=;
 b=IP682qKw+2uKwDTIzWghUmGltexledCUfPKLnmvZn9EUnI6M0k6v7kkvQs4HfTPeiP
 qYyFeAnpv8ZX3ZUhkkCTsjO4IABaq2hin3R2UiSpkbgYaYyaBZMzc8peDty9Qu/1WDbM
 ccRe/QEFWDsdgC+gK2owu1CTTP+uDHvzbFe0aUpVVjxVIxU1Ye9jEPn/PROfrhDsvz47
 kgZIguAbwyhOh/Q3EVXveQoyrFifsgY6wbTxagU3QeAGXZ6eGbJ7ZkrIXbtI9mYW6POZ
 JrKGmOoP5FE8FwUXErWLN8v78I85BeHPW2ID77XyhdgsydUCgWUgLHUl99o/MTsmkqA9
 k4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3uXZ1Lv9wdZkoCGMm11ul94vVgk78JO1zl8fYDSF30=;
 b=oZ4VuzY+HOc5RXR5mB8u2k2hoxn7TB1ioVPrcmaJBqFGWxojyxaGlEplOeengzVG6o
 Xdx7UqdX2i4yWTS/4+zwGRxcGNhD58Ufapdm5q2lb5oAL7hROp9Sijr+rRKG0gNuyHnd
 NHSy46P6nY1x1Z4CK8S/plExfzjAAD8OGtdf3BrocOVBgwjUs+AWY2FmackHQMKS6+10
 e/6KaBfyUzpneUeJ2M7nDkv7XRGF1K591D+1GkG5cUo6NYg9vt45oyXipBbCNuRDgNfd
 ITUC+a69ayY1DEklVckjP8hjG9gMJqQzrpr8cIgcX1WvUMrnapmQlgRoGxUK7uQKAM1y
 2m8Q==
X-Gm-Message-State: AOAM5329nzcw0AS4OKlOde5aXpav07RnKXSZjTsUJFQGkIT+g4a6hSTJ
 lwNwPfHWLCVH221uj/6dl1/gJY/PgND9pvCv
X-Google-Smtp-Source: ABdhPJzDwo5amkmNJToE6YaUUEaCvvyN17Se7SvgM0bd2VDU4LXL7NkfLWs6MSV53NfIrEPOYrZIsw==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14mr5552920wmb.4.1619778906837;
 Fri, 30 Apr 2021 03:35:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/43] target/arm: Use MemOp for size + endian in aa64 vector
 ld/st
Date: Fri, 30 Apr 2021 11:34:32 +0100
Message-Id: <20210430103437.4140-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Message-id: 20210419202257.161730-29-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ac60dcf7602..d3bda16ecd8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1146,24 +1146,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    read_vec_element(s, tcg_tmp, srcidx, element, size);
-    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
+    read_vec_element(s, tcg_tmp, srcidx, element, mop & MO_SIZE);
+    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
 
     tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Load from memory to vector register */
 static void do_vec_ld(DisasContext *s, int destidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
-    write_vec_element(s, tcg_tmp, destidx, element, size);
+    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
+    write_vec_element(s, tcg_tmp, destidx, element, mop & MO_SIZE);
 
     tcg_temp_free_i64(tcg_tmp);
 }
@@ -3734,9 +3734,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size, endian);
+                    do_vec_st(s, tt, e, clean_addr, size | endian);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size, endian);
+                    do_vec_ld(s, tt, e, clean_addr, size | endian);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
@@ -3885,9 +3885,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.20.1


