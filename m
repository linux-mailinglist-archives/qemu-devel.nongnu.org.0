Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9393998C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:57:37 +0200 (CEST)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeUC-0007XP-6w
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQO-0008C9-AL
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:40 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQM-0004W1-D8
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692417; bh=FAkF1k+wfmz9Tc1lkkvl9YzkzESvXUgL0M6Q3SDhe3M=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=nbgawdWdGmMu4zqEmZxvCZPeuQN9j7ZoTgO2Rb3C/8t1ltGBxO6GARQbm3a97Hmcc
 b+nX6eOftJBkxHqu6xtW//ChGXzaRvDUexG2vuWzZsVuQKGViYYU7d3WXbQQMVXo9F
 4Shxe+g6ISzeZZea3plKcfzi7hP+xC6tC32fLybZV0gosIAnvAQOrySzsrMlef5BD+
 TJ31Xx2hmkhwo3wCfZINsdumLBa6thMa2b8ITHfX73I+d8ajofhuO1rB3ZUJvIB1JT
 THEH6JhYyhHxCHrJTw6tD+v/KmNqcrC8/djK/BoUXhrexMVa8iGnbYsNsc/TL1zWBK
 wu4Jz2QMXSN6w==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 11BB24A02FA;
 Thu,  3 Jun 2021 03:53:37 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 3/8] Fix initialization of the hwrpb.hwrpb.cpuid field.
Date: Wed,  2 Jun 2021 20:53:12 -0700
Message-Id: <20210603035317.6814-4-thorpej@me.com>
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
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
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

Initialize the hwrpb.hwrpb.cpuid field with the primary CPU ID, not
the processor type, as per the architecture specification.  Some
operating systems check and assert this.

Improve a couple of comments.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 init.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/init.c b/init.c
index 429a9ad..b3919b6 100644
--- a/init.c
+++ b/init.c
@@ -141,6 +141,7 @@ init_hwrpb (unsigned long memsize, unsigned long cpus)
   unsigned long pal_pages;
   unsigned long amask;
   unsigned long i;
+  unsigned long proc_type = EV4_CPU;
   
   hwrpb.hwrpb.phys_addr = PA(&hwrpb);
 
@@ -162,12 +163,12 @@ init_hwrpb (unsigned long memsize, unsigned long cpus)
   switch (__builtin_alpha_implver())
     {
     case 0: /* EV4 */
-      hwrpb.hwrpb.cpuid = EV4_CPU;
+      proc_type = EV4_CPU;
       hwrpb.hwrpb.max_asn = 63;
       break;
 
     case 1: /* EV5 */
-      hwrpb.hwrpb.cpuid
+      proc_type
 	= ((amask & 0x101) == 0x101 ? PCA56_CPU		/* MAX+BWX */
 	   : amask & 1 ? EV56_CPU			/* BWX */
 	   : EV5_CPU);
@@ -175,11 +176,16 @@ init_hwrpb (unsigned long memsize, unsigned long cpus)
       break;
 
     case 2: /* EV6 */
-      hwrpb.hwrpb.cpuid = (amask & 4 ? EV67_CPU : EV6_CPU);  /* CIX */
+      proc_type = (amask & 4 ? EV67_CPU : EV6_CPU);     /* CIX */
       hwrpb.hwrpb.max_asn = 255;
       break;
     }
 
+  /* This field is the WHAMI of the primary CPU.  Just initialize
+     this to 0; CPU #0 is always the primary on real Alpha systems
+     (except for the TurboLaser).  */
+  hwrpb.hwrpb.cpuid = 0;
+
   hwrpb.hwrpb.pagesize = PAGE_SIZE;
   hwrpb.hwrpb.pa_bits = 40;
   hwrpb.hwrpb.sys_type = SYS_TYPE;
@@ -187,9 +193,18 @@ init_hwrpb (unsigned long memsize, unsigned long cpus)
   hwrpb.hwrpb.sys_revision = SYS_REVISION;
   for (i = 0; i < cpus; ++i)
     {
-      /* ??? Look up these bits.  Snagging the value examined by the kernel. */
+      /* Set the following PCS flags:
+	 (bit 2) Processor Available
+	 (bit 3) Processor Present
+	 (bit 6) PALcode Valid
+	 (bit 7) PALcode Memory Valid
+	 (bit 8) PALcode Loaded
+
+	 ??? We really should be intializing the PALcode memory and
+	 scratch space fields if we're setting PMV, or not set PMV,
+	 but Linux checks for it, so...  */
       hwrpb.processor[i].flags = 0x1cc;
-      hwrpb.processor[i].type = hwrpb.hwrpb.cpuid;
+      hwrpb.processor[i].type = proc_type;
     }
 
   hwrpb.hwrpb.intr_freq = HZ * 4096;
@@ -257,8 +272,8 @@ init_i8259 (void)
   outb(0x04, PORT_PIC1_DATA);	/* ICW3: slave control INTC2 */
   outb(0x01, PORT_PIC1_DATA);	/* ICW4 */
 
-  /* Initialize level triggers.  The CY82C693UB that's on real alpha
-     hardware doesn't have this; this is a PIIX extension.  However,
+  /* Initialize level triggers.  The CY82C693UB that's on some real alpha
+     systems controls these differently; we assume a PIIX here.  However,
      QEMU doesn't implement regular level triggers.  */
   outb(0xff, PORT_PIC2_ELCR);
   outb(0xff, PORT_PIC1_ELCR);
-- 
2.30.2


