Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA2143097
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:51 +0100 (CET)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itaYf-0006zI-SD
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 12:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1itaVv-0005L1-V9
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:07:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1itaVr-0001Ra-Lz
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:06:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1itaVr-0001R0-DU
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:06:55 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00KH6lnn133159
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 12:06:54 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xkyea7g78-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 12:06:53 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Mon, 20 Jan 2020 17:06:51 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 17:06:48 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00KH6mS953411922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 17:06:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC0842045;
 Mon, 20 Jan 2020 17:06:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6AAD42041;
 Mon, 20 Jan 2020 17:06:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jan 2020 17:06:47 +0000 (GMT)
Received: from bahia.ibmuc.com (sig-9-145-1-176.uk.ibm.com [9.145.1.176])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1BB7A220170;
 Mon, 20 Jan 2020 18:06:47 +0100 (CET)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/5] 9p: init_in_iov_from_pdu can truncate the size
Date: Mon, 20 Jan 2020 18:06:38 +0100
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200120170640.524184-1-groug@kaod.org>
References: <20200120170640.524184-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012017-0016-0000-0000-000002DF226F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012017-0017-0000-0000-00003341C733
Message-Id: <20200120170640.524184-4-groug@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-20_07:2020-01-20,
 2020-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=8 bulkscore=0 clxscore=1034
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001200144
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: anthony.perard@citrix.com, roman@zededa.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, qemu_oss@crudebyte.com,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

init_in_iov_from_pdu might not be able to allocate the full buffer size
requested, which comes from the client and could be larger than the
transport has available at the time of the request. Specifically, this
can happen with read operations, with the client requesting a read up to
the max allowed, which might be more than the transport has available at
the time.

Today the implementation of init_in_iov_from_pdu throws an error, both
Xen and Virtio.

Instead, change the V9fsTransport interface so that the size becomes a
pointer and can be limited by the implementation of
init_in_iov_from_pdu.

Change both the Xen and Virtio implementations to set the size to the
size of the buffer they managed to allocate, instead of throwing an
error. However, if the allocated buffer size is less than P9_IOHDRSZ
(the size of the header) still throw an error as the case is unhandable.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: groug@kaod.org
CC: anthony.perard@citrix.com
CC: roman@zededa.com
CC: qemu_oss@crudebyte.com
[groug: fix 32-bit build]
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c               | 33 ++++++++++++++++++++++-----------
 hw/9pfs/9p.h               |  2 +-
 hw/9pfs/virtio-9p-device.c | 11 +++++++----
 hw/9pfs/xen-9p-backend.c   | 13 ++++++++-----
 4 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 520177f40c17..8b247b904ec7 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2090,22 +2090,29 @@ out_nofid:
  * with qemu_iovec_destroy().
  */
 static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
-                                    size_t skip, size_t size,
+                                    size_t skip, size_t *size,
                                     bool is_write)
 {
     QEMUIOVector elem;
     struct iovec *iov;
     unsigned int niov;
+    size_t alloc_size = *size + skip;
 
     if (is_write) {
-        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov, &niov, size + skip);
+        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov, &niov, alloc_size);
     } else {
-        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov, size + skip);
+        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov, &alloc_size);
+    }
+
+    if (alloc_size < skip) {
+        *size = 0;
+    } else {
+        *size = alloc_size - skip;
     }
 
     qemu_iovec_init_external(&elem, iov, niov);
     qemu_iovec_init(qiov, niov);
-    qemu_iovec_concat(qiov, &elem, skip, size);
+    qemu_iovec_concat(qiov, &elem, skip, *size);
 }
 
 static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
@@ -2113,15 +2120,14 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
 {
     ssize_t err;
     size_t offset = 7;
-    uint64_t read_count;
+    size_t read_count;
     QEMUIOVector qiov_full;
 
     if (fidp->fs.xattr.len < off) {
         read_count = 0;
-    } else {
+    } else if (fidp->fs.xattr.len - off < max_count) {
         read_count = fidp->fs.xattr.len - off;
-    }
-    if (read_count > max_count) {
+    } else {
         read_count = max_count;
     }
     err = pdu_marshal(pdu, offset, "d", read_count);
@@ -2130,7 +2136,7 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
     }
     offset += err;
 
-    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, read_count, false);
+    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &read_count, false);
     err = v9fs_pack(qiov_full.iov, qiov_full.niov, 0,
                     ((char *)fidp->fs.xattr.value) + off,
                     read_count);
@@ -2259,9 +2265,11 @@ static void coroutine_fn v9fs_read(void *opaque)
         QEMUIOVector qiov_full;
         QEMUIOVector qiov;
         int32_t len;
+        size_t size = max_count;
 
-        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, max_count, false);
+        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, &size, false);
         qemu_iovec_init(&qiov, qiov_full.niov);
+        max_count = size;
         do {
             qemu_iovec_reset(&qiov);
             qemu_iovec_concat(&qiov, &qiov_full, count, qiov_full.size - count);
@@ -2504,6 +2512,7 @@ static void coroutine_fn v9fs_write(void *opaque)
     int32_t len = 0;
     int32_t total = 0;
     size_t offset = 7;
+    size_t size;
     V9fsFidState *fidp;
     V9fsPDU *pdu = opaque;
     V9fsState *s = pdu->s;
@@ -2516,7 +2525,9 @@ static void coroutine_fn v9fs_write(void *opaque)
         return;
     }
     offset += err;
-    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, count, true);
+    size = count;
+    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &size, true);
+    count = size;
     trace_v9fs_write(pdu->tag, pdu->id, fid, off, count, qiov_full.niov);
 
     fidp = get_fid(pdu, fid);
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 3904f8290131..8d07a0b301e2 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -425,7 +425,7 @@ struct V9fsTransport {
     ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
                                   va_list ap);
     void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
-                                        unsigned int *pniov, size_t size);
+                                        unsigned int *pniov, size_t *size);
     void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
                                          unsigned int *pniov, size_t size);
     void        (*push_and_notify)(V9fsPDU *pdu);
diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index b5a7c03f26d5..991e175c826f 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -147,19 +147,22 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t offset,
 }
 
 static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
-                                        unsigned int *pniov, size_t size)
+                                        unsigned int *pniov, size_t *size)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
     VirtQueueElement *elem = v->elems[pdu->idx];
     size_t buf_size = iov_size(elem->in_sg, elem->in_num);
 
-    if (buf_size < size) {
+    if (buf_size < P9_IOHDRSZ) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
 
         virtio_error(vdev,
-                     "VirtFS reply type %d needs %zu bytes, buffer has %zu",
-                     pdu->id + 1, size, buf_size);
+                     "VirtFS reply type %d needs %zu bytes, buffer has %zu, less than minimum",
+                     pdu->id + 1, *size, buf_size);
+    }
+    if (buf_size < *size) {
+        *size = buf_size;
     }
 
     *piov = elem->in_sg;
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 71eebe12dd41..18fe5b7c92fa 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -187,7 +187,7 @@ static void xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
 static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
                                           struct iovec **piov,
                                           unsigned int *pniov,
-                                          size_t size)
+                                          size_t *size)
 {
     Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
     Xen9pfsRing *ring = &xen_9pfs->rings[pdu->tag % xen_9pfs->num_rings];
@@ -197,16 +197,19 @@ static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
     g_free(ring->sg);
 
     ring->sg = g_new0(struct iovec, 2);
-    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, size);
+    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, *size);
 
     buf_size = iov_size(ring->sg, num);
-    if (buf_size  < size) {
+    if (buf_size  < P9_IOHDRSZ) {
         xen_pv_printf(&xen_9pfs->xendev, 0, "Xen 9pfs request type %d"
-                "needs %zu bytes, buffer has %zu\n", pdu->id, size,
-                buf_size);
+                "needs %zu bytes, buffer has %zu, less than minimum\n",
+                pdu->id, *size, buf_size);
         xen_be_set_state(&xen_9pfs->xendev, XenbusStateClosing);
         xen_9pfs_disconnect(&xen_9pfs->xendev);
     }
+    if (buf_size  < *size) {
+        *size = buf_size;
+    }
 
     *piov = ring->sg;
     *pniov = num;
-- 
2.21.1


