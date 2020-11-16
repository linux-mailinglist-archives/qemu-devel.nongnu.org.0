Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCED2B5162
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:43:46 +0100 (CET)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekPh-0002KK-4H
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kekJI-0004Ke-MI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:37:08 -0500
Received: from mail-mw2nam12on2086.outbound.protection.outlook.com
 ([40.107.244.86]:6336 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kekJF-0002iq-3O
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0C6bPrar5FKJzYyTvBjUuKLrv0p/KlkCiYIOaI9fmkzJBw/rbrCN03zZnqH+5ExY9P3hQFoaEaVEccWd9AvDsBuDue4R7dNJWilXJt43iAOFIwOqPrOYPn1QmCC7B+xPuN8ugmAmm0TXLcDns9U/FT4FtRaNSr6+ClXlt36gr4veVTEsyHpl+c+KT+vkQ1IwofnhiFnxvTFOwRiBco/oeyw8lm7RtZJne0ZvZaRb/SIfHARn09CftEZb1bhwEBFj9B+sv0NJ/N9agQHMaB7GYOZGH8I6hiS8709/wk6gYMOgMxBJR2P0PRWA3SPaFZCVUNuhpSI9F4noynPBzozwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIYSY6+F7GPVzDg4vHO0vn0hFG1h9PfDP9beNCHFllc=;
 b=Es5mrd6juIpYNI21EqwYgUjY7fknojgLI0e9sEelyCRdVVU0GxqYeB/rQqrR66q90egyR0p1vS+lfM1p7lTcZnq3K3n/imFuVIyl6KofhyWxt+xD10cv2sSpjsvDGWKu3D2ONBWAvskHTyS24l2vUM477Ej9o1v+7OjxudR3/C0+gPi4q52+NN2hGUShSrNPOuWDhmDf5ZvBie7ezJjQ5LlpDtR0bRbYaeMNUmUCDc33utVCJe47einFiK9kSAfdE6u28qkeNZ4ldEtmtxbXOhiPW3oB4Wj0lsDyF5YU+6zBq89dfpbLrV5iCYvWmSVhq5SdLAIf+VhYVPZOID5IrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIYSY6+F7GPVzDg4vHO0vn0hFG1h9PfDP9beNCHFllc=;
 b=urRHZ7ajy1HHzUNtwzgOSiv6kV3pyqGN4TN25zgzAAVcFbp7Q6vRGsvynklIHFlMUUvF1QPbIy5nr3x/rbohXlfxbSjlh9N77Oa7RdpLIoYlKyjOfJ22LKGZEUzMTDUwzSPpcuceCbZpJ+A7eNPnoFnL7LMIm3xnp8y/s4AYulM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3814.namprd12.prod.outlook.com (2603:10b6:610:28::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 19:21:58 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4%8]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 19:21:58 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 1/1] qga: update schema for guest-get-disks
 'dependents' field
Date: Mon, 16 Nov 2020 13:21:17 -0600
Message-Id: <20201116192117.45930-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116192117.45930-1-michael.roth@amd.com>
References: <20201116192117.45930-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [76.251.165.188]
X-ClientProxiedBy: DM3PR12CA0079.namprd12.prod.outlook.com
 (2603:10b6:0:57::23) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (76.251.165.188) by
 DM3PR12CA0079.namprd12.prod.outlook.com (2603:10b6:0:57::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 19:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03d56618-b151-45f1-0918-08d88a64e291
X-MS-TrafficTypeDiagnostic: CH2PR12MB3814:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3814ACE89E0DA54B1CC3272495E30@CH2PR12MB3814.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1P7ZbKZ42ZKjux1lXitzVUezTlgQQCYZTwcn/IKXr2Ior1GUD7/woHDLDnJz982M98LZBrHLG+3E0SrEO3Kb5aXHukNCsLU/G7X2E+ri6A7TQFGh5Zu7TeHp1FTTQXYFyy4KQGwj2HcL+7VpsN1IR542B94q9UTgdgh3KuN+0plrr6aBnYO+qk3JqdHJ84yDD/dTPjVdL/Pei2knNbJLzazv+Oqso5F6DRHLGUxx/zor4IGG6UBjjzjjoRiXjfvC6ARRNo6rP7Q+XEUrOhqOf+VdgjLAqoaReFM3+g+WeANjMUF9RdWLecuftGsR5h2G8jFo1Z6GL4mbvOoa4jDQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(2906002)(16526019)(26005)(86362001)(478600001)(956004)(2616005)(186003)(44832011)(1076003)(54906003)(5660300002)(6916009)(66556008)(66476007)(36756003)(83380400001)(6496006)(52116002)(6486002)(8936002)(8676002)(316002)(66946007)(6666004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3DN4dUQmXbFY3yP/4ZRplUNUt31qJGuSPLqG3IHGsfuwDAOrbfItEbSlWB/K9+V2nmU5iSkeSSSpedZzSU/Z++ac2hlpY5Am3s9ys6O2tv7UZYPeufkHaaqlW5qMmj/Ju8Y8PSCJtcvbq7+aBwmn0wPSBH63voPMams+lcHOdf+BCWHTQK/NwlELeT/yX6tO8AiVBhcChNoUApTCIfr4GGQOK0fBlfu1CUCMuLVvDQD88c3fm/lYsc1jaox2dQ76pGwZ5mGmVGRBiNLkXAi/m0Fe6qVOzcOs3gYYrUV7Baup3NlxpszfwQ96wohG1+ZZNhMgCbPGy5IZnEaLpQlWGoOF/QhVIkghDKzfmL6awh/PdPXdA6U8S7EH88ibwfzQPuTEwt6KMJxagDEcFcCaoSfquBuXlNzjDxm4FHa9ukcPUa9Uz6H5Ewuv8+od0USsSehoR8PKb+Lstdm74+FDAQoXDYWfV4Np6bjsqWWQEsCvQQkywvio22v7r/IyENZvPYXg8mTtaOdNkeUSgDwuXhVhX5+QbeXZ/bIPR3boiNjQgPHh0ZtIs3b0X3916aZfxWvVTuz81OeZUI8SMFSeMbP6A8nDRdaNaa41sHLsFMcaX5dFuUWxoKrzLHMhIyPswU0gIqh+EJyZ4X6csBg10aoLY8unnd9xrLtiatNrmyIvjEQ7XaIzNIv460jivq7NO1D8ANxwTn/PgUMa6GpotLucOH9gYPUw8rFwxaaxVv5kPtRUl63z/uEjClyRev5YKjzJ5oy0EYGh/vFVNmZaSoxVluEg/8d7iBzewkUvPEMRMVA3sFCvYKNY1blQ/NF66eCeTgiif8Gki1u5usnOcYGr6mnWFbZFeR6Pl2U3ntfzarAXMDmihr6sbP/jrfCPbnprd/qF86/L2bBq0rkcNA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d56618-b151-45f1-0918-08d88a64e291
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 19:21:57.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqM1AqICZZUhuYEPKLkWqkFodKIpk2S36szZZNlPTvDlfKDtsDs1CPFz2nz+Z3M3v/i2blWVZtbogPt2ZOff3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3814
Received-SPF: none client-ip=40.107.244.86; envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 14:37:02
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recently-added 'guest-get-disk' command returns a list of
GuestDiskInfo entries, which in turn have a 'dependents' field which
lists devices these entries are dependent upon. Thus, 'dependencies'
is a better name for this field. Address this by renaming the field
accordingly.

Additionally, 'dependents' is specified as non-optional, even though
it's not implemented for w32. This is misleading, since it gives users
the impression that a particular disk might not have dependencies,
when in reality that information is simply not known to the guest
agent. Address this by making 'dependents' an optional field, and only
marking it as in-use when the facilities to obtain this information are
available to the guest agent.

Cc: Eric Blake <eblake@redhat.com>
Cc: Tomáš Golembiovský <tgolembi@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-posix.c | 10 ++++++----
 qga/qapi-schema.json |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 12c1ba5ef7..c089e38120 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1285,6 +1285,7 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
         g_debug("failed to list entries in %s", deps_dir);
         return;
     }
+    disk->has_dependencies = true;
     while ((dep = g_dir_read_name(dp_deps)) != NULL) {
         g_autofree char *dep_dir = NULL;
         strList *dep_item = NULL;
@@ -1297,8 +1298,8 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
             g_debug("  adding dependent device: %s", dev_name);
             dep_item = g_new0(strList, 1);
             dep_item->value = dev_name;
-            dep_item->next = disk->dependents;
-            disk->dependents = dep_item;
+            dep_item->next = disk->dependencies;
+            disk->dependencies = dep_item;
         }
     }
     g_dir_close(dp_deps);
@@ -1351,8 +1352,9 @@ static GuestDiskInfoList *get_disk_partitions(
         partition->name = dev_name;
         partition->partition = true;
         /* Add parent disk as dependent for easier tracking of hierarchy */
-        partition->dependents = g_new0(strList, 1);
-        partition->dependents->value = g_strdup(disk_dev);
+        partition->dependencies = g_new0(strList, 1);
+        partition->dependencies->value = g_strdup(disk_dev);
+        partition->has_dependencies = true;
 
         item = g_new0(GuestDiskInfoList, 1);
         item->value = partition;
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 6ca85f995f..3b3d1d0bd9 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -870,9 +870,9 @@
 #
 # @name: device node (Linux) or device UNC (Windows)
 # @partition: whether this is a partition or disk
-# @dependents: list of dependent devices; e.g. for LVs of the LVM this will
-#              hold the list of PVs, for LUKS encrypted volume this will
-#              contain the disk where the volume is placed.     (Linux)
+# @dependencies: list of device dependencies; e.g. for LVs of the LVM this will
+#                hold the list of PVs, for LUKS encrypted volume this will
+#                contain the disk where the volume is placed.     (Linux)
 # @address: disk address information (only for non-virtual devices)
 # @alias: optional alias assigned to the disk, on Linux this is a name assigned
 #         by device mapper
@@ -880,7 +880,7 @@
 # Since 5.2
 ##
 { 'struct': 'GuestDiskInfo',
-  'data': {'name': 'str', 'partition': 'bool', 'dependents': ['str'],
+  'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
            '*address': 'GuestDiskAddress', '*alias': 'str'} }
 
 ##
-- 
2.25.1


