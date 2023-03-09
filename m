Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5E6B2E53
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaD-00047C-7f; Thu, 09 Mar 2023 15:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaA-000454-EP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:46 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa8-0001XT-IN
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so6591823pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3eB/kKfZL9pcS67BwAlUIjdCl9WdcWSOaNoguAhnXA=;
 b=v3WzZkskEXyGpC2V9Qf6k2cOaRHMPinvyOkZ6+P/ie+OXnaRjEJthJZS3DGLmnEiCe
 w4SRPVOAzuJraTX0ELOyv8Vcg81fnwAFsUTQ/fUhkxCZitSclMLDkvdx5npHTAFKxALj
 0DAZAGVKVLeO5qfQBoUBLvif+i8JhsukVdKQOWzXFlOLuqi0dThqAc1EPKJRoqL0IGY1
 KRbdP9BlkS3xKyoP0c3Cusd45+DOJOWtgm61LfsIjeOWARLpYt6vgsQZQyfqXKrvWMmL
 zKvqDEjA2B/LnijDsiKNXmULBiW1S6LLo2vIUqncFWvb0quBDD3ytObRYUN0T2sLY59h
 Cwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3eB/kKfZL9pcS67BwAlUIjdCl9WdcWSOaNoguAhnXA=;
 b=mIBIuBYInk7wf5RFnb2Wd1XgGZuKd3lHC5Lxp94SHIfSZL3aHd7acc3F8rs3g66HxT
 YiSAz/KHbhZznKQVs2uWlRQdgRYn92+qUYL0ho2lMp98J8BBTiFLmrw5tzFahkhODRcV
 3i7r8SOKD8sVeyPQBZ7iP1TvYp3QPIGR1MmFr2fCgkdFVTkd03RMg9PxC4RCn0aL3Wm3
 JxCOA8fNkb9sn/fWcm2Lh/7GrJabx3taH7mmx7Nu6fvOZSrVOSzDP+aQKni+L+pk/5U0
 2pz0PsP9H2NBDQdN/CnGnS46GpH99G/uDZaq6xmWVWI23m1ORv/qd0ySnA8GbCAHcGG/
 ZSiA==
X-Gm-Message-State: AO0yUKWADs+wkkjlCYlUxcxLL+pFdEVgnJ8qIWDmJiW/ABToS3uIsHvS
 CWK1sNbaCIwLy3y3qBHTV7/f9T7bYBN9kBizXBQ=
X-Google-Smtp-Source: AK7set9tMINwPJrYKq0b/808ak3+zD2c7sXxxYLH9taZ/92LUcrEO1wljIRezit/o+PQ2T22rnc5Wg==
X-Received: by 2002:a17:903:1251:b0:19e:d60a:e9e with SMTP id
 u17-20020a170903125100b0019ed60a0e9emr13502596plh.42.1678392583750; 
 Thu, 09 Mar 2023 12:09:43 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 58/91] target/s390x: Avoid tcg_const_i64
Date: Thu,  9 Mar 2023 12:05:17 -0800
Message-Id: <20230309200550.3878088-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

All uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7969051ce9..32d61fc40d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4857,13 +4857,13 @@ static DisasJumpType op_xi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_zero(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     o->out2 = o->out;
     return DISAS_NEXT;
 }
@@ -5762,7 +5762,7 @@ static void in2_sh(DisasContext *s, DisasOps *o)
     int d2 = get_field(s, d2);
 
     if (b2 == 0) {
-        o->in2 = tcg_const_i64(d2 & 0x3f);
+        o->in2 = tcg_constant_i64(d2 & 0x3f);
     } else {
         o->in2 = get_address(s, 0, b2, d2);
         tcg_gen_andi_i64(o->in2, o->in2, 0x3f);
@@ -5868,46 +5868,46 @@ static void in2_mri2_64(DisasContext *s, DisasOps *o)
 
 static void in2_i2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(get_field(s, i2));
+    o->in2 = tcg_constant_i64(get_field(s, i2));
 }
 #define SPEC_in2_i2 0
 
 static void in2_i2_8u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint8_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint8_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_8u 0
 
 static void in2_i2_16u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint16_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint16_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_16u 0
 
 static void in2_i2_32u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint32_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint32_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_32u 0
 
 static void in2_i2_16u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint16_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_16u_shl 0
 
 static void in2_i2_32u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint32_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_32u_shl 0
 
 #ifndef CONFIG_USER_ONLY
 static void in2_insn(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->fields.raw_insn);
+    o->in2 = tcg_constant_i64(s->fields.raw_insn);
 }
 #define SPEC_in2_insn 0
 #endif
-- 
2.34.1


