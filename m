Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB76A2843
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjm-0000I4-A1; Sat, 25 Feb 2023 04:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjA-0006KD-2i
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj3-0002uW-OT
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:22 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z11so856386pfh.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ed+xbdwaWR3fX4nEbGB5qN69lYoTz9tc29ocx+a8CFw=;
 b=Ix6NIfX3WGDR7LJH0B3BlVxJs8pdwwBVcHDRoYr6zrwFq+t5GYgTvfFF4ov1OuIdzt
 1Fznb7ZXXB99wv3dU0uFWUXq0AnZGblovTmJZuGjVW2X/ZIrLwNhpszdRttY9eIRe4Lf
 9nA0Rb+pVM8q7TzYhw5Liwd+29yJ/vZ9kU36M9f/miMt7n8kNcguEPWqGA0QPe2rFiqK
 aUwcXGt/zI9c+TZ0UsEer+riJEg2MPQmHLBMFgai8t4cBVC6ZeRZD7SPHiL++BhybHP2
 2qnnaydkbum3m2gWpaYXvl+gM7hbiR8AYY1Re6Vzz8UNGWbqfKN+9hrIJkXoBvqASwpA
 5kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ed+xbdwaWR3fX4nEbGB5qN69lYoTz9tc29ocx+a8CFw=;
 b=Rd6to3h+Yu0ssLknylkOIKtFP7CMkS8bwishYPGUgq4abZj6alQ7eR00s4gV4MNJXC
 qV1zcNsh3iD8yiMhblLO8aGYYbosjNB8cvO5xsn0BpKsYPehWl4GMjp03pB6OkCtQ1MJ
 h+4IzsXwpiWPO3aFm/3ZkkqxJmFiP5jsmSactQ/upWXzdwQd68MKfYoU2tvng72/7Tvx
 Z7Kq5oRGQacFyBqhU3PLO9eX49ylJUjcGOsJcWFJAe0Ph9T5X3s5VUNsUmxty/OB+Tb0
 vlZvNa0twgtKEHoETqUqXYAUY9XHaQk8oc/5YouLB0IIoz64JjBalAypt19eShbbRpzo
 rX+Q==
X-Gm-Message-State: AO0yUKXxPipDOPlx6hz0cuLpzpvAZrkUKzQFg9svidQryWdQNKc6JCz4
 c7H0CNYM5CNHxMCqWp1RQD5OEPFH1unn/VkZSWI=
X-Google-Smtp-Source: AK7set9+YWPSCs/ljTCSK3tMXvjHZILVWDs4UOLQVqiEFsjBuiibQYe68PeootD8pfkhJZiUesVuNA==
X-Received: by 2002:aa7:97b3:0:b0:5a9:cc1f:b2ef with SMTP id
 d19-20020aa797b3000000b005a9cc1fb2efmr17219330pfq.26.1677316809335; 
 Sat, 25 Feb 2023 01:20:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 60/76] target/s390x: Drop tcg_temp_free from translate_vx.c.inc
Date: Fri, 24 Feb 2023 23:14:11 -1000
Message-Id: <20230225091427.1817156-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 143 ----------------------------
 1 file changed, 143 deletions(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 3fadc82e5c..43dfbfd03f 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -183,8 +183,6 @@ static void get_vec_element_ptr_i64(TCGv_ptr ptr, uint8_t reg, TCGv_i64 enr,
     /* generate the final ptr by adding cpu_env */
     tcg_gen_trunc_i64_ptr(ptr, tmp);
     tcg_gen_add_ptr(ptr, ptr, cpu_env);
-
-    tcg_temp_free_i64(tmp);
 }
 
 #define gen_gvec_2(v1, v2, gen) \
@@ -272,13 +270,6 @@ static void gen_gvec128_3_i64(gen_gvec128_3_i64_fn fn, uint8_t d, uint8_t a,
         fn(dl, dh, al, ah, bl, bh);
         write_vec_element_i64(dh, d, 0, ES_64);
         write_vec_element_i64(dl, d, 1, ES_64);
-
-        tcg_temp_free_i64(dh);
-        tcg_temp_free_i64(dl);
-        tcg_temp_free_i64(ah);
-        tcg_temp_free_i64(al);
-        tcg_temp_free_i64(bh);
-        tcg_temp_free_i64(bl);
 }
 
 typedef void (*gen_gvec128_4_i64_fn)(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
@@ -305,15 +296,6 @@ static void gen_gvec128_4_i64(gen_gvec128_4_i64_fn fn, uint8_t d, uint8_t a,
         fn(dl, dh, al, ah, bl, bh, cl, ch);
         write_vec_element_i64(dh, d, 0, ES_64);
         write_vec_element_i64(dl, d, 1, ES_64);
-
-        tcg_temp_free_i64(dh);
-        tcg_temp_free_i64(dl);
-        tcg_temp_free_i64(ah);
-        tcg_temp_free_i64(al);
-        tcg_temp_free_i64(bh);
-        tcg_temp_free_i64(bl);
-        tcg_temp_free_i64(ch);
-        tcg_temp_free_i64(cl);
 }
 
 static void gen_addi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
@@ -351,7 +333,6 @@ static DisasJumpType op_vge(DisasContext *s, DisasOps *o)
 
     tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
     write_vec_element_i64(tmp, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -386,7 +367,6 @@ static DisasJumpType op_vgbm(DisasContext *s, DisasOps *o)
         write_vec_element_i64(t, get_field(s, v1), 0, ES_64);
         tcg_gen_movi_i64(t, generate_byte_mask(i2));
         write_vec_element_i64(t, get_field(s, v1), 1, ES_64);
-        tcg_temp_free_i64(t);
     }
     return DISAS_NEXT;
 }
@@ -427,8 +407,6 @@ static DisasJumpType op_vl(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
     return DISAS_NEXT;
 }
 
@@ -451,7 +429,6 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
     gen_gvec_dup_i64(es, get_field(s, v1), tmp);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -469,7 +446,6 @@ static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
     write_vec_element_i64(tmp, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -486,7 +462,6 @@ static DisasJumpType op_vlbrrep(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
     gen_gvec_dup_i64(es, get_field(s, v1), tmp);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -518,7 +493,6 @@ static DisasJumpType op_vllebrz(DisasContext *s, DisasOps *o)
 
     write_vec_element_i64(tmp, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(tcg_constant_i64(0), get_field(s, v1), 1, ES_64);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -572,9 +546,6 @@ static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
 write:
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
     return DISAS_NEXT;
 }
 
@@ -592,7 +563,6 @@ static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
     write_vec_element_i64(tmp, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -647,8 +617,6 @@ static DisasJumpType op_vler(DisasContext *s, DisasOps *o)
 
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
     return DISAS_NEXT;
 }
 
@@ -688,8 +656,6 @@ static DisasJumpType op_vlgv(DisasContext *s, DisasOps *o)
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free_ptr(ptr);
-
     return DISAS_NEXT;
 }
 
@@ -730,7 +696,6 @@ static DisasJumpType op_vllez(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_ld_i64(t, o->addr1, get_mem_index(s), MO_TE | es);
     gen_gvec_dup_imm(es, get_field(s, v1), 0);
     write_vec_element_i64(t, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(t);
     return DISAS_NEXT;
 }
 
@@ -768,9 +733,6 @@ static DisasJumpType op_vlm(DisasContext *s, DisasOps *o)
 
     /* Store the last element, loaded first */
     write_vec_element_i64(t0, v1, 1, ES_64);
-
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
     return DISAS_NEXT;
 }
 
@@ -794,8 +756,6 @@ static DisasJumpType op_vlbb(DisasContext *s, DisasOps *o)
 
     tcg_gen_addi_ptr(a0, cpu_env, v1_offs);
     gen_helper_vll(cpu_env, a0, o->addr1, bytes);
-    tcg_temp_free_i64(bytes);
-    tcg_temp_free_ptr(a0);
     return DISAS_NEXT;
 }
 
@@ -835,8 +795,6 @@ static DisasJumpType op_vlvg(DisasContext *s, DisasOps *o)
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free_ptr(ptr);
-
     return DISAS_NEXT;
 }
 
@@ -856,7 +814,6 @@ static DisasJumpType op_vll(DisasContext *s, DisasOps *o)
     tcg_gen_addi_i64(o->in2, o->in2, 1);
     tcg_gen_addi_ptr(a0, cpu_env, v1_offs);
     gen_helper_vll(cpu_env, a0, o->addr1, o->in2);
-    tcg_temp_free_ptr(a0);
     return DISAS_NEXT;
 }
 
@@ -898,7 +855,6 @@ static DisasJumpType op_vmr(DisasContext *s, DisasOps *o)
             write_vec_element_i64(tmp, v1, dst_idx, es);
         }
     }
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -974,7 +930,6 @@ static DisasJumpType op_vpk(DisasContext *s, DisasOps *o)
                 }
                 write_vec_element_i64(tmp, v1, dst_idx, dst_es);
             }
-            tcg_temp_free_i64(tmp);
         } else {
             gen_gvec_3_ool(v1, v2, v3, 0, vpk[es - 1]);
         }
@@ -1004,8 +959,6 @@ static DisasJumpType op_vpdi(DisasContext *s, DisasOps *o)
     read_vec_element_i64(t1, get_field(s, v3), i3, ES_64);
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
     return DISAS_NEXT;
 }
 
@@ -1057,7 +1010,6 @@ static DisasJumpType op_vsce(DisasContext *s, DisasOps *o)
 
     read_vec_element_i64(tmp, get_field(s, v1), enr, es);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1098,7 +1050,6 @@ static DisasJumpType op_vseg(DisasContext *s, DisasOps *o)
     write_vec_element_i64(tmp, get_field(s, v1), 0, ES_64);
     read_vec_element_i64(tmp, get_field(s, v2), idx2, es | MO_SIGN);
     write_vec_element_i64(tmp, get_field(s, v1), 1, ES_64);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1116,7 +1067,6 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
     read_vec_element_i64(tmp,  get_field(s, v1), 1, ES_64);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1134,7 +1084,6 @@ static DisasJumpType op_vstebr(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     read_vec_element_i64(tmp, get_field(s, v1), enr, es);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1189,9 +1138,6 @@ write:
     tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
     gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
     tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
     return DISAS_NEXT;
 }
 
@@ -1209,7 +1155,6 @@ static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
     tmp = tcg_temp_new_i64();
     read_vec_element_i64(tmp, get_field(s, v1), enr, es);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1251,9 +1196,6 @@ static DisasJumpType op_vster(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
     gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
     tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
     return DISAS_NEXT;
 }
 
@@ -1284,7 +1226,6 @@ static DisasJumpType op_vstm(DisasContext *s, DisasOps *o)
         }
         gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
     }
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1297,7 +1238,6 @@ static DisasJumpType op_vstl(DisasContext *s, DisasOps *o)
     tcg_gen_addi_i64(o->in2, o->in2, 1);
     tcg_gen_addi_ptr(a0, cpu_env, v1_offs);
     gen_helper_vstl(cpu_env, a0, o->addr1, o->in2);
-    tcg_temp_free_ptr(a0);
     return DISAS_NEXT;
 }
 
@@ -1335,7 +1275,6 @@ static DisasJumpType op_vup(DisasContext *s, DisasOps *o)
             write_vec_element_i64(tmp, v1, dst_idx, dst_es);
         }
     }
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1377,10 +1316,6 @@ static void gen_acc(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, uint8_t es)
     /* Isolate and shift the carry into position */
     tcg_gen_and_i64(d, d, msb_mask);
     tcg_gen_shri_i64(d, d, msb_bit_nr);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static void gen_acc8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -1399,7 +1334,6 @@ static void gen_acc_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
     tcg_gen_add_i32(t, a, b);
     tcg_gen_setcond_i32(TCG_COND_LTU, d, t, b);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_acc_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -1408,7 +1342,6 @@ static void gen_acc_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
     tcg_gen_add_i64(t, a, b);
     tcg_gen_setcond_i64(TCG_COND_LTU, d, t, b);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
@@ -1422,9 +1355,6 @@ static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
     tcg_gen_add2_i64(tl, th, th, zero, ah, zero);
     tcg_gen_add2_i64(tl, dl, tl, th, bh, zero);
     tcg_gen_mov_i64(dh, zero);
-
-    tcg_temp_free_i64(th);
-    tcg_temp_free_i64(tl);
 }
 
 static DisasJumpType op_vacc(DisasContext *s, DisasOps *o)
@@ -1460,8 +1390,6 @@ static void gen_ac2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
     tcg_gen_extract_i64(tl, cl, 0, 1);
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
     tcg_gen_add2_i64(dl, dh, dl, dh, tl, zero);
-
-    tcg_temp_free_i64(tl);
 }
 
 static DisasJumpType op_vac(DisasContext *s, DisasOps *o)
@@ -1490,9 +1418,6 @@ static void gen_accc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
     tcg_gen_add2_i64(tl, th, th, zero, ah, zero);
     tcg_gen_add2_i64(tl, dl, tl, th, bh, zero);
     tcg_gen_mov_i64(dh, zero);
-
-    tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(th);
 }
 
 static DisasJumpType op_vaccc(DisasContext *s, DisasOps *o)
@@ -1533,9 +1458,6 @@ static void gen_avg_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     tcg_gen_addi_i64(t0, t0, 1);
     tcg_gen_shri_i64(t0, t0, 1);
     tcg_gen_extrl_i64_i32(d, t0);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_avg_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
@@ -1550,10 +1472,6 @@ static void gen_avg_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
     gen_addi2_i64(dl, dh, dl, dh, 1);
     tcg_gen_extract2_i64(dl, dl, dh, 1);
-
-    tcg_temp_free_i64(dh);
-    tcg_temp_free_i64(ah);
-    tcg_temp_free_i64(bh);
 }
 
 static DisasJumpType op_vavg(DisasContext *s, DisasOps *o)
@@ -1586,9 +1504,6 @@ static void gen_avgl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     tcg_gen_addi_i64(t0, t0, 1);
     tcg_gen_shri_i64(t0, t0, 1);
     tcg_gen_extrl_i64_i32(d, t0);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_avgl_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
@@ -1599,8 +1514,6 @@ static void gen_avgl_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
     tcg_gen_add2_i64(dl, dh, al, zero, bl, zero);
     gen_addi2_i64(dl, dh, dl, dh, 1);
     tcg_gen_extract2_i64(dl, dl, dh, 1);
-
-    tcg_temp_free_i64(dh);
 }
 
 static DisasJumpType op_vavgl(DisasContext *s, DisasOps *o)
@@ -1635,9 +1548,6 @@ static DisasJumpType op_vcksm(DisasContext *s, DisasOps *o)
     }
     gen_gvec_dup_imm(ES_32, get_field(s, v1), 0);
     write_vec_element_i32(sum, get_field(s, v1), 1, ES_32);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(sum);
     return DISAS_NEXT;
 }
 
@@ -1682,9 +1592,6 @@ static DisasJumpType op_vc(DisasContext *s, DisasOps *o)
         read_vec_element_i64(high, get_field(s, v1), 0, ES_64);
         read_vec_element_i64(low, get_field(s, v1), 1, ES_64);
         gen_op_update2_cc_i64(s, CC_OP_VC, low, high);
-
-        tcg_temp_free_i64(low);
-        tcg_temp_free_i64(high);
     }
     return DISAS_NEXT;
 }
@@ -1853,8 +1760,6 @@ static void gen_mal_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 c)
 
     tcg_gen_mul_i32(t0, a, b);
     tcg_gen_add_i32(d, t0, c);
-
-    tcg_temp_free_i32(t0);
 }
 
 static void gen_mah_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 c)
@@ -1869,10 +1774,6 @@ static void gen_mah_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 c)
     tcg_gen_mul_i64(t0, t0, t1);
     tcg_gen_add_i64(t0, t0, t2);
     tcg_gen_extrh_i64_i32(d, t0);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_malh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 c)
@@ -1887,10 +1788,6 @@ static void gen_malh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 c)
     tcg_gen_mul_i64(t0, t0, t1);
     tcg_gen_add_i64(t0, t0, t2);
     tcg_gen_extrh_i64_i32(d, t0);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static DisasJumpType op_vma(DisasContext *s, DisasOps *o)
@@ -1974,7 +1871,6 @@ static void gen_mh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     TCGv_i32 t = tcg_temp_new_i32();
 
     tcg_gen_muls2_i32(t, d, a, b);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_mlh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
@@ -1982,7 +1878,6 @@ static void gen_mlh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     TCGv_i32 t = tcg_temp_new_i32();
 
     tcg_gen_mulu2_i32(t, d, a, b);
-    tcg_temp_free_i32(t);
 }
 
 static DisasJumpType op_vm(DisasContext *s, DisasOps *o)
@@ -2099,11 +1994,6 @@ static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
     /* Store final result into v1. */
     write_vec_element_i64(h1, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(l1, get_field(s, v1), 1, ES_64);
-
-    tcg_temp_free_i64(l1);
-    tcg_temp_free_i64(h1);
-    tcg_temp_free_i64(l2);
-    tcg_temp_free_i64(h2);
     return DISAS_NEXT;
 }
 
@@ -2169,8 +2059,6 @@ static void gen_rim_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, int32_t c)
     tcg_gen_and_i32(t, t, b);
     tcg_gen_andc_i32(d, d, b);
     tcg_gen_or_i32(d, d, t);
-
-    tcg_temp_free_i32(t);
 }
 
 static void gen_rim_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, int64_t c)
@@ -2181,8 +2069,6 @@ static void gen_rim_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, int64_t c)
     tcg_gen_and_i64(t, t, b);
     tcg_gen_andc_i64(d, d, b);
     tcg_gen_or_i64(d, d, t);
-
-    tcg_temp_free_i64(t);
 }
 
 static DisasJumpType op_verim(DisasContext *s, DisasOps *o)
@@ -2291,7 +2177,6 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
         default:
             g_assert_not_reached();
         }
-        tcg_temp_free_i32(shift);
     }
     return DISAS_NEXT;
 }
@@ -2311,7 +2196,6 @@ static DisasJumpType gen_vsh_by_byte(DisasContext *s, DisasOps *o,
         read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
         tcg_gen_andi_i64(shift, shift, byte ? 0x78 : 7);
         gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2), shift, 0, gen);
-        tcg_temp_free_i64(shift);
     }
     return DISAS_NEXT;
 }
@@ -2367,10 +2251,6 @@ static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
     return DISAS_NEXT;
 }
 
@@ -2397,10 +2277,6 @@ static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
 
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
     return DISAS_NEXT;
 }
 
@@ -2445,9 +2321,6 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
     /* "invert" the result: -1 -> 0; 0 -> 1 */
     tcg_gen_addi_i64(dl, th, 1);
     tcg_gen_mov_i64(dh, zero);
-
-    tcg_temp_free_i64(th);
-    tcg_temp_free_i64(tl);
 }
 
 static DisasJumpType op_vscbi(DisasContext *s, DisasOps *o)
@@ -2482,8 +2355,6 @@ static void gen_sbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
     tcg_gen_not_i64(tl, bl);
     tcg_gen_not_i64(th, bh);
     gen_ac2_i64(dl, dh, al, ah, tl, th, cl, ch);
-    tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(th);
 }
 
 static DisasJumpType op_vsbi(DisasContext *s, DisasOps *o)
@@ -2508,9 +2379,6 @@ static void gen_sbcbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
     tcg_gen_not_i64(tl, bl);
     tcg_gen_not_i64(th, bh);
     gen_accc2_i64(dl, dh, al, ah, tl, th, cl, ch);
-
-    tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(th);
 }
 
 static DisasJumpType op_vsbcbi(DisasContext *s, DisasOps *o)
@@ -2550,8 +2418,6 @@ static DisasJumpType op_vsumg(DisasContext *s, DisasOps *o)
         }
         write_vec_element_i64(sum, get_field(s, v1), dst_idx, ES_64);
     }
-    tcg_temp_free_i64(sum);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -2580,10 +2446,6 @@ static DisasJumpType op_vsumq(DisasContext *s, DisasOps *o)
     }
     write_vec_element_i64(sumh, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(suml, get_field(s, v1), 1, ES_64);
-
-    tcg_temp_free_i64(sumh);
-    tcg_temp_free_i64(suml);
-    tcg_temp_free_i64(tmpl);
     return DISAS_NEXT;
 }
 
@@ -2611,8 +2473,6 @@ static DisasJumpType op_vsum(DisasContext *s, DisasOps *o)
         }
         write_vec_element_i32(sum, get_field(s, v1), dst_idx, ES_32);
     }
-    tcg_temp_free_i32(sum);
-    tcg_temp_free_i32(tmp);
     return DISAS_NEXT;
 }
 
@@ -3399,9 +3259,6 @@ static DisasJumpType op_vfpso(DisasContext *s, DisasOps *o)
         read_vec_element_i64(tmp, v2, 1, ES_64);
         write_vec_element_i64(tmp, v1, 1, ES_64);
     }
-
-    tcg_temp_free_i64(tmp);
-
     return DISAS_NEXT;
 }
 
-- 
2.34.1


