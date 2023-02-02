Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D3687586
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:49:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPT-0008GR-CU; Thu, 02 Feb 2023 00:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPQ-0008E7-El
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:20 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPO-0007D4-3b
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:19 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i0ho006579; Thu, 2 Feb 2023 05:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=gtARWBiR2+X07fX6RUv+cUrN8v2gIHvt6wNYGu89IbQ=;
 b=f+z6lJ+2XkRi/J1OEA8xLKDGsGkbt0kMIccD9PB+RHrJDZHlDQ8Z83WSACqLkNMmPRTS
 JJCKDkhQxbg/eL7n0S6nQwAArlV7axCQ0fJkJXU7hDnlKIs+Nn+57U3c5eqg3BVwDb9q
 bnMYIPfWJWkZbpR0sNGgfGreDs8tZBN6xXDs65H5Du1PYfIgC/Ljm4/E7r/WseNbLDWy
 mqScZjm3xUjQWE5cBA+pZjXyk04gPiJfyCainny2VVzUfSJyKRx2wDeGyST+VjiaD9HT
 uif8PDsW0sZt5OO5nni8jUEdFb7EViAUqiVYU/op2TLrDyRDfTLPbnZZD3k5imJoHF+m Lg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkfe2efv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Pq1013015; Thu, 2 Feb 2023 05:45:16 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-24
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 23/23] vfio-user: add coalesced posted writes
Date: Wed,  1 Feb 2023 21:55:59 -0800
Message-Id: <5f30b3eb2ee44c772c0d89cce42a3f0f3a57a3c2.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: Gh_f8j2sYr4AdfPD6ilDD0CR_DTzYPZj
X-Proofpoint-ORIG-GUID: Gh_f8j2sYr4AdfPD6ilDD0CR_DTzYPZj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add new message to send multiple writes to server.
Prevents the outgoing queue from overflowing when
a long latency operation is followed by a series
of posted writes.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  21 ++++++++
 hw/vfio/user.h          |   7 +++
 hw/vfio/user.c          | 130 +++++++++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events    |   1 +
 4 files changed, 157 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 1a40cca..d09c29e 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -40,6 +40,7 @@ enum vfio_user_command {
     VFIO_USER_DMA_WRITE                 = 12,
     VFIO_USER_DEVICE_RESET              = 13,
     VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_REGION_WRITE_MULTI        = 15,
     VFIO_USER_MAX,
 };
 
@@ -73,6 +74,7 @@ typedef struct {
 #define VFIO_USER_CAP_PGSIZES   "pgsizes"
 #define VFIO_USER_CAP_MAP_MAX   "max_dma_maps"
 #define VFIO_USER_CAP_MIGR      "migration"
+#define VFIO_USER_CAP_MULTI     "write_multiple"
 
 /* "migration" members */
 #define VFIO_USER_CAP_PGSIZE            "pgsize"
@@ -219,4 +221,23 @@ typedef struct {
     char data[];
 } VFIOUserBitmap;
 
+/*
+ * VFIO_USER_REGION_WRITE_MULTI
+ */
+#define VFIO_USER_MULTI_DATA  8
+#define VFIO_USER_MULTI_MAX   200
+
+typedef struct {
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[VFIO_USER_MULTI_DATA];
+} VFIOUserWROne;
+
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t wr_cnt;
+    VFIOUserWROne wrs[VFIO_USER_MULTI_MAX];
+} VFIOUserWRMulti;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 52b3f89..a5cf969 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -79,6 +79,8 @@ typedef struct VFIOUserProxy {
     VFIOUserMsg *last_nowait;
     VFIOUserMsg *part_recv;
     size_t recv_left;
+    VFIOUserWRMulti *wr_multi;
+    int num_outgoing;
     enum proxy_state state;
 } VFIOUserProxy;
 
@@ -87,6 +89,11 @@ typedef struct VFIOUserProxy {
 #define VFIO_PROXY_NO_MMAP       0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
+#define VFIO_PROXY_USE_MULTI     0x10
+
+/* coalescing high and low water marks for VFIOProxy num_outgoing */
+#define VFIO_USER_OUT_HIGH       1024
+#define VFIO_USER_OUT_LOW        128
 
 VFIOUserProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOUserProxy *proxy);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index af5471b..bcdfccf 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -70,6 +70,7 @@ static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
 static void vfio_user_wait_reqs(VFIOUserProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
+static void vfio_user_flush_multi(VFIOUserProxy *proxy);
 
 static int vfio_user_get_info(VFIOUserProxy *proxy,
                               struct vfio_device_info *info);
@@ -476,6 +477,11 @@ static void vfio_user_send(void *opaque)
         }
         qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
                                        vfio_user_recv, NULL, proxy);
+
+        /* queue empty - send any pending multi write msgs */
+        if (proxy->wr_multi != NULL) {
+            vfio_user_flush_multi(proxy);
+        }
     }
 }
 
@@ -496,6 +502,7 @@ static int vfio_user_send_one(VFIOUserProxy *proxy)
     }
 
     QTAILQ_REMOVE(&proxy->outgoing, msg, next);
+    proxy->num_outgoing--;
     if (msg->type == VFIO_MSG_ASYNC) {
         vfio_user_recycle(proxy, msg);
     } else {
@@ -603,11 +610,18 @@ static int vfio_user_send_queued(VFIOUserProxy *proxy, VFIOUserMsg *msg)
 {
     int ret;
 
+    /* older coalesced writes go first */
+    if (proxy->wr_multi != NULL &&
+        ((msg->hdr->flags & VFIO_USER_TYPE) == VFIO_USER_REQUEST)) {
+        vfio_user_flush_multi(proxy);
+    }
+
     /*
      * Unsent outgoing msgs - add to tail
      */
     if (!QTAILQ_EMPTY(&proxy->outgoing)) {
         QTAILQ_INSERT_TAIL(&proxy->outgoing, msg, next);
+        proxy->num_outgoing++;
         return 0;
     }
 
@@ -621,6 +635,7 @@ static int vfio_user_send_queued(VFIOUserProxy *proxy, VFIOUserMsg *msg)
     }
     if (ret == QIO_CHANNEL_ERR_BLOCK) {
         QTAILQ_INSERT_HEAD(&proxy->outgoing, msg, next);
+        proxy->num_outgoing = 1;
         qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
                                        vfio_user_recv, vfio_user_send,
                                        proxy);
@@ -1326,12 +1341,27 @@ static int check_migr(VFIOUserProxy *proxy, QObject *qobj, Error **errp)
     return caps_parse(proxy, qdict, caps_migr, errp);
 }
 
+static int check_multi(VFIOUserProxy *proxy, QObject *qobj, Error **errp)
+{
+    QBool *qb = qobject_to(QBool, qobj);
+
+    if (qb == NULL) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MULTI);
+        return -1;
+    }
+    if (qbool_get_bool(qb)) {
+        proxy->flags |= VFIO_PROXY_USE_MULTI;
+    }
+    return 0;
+}
+
 static struct cap_entry caps_cap[] = {
     { VFIO_USER_CAP_MAX_FDS, check_max_fds },
     { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
     { VFIO_USER_CAP_PGSIZES, check_pgsizes },
     { VFIO_USER_CAP_MAP_MAX, check_max_dma },
     { VFIO_USER_CAP_MIGR, check_migr },
+    { VFIO_USER_CAP_MULTI, check_multi },
     { NULL }
 };
 
@@ -1390,6 +1420,7 @@ static GString *caps_json(void)
     qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
     qdict_put_int(capdict, VFIO_USER_CAP_PGSIZES, VFIO_USER_DEF_PGSIZE);
     qdict_put_int(capdict, VFIO_USER_CAP_MAP_MAX, VFIO_USER_DEF_MAP_MAX);
+    qdict_put_bool(capdict, VFIO_USER_CAP_MULTI, true);
 
     qdict_put_obj(dict, VFIO_USER_CAP, QOBJECT(capdict));
 
@@ -1744,19 +1775,114 @@ static int vfio_user_region_read(VFIOUserProxy *proxy, uint8_t index,
     return msgp->count;
 }
 
+static void vfio_user_flush_multi(VFIOUserProxy *proxy)
+{
+    VFIOUserMsg *msg;
+    VFIOUserWRMulti *wm = proxy->wr_multi;
+    int ret;
+
+    proxy->wr_multi = NULL;
+
+    /* adjust size for actual # of writes */
+    wm->hdr.size -= (VFIO_USER_MULTI_MAX - wm->wr_cnt) * sizeof(VFIOUserWROne);
+
+    msg = vfio_user_getmsg(proxy, &wm->hdr, NULL);
+    msg->id = wm->hdr.id;
+    msg->rsize = 0;
+    msg->type = VFIO_MSG_ASYNC;
+    trace_vfio_user_wrmulti("flush", wm->wr_cnt);
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+    }
+}
+
+static void vfio_user_create_multi(VFIOUserProxy *proxy)
+{
+    VFIOUserWRMulti *wm;
+
+    wm = g_malloc0(sizeof(*wm));
+    vfio_user_request_msg(&wm->hdr, VFIO_USER_REGION_WRITE_MULTI,
+                          sizeof(*wm), VFIO_USER_NO_REPLY);
+    proxy->wr_multi = wm;
+}
+
+static void vfio_user_add_multi(VFIOUserProxy *proxy, uint8_t index,
+                                off_t offset, uint32_t count, void *data)
+{
+    VFIOUserWRMulti *wm = proxy->wr_multi;
+    VFIOUserWROne *w1 = &wm->wrs[wm->wr_cnt];
+
+    w1->offset = offset;
+    w1->region = index;
+    w1->count = count;
+    memcpy(&w1->data, data, count);
+
+    wm->wr_cnt++;
+    trace_vfio_user_wrmulti("add", wm->wr_cnt);
+    if (wm->wr_cnt == VFIO_USER_MULTI_MAX ||
+        proxy->num_outgoing < VFIO_USER_OUT_LOW) {
+        vfio_user_flush_multi(proxy);
+    }
+}
+
 static int vfio_user_region_write(VFIOUserProxy *proxy, uint8_t index,
                                   off_t offset, uint32_t count, void *data,
                                   bool post)
 {
     VFIOUserRegionRW *msgp = NULL;
-    int flags = post ? VFIO_USER_NO_REPLY : 0;
+    int flags;
     int size = sizeof(*msgp) + count;
+    bool can_multi;
     int ret;
 
     if (count > proxy->max_xfer_size) {
         return -EINVAL;
     }
 
+    if (proxy->flags & VFIO_PROXY_NO_POST) {
+        post = false;
+    }
+
+    /* write eligible to be in a WRITE_MULTI msg ? */
+    can_multi = (proxy->flags & VFIO_PROXY_USE_MULTI) && post &&
+        count <= VFIO_USER_MULTI_DATA;
+
+    /*
+     * This should be a rare case, so first check without the lock,
+     * if we're wrong, vfio_send_queued() will flush any posted writes
+     * we missed here
+     */
+    if (proxy->wr_multi != NULL ||
+        (proxy->num_outgoing > VFIO_USER_OUT_HIGH && can_multi)) {
+
+        /*
+         * re-check with lock
+         *
+         * if already building a WRITE_MULTI msg,
+         *  add this one if possible else flush pending before
+         *  sending the current one
+         *
+         * else if outgoing queue is over the highwater,
+         *  start a new WRITE_MULTI message
+         */
+        WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+            if (proxy->wr_multi != NULL) {
+                if (can_multi) {
+                    vfio_user_add_multi(proxy, index, offset, count, data);
+                    return count;
+                }
+                vfio_user_flush_multi(proxy);
+            } else if (proxy->num_outgoing > VFIO_USER_OUT_HIGH && can_multi) {
+                vfio_user_create_multi(proxy);
+                vfio_user_add_multi(proxy, index, offset, count, data);
+                return count;
+            }
+        }
+    }
+
+    flags = post ? VFIO_USER_NO_REPLY : 0;
     msgp = g_malloc0(size);
     vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size, flags);
     msgp->offset = offset;
@@ -1766,7 +1892,7 @@ static int vfio_user_region_write(VFIOUserProxy *proxy, uint8_t index,
     trace_vfio_user_region_rw(msgp->region, msgp->offset, msgp->count);
 
     /* async send will free msg after it's sent */
-    if (post && !(proxy->flags & VFIO_PROXY_NO_POST)) {
+    if (post) {
         vfio_user_send_async(proxy, &msgp->hdr, NULL);
         return count;
     }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index a4e02ff..e1e9681 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -180,3 +180,4 @@ vfio_user_get_irq_info(uint32_t index, uint32_t flags, uint32_t count) " index %
 vfio_user_set_irqs(uint32_t index, uint32_t start, uint32_t count, uint32_t flags) " index %d start %d count %d flags 0x%x"
 vfio_user_dma_map(uint64_t iova, uint64_t size, uint64_t off, uint32_t flags, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" off 0x%"PRIx64" flags 0x%x will_commit %d"
 vfio_user_dma_unmap(uint64_t iova, uint64_t size, uint32_t flags, bool dirty, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" flags 0x%x dirty %d will_commit %d"
+vfio_user_wrmulti(const char *s, uint64_t wr_cnt) " %s count 0x%"PRIx64
-- 
1.9.4


