Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E43F739E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:48:10 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqRw-0002Th-AY
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGO-0004QQ-Qm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGM-0005bK-AT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u16so35670403wrn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e3QsIw8l+no/AQshGiOw4moU36KoAvG6XaI7zJyoNM0=;
 b=oz812UtiWlsKQiRLXUQpDrLkFOC87djzGjH+eeJuiqp1tZezDTsjpP4GCe3BfZqEtI
 a4Hp2KA0AGv9hLo0x8nhM7mR8DlK+ONzUBllJgMGHQIuJSFvDQYeyUEsZUQKhNoJvHUs
 YnY1rfUFn6mu1vPZ+OYxeBerJ7vhIYLu+aueL/1A7Rdx39nIys2cRvDJbYez84rx+3Tx
 sAL2Sm70GI1cjkMP3ATIysJOhVMV1G0ni9sdO7QCM5WnVmd+vc+FYcAW/0B+vjefuTgC
 +C/B6pNEaaO33xjn2cwzizqZM4L4OZKxy5/6i8l9szBZuc8m2VujegLSCwC3vxC5er6o
 FUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3QsIw8l+no/AQshGiOw4moU36KoAvG6XaI7zJyoNM0=;
 b=cNhPM2Y8oMSNz+XZ0YqRqmm1+n7jg1KKaXLQC4U97OGyRKfonkhhC0N1rqF7wtufdI
 soJ2qXdb9RWQoyA67nN3lKRUpWI4xx2Pi76dRX7jlF5UbinFc/rRekOB27Q0YOoWIo70
 O/vJ7VGZmNCSW7EKnPH7VphEfqDDDpA3nSh23b2ft2VmlGDesD+MPT6N858ui60wTDGl
 kdiMMG1znE/xv7Du71+pPvJE1Ouv6nFMulXdIBKGWKHMPXUATD+aaXfF/WAZCFZgaRcT
 2uCZ1oSME1WT8o+Lqqa942WQlFBz2rc4ZVjLXsZJnb1V0fqIdmZqqxpmPuQUo7qL3i4b
 1KQw==
X-Gm-Message-State: AOAM531GvvZLk8kGA2zBZExNy5JTLEOqMEYxXj205/uvHBBE8Wjh/bxO
 IkLpDggEMqPYu9SbtmwPnE/a24BJ1rxu4w==
X-Google-Smtp-Source: ABdhPJzOEtTml0aTqOB5WLs/2sbUnyYXH496qzhNC0Eyv/h6igTqBxPJjS8PnMcwkUr4fhLzds25DQ==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr23659551wrr.129.1629887764648; 
 Wed, 25 Aug 2021 03:36:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/44] target/arm: Implement MVE scatter-gather insns
Date: Wed, 25 Aug 2021 11:35:23 +0100
Message-Id: <20210825103534.6936-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Implement the MVE gather-loads and scatter-stores which
form the address by adding a base value from a scalar
register to an offset in each element of a vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  32 +++++++++
 target/arm/mve.decode      |  12 ++++
 target/arm/mve_helper.c    | 129 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  97 ++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b6cf3f0c94d..ba842b97c17 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,38 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrw_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrd_sg_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrw_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrd_sg_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrw_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrd_sg_os_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_os_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrw_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrd_sg_os_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 40bd0c04b59..6c3f45c7195 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -42,11 +42,18 @@
 &shl_scalar qda rm size
 &vmaxv qm rda size
 &vabav qn qm rda size
+&vldst_sg qd qm rn size msize os
+
+# scatter-gather memory size is in bits 6:4
+%sg_msize 6:1 4:1
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
+@vldst_sg .... .... .... rn:4 .... ... size:2 ... ... os:1 &vldst_sg \
+          qd=%qd qm=%qm msize=%sg_msize
+
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
@@ -136,6 +143,11 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# gather loads/scatter stores
+VLDR_S_sg        111 0 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
+VLDR_U_sg        111 1 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
+VSTR_sg          111 0 1100 1 . 00 .... ... 0 111 . .... .... @vldst_sg
+
 # Moves between 2 32-bit vector lanes and 2 general purpose registers
 VMOV_to_2gp      1110 1100 0 . 00 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
 VMOV_from_2gp    1110 1100 0 . 01 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1752555a218..2b882db1c3d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -206,6 +206,135 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 #undef DO_VLDR
 #undef DO_VSTR
 
+/*
+ * Gather loads/scatter stores. Here each element of Qm specifies
+ * an offset to use from the base register Rm. In the _os_ versions
+ * that offset is scaled by the element size.
+ * For loads, predicated lanes are zeroed instead of retaining
+ * their previous values.
+ */
+#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN)            \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        OFFTYPE *m = vm;                                                \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
+            addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
+            d[H##ESIZE(e)] = (mask & 1) ?                               \
+                cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;         \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* We know here TYPE is unsigned so always the same as the offset type */
+#define DO_VSTR_SG(OP, STTYPE, ESIZE, TYPE, ADDRFN)                     \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        TYPE *m = vm;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
+            if (mask & 1) {                                             \
+                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/*
+ * 64-bit accesses are slightly different: they are done as two 32-bit
+ * accesses, controlled by the predicate mask for the relevant beat,
+ * and with a single 32-bit offset in the first of the two Qm elements.
+ * Note that for QEMU our IMPDEF AIRCR.ENDIANNESS is always 0 (little).
+ */
+#define DO_VLDR64_SG(OP, ADDRFN)                                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        uint32_t *d = vd;                                               \
+        uint32_t *m = vm;                                               \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
+            addr = ADDRFN(base, m[H4(e & ~1)]);                         \
+            addr += 4 * (e & 1);                                        \
+            d[H4(e)] = (mask & 1) ? cpu_ldl_data_ra(env, addr, GETPC()) : 0; \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VSTR64_SG(OP, ADDRFN)                                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        uint32_t *d = vd;                                               \
+        uint32_t *m = vm;                                               \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+            addr = ADDRFN(base, m[H4(e & ~1)]);                         \
+            addr += 4 * (e & 1);                                        \
+            if (mask & 1) {                                             \
+                cpu_stl_data_ra(env, addr, d[H4(e)], GETPC());          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define ADDR_ADD(BASE, OFFSET) ((BASE) + (OFFSET))
+#define ADDR_ADD_OSH(BASE, OFFSET) ((BASE) + ((OFFSET) << 1))
+#define ADDR_ADD_OSW(BASE, OFFSET) ((BASE) + ((OFFSET) << 2))
+#define ADDR_ADD_OSD(BASE, OFFSET) ((BASE) + ((OFFSET) << 3))
+
+DO_VLDR_SG(vldrb_sg_sh, ldsb, 2, int16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_sw, ldsb, 4, int32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD)
+
+DO_VLDR_SG(vldrb_sg_ub, ldub, 1, uint8_t, uint8_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_uh, ldub, 2, uint16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_uw, ldub, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrw_sg_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR64_SG(vldrd_sg_ud, ADDR_ADD)
+
+DO_VLDR_SG(vldrh_sg_os_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrh_sg_os_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrh_sg_os_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrw_sg_os_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD_OSW)
+DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD)
+
+DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD)
+DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD)
+DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD)
+DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD)
+DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD)
+DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD)
+DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD)
+
+DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH)
+DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH)
+DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW)
+DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD)
+
 /*
  * The mergemask(D, R, M) macro performs the operation "*D = R" but
  * storing only the bytes which correspond to 1 bits in M,
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 865d5acbe76..24d4e57ead4 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -34,6 +34,7 @@ static inline int vidup_imm(DisasContext *s, int x)
 #include "decode-mve.c.inc"
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenLdStSGFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
@@ -209,6 +210,102 @@ DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h, MO_8)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w, MO_8)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w, MO_16)
 
+static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
+{
+    TCGv_i32 addr;
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn || a->rn == 15) {
+        /* Rn case is UNPREDICTABLE */
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    addr = load_reg(s, a->rn);
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, addr);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    tcg_temp_free_i32(addr);
+    mve_update_eci(s);
+    return true;
+}
+
+/*
+ * The naming scheme here is "vldrb_sg_sh == in-memory byte loads
+ * signextended to halfword elements in register". _os_ indicates that
+ * the offsets in Qm should be scaled by the element size.
+ */
+/* This macro is just to make the arrays more compact in these functions */
+#define F(N) gen_helper_mve_##N
+
+/* VLDRB/VSTRB (ie msize 1) with OS=1 is UNPREDICTABLE; we UNDEF */
+static bool trans_VLDR_S_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { NULL, F(vldrb_sg_sh), F(vldrb_sg_sw), NULL },
+            { NULL, NULL,           F(vldrh_sg_sw), NULL },
+            { NULL, NULL,           NULL,           NULL },
+            { NULL, NULL,           NULL,           NULL }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, NULL,              F(vldrh_sg_os_sw), NULL },
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, NULL,              NULL,              NULL }
+        }
+    };
+    if (a->qd == a->qm) {
+        return false; /* UNPREDICTABLE */
+    }
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+static bool trans_VLDR_U_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { F(vldrb_sg_ub), F(vldrb_sg_uh), F(vldrb_sg_uw), NULL },
+            { NULL,           F(vldrh_sg_uh), F(vldrh_sg_uw), NULL },
+            { NULL,           NULL,           F(vldrw_sg_uw), NULL },
+            { NULL,           NULL,           NULL,           F(vldrd_sg_ud) }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, F(vldrh_sg_os_uh), F(vldrh_sg_os_uw), NULL },
+            { NULL, NULL,              F(vldrw_sg_os_uw), NULL },
+            { NULL, NULL,              NULL,              F(vldrd_sg_os_ud) }
+        }
+    };
+    if (a->qd == a->qm) {
+        return false; /* UNPREDICTABLE */
+    }
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+static bool trans_VSTR_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { F(vstrb_sg_ub), F(vstrb_sg_uh), F(vstrb_sg_uw), NULL },
+            { NULL,           F(vstrh_sg_uh), F(vstrh_sg_uw), NULL },
+            { NULL,           NULL,           F(vstrw_sg_uw), NULL },
+            { NULL,           NULL,           NULL,           F(vstrd_sg_ud) }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, F(vstrh_sg_os_uh), F(vstrh_sg_os_uw), NULL },
+            { NULL, NULL,              F(vstrw_sg_os_uw), NULL },
+            { NULL, NULL,              NULL,              F(vstrd_sg_os_ud) }
+        }
+    };
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+#undef F
+
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
     TCGv_ptr qd;
-- 
2.20.1


