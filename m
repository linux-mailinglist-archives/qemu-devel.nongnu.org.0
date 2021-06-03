Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B83998C5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:57:37 +0200 (CEST)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeUC-0007Z5-Pw
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQV-00009h-QV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:47 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQT-0004cF-KS
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692424; bh=7sctv2SUHw3h8CDnfDZqs/enyZL8iCa0g+y8p5P8n4k=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=yJk2SRHmQwn4QkFVo2zF9NxnCDITsozzT2NbA+1Vxet0ZZjwBtZVOJs4hu2bD4mLh
 4KYCNLk6C9TNGRUqYKhniYDWArp/idhpPhHpb6/iUlptGWuxvTYxteFmgjQOYf+9z4
 rmqAYJTtYHx4Qxn7fvVKG3VBM6gZZPITY5kzC2F6F8VqNdRSr6F8gEVBSKQNraYjD6
 n82GHiQD0VZhia8wwaAjnVSW/gqW2QgN/zwNRqxOpSnwUHIdUauQNYwV27UsO5873y
 wufKxob2BcLR5LizSsrWq0rI3FrGizYdgiJtOCX+I5L6UZjXgejDIWcsa3GDvLOjr8
 aFmO7uupdc64g==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 1A1FA4A0368;
 Thu,  3 Jun 2021 03:53:44 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 7/8] Provide a Console Terminal Block in the HWRPB.
Date: Wed,  2 Jun 2021 20:53:16 -0700
Message-Id: <20210603035317.6814-8-thorpej@me.com>
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

Provide a Console Terminal Block in the HWRPB so that operating systems
that depend on it can correctly initialize the console device.  In addition
to defining and filling out the structures, there are a couple of other
key changes:

- Redefine the a2 register passed by Qemu at start-up to also include
  some configuration flags, in addition to the CPU count, and define
  a flag to mirror the "-nographics" option.

- We need to initialize the HWRPB *after* initializing VGA, so that
  we'll know if a VGA device is present and in which slot for filling
  out the CTB.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hwrpb.h  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 init.c   | 32 +++++++++++++++++++++++++++++---
 protos.h |  2 ++
 vgaio.c  |  2 ++
 4 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/hwrpb.h b/hwrpb.h
index 2166bad..1531e68 100644
--- a/hwrpb.h
+++ b/hwrpb.h
@@ -146,6 +146,60 @@ struct crb_struct {
 	struct vf_map_struct map[1];
 };
 
+struct ctb_struct {
+	unsigned long type;
+	unsigned long unit;
+	unsigned long res0;
+	unsigned long len;
+	unsigned long ipl;
+	unsigned long tintr_vec;
+	unsigned long rintr_vec;
+	unsigned long term_type;
+	unsigned long keybd_type;
+	unsigned long keybd_trans;
+	unsigned long keybd_map;
+	unsigned long keybd_state;
+	unsigned long keybd_last;
+	unsigned long font_us;
+	unsigned long font_mcs;
+	unsigned long font_width;
+	unsigned long font_height;
+	unsigned long mon_width;
+	unsigned long mon_height;
+	unsigned long dpi;
+	unsigned long planes;
+	unsigned long cur_width;
+	unsigned long cur_height;
+	unsigned long head_cnt;
+	unsigned long opwindow;
+	unsigned long head_offset;
+	unsigned long putchar;
+	unsigned long io_state;
+	unsigned long listen_state;
+	unsigned long xaddr;
+	unsigned long turboslot;
+	unsigned long server_off;
+	unsigned long line_off;
+	unsigned char csd;
+};
+
+#define CTB_NONE	0x00
+#define CTB_PRINTERPORT	0x02
+#define CTB_GRAPHICS	0x03
+#define CTB_TYPE4	0x04
+
+/*
+ * Format of the Console Terminal Block Type 4 `turboslot' field:
+ *
+ *  63                   40 39       32 31     24 23      16 15   8 7    0
+ *  |      reserved        |  channel  |  hose   | bus type |  bus | slot |
+ */
+
+#define CTB_TURBOSLOT_TYPE_TC           0       /* TURBOchannel */
+#define CTB_TURBOSLOT_TYPE_ISA          1       /* ISA */
+#define CTB_TURBOSLOT_TYPE_EISA         2       /* EISA */
+#define CTB_TURBOSLOT_TYPE_PCI          3       /* PCI */
+
 struct memclust_struct {
 	unsigned long start_pfn;
 	unsigned long numpages;
diff --git a/init.c b/init.c
index b3919b6..aee5cef 100644
--- a/init.c
+++ b/init.c
@@ -36,11 +36,20 @@
 
 #define HZ	1024
 
+/* Upon entry, register a2 contains configuration information from the VM:
+
+   bits 0-5 -- ncpus
+   bit  6   -- "nographics" option (used to initialize CTB)  */
+
+#define CONFIG_NCPUS(x)      ((x) & 63)
+#define CONFIG_NOGRAPHICS(x) ((x) & (1ull << 6))
+
 struct hwrpb_combine {
   struct hwrpb_struct hwrpb;
   struct percpu_struct processor[4];
   struct memdesc_struct md;
   struct memclust_struct mc[2];
+  struct ctb_struct ctb;
   struct crb_struct crb;
   struct procdesc_struct proc_dispatch;
   struct procdesc_struct proc_fixup;
@@ -59,6 +68,8 @@ struct hwrpb_combine hwrpb __attribute__((aligned(PAGE_SIZE)));
 
 void *last_alloc;
 bool have_vga;
+unsigned int pci_vga_bus;
+unsigned int pci_vga_dev;
 
 static void *
 alloc (unsigned long size, unsigned long align)
@@ -136,12 +147,13 @@ init_page_table(void)
 }
 
 static void
-init_hwrpb (unsigned long memsize, unsigned long cpus)
+init_hwrpb (unsigned long memsize, unsigned long config)
 {
   unsigned long pal_pages;
   unsigned long amask;
   unsigned long i;
   unsigned long proc_type = EV4_CPU;
+  unsigned long cpus = CONFIG_NCPUS(config);
   
   hwrpb.hwrpb.phys_addr = PA(&hwrpb);
 
@@ -226,6 +238,19 @@ init_hwrpb (unsigned long memsize, unsigned long cpus)
   hwrpb.mc[1].start_pfn = pal_pages;
   hwrpb.mc[1].numpages = (memsize >> PAGE_SHIFT) - pal_pages;
 
+  hwrpb.hwrpb.ctbt_offset = offsetof(struct hwrpb_combine, ctb);
+  hwrpb.hwrpb.ctb_size = sizeof(hwrpb.ctb);
+  if (have_vga && !CONFIG_NOGRAPHICS(config))
+    {
+      hwrpb.ctb.term_type = CTB_GRAPHICS;
+      hwrpb.ctb.turboslot = (CTB_TURBOSLOT_TYPE_PCI << 16) |
+			    (pci_vga_bus << 8) | pci_vga_dev;
+    }
+  else
+    {
+      hwrpb.ctb.term_type = CTB_PRINTERPORT;
+    }
+
   hwrpb.hwrpb.crb_offset = offsetof(struct hwrpb_combine, crb);
   hwrpb.crb.dispatch_va = &hwrpb.proc_dispatch;
   hwrpb.crb.dispatch_pa = PA(&hwrpb.proc_dispatch);
@@ -300,18 +325,19 @@ swppal(void *entry, void *pcb)
 }
 
 void
-do_start(unsigned long memsize, void (*kernel_entry)(void), unsigned long cpus)
+do_start(unsigned long memsize, void (*kernel_entry)(void),
+         unsigned long config)
 {
   last_alloc = _end;
 
   init_page_table();
-  init_hwrpb(memsize, cpus);
   init_pcb();
   init_i8259();
   uart_init();
   ps2port_setup();
   pci_setup();
   vgahw_init();
+  init_hwrpb(memsize, config);
 
   swppal(kernel_entry ? kernel_entry : do_console, &pcb);
 }
diff --git a/protos.h b/protos.h
index 0d90be8..44ad233 100644
--- a/protos.h
+++ b/protos.h
@@ -222,6 +222,8 @@ extern unsigned long crb_fixup(unsigned long vptptr, unsigned long hwrpb);
  */
 
 extern bool have_vga;
+extern unsigned int pci_vga_bus;
+extern unsigned int pci_vga_dev;
 
 extern void do_console(void);
 extern void entInt(void);
diff --git a/vgaio.c b/vgaio.c
index 2dd7eb7..1fb0d52 100644
--- a/vgaio.c
+++ b/vgaio.c
@@ -570,6 +570,8 @@ vgahw_init(void)
 
  found:
   have_vga = 1;
+  pci_vga_bus = PCI_BUS(bdf);
+  pci_vga_dev = PCI_SLOT(bdf);
 
   vmode_g = find_vga_entry(3);
 
-- 
2.30.2


