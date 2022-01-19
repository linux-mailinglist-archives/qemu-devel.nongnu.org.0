Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A071249361F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:20:10 +0100 (CET)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6CP-0001dy-FD
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:20:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62l-00076G-6t
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62j-0001BF-2l
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3RSjOQBlPTxLvQkAqgjPzeC1kjMjyIdJ01cEvje6X0=;
 b=DhOLD8e/MmeV+oB7fi9IkXarSElYvAKOlcmLgeR89I7TRWXKs0hJ5I1zR89DxAGD8uTInM
 DLgGUYaCqyUIZlAkbqdlMM35/TsKC3Dp2fN+fZNJAiQFdZMH9txXNWNObZj42dHINC0Pg6
 +UcqPzn8sY901KO44hApejcOq/3dJGQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-LjB4fwAmMzSMYfr28BXaUQ-1; Wed, 19 Jan 2022 03:10:07 -0500
X-MC-Unique: LjB4fwAmMzSMYfr28BXaUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f187-20020a1c38c4000000b0034d5c66d8f5so1425079wma.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3RSjOQBlPTxLvQkAqgjPzeC1kjMjyIdJ01cEvje6X0=;
 b=Ifj+SpMLGzoaRTd0aPB4d/iVXfMJ+b3BM8D2i4ApcEsvzU0k8acBmsj3ngwcjZYH1b
 fAV+pLhsuHlwyQ7gyNiiMLFX4e+Yai4+qqXojRUGYKFJZQyNRl3cZiib1OQN8k5XApb4
 56fzL5uueNR/6ZhNzE9Sb6C7zL8JgDLLAZMD8LRm2I2pkhp8XoGFu2qEL3rKfgRxO+C9
 qRrLld01hXWVeYMy5EX7rLBYhDBkaqohjLJvf36XYtaJioRX1kwrVhh7xyzGtWU8kmQE
 Q44y6utmfslLKL5e7aGHOTYn20FzQW3pvULp+xgW1h8WG8Zw3/zc+cuirFzCoW9CYFXy
 exAg==
X-Gm-Message-State: AOAM532GPYjKdJxPNxkba/FFffMKdFBGqwuXkQb6F8si8oc/Amol5/Pc
 2h6OKlmK4aQhyxZdSZ6YveASYtXDMprustTj2FFRHvcBOqIH9+GA/dVZ0ulhJsmarIRvgWNik60
 Vvme/WCc2z04oyYeTvxRMsnT5xz+V+DQVouVeNAdvwDTSkryumRMl8QLsXkVgR7Ig
X-Received: by 2002:a5d:5143:: with SMTP id u3mr3254555wrt.714.1642579805685; 
 Wed, 19 Jan 2022 00:10:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0BWv1+BjcDLjXD2pV4No6wG4J/SDLyeHxIIOsf3BwzAzgUkleJdktSw/iqo6sbM3Ul3aawQ==
X-Received: by 2002:a5d:5143:: with SMTP id u3mr3254519wrt.714.1642579805349; 
 Wed, 19 Jan 2022 00:10:05 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:04 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 06/15] migration: Move temp page setup and cleanup into
 separate functions
Date: Wed, 19 Jan 2022 16:09:20 +0800
Message-Id: <20220119080929.39485-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Temp pages will need to grow if we want to have multiple channels for postcopy,
because each channel will need its own temp page to cache huge page data.

Before doing that, cleanup the related code.  No functional change intended.

Since at it, touch up the errno handling a little bit on the setup side.

Signed-off-by: Peter Xu <peterx@redhat.com>
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
2.32.0


