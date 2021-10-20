Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B0434867
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:57:07 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8LK-0007IG-BR
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8JE-0005IX-W2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8JB-0007Rd-Tc
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634723692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=cu4WEv2ysOw/uJ7PY5yS6bFuodNMkN21xUbeu4TqhnQ=;
 b=Hq/YgnDTBPfamm0kvxbUkWjAW4uUO0HH8E1jpv3Huae0Qcekd8GJXdRhelBfaFc4yOoQPV
 pF9schohc3OH/GlYtkbQvwFOx3S37+G3YLpQ2J3yIwbMtbKFAhbS2wqezlNcOsVY1GbGwh
 j8+IQ52dcblryqW2vKC+s/kFDupDnIE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-4P4MH8PUOZy3M4dIcbHOEw-1; Wed, 20 Oct 2021 05:54:15 -0400
X-MC-Unique: 4P4MH8PUOZy3M4dIcbHOEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso2857513wmj.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=cu4WEv2ysOw/uJ7PY5yS6bFuodNMkN21xUbeu4TqhnQ=;
 b=MWPANrUMfoRVlbDIvzOYUURSK7jNPvDwF0g38CtfCD7f6IqpXKbzzYkQ/RAW4GeDI3
 g5GZzuormfFsTjcwczC6NBIK1i+LhzwHlj6c/E4rw2cibthBuS0eGVSy/rH7ySv54EzK
 tht1fZ2JX7PNZgoMuzaHkA+ZbJY3iIN17HYPsu6xdskyv56HMfmxiCrFBMiKzT4IkD5b
 mOj7l/lUMm/zvCoMOHSoyW23GGeTAnaKHFDIaw0ulIfsCt0T8PKQy2hmXjIxYuji2/RA
 NO755z7ywD9tnHjADaoSb9E/IlfH7E8zwvp7AQ7L9YkHSq1012203136KqiH/dTYdVEI
 vdlA==
X-Gm-Message-State: AOAM5310ylW6x+bQIY7m2ksKLg+LKuonRhn8y8Y/ekNiEHZF2clOrpAK
 4wMEVQC3CmsQExiSHwBiKVh2rl8CHUaEeM6vSQmcx4SlGgdgcSlOAXOrjxQItKVhReC9uTWCuMP
 yx4CUTtxLQw2k2cQL4QAd1cy3iJhXhUzmp+ZEhVapOtHsq86gtF3LqWFNNOvX
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr12385623wmq.180.1634723654534; 
 Wed, 20 Oct 2021 02:54:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW+CAShDQEwaC9uH0SD3McZlsaXFZOK+FH67zQQM93IUVMbl0PMS9iMkz4EXA53Qr8bvgCbg==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr12385582wmq.180.1634723654125; 
 Wed, 20 Oct 2021 02:54:14 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l6sm1645320wmq.17.2021.10.20.02.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 02:54:13 -0700 (PDT)
Date: Wed, 20 Oct 2021 05:54:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pci: fix PCI resource reserve capability on BE
Message-ID: <20211020095408.917102-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, jing2.liu@linux.intel.com,
 zuban32s@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI resource reserve capability should use LE format as all other PCI
things. If we don't then seabios won't boot:

=== PCI new allocation pass #1 ===
PCI: check devices
PCI: QEMU resource reserve cap: size 10000000000000 type io
PCI: secondary bus 1 size 10000000000000 type io
PCI: secondary bus 1 size 00200000 type mem
PCI: secondary bus 1 size 00200000 type prefmem
=== PCI new allocation pass #2 ===
PCI: out of I/O address space

This became more important since we started reserving IO by default,
previously no one noticed.

Fixes: e2a6290aab ("hw/pcie-root-port: Fix hotplug for PCI devices requiring IO")
Cc: marcel.apfelbaum@gmail.com
Fixes: 226263fb5c ("hw/pci: add QEMU-specific PCI capability to the Generic PCI Express Root Port")
Cc: zuban32s@gmail.com
Fixes: 6755e618d0 ("hw/pci: add PCI resource reserve capability to legacy PCI bridge")
Cc: jing2.liu@linux.intel.com
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci_bridge.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index d1f902ee86..da34c8ebcd 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -448,11 +448,11 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     PCIBridgeQemuCap cap = {
             .len = cap_len,
             .type = REDHAT_PCI_CAP_RESOURCE_RESERVE,
-            .bus_res = res_reserve.bus,
-            .io = res_reserve.io,
-            .mem = res_reserve.mem_non_pref,
-            .mem_pref_32 = res_reserve.mem_pref_32,
-            .mem_pref_64 = res_reserve.mem_pref_64
+            .bus_res = cpu_to_le32(res_reserve.bus),
+            .io = cpu_to_le64(res_reserve.io),
+            .mem = cpu_to_le32(res_reserve.mem_non_pref),
+            .mem_pref_32 = cpu_to_le32(res_reserve.mem_pref_32),
+            .mem_pref_64 = cpu_to_le64(res_reserve.mem_pref_64)
     };
 
     int offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
-- 
MST


