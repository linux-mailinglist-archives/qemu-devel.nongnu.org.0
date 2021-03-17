Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B1333EDD5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:59:27 +0100 (CET)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSxa-0001pI-Mj
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSuv-00075h-44
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSus-0001aX-3G
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItT/kmb7okB91wknUVLSpn+cG/VC4I6jfwi5h3k0lw4=;
 b=P176sPIXtwweg9uGUC5P8jEBRZ8z2qkKowbjxFlmxNvasgEC0jGb4q+Hmb5I47rd5Z9UmM
 NCAbB0bngPiN5VcWq+TxwrvE5X1gUNRf9hTEXdLUvrrYfWtMWn+B1U/lqONC9jjTi/1yaK
 CFUE8P1IZdMRjVid5Ql22PoSebc75bY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-3ICvCEfaPs2bme5hnpBKHA-1; Wed, 17 Mar 2021 05:56:35 -0400
X-MC-Unique: 3ICvCEfaPs2bme5hnpBKHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CC079CDB4;
 Wed, 17 Mar 2021 09:56:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B7DB6F969;
 Wed, 17 Mar 2021 09:56:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8E131800608; Wed, 17 Mar 2021 10:56:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] s390x: add have_virtio_ccw
Date: Wed, 17 Mar 2021 10:56:21 +0100
Message-Id: <20210317095622.2839895-3-kraxel@redhat.com>
In-Reply-To: <20210317095622.2839895-1-kraxel@redhat.com>
References: <20210317095622.2839895-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a symbol which can be used to prevent ccw modules
being loaded into system emulators without ccw support.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/s390x/virtio-ccw.h | 5 +++++
 hw/s390x/virtio-ccw.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index 49a2b8ca42df..0168232e3b8d 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -63,6 +63,11 @@ typedef struct VirtioBusClass VirtioCcwBusClass;
 DECLARE_OBJ_CHECKERS(VirtioCcwBusState, VirtioCcwBusClass,
                      VIRTIO_CCW_BUS, TYPE_VIRTIO_CCW_BUS)
 
+/*
+ * modules can reference this symbol to avoid being loaded
+ * into system emulators without ccw support
+ */
+extern bool have_virtio_ccw;
 
 struct VirtIOCCWDeviceClass {
     CCWDeviceClass parent_class;
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 06c06056814b..314ed7b24566 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -35,6 +35,8 @@
 
 #define NR_CLASSIC_INDICATOR_BITS 64
 
+bool have_virtio_ccw = true;
+
 static int virtio_ccw_dev_post_load(void *opaque, int version_id)
 {
     VirtioCcwDevice *dev = VIRTIO_CCW_DEVICE(opaque);
-- 
2.30.2


