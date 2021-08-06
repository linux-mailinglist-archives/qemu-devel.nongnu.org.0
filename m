Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366B3E31B9
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:24:38 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Gb-0000TQ-E6
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86O-0000w5-HJ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86M-0004bO-Fi
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:04 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBqoY007330; Fri, 6 Aug 2021 22:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=7IG0uylibt3PCFRkEUpwV345IpenAzdM2NiCcshcivA=;
 b=GQao9IrD5F2zpxeF9IfuUlW2HjRjct1igapFlyPY93SV+hfq4mIYhoUuVtWtl1K0EQCt
 8w+/WGw6nGuiQVlCRZrLX27ENpbBdbiS1UauWDCDawm2sBA74vx7WB98AqtpSWmr7B/3
 2rchwODErGIR1skURCRAGm1h25mvqCcoEACWb5NDuPZrcQ+59Uo3x0aGCbhzqnHbtEBt
 xx3UF370knuPij/tG+ExBkIW4Eonu2ELL9wGc2B0R4mCu6TJsRQ1FtQhmudZIwb7rF4/
 emz23UjXReU3Pzv+0egNm+Mn1HyXPJTLQ2PQZib46MiAcgWvJ5Ak6A7VBD6+zlUtVAsG pQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7IG0uylibt3PCFRkEUpwV345IpenAzdM2NiCcshcivA=;
 b=amL6rJ7i4jLJBORoOCt+yu2+ooXCi1y01I6qf1kQNKpT4NANsWmE/x73BgkTrHT8BEZl
 Qed2RNlqUi871af7kF0wTPshmnB+xNUhL0O9U7CYmqZQ9NFu31191BkSgFUWwEaHUMCG
 UtWDMDvQpIISW7PdWFEhJeS8mKzEFZO9MoExalbAKpzmPHEVANYXNU3yzaboMWWvVag8
 k4gsT7KJ3MPbBP0OVWFluthVt8a3i8LkmJfDH7FpIXxiEI/+SKUUI+Mqlqr114WJ0zPy
 8b1A1AS488m5LSGYhRfYviA/BZY8GBusO5i9Mx2ZK2lSHEzj9Xyk/fyGQp4EHuzpBN4Y HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBiLn013786;
 Fri, 6 Aug 2021 22:12:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3030.oracle.com with ESMTP id 3a962pfak1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXYoiuSgT9o/aOxpyfopYXkk7wQGnVp96xOIOPNdIF/2B8jjSGY+Tyrm7yvpQnJ5QtenMT0HXaRhoopoUE/xJ8JtEe9OeqZH4dar/5gR3dMHBueSJPHil7ugSTHpd3Q4EHmhgChurr5AFeB0nuh9nu4YaJgu8k5BfWRVagaT8r7u+84+wdISbJfhqq1JBdaCdTgwUf7ZIpTd3fWpZMyhQsshw6uw8V5bBbVLPsKoce6rKo2+pMNiIOBHru3PzGxRxCWg3dxq7xxWgvusYKagicZjUbihuSV/hlagtp+aRabKItryNR9h1UrdjnbDbcYspdzUD7HY9OiHuaaU1O+vcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IG0uylibt3PCFRkEUpwV345IpenAzdM2NiCcshcivA=;
 b=DQIRUzwkQGFfkTcSx9+JfVx4R48XDgv9j2wtJwsG73EvvKxguonBb8qBAp80mPABim0TzauqDW4b7SCpVB17MHg93jRwY5CcUsyp/8rezRBOTLaMDAX3OA8dMpP86DN+iu6b/kynSJBNBsb89roUEAvYDy/Vb5aXX0kivQFSHmoLsuXHdcxGGAHgECl7bd22wpSKQmuFsYAJQ1G3sDhQB7l5jReDGSpB8vTDyZmEPFFMPT9zvgMwDuPl8fnfgycv/u1iA+B/AnR189ymT4QUkjgu3l5llJEK+A57Avb0dCEm98joayH3GaUMYXge72pJlx+2hlEVXuZmtMyl02eUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IG0uylibt3PCFRkEUpwV345IpenAzdM2NiCcshcivA=;
 b=Fg2OlTRxhjsqXWGGiyTNPN+by1SgyKGN3KFIT2p8pJ1LIpklqVDRP6/Ccx2BPhyli9oTHbOBaw6/dVMkvDkGPf/RESEtAjyjrCHQ1kyxxPzw3wlQTEikBUX7KKGzi3XK1gsy62CR67XzmVbyMybLWqgVzuLVDkLLWYnDci5DQbQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:12:54 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:12:54 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 01/27] memory: qemu_check_ram_volatile
Date: Fri,  6 Aug 2021 14:43:35 -0700
Message-Id: <1628286241-217457-2-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:12:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 707ed423-1eb1-49c0-2070-08d95927566a
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324628D9843C325340EA489F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QEpsZFNYBQMpzu6ibwu2TWFPJg2jxOv7ykF+bcTzb5MGJGTFzHLxjDgUjJkbJ6jbrZXjGUeZ/SKmlZTQMO+qu3l163rHVp+GNJUrrIQULSfip3uP4RWnsD5EChbgFwJ89wyiiqyBq0antdUy+j+bzfjxKT+aO7RyH1Qsjag5B/sYgbSIdPv8n8OGqkdfTdwWrK8/rFPyIKAeP49Yc5eyuygNRZAfBJ49BdkzUk3NggyYzy1XME4lxu5junM9ZoCLfK0/g1iR0/56NnPWAMEC21VwGLGiIkKmiRyuWhxHkcHjfun0FNVrYaLErmPQCQuJVvLLGLr4BoyOtlHcKcF4Racd0ZILCnWVDaMyKXAdY5QG3p37+A0FdCdY3M4u2NbI/6d63Uq5lAJ41UKuQuUpeF89axTb93UzjFcjl0TwAm66fPkWKrwFR7rVoyjHP0EvFo+XZJcs3pJyL7+1cRIYZZO2oH6NVGAMB5il1m+wAlUBzMCAGoOd4yDfet5ERMBSSP8hLwHMCQJIybpR3cflckhZMsxx1lYy6QlYZjMleXId7DJF3Prttg7fnYb8VFJKM3nL8tovZt6lt+vULJNdisTVjZ7VZa9KyGcOivvi8Du2Qdl11xcWluB0cR9Yu/NziJMNmcf/iB9TAcmmyy6zcJT/10iDtvLlEhPRD5/fzLEIwbV4WtPRns5nOqIQibj3qprCsh6dGpZYStZqXA3shw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b94HfYLtErZpQVvmTo4bppcE6aJnL3fvMEyZjg5H8XW2dWxioySeWh8ftFXO?=
 =?us-ascii?Q?ok0e5c3Q8w6LqbIYyTjRNn6z2s4OjBKG6yVp5qQY9VWDYejpSE4JM2eENifp?=
 =?us-ascii?Q?PT380YWj4aTqVHG1z0191ZyqZqcKMwTLqDe6kXipSsAQcJKQfdrMfV0v27xT?=
 =?us-ascii?Q?ILCp6UhwD1aR9D3b5FWMAe+Y0Gdw0X3+YYHs9AmXonzF4tUuoUhkF18cVGb4?=
 =?us-ascii?Q?SZQhm03cHUGPEA0QUGmcK2jkCURdqOEUHwhf96hWMIj/OsFSNKRvpM25wbyj?=
 =?us-ascii?Q?SDiQ668eaegdxroFbbv/Dp6Kq9DLj8M1eWhsMKlXGE8QCwN1BHTsxdkc1oRg?=
 =?us-ascii?Q?W+XRcl4i6oBJl/0vRPvYCImkva7pUCLXbz2tltSKYsa/bM2quyT4vhSZz7a7?=
 =?us-ascii?Q?IKk4U0tAVXqraq+lxOtytk5xfESfDYRdIeYFfiQ2MBJ/s8yVIrrRmMFdhH18?=
 =?us-ascii?Q?k7t461/bjxRWAspKKFr5hXBtoMPpluRNRTmD0b38lKCwoZDGcnmqE21hEn6u?=
 =?us-ascii?Q?aA095QcJcM2n1/aXCxawZqUD831Cq7aAzSkCrLymyxCLJgXvpr90Wcm9Bsu3?=
 =?us-ascii?Q?Xpo2+wDrsMBZhKu91R8dhvjws+9fVM0JExypxKUKJ7IKUll+m6uD70ASoMuw?=
 =?us-ascii?Q?4c4IIIAn52TP8TqdrZIawDCYMHMYPFGvDRoIVOIkKqMUvFaUKC5EjJJqbRRx?=
 =?us-ascii?Q?rCIGjceGE2aGk+mnWNrgm+bw3hmWFSAdQQiGs9U1HBEcorg0RgOqHifVvGyU?=
 =?us-ascii?Q?W5NdcW+VVyiK7DYCL7+YzEBGEsHoKaoIKX5/TCSdesjDoOwn4vaRczxgugHI?=
 =?us-ascii?Q?8Q2rNAZvm+vnhVvolBNDh/yxnwbmMUz2JeXMF6NVbFiori8kUzbJaLkl6KHt?=
 =?us-ascii?Q?qCtWBQBwui5bMmIhL0uuLgel8Q+HZL3nLXWI8nDeZmecx7pvGTMyFvflumQk?=
 =?us-ascii?Q?jVX83AbCTJq8qZNZV/V3yB3Bi5cA2y0G9S6Ns8mO5aFMRdTU0DudQLYuhzBP?=
 =?us-ascii?Q?3JYL2D73wbWtVJ0qhdJdlSvRf/QxZ7w6qNQEbD5CtIfnVCQvy0KtVYhPiR1v?=
 =?us-ascii?Q?jmTv2bey5ecBnYMCmAKunsNIIdJHg2E/glDxSsUNJ9UuHQMhQL1OhKrtDkks?=
 =?us-ascii?Q?GTvRjjE8QByKp390wW6sgfj8VIZk4+lLFGzsIcF4rA4yrO700aHV6RYrrjO+?=
 =?us-ascii?Q?CGwIki1/rORcH6IeTacfXjy4mktBfPiubEgJlJpPP/V09cut+46ZrQqgNqri?=
 =?us-ascii?Q?nDypOYmzvMMnbs1x75P+GOwV23CmMEcrJsbgxrXSmjrnXX0W64HtBUM2UVF+?=
 =?us-ascii?Q?ZCdxM1S+jJo9rMz2MtJO8TyH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707ed423-1eb1-49c0-2070-08d95927566a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:12:53.9087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KS3RgUTwV5EIEVZ2iuK6Q4rXKfWozKRLqg1G+EohdHzeCP5k1oQRdjJVGz38h8gk1fBe5qbR+JUMpYt0SLgxTsIb/IrDOHjdBe+RUlSVcX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: d2Fec9x9ajYVVMLVBgWtXYfOOw3mZ5du
X-Proofpoint-GUID: d2Fec9x9ajYVVMLVBgWtXYfOOw3mZ5du
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Add a function that returns an error if any ram_list block represents
volatile memory.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  8 ++++++++
 softmmu/memory.c      | 26 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d..0e6d364 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2925,6 +2925,14 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/**
+ * qemu_ram_check_volatile: return 1 if any memory regions are writable and not
+ * backed by shared memory, else return 0.
+ *
+ * @errp: returned error message identifying the first volatile region found.
+ */
+int qemu_check_ram_volatile(Error **errp);
+
 #endif
 
 #endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9..e143692 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2809,6 +2809,32 @@ void memory_global_dirty_log_stop(void)
     memory_global_dirty_log_do_stop();
 }
 
+static int check_volatile(RAMBlock *rb, void *opaque)
+{
+    MemoryRegion *mr = rb->mr;
+
+    if (mr &&
+        memory_region_is_ram(mr) &&
+        !memory_region_is_ram_device(mr) &&
+        !memory_region_is_rom(mr) &&
+        (rb->fd == -1 || !qemu_ram_is_shared(rb))) {
+        *(const char **)opaque = memory_region_name(mr);
+        return -1;
+    }
+    return 0;
+}
+
+int qemu_check_ram_volatile(Error **errp)
+{
+    char *name;
+
+    if (qemu_ram_foreach_block(check_volatile, &name)) {
+        error_setg(errp, "Memory region %s is volatile", name);
+        return -1;
+    }
+    return 0;
+}
+
 static void listener_add_address_space(MemoryListener *listener,
                                        AddressSpace *as)
 {
-- 
1.8.3.1


