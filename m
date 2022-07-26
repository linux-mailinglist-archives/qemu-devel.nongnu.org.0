Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783258181A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:08:27 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO2j-0007lj-R3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA8-0003Z0-Jt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA3-0006F0-Gl
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:59 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn4iC016269;
 Tue, 26 Jul 2022 16:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=G/aRFxq+K5XS7q0eeEExM/Np1pKuxT39Qhg3Cr4myII=;
 b=rFVBzCByq6r7/VNu+DlTn573IT22gGPfU7mLSyQfbum8FAYYoakMOKjkoRTEigT0k79e
 9a2WHc8zYAz8iTUMoxoVz3jK6H2oZxwrYKcJH0TjYSxINBNtrqmtkFHS3sKjlyC+0QlQ
 8nYFwVrLnJgalqd91yPvShlFqdGXnwBzbV11lfcabwGNW40I4cT9ktT38LEkhhkZ3QbH
 R9iqGNVdUBIjlqDPBqQEaYF2KQIkkgLfvTJXXgWdnMw0t+Z6G/NbtijUAbEZUkH+YDhy
 hTepEe07BgqDpdnOtIXRMok5vPHNJHu6+B7cHumcef0rDQOo7qRTM/7o7uwpCBxoXqB6 Mg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:11 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEVJJX006173; Tue, 26 Jul 2022 16:11:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:10 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSh023334;
 Tue, 26 Jul 2022 16:11:09 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-18; Tue, 26 Jul 2022 16:11:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 17/46] migration: check mode in notifiers
Date: Tue, 26 Jul 2022 09:10:14 -0700
Message-Id: <1658851843-236870-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: xfGarNIEGZoc4G1Hjg3_vaRTwm6EcYfP
X-Proofpoint-ORIG-GUID: xfGarNIEGZoc4G1Hjg3_vaRTwm6EcYfP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing notifiers should only apply to normal mode.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/net/virtio-net.c | 4 ++++
 hw/vfio/migration.c | 3 +++
 ui/spice-core.c     | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 29af1a5..06f0dbe 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3351,6 +3351,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
 static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 {
     MigrationState *s = data;
+
+    if (migrate_mode_of(s) != MIG_MODE_NORMAL) {
+        return;
+    }
     VirtIONet *n = container_of(notifier, VirtIONet, migration_state);
     virtio_net_handle_migration_primary(n, s);
 }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 5109124..6b0d401 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -759,6 +759,9 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     VFIODevice *vbasedev = migration->vbasedev;
     int ret;
 
+    if (migrate_mode_of(s) != MIG_MODE_NORMAL) {
+        return;
+    }
     trace_vfio_migration_state_notifier(vbasedev->name,
                                         MigrationStatus_str(s->state));
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 62b7893..413c392 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -558,7 +558,7 @@ static void migration_state_notifier(Notifier *notifier, void *data)
 {
     MigrationState *s = data;
 
-    if (!spice_have_target_host) {
+    if (!spice_have_target_host || migrate_mode_of(s) != MIG_MODE_NORMAL) {
         return;
     }
 
-- 
1.8.3.1


