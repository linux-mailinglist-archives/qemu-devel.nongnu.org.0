Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3242B13E5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:36:12 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdO0Z-0000ZU-IY
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsR-0003bE-EF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:39 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsN-0006xh-Ku
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:39 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACN9wq9118615;
 Thu, 12 Nov 2020 23:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=gZyyk7ggNXfCzNmiUuDWYeooyouXg0wGLOis3wWvvGU=;
 b=n4BwUT6KIivc3v7qHpaGRosoFqh0Io33JoRHBK5x/kyNSofyI+UzbJDgUfwFkiOLvd5w
 aNDBxIP4KIl5y2H0dSUi2NKXDlBSyxgiVgDyVjNkqOUWqgLMFJCLFepRHHu5XxTpqajm
 dximJ8n+K3Gzm6slvtODkJli7N7Fz+XQo9VOd3Lbg0Z4zIQ/Uiz7R7UgTARAXEz01vAm
 ZgSffjibAEeAv0MW8VcV8u7yll0aaXT3NGjC2y3gswlvR9G8NkRP7TtawAiwyFnGmuOC
 Gbr/l+GpiRJbads173+7jjpaLx7U51LGF8KIDe/k/KZ0q5HAVH73VFXh6GXn9pRvBk8t Nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34nkhm83vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 23:19:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAH2l075845;
 Thu, 12 Nov 2020 23:19:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34rtksk518-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 23:19:28 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ACNJRtr011506;
 Thu, 12 Nov 2020 23:19:27 GMT
Received: from ol2.localdomain (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 15:19:26 -0800
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, qemu-devel@nongnu.org, fam@euphon.net,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 05/10] vhost: poll support support multiple workers
Date: Thu, 12 Nov 2020 17:19:05 -0600
Message-Id: <1605223150-10888-7-git-send-email-michael.christie@oracle.com>
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

The final patches are going to have vhost scsi create a vhost worker
per IO vq. This patch converts the poll code to poll and queue work on
the worker that is tied to the vq (in this patch we maintain the old
behavior where all vqs use a single worker).

For drivers that do not convert over to the multiple worker support
or for the case where the user just does not want to allocate the
resources then we maintain support for the single worker case.

Note: This adds a new function vhost_vq_work_queue. It's used by
this patch and also the next one, so I exported it here.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/net.c   |  6 ++++--
 drivers/vhost/vhost.c | 14 +++++++++++---
 drivers/vhost/vhost.h |  6 ++++--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 531a00d..6a27fe6 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1330,8 +1330,10 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT, true,
 		       NULL);
 
-	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
-	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev);
+	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev,
+			vqs[VHOST_NET_VQ_TX]);
+	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev,
+			vqs[VHOST_NET_VQ_RX]);
 
 	f->private_data = n;
 	n->page_frag.page = NULL;
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d229515..9eeb8c7 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -187,13 +187,15 @@ void vhost_work_init(struct vhost_work *work, vhost_work_fn_t fn)
 
 /* Init poll structure */
 void vhost_poll_init(struct vhost_poll *poll, vhost_work_fn_t fn,
-		     __poll_t mask, struct vhost_dev *dev)
+		     __poll_t mask, struct vhost_dev *dev,
+		     struct vhost_virtqueue *vq)
 {
 	init_waitqueue_func_entry(&poll->wait, vhost_poll_wakeup);
 	init_poll_funcptr(&poll->table, vhost_poll_func);
 	poll->mask = mask;
 	poll->dev = dev;
 	poll->wqh = NULL;
+	poll->vq = vq;
 
 	vhost_work_init(&poll->work, fn);
 }
@@ -284,6 +286,12 @@ void vhost_poll_flush(struct vhost_poll *poll)
 }
 EXPORT_SYMBOL_GPL(vhost_poll_flush);
 
+void vhost_vq_work_queue(struct vhost_virtqueue *vq, struct vhost_work *work)
+{
+	vhost_work_queue_on(vq->dev, work, vq->worker_id);
+}
+EXPORT_SYMBOL_GPL(vhost_vq_work_queue);
+
 /* A lockless hint for busy polling code to exit the loop */
 bool vhost_has_work(struct vhost_dev *dev)
 {
@@ -301,7 +309,7 @@ bool vhost_has_work(struct vhost_dev *dev)
 
 void vhost_poll_queue(struct vhost_poll *poll)
 {
-	vhost_work_queue(poll->dev, &poll->work);
+	vhost_vq_work_queue(poll->vq, &poll->work);
 }
 EXPORT_SYMBOL_GPL(vhost_poll_queue);
 
@@ -528,7 +536,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 		vhost_vq_reset(dev, vq);
 		if (vq->handle_kick)
 			vhost_poll_init(&vq->poll, vq->handle_kick,
-					EPOLLIN, dev);
+					EPOLLIN, dev, vq);
 	}
 }
 EXPORT_SYMBOL_GPL(vhost_dev_init);
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index f334e90..232c5f9 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -33,7 +33,6 @@ struct vhost_worker {
 };
 
 /* Poll a file (eventfd or socket) */
-/* Note: there's nothing vhost specific about this structure. */
 struct vhost_poll {
 	poll_table		table;
 	wait_queue_head_t	*wqh;
@@ -41,16 +40,19 @@ struct vhost_poll {
 	struct vhost_work	work;
 	__poll_t		mask;
 	struct vhost_dev	*dev;
+	struct vhost_virtqueue	*vq;
 };
 
 void vhost_work_init(struct vhost_work *work, vhost_work_fn_t fn);
 void vhost_work_queue(struct vhost_dev *dev, struct vhost_work *work);
 bool vhost_has_work(struct vhost_dev *dev);
+void vhost_vq_work_queue(struct vhost_virtqueue *vq, struct vhost_work *work);
 int vhost_vq_worker_add(struct vhost_dev *dev, struct vhost_virtqueue *vq);
 void vhost_vq_worker_remove(struct vhost_dev *dev, struct vhost_virtqueue *vq);
 
 void vhost_poll_init(struct vhost_poll *poll, vhost_work_fn_t fn,
-		     __poll_t mask, struct vhost_dev *dev);
+		     __poll_t mask, struct vhost_dev *dev,
+		     struct vhost_virtqueue *vq);
 int vhost_poll_start(struct vhost_poll *poll, struct file *file);
 void vhost_poll_stop(struct vhost_poll *poll);
 void vhost_poll_flush(struct vhost_poll *poll);
-- 
1.8.3.1


