Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7D4200AC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:08:22 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwXl-0000nX-Iv
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9V-0004I0-9y
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:17 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9T-00012Z-Lz
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:17 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z20so468533edc.13
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iazzme8gW0iiwChNe0S4mE4gEWXWyIgyzE45wOse0ek=;
 b=QoAds/7SxGuQX7UN2AyLGGzlyeMhBTlgKf/MrYKvDYgvqV1kYY66LB+LS1DOJXUv0i
 4b8CNP4U6RBv3cZ51XwESWKgqIt8FMwBQb4kJcBzpU+IZWlBkgJUuUkjJcunLIoHGjFZ
 183NKv1KrIKyjcq3gi5Q8O1qx90eJpdKF1FFWdJc7+9TKXjwp3db7h+UlK8sNceCP1D0
 yO3TW2g3bsQ69YZWg5AHEKSEJKnsxpBsDP21yJpnPZ0ueFK3tKmPwEaD0Njv+q/WJGI8
 fodK93HLOpM0v33zlF8DsrJ/XPQ5GUmInimsxQ8Y8JSei2HBF3+WQRycJKqIL09jray9
 edrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Iazzme8gW0iiwChNe0S4mE4gEWXWyIgyzE45wOse0ek=;
 b=njVZDVoI+4uSi4v+a+4NaMXO9adW+pD7fVGl5F72RNkZfP1b2aj1+75OMMqUxr6btj
 OikCnzLMDUOw1k6XAwmlNDsu9Tokx244R3QsyJpsBZyi5geIojRnmJORlSAI0dgBKORB
 m0tmyhBlTmRWaQyiw7zEr8jnkSaKQ/VKUHq+VpfwUj6Ny+CFgmxFTwej8oWHqN7hhOx6
 LwAWrVL21XgBwI+fBVYDAxpSyQ45+zLL3cycikAAs2Z26COVUpsyTl/ul4uFAqiO2Pop
 Zl19Lked5ht00Id2XVkMi6Nj8Pmq4hJRyWK/HB4GrDbj+llEbUShoAuIf90OiDCkDUMv
 G9dQ==
X-Gm-Message-State: AOAM530P8TwImMhrth3CnFsnC3tqHqxphIJqA26DCKdBtF7FTzwqmv3F
 ZqniGWGSQxPSL1sCDuSCcYhzWWH4uHA=
X-Google-Smtp-Source: ABdhPJyxZN9AtNHAbvzajZc/7f58G0I4Xz1Kw/9gLYhsN0d6vt5OHAuMDn7evg/TMOXteRoFzmE69w==
X-Received: by 2002:a17:906:39cd:: with SMTP id
 i13mr8665730eje.227.1633246994397; 
 Sun, 03 Oct 2021 00:43:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] softmmu/memory_mapping: factor out adding physical
 memory ranges
Date: Sun,  3 Oct 2021 09:42:49 +0200
Message-Id: <20211003074250.60869-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's factor out adding a MemoryRegionSection to the list, to be reused in
RamDiscardManager context next.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210727082545.17934-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory_mapping.c | 41 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index d401ca7e31..a2af02c41c 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -193,29 +193,14 @@ typedef struct GuestPhysListener {
     MemoryListener listener;
 } GuestPhysListener;
 
-static void guest_phys_blocks_region_add(MemoryListener *listener,
+static void guest_phys_block_add_section(GuestPhysListener *g,
                                          MemoryRegionSection *section)
 {
-    GuestPhysListener *g;
-    uint64_t section_size;
-    hwaddr target_start, target_end;
-    uint8_t *host_addr;
-    GuestPhysBlock *predecessor;
-
-    /* we only care about RAM */
-    if (!memory_region_is_ram(section->mr) ||
-        memory_region_is_ram_device(section->mr) ||
-        memory_region_is_nonvolatile(section->mr)) {
-        return;
-    }
-
-    g            = container_of(listener, GuestPhysListener, listener);
-    section_size = int128_get64(section->size);
-    target_start = section->offset_within_address_space;
-    target_end   = target_start + section_size;
-    host_addr    = memory_region_get_ram_ptr(section->mr) +
-                   section->offset_within_region;
-    predecessor  = NULL;
+    const hwaddr target_start = section->offset_within_address_space;
+    const hwaddr target_end = target_start + int128_get64(section->size);
+    uint8_t *host_addr = memory_region_get_ram_ptr(section->mr) +
+                         section->offset_within_region;
+    GuestPhysBlock *predecessor = NULL;
 
     /* find continuity in guest physical address space */
     if (!QTAILQ_EMPTY(&g->list->head)) {
@@ -261,6 +246,20 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
 #endif
 }
 
+static void guest_phys_blocks_region_add(MemoryListener *listener,
+                                         MemoryRegionSection *section)
+{
+    GuestPhysListener *g = container_of(listener, GuestPhysListener, listener);
+
+    /* we only care about RAM */
+    if (!memory_region_is_ram(section->mr) ||
+        memory_region_is_ram_device(section->mr) ||
+        memory_region_is_nonvolatile(section->mr)) {
+        return;
+    }
+    guest_phys_block_add_section(g, section);
+}
+
 void guest_phys_blocks_append(GuestPhysBlockList *list)
 {
     GuestPhysListener g = { 0 };
-- 
2.31.1



