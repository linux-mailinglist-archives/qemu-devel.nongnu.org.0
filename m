Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E12D3207
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:22:44 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhdL-0001VD-9e
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJK-0008D3-UA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:03 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJH-0006QJ-9P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:02 -0500
Received: by mail-oi1-x243.google.com with SMTP id l200so20282444oig.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=toey/Gh1G1DJzpsLs7WlNkSOV2iyUSzl10bK1A4OJt8=;
 b=X+43ehSXn9Sg7B+OUPjnZ6gHKUbqSWZ0oGJi0VFPyk/S9kUW/Zj1InEM56Y+oDjSqs
 0sZyWMGBxIXa1bvXj0Y5H3v4qVC2k69g9mpTsbqH5Gd9hrGrpGepMmU0hUBAm4JgolwA
 6ouB8HCX8G51WvRsPfS2u0Ysx1faVnNUp5OTqRlOdX1tiEWtSmEjolqqXiKl8A72cJR3
 vJRiWo5clIjpX3XIvL0IGdD6YL42WG0mpDbK/rkeYM0gDjWay8QPBNM1v6SY+Z07p1cM
 0KTtmyi3DZnJL/uBpmOKsKvhEiFClYTFKpI+aP084OpU97nMmZ6TUBErc87FSHVhGeUZ
 5Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=toey/Gh1G1DJzpsLs7WlNkSOV2iyUSzl10bK1A4OJt8=;
 b=kiVXtSHtpDvC7/H/ZBCto2+V2QguolAnlpSz1yL51eWwQsA2/HVr1+lrfqtDQrOQbW
 qiqWqwJcMsXZzbrcNRxDdjq0pyy+PSQgzRYRHAIfOwj6NJ/zT2VZVqjgGcuxGJJU4D54
 PaX8hhQ2lQxfI3fRsGYBl5nhYK97+Kh9YA2GV1SlK3BqTx9m+3ntYPNBC7vUnkjQAdw+
 LO1UbpZUX/ovfuoq1KxcxVWoN9z9hO9a7D19je4ElGMHKowM6avDouIGlLJF6eG6AZ1O
 rvCobjDPtsDL5+/wXEGbpgTJ8xOFS41YxEHR2Ke8Kf0FgTrz/BfA4j5eziMEHOoDvxZj
 4XUQ==
X-Gm-Message-State: AOAM530TDE6Cnq4XeXo9ZqrG4e9QldxLN+k5xyXk8UsN6lLCdF8OCuvw
 35g4oVbXNLNx+6MAhBmoE6UpRF0LDJ6yLVd9
X-Google-Smtp-Source: ABdhPJytsxU9nwl/mcYl1xUOU8HBc7O6utu48c9eSHmNfbTCdUVEpo83bq0WR8CKwUOhd+zDVc6H6g==
X-Received: by 2002:aca:383:: with SMTP id 125mr3598440oid.122.1607450517995; 
 Tue, 08 Dec 2020 10:01:57 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Tue,  8 Dec 2020 12:01:14 -0600
Message-Id: <20201208180118.157911-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 67a9b3bb09..4395721446 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1140,24 +1140,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
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
@@ -3705,9 +3705,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
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
@@ -3856,9 +3856,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
2.25.1


