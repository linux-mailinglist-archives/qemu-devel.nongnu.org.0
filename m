Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D82B2407
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:49:58 +0100 (CET)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kde90-0001VT-1U
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kde7h-00011a-2F
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:48:37 -0500
Received: from mail-mw2nam10on2088.outbound.protection.outlook.com
 ([40.107.94.88]:19744 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kde7c-0001H2-4F
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:48:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QR7MfUkB8ig70NAcUbS039Ltx1vpXTU7yVi47gmH86gAH5806L4rn3k2PehQIXplkCf6nVfKrmOXHHKpeCpeWgcgBwcRyEb+1OrbGUzo22aC582QSI2sXOZISiTGzz4mUaQfVYMntWKsi2ydoDKkPHRMw/4fKnXy50SU+tziW2CjFpvShk4d3JgdpKV2BKY1QWjZBCBnCMzn47ich1ghl6SxfpM8WYRv9jUwTYh1QSMURRH4BZ07dePM5rbenZCgPHR3+7EITrl37w3AHXEyhmOV8bZZM3Q7GxfEMPJ76pTWxdVqz9QRV3nbZwJqX/A3z2CyqwLeDXACIZ7dxpupAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxeJbp9/6tG7qqOJ+3HtRl3vLMCVVMvFRmlL0s90Ljg=;
 b=LKNNVMQO/mU0gcRMHdx42P98JrBfZ0BJvTzg6eZyjdQPd8fxdkMxvlLvqAXkK/blTsjf7a/XAn/8K0wfY21tbRzwdwMi/RRzEJ3sjy3rmbE6gnwTh/ORF1K5LbDbe6y2oCVh/67ZiDydInjNKsU4PpyqdhntVPDVbKczRM24d8KjoHY2cjqlOL7Gv1G36RW6olVpnBXC2ptca0f1IMX7IkkCvK6/sEvNYOK9p+gDZ20K3EQMTeKjumN6+9NSTmziU2c/DQxPPxY4fs6Cw++ENwW1U+P3VymmrBtiUoBi60o+pylTJpmpeNTKRS6fhB+tFX/cSlkxjb6Sdy73sdhfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxeJbp9/6tG7qqOJ+3HtRl3vLMCVVMvFRmlL0s90Ljg=;
 b=o8n11fR7uC5sju3rHN4JviYvszrSgKna3qnb8Fp4ePVhi5qkvH6o5MQtpMDi1/uy313oTsaR15PdDDA/VVc5rw/km9KBANH1BAxldrt3bXE9Sb6XBtwMl9Rs3KK+t1Ll3EkUBF2QD99+9uovoFeEB+iKND2eZqTzvzyqWBw7NiA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3669.namprd12.prod.outlook.com (2603:10b6:610:27::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 18:33:23 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f428:769b:3e9:8300]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f428:769b:3e9:8300%5]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 18:33:23 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2] qga: update schema for guest-get-disks 'dependents'
 field
Date: Fri, 13 Nov 2020 12:33:12 -0600
Message-Id: <20201113183312.432630-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SN6PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:805:106::40) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN6PR2101CA0030.namprd21.prod.outlook.com (2603:10b6:805:106::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.9 via Frontend
 Transport; Fri, 13 Nov 2020 18:33:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec975302-e584-44cb-3819-08d888029a2f
X-MS-TrafficTypeDiagnostic: CH2PR12MB3669:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3669A1D9A13BF112F58AC4FA95E60@CH2PR12MB3669.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0lY4RAq7zNGM8msuvbN8nto0+2JnJo5W5hhfhntv7efCDYlbiYsZqQVTA7uR3+VEiioHzrQEar0LfNH9qVigmX1hfSxSztvLCdvIt55CA4Dm2eIg9GRkGmzZ2MOInyK7PjUGdCpE5JvyR8cow1XDDE12t99h3cWsVZnXJMR26slGmmBelYSNWd1gqK2StBQpsbGeeLt9UQnj1iaVStR35GFEAtZk73PZZavCoIl8l7+Gh6WIlG09dv6/DFl58LptvKlPudYSSEznY/BsijYYXDFAL4MRFtvlAd/ZOXNQ85qAzQmbpCvD3SkQWx6jAONLOc7lx3tzNAbqtUbazLOoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(86362001)(52116002)(36756003)(1076003)(956004)(16526019)(8936002)(6666004)(44832011)(26005)(478600001)(2616005)(6486002)(8676002)(186003)(5660300002)(6496006)(4326008)(316002)(2906002)(66476007)(83380400001)(54906003)(66946007)(6916009)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6pNp8Dfupu7Q3GFMr4RH5x+lPGlS62bQbQkFNmLABDMOCnGyeCofrqDPCPNNmoAKLvFrdtjCCiZOiuQGKO8Jz9VqUUqmaUIHT7GTZR3GMscf4PXDDVOjG350WoH7myarlQ6MwrncWGln00C4B756BwLXEtIj1BEJicsupK6U5GSzyQtIKMG4qpyG9GgInHSDrjmwhG6G1Rc5Et8u/Z+OXU6zqUzmKd2GVQXxUdoybqi8AKuPteQdCG1oSl7//H1fZxOtfr78UXQj2WP8HOQmwzGyO5Bp+33bgvTLDRJD3fD7eMLxXYG5erJ0AQjAeTfIHd3xXVIWPHtFE5bhPEdAFQkoEZl/5V81TL7EuqDyTKHepOzZc7go7rX2kCFgKJBRlRmV+WI8ajO3/qjwQl9YTRcHIAxlauoTozx9lYDEReiove65qBvYWTF8dJg5VMDYVpvyu6SiJO4VlbNutza9YS/m3K8bMr/i18sAt/pcpOeW1+5RaHs7izc5+A19y084rLBrOWc33z6Lq7pTKMfgRMiXGqqvDgJvgL+kZgXqSvy1mGksFwESkhNG2/Tdk7VSClBC5Zbced2w+cpzVtKGgKbrWWVEGRK0Zmt1teWggtpZVNSthHzfYR9G6wT6OoDYcT78uTMKMpNsDFoArgDfcE5K2hMQQUerLAvRT3k/60tXxc/Uxa7Ya21UUjkSYMSv2dcbIisKOPvAsrb4oYkDP4gG66Qk4l2QkOjAJzDMTEUVpr7BP3ewQneN4uZgfcsCgXfolGrvUXP2WWblUkmWmV+4hB1oBXy1tTPkgSfVzCWzLTdOqCiJn3/uqoM06oqevHULy5nVUftbAOPXQMQHCs3BNsEUwfmvrgZDDl6lKavgkRWgMvUHUaZ4b4GSl/1DvChHlQ99dZOTSFIFTduhWQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec975302-e584-44cb-3819-08d888029a2f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 18:33:23.8211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPgQFLL5TLDxIWp/PlUdoHgSfnvwMOPC0JY0ZC/7W6zQdOeRHnrz3MANvvHaSDzZ+ee6agC2HmcTUiagz0MB+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3669
Received-SPF: none client-ip=40.107.94.88; envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 13:48:29
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>
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


