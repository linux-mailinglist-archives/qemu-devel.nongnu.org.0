Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25243E31A1
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:18:51 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8B0-0003kU-SI
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85b-0006da-M6
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85Z-00046D-RX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:15 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MAeTS021384; Fri, 6 Aug 2021 22:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/HJjJf+osY2cyH2B6d46XwgkMBhpbaOfvBv/6BgNASE=;
 b=rEQkelBPxm9DIys3yeJv5j1bgkL4bcH9T+iXIuwMJzGixw2cxXarlYZjR05mU04Mgzkm
 eHPuqjTx5CqOcO8YeLWd/tA+TKhRUceGq9GxsdGZI+RJGkdowzzyWviTnRzwUbMl+IKx
 UWz4/gPE9TSmjLIF8N9Vrf+tZd7huXKMxL82G9VIFGf4LLXAa6Aam0nACoJaUOIoxM3H
 QVcL1RuDZAukptgGTlNXJP1qvLXrWUGYlwErEoOH7OTVRxIDljUyz7ol4iXZWP+RdFbe
 vLtiqgDoH9L4CCj5OvbsUBvMSGFtI5lx0u81W4zPnxT3yPKBc8f7JAPkRctP/4o4eIlR 9g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=/HJjJf+osY2cyH2B6d46XwgkMBhpbaOfvBv/6BgNASE=;
 b=g47UYOa07OGCI+u6o/MvVVXgj+S3uE5O49q+a//++OZSR2UsOYHnjqv6381SPlHvjnz0
 zMUGYUclSDlyADMP9DX5dxIOGi8ojdnVTzNtUS95qxbsBaXpBt5bd5WB7FNWEK9btRDP
 iZKt7k1m3zzJdXbFpEI2SI8eGltbcUcrRr0PE6OwdtRz1wGJ7WK69kuFC5tIibDJsVDj
 fNaBnNdVjpqvJj74DOmp0ndcKHavUXp5UYM586mv6GFR1KrH8djYcGQLiogPBzO2poo0
 JQiK+lmU1l8kNqYuX2UslLPwimwIEkNtnBYgTEdNY3Ays/c2GCnxiC9pzHfs18HN6Hk0 8w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a97hqgrmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBmge032742;
 Fri, 6 Aug 2021 22:13:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 3a78db75g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kT5H2WtrwD2LScYEq53dNN0EdPMMmrDacp9wCwfni7B8ZKBWj55rTZq9bLKCrw3dgw9HCd0lUWVf6SSIqqh9Wa7BOBnzbJn2vI6hXpmhgctamSiH6stkni8odA6GtHxUghL1rMCw3qphH+44DAUqS2z++e4KHFqCC/7jxmIqGS7sT/eboQlrmwMRH9sxW3XhdjJWS/h2AMc3XujzxAs678x2fD8Cbn7Ls4k6Z8j/L4K5Dpgi9CzGjsrRnUIrAxVco/avfwdWCv6xlHEQxIlr/Kp9cVVpdz+yzGZ3ksPgCgp5SW09So0gzjlUH53+YyMSL1Q5Ct9n+ksFCZTkBjP+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HJjJf+osY2cyH2B6d46XwgkMBhpbaOfvBv/6BgNASE=;
 b=fICjIUkglO35ycpJwbfWjxkUVjQD7Ak6CfkPfLRS+EODMwrSTg304VULmWq/BGXeObuhH+b9EXPDNBcBVDNrrkorCMVHTaGOInc9/ivcMeLDLI6b+B2wtbB8EeksJ5J7TTzJ9rVdPSoMGa1SgOlON07B3l0lW9h01qqwWQlzzj/GeQBwVSDhXiWW6Avki89AZ+Lc6qVRkLBTquNXf6WQ92hvGKWM8D/gH9fPhuMRNedI2PHiJKoSWuocqHnSs0bFjz3ImI1/4gTYyx23oZD2PDlwU9PEwDBsynv5wUAKQxwD8QZKMzuckhzdrbmChp+hkIk3MrmF3dheCAE7OElnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HJjJf+osY2cyH2B6d46XwgkMBhpbaOfvBv/6BgNASE=;
 b=s5UeedkpDibr5VjahNVNeLSlT52YaTCKaXH65KH+ROZEDmBxRwgVe2rXsr6lxNP4utTINr5dPnzkZXu2y/W7HmcAHHlTU2JWzilTAHLmNDn7mWxXbgxbNmAAebubaIVDV858/4EtGclx8SXi8xHhoi3TkwQSRZxxm7KbJoxPySY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:13:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:05 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 07/27] cpr: reboot HMP interfaces
Date: Fri,  6 Aug 2021 14:43:41 -0700
Message-Id: <1628286241-217457-8-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a88c685a-532f-4540-1bb7-08d959275d60
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324EAEF90576076792E7882F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWd3oI2bHdL+4wTcgCXK0euKQkp3Na2+9YTxYwwHVhBH4CaQ8GK/OzkwC82v7GfOByO/vpXok/yjqgNj3U8Kgss9yMj95zMO4JnCZpUTVBBRu2LZO7J9UBEL5BK8phrj1/3nujJvhZY1bw2JVvwiNSK9a7ajmm5+RQJZlk+1r1xoBSQpKr15JTcwDGgH4Xc9cMxVNOzEasZyrWrEH65ri9/nq5YLbcCUU+jzZDtJEIR4ZXbnJ5v1Sm1Nj5Xff5rxP97GS/9yN3MFJ6r+iovbWa+YolJoI88RDh19w0FqXV2DJa/n67AbZTnARpjwo0lT+h4Gz6aRs/OKNR7MH70Hz6kguU6ANfTuWaHDZpqsZ5gHL6JP1FT9aI2TFQB51T/kIY0GeHNX/5Q2QjMWIHRr7ogT9FDiH0FUfldHyvrthJ6TA1Dh+IbMwBzoSsbWwP3SBDFph6hncY7VPh9htHD8umEjN/nCHnNs6Uxf81irDtNI92tq5tQS21Pd3p1Y3vKl1FBW1VHuAKYugY9DTismPfxbLI0ZxlGGWjevDVkQvgT5eRDCMBnRBgYs3x0W5RogzzDUagor1MpxSL0R0X82Eed57Y7WwwagIcCopvR7e51Db2MXIWyi8fl18dmkKR8Cv4hH2HilJ2bB0B6EpuwNwuj0/Vjp9IIr29e8HaOQ2cXgA1GlXNuP6WP4ngGVDx2ACTD5cFknFduVkY7wwNLRtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aks/1uT99C4XImTxsgfT2P3VKd2CPRtO+Ql6qsNEPIf3raP4Ky8SMTZLrM7t?=
 =?us-ascii?Q?DXQjEvgNWmx1s6HVQcCxFazCHk6pfX04z43F8Q37nuqRHeAFMhArX/aYUoKU?=
 =?us-ascii?Q?n02Avnc2brs2vGcmReXWqOZoaBRqWl2fETvNfqqSFiiuaMU2XstHTcUlXjVG?=
 =?us-ascii?Q?/AFHqyKkvqkTQP41hO/7erLZIm92wCXKsS/2rIKKtUBmq2xWmr8tXMZG9h9e?=
 =?us-ascii?Q?GjM66b7yL2wtgoUt24MH3uza1DBlVe37/nYkPKogQB99kdOThl5b9j+3T0bf?=
 =?us-ascii?Q?L1yuy30WvcvTmZYYEsYwr/ow7XKSyYByrl5itBeRHBdfHTTG+NwcEvaYL1ug?=
 =?us-ascii?Q?mzZNZeaUP0ZFxYZY7LNT4/woYZshd1XQM1fwSzrBekdO1QiqoWjHVHRXgR0T?=
 =?us-ascii?Q?5eO85h8LU0JQLPUXxvjHK1Ai7aYpcAWPvHn7geamb/gbchZVmP++JbcNVGtc?=
 =?us-ascii?Q?o1hLBoQzPmB+FJEqhomhxgAWIOD3TVoMrINf6+duGSoYXkaEtpmE4QF5GaD6?=
 =?us-ascii?Q?iSS4QF+gg+du7D9QFNmittx6tfb1cUWFFhdlX4LCaYYt7TuY1SdTFNEZinDS?=
 =?us-ascii?Q?kEsYK3mvaOqcum4dogCCuuu9JdpUNpjrKZ6PdZT9VmX+5XkZbN6thDTe7sU5?=
 =?us-ascii?Q?0ST7qA0dtuSy7AQOKFPT9dCZBVY0KfJufiQtw99NUB1G06sF3Bmgz9NPM4Jt?=
 =?us-ascii?Q?WlMjm43u7ni+ch89jSaLBz16V1UP3QaU/iNLIdNkMN2ahwS13yVv/wE9I19x?=
 =?us-ascii?Q?v3+rOB4QYJxXeGpT5lGAvW25730cnITr/OaQFsPfHDmRujqPkFQUNnJWI99/?=
 =?us-ascii?Q?DKhnTjrkXIm4lsol/Y7M3W09VwCxwsyfWLXAPbpfuY9v0GxPMbwAkQGw7wgC?=
 =?us-ascii?Q?ldRZxOx+yhoekxfqFkULc133SKyUk8ZiKr9Z40oWnaVR7XDBhPghPzKOaDUA?=
 =?us-ascii?Q?dhXdmEYTSi8S1XLLd7k6YJrMavMlP9WV27+lINVqflBSdOgev0c7oS5l8S0J?=
 =?us-ascii?Q?bU4YulVqd3+Ns9/IXwMBmr/pFhFAMc68VcV5OiMO+QbpdpwzdeGrQ6Mgg6zd?=
 =?us-ascii?Q?OAN8sqDJdFo1Nub90xXju+KaCdLFuPRNH508a1rFfU181CrWLwf6nyZnZfx3?=
 =?us-ascii?Q?I6Z0YI/FTpPvy2uvhwMRvTlN7bSlqXmJAbARNWqhR0RBtKw/19iSl90G46ay?=
 =?us-ascii?Q?b5RaHqKZTLr1yQIojd/bfJ19tA+WkASuM2Q6+MxGi2RjH9sI8akAw+yCS0cp?=
 =?us-ascii?Q?oz3VhJH7NFBSYiNVpRyAoorJoe8H0IBIqKhXpp4Fw+a3KJqnMwBnzNkSrllR?=
 =?us-ascii?Q?IMZ7zolDXxN9rsuSHW0HcY7f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88c685a-532f-4540-1bb7-08d959275d60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:05.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRgjbLmF/8+UDNQwM093JchLB3BBdZ+/SrqolkmYVhWQxbInP2ehqe2ulkCIjWJat/9IAQGSA+h42ZfMfGwEofjx3xzfHsDcOIlzqDAErOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: pY5zitiY8LptMVDqNw77ojjp2z-MpsdA
X-Proofpoint-GUID: pY5zitiY8LptMVDqNw77ojjp2z-MpsdA
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

cpr-save <filename> <mode>
  Call qmp_cpr_save().
  Arguments:
    filename : save vmstate to filename
    mode: must be "reboot"

cpr-load <filename>
  Call qmp_cpr_load().
  Arguments:
    filename : load vmstate from filename

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 31 +++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 28 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce..0a45c59 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -351,6 +351,37 @@ SRST
 ERST
 
     {
+        .name       = "cpr-save",
+        .args_type  = "filename:s,mode:s",
+        .params     = "filename 'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cpr_save,
+    },
+
+SRST
+``cpr-save`` *filename* *mode*
+Pause the VCPUs,
+create a checkpoint of the whole virtual machine, and save it in *filename*.
+If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+reboot, and guest ram must be backed by persistent shared memory.  To
+resume from the checkpoint, issue the quit command, reboot the system,
+and issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-load",
+        .args_type  = "filename:s",
+        .params     = "filename",
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cpr_load,
+    },
+
+SRST
+``cpr-load`` *filename*
+Load a virtual machine from checkpoint file *filename* and continue VCPUs.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa105..01b5df8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -58,6 +58,8 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f..6aed6ac 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1177,6 +1178,33 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cpr_save(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *mode;
+    int val;
+
+    mode = qdict_get_try_str(qdict, "mode");
+    val = qapi_enum_parse(&CprMode_lookup, mode, -1, &err);
+
+    if (val == -1) {
+        goto out;
+    }
+
+    qmp_cpr_save(qdict_get_try_str(qdict, "filename"), val, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cpr_load(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_cpr_load(qdict_get_try_str(qdict, "filename"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1


