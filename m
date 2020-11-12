Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251502B13DA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:33:24 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNxr-0005uQ-6S
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsR-0003bQ-ML
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:39 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsN-0006y7-VW
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:39 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAs3h119284;
 Thu, 12 Nov 2020 23:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=aPfcN7KuEaC6QPosjKJKTrzN39N6uYT6NYusx0B9wME=;
 b=lwslecXonjC/dE8BDvWM8JVSJUPGabyjLP0AAIBWG0NGdmw4Oq7SbBVlCAyH1FdQpnzg
 8eqE5azlhsOxBJzO6isQuIfnj2Qpx1ZLDV5C58xqK4/tlEt9FBPvKRjCD0QpyoRNYI7B
 5HVtKdWWvrh+tmM/DvYCEUbUBG+01jVtpHKNiIoToEJ9M/PZMZCcl/3vwIQ5IBYVHOVv
 WfqppRjcAl2hg1c2EXKJFWnlZ/J3aggsFdZbqiaV7e30iPmG4EPvgJmB/Sp0TfKv4q1D
 /VGdNQFRuQonXMK2I6x4yuM687B20O1Y2qShKKsYI/UOggCWym+g4lGFYbXVWOaWcmQs Ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34nkhm83vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 23:19:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNBKnT177101;
 Thu, 12 Nov 2020 23:19:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 34p55s26fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 23:19:30 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ACNJTso020407;
 Thu, 12 Nov 2020 23:19:29 GMT
Received: from ol2.localdomain (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 15:19:29 -0800
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, qemu-devel@nongnu.org, fam@euphon.net,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 08/10] vhost: move msg_handler to new ops struct
Date: Thu, 12 Nov 2020 17:19:08 -0600
Message-Id: <1605223150-10888-10-git-send-email-michael.christie@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
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
X-Mailman-Approved-At: Thu, 12 Nov 2020 20:29:32 -0500
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

The next patch adds a callout so drivers can perform some action when we
get a VHOST_SET_VRING_ENABLE, so this patch moves the msg_handler callout
to a new vhost_dev_ops struct just to keep all the callouts better
organized.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/vdpa.c  |  7 +++++--
 drivers/vhost/vhost.c | 10 ++++------
 drivers/vhost/vhost.h | 11 ++++++-----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 2754f30..f271f42 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -802,6 +802,10 @@ static void vhost_vdpa_set_iova_range(struct vhost_vdpa *v)
 	}
 }
 
+static struct vhost_dev_ops vdpa_dev_ops = {
+	.msg_handler	= vhost_vdpa_process_iotlb_msg,
+};
+
 static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 {
 	struct vhost_vdpa *v;
@@ -829,8 +833,7 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 		vqs[i] = &v->vqs[i];
 		vqs[i]->handle_kick = handle_vq_kick;
 	}
-	vhost_dev_init(dev, vqs, nvqs, 0, 0, 0, false,
-		       vhost_vdpa_process_iotlb_msg);
+	vhost_dev_init(dev, vqs, nvqs, 0, 0, 0, false, &vdpa_dev_ops);
 
 	dev->iotlb = vhost_iotlb_alloc(0, 0);
 	if (!dev->iotlb) {
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 6a6abfc..2f98b81 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -504,9 +504,7 @@ static size_t vhost_get_desc_size(struct vhost_virtqueue *vq,
 void vhost_dev_init(struct vhost_dev *dev,
 		    struct vhost_virtqueue **vqs, int nvqs,
 		    int iov_limit, int weight, int byte_weight,
-		    bool use_worker,
-		    int (*msg_handler)(struct vhost_dev *dev,
-				       struct vhost_iotlb_msg *msg))
+		    bool use_worker, struct vhost_dev_ops *ops)
 {
 	struct vhost_virtqueue *vq;
 	int i;
@@ -524,7 +522,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 	dev->weight = weight;
 	dev->byte_weight = byte_weight;
 	dev->use_worker = use_worker;
-	dev->msg_handler = msg_handler;
+	dev->ops = ops;
 	init_waitqueue_head(&dev->wait);
 	INIT_LIST_HEAD(&dev->read_list);
 	INIT_LIST_HEAD(&dev->pending_list);
@@ -1328,8 +1326,8 @@ ssize_t vhost_chr_write_iter(struct vhost_dev *dev,
 		goto done;
 	}
 
-	if (dev->msg_handler)
-		ret = dev->msg_handler(dev, &msg);
+	if (dev->ops && dev->ops->msg_handler)
+		ret = dev->ops->msg_handler(dev, &msg);
 	else
 		ret = vhost_process_iotlb_msg(dev, &msg);
 	if (ret) {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 0837133..a293f48 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -156,6 +156,10 @@ struct vhost_msg_node {
   struct list_head node;
 };
 
+struct vhost_dev_ops {
+	int (*msg_handler)(struct vhost_dev *dev, struct vhost_iotlb_msg *msg);
+};
+
 struct vhost_dev {
 	struct mm_struct *mm;
 	struct mutex mutex;
@@ -175,16 +179,13 @@ struct vhost_dev {
 	int byte_weight;
 	u64 kcov_handle;
 	bool use_worker;
-	int (*msg_handler)(struct vhost_dev *dev,
-			   struct vhost_iotlb_msg *msg);
+	struct vhost_dev_ops *ops;
 };
 
 bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
 void vhost_dev_init(struct vhost_dev *, struct vhost_virtqueue **vqs,
 		    int nvqs, int iov_limit, int weight, int byte_weight,
-		    bool use_worker,
-		    int (*msg_handler)(struct vhost_dev *dev,
-				       struct vhost_iotlb_msg *msg));
+		    bool use_worker, struct vhost_dev_ops *ops);
 long vhost_dev_set_owner(struct vhost_dev *dev);
 bool vhost_dev_has_owner(struct vhost_dev *dev);
 long vhost_dev_check_owner(struct vhost_dev *);
-- 
1.8.3.1


