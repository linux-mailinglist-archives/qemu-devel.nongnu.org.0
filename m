Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A84A0155
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:03:20 +0100 (CET)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDXSn-0006Zg-9f
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWDS-00029w-UR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWD9-0002c2-Gt
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq2DgU0T8TiyoW+AeqpkEASJI3l+VWw2yOgyjpGNPwo=;
 b=I/6+Oh2oC1LhJ9Bz+XTgG2BO920DpJALigfSXvzC4aoRGLj3MjvRUXkeQ9DU37SaNYyRWM
 yk+OTH9VvQrJ7bNg2mAUgB0DJs7/TIpvz1j0M6nmubUr9ggH3RPSxCYKDMM52K644SGMBf
 42SKla4qkrtjPv6QFcdj2diTn4Pus/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-VX04Gg0LMee03O_N4xYjHA-1; Fri, 28 Jan 2022 13:42:53 -0500
X-MC-Unique: VX04Gg0LMee03O_N4xYjHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 515F8101F7A1;
 Fri, 28 Jan 2022 18:42:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 789AF77456;
 Fri, 28 Jan 2022 18:42:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] migration: Move temp page setup and cleanup into
 separate functions
Date: Fri, 28 Jan 2022 19:30:33 +0100
Message-Id: <20220128183033.31998-37-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Temp pages will need to grow if we want to have multiple channels for postcopy,
because each channel will need its own temp page to cache huge page data.

Before doing that, cleanup the related code.  No functional change intended.

Since at it, touch up the errno handling a little bit on the setup side.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 82 +++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2176ed68a5..e662dd05cc 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -523,6 +523,19 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
     return 0;
 }
 
+static void postcopy_temp_pages_cleanup(MigrationIncomingState *mis)
+{
+    if (mis->postcopy_tmp_page) {
+        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
+        mis->postcopy_tmp_page = NULL;
+    }
+
+    if (mis->postcopy_tmp_zero_page) {
+        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
+        mis->postcopy_tmp_zero_page = NULL;
+    }
+}
+
 /*
  * At the end of a migration where postcopy_ram_incoming_init was called.
  */
@@ -564,14 +577,8 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
         }
     }
 
-    if (mis->postcopy_tmp_page) {
-        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
-        mis->postcopy_tmp_page = NULL;
-    }
-    if (mis->postcopy_tmp_zero_page) {
-        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
-        mis->postcopy_tmp_zero_page = NULL;
-    }
+    postcopy_temp_pages_cleanup(mis);
+
     trace_postcopy_ram_incoming_cleanup_blocktime(
             get_postcopy_total_blocktime());
 
@@ -1082,6 +1089,40 @@ retry:
     return NULL;
 }
 
+static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
+{
+    int err;
+
+    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
+                                  PROT_READ | PROT_WRITE,
+                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (mis->postcopy_tmp_page == MAP_FAILED) {
+        err = errno;
+        mis->postcopy_tmp_page = NULL;
+        error_report("%s: Failed to map postcopy_tmp_page %s",
+                     __func__, strerror(err));
+        return -err;
+    }
+
+    /*
+     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
+     */
+    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
+                                       PROT_READ | PROT_WRITE,
+                                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
+        err = errno;
+        mis->postcopy_tmp_zero_page = NULL;
+        error_report("%s: Failed to map large zero page %s",
+                     __func__, strerror(err));
+        return -err;
+    }
+
+    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
+
+    return 0;
+}
+
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
@@ -1122,32 +1163,11 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
-                                  PROT_READ | PROT_WRITE, MAP_PRIVATE |
-                                  MAP_ANONYMOUS, -1, 0);
-    if (mis->postcopy_tmp_page == MAP_FAILED) {
-        mis->postcopy_tmp_page = NULL;
-        error_report("%s: Failed to map postcopy_tmp_page %s",
-                     __func__, strerror(errno));
+    if (postcopy_temp_pages_setup(mis)) {
+        /* Error dumped in the sub-function */
         return -1;
     }
 
-    /*
-     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
-     */
-    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
-                                       PROT_READ | PROT_WRITE,
-                                       MAP_PRIVATE | MAP_ANONYMOUS,
-                                       -1, 0);
-    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
-        int e = errno;
-        mis->postcopy_tmp_zero_page = NULL;
-        error_report("%s: Failed to map large zero page %s",
-                     __func__, strerror(e));
-        return -e;
-    }
-    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
-
     trace_postcopy_ram_enable_notify();
 
     return 0;
-- 
2.34.1


