Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2869434A18
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:33:23 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9qU-0006zL-H7
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ik-0005Yi-7X
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8if-0004Cz-33
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGEZ/L+Yp8m5ztCcbynN5mOeOFC9ShXK5GG60ZVmNHw=;
 b=EdmKI01AcsR0Ca2vg7MBjaDSHUZcgtuM4kgF1OoJSfktpIQ6lsgFJz2OPerCgBZDI0lKGa
 4hWsDM1q7accDsP4cttota5FdwDTsLtmb7qY94y1uGEWOSp8Ujrcq92StmbYWTQ5rv67gj
 KJURaVbtDW7KMN1Aw+8SK5Utg+UXh28=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-9S82xQcTNISPBdWTx8dBQQ-1; Wed, 20 Oct 2021 06:21:11 -0400
X-MC-Unique: 9S82xQcTNISPBdWTx8dBQQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so20456381edy.22
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pGEZ/L+Yp8m5ztCcbynN5mOeOFC9ShXK5GG60ZVmNHw=;
 b=no91No7qICOE8+EPPF6E8WhDhNcfaR4reb5Rz66tOUxs4VpQLBKVZiOgxlakNO61zg
 gTNm1w7+2h/xzL0xjDWyYnFpiTgmdjsY8DAAuAWan1qCZvoLweZzrlwJYlmWD1l+r6ZQ
 i2cuDAIEgX1GXEm3j/3/jj6S4ec/65gXhc1T/EY6iW9+WJaXRDR9a4cI82sKj0vT7ycm
 lT1E9O7AFkg/yIg94BcnQbJDtGGjmlCNd9EsuZu86NHR/kvA/vojXNAXWTI2e5Y3Djyh
 jfsRJUYu8Z3Zx3q0qUj9baJvUp5y1Z4tPM55GLG2E45eSx6M2coaMeKLciOR8igwFq4W
 vsUg==
X-Gm-Message-State: AOAM532v+WQdyxDcjalTRUKcbI639aDdY7WGPLeUC+5kBPhgMm6steSx
 Tlr+82Hqq/ETF06riZgYqb9/VERYEDsEoEnBVV7enFRKweP3UISoHaLJGuG8E6q3gYuLd8Hc7aP
 JV9BVWyqhrNI0j00GJl7HLygT6mFNmb8ImQ8Jc3gwjya0AEUV8CZmJy+l+u1l
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr61676728edt.237.1634725269845; 
 Wed, 20 Oct 2021 03:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFe1gm8EX6fWxvqHrN6h6LLNthkjEh+3XmfnDLG1TqO/SHaO0sPJ9WkTj4Sjseck2lPgorUQ==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr61676690edt.237.1634725269604; 
 Wed, 20 Oct 2021 03:21:09 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id o10sm941920edj.79.2021.10.20.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:21:09 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:21:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 41/44] pci: fix PCI resource reserve capability on BE
Message-ID: <20211020101844.988480-42-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 jing2.liu@linux.intel.com, zuban32s@gmail.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


