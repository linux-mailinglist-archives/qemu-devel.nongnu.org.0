Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3E350D70
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:06:59 +0200 (CEST)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRobd-0000Z7-QX
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP9-0001iM-W8
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:02 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2902)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP5-0004rM-OQ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249235; x=1648785235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3lVWv+DJS5ulzhzOx1I/9q6CjzuqWvsRRa6vAdC+qs=;
 b=QneK0BUsH4ysqL2ajf7wiEw+6iM/znEYf3y9U0Tccg8sZOJ9fThIQQd0
 P8xNQux5tWHVVQTomkBdbNosTBHtXC8mxprSE7sIzgwmpPdZB1RzUJcxl
 O3jHAFZes3nsK6BjsAnBIEnra5hQm9SYTDvpEaGz0gUzi+iDyJ83DJK/6 M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:43 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0D6791854; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/21] Hexagon (target/hexagon) load into shifted register
 instructions
Date: Wed, 31 Mar 2021 22:53:32 -0500
Message-Id: <1617249213-22667-21-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following instructions are added
    L2_loadalignb_io          Ryy32 = memb_fifo(Rs32+#s11:1)
    L2_loadalignh_io          Ryy32 = memh_fifo(Rs32+#s11:1)
    L4_loadalignb_ur          Ryy32 = memb_fifo(Rt32<<#u2+#U6)
    L4_loadalignh_ur          Ryy32 = memh_fifo(Rt32<<#u2+#U6)
    L4_loadalignb_ap          Ryy32 = memb_fifo(Re32=#U6)
    L4_loadalignh_ap          Ryy32 = memh_fifo(Re32=#U6)
    L2_loadalignb_pr          Ryy32 = memb_fifo(Rx32++Mu2)
    L2_loadalignh_pr          Ryy32 = memh_fifo(Rx32++Mu2)
    L2_loadalignb_pbr         Ryy32 = memb_fifo(Rx32++Mu2:brev)
    L2_loadalignh_pbr         Ryy32 = memh_fifo(Rx32++Mu2:brev)
    L2_loadalignb_pi          Ryy32 = memb_fifo(Rx32++#s4:1)
    L2_loadalignh_pi          Ryy32 = memh_fifo(Rx32++#s4:1)
    L2_loadalignb_pci         Ryy32 = memb_fifo(Rx32++#s4:1:circ(Mu2))
    L2_loadalignh_pci         Ryy32 = memh_fifo(Rx32++#s4:1:circ(Mu2))
    L2_loadalignb_pcr         Ryy32 = memb_fifo(Rx32++I:circ(Mu2))
    L2_loadalignh_pcr         Ryy32 = memh_fifo(Rx32++I:circ(Mu2))

Test cases in tests/tcg/hexagon/load_align.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              |  66 ++++++
 target/hexagon/imported/encode_pp.def |   3 +
 target/hexagon/imported/ldst.idef     |  19 ++
 tests/tcg/hexagon/Makefile.target     |   1 +
 tests/tcg/hexagon/load_align.c        | 415 ++++++++++++++++++++++++++++++++++
 5 files changed, 504 insertions(+)
 create mode 100644 tests/tcg/hexagon/load_align.c

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 570389f..658d455 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -261,6 +261,72 @@
     fGEN_TCG_loadbXw4(GET_EA_pi, true)
 
 /*
+ * These instructions load a half word, shift the destination right by 16 bits
+ * and place the loaded value in the high half word of the destination pair.
+ * The GET_EA macro determines the addressing mode.
+ */
+#define fGEN_TCG_loadalignh(GET_EA) \
+    do { \
+        TCGv tmp = tcg_temp_new(); \
+        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
+        GET_EA;  \
+        fLOAD(1, 2, u, EA, tmp);  \
+        tcg_gen_extu_i32_i64(tmp_i64, tmp); \
+        tcg_gen_shri_i64(RyyV, RyyV, 16); \
+        tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 48, 16); \
+        tcg_temp_free(tmp); \
+        tcg_temp_free_i64(tmp_i64); \
+    } while (0)
+
+#define fGEN_TCG_L4_loadalignh_ur(SHORTCODE) \
+    fGEN_TCG_loadalignh(fEA_IRs(UiV, RtV, uiV))
+#define fGEN_TCG_L2_loadalignh_io(SHORTCODE) \
+    fGEN_TCG_loadalignh(fEA_RI(RsV, siV))
+#define fGEN_TCG_L2_loadalignh_pci(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_pci)
+#define fGEN_TCG_L2_loadalignh_pcr(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_pcr(1))
+#define fGEN_TCG_L4_loadalignh_ap(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_ap)
+#define fGEN_TCG_L2_loadalignh_pr(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_pr)
+#define fGEN_TCG_L2_loadalignh_pbr(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_pbr)
+#define fGEN_TCG_L2_loadalignh_pi(SHORTCODE) \
+    fGEN_TCG_loadalignh(GET_EA_pi)
+
+/* Same as above, but loads a byte instead of half word */
+#define fGEN_TCG_loadalignb(GET_EA) \
+    do { \
+        TCGv tmp = tcg_temp_new(); \
+        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
+        GET_EA;  \
+        fLOAD(1, 1, u, EA, tmp);  \
+        tcg_gen_extu_i32_i64(tmp_i64, tmp); \
+        tcg_gen_shri_i64(RyyV, RyyV, 8); \
+        tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 56, 8); \
+        tcg_temp_free(tmp); \
+        tcg_temp_free_i64(tmp_i64); \
+    } while (0)
+
+#define fGEN_TCG_L2_loadalignb_io(SHORTCODE) \
+    fGEN_TCG_loadalignb(fEA_RI(RsV, siV))
+#define fGEN_TCG_L4_loadalignb_ur(SHORTCODE) \
+    fGEN_TCG_loadalignb(fEA_IRs(UiV, RtV, uiV))
+#define fGEN_TCG_L2_loadalignb_pci(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_pci)
+#define fGEN_TCG_L2_loadalignb_pcr(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_pcr(0))
+#define fGEN_TCG_L4_loadalignb_ap(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_ap)
+#define fGEN_TCG_L2_loadalignb_pr(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_pr)
+#define fGEN_TCG_L2_loadalignb_pbr(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_pbr)
+#define fGEN_TCG_L2_loadalignb_pi(SHORTCODE) \
+    fGEN_TCG_loadalignb(GET_EA_pi)
+
+/*
  * Predicated loads
  * Here is a primer to understand the tag names
  *
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index e3582eb..dc4eba4 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -348,6 +348,9 @@ STD_LD_ENC(bzw2,"0 011")
 STD_LD_ENC(bsw4,"0 111")
 STD_LD_ENC(bsw2,"0 001")
 
+STD_LDX_ENC(alignh,"0 010")
+STD_LDX_ENC(alignb,"0 100")
+
 STD_LD_ENC(rb,  "1 000")
 STD_LD_ENC(rub, "1 001")
 STD_LD_ENC(rh,  "1 010")
diff --git a/target/hexagon/imported/ldst.idef b/target/hexagon/imported/ldst.idef
index 95c0470..359d3b7 100644
--- a/target/hexagon/imported/ldst.idef
+++ b/target/hexagon/imported/ldst.idef
@@ -80,6 +80,25 @@ ATTRIBS(A_LOAD),"2",
 
 
 
+STD_LD_AMODES(loadalignh, "Ryy32=memh_fifo", "Load Half-word into shifted vector",
+ATTRIBS(A_LOAD),"1",
+{
+ fHIDE(size8u_t tmpV;)
+ fLOAD(1,2,u,EA,tmpV);
+ RyyV = (((size8u_t)RyyV)>>16)|(tmpV<<48);
+},1)
+
+
+STD_LD_AMODES(loadalignb, "Ryy32=memb_fifo", "Load byte into shifted vector",
+ATTRIBS(A_LOAD),"0",
+{
+ fHIDE(size8u_t tmpV;)
+ fLOAD(1,1,u,EA,tmpV);
+ RyyV = (((size8u_t)RyyV)>>8)|(tmpV<<56);
+},0)
+
+
+
 
 /* The set of addressing modes standard to all Store instructions */
 #define STD_ST_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS,SCALE)\
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 5411eee..124b729 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -44,6 +44,7 @@ HEX_TESTS += mem_noshuf
 HEX_TESTS += circ
 HEX_TESTS += brev
 HEX_TESTS += load_unpack
+HEX_TESTS += load_align
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
diff --git a/tests/tcg/hexagon/load_align.c b/tests/tcg/hexagon/load_align.c
new file mode 100644
index 0000000..12fc9cb
--- /dev/null
+++ b/tests/tcg/hexagon/load_align.c
@@ -0,0 +1,415 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Test load align instructions
+ *
+ * Example
+ *     r1:0 = memh_fifo(r1+#0)
+ * loads a half word from memory, shifts the destination register
+ * right by one half word and inserts the loaded value into the high
+ * half word of the destination.
+ *
+ * There are 8 addressing modes and byte and half word variants, for a
+ * total of 16 instructions to test
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+int err;
+
+char buf[16] __attribute__((aligned(1 << 16)));
+
+void init_buf(void)
+{
+    int i;
+    for (i = 0; i < 16; i++) {
+        buf[i] = i + 1;
+    }
+}
+
+void __check(int line, long long result, long long expect)
+{
+    if (result != expect) {
+        printf("ERROR at line %d: 0x%016llx != 0x%016llx\n",
+               line, result, expect);
+        err++;
+    }
+}
+
+#define check(RES, EXP) __check(__LINE__, RES, EXP)
+
+void __checkp(int line, void *p, void *expect)
+{
+    if (p != expect) {
+        printf("ERROR at line %d: 0x%p != 0x%p\n", line, p, expect);
+        err++;
+    }
+}
+
+#define checkp(RES, EXP) __checkp(__LINE__, RES, EXP)
+
+/*
+ ****************************************************************************
+ * _io addressing mode (addr + offset)
+ */
+#define LOAD_io(SZ, RES, ADDR, OFF) \
+    __asm__( \
+        "%0 = mem" #SZ "_fifo(%1+#" #OFF ")\n\t" \
+        : "+r"(RES) \
+        : "r"(ADDR))
+#define LOAD_io_b(RES, ADDR, OFF) \
+    LOAD_io(b, RES, ADDR, OFF)
+#define LOAD_io_h(RES, ADDR, OFF) \
+    LOAD_io(h, RES, ADDR, OFF)
+
+#define TEST_io(NAME, SZ, SIZE, EXP1, EXP2, EXP3, EXP4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    LOAD_io_##SZ(result, buf, 0 * (SIZE)); \
+    check(result, (EXP1)); \
+    LOAD_io_##SZ(result, buf, 1 * (SIZE)); \
+    check(result, (EXP2)); \
+    LOAD_io_##SZ(result, buf, 2 * (SIZE)); \
+    check(result, (EXP3)); \
+    LOAD_io_##SZ(result, buf, 3 * (SIZE)); \
+    check(result, (EXP4)); \
+}
+
+TEST_io(loadalignb_io, b, 1,
+        0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+        0x030201ffffffffffLL, 0x04030201ffffffffLL)
+TEST_io(loadalignh_io, h, 2,
+        0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+        0x060504030201ffffLL, 0x0807060504030201LL)
+
+/*
+ ****************************************************************************
+ * _ur addressing mode (index << offset + base)
+ */
+#define LOAD_ur(SZ, RES, SHIFT, IDX) \
+    __asm__( \
+        "%0 = mem" #SZ "_fifo(%1<<#" #SHIFT " + ##buf)\n\t" \
+        : "+r"(RES) \
+        : "r"(IDX))
+#define LOAD_ur_b(RES, SHIFT, IDX) \
+    LOAD_ur(b, RES, SHIFT, IDX)
+#define LOAD_ur_h(RES, SHIFT, IDX) \
+    LOAD_ur(h, RES, SHIFT, IDX)
+
+#define TEST_ur(NAME, SZ, SHIFT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    LOAD_ur_##SZ(result, (SHIFT), 0); \
+    check(result, (RES1)); \
+    LOAD_ur_##SZ(result, (SHIFT), 1); \
+    check(result, (RES2)); \
+    LOAD_ur_##SZ(result, (SHIFT), 2); \
+    check(result, (RES3)); \
+    LOAD_ur_##SZ(result, (SHIFT), 3); \
+    check(result, (RES4)); \
+}
+
+TEST_ur(loadalignb_ur, b, 1,
+        0x01ffffffffffffffLL, 0x0301ffffffffffffLL,
+        0x050301ffffffffffLL, 0x07050301ffffffffLL)
+TEST_ur(loadalignh_ur, h, 1,
+        0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+        0x060504030201ffffLL, 0x0807060504030201LL)
+
+/*
+ ****************************************************************************
+ * _ap addressing mode (addr = base)
+ */
+#define LOAD_ap(SZ, RES, PTR, ADDR) \
+    __asm__(  \
+        "%0 = mem" #SZ "_fifo(%1 = ##" #ADDR ")\n\t" \
+        : "+r"(RES), "=r"(PTR))
+#define LOAD_ap_b(RES, PTR, ADDR) \
+    LOAD_ap(b, RES, PTR, ADDR)
+#define LOAD_ap_h(RES, PTR, ADDR) \
+    LOAD_ap(h, RES, PTR, ADDR)
+
+#define TEST_ap(NAME, SZ, SIZE, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr; \
+    LOAD_ap_##SZ(result, ptr, (buf + 0 * (SIZE))); \
+    check(result, (RES1)); \
+    checkp(ptr, &buf[0 * (SIZE)]); \
+    LOAD_ap_##SZ(result, ptr, (buf + 1 * (SIZE))); \
+    check(result, (RES2)); \
+    checkp(ptr, &buf[1 * (SIZE)]); \
+    LOAD_ap_##SZ(result, ptr, (buf + 2 * (SIZE))); \
+    check(result, (RES3)); \
+    checkp(ptr, &buf[2 * (SIZE)]); \
+    LOAD_ap_##SZ(result, ptr, (buf + 3 * (SIZE))); \
+    check(result, (RES4)); \
+    checkp(ptr, &buf[3 * (SIZE)]); \
+}
+
+TEST_ap(loadalignb_ap, b, 1,
+        0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+        0x030201ffffffffffLL, 0x04030201ffffffffLL)
+TEST_ap(loadalignh_ap, h, 2,
+        0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+        0x060504030201ffffLL, 0x0807060504030201LL)
+
+/*
+ ****************************************************************************
+ * _rp addressing mode (addr ++ modifer-reg)
+ */
+#define LOAD_pr(SZ, RES, PTR, INC) \
+    __asm__( \
+        "m0 = %2\n\t" \
+        "%0 = mem" #SZ "_fifo(%1++m0)\n\t" \
+        : "+r"(RES), "+r"(PTR) \
+        : "r"(INC) \
+        : "m0")
+#define LOAD_pr_b(RES, PTR, INC) \
+    LOAD_pr(b, RES, PTR, INC)
+#define LOAD_pr_h(RES, PTR, INC) \
+    LOAD_pr(h, RES, PTR, INC)
+
+#define TEST_pr(NAME, SZ, SIZE, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr = buf; \
+    LOAD_pr_##SZ(result, ptr, (SIZE)); \
+    check(result, (RES1)); \
+    checkp(ptr, &buf[1 * (SIZE)]); \
+    LOAD_pr_##SZ(result, ptr, (SIZE)); \
+    check(result, (RES2)); \
+    checkp(ptr, &buf[2 * (SIZE)]); \
+    LOAD_pr_##SZ(result, ptr, (SIZE)); \
+    check(result, (RES3)); \
+    checkp(ptr, &buf[3 * (SIZE)]); \
+    LOAD_pr_##SZ(result, ptr, (SIZE)); \
+    check(result, (RES4)); \
+    checkp(ptr, &buf[4 * (SIZE)]); \
+}
+
+TEST_pr(loadalignb_pr, b, 1,
+        0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+        0x030201ffffffffffLL, 0x04030201ffffffffLL)
+TEST_pr(loadalignh_pr, h, 2,
+        0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+        0x060504030201ffffLL, 0x0807060504030201LL)
+
+/*
+ ****************************************************************************
+ * _pbr addressing mode (addr ++ modifer-reg:brev)
+ */
+#define LOAD_pbr(SZ, RES, PTR) \
+    __asm__( \
+        "r4 = #(1 << (16 - 3))\n\t" \
+        "m0 = r4\n\t" \
+        "%0 = mem" #SZ "_fifo(%1++m0:brev)\n\t" \
+        : "+r"(RES), "+r"(PTR) \
+        : \
+        : "r4", "m0")
+#define LOAD_pbr_b(RES, PTR) \
+    LOAD_pbr(b, RES, PTR)
+#define LOAD_pbr_h(RES, PTR) \
+    LOAD_pbr(h, RES, PTR)
+
+#define TEST_pbr(NAME, SZ, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr = buf; \
+    LOAD_pbr_##SZ(result, ptr); \
+    check(result, (RES1)); \
+    LOAD_pbr_##SZ(result, ptr); \
+    check(result, (RES2)); \
+    LOAD_pbr_##SZ(result, ptr); \
+    check(result, (RES3)); \
+    LOAD_pbr_##SZ(result, ptr); \
+    check(result, (RES4)); \
+}
+
+TEST_pbr(loadalignb_pbr, b,
+    0x01ffffffffffffffLL, 0x0501ffffffffffffLL,
+    0x030501ffffffffffLL, 0x07030501ffffffffLL)
+TEST_pbr(loadalignh_pbr, h,
+    0x0201ffffffffffffLL, 0x06050201ffffffffLL,
+    0x040306050201ffffLL, 0x0807040306050201LL)
+
+/*
+ ****************************************************************************
+ * _pi addressing mode (addr ++ inc)
+ */
+#define LOAD_pi(SZ, RES, PTR, INC) \
+    __asm__( \
+        "%0 = mem" #SZ "_fifo(%1++#" #INC ")\n\t" \
+        : "+r"(RES), "+r"(PTR))
+#define LOAD_pi_b(RES, PTR, INC) \
+    LOAD_pi(b, RES, PTR, INC)
+#define LOAD_pi_h(RES, PTR, INC) \
+    LOAD_pi(h, RES, PTR, INC)
+
+#define TEST_pi(NAME, SZ, INC, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr = buf; \
+    LOAD_pi_##SZ(result, ptr, (INC)); \
+    check(result, (RES1)); \
+    checkp(ptr, &buf[1 * (INC)]); \
+    LOAD_pi_##SZ(result, ptr, (INC)); \
+    check(result, (RES2)); \
+    checkp(ptr, &buf[2 * (INC)]); \
+    LOAD_pi_##SZ(result, ptr, (INC)); \
+    check(result, (RES3)); \
+    checkp(ptr, &buf[3 * (INC)]); \
+    LOAD_pi_##SZ(result, ptr, (INC)); \
+    check(result, (RES4)); \
+    checkp(ptr, &buf[4 * (INC)]); \
+}
+
+TEST_pi(loadalignb_pi, b, 1,
+        0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+        0x030201ffffffffffLL, 0x04030201ffffffffLL)
+TEST_pi(loadalignh_pi, h, 2,
+        0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+        0x060504030201ffffLL, 0x0807060504030201LL)
+
+/*
+ ****************************************************************************
+ * _pci addressing mode (addr ++ inc:circ)
+ */
+#define LOAD_pci(SZ, RES, PTR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %3\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %2\n\t" \
+        "%0 = mem" #SZ "_fifo(%1++#" #INC ":circ(m0))\n\t" \
+        : "+r"(RES), "+r"(PTR) \
+        : "r"(START), "r"(LEN) \
+        : "r4", "m0", "cs0")
+#define LOAD_pci_b(RES, PTR, START, LEN, INC) \
+    LOAD_pci(b, RES, PTR, START, LEN, INC)
+#define LOAD_pci_h(RES, PTR, START, LEN, INC) \
+    LOAD_pci(h, RES, PTR, START, LEN, INC)
+
+#define TEST_pci(NAME, SZ, LEN, INC, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr = buf; \
+    LOAD_pci_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES1)); \
+    checkp(ptr, &buf[(1 * (INC)) % (LEN)]); \
+    LOAD_pci_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES2)); \
+    checkp(ptr, &buf[(2 * (INC)) % (LEN)]); \
+    LOAD_pci_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES3)); \
+    checkp(ptr, &buf[(3 * (INC)) % (LEN)]); \
+    LOAD_pci_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES4)); \
+    checkp(ptr, &buf[(4 * (INC)) % (LEN)]); \
+}
+
+TEST_pci(loadalignb_pci, b, 2, 1,
+    0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+    0x010201ffffffffffLL, 0x02010201ffffffffLL)
+TEST_pci(loadalignh_pci, h, 4, 2,
+    0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+    0x020104030201ffffLL, 0x0403020104030201LL)
+
+/*
+ ****************************************************************************
+ * _pcr addressing mode (addr ++ I:circ(modifier-reg))
+ */
+#define LOAD_pcr(SZ, RES, PTR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %2\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %3\n\t" \
+        "%0 = mem" #SZ "_fifo(%1++I:circ(m1))\n\t" \
+        : "+r"(RES), "+r"(PTR) \
+        : "r"((((INC) & 0x7f) << 17) | ((LEN) & 0x1ffff)), \
+          "r"(START) \
+        : "r4", "m1", "cs1")
+#define LOAD_pcr_b(RES, PTR, START, LEN, INC) \
+    LOAD_pcr(b, RES, PTR, START, LEN, INC)
+#define LOAD_pcr_h(RES, PTR, START, LEN, INC) \
+    LOAD_pcr(h, RES, PTR, START, LEN, INC)
+
+#define TEST_pcr(NAME, SZ, SIZE, LEN, INC, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    long long result = ~0LL; \
+    void *ptr = buf; \
+    LOAD_pcr_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES1)); \
+    checkp(ptr, &buf[(1 * (INC) * (SIZE)) % (LEN)]); \
+    LOAD_pcr_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES2)); \
+    checkp(ptr, &buf[(2 * (INC) * (SIZE)) % (LEN)]); \
+    LOAD_pcr_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES3)); \
+    checkp(ptr, &buf[(3 * (INC) * (SIZE)) % (LEN)]); \
+    LOAD_pcr_##SZ(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES4)); \
+    checkp(ptr, &buf[(4 * (INC) * (SIZE)) % (LEN)]); \
+}
+
+TEST_pcr(loadalignb_pcr, b, 1, 2, 1,
+    0x01ffffffffffffffLL, 0x0201ffffffffffffLL,
+    0x010201ffffffffffLL, 0x02010201ffffffffLL)
+TEST_pcr(loadalignh_pcr, h, 2, 4, 1,
+    0x0201ffffffffffffLL, 0x04030201ffffffffLL,
+    0x020104030201ffffLL, 0x0403020104030201LL)
+
+int main()
+{
+    init_buf();
+
+    test_loadalignb_io();
+    test_loadalignh_io();
+
+    test_loadalignb_ur();
+    test_loadalignh_ur();
+
+    test_loadalignb_ap();
+    test_loadalignh_ap();
+
+    test_loadalignb_pr();
+    test_loadalignh_pr();
+
+    test_loadalignb_pbr();
+    test_loadalignh_pbr();
+
+    test_loadalignb_pi();
+    test_loadalignh_pi();
+
+    test_loadalignb_pci();
+    test_loadalignh_pci();
+
+    test_loadalignb_pcr();
+    test_loadalignh_pcr();
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
-- 
2.7.4


