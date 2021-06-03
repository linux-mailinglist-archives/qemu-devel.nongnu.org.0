Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560A3998C6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:57:38 +0200 (CEST)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeUD-0007ae-4r
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQT-0008Sn-E6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:45 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQR-0004aL-Pg
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692422; bh=g4xseUSRgegy/fPbrLkM7LQ3J7y2LeXL13E9V4Q/uwA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=tNb2S57/nJDHiQFhcLwjs8tXa3mhOJJT2OFdbvQ1Rhp7peaOdnHTkcsof5QClgblV
 fwNeul2QdSsEby8Y8Lv8+7B8rgOym1gGAN7dGuP5j5NMNSC59cNHiBB7W5A+Dgmg2U
 /No7LlFYt4pfujR9jdlY4T/MaRPt+zLoUGp344kKgJJwqmQRmsjhWY9H2RMAYYhO1K
 PkY1PdmVhilpeYmHafONydJNCu8nuuvF2qwRy46iT8RRyY06YOrPZMRwc7GRcyP6Pc
 xOQW0Lkk8eLCbfw6PIBNTqfLb6VgN1xkNASih9TPa0A3kua7zuAOhI1KgVH6egunSv
 yl15vQQUl+zKA==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 7623E4A02ED;
 Thu,  3 Jun 2021 03:53:42 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 6/8] Provide interrupt mapping information in PCI config
 registers.
Date: Wed,  2 Jun 2021 20:53:15 -0700
Message-Id: <20210603035317.6814-7-thorpej@me.com>
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
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=849
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

Use system-specific information to program the interrupt line register
with the interrupt mappings, which is what the SRM console does on real
hardware; some operating systems (e.g. NetBSD) use this information
rather than having interrupt mappings tables for every possible system
variation.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 pci.c         | 20 +++++++++++++++++++-
 sys-clipper.h | 27 +++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/pci.c b/pci.c
index 5e9c906..e3cab26 100644
--- a/pci.c
+++ b/pci.c
@@ -29,6 +29,7 @@
 #include "protos.h"
 #include "pci.h"
 #include "pci_regs.h"
+#include SYSTEM_H
 
 
 #define PCI_SLOT_MAX		32
@@ -132,7 +133,24 @@ pci_setup_device(int bdf, uint32_t *p_io_base, uint32_t *p_mem_base)
 
   pci_config_maskw(bdf, PCI_COMMAND, 0, PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
 
-  /* Map the interrupt.  */
+  /* Map the interrupt and program the IRQ into the line register.
+     Some operating systems rely on the Console providing this information
+     in order to avoid having mapping tables for every possible system
+     variation.  */
+
+  const uint8_t pin = pci_config_readb(bdf, PCI_INTERRUPT_PIN);
+  const uint8_t slot = PCI_SLOT(bdf);
+  const int irq = MAP_PCI_INTERRUPT(slot, pin, class_id);
+
+  if (irq == -1)
+    {
+      /* No interrupt mapping.  */
+      pci_config_writeb(bdf, PCI_INTERRUPT_LINE, 0xff);
+    }
+  else
+    {
+      pci_config_writeb(bdf, PCI_INTERRUPT_LINE, irq);
+    }
 }
 
 void
diff --git a/sys-clipper.h b/sys-clipper.h
index 31094ff..4f563bf 100644
--- a/sys-clipper.h
+++ b/sys-clipper.h
@@ -27,4 +27,31 @@
 #define SYS_VARIATION	(5 << 10)
 #define SYS_REVISION	0
 
+#ifndef __ASSEMBLER__
+
+#define MAP_PCI_INTERRUPT(SLOT, PIN, CLASS_ID)			\
+({								\
+  int IRQ;							\
+								\
+  if (CLASS_ID == 0x0601)					\
+    {								\
+      /* PCI-ISA bridge is hard-wired to IRQ 55 on real		\
+         hardware, and comes in at a different SCB vector;	\
+         force the line register to -1.  */			\
+      IRQ = -1;							\
+    }								\
+  else if (PIN >= 1 && PIN <= 4)				\
+    {								\
+      /* See hw/alpha/dp264.c:clipper_pci_map_irq()  */		\
+      IRQ = (SLOT + 1) * 4 + (PIN - 1);				\
+    }								\
+  else								\
+    {								\
+      IRQ = -1;							\
+    }								\
+  IRQ;								\
+})
+
+#endif /* ! __ASSEMBLER__ */
+
 #endif
-- 
2.30.2


