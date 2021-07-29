Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7C3DA24D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:41:27 +0200 (CEST)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Pl-0001fE-QK
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941K-0001CZ-8b
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940v-0001Jo-PU
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q3so6513844wrx.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3JMHCoeAFjJzqhwHh0xa5sRHoOMhf1KEp8ztWJXpo1w=;
 b=sHKHO1F4UbRre3pCsFuhFdXh6CvfpExmj/TEUDK4FD2Jn/3ZAud17aaSAvoXdl6eSZ
 KwZUTL7yNuqnPnhzpu/wV5hNjBbo+6L+m0l3hFULsChIprLErxMHYtbwV6KsoVv38S+Y
 CVyvT8TP5RqnbP2nDoAG5uaPG3ufZSb83gcWyfgfYDL7Yk0laIgQ1km/Hi24BRXoq+vb
 uzkxmOczeaBeKLziyX0zybK8mZdnOyfmkEicS1CRZ0YuIoy6vWP402g14fKAPpj1ejTV
 9Fjj3jXsaU4Dn9F5SRmnz7yYIj+cjEKXsywhtfAvvYM3LkhR64F2r/58EGbE/kCmjeP+
 ctbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3JMHCoeAFjJzqhwHh0xa5sRHoOMhf1KEp8ztWJXpo1w=;
 b=Ncljp9/Pm1DljstOQMzhP6FLT37aIPpTYZqRZeqxccuJIKJlA6Bbx8RHipNT3sBYAP
 ssXE1zpvso9Te0kaG5fJA/cJfTm8kdYyJbqi2MAlDi0KMSTfLrWZcNQMIyY3D8pA+hlK
 gdblAkUiGrJ5zwivGGOUx0aHIjfk+cauZxonCXp1U6N1uK7Oy3Um82M8QnFBD7nYS1tt
 LKq3EouAIsIJFeg2CRsYiRVArkZGKDvRAn0EBlpGzVoWEdIg2jWxddh66df8xidIgUmn
 UhQV1wuahdTgreuNabz9u0YZAzp6C4t1pW9eI4bnvfOHjI7DBRyCVFN9mknh1lbyxKNu
 3YIg==
X-Gm-Message-State: AOAM532aB75WLo+73dNwVrrdWUDd5LiyGMQ0sctpd8u3+X5AKIUhMSB6
 M1ICuscv02FDQTqpWje8oGp7nGTJhJRNiQ==
X-Google-Smtp-Source: ABdhPJzvc+l/+YLJlla3RJrjnRN4JhikeiPcSkxVXR8wJVCDqkHaIgYJD7/cnIkgtrGapwcG9t8iZg==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr3578865wru.254.1627557343107; 
 Thu, 29 Jul 2021 04:15:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 34/53] target/arm: Implement MVE scatter-gather
 immediate forms
Date: Thu, 29 Jul 2021 12:14:53 +0100
Message-Id: <20210729111512.16541-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VLDR/VSTR insns which do scatter-gather using base
addresses from Qm plus or minus an immediate offset (possibly with
writeback). Note that writeback is not predicated but it does have
to honour ECI state, so we have to add an eci_mask check to the
VSTR_SG macros (the VLDR_SG macros already needed this to be able
to distinguish "skip beat" from "set predicated element to 0").

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: UNDEF the UNPREDICTABLE Qd==Qm loads
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      | 10 +++++
 target/arm/mve_helper.c    | 91 ++++++++++++++++++++++++--------------
 target/arm/translate-mve.c | 72 ++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ba842b97c17..a85a7e1b75d 100644
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
index 6c3f45c7195..48882dd7f38 100644
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
index 2b882db1c3d..bbbaa538074 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -213,7 +213,7 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
  * For loads, predicated lanes are zeroed instead of retaining
  * their previous values.
  */
-#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN)            \
+#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN, WB)        \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
@@ -230,25 +230,35 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
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
@@ -258,8 +268,10 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
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
@@ -276,25 +288,35 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
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
@@ -304,36 +326,41 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
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
index 24d4e57ead4..d3cb3396863 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -306,6 +306,78 @@ static bool trans_VSTR_sg(DisasContext *s, arg_vldst_sg *a)
 
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
+    if (a->qd == a->qm) {
+        return false; /* UNPREDICTABLE */
+    }
+    return do_ldst_sg_imm(s, a, fns[a->w], MO_32);
+}
+
+static bool trans_VLDRD_sg_imm(DisasContext *s, arg_vldst_sg_imm *a)
+{
+    static MVEGenLdStSGFn * const fns[] = {
+        gen_helper_mve_vldrd_sg_ud,
+        gen_helper_mve_vldrd_sg_wb_ud,
+    };
+    if (a->qd == a->qm) {
+        return false; /* UNPREDICTABLE */
+    }
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


