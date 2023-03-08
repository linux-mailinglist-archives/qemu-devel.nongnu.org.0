Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332596AFC28
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNa-0003wO-6y; Tue, 07 Mar 2023 20:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNX-0003lp-U2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNW-0001zz-7I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2NhsnhpjRETx99G++Bw+Z5dX+en0cbOsz59rYFYC2A=;
 b=FXJZB4JvXyXVRtUSOIO3MSJayR8vXBwE8OlRAi3jO/kmv+wAhEDmEMee6t1eHKnrq8cXDp
 S0ffBW2rtqsz+NRvXl6lyzn4IGpH/QSOZaNtvKTBNEBlAExg99fdV7Vemd+kY1Oa92MTgK
 qhgXPAws1WTejNYSIf88sV2p0dKFBro=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-mW_AD0frNwarU8t-8ZRSvw-1; Tue, 07 Mar 2023 20:14:00 -0500
X-MC-Unique: mW_AD0frNwarU8t-8ZRSvw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so11266171eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238039;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2NhsnhpjRETx99G++Bw+Z5dX+en0cbOsz59rYFYC2A=;
 b=SdoHfzrTHw526kBvmM5zHV9uNnbFtgn5sfCOGY0uz16plgvhh2HQhkO2WSLuzrV/KU
 6rZ3t2/VX5DNMgctW9vghBAy5bmL1tN9lKrRCYLZ32Kfxqo4p8VO5trxv4dOak7H/idr
 uhA4OKjbm3PmpLkT1f7gGRUksPnom4qq2kuoSX/AmPFI5W7uYLBDlOeSP5Iw09fHIX1X
 6iAg+LL0seM8l80fu56YUjfKvj2aSytpqrvVO2nrpov82ZWixK05VpFemb0Kuu0pbR3I
 FWqE6rvBlJjFIRrpJb+zdFOypVxQ1YBAGWfKmcTf7AxwfpLUEqP2RAr2KJrIExoXjWvD
 Ne+A==
X-Gm-Message-State: AO0yUKUh6tX7iXUkwXHiAvT8o+tcNXBDTontHhqKLzKvDik7Lba4az02
 SB1P29Q151lfe7xz1kYeDTSkDImefPvyoLxPZnI5UB5u4Hd6g5np3bAaS+rlHE6gVvM5SlDlGYE
 Z2oDGPu5I1Co/X8kK9Z3qhb7BfNu+AwK+EXKhTkRDO5LTOxewLuNpMqq+EkiR3j3QxTGr
X-Received: by 2002:a17:906:730d:b0:8b1:3193:4874 with SMTP id
 di13-20020a170906730d00b008b131934874mr20775406ejc.46.1678238038918; 
 Tue, 07 Mar 2023 17:13:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z6qIhQmnmSmpNjTUIiGNQJMIjaiXe/Leaiuzdg2VmWPRlu1uw8/W8d9BqBUh4+bilPAIguA==
X-Received: by 2002:a17:906:730d:b0:8b1:3193:4874 with SMTP id
 di13-20020a170906730d00b008b131934874mr20775387ejc.46.1678238038666; 
 Tue, 07 Mar 2023 17:13:58 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 y26-20020a170906519a00b008e53874f8d8sm6774271ejk.180.2023.03.07.17.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:58 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 62/73] hw/pci/aer: Add missing routing for AER errors
Message-ID: <9a6ef182c03eaa138bae553f0fbb5a123bef9a53.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

PCIe r6.0 Figure 6-3 "Pseudo Logic Diagram for Selected Error Message Control
and Status Bits" includes a right hand branch under "All PCI Express devices"
that allows for messages to be generated or sent onwards without SERR#
being set as long as the appropriate per error class bit in the PCIe
Device Control Register is set.

Implement that branch thus enabling routing of ERR_COR, ERR_NONFATAL
and ERR_FATAL under OSes that set these bits appropriately (e.g. Linux)

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Message-Id: <20230302133709.30373-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 hw/pci/pcie_aer.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 909e027d99..103667c368 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -192,8 +192,16 @@ static void pcie_aer_update_uncor_status(PCIDevice *dev)
 static bool
 pcie_aer_msg_alldev(PCIDevice *dev, const PCIEAERMsg *msg)
 {
+    uint16_t devctl = pci_get_word(dev->config + dev->exp.exp_cap +
+                                   PCI_EXP_DEVCTL);
     if (!(pcie_aer_msg_is_uncor(msg) &&
-          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR))) {
+          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_NONFATAL_EN) &&
+          (devctl & PCI_EXP_DEVCTL_NFERE)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_COR_EN) &&
+          (devctl & PCI_EXP_DEVCTL_CERE)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_FATAL_EN) &&
+          (devctl & PCI_EXP_DEVCTL_FERE))) {
         return false;
     }
 
-- 
MST


