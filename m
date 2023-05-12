Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55584700A66
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:35:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpP-0007uR-7F; Fri, 12 May 2023 10:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpN-0007tm-TQ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpM-0002cN-0Z
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:01 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9NQJm024537; Fri, 12 May 2023 07:32:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=qNf8zk9R1ok9mC1KssQChP9FHfwfh7BRpQvMUbN7qAM=;
 b=S4GkdDV2PbwUgP09/MtGc2FJ1s/6QQUfin2sY3ST4XC+0v84Mmh4hiSc2mTAXKfPJYTF
 mJQOCL0+8cvfWuOtsqWUl4J0/NgHVVCF9QYQQLof4z0mVxby9udrNRLVGyOtBAadyN1T
 yvtGjexgTQ9+XEHZixa8rjpJRjxaUQulW0UDDUrAurk0JKUkzMPcKmwZDYb08u4KUsYJ
 3M72pAFeyGaAyT7kfZvzWv+SYfIwnkQt9h8gt/sD/gldfrDhpZ02SuXBW4r+a4AQDstI
 lSMq+zg51E5iag0rVC3VY1DndQbi6Qvpz5IX+Qt+vPKPMZCiY3Yyh991iE60FpeCYrUW lg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7g6a11r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgC6yd1eodXLY8haUL51Ijc5Fb8TdjvAB9pjRmJ90/rVzHi5D9ULNrMbYjVMt3pc8WuhvCPesDtOHSZcRkm4d75r/qJhbJEc/qoDsTPZbuRjTaVrIXXqTyjqZLxUof5wvvx8gHPj3Su023aHW7NGEADkB+tVdhDbT55WVLf2jt+QpTgrggGqlsE0n8oqhW6V4OT4I+goQSUEC1SQHwAamNhC6eWnPvKUEWwO8VShbziKfze1xlS6teiHddY2y7s0KHbZDuaIUwZeIhAIw9psZ3IKPWEtdw1/Q0nV9YOLLartmVPBSUaOWKhe2iw+VQPjrdNzu1SxKqMgSO7/R+q5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNf8zk9R1ok9mC1KssQChP9FHfwfh7BRpQvMUbN7qAM=;
 b=KHBjIvXXCbESUmiiROMdfo3EFeE80Mt5SdwcqPynLVdcLdWfnSXxvj3BMr8Sxc6Nk0aUtYhCUzfAHzNPVWwxI7m+1qgrlDhQAnObu1VVU+HdyfIXNQPOzWlQH361FcN4gqYuyjSzdl4TQKLm0OUIfWilx0vMVyHs/yEyT0QgTp3y51RHs3P1fnrXox/1SBpfWqpoGtqhdu4A6YtAfC0HrPanW1uqrRVJNI0EvmB8sun9VjqH0bg0PUCM6z2sQWZSwVxBTrCDl8crYULfB2q2wL6fssnLn79GDWGNI+BE0T9uxTk/8IWTAd/8NTcE7HsSnISUJLD058ICzGwmome4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNf8zk9R1ok9mC1KssQChP9FHfwfh7BRpQvMUbN7qAM=;
 b=v64U/XxwBL7u5uyvQet8c28ZGhMUxhLteSQ1waLBrwjbiy0Ickb6TT/p+kUld+oLm3U5UQr4W5hb5a+7w2GX2n6oW+KlmbFJ63XzFtEZsI/ME0PTyJ0NPpcAbRXV7E9jprZYRzLN41HmFU67JBpMI4QR1/1k18J+/QDVFBzZK5lCAHKQGx8+OViiUbwMhbMAbzilSsyGj9TJU0LbNWYh4fW8yj5MD7my6U9fCZyDooXZzE4RoxW9KD+uxZ9AZBsQXZb/cmttgz+ktn2cBpTFXyyMtisJsJ5h6TbU22+ShEbnqlaPWlVVCfqsKx1+OVv2oUd+57vSQq+IT1kVnxg3mg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 14:32:53 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:53 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 5/8] migration: converts exec backend to accept
 MigrateAddress struct.
Date: Fri, 12 May 2023 14:32:37 +0000
Message-Id: <20230512143240.192504-6-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230512143240.192504-1-het.gala@nutanix.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BL3PR02MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: aa794c4b-fbca-4cc4-681d-08db52f5c550
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bi/OsGMq5Z42yb8hppSnKFjjk4TyTyboU31WBj7igRkqymWEWAfhKUZsltEzMq6/r0oGDG5ZHQxYTynzyxiQTakyltmq/4oDDRmfeZLdTVoZfebnsBhZbLosIRKP7M/26fDZ5qfNqa01EIPRyBY8cZr1SlDE4//wnzgbGAlsf8lshsWK/sggyTHQZ/atH7+temtTNsXvuvGZyzO6cPkDxoMqX375SCintqSiSJr1zmRI8Ngd3iFCdGQvOfT7/yAvcuFOhBibKsg437OtihfBZPUlb2JThmgXzBEY4+naMEEPP+FNcU/xj/B09Qsw8xGm3wH0fhVt0tiPiW1ykf3kxFQlPj3taHRA28Sneouay0Tb+zHNJ31g97GkChstEJp20XxOYqUsfs8aUMDbd68TMS/rQr3eK3/KxI4io+WKVqXNnv3ldxtzXz5rL1XC9gWFaZJ1AvCnPpAEaAXkdfvtkVRChJcl86epsmZtDaedOSx5sgWiKeQk27K9SNrs+nCbz6SWvqa6ENlluH+uizxBjaqsT8L5OZb5+GMpK6gGo/i4hlIMZ/InxB+zqsEoMY3kdiWTuBmMy31u0P1J8jba9PtoYcTEDLJR/ZdXsmJ0RaSNuiJUbSZUJbD6/D91yLec
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(5660300002)(26005)(6512007)(83380400001)(1076003)(38350700002)(186003)(52116002)(2616005)(38100700002)(6506007)(2906002)(107886003)(44832011)(8676002)(8936002)(36756003)(478600001)(6486002)(6666004)(41300700001)(316002)(86362001)(66556008)(4326008)(66476007)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bgmUd/1pytkp7pfsrmXZFB1uZjkcw4hMoAgzrgQkwFp68gBGMBci3G9jYGBj?=
 =?us-ascii?Q?sPgG6xQd7mxMqrF8qw0I4wWLHFsnA2TrO1BfqwNV4C5hgUemkOqkTlHYvs5s?=
 =?us-ascii?Q?llMZgbOsF9lUknfP3QO90JEA7fPy36uiZ2iDIo97iq/m5UIZ4Pxsb6o18jKI?=
 =?us-ascii?Q?T3dndcsF1JeEjDeoKjjrw7Ectui4IgUzyFcHn2VN5IwD9g1Age47aqzfQ91h?=
 =?us-ascii?Q?u7IoVP5N2M0fgNDC4jpps5dwJfmGXHjpxDxls42kIhC0ZKzi6S0XpyTgcAR8?=
 =?us-ascii?Q?SWw/JRdnTeVwVwM7xas1qv4fBiQO+dH3Y3OnZ4q6jeJgcTYSGb9Gl9J3Yzjc?=
 =?us-ascii?Q?StR7AcYta2dcrUSUcJA0p/0V4c/Q247YeEabDvLavJuVemPOzL9ea6YVg530?=
 =?us-ascii?Q?CYp5KML2T8kqBklH25UU+HRyc7GpBP6u9/pkCoCxHTvg451jwG9KHT3O40yk?=
 =?us-ascii?Q?eis2aZKNV5C97ejTDrl4jgGfYgzXoEQcN4Lga35a7+0uXO4h4I4nnpCIeazY?=
 =?us-ascii?Q?soi6HCF29uMFpBoYikGcSX3XAW3I4Xik49mRrNBPjqzbuBCCES6A9YpO3kV9?=
 =?us-ascii?Q?jwy9P8mny+TxLr3O3wIH2vALRetO3/ogi8HqxjUFh+Drfp2Cwcovj0Pm2IVn?=
 =?us-ascii?Q?azLFuqGiXZCPaf0VeJBijfNiRdv/kFSt2sRv40dfeJ2feQG9NJRDGS1cfA0M?=
 =?us-ascii?Q?y1Qt+Ex1UzOy5hy0gRM7ze5TnroLaXrZa5x0140jmuWCFhchL6Jh9eMAggPl?=
 =?us-ascii?Q?ZtHhDH5zFqGTCtVyH9BNLfuJpUhH8bN4tBt8zFKafbJU5sJGhgWEPljZpCao?=
 =?us-ascii?Q?LXyS011MiaxgoxHs9084pAFxtf6sUQQTi4b41MFazQ3Ea7xUxFN9yONSQMSR?=
 =?us-ascii?Q?oRryxYEmYEM1x6GBRwLCqvQi1URCVONJWavkYxhQh4vru+uB5BQD2FL97Usj?=
 =?us-ascii?Q?3BMnZRaV+x4zra5SNhppXPIBkh/i0ANJ/HYhXy3Ppp7UDaU6Sk0SnnanaBwb?=
 =?us-ascii?Q?MG7fN3SQdXMbj5i7zLxQCI8Dusq+y5vxYHO5gB6XJTFVZZKPFK3fGSKBFhcH?=
 =?us-ascii?Q?X8wD4ZVlnth/Cm3Qaw6RFPG2tl5rOx+IeK3O5iy2pQ/VkYVqINDQCIbR4hTa?=
 =?us-ascii?Q?Mhuccc5O0G6dxB544Q2MEzmyDknaw+xYKJQvtJFrIhzxvHsI28gnixJVgWZ/?=
 =?us-ascii?Q?UQHiqy7eafl3bzuRSQ4GzpAac14AUzlrmfeerp2DhCF/e9v7YDxSax+ye1E7?=
 =?us-ascii?Q?yKN04+78P4/rC7zbAjPX/a4deUsf1fZ9cHpk6DyGvbm5jx7AgYlTHqO624fM?=
 =?us-ascii?Q?Qts4CIO6D/bORhrEqas+4tavZXG+Pl0leNyeOkYQRN/jnoXxYUbsqdlGO7H/?=
 =?us-ascii?Q?h7GLwQ82IrniMVcOSvFv6SJ38Zo9DQzaVqHO65eiWVLgK0dJiA4lL9mhM56N?=
 =?us-ascii?Q?6rNfvDqphVBq8jd4WBL01fyyERy0DtjmSBu8gkWPhiESomc4Y4+ViQuOlHKW?=
 =?us-ascii?Q?R3USWF+erQX7rlwjpWTGFSeiO4YqDplQCqIDYSzKxZE5N15/M/Lo+XD/fXi8?=
 =?us-ascii?Q?EDZJ3s9XAddSIsa16P1Wg2F5QuLLFnFV0JU9N+u1?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa794c4b-fbca-4cc4-681d-08db52f5c550
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:53.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpKwPgak7d2rYH0X1FIDNEbik/o/8Bxg3dJ3fDMnxoC+NdjVHqk7grK4XzLA3j+ritxp/c4o/maL+olUdP49ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
X-Proofpoint-GUID: wa3f_34T9Oeu-mnISc2Ehy7nIjQ61r3K
X-Proofpoint-ORIG-GUID: wa3f_34T9Oeu-mnISc2Ehy7nIjQ61r3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Exec transport backend for 'migrate'/'migrate-incoming' QAPIs accept
new wire protocol of MigrateAddress struct.

It is achived by parsing 'uri' string and storing migration parameters
required for exec connection into strList struct.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      | 58 ++++++++++++++++++++++++++++++++-----------
 migration/exec.h      |  4 +--
 migration/migration.c | 10 +++-----
 3 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index c4a3293246..210f4e9400 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -39,22 +39,51 @@ const char *exec_get_cmd_path(void)
 }
 #endif
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command,
+/* provides the length of strList */
+static int
+str_list_length(strList *list)
+{
+    int len = 0;
+    strList *elem;
+
+    for (elem = list; elem != NULL; elem = elem->next) {
+        len++;
+    }
+
+    return len;
+}
+
+static void
+init_exec_array(strList *command, const char **argv, Error **errp)
+{
+    int i = 0;
+    strList *lst;
+
+    for (lst = command; lst; lst = lst->next) {
+        argv[i++] = lst->value;
+    }
+
+    argv[i] = NULL;
+    return;
+}
+
+void exec_start_outgoing_migration(MigrationState *s, strList *command,
                                    Error **errp)
 {
     QIOChannel *ioc;
 
-#ifdef WIN32
-    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
-#else
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
-#endif
+    int length = str_list_length(command);
+    const char **argv = g_malloc0(length * sizeof(const char *));
 
-    trace_migration_exec_outgoing(command);
+    init_exec_array(command, argv, errp);
+    char *new_command = g_strjoinv(" ", (char **)argv);
+
+    trace_migration_exec_outgoing(new_command);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
     if (!ioc) {
+        g_free(argv);
         return;
     }
 
@@ -72,21 +101,22 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
     return G_SOURCE_REMOVE;
 }
 
-void exec_start_incoming_migration(const char *command, Error **errp)
+void exec_start_incoming_migration(strList *command, Error **errp)
 {
     QIOChannel *ioc;
 
-#ifdef WIN32
-    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
-#else
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
-#endif
+    int length = str_list_length(command);
+    const char **argv = g_malloc0(length * sizeof(const char *));
+
+    init_exec_array(command, argv, errp);
+    char *new_command = g_strjoinv(" ", (char **)argv);
 
-    trace_migration_exec_incoming(command);
+    trace_migration_exec_incoming(new_command);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
     if (!ioc) {
+        g_free(argv);
         return;
     }
 
diff --git a/migration/exec.h b/migration/exec.h
index 736cd71028..3107f205e3 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -23,8 +23,8 @@
 #ifdef WIN32
 const char *exec_get_cmd_path(void);
 #endif
-void exec_start_incoming_migration(const char *host_port, Error **errp);
+void exec_start_incoming_migration(strList *host_port, Error **errp);
 
-void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
+void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index b7c3b939d5..6abd69df8d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -455,7 +455,6 @@ static bool migrate_uri_parse(const char *uri,
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     Error *local_err = NULL;
-    const char *p = NULL;
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
     SocketAddress *saddr;
 
@@ -483,8 +482,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
         rdma_start_incoming_migration(&channel->u.rdma, &local_err);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
+    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_incoming_migration(channel->u.exec.args, &local_err);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
@@ -1701,7 +1700,6 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
     SocketAddress *saddr;
 
@@ -1740,8 +1738,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
         rdma_start_outgoing_migration(s, &channel->u.rdma, &local_err);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
+    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, channel->u.exec.args, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
-- 
2.22.3


