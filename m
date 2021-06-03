Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FCC3998BF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:55:44 +0200 (CEST)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeSN-00031D-RF
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQW-0000DX-PQ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:48 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQV-0004cu-0Q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692426; bh=/n4salk8eA40cBPApIq39FMgOsuRQeGTuhkECctA9h8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=pC2CKGugJ2xtWPJDr+fLtxirls/Cz6y/uHD9ZYays7aaN3XfFCyRbkWgWSZ2O0KQy
 duUWGCXBAE8WVuMN8n15zY+vPKt2DV/7OmBZc2XLM+se/SMdJv1xH/czWjOQiNT910
 BTlAIlMxTPkvz4mDufqJxoW7Zwh7LRb9xo1IDtPaKdZyVFM+/vD9nS562eQl5ymrBi
 IuK3xN8Ng+3dtK1xqzbjjcCeXmIEUNhBHsdM2f6asEbPWpGQKHMXgtTN5gccTEp+Bn
 nPmpIkUix6s15H/nZc/Tkq7vixrfJzw6S8H8b7mt7gGr9dsZhTLfL9yXs84mzgAdKD
 G0cxaO2vtwkqQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 919624A0327;
 Thu,  3 Jun 2021 03:53:45 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 8/8] Fixes for seconday CPU start-up.
Date: Wed,  2 Jun 2021 20:53:17 -0700
Message-Id: <20210603035317.6814-9-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603035317.6814-1-thorpej@me.com>
References: <20210603035317.6814-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-03=5F01:2021-06-02=5F03,2021-06-03=5F01,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=786
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106030024
Received-SPF: pass client-ip=17.58.23.185; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06011101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Changes to make secondary CPU start-up work on NetBSD, which depends
on some specific behavior in the architecture specification:

- Change the internal swppal() function to take the new VPTPTR and
  Procedure Value as explicit arguments.  Adapt do_start() to the
  new the new swppal() signature.

- In do_start_wait(), extract the new VPTPTR and PV from the relevant
  HWRPB fields, which will have been initialized by the OS, and pass
  them to swppal().

- In the SWPPAL PAL call, get the value to stuff into PV (r27) from
  a4 (r20), and add a comment describing why this implementation detail
  is allowed by the architecture specification.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 init.c | 25 ++++++++++++++++---------
 pal.S  | 13 ++++++++++---
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/init.c b/init.c
index aee5cef..bfe4d96 100644
--- a/init.c
+++ b/init.c
@@ -313,14 +313,16 @@ init_i8259 (void)
 }
 
 static void __attribute__((noreturn))
-swppal(void *entry, void *pcb)
+swppal(void *entry, void *pcb, unsigned long vptptr, unsigned long pv)
 {
   register int variant __asm__("$16") = 2;	/* OSF/1 PALcode */
   register void *pc __asm__("$17") = entry;
   register unsigned long pa_pcb __asm__("$18") = PA(pcb);
-  register unsigned long vptptr __asm__("$19") = VPTPTR;
+  register unsigned long newvptptr __asm__("$19") = vptptr;
+  register unsigned long newpv __asm__("$20") = pv;
 
-  asm("call_pal 0x0a" : : "r"(variant), "r"(pc), "r"(pa_pcb), "r"(vptptr));
+  asm("call_pal 0x0a" : :
+      "r"(variant), "r"(pc), "r"(pa_pcb), "r"(newvptptr), "r"(newpv));
   __builtin_unreachable ();
 }
 
@@ -339,7 +341,9 @@ do_start(unsigned long memsize, void (*kernel_entry)(void),
   vgahw_init();
   init_hwrpb(memsize, config);
 
-  swppal(kernel_entry ? kernel_entry : do_console, &pcb);
+  void *new_pc = kernel_entry ? kernel_entry : do_console;
+
+  swppal(new_pc, &pcb, VPTPTR, (unsigned long)new_pc);
 }
 
 void
@@ -354,14 +358,16 @@ do_start_wait(unsigned long cpuid)
 	{
 	  /* ??? The only message I know of is "START\r\n".
 	     I can't be bothered to verify more than 4 characters.  */
-	  /* ??? The Linux kernel fills in, but does not require,
-	     CPU_restart_data.  It just sets that to the same address
-	     as CPU_restart itself.  Our swppal *does* put the PC into
-	     $26 and $27, the latter of which the kernel does rely upon.  */
+
+	  /* Use use a private extension to SWPPAL to get the
+	     CPU_restart_data into $27.  Linux fills it in, but does
+	     not require it. Other operating systems, however, do use
+	     CPU_restart_data as part of secondary CPU start-up.  */
 
 	  unsigned int len = hwrpb.processor[cpuid].ipc_buffer[0];
 	  unsigned int msg = hwrpb.processor[cpuid].ipc_buffer[1];
 	  void *CPU_restart = hwrpb.hwrpb.CPU_restart;
+	  unsigned long CPU_restart_data = hwrpb.hwrpb.CPU_restart_data;
 	  __sync_synchronize();
 	  hwrpb.hwrpb.rxrdy = 0;
 
@@ -369,7 +375,8 @@ do_start_wait(unsigned long cpuid)
 	    {
 	      /* Set bootstrap in progress */
 	      hwrpb.processor[cpuid].flags |= 1;
-	      swppal(CPU_restart, hwrpb.processor[cpuid].hwpcb);
+	      swppal(CPU_restart, hwrpb.processor[cpuid].hwpcb,
+		     hwrpb.hwrpb.vptb, CPU_restart_data);
 	    }
 	}
     }
diff --git a/pal.S b/pal.S
index 015a829..7e3a62c 100644
--- a/pal.S
+++ b/pal.S
@@ -566,6 +566,8 @@ ENDFN	CallPal_Cserve_Cont
  *	r17 (a1) = New PC
  *	r18 (a2) = New PCB
  *	r19 (a3) = New VptPtr
+ *	r20 (a4) = New Procedure Value (to place into $27)
+ *	           (Non-standard; See note below.)
  * 
  * OUTPUT PARAMETERS:
  *
@@ -574,10 +576,15 @@ ENDFN	CallPal_Cserve_Cont
  *			1 - Unknown PALcode variant
  *			2 - Known PALcode variant, but PALcode not loaded
  *
- *	r26 (ra) = r27 (pv) = New PC
+ *	r26 (ra) = New PC
+ *	r27 (pv) = From r20
  *		Note that this is non-architected, but is relied on by
  *		the usage of SwpPal within our own console code in order
- *		to simplify its use within C code.
+ *		to simplify its use within C code.  We can get away with
+ *		the extra non-standard argument (in $20) because as
+ *		architected, all registers except SP and R0 are
+ *		UNPREDICTABLE; therefore private internal usage is
+ *		fine.
  *
  */
 	ORG_CALL_PAL_PRIV(0x0A)
@@ -624,7 +631,7 @@ CallPal_SwpPal_Cont:
 	mtpr	$31, qemu_tbia		// Flush TLB for new PTBR
 
 	mov	a1, $26
-	mov	a1, $27
+	mov	a4, $27
 	hw_ret	(a1)
 ENDFN	CallPal_SwpPal_Cont
 	.previous
-- 
2.30.2


