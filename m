Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F151725B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:18:18 +0200 (CEST)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXoX-0007Jk-88
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFn-0005sS-3o; Mon, 02 May 2022 10:42:23 -0400
Received: from [187.72.171.209] (port=26627 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFk-0003MH-ND; Mon, 02 May 2022 10:42:22 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 2 May 2022 11:40:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 762708001CD;
 Mon,  2 May 2022 11:40:06 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 21/21] target/ppc: Change MSR_* to follow POWER ISA
 numbering convention
Date: Mon,  2 May 2022 11:39:34 -0300
Message-Id: <20220502143934.71908-22-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 May 2022 14:40:06.0917 (UTC)
 FILETIME=[84581350:01D85E32]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today we have the issue where MSR_* values are the 'inverted order'
bit numbers from what the ISA specifies. e.g. MSR_LE is bit 63 but
is defined as 0 in QEMU.

Add a macro to be used to convert from QEMU order to ISA order.

This solution requires less changes than to use the already defined
PPC_BIT macro, which would turn MSR_* in masks instead of the numbers
itself.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

It'll also allow other places in cpu.h to be changed, like FSCR_*,
TEXASR_*, and FPSCR_*.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 87 ++++++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5cd9d88555..9ed2dbb7bd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -38,6 +38,7 @@
 #define PPC_ELF_MACHINE     EM_PPC
 #endif
 
+#define PPC_BIT_NR(bit)         (63 - (bit))
 #define PPC_BIT(bit)            (0x8000000000000000ULL >> (bit))
 #define PPC_BIT32(bit)          (0x80000000 >> (bit))
 #define PPC_BIT8(bit)           (0x80 >> (bit))
@@ -310,49 +311,49 @@ typedef enum {
 
 /*****************************************************************************/
 /* Machine state register bits definition                                    */
-#define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
-#define MSR_TAG  62 /* Tag-active mode (POWERx ?)                            */
-#define MSR_ISF  61 /* Sixty-four-bit interrupt mode on 630                  */
-#define MSR_HV   60 /* hypervisor state                               hflags */
-#define MSR_TS0  34 /* Transactional state, 2 bits (Book3s)                  */
-#define MSR_TS1  33
-#define MSR_TM   32 /* Transactional Memory Available (Book3s)               */
-#define MSR_CM   31 /* Computation mode for BookE                     hflags */
-#define MSR_ICM  30 /* Interrupt computation mode for BookE                  */
-#define MSR_GS   28 /* guest state for BookE                                 */
-#define MSR_UCLE 26 /* User-mode cache lock enable for BookE                 */
-#define MSR_VR   25 /* altivec available                            x hflags */
-#define MSR_SPE  25 /* SPE enable for BookE                         x hflags */
-#define MSR_VSX  23 /* Vector Scalar Extension (ISA 2.06 and later) x hflags */
-#define MSR_S    22 /* Secure state                                          */
-#define MSR_KEY  19 /* key bit on 603e                                       */
-#define MSR_POW  18 /* Power management                                      */
-#define MSR_WE   18 /* Wait State Enable on 405                              */
-#define MSR_TGPR 17 /* TGPR usage on 602/603                        x        */
-#define MSR_CE   17 /* Critical interrupt enable on embedded PowerPC x       */
-#define MSR_ILE  16 /* Interrupt little-endian mode                          */
-#define MSR_EE   15 /* External interrupt enable                             */
-#define MSR_PR   14 /* Problem state                                  hflags */
-#define MSR_FP   13 /* Floating point available                       hflags */
-#define MSR_ME   12 /* Machine check interrupt enable                        */
-#define MSR_FE0  11 /* Floating point exception mode 0                       */
-#define MSR_SE   10 /* Single-step trace enable                     x hflags */
-#define MSR_DWE  10 /* Debug wait enable on 405                     x        */
-#define MSR_UBLE 10 /* User BTB lock enable on e500                 x        */
-#define MSR_BE   9  /* Branch trace enable                          x hflags */
-#define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x        */
-#define MSR_FE1  8  /* Floating point exception mode 1                       */
-#define MSR_AL   7  /* AL bit on POWER                                       */
-#define MSR_EP   6  /* Exception prefix on 601                               */
-#define MSR_IR   5  /* Instruction relocate                                  */
-#define MSR_DR   4  /* Data relocate                                         */
-#define MSR_IS   5  /* Instruction address space (BookE)                     */
-#define MSR_DS   4  /* Data address space (BookE)                            */
-#define MSR_PE   3  /* Protection enable on 403                              */
-#define MSR_PX   2  /* Protection exclusive on 403                  x        */
-#define MSR_PMM  2  /* Performance monitor mark on POWER            x        */
-#define MSR_RI   1  /* Recoverable interrupt                        1        */
-#define MSR_LE   0  /* Little-endian mode                           1 hflags */
+#define MSR_SF   PPC_BIT_NR(0)  /* Sixty-four-bit mode                hflags */
+#define MSR_TAG  PPC_BIT_NR(1)  /* Tag-active mode (POWERx ?)                */
+#define MSR_ISF  PPC_BIT_NR(2)  /* Sixty-four-bit interrupt mode on 630      */
+#define MSR_HV   PPC_BIT_NR(3)  /* hypervisor state                   hflags */
+#define MSR_TS0  PPC_BIT_NR(29) /* Transactional state, 2 bits (Book3s)      */
+#define MSR_TS1  PPC_BIT_NR(30)
+#define MSR_TM   PPC_BIT_NR(31) /* Transactional Memory Available (Book3s)   */
+#define MSR_CM   PPC_BIT_NR(32) /* Computation mode for BookE         hflags */
+#define MSR_ICM  PPC_BIT_NR(33) /* Interrupt computation mode for BookE      */
+#define MSR_GS   PPC_BIT_NR(35) /* guest state for BookE                     */
+#define MSR_UCLE PPC_BIT_NR(37) /* User-mode cache lock enable for BookE     */
+#define MSR_VR   PPC_BIT_NR(38) /* altivec available                x hflags */
+#define MSR_SPE  PPC_BIT_NR(38) /* SPE enable for BookE             x hflags */
+#define MSR_VSX  PPC_BIT_NR(40) /* Vector Scalar Extension (>= 2.06)x hflags */
+#define MSR_S    PPC_BIT_NR(41) /* Secure state                              */
+#define MSR_KEY  PPC_BIT_NR(44) /* key bit on 603e                           */
+#define MSR_POW  PPC_BIT_NR(45) /* Power management                          */
+#define MSR_WE   PPC_BIT_NR(45) /* Wait State Enable on 405                  */
+#define MSR_TGPR PPC_BIT_NR(46) /* TGPR usage on 602/603            x        */
+#define MSR_CE   PPC_BIT_NR(46) /* Critical int. enable on embedded PPC x    */
+#define MSR_ILE  PPC_BIT_NR(47) /* Interrupt little-endian mode              */
+#define MSR_EE   PPC_BIT_NR(48) /* External interrupt enable                 */
+#define MSR_PR   PPC_BIT_NR(49) /* Problem state                      hflags */
+#define MSR_FP   PPC_BIT_NR(50) /* Floating point available           hflags */
+#define MSR_ME   PPC_BIT_NR(51) /* Machine check interrupt enable            */
+#define MSR_FE0  PPC_BIT_NR(52) /* Floating point exception mode 0           */
+#define MSR_SE   PPC_BIT_NR(53) /* Single-step trace enable         x hflags */
+#define MSR_DWE  PPC_BIT_NR(53) /* Debug wait enable on 405         x        */
+#define MSR_UBLE PPC_BIT_NR(53) /* User BTB lock enable on e500     x        */
+#define MSR_BE   PPC_BIT_NR(54) /* Branch trace enable              x hflags */
+#define MSR_DE   PPC_BIT_NR(54) /* Debug int. enable on embedded PPC   x     */
+#define MSR_FE1  PPC_BIT_NR(55) /* Floating point exception mode 1           */
+#define MSR_AL   PPC_BIT_NR(56) /* AL bit on POWER                           */
+#define MSR_EP   PPC_BIT_NR(57) /* Exception prefix on 601                   */
+#define MSR_IR   PPC_BIT_NR(58) /* Instruction relocate                      */
+#define MSR_IS   PPC_BIT_NR(58) /* Instruction address space (BookE)         */
+#define MSR_DR   PPC_BIT_NR(59) /* Data relocate                             */
+#define MSR_DS   PPC_BIT_NR(59) /* Data address space (BookE)                */
+#define MSR_PE   PPC_BIT_NR(60) /* Protection enable on 403                  */
+#define MSR_PX   PPC_BIT_NR(61) /* Protection exclusive on 403        x      */
+#define MSR_PMM  PPC_BIT_NR(61) /* Performance monitor mark on POWER  x      */
+#define MSR_RI   PPC_BIT_NR(62) /* Recoverable interrupt            1        */
+#define MSR_LE   PPC_BIT_NR(63) /* Little-endian mode               1 hflags */
 
 FIELD(MSR, SF, MSR_SF, 1)
 FIELD(MSR, TAG, MSR_TAG, 1)
-- 
2.25.1


