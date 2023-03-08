Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30D6AFC31
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNi-0004Ly-OY; Tue, 07 Mar 2023 20:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNg-0004HO-TW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNf-00022D-9Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wufX2lxAwCV78OvZ69Ib6mWVa5AYIDMc4PTsR/964xI=;
 b=S843AZjTIkacykgVbYNQ0KTL8XiiaT34gc1WA/0VDaWSvC1rDIN0Bulz9pV6t4j8q9aP8Z
 W5hKiWCiTdzr4Cj+BA5W2dNfMQRP+gLKo5z4SLLVXPqmLKkiqCk53YwvNdeNkeR2wpfh0o
 PPurnx8x0scEj7nDHH6QKzpXap335Nc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-zrgvZKb-PP2PUHA0gzPIEw-1; Tue, 07 Mar 2023 20:14:09 -0500
X-MC-Unique: zrgvZKb-PP2PUHA0gzPIEw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso21658836edt.22
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wufX2lxAwCV78OvZ69Ib6mWVa5AYIDMc4PTsR/964xI=;
 b=LJ5ok5qr6RCzjen6J3uFQc+8B+8v13/WeRashRZ+XqzDevlHmokyxA++qoyq6GcsNR
 v8NCeqxvHY0oIUZ0x00Hw23Vk82cMK1gwkVuS/rHxt/1Uq+34/hgreWCVOj/r8gXq7TL
 rtj4zOuCFZ/PVmjK3dfUMQyF7dQZ/+ptGzfDJHD79RoNu+trb2XVpnfjr+vKauyBejhd
 53kmRQeTpfKSDoydFj9pkKAmviTLwi30YfHNTrPVQCxwO134b7a0xF1M1l3oLMFEKZ+E
 1ON5zWghW88hNj64luEZfCDrtbQ0RZkfEagrbBphJInxz9riE2+ZxyrfJFm6o1IzXdhn
 A2qg==
X-Gm-Message-State: AO0yUKXJgsFM9mrWHSg8BtNfSrfvK69TCPqh556w7WCTb31xuTvcMrRA
 PMpOp6UdylTRkJUkOzhWj1Etv88hC8bxn0PsGuCPVxueHuxJI5frqdfBEEMqM+9oR1hbp4PQIx+
 l/i6qwlQaOZjICZGKblZtmxzKo4D+zG4bPcdZ50sgvuV5vyXVu/EZ0DibSpdml973OJFi
X-Received: by 2002:a17:906:4a5a:b0:87b:bbdc:468 with SMTP id
 a26-20020a1709064a5a00b0087bbbdc0468mr16730808ejv.70.1678238047938; 
 Tue, 07 Mar 2023 17:14:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/aaCy0v896k5XUX64Nf3Zp13SqU1cKT9G9R2GmQNmf6ANy0fo3nvn7ZBRGMtjLmx/xJ/oMhQ==
X-Received: by 2002:a17:906:4a5a:b0:87b:bbdc:468 with SMTP id
 a26-20020a1709064a5a00b0087bbbdc0468mr16730793ejv.70.1678238047661; 
 Tue, 07 Mar 2023 17:14:07 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 vf22-20020a170907239600b008ee64893786sm6850927ejb.99.2023.03.07.17.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:07 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 65/73] hw/mem/cxl-type3: Add AER extended capability
Message-ID: <6be947bdfcaca6e87ee93a76b2ab2c5536b3b8a6.1678237635.git.mst@redhat.com>
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

This enables AER error injection to function as expected.
It is intended as a building block in enabling CXL RAS error injection
in the following patches.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Message-Id: <20230302133709.30373-6-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 hw/mem/cxl_type3.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 217a5e639b..6cdd988d1d 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -250,6 +250,7 @@ static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
 
     pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
     pci_default_write_config(pci_dev, addr, val, size);
+    pcie_aer_write_config(pci_dev, addr, val, size);
 }
 
 /*
@@ -452,8 +453,19 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
     cxl_cstate->cdat.private = ct3d;
     cxl_doe_cdat_init(cxl_cstate, errp);
+
+    pcie_cap_deverr_init(pci_dev);
+    /* Leave a bit of room for expansion */
+    rc = pcie_aer_init(pci_dev, PCI_ERR_VER, 0x200, PCI_ERR_SIZEOF, NULL);
+    if (rc) {
+        goto err_release_cdat;
+    }
+
     return;
 
+err_release_cdat:
+    cxl_doe_cdat_release(cxl_cstate);
+    g_free(regs->special_ops);
 err_address_space_free:
     address_space_destroy(&ct3d->hostmem_as);
     return;
@@ -465,6 +477,7 @@ static void ct3_exit(PCIDevice *pci_dev)
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
     ComponentRegisters *regs = &cxl_cstate->crb;
 
+    pcie_aer_exit(pci_dev);
     cxl_doe_cdat_release(cxl_cstate);
     g_free(regs->special_ops);
     address_space_destroy(&ct3d->hostmem_as);
-- 
MST


