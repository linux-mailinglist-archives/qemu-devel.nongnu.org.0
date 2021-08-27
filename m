Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7FA3F93D1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:53:42 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTrv-0002mS-Gq
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpV-0008T6-VY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpP-0000wM-MU
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g34dwAtC2rczrRuDc5vUhKKdm0oTRaK2ox/tT774cU8=;
 b=fGlBLnMnRg64Z2WKPI3bQ/zFTG7V7vrO/BV+L4ad1yB1+waAq7anHbz4wtwduR8yR9kAOb
 dqkmsB1dDILiQPbiRpZSpVUE3KFXN3JjlteSxOKwfrFNmEegmWQ4F9zT1H/a2NJacGGbLU
 S/5ktZGrVqBxVRzkWwwYQrOwafZ25Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-6yjR_K5cOlqSTaV0w-1ihA-1; Fri, 27 Aug 2021 00:50:52 -0400
X-MC-Unique: 6yjR_K5cOlqSTaV0w-1ihA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548B9800493;
 Fri, 27 Aug 2021 04:50:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B936A8FB;
 Fri, 27 Aug 2021 04:50:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D3B711380B8; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] vhost-scsi: Plug memory leak on migrate_add_blocker()
 failure
Date: Fri, 27 Aug 2021 06:50:34 +0200
Message-Id: <20210827045044.388748-6-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.742, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-6-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 8c611bfd2d..039caf2614 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -208,7 +208,6 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
                 "target SCSI device state or use shared storage over network), "
                 "set 'migratable' property to true to enable migration.");
         if (migrate_add_blocker(vsc->migration_blocker, errp) < 0) {
-            error_free(vsc->migration_blocker);
             goto free_virtio;
         }
     }
@@ -233,11 +232,12 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     return;
 
  free_vqs:
+    g_free(vsc->dev.vqs);
     if (!vsc->migratable) {
         migrate_del_blocker(vsc->migration_blocker);
     }
-    g_free(vsc->dev.vqs);
  free_virtio:
+    error_free(vsc->migration_blocker);
     virtio_scsi_common_unrealize(dev);
  close_fd:
     close(vhostfd);
-- 
2.31.1


