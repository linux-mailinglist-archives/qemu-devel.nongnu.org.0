Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F2631E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox46O-0007Hd-Hs; Mon, 21 Nov 2022 05:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46F-0007HF-Sx
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46E-0007al-4t
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669026745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdx4+74HnxonlbQl4hRvCPm4KbmuHyNVCUmDQKAZ+bg=;
 b=fjBJxwnudZ8ZZHpe9KPBxMVIE6l80MjR/ECl3HfFTYol7HpdEDNgg3MaYy19bfViV0oFHQ
 dLdjkYD4zH1uauTCvkw/SxDX7AaEvvhoKdCtY42MZPCkmVdAYVKlgsD/MmtLLkVN9AR/GO
 ROZzRZc+SdcuEcMgdFH3T9E4Aha6sEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-DUjv93i1PS2yAAFJcIP_kw-1; Mon, 21 Nov 2022 05:32:23 -0500
X-MC-Unique: DUjv93i1PS2yAAFJcIP_kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB24800186;
 Mon, 21 Nov 2022 10:32:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD981C15BBC;
 Mon, 21 Nov 2022 10:32:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F8A51800999; Mon, 21 Nov 2022 11:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/4] move 64bit pci window to end of address space
Date: Mon, 21 Nov 2022 11:32:12 +0100
Message-Id: <20221121103213.1675568-4-kraxel@redhat.com>
In-Reply-To: <20221121103213.1675568-1-kraxel@redhat.com>
References: <20221121103213.1675568-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

When the size of the physical address space is known (PhysBits is not
zero) move the 64bit pci io window to the end of the address space.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/pciinit.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
index badf13d3233b..ad6def93633b 100644
--- a/src/fw/pciinit.c
+++ b/src/fw/pciinit.c
@@ -1128,6 +1128,14 @@ static void pci_bios_map_devices(struct pci_bus *busses)
         r64_mem.base = le64_to_cpu(romfile_loadint("etc/reserved-memory-end", 0));
         if (r64_mem.base < 0x100000000LL + RamSizeOver4G)
             r64_mem.base = 0x100000000LL + RamSizeOver4G;
+        if (PhysBits) {
+            u64 top = 1LL << PhysBits;
+            u64 size = (ALIGN(sum_mem, (1LL<<30)) +
+                        ALIGN(sum_pref, (1LL<<30)));
+            if (r64_mem.base < top - size) {
+                r64_mem.base = top - size;
+            }
+        }
         r64_mem.base = ALIGN(r64_mem.base, align_mem);
         r64_mem.base = ALIGN(r64_mem.base, (1LL<<30));    // 1G hugepage
         r64_pref.base = r64_mem.base + sum_mem;
-- 
2.38.1


