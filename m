Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655DCFD8C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 17:26:35 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHrNi-00040d-2y
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 11:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iHrHB-00074p-Ai
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 11:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iHrH8-0000Xe-Uf
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 11:19:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6972
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iHrH6-0000Ss-Tj
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 11:19:46 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x98FDSFA070395
 for <qemu-devel@nongnu.org>; Tue, 8 Oct 2019 11:19:41 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgvk294q2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 11:19:41 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 8 Oct 2019 16:19:39 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 8 Oct 2019 16:19:36 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x98FJaft46334414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2019 15:19:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2816AE04D;
 Tue,  8 Oct 2019 15:19:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C40DBAE045;
 Tue,  8 Oct 2019 15:19:35 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Oct 2019 15:19:35 +0000 (GMT)
Received: from bahia.tls.ibm.com (bahia.tls.ibm.com [9.101.4.41])
 by smtp.tls.ibm.com (Postfix) with ESMTP id 8E45A2201ED;
 Tue,  8 Oct 2019 17:19:35 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] 9p: Treat multiple devices on one export as an error
Date: Tue,  8 Oct 2019 17:19:25 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008151925.1021706-1-groug@kaod.org>
References: <20191008151925.1021706-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100815-0008-0000-0000-000003201E67
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100815-0009-0000-0000-00004A3F2009
Message-Id: <20191008151925.1021706-5-groug@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910080135
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Antonios Motakis <antonios.motakis@huawei.com>

The QID path should uniquely identify a file. However, the
inode of a file is currently used as the QID path, which
on its own only uniquely identifies files within a device.
Here we track the device hosting the 9pfs share, in order
to prevent security issues with QID path collisions from
other devices.

We only print a warning for now but a subsequent patch will
allow users to have finer control over the desired behaviour.
Failing the I/O will be one the proposed behaviour, so we
also change stat_to_qid() to return an error here in order to
keep other patches simpler.

Signed-off-by: Antonios Motakis <antonios.motakis@huawei.com>
[CS: - Assign dev_id to export root's device already in
       v9fs_device_realize_common(), not postponed in
       stat_to_qid().
     - error_report_once() if more than one device was
       shared by export.
     - Return -ENODEV instead of -ENOSYS in stat_to_qid().
     - Fixed typo in log comment. ]
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
[groug, changed to warning, updated message and changelog]
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 70 +++++++++++++++++++++++++++++++++++++++++-----------
 hw/9pfs/9p.h |  1 +
 2 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index ba1ab920f1eb..5a895ae0bbfe 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -573,10 +573,19 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
                                 P9_STAT_MODE_SOCKET)
 
 /* This is the algorithm from ufs in spfs */
-static void stat_to_qid(const struct stat *stbuf, V9fsQID *qidp)
+static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
 {
     size_t size;
 
+    if (pdu->s->dev_id != stbuf->st_dev) {
+        warn_report_once(
+            "9p: Multiple devices detected in same VirtFS export, "
+            "which might lead to file ID collisions and severe "
+            "misbehaviours on guest! You should use a separate "
+            "export for each device shared from host."
+        );
+    }
+
     memset(&qidp->path, 0, sizeof(qidp->path));
     size = MIN(sizeof(stbuf->st_ino), sizeof(qidp->path));
     memcpy(&qidp->path, &stbuf->st_ino, size);
@@ -588,6 +597,8 @@ static void stat_to_qid(const struct stat *stbuf, V9fsQID *qidp)
     if (S_ISLNK(stbuf->st_mode)) {
         qidp->type |= P9_QID_TYPE_SYMLINK;
     }
+
+    return 0;
 }
 
 static int coroutine_fn fid_to_qid(V9fsPDU *pdu, V9fsFidState *fidp,
@@ -600,7 +611,10 @@ static int coroutine_fn fid_to_qid(V9fsPDU *pdu, V9fsFidState *fidp,
     if (err < 0) {
         return err;
     }
-    stat_to_qid(&stbuf, qidp);
+    err = stat_to_qid(pdu, &stbuf, qidp);
+    if (err < 0) {
+        return err;
+    }
     return 0;
 }
 
@@ -831,7 +845,10 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
 
     memset(v9stat, 0, sizeof(*v9stat));
 
-    stat_to_qid(stbuf, &v9stat->qid);
+    err = stat_to_qid(pdu, stbuf, &v9stat->qid);
+    if (err < 0) {
+        return err;
+    }
     v9stat->mode = stat_to_v9mode(stbuf);
     v9stat->atime = stbuf->st_atime;
     v9stat->mtime = stbuf->st_mtime;
@@ -892,7 +909,7 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
 #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields above */
 
 
-static void stat_to_v9stat_dotl(V9fsState *s, const struct stat *stbuf,
+static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
     memset(v9lstat, 0, sizeof(*v9lstat));
@@ -914,7 +931,7 @@ static void stat_to_v9stat_dotl(V9fsState *s, const struct stat *stbuf,
     /* Currently we only support BASIC fields in stat */
     v9lstat->st_result_mask = P9_STATS_BASIC;
 
-    stat_to_qid(stbuf, &v9lstat->qid);
+    return stat_to_qid(pdu, stbuf, &v9lstat->qid);
 }
 
 static void print_sg(struct iovec *sg, int cnt)
@@ -1116,7 +1133,6 @@ static void coroutine_fn v9fs_getattr(void *opaque)
     uint64_t request_mask;
     V9fsStatDotl v9stat_dotl;
     V9fsPDU *pdu = opaque;
-    V9fsState *s = pdu->s;
 
     retval = pdu_unmarshal(pdu, offset, "dq", &fid, &request_mask);
     if (retval < 0) {
@@ -1137,7 +1153,10 @@ static void coroutine_fn v9fs_getattr(void *opaque)
     if (retval < 0) {
         goto out;
     }
-    stat_to_v9stat_dotl(s, &stbuf, &v9stat_dotl);
+    retval = stat_to_v9stat_dotl(pdu, &stbuf, &v9stat_dotl);
+    if (retval < 0) {
+        goto out;
+    }
 
     /*  fill st_gen if requested and supported by underlying fs */
     if (request_mask & P9_STATS_GEN) {
@@ -1382,7 +1401,10 @@ static void coroutine_fn v9fs_walk(void *opaque)
             if (err < 0) {
                 goto out;
             }
-            stat_to_qid(&stbuf, &qid);
+            err = stat_to_qid(pdu, &stbuf, &qid);
+            if (err < 0) {
+                goto out;
+            }
             v9fs_path_copy(&dpath, &path);
         }
         memcpy(&qids[name_idx], &qid, sizeof(qid));
@@ -1484,7 +1506,10 @@ static void coroutine_fn v9fs_open(void *opaque)
     if (err < 0) {
         goto out;
     }
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     if (S_ISDIR(stbuf.st_mode)) {
         err = v9fs_co_opendir(pdu, fidp);
         if (err < 0) {
@@ -1594,7 +1619,10 @@ static void coroutine_fn v9fs_lcreate(void *opaque)
         fidp->flags |= FID_NON_RECLAIMABLE;
     }
     iounit =  get_iounit(pdu, &fidp->path);
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     err = pdu_marshal(pdu, offset, "Qd", &qid, iounit);
     if (err < 0) {
         goto out;
@@ -2328,7 +2356,10 @@ static void coroutine_fn v9fs_create(void *opaque)
         }
     }
     iounit = get_iounit(pdu, &fidp->path);
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     err = pdu_marshal(pdu, offset, "Qd", &qid, iounit);
     if (err < 0) {
         goto out;
@@ -2385,7 +2416,10 @@ static void coroutine_fn v9fs_symlink(void *opaque)
     if (err < 0) {
         goto out;
     }
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     err =  pdu_marshal(pdu, offset, "Q", &qid);
     if (err < 0) {
         goto out;
@@ -3065,7 +3099,10 @@ static void coroutine_fn v9fs_mknod(void *opaque)
     if (err < 0) {
         goto out;
     }
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     err = pdu_marshal(pdu, offset, "Q", &qid);
     if (err < 0) {
         goto out;
@@ -3223,7 +3260,10 @@ static void coroutine_fn v9fs_mkdir(void *opaque)
     if (err < 0) {
         goto out;
     }
-    stat_to_qid(&stbuf, &qid);
+    err = stat_to_qid(pdu, &stbuf, &qid);
+    if (err < 0) {
+        goto out;
+    }
     err = pdu_marshal(pdu, offset, "Q", &qid);
     if (err < 0) {
         goto out;
@@ -3634,6 +3674,8 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
         goto out;
     }
 
+    s->dev_id = stat.st_dev;
+
     s->ctx.fst = &fse->fst;
     fsdev_throttle_init(s->ctx.fst);
 
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 8883761b2c1d..5e316178d579 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -256,6 +256,7 @@ struct V9fsState
     Error *migration_blocker;
     V9fsConf fsconf;
     V9fsQID root_qid;
+    dev_t dev_id;
 };
 
 /* 9p2000.L open flags */
-- 
2.21.0


