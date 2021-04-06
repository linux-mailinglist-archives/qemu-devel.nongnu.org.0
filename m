Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FDA354E21
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:47:21 +0200 (CEST)
Received: from localhost ([::1]:58120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgQi-00027i-MV
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lTgNv-0000ug-En; Tue, 06 Apr 2021 03:44:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50422
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lTgNr-0001vS-U0; Tue, 06 Apr 2021 03:44:27 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367YA8x028832; Tue, 6 Apr 2021 03:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=4+xKaNw4LGKYgAhygd99njPrR98k+AKG+TJd8Qug2c0=;
 b=fppBNpuijfLznGUklPtRFkfkWo35dqwH85iPTQQLnQ9KjYnaSMgveV6EDoARm7eMiDjC
 MRoZ0uIZr7YnNUZ5tvHo/g2oWH6M6X1CgqKgwxQitShpPF+d44N3UExKz8dfHA5AYQNy
 DjhKlwdyFNqwle5sySzAfal3HEzMTSnZ7C/O4QD7nrOrJj0M8AKNdjOqrfmHiPyS3Wof
 c3TN7PB/oizzB+jWVoU5Bj8F1CsmK1tNL2+Hc5Hjx1s0BZBQlyZmIyP6v0WESVDRKWHJ
 MeqUGF/+dE0JMnU838RJuLS0tX+/em5iQy0aR58Fs+85ve/28NvunAzef4rnqTuZ2Ech OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5tyk9kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 03:44:20 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1367YPJJ029500;
 Tue, 6 Apr 2021 03:44:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5tyk9k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 03:44:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1367guLZ000958;
 Tue, 6 Apr 2021 07:44:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37q2y9hwvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 07:44:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1367iFYh40108508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 07:44:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9289311C054;
 Tue,  6 Apr 2021 07:44:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C1AA11C04A;
 Tue,  6 Apr 2021 07:44:15 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.42.152])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 07:44:15 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] s390x: css: report errors from ccw_dstream_read/write
Date: Tue,  6 Apr 2021 09:44:13 +0200
Message-Id: <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fjaOzNaykaTBQ9lkmsmh911q9iw7cnv1
X-Proofpoint-GUID: Rnw5J-Vz_6iE-b7uJmTyr0i91DadXveC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104030000
 definitions=main-2104060050
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ccw_dstream_read/write functions returned values are sometime
not taking into account and reported back to the upper level
of interpretation of CCW instructions.

It follows that accessing an invalid address does not trigger
a subchannel status program check to the guest as it should.

Let's test the return values of ccw_dstream_write[_buf] and
ccw_dstream_read[_buf] and report it to the caller.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/char/terminal3270.c | 11 +++++--
 hw/s390x/3270-ccw.c    |  3 ++
 hw/s390x/css.c         | 16 +++++-----
 hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
 4 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index a9a46c8ed3..82e85fac2e 100644
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
index 821319eee6..cc1371f01c 100644
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
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index fe47751df4..99e476f193 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1055,10 +1055,11 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
             }
         }
         len = MIN(ccw.count, sizeof(sch->sense_data));
-        ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
-        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
-        memset(sch->sense_data, 0, sizeof(sch->sense_data));
-        ret = 0;
+        ret = ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
+        if (!ret) {
+            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
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
index 314ed7b245..8195f3546e 100644
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
2.17.1


