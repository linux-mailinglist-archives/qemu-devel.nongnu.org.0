Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A886F5DDC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 20:25:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puH9Q-000488-2X; Wed, 03 May 2023 14:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puH9L-00047r-R7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puH9E-0006wO-PN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683138253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KToUNXU3L+7OsL3boV6of/pF/PTQl0VCXNSwFA2lZWg=;
 b=FvYoabZ0xfdQvNlOEeHQ+93Vh0hqigQe/9fjh+hn2Rd1C35vjheHtF9bqmjGeoD7g7geTv
 iETW5E1yGZ0JnidDehX2ixSHRFOVGGb9Ej9d23KTaRxGLpOtFvErSRHA3rfm4GXq+sPlPB
 cMf4t7/Kv6YXVndrKDamcuWCmDghE/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-obggE9OLOW69fha8RS729w-1; Wed, 03 May 2023 14:24:11 -0400
X-MC-Unique: obggE9OLOW69fha8RS729w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FBCD8ED9D5;
 Wed,  3 May 2023 18:23:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 589B51410F29;
 Wed,  3 May 2023 18:23:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v1] virtio-mem: Default to "unplugged-inaccessible=on" with
 8.1 on x86-64
Date: Wed,  3 May 2023 20:23:52 +0200
Message-Id: <20230503182352.792458-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Allowing guests to read unplugged memory simplified the bring-up of
virtio-mem in Linux guests -- which was limited to x86-64 only. On arm64
(which was added later), we never had legacy guests and don't even allow
to configure it, essentially always having "unplugged-inaccessible=on".

At this point, all guests we care about
should be supporting VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, so let's
change the default for the 8.1 machine.

This change implies that also memory that supports the shared zeropage
(private anonymous memory) will now require
VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE in the driver in order to be usable by
the guest -- as default, one can still manually set the
unplugged-inaccessible property.

Disallowing the guest to read unplugged memory will be important for
some future features, such as memslot optimizations or protection of
unplugged memory, whereby we'll actually no longer allow the guest to
even read from unplugged memory.

At some point, we might want to deprecate and remove that property.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c           | 4 +++-
 hw/virtio/virtio-mem.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d761c8c775..7802dc21d9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -116,7 +116,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
-GlobalProperty pc_compat_8_0[] = {};
+GlobalProperty pc_compat_8_0[] = {
+    { "virtio-mem", "unplugged-inaccessible", "auto" },
+};
 const size_t pc_compat_8_0_len = G_N_ELEMENTS(pc_compat_8_0);
 
 GlobalProperty pc_compat_7_2[] = {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 957fe77dc0..538b695c29 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1341,7 +1341,7 @@ static Property virtio_mem_properties[] = {
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
 #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
-                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
+                            unplugged_inaccessible, ON_OFF_AUTO_ON),
 #endif
     DEFINE_PROP_BOOL(VIRTIO_MEM_EARLY_MIGRATION_PROP, VirtIOMEM,
                      early_migration, true),
-- 
2.40.0


