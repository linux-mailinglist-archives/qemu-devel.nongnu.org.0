Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADB93C7AB3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 02:51:23 +0200 (CEST)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3T7S-0005ts-5c
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 20:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4S-0003dp-8P
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4P-0005Vn-MR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:16 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E0fVFk007873; Wed, 14 Jul 2021 00:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7pDnk8aDBGlk67J0p1NgKI4WkvPcfv13dh+e/M9YbN0=;
 b=VoBndsdVaS2s6sqIZfTPxu64T5Qxc0Pc4rn8ubIV85Gs4Dy/ClCl4YtkohO4G4Xl7ptJ
 zhwcLdMQOghsHA+QTIvI4QwNy3crWUNQcnD9MvyM7Pcf+DoJ27MCZn3heZ5hUGJHX/DU
 Is8U2s0NQU4VYngmm3ANEvw7acShSzuKSNxG0muGPaepquD9ZO5HvgYiMwktCXVEPhyf
 x+gUJUPuwSaVdb3a8SECx/CB2S8poI+RtRlprReo8MAxUUUGWUjBC1wYtXfclB+vVjS6
 +KeryO3lHyT1JBGcvl1TTsK7IlAzDS8Cq4yJ3fwLMnNuvinyIAH6r4g0Ll/ig5FPLXlG PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39sbtuh97q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E0eubl195448;
 Wed, 14 Jul 2021 00:48:07 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
 by userp3020.oracle.com with ESMTP id 39qnb1bb89-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcSFhHvUuMuAUmcwtVmGzJYcLX+e16OYqcAYOKr9GytoCHTdhuA+J/KDvjK4Mz6Lq0BFqSm+Ro0/7O8dxAVAwaqB9JJqg/ZOsn05cJdJmawN9KjUEepEk2ypXvH005PrDF/i7KcERcyKrnqcpiPlAFzm7apUQgygYawX4lgSaOcRhhdqfJC5rAr7heHcal7L25RuA1Jd6UGKpvRBLLnlRxttxwrpR33SQ+Vel3lQQ0jum5i7izfqPaIZq3OvpWMjzYfmKJcOOUNbBW7PcwphRhSBqhA+GtDeMw2f60+u/NBuZyzXCyWHW91vCT29s7pKabvNkcwXCJZZVwWHlr/bvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pDnk8aDBGlk67J0p1NgKI4WkvPcfv13dh+e/M9YbN0=;
 b=VaSnHfAC4kHl4sOFeTIdqz/Ty1eHsDgIR8hqsYM+ht3Y0KP/6z7emYooRUB2wgRFdpChTobLC32xmns5GKY6IIarxZqELvhOpmid/Ww111jpYb3kiYHmoXxBVtC6qvru+so+BLbKJPwc59OrH9ohANvp0pYCac3iYHA8NO9p5XJcMOCmGtMhCPIPft1fa7z3MiIzrQ+xP5zShuUsSDVPiL9qFezY6GJyJkfePFjuM8+Ihcap0Ma+nG6pp5Y5Qs1/MvSInXNMFoKl/h702+09/RM8CCR+2NmgvSCqVFganHzc9iU9EjsimcX7OQzcatdU7jTKj4tV3WfAESQ//hsRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pDnk8aDBGlk67J0p1NgKI4WkvPcfv13dh+e/M9YbN0=;
 b=zHrRulAjGraq/e61Zrw2gx9uJghqdesrWMbusk+z4bwILOhDejtqroA7ZDPCtAsT/FEVH1QgRusKWRCJpuyO17kt1pNs2f/QXl53vicc4hCiMWGQp7ASPOu9BKg8QabYpNQsO6KtimgorlOVwYib2Q0l9hXpSaJ/WWNB8xo8zI0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4592.namprd10.prod.outlook.com (2603:10b6:a03:2d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 00:48:05 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:48:05 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] msix/hmp: add hmp interface to dump MSI-X info
Date: Tue, 13 Jul 2021 17:47:52 -0700
Message-Id: <20210714004754.22243-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714004754.22243-1-dongli.zhang@oracle.com>
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:806:120::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 14 Jul 2021 00:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0071d235-60c4-4bb0-1129-08d946610a7d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4592E4F46155055664653BBDF0139@SJ0PR10MB4592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: th0dK/pKqNTTlBvBhwfCIx0Ze6JBJtguqo87DpItaq1AMuvt08FEVZrjt4VG/Uyea6HQIVI0lMudC+Psrsnu37EWrugRzWT2iewwvjRJALiOSaZwOUiT+Pob51QUI0ZZLt74OQcS3SPW8tasTFjho1Mui0lyAAjpY134xTtti7OfjMMpeq0+GBH0VVt0YOa9tyO5YVEs2PwCMRdKuB3aLdNfi/DmCFSVsz0o3nPE4UjjHhBtWRsu1JgIZw6XO97sxnWIicLZdumP2rSmt7V1pmGL8prajTQcEJzQCtPucS/J47D5pTPIJ6qIkC2rwFeibwxXJguPbgXb/RBDeeOOl8LOqchG0f+v5MEJm6iTDNhFmnmbBCEBcUz9VOOzzdNBxSVaHSzCo8XatRhyOL55M3L+64AaebJod/Brh8G/7ax4f01TlLfxnOsttIhEI4rRBqOE0BH+L66hSu/peHBv0ulE05JId9UGmtItk2vhF08eCbUpnMX0Vy4/j5hyIh3AH27v4hjsjq2fA8adofi1WLBqyGcbDI5wZQ7F6wx06j8xcuqfXeONJ1GaSAGAWT+BDD6vUCYOKEPxbMKS8/K1VKqOhMXd0DHUkkctGIeh/KEJmTmpE2catxtVd+pew9w2681cAfbcfM2MIUdDA8qpzp4/GszB78Hg0x6kOGSqDC9wWOTZzHXfTyS65unVm2JhiGukOpsJQc1zbBRK6pCPjW2sqkyOCK/uqIeUZznFRtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(136003)(376002)(4326008)(66556008)(2616005)(6916009)(956004)(44832011)(8676002)(86362001)(52116002)(5660300002)(316002)(66946007)(36756003)(66476007)(186003)(8936002)(6666004)(2906002)(26005)(6506007)(38350700002)(38100700002)(1076003)(6512007)(6486002)(478600001)(83380400001)(107886003)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKQebHp7BqM3S9eAiVoCs3LgxueL7ZpMCcFy1lnxkR++MGyVTK4DEwLVFUmy?=
 =?us-ascii?Q?XZZVRlNQ+y1hlBFyXpTQK37YbLg598K0+An7rza9nVIjHPdRgCJRmrSk3QiP?=
 =?us-ascii?Q?o2Y3DEoUilgeeDMvYMcl43Sj7y+7ePh5oDeInBu0blfoY7jo/lu4cmbYiVa1?=
 =?us-ascii?Q?+y/D8jydfkIuwnkqNXN1wUkjUmpCl+dd77aL9XdirIPMQDIAPCdKDIQGNAuh?=
 =?us-ascii?Q?iFJABXUQ2Vh0SJ1lOJWU7fZ2Z3bvtWn7YkmVuOEqPwtgiNOQZNx6almT0OGB?=
 =?us-ascii?Q?r4Hk/9ioFPF9K8C/O/4wdKvWMvDcbDiFt7VJSYXV1RQAxM0gISBZEKMS9b7R?=
 =?us-ascii?Q?kIEtckDkluGvAPowqp9hJrNpONXP59TqunlIa6b5ywVsotQkz8FCjZKRCPer?=
 =?us-ascii?Q?9oQ7tZIWMlPsBp59yU9JyDixW6+zZ8LJb900GkKtbuyIyIg0xD7RG8JdaKM/?=
 =?us-ascii?Q?o2OFRTBaW3HJB4zvKoCSVfOMkoHoM+b8Z1FqeKZS5tb4s5jdGdPc7WeSYABs?=
 =?us-ascii?Q?1DLtrpyNl/YRoTXdpHTUoJ2MyxPO2matRTB5LS42PMWC4revF4iayUd7Mwy7?=
 =?us-ascii?Q?j+5PHT5aXUlAMUUWHtXKhRkz/0wVrGhfIom2/hYGSm5krgv5oWmO2zEB5//G?=
 =?us-ascii?Q?jinZ3boiFC8NFSzdeq2t86lDcxpFzH9cIw4XHnHi9dNRZDCpvPET1x2AbBIY?=
 =?us-ascii?Q?K7pWlX6jx10BdZcIfOLXJtB6I+XlyfLbfkraTG2rrA76a/dZdqNxybdibnKg?=
 =?us-ascii?Q?T0TCoxsGLS9AV4GiOlO4lbe5SSzkmEjBV/Ck1cVF0XvmIhBECG8hHgnllh/Q?=
 =?us-ascii?Q?K+WQvugeVU8GVm9FfP2wGCXNwF0n6oiRVoYsF/gs0dMgT1e/APiF17pJJJx4?=
 =?us-ascii?Q?M2gnM9zu3IW5PPoRq92OQZsfNWC3NfLStW/IcF0uRd1EkrdaKgiVkNc0+k8C?=
 =?us-ascii?Q?W3usaav7tTRcpAfWtdTlPtcemUT2d7eRWYlbLeJ/Ns9G+1FV56sMkb89gMR7?=
 =?us-ascii?Q?OlMTUTS7qYHfWiNMXHITxKKEREXJ1mtUrWLDTlHrz7174WQHuTmtV89cqTYs?=
 =?us-ascii?Q?BWatxyufH7YLNEOzpIX+Qkq0tCjov1ol9raG9X59BUTe3TS0p4Db9ODXfkZo?=
 =?us-ascii?Q?0qQL3nf0GgCj/k4eGoJSsT0BUL32SxKDG63UMpV0PktWH4gd9a1sk6Fg87s4?=
 =?us-ascii?Q?8qJ3IEA8vDMVo6NajpyYpaA9e3G8qUm/ejgkkp2AGFuF48SiQ7ZgjQ+RRGd/?=
 =?us-ascii?Q?4sDLxpxhewx94gwbGKBZFx0b1c4U/FdKF6TRqQiyjW7GOfxglFmn4Nr8cZcw?=
 =?us-ascii?Q?gidQaQIb6gT5GudRRt6IVsX/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0071d235-60c4-4bb0-1129-08d946610a7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:48:05.4084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krJN5n4Ctlf2XKlW8hdAn5Gyv9d8jz0PksrnebhPNQqPUPYSkxXWTF5MNiz5JrXtJdUfdgmMR94PFs7LkI6Fqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4592
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=725 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140001
X-Proofpoint-GUID: 2pjeTxlKeDFtBXVgr6PcQ3Qs274QCsMg
X-Proofpoint-ORIG-GUID: 2pjeTxlKeDFtBXVgr6PcQ3Qs274QCsMg
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is to add the HMP interface to dump MSI-X table and PBA, in
order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
vector is erroneously masked permanently). Here is the example with
vhost-scsi:

(qemu) info msix /machine/peripheral/vscsi0
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

Since the number of MSI-X entries is not determined and might be very
large, it is sometimes inappropriate to dump via QMP.

Therefore, this patch dumps MSI-X information only via HMP, which is
similar to the implementation of hmp_info_mem().

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
Changed since v1/v2:
  - Add msix_present() to pci-stub.c to avoid build error

 hmp-commands-info.hx   | 13 +++++++++
 hw/pci/msix.c          | 63 ++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c      |  5 ++++
 include/hw/pci/msix.h  |  2 ++
 include/monitor/hmp.h  |  1 +
 softmmu/qdev-monitor.c | 25 +++++++++++++++++
 6 files changed, 109 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..ce5c550d44 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -221,6 +221,19 @@ SRST
     Show PCI information.
 ERST
 
+    {
+        .name       = "msix",
+        .args_type  = "dev:s",
+        .params     = "dev",
+        .help       = "dump MSI-X information",
+        .cmd        = hmp_info_msix,
+    },
+
+SRST
+  ``info msix`` *dev*
+    Dump MSI-X information for device *dev*.
+ERST
+
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
     defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
     {
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..4b4ec87eee 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -22,6 +22,7 @@
 #include "sysemu/xen.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -669,3 +670,65 @@ const VMStateDescription vmstate_msix = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static void msix_dump_table(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+    uint32_t val;
+    uint8_t *table_entry;
+
+    monitor_printf(mon, "Msg L.Addr ");
+    monitor_printf(mon, "Msg U.Addr ");
+    monitor_printf(mon, "Msg Data   ");
+    monitor_printf(mon, "Vect Ctrl\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
+        monitor_printf(mon, "0x%08x\n", val);
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+
+    monitor_printf(mon, "MSI-X PBA\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
+
+        if (vector % 16 == 15) {
+            monitor_printf(mon, "\n");
+        }
+    }
+
+    if (vector % 16 != 15) {
+        monitor_printf(mon, "\n");
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+    if (!msix_present(dev)) {
+        error_setg(errp, "MSI-X not available");
+        return;
+    }
+
+    msix_dump_table(mon, dev);
+    msix_dump_pba(mon, dev);
+}
diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 3a027c42e4..8191d49d56 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -91,3 +91,8 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector)
 {
     g_assert_not_reached();
 }
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+     monitor_printf(mon, "PCI devices not supported\n");
+}
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..10a4500295 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorPollNotifier poll_notifier);
 void msix_unset_vector_notifiers(PCIDevice *dev);
 
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
+
 extern const VMStateDescription vmstate_msix;
 
 #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2..97c040a3c8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
 void hmp_info_pic(Monitor *mon, const QDict *qdict);
 void hmp_info_rdma(Monitor *mon, const QDict *qdict);
 void hmp_info_pci(Monitor *mon, const QDict *qdict);
+void hmp_info_msix(Monitor *mon, const QDict *qdict);
 void hmp_info_tpm(Monitor *mon, const QDict *qdict);
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
 void hmp_quit(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d82..7837a17d0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msix.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
@@ -1005,3 +1006,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void hmp_info_msix(Monitor *mon, const QDict *qdict)
+{
+    const char *name = qdict_get_str(qdict, "dev");
+    DeviceState *dev = find_device_state(name, NULL);
+    PCIDevice *pci_dev;
+    Error *err = NULL;
+
+    if (!dev) {
+        error_setg(&err, "Device %s not found", name);
+        goto exit;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&err, "Not a PCI device");
+        goto exit;
+    }
+
+    pci_dev = PCI_DEVICE(dev);
+    msix_dump_info(mon, pci_dev, &err);
+
+exit:
+    hmp_handle_error(mon, err);
+}
-- 
2.17.1


