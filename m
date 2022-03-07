Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403394D0B8B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:57:29 +0100 (CET)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMIC-0005UM-0h
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6x-0007Ly-US
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6w-0005dU-FJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=dWNvh9OyCWtL++Acco3mxAhwPm7syICK72uX1YBtNhNLfRa/ObNqCtr8aIMB4REtAI9rRe
 DUdnXq+75i5VN2LK755Fk2HjiT4SvxWBBBrXViwyWO1AzHasMvdULJSuVxe/ddjQlXQalb
 penx0IZ/u9Ma13FYOH+0a6DGankpMyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-ULgUNekROo-aBtLqblRJNA-1; Mon, 07 Mar 2022 17:45:46 -0500
X-MC-Unique: ULgUNekROo-aBtLqblRJNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso253695wmh.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=5dk9uwmebCcqjYGQKdZQJxiBzspCe4BVyXQ2CqQrthUIPmYP0x2yZfMCp5jnjTkv7C
 UX+j4qcppOyBwarmZ+To23YEo2335Biu6duUnLZ8dWuOqih2coljq3nQNFUHqmmYvA6o
 Z6bi2i5KgtbVIVlUPZI+SkN0HomINwQK76im940lkeAGxHrnI2+96bVzUhysyNJkADLK
 0gMLvxM34ie16rnnUjPSt0jDtOejDQBwsDsNsQ754CA8hCWttuqOye/+cMh3yojC9+Ve
 f62c/YeJ8/Pu+C2ymUr9T36+pjB00CYJUpPUi8+I6einSCpqXxJlbGluo1WBmegAL6mE
 l0Zw==
X-Gm-Message-State: AOAM532nVIpI+GCJpt59BU2Bo8b12wwq3t5kWfKZtkmnRTfE3Dm2lMIA
 3R4z6guOfvyd0csvsyYJr+a9rlV3dDRwU2o2oocf9Ts/vUFVcywamCCa6k3tKP3CM/xMduBvxP1
 ClyPN/A2foKQEp9X27jNgqNYSBy/HrM58+bbGiGZJwEPpm0n41hBuGex/WbBd
X-Received: by 2002:a05:6000:15cc:b0:1f1:f814:27c4 with SMTP id
 y12-20020a05600015cc00b001f1f81427c4mr5748702wry.630.1646693145264; 
 Mon, 07 Mar 2022 14:45:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPeuIqQwNR8ax5oKli/Nl48ohu8zY8HLB0eY0cOGmns7ImfUk6e6epk7A9N5KnKkzf/E6wfQ==
X-Received: by 2002:a05:6000:15cc:b0:1f1:f814:27c4 with SMTP id
 y12-20020a05600015cc00b001f1f81427c4mr5748683wry.630.1646693144970; 
 Mon, 07 Mar 2022 14:45:44 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r2-20020a5d6942000000b001f0485057c4sm12563396wrw.74.2022.03.07.14.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:44 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 22/47] hw/pci-bridge/pxb: Fix missing swizzle
Message-ID: <20220307224357.682101-23-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


