Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF366A2811
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQC-00018X-KN; Sat, 25 Feb 2023 04:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPb-0000RI-DM
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPY-0004op-5D
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so7846646pjn.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=UUbBaTgP+0WbtCPxoK/fz6ywuwuJEgq3mcAcWqU4pKQ1aMZkS9Q2FsSvnRr5V8ujIM
 jh23C3g4Al1Hw///NcFLTC/A4tR1NrSmtigJbQnPqrrdLF6oRAhxSgGkcXeldl63+65a
 SyufjzKHGiIkFE71XyMHt/WHBXTNn/GeobTv6AXuPSeds7vkfqZPRbT07HJj/55uPHoP
 6vubtsnnYUaWSpZRQ6GWe/FL7wt03bQMQb9jT/3mTAo4Em9icI0tljpnWtOPLiX+ftlx
 z6jj4dR2SBxGGPv3+lfdsaRYjJ4GD/6XIjMxEf4fCXNBGPE1XbKjK69dplbboeILIjXq
 Oriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=Jzz/RSx76b1kBnrulxXtY9p2LMalMP3L/OGotPP2vOBngEME0WkZzEt26nL1j0+Q6Q
 /u7ruvLATJxUjkaffWm391lb2cNCDVVAdWEv4/w39LkP7NHMoHftUHufEpM+rDckGzhk
 LF9Yz/Mz3SjpK58OmgDL4ymzjOnUibv3GpK19TarScOHdju6e+EsgGclYF14keJVv71j
 YqrcErW5A+qkgkXFFVjTL36FIJ++l2W9K74cWQVRjw8HRsQrkLGwyEpQXpCrw8p53cfG
 uWuMNbpejy/KIEee2smDngf6AMtwqkCHhoV7waM6SfuLbwrkN1EU+8obHFr9Y0VjWIET
 pJBQ==
X-Gm-Message-State: AO0yUKW9MLJ0aNI7dVHOVSOpkGUW/q8Y4tilwhggOMtvK27+8PjYWw5L
 yrTHU3RYLUUym12982X0mXQOeTT9V9kf0BmyuJ4=
X-Google-Smtp-Source: AK7set+4CWAWNb/bX1Oi4/xqeOIkvJuUKi+aslpY8Nw3qoAxyDq4jXs/ht0AQS9SF0WgJWsXYg4Fqg==
X-Received: by 2002:a05:6a20:9382:b0:cc:7faa:ae10 with SMTP id
 x2-20020a056a20938200b000cc7faaae10mr5089197pzh.54.1677315607297; 
 Sat, 25 Feb 2023 01:00:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/30] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Fri, 24 Feb 2023 22:59:27 -1000
Message-Id: <20230225085945.1798188-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d896bcbf4..0c2041bcf7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -892,6 +892,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -911,6 +918,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -923,6 +937,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -942,6 +963,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1


