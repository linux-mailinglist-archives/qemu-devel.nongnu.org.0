Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576943490E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:36:11 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8x8-0006up-7j
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hb-0004NB-Qe
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ha-0003E3-7i
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiJ0iHIZ1ouAmADpp/YMcXYNacyY5H2Zjhw9Phv+fQ0=;
 b=D8GK+p2qvR0jnLnCcZnpDA5ApGHcnlpxP0vyVL1GZPXwrZAQAEg7x8PKBxHE97+XIQ1vw6
 KLHzHY33+CXSwb5iKyVBwKJ+Gi53+gps/65FOi7l3rRsi4C5Op2KKq47s0MbTkKZdFgyVx
 9XQ/hWRrbecLbJog9tVvblH/frGR7/4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-1kR-ezE0N--TatzENKUUKA-1; Wed, 20 Oct 2021 06:20:04 -0400
X-MC-Unique: 1kR-ezE0N--TatzENKUUKA-1
Received: by mail-ed1-f70.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so20535284edv.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QiJ0iHIZ1ouAmADpp/YMcXYNacyY5H2Zjhw9Phv+fQ0=;
 b=KczwBhhi4Pa/hKcPxM4cqLh3iMzQE2Otxc3IN5hm7GZRuCGMcdnqoAaLvUYRsvP0ZI
 VU90rTuAX2ITG1KsaXBRAq+VfKunR6AXmzASVMfTDycObT6poYl365h4X0D4oSgrOro2
 ekY6FWYV5WYV6UzmmCHs/nv0C2y3dnwBW7zpk7ljU6kFOD5u1XvqtSMoJQIkGTCcrAob
 9TvzbKl/bazra54PsUGE36CRA0bot64u6eK/Xzq6WTV6RRsVJlyWM9gpkUVbyTZJMNWl
 +QEXaZ1F9p/BGjUk6LcR5w6gGzW7WqtUv5yaeOhiVUPrph+YXriguG8GBYdiEaVXuKqi
 0bQw==
X-Gm-Message-State: AOAM5314zv+Jg/bvCQ1G0fChPqNIawwGKDclBpp7e0lPxt4sJPoKxis4
 0DP1MaQ2WpnrnmG7sD4u3zAf4CKKXmKNt0LFEHJ8NHW/rLSWrIGIVBvJmtkT4Y91nLmEXhPEc+L
 s4HzDv8sCNYg5WX585cDLSFEXWqEn36vkKfPLTzsg222YjsQJ8PDhBqAcEaqF
X-Received: by 2002:a05:6402:1c94:: with SMTP id
 cy20mr61495767edb.144.1634725202930; 
 Wed, 20 Oct 2021 03:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKpCrjtT++ML6oQXSfAq1NLBKAjhAt/Oe8FxM7FsLfcYarOzBRcEFDOCoHmpk2O3suYsWkaA==
X-Received: by 2002:a05:6402:1c94:: with SMTP id
 cy20mr61495740edb.144.1634725202757; 
 Wed, 20 Oct 2021 03:20:02 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id m3sm1016985edc.11.2021.10.20.03.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:02 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/44] vdpa: Add vhost_vdpa_section_end
Message-ID: <20211020101844.988480-18-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Abstract this operation, that will be reused when validating the region
against the iova range that the device supports.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211014141236.923287-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ea1aa71ad8..be7c63b4ba 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -24,6 +24,19 @@
 #include "trace.h"
 #include "qemu-common.h"
 
+/*
+ * Return one past the end of the end of section. Be careful with uint64_t
+ * conversions!
+ */
+static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
+{
+    Int128 llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+
+    return llend;
+}
+
 static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
@@ -160,10 +173,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
-
+    llend = vhost_vdpa_section_end(section);
     if (int128_ge(int128_make64(iova), llend)) {
         return;
     }
@@ -221,9 +231,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = vhost_vdpa_section_end(section);
 
     trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
 
-- 
MST


