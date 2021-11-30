Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37664462FC9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:35:23 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzXm-0005MD-BW
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:35:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrzTO-0007tU-Uh
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrzTM-0000p7-O5
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638264648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDmPfjCsOBWT+FckG8UdRPXG33D+VLX4QmoaUXN8MHI=;
 b=EY87KY18MWEQllJewt5+hL/6WXTaOqYaxPM28wg0Ly9rBs/qGRW8ke6a7ZjST1zaiEhDke
 6nDTZITpG2bBSdS/0z6Z/+V1iguzMOzzM39I0kUA9jAl0DeNhpes5zJiVdgLXgntEvWykD
 uZlroiBtqCrSmTXNsr0+hD09rOAiJRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-kwjzv93iOWCxQzv9FStRSg-1; Tue, 30 Nov 2021 04:30:45 -0500
X-MC-Unique: kwjzv93iOWCxQzv9FStRSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4444185302A;
 Tue, 30 Nov 2021 09:30:43 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 089CB19D9F;
 Tue, 30 Nov 2021 09:30:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/3] virtio-mem: Set "unplugged-inaccessible=auto" for the
 6.2 machine on x86
Date: Tue, 30 Nov 2021 10:28:38 +0100
Message-Id: <20211130092838.24224-4-david@redhat.com>
In-Reply-To: <20211130092838.24224-1-david@redhat.com>
References: <20211130092838.24224-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the new default to "auto", keeping it set to "on" for compat
machines. This property is only available for x86 targets.

TODO: once 6.2 was released and we have compat machines, target the next
      QEMU release.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c           | 1 +
 hw/virtio/virtio-mem.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc..045ba05431 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
     { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
     { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
+    { "virtio-mem", "unplugged-inaccessible", "off" },
 };
 const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 1e57156e81..a5d26d414f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1169,7 +1169,7 @@ static Property virtio_mem_properties[] = {
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
 #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
-                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
+                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
 #endif
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.1


