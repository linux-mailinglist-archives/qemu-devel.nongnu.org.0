Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D563D7127
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:28:39 +0200 (CEST)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8IS6-0007Up-E5
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8IPz-000676-Tk
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8IPx-0006vI-5X
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627374382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mOJbxAx/K91LqEcNZ+q+X4VEogak03edbLBRpcvvf4=;
 b=DVgansuvkOi8dJylQ9Go2BXv4hiB9GpM+KT5Ezoqf9LrkDAjf9nFscz1ZxInWJlfM6Gye5
 a2QnzTJiSad9Ij/KcJtXON6B2vfeD+CFxHFSfJ5z+3Uz7Mn9OrURYlXvNaND3tJ7E/ySea
 djWRTckG/kCymgRQXQiewwVhnuhEfKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-bEQaxFFVNNGDsCkXOLIH4w-1; Tue, 27 Jul 2021 04:26:19 -0400
X-MC-Unique: bEQaxFFVNNGDsCkXOLIH4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 151F98799EF;
 Tue, 27 Jul 2021 08:26:18 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-128.ams2.redhat.com [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1D1460C0F;
 Tue, 27 Jul 2021 08:26:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] tpm: mark correct memory region range dirty when
 clearing RAM
Date: Tue, 27 Jul 2021 10:25:42 +0200
Message-Id: <20210727082545.17934-2-david@redhat.com>
In-Reply-To: <20210727082545.17934-1-david@redhat.com>
References: <20210727082545.17934-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might not start at the beginning of the memory region. Let's
calculate the offset into the memory region via the difference in the
host addresses.

Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Fixes: ffab1be70692 ("tpm: clear RAM when "memory overwrite" requested")
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/tpm/tpm_ppi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 362edcc5c9..274e9aa4b0 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
         guest_phys_blocks_init(&guest_phys_blocks);
         guest_phys_blocks_append(&guest_phys_blocks);
         QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
+            hwaddr mr_offs = block->host_addr -
+                             (uint8_t *)memory_region_get_ram_ptr(block->mr);
+
             trace_tpm_ppi_memset(block->host_addr,
                                  block->target_end - block->target_start);
             memset(block->host_addr, 0,
                    block->target_end - block->target_start);
-            memory_region_set_dirty(block->mr, 0,
+            memory_region_set_dirty(block->mr, mr_offs,
                                     block->target_end - block->target_start);
         }
         guest_phys_blocks_free(&guest_phys_blocks);
-- 
2.31.1


