Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22453C8930
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:59:19 +0200 (CEST)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iEA-0002AH-Hq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC7-0007Z2-PH
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC5-0003bH-In
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:11 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGtTfk015420; Wed, 14 Jul 2021 16:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=NNK7jKhuYp40YP8IlGE5TubxQByKKNVE7T2TT3MVoaE=;
 b=u3ssYtP+g9Fr1qWvuWOheZ6OXUj1cpBiL3uUQ6wN7gDMxLsQdFTHwb+AFbT1eiSv4YGK
 iK62svKKmr43gg8eBfxA+jR5aQMxqLcTbBpv1Wf+E9rJ687FuyIQgXEDHihJ6OD6WTRM
 VqhjP9te5Dd2gFEaSRk4ewh60YgjXaxuJtkuYQiSHiEtQ3lVfmNRrw1R9Nw7SnyC0mua
 tBbCSLrzfGWdyP5GVXU7el12Gl7R0ZRHrKS9V+QW68NSw7fJtjYYOWwe9PvrQUIHR6Lr
 XQefhhLsI5T5uVo9qGF+8j3B/nr6+U1FRAoNRgIskfmu+NR1qFUUYLzwLOsS4kqHsxj7 UQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=NNK7jKhuYp40YP8IlGE5TubxQByKKNVE7T2TT3MVoaE=;
 b=dZ3V6lN/pRhy5CYUuKQ7znP5156NyD0s6F1EinrSfpYKdepwqwNA9LW3eLvSoZ9QoYSs
 D6WLCqxpc8lBrQKJBxbg1RaWKQA5K+GyZsXDcDwvTxCpePZEbENz1dkFO2YrD8xJiJGQ
 3AraYZY/MF8NbOsdsZ1gd4UK7ohgTe/ASxSwjGxHkveKgJig3RIfyr0Cc/r0IVGpEKhy
 0FQzqU/5iEwAhqysgSNqDtA45JM2TLpn8PBrFRwkW8FYqLH41+bzzjt3a1Yb2YOQ3egR
 h6vH/n2RQ7VEPDEKG3uE3nvpYSmkz/WusZuVjdpeAokcnhDMSF/Ltk/Ic7nGN3T9JaCk aQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39t2tj0551-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16EGoXdX003790;
 Wed, 14 Jul 2021 16:57:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3030.oracle.com with ESMTP id 39q0p8xuts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OspvylKoazX19Vcg8Asg3aNjQQUsFeNs5Et/D0/AYr6asrvYJtiF/+NJqYPOQREfPSjV0EBWap17IeVOV6PgN1Wh0MGZQwjGkZ2M7YhggVERzlaBi8MJ7J6EoEiBs4kGUJBkqqZ/d3oA1AsN16jyO5h/fSCdG9Ru7qtzm2i7NEpig7QLdzZ2T8ynBInL5NAbCQDr78imwg4FN7BgL1t/ZzTZ9S6Wv+SsT4PxwiQd888MeSIULDzyllQOVu3m62knBitrbPdGIr2ZcLBJ2f2BP64WVq0CoeHCsr2yHwR6eaI2G49uvwDM19gNub14dBozeNWJxxbRvBhW++L6pFDAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNK7jKhuYp40YP8IlGE5TubxQByKKNVE7T2TT3MVoaE=;
 b=HpkwgdSrBYtLwvfqkCEVc2AXy0SSgiJr8BXlCNbfd/KxdGauD+mpr6gkPofSOxzaBWeApNnQw84sZSl9FjSY2OnAVZv5NosBubTV7HvUeH0HWEuN2SEadfbYkI2j7LXrfsvasdiLC0k245s9aKxq9XH/IWaHU15hOiAbPMnx4qqKX/Wc5YCoupjK0c8VHXr2e0SFM7b/9MhZpCLYeUwfQmCphWm5a0Lff4OJ/Vpvz4tALNhKNKoKezqMv9dfhOUAUNuHQDGeuzo4c1yKuVGMj/WYBIRly9KPgBYUpxsFa0hHiBfZh9qa0VOEN7dgfIBNy0S7Srb3kp5vUIV5jR43bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNK7jKhuYp40YP8IlGE5TubxQByKKNVE7T2TT3MVoaE=;
 b=bDwi0tdiQ6P4qSGnlNqoxjiaE3L3teNpL3m8Vt8UDHf8Njt9NsKkgRz6oF3qmLSWxLwbfyvVciAUrae5mIEwtiDeCWWcdLizHTptAs2ErluKABY1Dzt0550nrHoQ+GCUBDaPTfZYFp52XQFh8iLWjNu7zKFLd4+f19LQgxAaAhs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3256.namprd10.prod.outlook.com (2603:10b6:a03:152::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:57:04 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 16:57:04 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] To add HMP interface to dump PCI MSI-X table/PBA
Date: Wed, 14 Jul 2021 09:56:51 -0700
Message-Id: <20210714165654.23211-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0009.namprd11.prod.outlook.com (2603:10b6:806:d3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 16:57:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95a94b73-cfb4-4032-2a60-08d946e867e6
X-MS-TrafficTypeDiagnostic: BYAPR10MB3256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB325644293672C7F3B665AAACF0139@BYAPR10MB3256.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XpGGwp4c2noXpuQPB8Ai4hur+xMLQEM1FzPFxid6BBsXtm9/+gk1lbPi7U2IwkZLEDhvfyHShmqdlmULxGF4uCa5EImiZFDeCBukCpOIsHUih1tqOprUHbcwR2rpxHSE23H8egl9ddQT7iiYKqYdu4lJGcZfVmndqJyeEIJbimklcEFi/G4xefuHTNq4sEjkcsITJTNvoDZslAc0VCVQCsSF8Q3Lfj0oJe144l3UzeVlZjxZ6i+ybK7H7wDVxa5/DFMjxSLJZDYmIU64SRyTAsuJ16L/QtZ0rMC+gArXc+Eo7EkXrn8Hv2h8im80B0VsEtETW9polfIFL5HCaoXtuO9AOaOKSsvlAdTh8S6oMfzR3wWzbN1363kXVLCoxlbJy2xqJ0ZIXmNFhQu84OHlq7+4VPJq+/QAVyj6myq1IaizxFMVQI/1MueIa1o0jNX+PcbqrmCMBvdMedYGfF5zAjserkiWyrgZEeP/RMzLHm6omo1kVQr4wL9R4M67KYduJ+EUUBgXXNVLYnoKrOC3wz24v3LcVy9/ocTY//+hzWftvefzqc5NBiNGY9cXY5o0bcTRYy0Y4q3vLR18Cc+z8JihwG/B+WeQSii/6Pwm2hlgKHEk6Rt/5MJs5MCAh+sLfINA5eqb8US8fKbKAdjhnMSJfeGsSm8Ddp7doXV9i/zffpURvw+UZaXN9qfuQC1eWOeL0zRbpoA20zTDKwnU1Wx5CZz6zaZvJzul3rdTq1rvQjgdIbwyxwvvXxSkrRtFqwbhzOU5eeoBIQadItJXlalf5DZi6YvG6s1dw8uAcAdMimyS/OkdTR4A+Yaln1Rk8iS2nx7AYRyBVXywBMZ/rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39860400002)(136003)(26005)(83380400001)(66946007)(966005)(956004)(6512007)(36756003)(2616005)(6486002)(1076003)(107886003)(478600001)(4326008)(66556008)(86362001)(44832011)(186003)(8676002)(66476007)(38100700002)(316002)(5660300002)(38350700002)(2906002)(6916009)(6666004)(8936002)(6506007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1iTF/Ku6X2+Z8xA9513Us+axQKBmtXgNB4ZTxjfyPZeCncS4YY/lOaQGIT2?=
 =?us-ascii?Q?2+ttixbaMVTliN3juKksFxNqQpxVzbOmj2VEb055fF26yXlmli3GLneG11mR?=
 =?us-ascii?Q?5F2OAleYG6EHMgIc7GU2XE4LWYCkVDdswgJvnc5hsdZAA9pNkn7UAyLwmpGR?=
 =?us-ascii?Q?BFzxftdfFCkj82fyaTtBabZ+dgMvfGhbaOZ/Nwlrt1jHg3fmKDgFLASsrtc7?=
 =?us-ascii?Q?P3KiPpVYQlXKklhrt1lAersT0NmvfzVMx0n9MKI0s8P9OfLJyixPQNEINWgo?=
 =?us-ascii?Q?et9BBZ47MSjCkremfdO37H2v+/UkijmJ/kI0flGXf8e971cLv6XlFkGdjbEA?=
 =?us-ascii?Q?lP1ij33XLK/1owLLByT1ENHCVPqGeP9R5hVDh3LlhyLot1tSORBRGM3rSAdw?=
 =?us-ascii?Q?KL9h7cuvvfPjJL8GtUgb/gS90B5fA92Dwvb8J++qKmW3lZanPtoDWC/mZSWv?=
 =?us-ascii?Q?IaswEuuyRhR5MSxzWN9c5SdKxhK6PdBA+erUGQiSBpNA6ntM2V0mTIWbLz4A?=
 =?us-ascii?Q?LczjgkQcA5VrCLuK/1cUWPnGkT79TSktxv5oqGmlsHf0sZQTZ9gicSjICcEf?=
 =?us-ascii?Q?9TZHHXpRkQgRysyNL6IbcVSDA//eN5FSabtLBn4lTMIm6oU/8HLOZhPLqMyb?=
 =?us-ascii?Q?hLBDn3kYeDSlSYnaDgablfuXOcP0PGX6J8mGL4Dx3AyHr+fQyj9igecksrSv?=
 =?us-ascii?Q?Uvava3T8xXFP5dZYN/Og0Dm+J0l9dpGpxsgtewWOqu/xKcD4j8LAyPacNJRr?=
 =?us-ascii?Q?3ZFsSlozwLgOoEfel23YCQNqK7f0ukHEQZPqN0vbJTH21sKDDOhElf1Dl1yJ?=
 =?us-ascii?Q?DbJdTCGDoEMZnm5wZmi4zOUkjHAv/fdlCgABGjIofkYM7wILzeNvl0XMB4su?=
 =?us-ascii?Q?JD0Uu7EUFIuRCWZb7So0twa894ICtyJoZv/rwqO4pX7pyNgFrrmU5viEbaO3?=
 =?us-ascii?Q?8kyf5/etaaZGnCd7lPHFbIAQw7ofAlEhr/8LQc4sywCQXBUCTOoyiv9VzAJJ?=
 =?us-ascii?Q?QrAVqSlaB0y3j3UX0CjDJ8UQh4q+1P8BE4XjUKtEe3ObRVsJa1q5bZiutA7O?=
 =?us-ascii?Q?FOSAyxKEc6Iu3UPfAN9TvLBhdTgHpEoWs9YH1ZnANLJ1ACEXEG/DIafPh5PO?=
 =?us-ascii?Q?/AIp1xcafGaWzvNwhrcH+jrIiMqr9TEL1fn0hGhPA7y+xWxgktn1HmPm6EVA?=
 =?us-ascii?Q?pVvhqGLwQ22vWE+QUTyOfe8mbB/TV4c/kOkDWNHKqd7ZKpYrOmv6u2mnZsg2?=
 =?us-ascii?Q?h2TOXI5Wdl2aAfPZfKFhv/SGVZvA00XiKGvr3Xwdi4cyeSJWreo6WBEgXF8H?=
 =?us-ascii?Q?+47YdQ+eQoZRzg9SG26/tBd6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a94b73-cfb4-4032-2a60-08d946e867e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:57:04.2648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM0Iu/5MZ4LGnsJvZS2ZI/xREb8wRX82ciMiUegGgCr9e9bro+CYOTKCwJ+v1mUe99iyruV2V5CZ7neQ7vy2Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3256
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=937 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140101
X-Proofpoint-GUID: nHTc70bx0a-g9cj87LDbD7gBOV5TNiBc
X-Proofpoint-ORIG-GUID: nHTc70bx0a-g9cj87LDbD7gBOV5TNiBc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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

This is v4 to rework commit message to explain why only HMP.

Changed since RFC v1:
  - Add heading to MSI-X table (suggested by David Alan Gilbert)
  - Add device specific interface, e.g., to dump virtio-pci queue-to-vector
    mapping (Suggested By Jason)

Changed since v2:
  - Add msix_present() to pci-stub.c to avoid build error

Changed since v3:
  - Rework commit message to explain why only HMP (suggested by Markus
    Armbruster)



This patch is to introduce the new HMP command to dump the MSI-X table/PBA.

Here is the RFC v1:

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html

The idea was inspired by below discussion:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html


(qemu) info msix -d /machine/peripheral/vscsi0
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

virtio pci vector info:
config: 0
queue 0: 1
queue 1: 2
queue 2: 3
queue 3: 4
queue 4: 5
queue 5: 6


 hmp-commands-info.hx       | 14 +++++++++
 hw/pci/msix.c              | 63 +++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c          |  5 ++++
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++
 hw/virtio/virtio.c         | 10 +++++++
 include/hw/pci/msix.h      |  2 ++
 include/hw/pci/pci.h       |  3 ++
 include/hw/virtio/virtio.h |  2 ++
 include/monitor/hmp.h      |  1 +
 softmmu/qdev-monitor.c     | 36 +++++++++++++++++++++++
 10 files changed, 158 insertions(+)

Thank you very much!

Dongli Zhang



