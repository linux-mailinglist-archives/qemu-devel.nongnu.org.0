Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C357D476
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:59:09 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcKB-0001hh-Vj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHs-0004vs-MR
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:44 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:29290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHq-0006aZ-DF
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:44 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKtfm027882;
 Thu, 21 Jul 2022 12:56:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=fmmRx1Hp8obNbvbVCxieQ6aM7aAPcZ0/V4Wm/KC9XEU=;
 b=qYZA/Uk5lFfZF9sa7+9VOQb15PEY4FJ493W2COY3pCNtDRyua0BIfl9Elv1522RzHjBg
 g+qTaqpFYKwfF3AEs9cVX8saBOcjEJqzsczFXgMK/GfThvUy8IdOs6VVBQPk7JF1qv1I
 MDrRbR325eF8u7f2LhK5KLBIzujjmpn4PEU1M3UJrXXFOQkvk7BMdJRr1e7AtHhzAxRz
 iCBx/3LunTmdX+jOK5eTdRYUEBOCxXreSJj97jhxSIzaJn0iUkSSmi9RuIaJT+aDSJuv
 r70XpBKD0gu0krnhFCcAhAE5pPxXuDTDdfcI6R8JALwUjaaLxyYf16IFTtlDO2n1XXRK 7Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvv244d6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAHd8XwQVJoMggeMFmAQf2fj0Nuzj01WtlKHljgW5UbXiNZYVavCcz/egGfpb8Szrj05gWWu/LR3I2OSTBO/L+eLX8KyKoI+q3mzF7vToadm683tFwijOVogac58lDFt/jT8HpB+VKRZ71GDaZI1T0D4vGRXCAMvESHgSxJQHjK/wOsVaJf/NK19inWg6Byy7GQsNSPdO2mdeAK7j9eTrK8Xy++/PqaW5dXevdhH8Sy8rriEEPk5qRktUHgX0YDHDQU5dZnIvNPj3ig0hTcWvwgJYGMyu+MZf0HvY6A0btH+E1zdkw+jE8H9AOiXxUI7EuFR56+JsIrv2mtKjrO5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmmRx1Hp8obNbvbVCxieQ6aM7aAPcZ0/V4Wm/KC9XEU=;
 b=SlEKw6VTGKJIVM5QH/IRMyYI4VtN3sK38ODHaqv4+KOUweiB6u6h1tgvh8UZXR9p3EtqexBdbn8r10v8Lige6bWLoz5BsllJW6swrsRHNVuImxwF4py7HiD0Rt2ggXi3pINbu1ll+IZIMO2Nq6h3JRos1tktmvDKvGg4WPIDoMv45+S6EKgch40JnxIf0uCCY9TVFaZkArD5Yeh11p3dXSnsrceMtstiFDJ7XyWytsmtwtRtGVLDO0n/pRvf7mWJ/a7lWBzCf1OYAjW8fqwqjZ3ucbw0AgtIsjQwOod5QgUpGzPIu7pONxjhE8e60dSgvTq19wUhO/bINceWlupDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:37 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:37 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
Date: Thu, 21 Jul 2022 19:56:15 +0000
Message-Id: <20220721195620.123837-3-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220721195620.123837-1-het.gala@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e8852c-1a9d-4f74-2b4b-08da6b531ef6
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWWLnw9QYxozF22iYPYa7Uu6DoH6zTzt97zWE0DfO4+lHj+OyNDSlxIuHIx/jFwlkXnkw/lTkEIq+GQg2I4kObYHySGBsqj1XSp29jNLgu9Jk1P7bLrnpP2j+snreO8cem4cqRvfFRrwM9MCJc0AET797+56MnnBzUZLB/lRfk1Z4D4dTd9tRKGugj77Eh/5h/T7N8osHX+N2aTmVZDidHqmdAWAwTd9fJqXbbn/VGjq25jBGLKChE5JMIBiHd1D3RNjlSy13ABEbBzjKQRQK4w90ETkD1cPwwaSHOXzVDU9wjOmTfA3pC5UIs0oAhMja9aNxrko/YqzhSAKw+dtgmXgMImNINXzTRXynv8YRl3EFFhQh/K5N/ey27wtDGP4cpDvUhrwwlprwUedzgIffzXK5LGqJgbXMNGe0i1iUrYkpLIYpsUH29jq+ddBXPxmVgXwQpKnKx5gvunxXQZcTZiMM4SkkyuCuf2KGnVm+Fos+qAfQiN3bVqXYYRJBc4+A1VVNaiHJJKoK9crqChT14KYWfkwpk4Tp2TrCWQ1LMxy+OnUNafRZ7eughMscx+DQd59lK4y+J7qSn65PIcPmQKJjUqvwVNv63duTNanAaaxLm0Whxcdqa1k4ShH556YFTM8rDmTN7BBWkDudQ4gkzo1nZop+WINxBkNF2RrSwOUvxYGfZ+J/jna7054R6gl5obbpNS5Q33/Di1fnUDWdwzc8J+YH2q+9gd5GejLEHL1m2COWlS641BJS5KMnOiIo/MH79qezjPOVEgyGPywD+wXHgmtNIXRiExjJe4+oiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(30864003)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FyFb5iUaczZtoIqljx0vA4fxaURinbYOG7vcFz1Sl+afM4H58wUswoSX8qPV?=
 =?us-ascii?Q?W3z37Par9VhnABgobM3JMxXNHHH695p+qUPkrXtrU7eFqblI84rP6sktBlzD?=
 =?us-ascii?Q?h5JWiXZfIqF6JR0U06p5srJ8nFByBRlMtLQRQtUcRuk16gcTICfI11Tr2uIc?=
 =?us-ascii?Q?76Drv0oSMmDyxU8KHr1iMivRX/t//SzXFfWR5qlWRFiARG2i3n02y+UbfMn1?=
 =?us-ascii?Q?vP3WsSWAOAyzCccLf2mepi9uHEPc/C0xU8Nul48qeppfwffvFkz7t4jmlkoF?=
 =?us-ascii?Q?wmgiQTpHVQ3GOdMgOUTqrzdXM8WFMWmw1xvbBPwqITsjTtUHlmzV3ZGfyz94?=
 =?us-ascii?Q?YiezU4D2UE5j8oMs3vo7GXZx9QEteze3AWDbpIpWO6Bv6wdIaAEmvBftLDrQ?=
 =?us-ascii?Q?mcd7YN/3J84seZKcVgNBEwWrjS7R1yLJxb9dBO3qXRjgmSARuIS/rfOI2Gyj?=
 =?us-ascii?Q?fmglaSTXtwXUrrU1d0+h/ZWAjrCNvo+Jb9Q/FwsRzDseB0eYp5bw/Ww7sMxz?=
 =?us-ascii?Q?MTy6fFY6n1c10WY0ucVC5n0Nbj+xvuGFqVDS/6D1o3hmeBFbPe6Eq5L0P5uf?=
 =?us-ascii?Q?E3GHaNs7llvfwDioEeHAnILtbbVCtPbAmj9prrDx+muXMEUUCQGXRKXKVp6J?=
 =?us-ascii?Q?I2HjYa0H50Hcc9dUQNhkMlpieeOH9+Rtohdif+caq5+4zdUNW35GTeD/HiVp?=
 =?us-ascii?Q?LifN6rg/umFz0frCR3VosZ9JCvPfdP7W1OfWAkAjuS7SWnO5BD9ZiXXoGrt5?=
 =?us-ascii?Q?zk9z43GB6icGy8yaSbdICrMWqaEM6g7zQgSKqHGwx9PQrAQOKH7YFqYUYKk0?=
 =?us-ascii?Q?Zty3bPYeGPhE6dmuergPKQQixyjkJYEndCN11i+/0wPi/H1ddr1e8si1ZNSP?=
 =?us-ascii?Q?fFTAb186PXg7KN8vLmKFXgW7hGyoF6iFCKQO0ddgHbCfqy8rDYDgdgZRRZYd?=
 =?us-ascii?Q?a8l097xZszMr5MZIRt1BwtABrc99L4I8xXWs2+3YNTynNqWZHLiptxkrZz77?=
 =?us-ascii?Q?gaIU3IlLjehA4OUoakiKJOGRhLydZDUG4QrKovvjwpWmSKI5U5mqEw98Sd38?=
 =?us-ascii?Q?KVBuv2uN6y/k4RoClyvCP6PyN9ZIXNGUv8E0zg4XYXYxExTnBWnrTbgwVsYk?=
 =?us-ascii?Q?WPBTZThp9rpK9+1sEkkDUCmgSbRIPOe4lNo4W8sLVQg3rVNvFTHUyl2ikKA7?=
 =?us-ascii?Q?huO7oVXzZ74FSTDy7L6KmWyFaRP8xJnvlG4BO7tt5kXrGHYhe6G770eTL4vw?=
 =?us-ascii?Q?J45hKv/7LDw5X32joV01crJXCnYWQwscDIX3eDSSyKMicqAX1Ka8p6parfAg?=
 =?us-ascii?Q?Y/9juTejQRJ1eeBZGaXFHgIYPlSepg6PFLRzAhCsVb8sUFUONm6cMkApc+a6?=
 =?us-ascii?Q?rrJidgSDrBRlTn9Dbn/9ceNQinnbTkinJK0DlzVzL/J6mG55H7AQXQ3bBVGv?=
 =?us-ascii?Q?Ffjoh43tpABX7W8JFIRjwrHaLW6FeKbpPNwWbnPXKtmzSBYc2OiO4qrREoNz?=
 =?us-ascii?Q?u8JCZfVykD1EIQY3aIZ23L9ThHR/8t30E2U2Hyn2qjvTzq9KjvssVMcLk/6O?=
 =?us-ascii?Q?ofWxTfnhZ0DakrT70esf96W7lDLrQPQ/EFY2quWM?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e8852c-1a9d-4f74-2b4b-08da6b531ef6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:37.4284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: burV58CEAWiLeFa4gMpskW4zX8P7o5W7Oz+PczVkZG7DpF5xbjlzhMpIlzG6TPZ9G+rLoO5OXUIY1oMnjqYTug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-ORIG-GUID: lvBuuuIrF4UIvT7DGUnuPC-Zg79Yc7lW
X-Proofpoint-GUID: lvBuuuIrF4UIvT7DGUnuPC-Zg79Yc7lW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
   each element in the list consisting of multifd connection parameters: source
   uri, destination uri and of the number of multifd channels between each pair.

ii) Information of all multifd connection parameters' list and length of the
    list is stored in 'OutgoingMigrateParams' struct.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 52 +++++++++++++++++++++++++++++--------
 migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
 migration/socket.h    | 19 +++++++++++++-
 monitor/hmp-cmds.c    |  1 +
 qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
 5 files changed, 160 insertions(+), 19 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e03f698a3c..572b909423 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2380,13 +2380,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     return true;
 }
 
-void qmp_migrate(const char *uri, bool has_blk, bool blk,
+void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
+                 MigrateUriParameterList *cap, bool has_blk, bool blk,
                  bool has_inc, bool inc, bool has_detach, bool detach,
                  bool has_resume, bool resume, Error **errp)
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    const char *dst_ptr = NULL;
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
@@ -2400,20 +2401,51 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
+    /*
+     * In case of Multi-FD migration, source and destination uri
+     * supports only tcp network protocol.
+     */
+    if (has_multi_fd_uri_list) {
+        int length = QAPI_LIST_LENGTH(cap);
+        init_multifd_array(length);
+        for (int i = 0; i < length; i++) {
+            const char *pd = NULL, *ps = NULL;
+            const char *multifd_dst_uri = cap->value->destination_uri;
+            const char *multifd_src_uri = cap->value->source_uri;
+            uint8_t multifd_channels = cap->value->multifd_channels;
+            if (!strstart(multifd_dst_uri, "tcp:", &pd) ||
+                !strstart(multifd_src_uri, "tcp:", &ps)) {
+                error_setg(errp, "multi-fd destination and multi-fd source "
+                "uri, both should be present and follows tcp protocol only");
+                return;
+            } else {
+                store_multifd_migration_params(pd ? pd : multifd_dst_uri,
+                                            ps ? ps : multifd_src_uri,
+                                            multifd_channels, i, &local_err);
+            }
+            cap = cap->next;
+        }
+
+        if (outgoing_param_total_multifds() != migrate_multifd_channels()) {
+            error_setg(errp, "Total multifd channel number mismatch");
+            return;
+        }
+    }
+
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, "tcp:", &p) ||
+    if (strstart(uri, "tcp:", &dst_ptr) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
         migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
+        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "rdma:", &dst_ptr)) {
+        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "exec:", &dst_ptr)) {
+        exec_start_outgoing_migration(s, dst_ptr, &local_err);
+    } else if (strstart(uri, "fd:", &dst_ptr)) {
+        fd_start_outgoing_migration(s, dst_ptr, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..f199430bc2 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -32,6 +32,28 @@ struct SocketOutgoingArgs {
     SocketAddress *saddr;
 } outgoing_args;
 
+struct SocketArgs {
+    struct SrcDestAddr address;
+    uint8_t multifd_channels;
+};
+
+struct OutgoingMigrateParams {
+    struct SocketArgs *socket_args;
+    size_t socket_args_arr_len;
+} outgoing_migrate_params;
+
+int outgoing_param_total_multifds(void)
+{
+    size_t len = outgoing_migrate_params.socket_args_arr_len;
+    uint64_t total_multifd_channels = 0;
+
+    for (int i = 0; i < len; i++) {
+        total_multifd_channels +=
+                outgoing_migrate_params.socket_args[i].multifd_channels;
+    }
+    return total_multifd_channels;
+}
+
 void socket_send_channel_create(QIOTaskFunc f, void *data)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
@@ -65,6 +87,9 @@ int socket_send_channel_destroy(QIOChannel *send)
         qapi_free_SocketAddress(outgoing_args.saddr);
         outgoing_args.saddr = NULL;
     }
+    g_free(outgoing_migrate_params.socket_args);
+    outgoing_migrate_params.socket_args = NULL;
+    outgoing_migrate_params.socket_args_arr_len = 0;
     return 0;
 }
 
@@ -135,17 +160,46 @@ socket_start_outgoing_migration_internal(MigrationState *s,
 }
 
 void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
+                                     const char *dst_str,
                                      Error **errp)
 {
     Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
+    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
     if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
+        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
     }
     error_propagate(errp, err);
 }
 
+void init_multifd_array(int length)
+{
+    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
+    outgoing_migrate_params.socket_args_arr_len = length;
+}
+
+void store_multifd_migration_params(const char *dst_uri,
+                                    const char *src_uri,
+                                    uint8_t multifd_channels,
+                                    int idx, Error **errp)
+{
+    struct SocketArgs *sa = &outgoing_migrate_params.socket_args[idx];
+    SocketAddress *src_addr, *dst_addr;
+
+    src_addr = socket_parse(src_uri, errp);
+    if (!src_addr) {
+        return;
+    }
+
+    dst_addr = socket_parse(dst_uri, errp);
+    if (!dst_addr) {
+        return;
+    }
+
+    sa->address.dst_addr = dst_addr;
+    sa->address.src_addr = src_addr;
+    sa->multifd_channels = multifd_channels;
+}
+
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..0cbb7220ac 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,13 +19,30 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "migration.h"
 
+/* info regarding destination and source uri */
+typedef struct SrcDestAddr {
+    SocketAddress *dst_addr;
+    SocketAddress *src_addr;
+} SrcDestAddr;
+
+
+int outgoing_param_total_multifds(void);
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
                                      Error **errp);
+
+int multifd_list_length(MigrateUriParameterList *list);
+
+void init_multifd_array(int length);
+
+void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
+                                    uint8_t multifd_channels, int idx,
+                                    Error **erp);
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6bb6424215..8d25fee4be 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -59,6 +59,7 @@
 #include "migration/snapshot.h"
 #include "migration/misc.h"
 
+
 #ifdef CONFIG_SPICE
 #include <spice/enums.h>
 #endif
diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4311..456247af8f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,37 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateUriParameter:
+#
+# Information regarding which source interface is connected to which
+# destination interface and number of multifd channels over each interface.
+#
+# @source-uri: uri of the source VM. Default port number is 0.
+#
+# @destination-uri: uri of the destination VM
+#
+# @multifd-channels: number of parallel multifd channels used to migrate data
+#                    for specific source-uri and destination-uri. Default value
+#                    in this case is 2 (Since 7.1)
+#
+##
+{ 'struct' : 'MigrateUriParameter',
+  'data' : { 'source-uri' : 'str',
+             'destination-uri' : 'str',
+             '*multifd-channels' : 'uint8'} }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @multi-fd-uri-list: list of pair of source and destination VM Uniform
+#                     Resource Identifiers with number of multifd-channels
+#                     for each pair
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1474,20 +1499,32 @@
 # 1. The 'query-migrate' command should be used to check migration's progress
 #    and final result (this information is provided by the 'status' member)
 #
-# 2. All boolean arguments default to false
+# 2. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
 #
-# 3. The user Monitor's "detach" argument is invalid in QMP and should not
+# 3. All boolean arguments default to false
+#
+# 4. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
 # Example:
 #
-# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "uri": "tcp:0:4446",
+#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
+#                                   "destination-uri": "tcp:0:4480",
+#                                   "multifd-channels": 4},
+#                                 { "source-uri": "tcp:10.0.0.0: ",
+#                                   "destination-uri": "tcp:11.0.0.0:7789",
+#                                   "multifd-channels": 5} ] } }
 # <- { "return": {} }
 #
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
+           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
+           '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


