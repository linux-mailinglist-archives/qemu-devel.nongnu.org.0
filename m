Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163765554A6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:40:16 +0200 (CEST)
Received: from localhost ([::1]:48396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o46D0-0007Nw-QI
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o465d-0000HD-E4; Wed, 22 Jun 2022 15:32:37 -0400
Received: from [187.72.171.209] (port=11111 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o465b-0001jv-4f; Wed, 22 Jun 2022 15:32:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 22 Jun 2022 16:32:30 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 764788000AD;
 Wed, 22 Jun 2022 16:32:30 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, lucas.coutinho@eldorado.org.br,
 leandro.lupori@eldorado.org.br
Subject: [PATCH] target/ppc: Change FPSCR_* to follow POWER ISA numbering
 convention
Date: Wed, 22 Jun 2022 16:32:03 -0300
Message-Id: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Jun 2022 19:32:30.0742 (UTC)
 FILETIME=[D0589360:01D8866E]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FPSCR_* bit values in QEMU are in the 'inverted' order from what Power
ISA defines (e.g. FPSCR.FI is bit 46 but is defined as 17 in cpu.h).
Now that PPC_BIT_NR macro was introduced to fix this situation for the
MSR bits, we can use it for the FPSCR bits too.

Also, adjust the comments to make then fit in 80 columns

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 72 ++++++++++++++++++++++++------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f37..c78f64cced 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -694,42 +694,42 @@ enum {
 
 /*****************************************************************************/
 /* Floating point status and control register                                */
-#define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control           */
-#define FPSCR_DRN1   33 /* Decimal Floating-Point rounding control           */
-#define FPSCR_DRN0   32 /* Decimal Floating-Point rounding control           */
-#define FPSCR_FX     31 /* Floating-point exception summary                  */
-#define FPSCR_FEX    30 /* Floating-point enabled exception summary          */
-#define FPSCR_VX     29 /* Floating-point invalid operation exception summ.  */
-#define FPSCR_OX     28 /* Floating-point overflow exception                 */
-#define FPSCR_UX     27 /* Floating-point underflow exception                */
-#define FPSCR_ZX     26 /* Floating-point zero divide exception              */
-#define FPSCR_XX     25 /* Floating-point inexact exception                  */
-#define FPSCR_VXSNAN 24 /* Floating-point invalid operation exception (sNan) */
-#define FPSCR_VXISI  23 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXIDI  22 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXZDZ  21 /* Floating-point invalid operation exception (zero) */
-#define FPSCR_VXIMZ  20 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXVC   19 /* Floating-point invalid operation exception (comp) */
-#define FPSCR_FR     18 /* Floating-point fraction rounded                   */
-#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
-#define FPSCR_C      16 /* Floating-point result class descriptor            */
-#define FPSCR_FL     15 /* Floating-point less than or negative              */
-#define FPSCR_FG     14 /* Floating-point greater than or negative           */
-#define FPSCR_FE     13 /* Floating-point equal or zero                      */
-#define FPSCR_FU     12 /* Floating-point unordered or NaN                   */
-#define FPSCR_FPCC   12 /* Floating-point condition code                     */
-#define FPSCR_FPRF   12 /* Floating-point result flags                       */
-#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
-#define FPSCR_VXSQRT 9  /* Floating-point invalid operation exception (sqrt) */
-#define FPSCR_VXCVI  8  /* Floating-point invalid operation exception (int)  */
-#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
-#define FPSCR_OE     6  /* Floating-point overflow exception enable          */
-#define FPSCR_UE     5  /* Floating-point underflow exception enable          */
-#define FPSCR_ZE     4  /* Floating-point zero divide exception enable       */
-#define FPSCR_XE     3  /* Floating-point inexact exception enable           */
-#define FPSCR_NI     2  /* Floating-point non-IEEE mode                      */
-#define FPSCR_RN1    1
-#define FPSCR_RN0    0  /* Floating-point rounding control                   */
+#define FPSCR_DRN2   PPC_BIT_NR(29) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_DRN1   PPC_BIT_NR(30) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_DRN0   PPC_BIT_NR(31) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_FX     PPC_BIT_NR(32) /* Floating-point exception summary      */
+#define FPSCR_FEX    PPC_BIT_NR(33) /* Floating-point enabled exception summ.*/
+#define FPSCR_VX     PPC_BIT_NR(34) /* Floating-point invalid op. excp. summ.*/
+#define FPSCR_OX     PPC_BIT_NR(35) /* Floating-point overflow exception     */
+#define FPSCR_UX     PPC_BIT_NR(36) /* Floating-point underflow exceptio     */
+#define FPSCR_ZX     PPC_BIT_NR(37) /* Floating-point zero divide exception  */
+#define FPSCR_XX     PPC_BIT_NR(38) /* Floating-point inexact exception      */
+#define FPSCR_VXSNAN PPC_BIT_NR(39) /* Floating-point invalid op. excp (sNan)*/
+#define FPSCR_VXISI  PPC_BIT_NR(40) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXIDI  PPC_BIT_NR(41) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXZDZ  PPC_BIT_NR(42) /* Floating-point invalid op. excp (zero)*/
+#define FPSCR_VXIMZ  PPC_BIT_NR(43) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXVC   PPC_BIT_NR(44) /* Floating-point invalid op. excp (comp)*/
+#define FPSCR_FR     PPC_BIT_NR(45) /* Floating-point fraction rounded       */
+#define FPSCR_FI     PPC_BIT_NR(46) /* Floating-point fraction inexact       */
+#define FPSCR_C      PPC_BIT_NR(47) /* Floating-point result class descriptor*/
+#define FPSCR_FL     PPC_BIT_NR(48) /* Floating-point less than or negative  */
+#define FPSCR_FG     PPC_BIT_NR(49) /* Floating-point greater than or neg.   */
+#define FPSCR_FE     PPC_BIT_NR(50) /* Floating-point equal or zero          */
+#define FPSCR_FU     PPC_BIT_NR(51) /* Floating-point unordered or NaN       */
+#define FPSCR_FPCC   PPC_BIT_NR(51) /* Floating-point condition code         */
+#define FPSCR_FPRF   PPC_BIT_NR(51) /* Floating-point result flags           */
+#define FPSCR_VXSOFT PPC_BIT_NR(53) /* Floating-point invalid op. excp (soft)*/
+#define FPSCR_VXSQRT PPC_BIT_NR(54) /* Floating-point invalid op. excp (sqrt)*/
+#define FPSCR_VXCVI  PPC_BIT_NR(55) /* Floating-point invalid op. excp (int) */
+#define FPSCR_VE     PPC_BIT_NR(56) /* Floating-point invalid op. excp enable*/
+#define FPSCR_OE     PPC_BIT_NR(57) /* Floating-point overflow excp. enable  */
+#define FPSCR_UE     PPC_BIT_NR(58) /* Floating-point underflow excp. enable */
+#define FPSCR_ZE     PPC_BIT_NR(59) /* Floating-point zero divide excp enable*/
+#define FPSCR_XE     PPC_BIT_NR(60) /* Floating-point inexact excp. enable   */
+#define FPSCR_NI     PPC_BIT_NR(61) /* Floating-point non-IEEE mode          */
+#define FPSCR_RN1    PPC_BIT_NR(62)
+#define FPSCR_RN0    PPC_BIT_NR(63) /* Floating-point rounding control       */
 /* Invalid operation exception summary */
 #define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
                       (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
-- 
2.25.1


