Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0D6F5485
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:21:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8fo-0004Su-Ln; Wed, 03 May 2023 05:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pu8fe-0004DD-9J
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pu8fc-0005rH-Qw
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/Is3id2zhFK34pw5JbasCwx/uHRe6bCrASKUUw0QRM=;
 b=e1VeE8ahJghFlh/m9wZfRTp4fDSiw8RMTy1wc5DHn6xDaV/WbvfqM1dOHO32iYoa8w5ZZ6
 7OyVCwnw6brPm1fXN93Yl6x+T0X0oYLICXBBY5y9CCyUzfH3+e00cUHAI73kkqngio5VgX
 q+7mKmEO4pe9eF8fjIZa+r+uE3yEBaQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-QGNbFA2uP6GvZoWIdtdfrA-1; Wed, 03 May 2023 05:21:07 -0400
X-MC-Unique: QGNbFA2uP6GvZoWIdtdfrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D901855304;
 Wed,  3 May 2023 09:21:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 540B22166B26;
 Wed,  3 May 2023 09:21:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A88481804A46; Wed,  3 May 2023 11:20:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 6/6] check for e820 conflict
Date: Wed,  3 May 2023 11:20:58 +0200
Message-Id: <20230503092058.486893-7-kraxel@redhat.com>
In-Reply-To: <20230503092058.486893-1-kraxel@redhat.com>
References: <20230503092058.486893-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add support to check for overlaps with e820 entries.
In case the 64bit pci io window has conflicts move it down.

The only known case where this happens is AMD processors
with 1TB address space which has some space just below
1TB reserved for HT.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/e820map.h    |  1 +
 src/e820map.c    | 15 +++++++++++++++
 src/fw/pciinit.c |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/src/e820map.h b/src/e820map.h
index de8b523003c5..07ce16ec213f 100644
--- a/src/e820map.h
+++ b/src/e820map.h
@@ -18,6 +18,7 @@ struct e820entry {
 void e820_add(u64 start, u64 size, u32 type);
 void e820_remove(u64 start, u64 size);
 void e820_prepboot(void);
+int e820_is_used(u64 start, u64 size);
 
 // e820 map storage
 extern struct e820entry e820_list[];
diff --git a/src/e820map.c b/src/e820map.c
index 39445cf6399d..c761e5e98a75 100644
--- a/src/e820map.c
+++ b/src/e820map.c
@@ -150,3 +150,18 @@ e820_prepboot(void)
 {
     dump_map();
 }
+
+int
+e820_is_used(u64 start, u64 size)
+{
+    int i;
+    for (i=0; i<e820_count; i++) {
+        struct e820entry *e = &e820_list[i];
+        if (start + size <= e->start)
+            continue;
+        if (start >= e->start + e->size)
+            continue;
+        return 1;
+    }
+    return 0;
+}
diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
index b715bf2d772e..190e79216f86 100644
--- a/src/fw/pciinit.c
+++ b/src/fw/pciinit.c
@@ -1140,6 +1140,8 @@ static void pci_bios_map_devices(struct pci_bus *busses)
             if (r64_mem.base < top - size) {
                 r64_mem.base = top - size;
             }
+            if (e820_is_used(r64_mem.base, size))
+                r64_mem.base -= size;
         }
         r64_mem.base = ALIGN(r64_mem.base, align_mem);
         r64_mem.base = ALIGN(r64_mem.base, (1LL<<30));    // 1G hugepage
-- 
2.40.1


