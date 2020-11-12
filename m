Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32B2B13EF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:39:44 +0100 (CET)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdO3z-0003JY-9J
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsS-0003bs-Ap
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:40 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsQ-0006ya-35
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACN9s53118597;
 Thu, 12 Nov 2020 23:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=R2JseW7jyZDCbc3BuxyomgGcBpBu+lEPPC0jla1UTkI=;
 b=LMQVjcvmPD5iB/XUVhjt9pzrbt39iPdgDbrxzzzIVYbm3rbNUqc9hjjzN67+SEUNOOaV
 xyJKJ8mtJUt2m+rAvgLS2zymTINJY4d7GS4vifA+TWsuGea4oFZLItVUPFK5NTNNpZDy
 VvWa2ZdnN1M2H+rCtZgIEuUzhRWqCyvJ6qjXf9yvUe2XG5AzRB6wz5WtNKhhqzrz0hcp
 HjRdcmWPirXJWLP1AyZvSTuGEOUp33mfuxdUO+wHyeRIE4U0sJT3Rlmy0Z9Mm0aR+IiN
 5ANar4YMAdnx5pB5evHvOnwFdEfTEvmR8ByibuVDrvZMRXSCx9SVoDNcBtw4yTlTpZpd Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34nkhm83vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 23:19:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAH5Y076027;
 Thu, 12 Nov 2020 23:19:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34rtksk53b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 23:19:32 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ACNJVHF011617;
 Thu, 12 Nov 2020 23:19:31 GMT
Received: from ol2.localdomain (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 15:19:31 -0800
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, qemu-devel@nongnu.org, fam@euphon.net,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 10/10] vhost-scsi: create a woker per IO vq
Date: Thu, 12 Nov 2020 17:19:10 -0600
Message-Id: <1605223150-10888-12-git-send-email-michael.christie@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=michael.christie@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 15:44:20
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Nov 2020 20:29:33 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has vhost-scsi create a worker thread per IO vq.
It also adds a modparam to enable the feature, because I was thinking
existing setups might not be expecting the extra threading use, so the
default is to use the old single thread multiple vq behavior.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 612359d..3fb147f 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -62,6 +62,12 @@
  */
 #define VHOST_SCSI_WEIGHT 256
 
+static bool vhost_scsi_worker_per_io_vq;
+module_param_named(thread_per_io_virtqueue, vhost_scsi_worker_per_io_vq, bool,
+		   0644);
+MODULE_PARM_DESC(thread_per_io_virtqueue,
+		 "Create a worker thread per IO virtqueue. Set to true to turn on. Default is false where all virtqueues share a thread.");
+
 struct vhost_scsi_inflight {
 	/* Wait for the flush operation to finish */
 	struct completion comp;
@@ -1805,6 +1811,36 @@ static int vhost_scsi_set_features(struct vhost_scsi *vs, u64 features)
 	return 0;
 }
 
+static int vhost_scsi_enable_vring(struct vhost_virtqueue *vq, bool enable)
+{
+	struct vhost_scsi *vs = container_of(vq->dev, struct vhost_scsi, dev);
+	/*
+	 * For compat, we have the evt, ctl and first IO vq share worker0 like
+	 * is setup by default. Additional vqs get their own worker.
+	 */
+	if (vq == &vs->vqs[VHOST_SCSI_VQ_CTL].vq ||
+	    vq == &vs->vqs[VHOST_SCSI_VQ_EVT].vq ||
+	    vq == &vs->vqs[VHOST_SCSI_VQ_IO].vq)
+		return 0;
+
+	if (enable) {
+		if (!vhost_scsi_worker_per_io_vq)
+			return 0;
+		if (vq->worker_id != 0)
+			return 0;
+		return vhost_vq_worker_add(vq->dev, vq);
+	} else {
+		if (vq->worker_id == 0)
+			return 0;
+		vhost_vq_worker_remove(vq->dev, vq);
+		return 0;
+	}
+}
+
+static struct vhost_dev_ops vhost_scsi_dev_ops = {
+	.enable_vring = vhost_scsi_enable_vring,
+};
+
 static int vhost_scsi_open(struct inode *inode, struct file *f)
 {
 	struct vhost_scsi_virtqueue *svq;
@@ -1843,7 +1879,7 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
 		svq->vq.handle_kick = vhost_scsi_handle_kick;
 	}
 	vhost_dev_init(&vs->dev, vqs, VHOST_SCSI_MAX_VQ, UIO_MAXIOV,
-		       VHOST_SCSI_WEIGHT, 0, true, NULL);
+		       VHOST_SCSI_WEIGHT, 0, true, &vhost_scsi_dev_ops);
 
 	vhost_scsi_init_inflight(vs, NULL);
 
-- 
1.8.3.1


