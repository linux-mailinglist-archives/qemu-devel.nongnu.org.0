Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8032ABF7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:59:40 +0100 (CET)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC7H-0005VY-Do
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwh-0001Zs-Do
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwe-00087C-R1
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhItv124551; Tue, 2 Mar 2021 15:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3PvMeeTWa3MmHAR7tWHus/9tHidDa0gb9NCFGmTzJO0=;
 b=ME8UtmIJMQd7yBB3+kA7csh7F5aXh98pCr6NEbDLGCCPfyfiu7cYK4ly1cN2ZD/o6MMw
 geGrOgB+m+vM6WUvP3bhAyt4vEkSbzBsMdcrdgDR1cQzWeuk9HJfaiWhvIFDr29Vjtsk
 u0XOn8hlTkaVPtPakuumjWvOoUWqcSuUfNztX+1PtO+k/nwpRgRCnNK5e2veZxF4SPrZ
 0rh0tb8Az/ylCnT2COKP6DktkZDjXA1+o/omoZWdZaTvHvgUuTLPLXle1KJ6mOwGzfk6
 KE62Yggp4F3JnC4G0+ApF0ApiDD7rCg32gJWksBTwUI7ANTGfA+o3J4b2Z1+cofECQy4 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:37 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhUen126025;
 Tue, 2 Mar 2021 15:48:36 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:36 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KX0Q8018061;
 Tue, 2 Mar 2021 20:48:35 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3711dwtf7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmYOT5833426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D33EA2805C;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3DF928058;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/26] migration: Add start-migrate-incoming QMP command
Date: Tue,  2 Mar 2021 15:48:20 -0500
Message-Id: <20210302204822.81901-25-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Jon Grimm <jon.grimm@amd.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command forces a running VM into a migrate-incoming state.  When
using guest-assisted migration (for confidential guests), the target
must be started so that its auxiliary vcpu is running the migration
helper; after it is ready we can start receiving the incoming migration
connection.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 qapi/migration.json   | 26 ++++++++++++++++++++++++++
 migration/migration.c |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 6e5943fbb4..c7361e0038 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1569,6 +1569,32 @@
 ##
 { 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
 
+##
+# @start-migrate-incoming:
+#
+# Force start an incoming migration even in a running VM.  This is used by the
+# target VM in guest-assisted migration of a confidential guest.
+#
+# @uri: The Uniform Resource Identifier identifying the source or
+#       address to listen on
+#
+# Returns: nothing on success
+#
+# Since: 6.0
+#
+# Notes:
+#
+# The uri format is the same as the -incoming command-line option.
+#
+# Example:
+#
+# -> { "execute": "start-migrate-incoming",
+#      "arguments": { "uri": "tcp::4446" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'start-migrate-incoming', 'data': {'uri': 'str' } }
+
 ##
 # @xen-save-devices-state:
 #
diff --git a/migration/migration.c b/migration/migration.c
index 7ec25bd006..4729b89bef 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2098,6 +2098,11 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
     once = false;
 }
 
+void qmp_start_migrate_incoming(const char *uri, Error **errp)
+{
+    qemu_start_incoming_migration(uri, errp);
+}
+
 void qmp_migrate_recover(const char *uri, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-- 
2.20.1


