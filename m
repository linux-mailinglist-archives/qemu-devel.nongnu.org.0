Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749D6F5E57
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 20:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHQR-000526-EU; Wed, 03 May 2023 14:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puHQN-00050G-Q2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puHQG-0006J5-3E
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683139309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HGwBTmhAGLFUs8/gSh5byBD/NyygIe8IoUUXhjWyahM=;
 b=OV7KqbP4w9e3RxHn3994hwpBjtxgjq1U3FQr2Wt2KOJxuhUMrPdeID3FBbL1eG7iomAbcS
 up3JMRRctxD5F9d0ltP4YT1fZCyICzXK4+ecsKzYWaZFw90w4AY50MV6FxqqZ2LMjv9HNx
 j5QiDwFEhcywySydyoKJlEGckExwuMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-y9a5wautMQiQqPg1HU_rKw-1; Wed, 03 May 2023 14:41:47 -0400
X-MC-Unique: y9a5wautMQiQqPg1HU_rKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7490802C1A
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 18:41:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE7A40BC798;
 Wed,  3 May 2023 18:41:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v1] vhost-user: Remove acpi-specific memslot limit
Date: Wed,  3 May 2023 20:41:44 +0200
Message-Id: <20230503184144.808478-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

Let's just support 512 memslots on x86-64 and aarch64 as well. The maximum
number of ACPI slots (256) is no longer completely expressive ever since
we supported virtio-based memory devices. Further, we're completely
ignoring other memslots used outside of memory device context, such as
memslots used for boot memory.

Note that the vhost memslot limit in the kernel is usually configured to
be 509. With this change, we prepare vhost-user on the QEMU side to be
closer to that limit, to eventually support ~512 memslots in most vhost
implementations and have less "surprises" when cold/hotplugging vhost
devices while also consuming more memslots than we're currently used to
by memory devices (e.g., once virtio-mem starts using multiple memslots).

Note that most vhost-user implementations only support a small number of
memslots so far, which we can hopefully improve in the near future.

We'll leave the PPC special-case as is for now.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost-user.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e5285df4ba..378bd44718 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -42,17 +42,7 @@
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
 #define VHOST_USER_BACKEND_MAX_FDS     8
 
-/*
- * Set maximum number of RAM slots supported to
- * the maximum number supported by the target
- * hardware plaform.
- */
-#if defined(TARGET_X86) || defined(TARGET_X86_64) || \
-    defined(TARGET_ARM) || defined(TARGET_AARCH64)
-#include "hw/acpi/acpi.h"
-#define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
-
-#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
+#if defined(TARGET_PPC) || defined(TARGET_PPC64)
 #include "hw/ppc/spapr.h"
 #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
 
-- 
2.40.0


