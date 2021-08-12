Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFAE3EAAAF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 21:14:32 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEG9v-00042Y-G5
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 15:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mEG6l-0002vX-0l; Thu, 12 Aug 2021 15:11:15 -0400
Received: from [201.28.113.2] (port=24543 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mEG6g-0003oT-N9; Thu, 12 Aug 2021 15:11:14 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 12 Aug 2021 16:11:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B9461800021;
 Thu, 12 Aug 2021 16:11:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH] target/ppc: fix vector registers access in gdbstub for
 little-endian
Date: Thu, 12 Aug 2021 16:10:07 -0300
Message-Id: <20210812191007.70331-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Aug 2021 19:11:02.0132 (UTC)
 FILETIME=[CA90CB40:01D78FAD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.825,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

It seems that access to elements of ppc_avr_t should only depend on
msr_le when !CONFIG_USER_ONLY.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
To reproduce the problem, build the following program for ppc64le:

int main(void)
{
    __uint128_t a = 0x1122334455667788llu;
    a <<= 64;
    a |= 0xAABBCCDDEEFFAABBllu;
    asm volatile ("xxlor 4, %x0, %x0\n\t"
                  "xxlor 34, %x0, %x0\n\t"
                  :: "wa" (a) : "vs4", "vs34");
    return 0;
}

Run it with qemu-ppc64le, attach gdb, place a breakpoint after the
second xxlor and print vs4 and vs34:
Breakpoint 1, 0x0000000010000d88 in main ()
(gdb) p/x $vs4
$1 = {uint128 = 0x1122334455667788aabbccddeeffaabb, v2_double = {0x0,
    0x0}, v4_float = {0x0, 0x0, 0x78800000, 0x0}, v4_int32 = {
    0xeeffaabb, 0xaabbccdd, 0x55667788, 0x11223344}, v8_int16 = {
    0xaabb, 0xeeff, 0xccdd, 0xaabb, 0x7788, 0x5566, 0x3344, 0x1122},
  v16_int8 = {0xbb, 0xaa, 0xff, 0xee, 0xdd, 0xcc, 0xbb, 0xaa, 0x88,
    0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11}}
(gdb) p/x $vs34
$2 = {uint128 = 0xaabbccddeeffaabb1122334455667788, v2_double = {0x0,
    0x0}, v4_float = {0x78800000, 0x0, 0x0, 0x0}, v4_int32 = {
    0x55667788, 0x11223344, 0xeeffaabb, 0xaabbccdd}, v8_int16 = {
    0x7788, 0x5566, 0x3344, 0x1122, 0xaabb, 0xeeff, 0xccdd, 0xaabb},
  v16_int8 = {0x88, 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0xbb,
    0xaa, 0xff, 0xee, 0xdd, 0xcc, 0xbb, 0xaa}}

RFC because I'm not quite sure about the fix.
---
 target/ppc/gdbstub.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 09ff1328d4..779e4a4e3f 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -391,10 +391,16 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
 
 static bool avr_need_swap(CPUPPCState *env)
 {
+    bool le;
+#if defined(CONFIG_USER_ONLY)
+    le = false;
+#else
+    le = msr_le;
+#endif
 #ifdef HOST_WORDS_BIGENDIAN
-    return msr_le;
+    return le;
 #else
-    return !msr_le;
+    return !le;
 #endif
 }
 
-- 
2.25.1


