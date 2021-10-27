Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B743CA7A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:21:06 +0200 (CEST)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfirZ-0004uk-3b
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJc-00089W-FN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJa-00036h-JN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHf2ZqC5DC9zioFkkyjMYiEOu523mJCDOZFO8VfZXy8=;
 b=BL267+ptq0W2bYQ52iivwUPQPh5j3f2vS1ZEExf0yo9m/Xdqd+JsA+NXksaWc2h7NnvhLj
 QFHdAz8gA+eJp4l34ipayYGbl2FLvFD39tOwNofc4yuYr3/x+Biuc6A21cJgH4NxI+xJka
 dP6QI+I7T/TWuYiSpwk9Vy+p/rqzbq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-EzF0ft-uOY2jUUW1mdrN4g-1; Wed, 27 Oct 2021 08:45:54 -0400
X-MC-Unique: EzF0ft-uOY2jUUW1mdrN4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00F92802B4F;
 Wed, 27 Oct 2021 12:45:53 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA57D19724;
 Wed, 27 Oct 2021 12:45:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/12] vhost: Don't merge unmergeable memory sections
Date: Wed, 27 Oct 2021 14:45:23 +0200
Message-Id: <20211027124531.57561-5-david@redhat.com>
In-Reply-To: <20211027124531.57561-1-david@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Memory sections that are marked unmergeable should not be merged, to
allow for atomic removal later.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 2707972870..49a1074097 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -620,7 +620,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
                                                mrs_size, mrs_host);
     }
 
-    if (dev->n_tmp_sections) {
+    if (dev->n_tmp_sections && !section->unmergeable) {
         /* Since we already have at least one section, lets see if
          * this extends it; since we're scanning in order, we only
          * have to look at the last one, and the FlatView that calls
@@ -653,7 +653,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
             size_t offset = mrs_gpa - prev_gpa_start;
 
             if (prev_host_start + offset == mrs_host &&
-                section->mr == prev_sec->mr &&
+                section->mr == prev_sec->mr && !prev_sec->unmergeable &&
                 (!dev->vhost_ops->vhost_backend_can_merge ||
                  dev->vhost_ops->vhost_backend_can_merge(dev,
                     mrs_host, mrs_size,
-- 
2.31.1


