Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE23998C9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 06:00:12 +0200 (CEST)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeWh-0003nu-F8
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 00:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQS-0008Nl-1Y
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:44 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQQ-0004ZW-Cx
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692421; bh=51QABy2AfwMyeOxLab936/CmhWU0ZyM9ggOJL3COhfI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=W2njIIcLwWsrFf92ETkTGxDUe5fOZ6ZYNZZyoWI+57jewF/pqftfIPHfwP2+WUNKH
 u5qegVMSZ0d1fq48kQiDdlNLN8G9DI24y7Bc4FWqhxQ7Mo2lyn8l+KFs8OcRpy3cIX
 tFFsu4uQ3+A6n1pIebwFv4lKS3t6Uw0TC6EkBu7H/vAtdj3lB3+OL3yKqPFwG5zB/W
 rJIQSbHLqodNM0EFcJSgCH9Nsj6fTeJnM4bZ+J3QHAiXvZA7yGPfeim6bccjWiyXen
 6XZ/vRql2Y2grq19kGYeabsSAOF4f72eYs8a++iEtBcm4Up1WymqXBOApWIDg86Guc
 DcKUWP8aGbYnQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id EA1574A011E;
 Thu,  3 Jun 2021 03:53:40 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 5/8] Fix incorrect initialization of PCI BARs.
Date: Wed,  2 Jun 2021 20:53:14 -0700
Message-Id: <20210603035317.6814-6-thorpej@me.com>
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
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=827
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

Only program a BAR as a 64-bit MEM BAR if it really is a 64-bit MEM BAR.
Fixes an issue with the CMD646 IDE controller under NetBSD.

Improve some debug/info messages.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/pci.c b/pci.c
index ba05adb..5e9c906 100644
--- a/pci.c
+++ b/pci.c
@@ -84,7 +84,7 @@ pci_setup_device(int bdf, uint32_t *p_io_base, uint32_t *p_mem_base)
   device_id = pci_config_readw(bdf, PCI_DEVICE_ID);
   class_id = pci_config_readw(bdf, PCI_CLASS_DEVICE);
 
-  printf("PCI: %02x:%02x:%x class %04x id %04x:%04x\r\n",
+  printf("PCI: %d:%d:%d class %04x id %04x:%04x\r\n",
 	 PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf),
          class_id, vendor_id, device_id);
 
@@ -118,9 +118,10 @@ pci_setup_device(int bdf, uint32_t *p_io_base, uint32_t *p_mem_base)
 	  *p_base = addr + size;
 	  pci_config_writel(bdf, ofs, addr);
 
-	  printf("PCI:   region %d: %08x\r\n", region, addr);
+	  printf("PCI:   region %d (BAR %02x): %08x\r\n", region, ofs, addr);
 
-	  if ((val & PCI_BASE_ADDRESS_MEM_TYPE_MASK)
+	  if ((old & PCI_BASE_ADDRESS_SPACE_IO) == 0 &&
+	      (old & PCI_BASE_ADDRESS_MEM_TYPE_MASK)
 	      == PCI_BASE_ADDRESS_MEM_TYPE_64)
 	    {
 	      pci_config_writel(bdf, ofs + 4, 0);
-- 
2.30.2


