Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD635A17C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:50:39 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsT0-0003EC-W3
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUsRh-0002ER-AG
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUsRf-0002tR-A5
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617979754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GuLDHHwsryU84PcykETQjs0XfFbQveBk0BRUTIGm8BM=;
 b=X7RY2tIMpcBrP1Ks748ChwD69nxd0tb9hc8u19BGoqT24SZEkRTy0d5itNt1gmKJE+KVwI
 l5xdbQp+6E9UhU+/tJb61QP9knOdY3N21GZWef1ysO7RDhrRuPMAku0THX/2adkvL2QVtx
 lIydI2wLFy5lQ8hLZEwt/alsF9hCMtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Yuu5SmOyPZi9MLf1TPbPUQ-1; Fri, 09 Apr 2021 10:49:12 -0400
X-MC-Unique: Yuu5SmOyPZi9MLf1TPbPUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA7B8030A1;
 Fri,  9 Apr 2021 14:49:11 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-112.ams2.redhat.com
 [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C52DD5C1D5;
 Fri,  9 Apr 2021 14:49:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Date: Fri,  9 Apr 2021 16:48:58 +0200
Message-Id: <20210409144858.278553-2-cohuck@redhat.com>
In-Reply-To: <20210409144858.278553-1-cohuck@redhat.com>
References: <20210409144858.278553-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pierre Morel <pmorel@linux.ibm.com>

ccw_dstream_read/write functions returned values are sometime
not taking into account and reported back to the upper level
of interpretation of CCW instructions.

It follows that accessing an invalid address does not trigger
a subchannel status program check to the guest as it should.

Let's test the return values of ccw_dstream_write[_buf] and
ccw_dstream_read[_buf] and report it to the caller.

Cc: qemu-stable@nongnu.org
Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/char/terminal3270.c | 11 +++++--
 hw/s390x/3270-ccw.c    |  5 +++-
 hw/s390x/css.c         | 14 +++++----
 hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
 4 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index a9a46c8ed39f..82e85fac2e68 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
 {
     Terminal3270 *t = TERMINAL_3270(dev);
     int len;
+    int ret;
 
     len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
-    ccw_dstream_write_buf(get_cds(t), t->inv, len);
+    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
+    if (ret < 0) {
+        return ret;
+    }
     t->in_len -= len;
 
     return len;
@@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
 
     t->outv[out_len++] = cmd;
     do {
-        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
+        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
+        if (retval < 0) {
+            return retval;
+        }
         count = ccw_dstream_avail(get_cds(t));
         out_len += len;
 
diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index 821319eee6d1..f3e7342b1e8e 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
     }
 
     len = ck->read_payload_3270(dev);
+    if (len < 0) {
+        return len;
+    }
     ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
 
     return 0;
@@ -50,7 +53,7 @@ static int handle_payload_3270_write(EmulatedCcw3270Device *dev, CCW1 *ccw)
     len = ck->write_payload_3270(dev, ccw->cmd_code);
 
     if (len <= 0) {
-        return -EIO;
+        return len ? len : -EIO;
     }
 
     ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index fe47751df444..4149b8e5a79c 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1055,10 +1055,11 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
             }
         }
         len = MIN(ccw.count, sizeof(sch->sense_data));
-        ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
+        ret = ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
         sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
-        memset(sch->sense_data, 0, sizeof(sch->sense_data));
-        ret = 0;
+        if (!ret) {
+            memset(sch->sense_data, 0, sizeof(sch->sense_data));
+        }
         break;
     case CCW_CMD_SENSE_ID:
     {
@@ -1083,9 +1084,10 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
         } else {
             sense_id[0] = 0;
         }
-        ccw_dstream_write_buf(&sch->cds, sense_id, len);
-        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
-        ret = 0;
+        ret = ccw_dstream_write_buf(&sch->cds, sense_id, len);
+        if (!ret) {
+            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
+        }
         break;
     }
     case CCW_CMD_TIC:
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 314ed7b24566..8195f3546e43 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -288,14 +288,20 @@ static int virtio_ccw_handle_set_vq(SubchDev *sch, CCW1 ccw, bool check_len,
         return -EFAULT;
     }
     if (is_legacy) {
-        ccw_dstream_read(&sch->cds, linfo);
+        ret = ccw_dstream_read(&sch->cds, linfo);
+        if (ret) {
+            return ret;
+        }
         linfo.queue = be64_to_cpu(linfo.queue);
         linfo.align = be32_to_cpu(linfo.align);
         linfo.index = be16_to_cpu(linfo.index);
         linfo.num = be16_to_cpu(linfo.num);
         ret = virtio_ccw_set_vqs(sch, NULL, &linfo);
     } else {
-        ccw_dstream_read(&sch->cds, info);
+        ret = ccw_dstream_read(&sch->cds, info);
+        if (ret) {
+            return ret;
+        }
         info.desc = be64_to_cpu(info.desc);
         info.index = be16_to_cpu(info.index);
         info.num = be16_to_cpu(info.num);
@@ -371,7 +377,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
 
             ccw_dstream_advance(&sch->cds, sizeof(features.features));
-            ccw_dstream_read(&sch->cds, features.index);
+            ret = ccw_dstream_read(&sch->cds, features.index);
+            if (ret) {
+                break;
+            }
             if (features.index == 0) {
                 if (dev->revision >= 1) {
                     /* Don't offer legacy features for modern devices. */
@@ -392,9 +401,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             }
             ccw_dstream_rewind(&sch->cds);
             features.features = cpu_to_le32(features.features);
-            ccw_dstream_write(&sch->cds, features.features);
-            sch->curr_status.scsw.count = ccw.count - sizeof(features);
-            ret = 0;
+            ret = ccw_dstream_write(&sch->cds, features.features);
+            if (!ret) {
+                sch->curr_status.scsw.count = ccw.count - sizeof(features);
+            }
         }
         break;
     case CCW_CMD_WRITE_FEAT:
@@ -411,7 +421,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            ccw_dstream_read(&sch->cds, features);
+            ret = ccw_dstream_read(&sch->cds, features);
+            if (ret) {
+                break;
+            }
             features.features = le32_to_cpu(features.features);
             if (features.index == 0) {
                 virtio_set_features(vdev,
@@ -454,9 +467,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             ret = -EFAULT;
         } else {
             virtio_bus_get_vdev_config(&dev->bus, vdev->config);
-            ccw_dstream_write_buf(&sch->cds, vdev->config, len);
-            sch->curr_status.scsw.count = ccw.count - len;
-            ret = 0;
+            ret = ccw_dstream_write_buf(&sch->cds, vdev->config, len);
+            if (ret) {
+                sch->curr_status.scsw.count = ccw.count - len;
+            }
         }
         break;
     case CCW_CMD_WRITE_CONF:
@@ -511,7 +525,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            ccw_dstream_read(&sch->cds, status);
+            ret = ccw_dstream_read(&sch->cds, status);
+            if (ret) {
+                break;
+            }
             if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
                 virtio_ccw_stop_ioeventfd(dev);
             }
@@ -554,7 +571,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            ccw_dstream_read(&sch->cds, indicators);
+            ret = ccw_dstream_read(&sch->cds, indicators);
+            if (ret) {
+                break;
+            }
             indicators = be64_to_cpu(indicators);
             dev->indicators = get_indicator(indicators, sizeof(uint64_t));
             sch->curr_status.scsw.count = ccw.count - sizeof(indicators);
@@ -575,7 +595,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            ccw_dstream_read(&sch->cds, indicators);
+            ret = ccw_dstream_read(&sch->cds, indicators);
+            if (ret) {
+                break;
+            }
             indicators = be64_to_cpu(indicators);
             dev->indicators2 = get_indicator(indicators, sizeof(uint64_t));
             sch->curr_status.scsw.count = ccw.count - sizeof(indicators);
@@ -596,7 +619,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            ccw_dstream_read(&sch->cds, vq_config.index);
+            ret = ccw_dstream_read(&sch->cds, vq_config.index);
+            if (ret) {
+                break;
+            }
             vq_config.index = be16_to_cpu(vq_config.index);
             if (vq_config.index >= VIRTIO_QUEUE_MAX) {
                 ret = -EINVAL;
@@ -605,9 +631,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             vq_config.num_max = virtio_queue_get_num(vdev,
                                                      vq_config.index);
             vq_config.num_max = cpu_to_be16(vq_config.num_max);
-            ccw_dstream_write(&sch->cds, vq_config.num_max);
-            sch->curr_status.scsw.count = ccw.count - sizeof(vq_config);
-            ret = 0;
+            ret = ccw_dstream_write(&sch->cds, vq_config.num_max);
+            if (!ret) {
+                sch->curr_status.scsw.count = ccw.count - sizeof(vq_config);
+            }
         }
         break;
     case CCW_CMD_SET_IND_ADAPTER:
@@ -664,7 +691,10 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             ret = -EFAULT;
             break;
         }
-        ccw_dstream_read_buf(&sch->cds, &revinfo, 4);
+        ret = ccw_dstream_read_buf(&sch->cds, &revinfo, 4);
+        if (ret < 0) {
+            break;
+        }
         revinfo.revision = be16_to_cpu(revinfo.revision);
         revinfo.length = be16_to_cpu(revinfo.length);
         if (ccw.count < len + revinfo.length ||
-- 
2.26.3


