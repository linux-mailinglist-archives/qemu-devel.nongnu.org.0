Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB164265D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:08:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Bg-0002IJ-VL; Mon, 05 Dec 2022 04:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28BX-000228-7L
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28BV-0006xs-MU
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=No1rFWDOGgcpCRxA+eKIpRsQyOQa34f3lMNtg8s8nvw=;
 b=KNalBSSEcivUUWmLJwjieYOoUjAVRSoK8iMh4IuW1zO+iHle/hZZDnWlKppuNxSjOQllxW
 KkrL4E7Jvui14J7IXCTWnGgIXKM2IbNaZnIDou8Muhbf3dHWp6kr9wniPNJuQMDC5iRT+W
 aOB33nZB+rdi6+ZdswJAqJe/KXTCgQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-LvnWEbokMBiiSiQFcldH3Q-1; Mon, 05 Dec 2022 04:54:46 -0500
X-MC-Unique: LvnWEbokMBiiSiQFcldH3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64306101A56C;
 Mon,  5 Dec 2022 09:54:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CCD52166B29;
 Mon,  5 Dec 2022 09:54:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 16/51] include/hw: VM state takes precedence in
 virtio_device_should_start
Date: Mon,  5 Dec 2022 10:51:53 +0100
Message-Id: <20221205095228.1314-17-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

The VM status should always preempt the device status for these
checks. This ensures the device is in the correct state when we
suspend the VM prior to migrations. This restores the checks to the
order they where in before the refactoring moved things around.

While we are at it lets improve our documentation of the various
fields involved and document the two functions.

Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
Fixes: 259d69c00b (hw/virtio: introduce virtio_device_should_start)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221130112439.2527228-6-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a973811cbf..acfd4df125 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -116,6 +116,13 @@ struct VirtIODevice
     bool broken; /* device in invalid state, needs reset */
     bool use_disabled_flag; /* allow use of 'disable' flag when needed */
     bool disabled; /* device in temporarily disabled state */
+    /**
+     * @use_started: true if the @started flag should be used to check the
+     * current state of the VirtIO device. Otherwise status bits
+     * should be checked for a current status of the device.
+     * @use_started is only set via QMP and defaults to true for all
+     * modern machines (since 4.1).
+     */
     bool use_started;
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
@@ -391,6 +398,16 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
     return false;
 }
 
+/**
+ * virtio_device_started() - check if device started
+ * @vdev - the VirtIO device
+ * @status - the devices status bits
+ *
+ * Check if the device is started. For most modern machines this is
+ * tracked via the @vdev->started field (to support migration),
+ * otherwise we check for the final negotiated status bit that
+ * indicates everything is ready.
+ */
 static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
 {
     if (vdev->use_started) {
@@ -411,15 +428,11 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
  */
 static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
 {
-    if (vdev->use_started) {
-        return vdev->started;
-    }
-
     if (!vdev->vm_running) {
         return false;
     }
 
-    return status & VIRTIO_CONFIG_S_DRIVER_OK;
+    return virtio_device_started(vdev, status);
 }
 
 static inline void virtio_set_started(VirtIODevice *vdev, bool started)
-- 
2.38.1


