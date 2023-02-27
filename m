Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27BE6A3B02
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWNb-00051X-7o; Mon, 27 Feb 2023 00:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMi-00019l-Sa
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:01 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMg-00074k-0P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l1so4914860pjt.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJNhapK5cwKPuNHwm60EH5IqaxN8PX72mUhnmnmpcgg=;
 b=m2FVDx3U78LRyj3V1cqS9X9ITZb+fhkH1AH2i8Z5YzqSySta/LD/yKTXBIu7HmWjIE
 st/XlNu2/xEsTNk8VgEX0AO4ISyaV1UqJoyhGMHUFjYwhvC6n1itADBxXeBHXI7VRBT0
 uf1iBCWnBdnXcEj5WR6ghi7QiCHn0ml8OlX/TRuxO3WwKFQiiLMS917Tpk21l6M4Aevw
 9KsgLi5C4Z/S9K6mXSmWZFE4u/dTs/EL41BB4SG/RxQPB3DL0w4o2DFp43tJl1U9q3/d
 kNlhS8njQHgAhxM+V51fP5H8aBsbEewEhxUXAosOq+EPDTcg2R6o1BdzeNdsUg2BEszW
 eY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJNhapK5cwKPuNHwm60EH5IqaxN8PX72mUhnmnmpcgg=;
 b=4DPfCDA2ulHM+bx2LUVjxFASwAO4d/Mz3MYdnKWWovvLr73cezYcH93R9NOIxUIDUw
 tGf6vOmqQD1ySUendsKAwyDnRcxBJZTvAMRvcH13eUrGgvC6RAB31YfpsNwI7oYelu72
 VPmCExavVtH48+ZuQ4RcmIKnOANpLXnPBbgW/QDDfN72JOoWVJIxaQWKLMMp8zDwKZmt
 tCShNmdxVIi9HQeK7I9nNcM1Ko5PhgucS9ldZkXI9oOPaTxEX95WJ0ugFk6wZb60ucoX
 j8A2pAM5oyR7lLXqq7ZXfcx/VpDevcptN/CM32OcoxA2LS0I+UDVMDKN0welYHySegZp
 QX8Q==
X-Gm-Message-State: AO0yUKVG14xdLy7eWsvrRWViIXLbBe7ut3mAj+xlFlVgnhePC1bXdqlc
 VAqHkXbuguUGSoIwISpYF210VOaKL4ciil+B3eM=
X-Google-Smtp-Source: AK7set+0RqiIZlbB70dsR6IRkRGID3X9d5/vDP0dkv3h0fC+2wkxyn0s7eIueW4wdbXOEpuVTMRLEg==
X-Received: by 2002:a17:902:6b01:b0:19c:f849:80a1 with SMTP id
 o1-20020a1709026b0100b0019cf84980a1mr5239419plk.27.1677476877016; 
 Sun, 26 Feb 2023 21:47:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 50/70] target/s390x: Split out gen_ri2
Date: Sun, 26 Feb 2023 19:42:13 -1000
Message-Id: <20230227054233.390271-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use tcg_constant_i64.  Adjust in2_mri2_* to allocate a new
temporary for the output, using gen_ri2 for the address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9974162527..7969051ce9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5745,9 +5745,14 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_a2 0
 
+static TCGv gen_ri2(DisasContext *s)
+{
+    return tcg_constant_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+}
+
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    o->in2 = gen_ri2(s);
 }
 #define SPEC_in2_ri2 0
 
@@ -5835,29 +5840,29 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
 
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld16u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_16u 0
 
 static void in2_mri2_32s(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32s(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32s 0
 
 static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32u 0
 
 static void in2_mri2_64(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld64(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_64 0
 
-- 
2.34.1


