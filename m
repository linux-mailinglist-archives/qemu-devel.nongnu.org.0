Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201406AABD9
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTk-0006XO-6s; Sat, 04 Mar 2023 13:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTZ-0006Th-4O
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:21 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTV-0003Pj-UO
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso9287061pjr.5
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTwpX71LYq/RTJCaFN4Ey+fij6djZh42xCt7K+NhOLc=;
 b=bKj4+BjEXHWryA0qy9We2LbhclnBJq7pISJZrnUXYLaxgbX8jyru+kdgQTs9qnHs9B
 Q/BCQ+uXB+tExGyIjHoYjOC4eD+Pvv3Hzb9gXia/WLIDvEeopMqbdDASG5z/CHT+zBRz
 qCg6cjLzKf43EPJaMIVu1zcaFU1AXczVXHJBWOK+FbvXGYVvzuWpVk11oLXXo8FSlRBj
 v6Q+zXLAjVafgJ8ZC6ZOgDTyrr+KzhwhBSiY9XPVUZo78BvsIMklqzIv168hH+D9pQ7q
 ZG6cjQto2u3Yc3Bf+N2M7DKHGb7J+u4X/XV4L7w+1dHBqMwQdy5TK+S81FVf6tUd0a0N
 Mp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTwpX71LYq/RTJCaFN4Ey+fij6djZh42xCt7K+NhOLc=;
 b=F7FS176rapQ0CyPgt+dFMjEul6ce5CiBZ5xatd5xY0QLOgvy3cy4GZNVmiZIIXDAIG
 rM/STqESwhPQn927j0ykOXELGX+Q1aDKyNIPBYnCsYJwDSogO1jssbUgIv9/KkJOLSzY
 3hmFsKJtzd2Mq32smG9YZOm3JQFehzUBdnEpEAQ21YQ2wQmqBrLV7tBL740ahXQjaKyO
 QUbkIMgI5CQF7fRQXkJECe9p4DU8L5I0xU+E0CCC8GdfnhdzNoqEdFc1H227E8Y4j2a5
 Lri4qH9ItSAyT89i70Mzm62o0Tz/UqGfKcYuB+2LbvBwof/JLj/4gj9k7gJaHq94YLPO
 sT+Q==
X-Gm-Message-State: AO0yUKVr4aTzItDPHgZVTrXx4tm6peht6JiT4FeHPPvZbW0JItC8hZ92
 a4xwFlSrxE2p5kwUtbjqAfdixMW6HkWWvMgk8FTwxA==
X-Google-Smtp-Source: AK7set+kx8MGWBIFlFRUfwKfLPzWwnnbCOynD5nUgF7IfaZSfUeeucjFu5G5OXUOYZmh079pzaG9cg==
X-Received: by 2002:a05:6a20:8e28:b0:cd:7fcf:11a6 with SMTP id
 y40-20020a056a208e2800b000cd7fcf11a6mr6344368pzj.48.1677953956048; 
 Sat, 04 Mar 2023 10:19:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v3 16/20] target/s390x: Remove assert vs g_in2
Date: Sat,  4 Mar 2023 10:18:56 -0800
Message-Id: <20230304181900.1097116-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index beccd3429e..c431903c67 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1


