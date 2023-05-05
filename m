Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D16F7D89
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:13:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupbI-0004ml-Jx; Fri, 05 May 2023 03:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbE-0004lW-8z
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbC-0000fc-Gg
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683270686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNvSqf9QPsEssFcNpRNgyESFGm56zOR8mpMAesar58E=;
 b=JFcrEE6DhefPE7mWIgSc15uCb7GhSnF3NEolVr5dsRMVPsr6TZ2LSruEYMmqF96QeJpaRo
 Y0oSW1sSnUE2StuCW2V1LvJICyllz2quikrlPmPlN1OyVAF01lNOzSTGIr+uU87cWR/I9b
 J8+1nSk6lGUbiT7A+SK1hl+RKQuZVmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-syOOQgklPr-cGy1-NtcFRQ-1; Fri, 05 May 2023 03:11:24 -0400
X-MC-Unique: syOOQgklPr-cGy1-NtcFRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE6A185A7A2;
 Fri,  5 May 2023 07:11:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE1663F5B;
 Fri,  5 May 2023 07:11:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE635180157C; Fri,  5 May 2023 09:11:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 6/6] check for e820 conflict
Date: Fri,  5 May 2023 09:11:17 +0200
Message-Id: <20230505071117.369471-7-kraxel@redhat.com>
In-Reply-To: <20230505071117.369471-1-kraxel@redhat.com>
References: <20230505071117.369471-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
index a6b5dff12bd3..1e56ee47fa86 100644
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


