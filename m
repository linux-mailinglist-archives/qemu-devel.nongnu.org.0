Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F95817F3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:53:33 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNoK-0004zF-Cs
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAt-0004RD-Q4
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAq-0006Li-OP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:47 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn4RF016276;
 Tue, 26 Jul 2022 16:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=4op/ogYjey0wkawYIyBc2WEj4QMhErheAgGWoJQ0pVM=;
 b=kYG0ARlKL8lZTrkL136/HQXeuYXu6HsCIIfy27oGNaUKiHolpCvHFifeoiTrvoNag0KV
 E/WUIpHFqg9RvsjEpoBehWJ+zzt2A/i1+IxnPhTcW1eY27k5i8pfPgpZ5f0rW4Gk9dhS
 ErbU5tjs2yMyLWphaRVteDzCmr0Dvsf5N9bcu6gjMU7rfkqJxCkJfNJlLOH+fLeefXjI
 PUTs8NmmZ8quX9qXg4rGtABSIp6FUF+P6M/WgjGmHIauCBRo8EnqCw3uXGIjOqHnHOgH
 oIQXfjx5owNTF+aq2EpEcX7rndx9Fi71XDARl1wvokhVwZvN/OSw+qzQzGobCHz+ky7E Nw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:00 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEYQ0Y006294; Tue, 26 Jul 2022 16:10:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:59 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSR023334;
 Tue, 26 Jul 2022 16:10:58 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-10; Tue, 26 Jul 2022 16:10:58 +0000
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
Subject: [PATCH V9 09/46] cpr: reboot mode
Date: Tue, 26 Jul 2022 09:10:06 -0700
Message-Id: <1658851843-236870-10-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: Uvhjtqoj1K103SpNUQJCiXvtxRME3Lpn
X-Proofpoint-ORIG-GUID: Uvhjtqoj1K103SpNUQJCiXvtxRME3Lpn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the cpr-reboot migration mode.  Usage:
  qemu-system-$arch -migrate-mode-enable cpr-reboot ...
  migrate_set_parameter mode cpr-reboot
  migrate -d file:<filename>
  ... poll for runstate postmigrate ...
  quit

  qemu-system-$arch -migrate-mode-enable cpr-reboot ... -incoming defer
  migrate_set_parameter mode cpr-reboot
  migrate_incoming file:<filename>

In this mode, the migrate command saves state to a file, allowing one
to quit qemu, reboot to an updated kernel, and restart an updated version
of qemu.  The caller must specify a migration URI that writes to and reads
from a file.  Unlike normal mode, the use of certain local storage options
does not block the migration, but the caller must not modify guest block
devices between the quit and restart.  The guest RAM memory-backend must
be shared, and the @x-ignore-shared migration capability must be set,
to avoid saving it to the file.  Guest RAM must be non-volatile across
reboot, such as by backing it with a dax device, but this is not enforced.
The restarted qemu arguments must match those used to initially start qemu,
plus the -incoming option.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 qapi/migration.json | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 931c492..55f0479 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -572,10 +572,24 @@
 #
 # @normal: the original form of migration.
 #
+# @cpr-reboot: The migrate command saves state to a file, allowing one to
+#              quit qemu, reboot to an updated kernel, and restart an updated
+#              version of qemu.  The caller must specify a migration URI
+#              that writes to and reads from a file.  Unlike normal mode,
+#              the use of certain local storage options does not block the
+#              migration, but the caller must not modify guest block devices
+#              between the quit and restart.  The guest RAM memory-backend
+#              must be shared, and the @x-ignore-shared migration capability
+#              must be set, to avoid saving it to the file.  Guest RAM must
+#              be non-volatile across reboot, such as by backing it with
+#              a dax device, but this is not enforced.  The restarted qemu
+#              arguments must match those used to initially start qemu, plus
+#              the -incoming option.
+#
 # Since: 7.1
 ##
 { 'enum': 'MigMode',
-  'data': [ 'normal' ] }
+  'data': [ 'normal', 'cpr-reboot' ] }
 
 ##
 # @BitmapMigrationBitmapAliasTransform:
-- 
1.8.3.1


