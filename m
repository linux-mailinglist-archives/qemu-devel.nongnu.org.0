Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C12F1EBE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:15:06 +0100 (CET)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2ef-0000M4-Mh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rx-0006AA-GC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rj-0006SL-I9
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: by mail-pj1-x1031.google.com with SMTP id m5so95596pjv.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GncTsfZkzDCi87UalR7JxGVcBAUvdECHyv5Jv99YvLY=;
 b=R5g+/ABQnTHfK++A9I+6jU7i7jfYIre2xc9V7BStNJh+WEYSjjKhp03MDvP79sZNch
 rqu/2NfadFqXwWkIC58dGrlzbDhsFjnPSDtd80V8TPfkJncxRp17HXHOuYw7zOmSUY58
 QMXNiDnMIXZrKjpf+gdpXryvmGcDE0WU51DBZRyVKunN/0MQ9WyfCFhodwzoJtoPnFM9
 S0CjFcFXZE0JmZINlIixG4EjZ5G+yZnNKniU1m1SdzTpWoePaoLI4K16XSk8bIIUi1Er
 fzhXoFpuh4TCyDaxJFhzlb97ye6Bw4/lfgLB5lpNVYmwxl/X99keHXIohG5hIuBGm73G
 /WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GncTsfZkzDCi87UalR7JxGVcBAUvdECHyv5Jv99YvLY=;
 b=qCaCAO576Xl0zbTmu/CfkYDgSpf8cM5tcqljgnOZOWEhsVSrAFdIJbxOdMj4u0F6c5
 r7hmBh2Xg5iuYYrVkNWeY5R8omOVjuSpQTsuUsxg3bCVxnFv4joEFrpGUvoc6bb4ohJl
 HdypLzJFgR2emdSzHjvZGOlpMH+ffoPsctDMJRIy05rYOvMwbA0DXeJpMiz6aR25OE0v
 +/j4MkUZSchxve0JWfJrQqazQEeKJcrlCr9MxULjEXDc8LHVzYOoX5QoDWf1GZ4KpZdR
 9s0mbcNOg13xMxL6O+41OgIrTLsewGMWiFUt7CWf3ks7WA2VqnjJZmDunY5bDch7aLRi
 +Lnw==
X-Gm-Message-State: AOAM530mX+sZK9/FaQjrxTAPLGDXq/GJQjMp+n7EAY8aoeNzU6IfwM6w
 GE1p4rr6iwpn14qUqgmpPrg8x7W0FAzB5Q==
X-Google-Smtp-Source: ABdhPJygN8z2wqjIvO+Ea/TiWC9P32aB8Lv8iALexDz+q5mYf5TDhWlzTw5ljL3048qQ0MapBgid3A==
X-Received: by 2002:a17:902:bf4a:b029:da:d0b8:6489 with SMTP id
 u10-20020a170902bf4ab02900dad0b86489mr720542pls.58.1610391700948; 
 Mon, 11 Jan 2021 11:01:40 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/30] target/arm: Enforce word alignment for LDRD/STRD
Date: Mon, 11 Jan 2021 09:00:57 -1000
Message-Id: <20210111190113.303726-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f75987dac4..9cc6a9f83d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6475,13 +6475,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6504,13 +6504,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6612,13 +6612,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6651,13 +6651,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1


