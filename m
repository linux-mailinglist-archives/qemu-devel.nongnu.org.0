Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD204CFA76
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:18:32 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRARi-0003FU-Ep
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:18:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACJ-0001R9-UM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACI-0002mE-AA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=Vvcqz/cxr7nQx9bsEomwMwQnNSkSKshhLThsYZkYPOdNZKeLWaKagCFGQKUz9ohNVwrREw
 ihCwCaqC4AM5Bbz2xJr+cQkoXdF0wbGquGazvX7xuGg/tX7f9hzKymK5YZVVm2iM2e676p
 2I7KeavTBN870PRFiSNTZDku8SvaFU8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-hXoQ7aQWNcOOCx0nJwjiKA-1; Mon, 07 Mar 2022 05:02:32 -0500
X-MC-Unique: hXoQ7aQWNcOOCx0nJwjiKA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020a056402344e00b0041593c729adso8333571edc.18
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=cs/xa9txb2V4G+pV2cvhUZfIL+vr29GSWHuiTIUHDMxuOMf0ZzFSsnR46UnuJg3ZqV
 lxGWYtZHjAZdgJCMixPwEMJ5SQ1zJIKJRnNuLhMP+Q4P5ah4O3ombYyo3o65Yg+MB76m
 uWnkC21fycgsog/FTJH/utzqq6D8ISmfQlg1sQEHta4rFv/tEjizWDy3GmKszEok4SPw
 p3WdjEOiXidoT0UEvyVU6DYS6YyJ5GD7waJVSyeudCcgcGepdSinzWRrb/1xR55xDVRl
 gxNUtW1m81WJGEYyRrSEzPd8K0AJ1/YivZGpT8KrMILL4eun5YmT7KO3y1zpbPak3Kro
 BqzQ==
X-Gm-Message-State: AOAM532v0QQuHBsL0Teef3CsXh86bS1yh0epQ9VJ3mRZ7mJWMdHGK4Pd
 zab8KTcpyBj4FQldiTx0SUyDEw7UbtTNDlIIRQj9hvETEpDiNzA0hRT/oe5bL5zq+Ztovh93O38
 g03LCvb0g6FVUxt9ncNGFKoi28u/BzL3ZqXPUa6TiJUUE3G0v1g3wEiOIvGED
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr10364010ede.404.1646647350995; 
 Mon, 07 Mar 2022 02:02:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy+01gp79Ij4AbSZOmStX1m/L2J4+4fGm/m0eFSJ7E1BUm1IfeSH4gexGS1XztsywDWqWgzQ==
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr10363984ede.404.1646647350705; 
 Mon, 07 Mar 2022 02:02:30 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r29-20020a50c01d000000b00415fb0dc793sm4676156edb.47.2022.03.07.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:30 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/47] hw/pci-bridge/pxb: Fix missing swizzle
Message-ID: <20220307100058.449628-23-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

pxb_map_irq_fn() handled the necessary removal of the swizzle
applied to the PXB interrupts by the bus to which it was attached
but neglected to apply the normal swizzle for PCI root ports
on the expander bridge.

Result of this was on ARM virt, the PME interrupts for a second
RP on a PXB instance were miss-routed to #45 rather than #46.

Tested with a selection of different configurations with 1 to 5
RP per PXB instance.  Note on my x86 test setup the PME interrupts
are not triggered so I haven't been able to test this.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20220118174855.19325-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 10e6e7c2ab..de932286b5 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -192,6 +192,12 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 {
     PCIDevice *pxb = pci_get_bus(pci_dev)->parent_dev;
 
+    /*
+     * First carry out normal swizzle to handle
+     * multple root ports on a pxb instance.
+     */
+    pin = pci_swizzle_map_irq_fn(pci_dev, pin);
+
     /*
      * The bios does not index the pxb slot number when
      * it computes the IRQ because it resides on bus 0
-- 
MST


