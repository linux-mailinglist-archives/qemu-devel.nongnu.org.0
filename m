Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9D3C71C0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:03:08 +0200 (CEST)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J07-0000O3-Je
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibv-0000dX-DS
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibk-0003rV-Iz
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so2367548wmc.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qAjZNYXFvhxqmdLYqteXePqQI/hda9MXmKtS25wLRMw=;
 b=m7v9PlrU7O8c5/a+7X1JrN1QnFxURoGjTPwCuA4p/ClcXi4Rr9Ad90sxfiBrn9XY0o
 fFRc3+P99LBngEJdwXBI8/bI/p1CBzTAQ106f9jvo9j5uOlI+M1mbNxgkSKwOsg2Iedk
 RJf7GVb2Bn8IPuomct/+0QGy60EYMV5bGIhb5QO8hrRa3jkvLOIPoBuhykaggNBHkJg6
 zDvozg1tZ2foJD3EaKjalDrHaHEiAGAE34l2eQ/p5Y42uyZyAqfB1w80QuHK1Ia4QFdf
 QpI6nkLzn83rkOD84Rag9EN05BGP1dsZfyiwl4ts+OjA0fCf3wKyYdOT0HJvViYc4v+d
 ol8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qAjZNYXFvhxqmdLYqteXePqQI/hda9MXmKtS25wLRMw=;
 b=lTptlkHlSBij0Wla09Aw1LNuQ9D0NE/2zlfpIKZLL7SA1zYw5UbcMEKsgCfthqFD8a
 lOagGhx7ktB8uTAaR98qIj4jtO+s5ekvtUfEMzlsWpzaHW7zeQlHVoe6TNW/5Jz8Wnjs
 TFLw72q0NkJGVPs0UEYGJTOCXl/xwCEgLqtHFgGvXd7MICAHX0cjqZEaIdLLUAEliXaz
 QK8UDiGlfGbS6xqthxhmoksCOonUzGLQFVF+BvMDRm2oZAnuTIr5n2xlOulGHsICYnEj
 KPl+inYKMPon4mjvLQ/hJORFkjyvu92UTjgfUbOML6h4MtPpBjDCuUwcinRxvGanXOtj
 bJzg==
X-Gm-Message-State: AOAM531EiX1Ulk16ofldKlEtYZvlSeNPDxHU9PNENUCKmfzJF1ix9OL+
 q1EPIcGSDJYVVORijEPh9mLi+g==
X-Google-Smtp-Source: ABdhPJzSc4EUZdSSnxSZ/USK4jpEv2e4JxUedQ0Jku4tXdzUfhTygyDFd8HqKeoUcWAgGs0cN3UoGA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr5217473wmm.90.1626183475332; 
 Tue, 13 Jul 2021 06:37:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 33/34] target/arm: Implement MVE scatter-gather
 immediate forms
Date: Tue, 13 Jul 2021 14:37:25 +0100
Message-Id: <20210713133726.26842-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Implement the MVE VLDR/VSTR insns which do scatter-gather using base
addresses from Qm plus or minus an immediate offset (possibly with
writeback). Note that writeback is not predicated but it does have
to honour ECI state, so we have to add an eci_mask check to the
VSTR_SG macros (the VLDR_SG macros already needed this to be able
to distinguish "skip beat" from "set predicated element to 0").

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      | 10 +++++
 target/arm/mve_helper.c    | 91 ++++++++++++++++++++++++--------------
 target/arm/translate-mve.c | 66 +++++++++++++++++++++++++++
 4 files changed, 140 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9c570270c61..16799b110fd 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -65,6 +65,11 @@ DEF_HELPER_FLAGS_4(mve_vstrh_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vstrw_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vstrd_sg_os_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vldrw_sg_wb_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrd_sg_wb_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrw_sg_wb_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrd_sg_wb_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index b0e39f36723..76e9b9c721c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -43,6 +43,7 @@
 &vmaxv qm rda size
 &vabav qn qm rda size
 &vldst_sg qd qm rn size msize os
+&vldst_sg_imm qd qm a w imm
 
 # scatter-gather memory size is in bits 6:4
 %sg_msize 6:1 4:1
@@ -54,6 +55,10 @@
 @vldst_sg .... .... .... rn:4 .... ... size:2 ... ... os:1 &vldst_sg \
           qd=%qd qm=%qm msize=%sg_msize
 
+# Qm is in the fields usually labeled Qn
+@vldst_sg_imm .... .... a:1 . w:1 . .... .... .... . imm:7 &vldst_sg_imm \
+              qd=%qd qm=%qn
+
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
@@ -148,6 +153,11 @@ VLDR_S_sg        111 0 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
 VLDR_U_sg        111 1 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
 VSTR_sg          111 0 1100 1 . 00 .... ... 0 111 . .... .... @vldst_sg
 
+VLDRW_sg_imm     111 1 1101 ... 1 ... 0 ... 1 1110 .... .... @vldst_sg_imm
+VLDRD_sg_imm     111 1 1101 ... 1 ... 0 ... 1 1111 .... .... @vldst_sg_imm
+VSTRW_sg_imm     111 1 1101 ... 0 ... 0 ... 1 1110 .... .... @vldst_sg_imm
+VSTRD_sg_imm     111 1 1101 ... 0 ... 0 ... 1 1111 .... .... @vldst_sg_imm
+
 # Moves between 2 32-bit vector lanes and 2 general purpose registers
 VMOV_to_2gp      1110 1100 0 . 00 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
 VMOV_from_2gp    1110 1100 0 . 01 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 36592b88372..293c0e11819 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -220,7 +220,7 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
  * For loads, predicated lanes are zeroed instead of retaining
  * their previous values.
  */
-#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN)            \
+#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN, WB)        \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
@@ -237,25 +237,35 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
             addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
             d[H##ESIZE(e)] = (mask & 1) ?                               \
                 cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;         \
+            if (WB) {                                                   \
+                m[H##ESIZE(e)] = addr;                                  \
+            }                                                           \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }
 
 /* We know here TYPE is unsigned so always the same as the offset type */
-#define DO_VSTR_SG(OP, STTYPE, ESIZE, TYPE, ADDRFN)                     \
+#define DO_VSTR_SG(OP, STTYPE, ESIZE, TYPE, ADDRFN, WB)                 \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
         TYPE *d = vd;                                                   \
         TYPE *m = vm;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
-        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
             addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
             if (mask & 1) {                                             \
                 cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
             }                                                           \
+            if (WB) {                                                   \
+                m[H##ESIZE(e)] = addr;                                  \
+            }                                                           \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }
@@ -265,8 +275,10 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
  * accesses, controlled by the predicate mask for the relevant beat,
  * and with a single 32-bit offset in the first of the two Qm elements.
  * Note that for QEMU our IMPDEF AIRCR.ENDIANNESS is always 0 (little).
+ * Address writeback happens on the odd beats and updates the address
+ * stored in the even-beat element.
  */
-#define DO_VLDR64_SG(OP, ADDRFN)                                        \
+#define DO_VLDR64_SG(OP, ADDRFN, WB)                                    \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
@@ -283,25 +295,35 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
             addr = ADDRFN(base, m[H4(e & ~1)]);                         \
             addr += 4 * (e & 1);                                        \
             d[H4(e)] = (mask & 1) ? cpu_ldl_data_ra(env, addr, GETPC()) : 0; \
+            if (WB && (e & 1)) {                                        \
+                m[H4(e & ~1)] = addr - 4;                               \
+            }                                                           \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }
 
-#define DO_VSTR64_SG(OP, ADDRFN)                                        \
+#define DO_VSTR64_SG(OP, ADDRFN, WB)                                    \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
         uint32_t *d = vd;                                               \
         uint32_t *m = vm;                                               \
         uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
-        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
             addr = ADDRFN(base, m[H4(e & ~1)]);                         \
             addr += 4 * (e & 1);                                        \
             if (mask & 1) {                                             \
                 cpu_stl_data_ra(env, addr, d[H4(e)], GETPC());          \
             }                                                           \
+            if (WB && (e & 1)) {                                        \
+                m[H4(e & ~1)] = addr - 4;                               \
+            }                                                           \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }
@@ -311,36 +333,41 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 #define ADDR_ADD_OSW(BASE, OFFSET) ((BASE) + ((OFFSET) << 2))
 #define ADDR_ADD_OSD(BASE, OFFSET) ((BASE) + ((OFFSET) << 3))
 
-DO_VLDR_SG(vldrb_sg_sh, ldsb, 2, int16_t, uint16_t, ADDR_ADD)
-DO_VLDR_SG(vldrb_sg_sw, ldsb, 4, int32_t, uint32_t, ADDR_ADD)
-DO_VLDR_SG(vldrh_sg_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_sh, ldsb, 2, int16_t, uint16_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrb_sg_sw, ldsb, 4, int32_t, uint32_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrh_sg_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD, false)
 
-DO_VLDR_SG(vldrb_sg_ub, ldub, 1, uint8_t, uint8_t, ADDR_ADD)
-DO_VLDR_SG(vldrb_sg_uh, ldub, 2, uint16_t, uint16_t, ADDR_ADD)
-DO_VLDR_SG(vldrb_sg_uw, ldub, 4, uint32_t, uint32_t, ADDR_ADD)
-DO_VLDR_SG(vldrh_sg_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD)
-DO_VLDR_SG(vldrh_sg_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD)
-DO_VLDR_SG(vldrw_sg_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD)
-DO_VLDR64_SG(vldrd_sg_ud, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_ub, ldub, 1, uint8_t, uint8_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrb_sg_uh, ldub, 2, uint16_t, uint16_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrb_sg_uw, ldub, 4, uint32_t, uint32_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrh_sg_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrh_sg_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD, false)
+DO_VLDR_SG(vldrw_sg_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD, false)
+DO_VLDR64_SG(vldrd_sg_ud, ADDR_ADD, false)
 
-DO_VLDR_SG(vldrh_sg_os_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD_OSH)
-DO_VLDR_SG(vldrh_sg_os_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD_OSH)
-DO_VLDR_SG(vldrh_sg_os_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD_OSH)
-DO_VLDR_SG(vldrw_sg_os_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD_OSW)
-DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD)
+DO_VLDR_SG(vldrh_sg_os_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD_OSH, false)
+DO_VLDR_SG(vldrh_sg_os_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD_OSH, false)
+DO_VLDR_SG(vldrh_sg_os_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD_OSH, false)
+DO_VLDR_SG(vldrw_sg_os_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD_OSW, false)
+DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD, false)
 
-DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD)
-DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD)
-DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD)
-DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD)
-DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD)
-DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD)
-DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD)
+DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD, false)
 
-DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH)
-DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH)
-DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW)
-DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD)
+DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW, false)
+DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD, false)
+
+DO_VLDR_SG(vldrw_sg_wb_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD, true)
+DO_VLDR64_SG(vldrd_sg_wb_ud, ADDR_ADD, true)
+DO_VSTR_SG(vstrw_sg_wb_uw, stl, 4, uint32_t, ADDR_ADD, true)
+DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
 
 /*
  * The mergemask(D, R, M) macro performs the operation "*D = R" but
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b0e4bdeb1c5..f4229e308ba 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -300,6 +300,72 @@ static bool trans_VSTR_sg(DisasContext *s, arg_vldst_sg *a)
 
 #undef F
 
+static bool do_ldst_sg_imm(DisasContext *s, arg_vldst_sg_imm *a,
+                           MVEGenLdStSGFn *fn, unsigned msize)
+{
+    uint32_t offset;
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    offset = a->imm << msize;
+    if (!a->a) {
+        offset = -offset;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, tcg_constant_i32(offset));
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_VLDRW_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
+{
+    static MVEGenLdStSGFn * const fns[] = {
+        gen_helper_mve_vldrw_sg_uw,
+        gen_helper_mve_vldrw_sg_wb_uw,
+    };
+    return do_ldst_sg_imm(s, a, fns[a->w], MO_32);
+}
+
+static bool trans_VLDRD_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
+{
+    static MVEGenLdStSGFn * const fns[] = {
+        gen_helper_mve_vldrd_sg_ud,
+        gen_helper_mve_vldrd_sg_wb_ud,
+    };
+    return do_ldst_sg_imm(s, a, fns[a->w], MO_64);
+}
+
+static bool trans_VSTRW_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
+{
+    static MVEGenLdStSGFn * const fns[] = {
+        gen_helper_mve_vstrw_sg_uw,
+        gen_helper_mve_vstrw_sg_wb_uw,
+    };
+    return do_ldst_sg_imm(s, a, fns[a->w], MO_32);
+}
+
+static bool trans_VSTRD_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
+{
+    static MVEGenLdStSGFn * const fns[] = {
+        gen_helper_mve_vstrd_sg_ud,
+        gen_helper_mve_vstrd_sg_wb_ud,
+    };
+    return do_ldst_sg_imm(s, a, fns[a->w], MO_64);
+}
+
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
     TCGv_ptr qd;
-- 
2.20.1


