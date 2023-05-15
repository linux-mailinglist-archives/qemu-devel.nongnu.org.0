Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DC7030BC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:58:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZdc-0000BA-WF; Mon, 15 May 2023 10:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1pyZDA-00065L-7t
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1pyZD8-0004CO-4f
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684161000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=t/YsPLY4WsAsZgCYw15cHktALkm3oYMOegWfcM+vkSA=;
 b=aeSN1mb3j0jFNZz65AYBGBZGdoirkLyIEthHtWJcI0I0K2GdoiqsF37FrNSm4xCsiRq/QD
 ZHHboE8Zz1tAOU3WIrruBAmEMI0z5SJPkS+IuTd4n4GGYmQPmmiXXTyjWBpl+/5tSAyUHB
 gbBGpUv89p+ZoMEtjF882nrVSeimp04=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-Uz7lEPp0MJKnFmLN6c0-MQ-1; Mon, 15 May 2023 10:28:52 -0400
X-MC-Unique: Uz7lEPp0MJKnFmLN6c0-MQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-61b91523239so77060406d6.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684160931; x=1686752931;
 h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t/YsPLY4WsAsZgCYw15cHktALkm3oYMOegWfcM+vkSA=;
 b=PjCJYToG65LAA90Dms/7xK+IBdIGts97t+VLUG3rmNvuDJ43o/HNLhlKdKdqagYbuR
 w6dYZk609h3fNeOa+Rg87Y5FUQ2d0YPULBRHAJQgcIJcEkRskeLfq1YK4dSUdTm8cfxk
 2q7bxq/ndsNU+YdSMeeued6Uw9BBVZf92Sfzg/2+jNBpDy3GUqZb5TXQiktCE1MbX2iA
 Jc4Iiu8+D/+IvdsxBENYQ3/1vJbLMivTS9+xDU0IQakdSh2e6sr92F37HggaIG8n410o
 MFJ8boeGs5i9lcv8So/Rkbg6Exim+lP8FEbtjcpyfRia8BVHIr+Fnr8urFdwjspQPKhI
 Vojg==
X-Gm-Message-State: AC+VfDyORA9uH2T9fwNYyi/MijkOHAMkSYXORVF5RB/hygxoc6i+BZFO
 hOfigdq7i3t7zGjqHRPjRTe2Lfz8XXXS9p7vZ0AEg6d0NXLVnuz+Ex2Bf34J9EN88qQoC8hzrw5
 Js6iDeXyF+XCZfl67Z+QJ3ZVy0FPys7PwxPs6Zulmoet9DgdPw/2jHo8XfnWffoghwbSwKqtt
X-Received: by 2002:ad4:5bac:0:b0:619:4232:aa87 with SMTP id
 12-20020ad45bac000000b006194232aa87mr44965444qvq.24.1684160931293; 
 Mon, 15 May 2023 07:28:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5de59mMAd2qOyPrBlvPZim8W4ZAgIRtMq++wI3rtFmRAnyms2LbL4SImLa6GQkVqnmNTDGMQ==
X-Received: by 2002:ad4:5bac:0:b0:619:4232:aa87 with SMTP id
 12-20020ad45bac000000b006194232aa87mr44965410qvq.24.1684160930980; 
 Mon, 15 May 2023 07:28:50 -0700 (PDT)
Received: from rh (p200300c93f2e34002dfae53cbf92e346.dip0.t-ipconnect.de.
 [2003:c9:3f2e:3400:2dfa:e53c:bf92:e346])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a0ce388000000b0062118679d22sm4946722qvl.138.2023.05.15.07.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:28:50 -0700 (PDT)
Date: Mon, 15 May 2023 16:28:46 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
cc: Eric Auger <eauger@redhat.com>
Subject: [PATCH] hw/pci-bridge: make building pcie-to-pci bridge configurable
Message-ID: <72b6599d-6b27-00b5-aac5-2ebc16a2e023@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 May 2023 10:57:23 -0400
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


Introduce a CONFIG option to build the pcie-to-pci bridge. No
functional change since it's enabled per default for PCIE_PORT=y.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  hw/pci-bridge/Kconfig     | 5 +++++
  hw/pci-bridge/meson.build | 3 ++-
  2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
index 02614f49aa..67077366cc 100644
--- a/hw/pci-bridge/Kconfig
+++ b/hw/pci-bridge/Kconfig
@@ -3,6 +3,11 @@ config PCIE_PORT
      default y if PCI_DEVICES
      depends on PCI_EXPRESS && MSI_NONBROKEN

+config PCIE_PCI_BRIDGE
+    bool
+    default y if PCIE_PORT
+    depends on PCIE_PORT
+
  config PXB
      bool
      default y if Q35 || ARM_VIRT
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index fe92d43de6..0edc6c7cbf 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -2,7 +2,8 @@ pci_ss = ss.source_set()
  pci_ss.add(files('pci_bridge_dev.c'))
  pci_ss.add(when: 'CONFIG_I82801B11', if_true: files('i82801b11.c'))
  pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
-pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
+pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c'))
+pci_ss.add(when: 'CONFIG_PCIE_PCI_BRIDGE', if_true: files('pcie_pci_bridge.c'))
  pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
                                 if_false: files('pci_expander_bridge_stubs.c'))
  pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
-- 
2.40.1


