Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FE26904C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4AM-0001IG-M6; Thu, 09 Feb 2023 05:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AK-0001HF-O8
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:32 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AI-000821-97
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:32 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3199XZqU011953; Thu, 9 Feb 2023 02:28:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=GBSO7QCtnFFj06LHVXpnPu60KGbCpxRzvp7/6VXbgtI=;
 b=16i182RFdQen7HyF1IxMSMpwx/DhCBzngI3qh1sngAxaVsZLCP5qxeBuEx44TVkxdSpY
 U2sDVLOr54/0u5QvkioYFvu7ml80XQ/Jlr4KbGKNTpYruQ32dtQKw9bV6M04bv18oPlE
 5yUNDHuByJkgDPVP/I1zFQj+TiCuMq4CbwYLmzl2FI0xgOH+ewVcAYF+ooMjj/Tp4jIH
 wiZvWKnvJaAZpnkeKTIwTPQt79OOvBgW/1CibCURUtvmQr3PAE3KgkR9gFFYQfEE8Fea
 PyqHAJaJG3T89Yxw9nCTq3nG3wOEb11cayLul1XZeMmchzmcOZzWRZsYBmJ4FvAmXYDU 3w== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4q2ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnIOtmmfQGi75UJuarEciK34FBIx0A1V7rz39lbVeN5uZe3BkZ/5Eq05yVQg/V7yAHRGLhBFuHJr98ds4lC8OF/lYqE9sczP4nHAkN2FKoA3TptYDOPPRAnWErPFE/Gc2VY83ileWcq9yiRtX7+uh+E9N4YogQIrYBE6Ki8CZ4vLL1EoAlfnc09a5qABAwF/XpMwE8xcjtjvICS0yeEdZXTiC9Ppl2d3V+6YTIcHvUt9ctpkDYFrzyqvuMw3uU9z1X182u3yLDxjRZ8pCkdRFjC3gdPsZu7F5abiceh8GR18t4cocKyOQ4hdSIRCVQ0pqvvxnPF3ZVsMQUuy3lIQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBSO7QCtnFFj06LHVXpnPu60KGbCpxRzvp7/6VXbgtI=;
 b=BPye2OimQL73iHcZc+fW9FsFDZmPiq7GPcTEkPyWER7qa4bU2U4Fs5AiQKufScBNOVFd92vLjLJq2Wx7FuCytPsJbLUyL0ofhvmpsh/iYnvfCA3gHFdd0XtgPk0Zz23iDUFoJJjeCcXFZPZrxeEH5Ok39HyWiZpwTnvBQnVGWOdGvwH9LZDdkcUYwtEuN39Ljn/9Q6MrMdtryZbKZK6YfsEexbvOmj7O4hN77suZc8M8ybIJpX7Gyj4aKfkcCnCaZmLbAkSwEKC1jU4Wn0X0IciMgPCZ6SIgHrdMJCrDvw+EWLdYG9/v8tDmkiSutY2ksuTTwdQK9YyE8Dxw+HcHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBSO7QCtnFFj06LHVXpnPu60KGbCpxRzvp7/6VXbgtI=;
 b=zBoVyUlz3bpSEh3nQXWhnqcQVpNXjQVyVfCnoBpQofGnMo6YLyz4u9vchCyJ2bEBc8VrmfQQSC4/RmagU3kSwwXDcgUBYEtk8Y8F84zLePEP/02iHqSGvlZkAPwHqXUCQ8KjvLqbH3lbZ31GNG+y8HD4qMcmDVXB/vqO/jHYVGcJM9Q5Lt77+FW9Kw/3i9HcQa+JOvbZQqZWC3ihrEe6JRRXEUBj7IzkiikfmqLirM0ttwiTWRsqnr2K/EsyMFNEFKB1kIMgl0NbYf8fno5msLICUVChfiPYG1tW/IHtIzhMer1kCZXLu6ssljGVsfRkxMNfIqDqDUL28MiVAzF/sw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DS0PR02MB8928.namprd02.prod.outlook.com (2603:10b6:8:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 10:28:06 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:06 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 4/6] migration: Avoid multiple parsing of uri in migration
 code flow
Date: Thu,  9 Feb 2023 10:27:52 +0000
Message-Id: <20230209102754.81578-5-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230209102754.81578-1-het.gala@nutanix.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DS0PR02MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: fa02a491-44aa-4079-9483-08db0a8854de
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSv1ZmUbAr42Myas15oMdF3NgI5o/pjTd6+9wqVuOnRzFx5SUGLdblBT89S3U8A3ht9F96ba1dCi7VYROPC2NqaeSQANkGVcAFg54hEzJlkiIE/pAiI6tcG/+g4f5U77nGnf3wLTYC8KvfKPGbAMYZb+K7ZXfwI6Zck/lPfXcr3bkNkMw0eaDyBC0VlKuJnqVvUa7qgXcbJu7WZGVrcrTPKBvYG2rxSQJ8ujdnbaI/Em9UySGCQbweaHFIBnhYrtAMwpi5v7sCVjd6Ux5zfrUc3QwB42FFiiRxmuaWBLvZ8rNuXYzgVtuYfZ4u1BKEk1FqCkLkSgd3hNSclrwz33s1oBkRtFSzoq77ckMTs2ro178gxJOcncbeJsrlBBf2txbI/+LCl9WS+bVDW2ffYZUktUdsHuKvNKw3yNmWc44rHGlfgrqSbRPDblONqmVGLgkHjpvsnaNKDjQ8hM/D+UcWeFwFNfvD2JPrX1swNM+DUTCjxkf44RVRiVPNtlG+ZvpvsXDwff1ZMDGOQYzowK5iaagYYdwVR22WDhspg/eZFHwjg5IwXe1esiOAUgyKgtHctIOl4d6W38+v6VE8JeMTl+7n32QQld0RGcSc7xfN9cpgHWtc1uEdWzU2sHkBeaAIT9JV00fpYQsdUUGMri1CrKykqpIRPKczVRfZvgvyX+eVwDiAexCPyk9WsRpHEK1Qlr2CCIcvlVwB6PV9g6bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(66476007)(38350700002)(83380400001)(38100700002)(8676002)(4326008)(66556008)(66946007)(26005)(6512007)(316002)(6486002)(6666004)(107886003)(1076003)(6506007)(30864003)(5660300002)(186003)(44832011)(86362001)(478600001)(41300700001)(52116002)(8936002)(6916009)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxfjneqj7D3wp1Gjw8PGfB8P80OFpVhlI1v6Jj+B5Rx2++ymvOIkzKYniX4R?=
 =?us-ascii?Q?lpqtFQ24lu4RpawLm07+CmzLtHpkHoGkSnVkTkAdQHatACyOAGxPRfClYKSq?=
 =?us-ascii?Q?BwjXu4Oa/IwrbLm/NG8qq3eNPD5T8eAynzWpROCiWNB7h/GjPFmtqe7Lqwnf?=
 =?us-ascii?Q?PNUtUmn9Gr5a0V+MJ4IcjvgRIPoT0SjhGSUxV8jI84skaeAK3KlzKvSMbAn6?=
 =?us-ascii?Q?mRx90T6m2Ot9SYuYqDZzgRgm4A6dd32MDOaLFClP7YfbBobrXsp6ps+PTXgD?=
 =?us-ascii?Q?cf0KTw7Tl+Ww33Ha5GQYSAw7VgLwgmycSFkhpuKeARmT/tyCl2thyEREb/sv?=
 =?us-ascii?Q?uVZMAB7MdWzqlwLZ99gvPm3rmNKnwEZl3H0HRD2OQZZ3ohcDmHeSK07UK/K2?=
 =?us-ascii?Q?7rDWvH3ILdhS03Phgjadp/LDPuViqsp8OqesR2fUo9yz7QJric1fYo6GZN4J?=
 =?us-ascii?Q?Y/v8hx1orGspF0EF5OGp/TSh2JZQiKI7pvsgeLlMKQAODFtPB1hAcPAz200N?=
 =?us-ascii?Q?ri2+jeKHCUPc1CXCIVCMoW1+uHFAHVeT5YuEBTzIoWARkdZlQ/9JAJwXNRmR?=
 =?us-ascii?Q?qufHo2fCUrt2TCnCdrOCn0vgOkcQDllHxyauJ6SGUjThNFmZGD3dKLuuKttP?=
 =?us-ascii?Q?O1cVd7w2kUYjFIWZGFvdEN4qJkQCjLGcYgnfpVoU7NDbgWOfMtPuSRGFAiZ3?=
 =?us-ascii?Q?EC6V5u+SaScAcFy97RMQ/6Ow5YbYFLnBGikMiQftsEmzMpj1tSME0uM8bOjG?=
 =?us-ascii?Q?4zu0i5/+HjuYZH9IF1pr/4vUhw1VL/0TS9Hyp4kHmdryzQ2Vcep94SSIdiLR?=
 =?us-ascii?Q?vPnuJZ8uX4/vNCv94Lk6nI0JD/XZANwFjc2I9RnE6uDKNZlI3g4FRtCz0JHG?=
 =?us-ascii?Q?KOKrvbKa/aZ074aU7TVBkwFP/U/eqciLtFmaSk5+/oKXBg/M4JsbWFhVMvJC?=
 =?us-ascii?Q?WY1YlEzQs3AVRSbCmdcg3gIQwDfhMXM1lNSjaXP1+2pC8Fbkq5zIsvvliVPl?=
 =?us-ascii?Q?rBuJDVyxf/9bB1M0/x2OVSKGEryhgMYzG7JLtCY2sw1PTgz+MnPrPtgrJrRp?=
 =?us-ascii?Q?L2hqu3dkD4IaOOQTGtCb4IpRK71Kzi7aWYvR8ZC9XgEUwO8ZE+CicqMx8Op+?=
 =?us-ascii?Q?54T7ySs9K5H22DPwX95R2Oo8m7gSi+iMd2o77A7giU1xVrddUxb5Jp5HHXq7?=
 =?us-ascii?Q?rdLAxKMLG1QTOwig9APeNcN036BizSUefwp79i971uCVE5AwZcU8pT7ONLWs?=
 =?us-ascii?Q?WOBLN7v2UMwCfBRhiYTnV52KG9bU+hsRNqyxZ2e1BwVGCDR5Se6XiGCVISeP?=
 =?us-ascii?Q?VO3lI95ss+ceNUJ+9RxxR+nzpio+G0Xu5XUkmEMlc9MW68o2Z64eC3057H3J?=
 =?us-ascii?Q?mW6Wt4shvjRPW7mutoVRPbEHOiY7Lm3uPYrsS5ex9vl25uVhNjrlqcJBMkQF?=
 =?us-ascii?Q?FuP3zcTfJBGz06+MXgYhjgCWH7pug91Bb+x3Wlo5kQ2c/+LEyHlRyapc72n/?=
 =?us-ascii?Q?DjUu1EsVlnBoj5uflUn2qqE0Sjmo8k5b/0/g2ie9hpW3aiQxj3D0apb16EFt?=
 =?us-ascii?Q?yJ7FA213a34giitUqbnLnYJ8LYhC0OOe2eBBMdUAUrzxtG012Ume6F5zsO9c?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa02a491-44aa-4079-9483-08db0a8854de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:06.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6KBeFcq3ngz4XBt7GfrivxRJL++hmeqh0GxQP9DKWvD4OMR1kA4IbnABUpg9qF7zdKk0Y61GxIVU9xpQynftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8928
X-Proofpoint-ORIG-GUID: aS6UQOEz9AdcGCNcOiNWFI0pIe-AqZYA
X-Proofpoint-GUID: aS6UQOEz9AdcGCNcOiNWFI0pIe-AqZYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_07,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In existing senario, 'migrate' QAPI argument - string uri, is encoded
twice to extract migration parameters for stream connection. This is
not a good representation of migration wire protocol as it is a data
encoding scheme within a data encoding scheme. Qemu should be able to
directly work with results from QAPI without having to do a second
level parsing.
Modified 'migrate' QAPI design supports well defined MigrateChannel
struct which plays important role in avoiding double encoding
of uri strings.

qemu_uri_parsing() parses uri string (kept for backward
compatibility) and populate the MigrateChannel struct parameters.
Migration code flow for all required migration transport types -
socket, exec and rdma is modified.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      | 31 ++++++++++++++++--
 migration/exec.h      |  4 ++-
 migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
 migration/rdma.c      | 30 +++++------------
 migration/rdma.h      |  3 +-
 migration/socket.c    | 21 ++++--------
 migration/socket.h    |  3 +-
 7 files changed, 110 insertions(+), 57 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 375d2e1b54..4fa9819792 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -23,14 +23,39 @@
 #include "migration.h"
 #include "io/channel-command.h"
 #include "trace.h"
+#include "qapi/error.h"
 
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
+void init_exec_array(strList *command, const char *argv[], Error **errp)
+{
+    int i = 0;
+    strList *lst;
+
+    for (lst = command; lst ; lst = lst->next) {
+        argv[i++] = lst->value;
+    }
+
+    /*
+     * Considering exec command always has 3 arguments to execute
+     * a command directly from the bash itself.
+     */
+    if (i > 3) {
+        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
+        return;
+    }
+
+    argv[i] = NULL;
+    return;
+}
+
+void exec_start_outgoing_migration(MigrationState *s, strList *command,
+                                   Error **errp)
 {
     QIOChannel *ioc;
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
+    const char *argv[4];
+    init_exec_array(command, argv, errp);
 
-    trace_migration_exec_outgoing(command);
+    trace_migration_exec_outgoing(argv[2]);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
diff --git a/migration/exec.h b/migration/exec.h
index b210ffde7a..5b39ba6cbb 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -19,8 +19,10 @@
 
 #ifndef QEMU_MIGRATION_EXEC_H
 #define QEMU_MIGRATION_EXEC_H
+void init_exec_array(strList *command, const char *argv[], Error **errp);
+
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
-void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
+void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f6dd8dbb03..91f00795d4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,6 +63,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "qemu/sockets.h"
 #include "ui/qemu-spice.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
@@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static bool migrate_uri_parse(const char *uri,
+                              MigrateChannel **channel,
+                              Error **errp)
+{
+    Error *local_err = NULL;
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
+
+    if (strstart(uri, "exec:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_EXEC;
+        addrs->u.exec.data = str_split_at_comma(uri + strlen("exec:"));
+    } else if (strstart(uri, "rdma:", NULL) &&
+               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
+        addrs->transport = MIGRATE_TRANSPORT_RDMA;
+        addrs->u.rdma.data = isock;
+    } else if (strstart(uri, "tcp:", NULL) ||
+                strstart(uri, "unix:", NULL) ||
+                strstart(uri, "vsock:", NULL) ||
+                strstart(uri, "fd:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
+        saddr = socket_parse(uri, &local_err);
+        addrs->u.socket.data = saddr;
+    }
+
+    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
+    val->addr = addrs;
+    *channel = val;
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    return true;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
@@ -2469,7 +2508,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
@@ -2490,22 +2530,29 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
         error_setg(errp, "uri and channels options should be"
                           "mutually exclusive");
         return;
+    } else if (uri && !migrate_uri_parse(uri, &channel, &local_err)) {
+        error_setg(errp, "Error parsing uri");
+        return;
     }
 
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
-#endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
+    addrs = channel->addr;
+    saddr = channel->addr->u.socket.data;
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_outgoing_migration(s, saddr, &local_err);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
+        }
+    #ifdef CONFIG_RDMA
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, addrs->u.rdma.data, &local_err);
+    #endif
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, addrs->u.exec.data, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/rdma.c b/migration/rdma.c
index 288eadc2d2..48f49add6f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -316,7 +316,6 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
-    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2449,9 +2448,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma->channel = NULL;
     }
     g_free(rdma->host);
-    g_free(rdma->host_port);
     rdma->host = NULL;
-    rdma->host_port = NULL;
 }
 
 
@@ -2733,28 +2730,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
     rdma_return_path->is_return_path = true;
 }
 
-static void *qemu_rdma_data_init(const char *host_port, Error **errp)
+static void *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
 {
     RDMAContext *rdma = NULL;
-    InetSocketAddress *addr;
 
-    if (host_port) {
+    if (saddr) {
         rdma = g_new0(RDMAContext, 1);
         rdma->current_index = -1;
         rdma->current_chunk = -1;
 
-        addr = g_new(InetSocketAddress, 1);
-        if (!inet_parse(addr, host_port, NULL)) {
-            rdma->port = atoi(addr->port);
-            rdma->host = g_strdup(addr->host);
-            rdma->host_port = g_strdup(host_port);
-        } else {
-            ERROR(errp, "bad RDMA migration address '%s'", host_port);
-            g_free(rdma);
-            rdma = NULL;
-        }
-
-        qapi_free_InetSocketAddress(addr);
+        rdma->host = g_strdup(saddr->host);
+        rdma->port = atoi(saddr->port);
     }
 
     return rdma;
@@ -3354,6 +3340,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
@@ -4152,14 +4139,13 @@ err:
     error_propagate(errp, local_err);
     if (rdma) {
         g_free(rdma->host);
-        g_free(rdma->host_port);
     }
     g_free(rdma);
     g_free(rdma_return_path);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-                            const char *host_port, Error **errp)
+                            InetSocketAddress *addr, Error **errp)
 {
     MigrationState *s = opaque;
     RDMAContext *rdma_return_path = NULL;
@@ -4172,7 +4158,7 @@ void rdma_start_outgoing_migration(void *opaque,
         return;
     }
 
-    rdma = qemu_rdma_data_init(host_port, errp);
+    rdma = qemu_rdma_data_init(addr, errp);
     if (rdma == NULL) {
         goto err;
     }
@@ -4193,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
 
     /* RDMA postcopy need a separate queue pair for return path */
     if (migrate_postcopy()) {
-        rdma_return_path = qemu_rdma_data_init(host_port, errp);
+        rdma_return_path = qemu_rdma_data_init(addr, errp);
 
         if (rdma_return_path == NULL) {
             goto return_path_err;
diff --git a/migration/rdma.h b/migration/rdma.h
index de2ba09dc5..8d9978e1a9 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -13,11 +13,12 @@
  * later.  See the COPYING file in the top-level directory.
  *
  */
+#include "io/channel-socket.h"
 
 #ifndef QEMU_MIGRATION_RDMA_H
 #define QEMU_MIGRATION_RDMA_H
 
-void rdma_start_outgoing_migration(void *opaque, const char *host_port,
+void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
                                    Error **errp);
 
 void rdma_start_incoming_migration(const char *host_port, Error **errp);
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..c751e0bfc1 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -27,6 +27,8 @@
 #include "io/net-listener.h"
 #include "trace.h"
 #include "postcopy-ram.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
@@ -107,19 +109,20 @@ out:
     object_unref(OBJECT(sioc));
 }
 
-static void
-socket_start_outgoing_migration_internal(MigrationState *s,
+void socket_start_outgoing_migration(MigrationState *s,
                                          SocketAddress *saddr,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
+    SocketAddress *addr = g_new0(SocketAddress, 1);
+    addr = QAPI_CLONE(SocketAddress, saddr);
 
     data->s = s;
 
     /* in case previous migration leaked it */
     qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
+    outgoing_args.saddr = addr;
 
     if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
         data->hostname = g_strdup(saddr->u.inet.host);
@@ -134,18 +137,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
                                      NULL);
 }
 
-void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
-                                     Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
-    }
-    error_propagate(errp, err);
-}
-
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..95c9c166ec 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,6 +19,7 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "io/channel-socket.h"
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
@@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
 #endif
-- 
2.22.3


