Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2C6F7D86
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:12:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupbM-0004ns-3x; Fri, 05 May 2023 03:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbF-0004lY-1q
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbA-0000f6-3J
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683270682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hnbw/1xdXtcYTeMJ6hzBbi7QP8BTZHfCWmXXBwn82Jg=;
 b=Sw67x8iVilhFs+CUg2uiVtMriI0PLHsNxNJMh2sqEHhC6yBJzcOBhit11/p5ziQ5C3svd5
 LbE3TM6a0iY/5rWl1NYafOMplKlkjFGK2vZT0s96YIGQAXuybnX0NCZbGQ0ZKBzubRo1jn
 sLgcWGd+anxS3aFX1mKn21ySbx9V1fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-jbST49ghO-CAaWscygLTJw-1; Fri, 05 May 2023 03:11:20 -0400
X-MC-Unique: jbST49ghO-CAaWscygLTJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D28580080E;
 Fri,  5 May 2023 07:11:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D76AC15BA0;
 Fri,  5 May 2023 07:11:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3E6F180099D; Fri,  5 May 2023 09:11:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 3/6] move 64bit pci window to end of address space
Date: Fri,  5 May 2023 09:11:14 +0200
Message-Id: <20230505071117.369471-4-kraxel@redhat.com>
In-Reply-To: <20230505071117.369471-1-kraxel@redhat.com>
References: <20230505071117.369471-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index badf13d3233b..0fcd2be598a2 100644
--- a/src/fw/pciinit.c
+++ b/src/fw/pciinit.c
@@ -1128,6 +1128,14 @@ static void pci_bios_map_devices(struct pci_bus *busses)
         r64_mem.base = le64_to_cpu(romfile_loadint("etc/reserved-memory-end", 0));
         if (r64_mem.base < 0x100000000LL + RamSizeOver4G)
             r64_mem.base = 0x100000000LL + RamSizeOver4G;
+        if (CPUPhysBits) {
+            u64 top = 1LL << CPUPhysBits;
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
2.40.1


