Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A63E3197
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:16:44 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC88x-0006Iy-LE
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85W-0006Lo-4Q
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85U-00041W-Ch
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:09 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBWWm018324; Fri, 6 Aug 2021 22:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=OKKOuV3blUX4dsrfiH5BTzFtFcC9xu5Qop+ku8LKBiw=;
 b=ekJRT6JdsidLMDjR9yT8I4dvXaZ/8De4lKyjBJbi3QqbyhLOvBbH2K1Q9vE5EHfC6TjT
 lcYEfY87iuUyOWNdvbLsQiAu2VNZB9X4Yi4OU+pbmRDN702Y13Ge/eWLv5NuCnzmlRwQ
 /qX9hXn+kL/l9leKbKyXs1KVdr1kWqfTPvETcdMPVgy6tmxJYow2BXIv/LzY7oC9+euL
 Zcma1SDqagXIxxc36gk4oloYTw5zXcfLHkX5f1cUP4OaqM7yBQJK62QL2pS0NmldVVRl
 Vjy9yZAQo3HBOceKybE/VlAcPuKs8kVC3mKXdptw0ko3nC0lw4T/X63mFXPAQCglfYJP HQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=OKKOuV3blUX4dsrfiH5BTzFtFcC9xu5Qop+ku8LKBiw=;
 b=ShkgauHJBmpLPKrNAhyKhO32WmY4KkjRZZvJJoMUPP0Sr9ySkGiSisPmwSzf65XseTk9
 4k9TlBQA7XFAFyrmR8+o3Xv3fZ/1j0zSNdswkmzBmj10H+c1YIZ/0lOi/hoXH2r74PPr
 sbxzipeJCEdAPr/n6Gzvy4EUxE6ZrqcR1ycjQNCtvpZEt/h7D01MhilTPF75KYIXolaE
 KPvOdaMbXMNX5g1V0MxQ1oNGPrJHjsXCxowWJRz/+le04uH5sJErU3Df3V9szrQEjLu8
 wqEHwGTAn6QafHxGRXaWFQpiTudPYIHlFiJ0GbLZDdddqPdTer23gntdg6DrVERhDdjw wA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9645s12n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBm93032743;
 Fri, 6 Aug 2021 22:13:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by aserp3030.oracle.com with ESMTP id 3a78db75d4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl665pDqxwM0C0jOkma4sgTZHrkzKLHqP4rdEKs1BdllWJaDINZK/7nQcOVLsObwYKy51LAWPoqIPwseV8PGBpUNcYxIw3Io2h+9Cku1Ua+mZMGR9xFBOzb6it4jvvHLnABvDrrbRGW5QRohMHgqNXbwB0QsHNHPFcGJPV8vo5H6VBxoON1JkuJLeA0CrsMoiGSOnRVzMWosXU4nKjtuX2YMM1hN/Ql35HjEL1YeRuzYetLfLj0YWm6qSrYtWrSyFgeybl+4QwRHsccTLmYeMgQ9D+SVRxfKrQSoJhhh0MCvF8TBGoVBekGq7dgUH9OWf0fOOkcbjRCiLuqV0EvHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKKOuV3blUX4dsrfiH5BTzFtFcC9xu5Qop+ku8LKBiw=;
 b=XRmrkCeHp6Od0B0IxypiGPefzuFqtQu90sftNWK/htthQ2Q042sRTaPHx0DphL6OPTQ6W+CWhpKeba8M+3rXBRQfnRjfQ1X8kQE99rSSc0MgZ+AorT9mEq9RwwfD3L/WBZ77nbZ5hawR3pj5f5odJVksHlS8alz7+KIWNQj9aYb2IKTarYDnwHE0QsZQtWri5ktg1ep4XQzrW9VhMZnyB1utJ4qxPvj8e+VJkxK+MZ1I1HdLLX8H9SVnMkkLk7TlEdNckUnqILUB36sZcyHvHV/Bbt85UXfHdbC9xWHOLJvVjbYguuHaajpzVkJiZZSWbJGg55x2SiEI9PZIt/+clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKKOuV3blUX4dsrfiH5BTzFtFcC9xu5Qop+ku8LKBiw=;
 b=0UTUR7ZFhOlMB6Aje5QPaOQETBpYtE98BacVFUzEe4ntCB6/Ltf+23VY8N40KG6tR+YZgnRXhE573ob6LBE491uosFbQJBPX2ISBrXhzCGnEfDz+AwYb9NrAmcZLvsAN50zfFjbIxnZSrY8Lnk8KOtFHumeiJ8FO2XSjO/reO6c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:13:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:00 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 04/27] migration: simplify savevm
Date: Fri,  6 Aug 2021 14:43:38 -0700
Message-Id: <1628286241-217457-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:12:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5952da8-651e-431b-fa7e-08d9592759d1
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB43244B9C6A4D98F538B9D8A1F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsEIcs1jn8G8zgzfmUUz/7t8xxXA9gxY4GeSycMduw7rgb2iju2Q1FGS8jXN9sTDlvjfo3WJRMPbbQjSrarUY0z1UZyV3O0CXSvaEImg8JZQG+DJHBDRfygCAzpNEByYW3B+OQE3OZheyg9IcCuACAix27Sv8KwDWTStpLzclNsUc4zXgn4Shoq7xkWAlHxg+RfgTIGbCFi0lToFPiz4Axjx7Md7Y2pdknf3L9W3oxcfPghQmSn9QW6B7lcBoWCSCX62IH6EznB/jDNfQnruzMdWQlVPkGYbQ8PpVH9JDLJYJuSU8Oq9GiOe8OwTz4E3rbjS6veTARmN6xkuWRJojVVMR7IfpP1BZKJfVO1LyGxF0edLaY1e1/1zlDJkoWteBpq1JuNyLL9XIVR6P8xffMgM6C5HwKVXniykb7Vcw0ScRF++JmYEKANySO5X+KAG/uXnWi4plEDZnqVX7GHJFZPD3ACPHcYdAvqowYh8KhLl9tHfxmJnkfVQWNapadu1c0E1MUQOwsDvmBTEnjvMX8uFtOq7G3FJG0rIXMjFCkT7ZVC6sZufsV59o+Crvvfr8ECUmDc+B/mg03NPO4WO+Xfdyd02qz+9J3iS+jEY2QpGm/53zM8FGCx/tctVQqU9peRVM0JY20mm4DTF7arvvFCkRZaRyrCzp0k0HW+TEBnIQ4gZr65PyzxDqZ1VGEOq2YxKorxD4Al1COvTqL1Ibg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMMlaF41rq63jF7rt4UpURAmE/0+ZtolNcCHf7gx8kIkF/BoBt8a9kHXEo9r?=
 =?us-ascii?Q?ICikEw7a/JORYhuxdGhZ1na4Iy/KQaE1mmzlaJJhfsMTUzZpnjJjfKNIvK5R?=
 =?us-ascii?Q?7Aw75DEeR3i6WXLnhLXbK5sF9cwqbLZbqd3Aqn+tPGvmwywcQMwFkdunq9Xq?=
 =?us-ascii?Q?zb1X3Sij3afZmwpNg/PNPiD7lZXsmUngwCjMuTnGaoYyerOfo5ACAYIx4l2L?=
 =?us-ascii?Q?acG4OPjZFcQoyAjewnwtdrxUpWqnKc/3sLPEj7+8nV4tZRTcCAB9jFu2/OZB?=
 =?us-ascii?Q?2kxCCJAhMxA3B/+pxlCxiU6kv5k4W4oU7RFluzDoA0Ezs0M3HoQr0XUS+aQL?=
 =?us-ascii?Q?fNINUYIDdNnVx2CAHlVuXrmdB5YJ+smGvsYV9drU4FxwnxLOrB+xiOZamoQQ?=
 =?us-ascii?Q?TivshdCy8H9qXcxP8rPlE2YyXK/OR182qT/iUCW9+sDbPqie8ZuVbA2AOZ05?=
 =?us-ascii?Q?fqeM+r3+5u+krHLK207gR3b2mf/FuKqHbRxXc+lB943q7aoKMAdbTNQ7De1z?=
 =?us-ascii?Q?bZJRy/FTu58wejRoDnurL/y20R5FKbdQgNgq6NUzLfkXpWD2Cvwha53jS10O?=
 =?us-ascii?Q?T1ntUB2y5/BjjewsiV2gY79NkE1CiibW7Et9bMsIAxnbymjolX5ZQcHNPw9l?=
 =?us-ascii?Q?L87DrjbyA2ak/HXkvJ8ImOyuC9vg9xpSfQCDjbSXh4YdkbDhf82Q1OsixwTL?=
 =?us-ascii?Q?G83ocN9rArpw6AtROowTtGv84mikWK1Fjx73emPyw3CUWYme0mXQvZjk2MAQ?=
 =?us-ascii?Q?4cDwQ5QZGnLvsIIMvdiB4f4NU1FpdxkZJiom2gTYE3GdwfcCQ1JydhJRdgVv?=
 =?us-ascii?Q?Ucv1sJvh46cNczIC17V2gljlJWwce6HZo9SqE4aFe6k1hfUXRHAt8mmqitve?=
 =?us-ascii?Q?K1Q3Iy7A+9qIiZs1zSu/p/DGPXoH6GrJpFAHvGJjhMkUSe13SUudvWjpz6sJ?=
 =?us-ascii?Q?oHA434GqhUj30JvPy9NypiwVKGZC/LhvHMazQhViJGx+Mz1YXGwQWIMm2YjM?=
 =?us-ascii?Q?cYgY8Y/07VzcFOKP8dSRQ8FKcqAjG3YZ9JVk8UhSJNDp2GlXfpHpvTPzEPIn?=
 =?us-ascii?Q?oPBmJ6xNXH//vWxj5q7DXKV33Y4sROQQ7UGvSp7avzLm1JbT9hDCHRIGYEn7?=
 =?us-ascii?Q?LGHRHCLoAWJ5D09/rV+eh3Ql+lzwnNW7HSK42gtteVM5wJK+BbPKQOlNjEPz?=
 =?us-ascii?Q?7bdLBCBMt+qonHxBHNC3qjFfWdpjJP0BKtx+5W6kI5kZaWFljQM6R2On3BXF?=
 =?us-ascii?Q?0waxJ2KrAFyiQQXZ6e+xxDqjRz4WOP9gVaC9cRTrbmcNzNh/9l1WTj7OdRvO?=
 =?us-ascii?Q?yQkqEcIXgbJmjuR8nI9TjggY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5952da8-651e-431b-fa7e-08d9592759d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:12:59.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNgDAbqwAtYsZjKGLFfCo2vnYb5HQzkMVibyWUnaBzJLbNKMfUrkXkf9I00Q9g5VNXfwvQ2QM9j+c2mamRbsoK7bCzoKYc3cNzEBCPbjKV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: 8PoFNYjbAx-WmGet1ywroJUloDRS79Jq
X-Proofpoint-GUID: 8PoFNYjbAx-WmGet1ywroJUloDRS79Jq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_file_open to simplify a few functions in savevm.c.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/savevm.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64b..bdd6ef8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2908,8 +2908,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
+    int flags = O_WRONLY | O_CREAT | O_TRUNC;
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2923,14 +2924,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     vm_stop(RUN_STATE_SAVE_VM);
     global_state_store_running();
 
-    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
-                                    0660, errp);
-    if (!ioc) {
+    f = qemu_file_open(filename, flags, 0660, ioc_name, errp);
+    if (!f) {
         goto the_end;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
@@ -2958,8 +2955,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2971,14 +2968,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     }
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
-    if (!ioc) {
+    f = qemu_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
+    if (!f) {
         return;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
-    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
-
     ret = qemu_loadvm_state(f);
     qemu_fclose(f);
     if (ret < 0) {
-- 
1.8.3.1


