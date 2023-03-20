Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92F6C1B3A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:21:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIFF-0007SB-EE; Mon, 20 Mar 2023 12:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1peIFD-0007Qs-1c
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1peIF7-0005w7-KI
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679329216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QsduCswNIMQH+YanLaFYu2M2t5NcOsDNUy/2/tF16w=;
 b=e6d5eainCk8taJ3xLN7xLlDPjv9j9BojTmFOkGUiKEbowDoDo/IrlKdCJs+cvTilDclLyl
 HqNwwKOIRu23Sp4VVN3YbTE0VhYT9vwGNZWLYGdgSQYmBvwGtQDlBRxMPayNo2GgEMEkKV
 fIMKYVPajZRP3DIIwJB4k0iBt6nTTCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-L0cK7zh-PQ6IreLkKV1YiQ-1; Mon, 20 Mar 2023 12:20:11 -0400
X-MC-Unique: L0cK7zh-PQ6IreLkKV1YiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D18085C069
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 16:20:10 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0C92166B29;
 Mon, 20 Mar 2023 16:20:07 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v14 2/4] vhost_vdpa: fix the input in
 trace_vhost_vdpa_listener_region_del()
Date: Tue, 21 Mar 2023 00:19:57 +0800
Message-Id: <20230320161959.650841-3-lulu@redhat.com>
In-Reply-To: <20230320161959.650841-1-lulu@redhat.com>
References: <20230320161959.650841-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In trace_vhost_vdpa_listener_region_del, the value for llend
should change to int128_get64(int128_sub(llend, int128_one()))

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc6bad23d5..92c2413c76 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -288,7 +288,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
     llend = vhost_vdpa_section_end(section);
 
-    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
+    trace_vhost_vdpa_listener_region_del(v, iova,
+        int128_get64(int128_sub(llend, int128_one())));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
-- 
2.34.3


