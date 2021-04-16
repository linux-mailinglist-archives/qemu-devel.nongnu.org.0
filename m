Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294136287C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:17:35 +0200 (CEST)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTyA-0000BR-Gr
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi8-00044O-J2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThd-0004U2-Qb
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h20so14482894plr.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=Pp5wJJdbpbNTuPzihsrXk7K5ywC9Lg5xHWPIeXFcBGdpjJITw6xMFnc9JwDIpISafI
 eMxHdZCxKMKD2nTj4XDHtjF5bL8H+AnDIryf73T7oqvcCykFP9F++2fyIy3kMURaz3TK
 LRo8XOLtuMunRNuq9/I/Xl31HQnm0ql7gCaj4O+JiI1HPd04JK9PEQpskI8den5xLLI5
 dghhQgyGTjn3IpnW3cJU0Z7vHhr5uuAI9L+uSzT/qsZfeLSTacZyrAOHgOLCxiupYSC5
 UFw/xYxxlb3h32Hw8eokLL5XWtN/qSSd3+U+yQ8thnUHjdjJVtfZebD/I9VxzzeiXXiV
 ao4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=R4VQa5J8m36ytOlcUTFsWh8ZLEkdnXlZ0EN+vvmhaO5lps6SqHBK760mXIYSx1IUJz
 /CM0nUKgwIaOwBIRhqSjQVyJTk7jQiSeS3rsG2fupPA1GEdk771BX0mvlwCTQDjJs/uM
 OTh3mWW+RQMtTco/mVAlYVew4vhImUIokeT2BuqC0nRMIDSyQwEvXv4s/7vFh331kb8z
 LYFP3txgWVeSv9juzbThL2V6w6/58N1z7N2HBDNA/I8pmYz5CFt6zteFSlDPXqqAYanW
 yJT2aTBYNWs2FQFwDEs/u7YJCJOMZCSvmX/n/krE+3AKtRvvPzZvvWfMq8QNZaunqxgQ
 f3gg==
X-Gm-Message-State: AOAM532hdWnFYAQ4wvreIUQdUdrrPBhjdMzqOvb6SosrENuHmOOmncRp
 qWoWh65tLxSTOETpxA46oSLrUryxUfzVUQ==
X-Google-Smtp-Source: ABdhPJyXSpcDatF+8HrqmWG3xCidR6Cq9H1pQhh1n7rwm4hgqq8+Czu+8US4G17EdAPOUW3u476Ifg==
X-Received: by 2002:a17:90b:14c4:: with SMTP id
 jz4mr10456007pjb.144.1618599628524; 
 Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
Date: Fri, 16 Apr 2021 11:59:57 -0700
Message-Id: <20210416185959.1520974-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3bda16ecd..2a82dbbd6d 100644
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
2.25.1


