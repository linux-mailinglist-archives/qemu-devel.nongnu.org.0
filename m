Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C94D199C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:51:20 +0100 (CET)
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaFD-0002fS-2Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRa1X-0003Hm-SL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRa1W-0002Pe-By
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646746629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6S0X7GDSRU+gCrrOUz4DOdDWzm9ASA6gKnQRxNpHDA=;
 b=ZO/PHbXYo1rdSmn7KFS7H+3sAP5H00zvp95Olb6uis4rflI9bKO97dV9/GU8XsjQG6vR8Q
 D9yS4GisE1B8jweRUnc1TQ5z+MFtIKZDiqXbYaSsJ0kyyDTwiqHm71AG27NGzW2U7acy+3
 Hxi/ioPjRzLGKzWqUEx+mK+ge1vrHhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-sMJdne1hPOmOCr2zPa89pQ-1; Tue, 08 Mar 2022 08:37:08 -0500
X-MC-Unique: sMJdne1hPOmOCr2zPa89pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8CA31006AA6;
 Tue,  8 Mar 2022 13:37:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-181.pek2.redhat.com
 [10.72.12.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E2F81F78;
 Tue,  8 Mar 2022 13:37:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/15] vdpa: Never set log_base addr if SVQ is enabled
Date: Tue,  8 Mar 2022 21:34:50 +0800
Message-Id: <20220308133451.25378-15-jasowang@redhat.com>
In-Reply-To: <20220308133451.25378-1-jasowang@redhat.com>
References: <20220308133451.25378-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Setting the log address would make the device start reporting invalid
dirty memory because the SVQ vrings are located in qemu's memory.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 69a4bfd..5470566 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1092,7 +1092,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    struct vhost_vdpa *v = dev->opaque;
+    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
 
-- 
2.7.4


