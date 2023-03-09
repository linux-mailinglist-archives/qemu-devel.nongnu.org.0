Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38966B6BE1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:51:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTah-0004tR-QV; Sun, 12 Mar 2023 17:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTaf-0004sM-M0
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:50:53 -0400
Received: from mail-db8eur05on2135.outbound.protection.outlook.com
 ([40.107.20.135] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTae-0005K1-8f
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:50:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHc5onYmJBwTuL/Jc8RqC6Qteq9t9yuv71vylYudmC+jSf2stjkXvLkboRbPBBCJOFNu+fe2pea85w5vUnPOa5jJx+0LkJQqok5Zy7if6JgPYOFlNz2DYSbY4fnbjt6dtGnosYLla/QJFf/xnAj5kn0mzV6S4/7yX/eAuE6Xsx37WlE050YxkzhYPhWcBd5NfK8Uf9o3NM4XBO49lwuKIvF/rynhgcdHXfIRlONSk6jeuakazRJvv9ZaJnWVMZdEpnxcP61SIOkd+AcC98B5e38vDurERuUS5l4dZLxF0Xvpi7kagxpZVObss2YzJ5U6G2CECF4d8a7ia+dez2wlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJe6efnw7lXtnTEN9R8zjIdKnR2AnR+287JfG72DZFE=;
 b=MBrfkhPv5W+jeYGEpLae5yTyyNoiC8AiNNpejVzlF0ZUpaBjlehaIA+FZqLgAAG3OYPDdp2Qc2k8quoS1QXmFRjJ007cpBnm3ZQ+G9jSFgGfRWQS74cLScPPwjbMiB1Ws5FTmFypnXTvtdASla4YBr1V+KYielbFtp+oen/PifjqZwLB5BBZuRKPa9Bm3vBdDBanY9fz9hNTJ7k0bsTk8TfocyKLpgZ3V+UXDvm29d5qlTwLLC3ny9i2oisjKIVcHVDcXU8zCQv28EmjQqhp4+aiTjAzPHEfIpqkeSzN+BN4RB7JPSF/SAYq1pIDMU0BWZgKUSSpmWfDcFyhygYmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJe6efnw7lXtnTEN9R8zjIdKnR2AnR+287JfG72DZFE=;
 b=VDikgC8xIr7G42U6qW4tt19oz/N+52/woCDqpM6JR1BMKUYMOIsga5XrzI8VR+4FbPrY3IvO+a6geoaQgpYPg1cO+SoDSQN8GipVFrqtSXtdD4YxQ+XoyVWZPXe1P+zW0CmRqa8HuzlC3mMwkJjfNk1R71i8o8IXKbEKm5SP9GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:43 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:43 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Thu,  9 Mar 2023 23:00:04 +0100
Message-Id: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0094.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc20a8e-6cc1-488d-1bd5-08db23432154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvTwAJx1sc7F7d573KZIxs9THkh7VIK58YhzZ4UG6C1VknyJANHthKzHe4oLImT2SXdOq7VNEKVTHs8oCQBKlefBwsuAVOuHKRmP9gL2p3CrtXcw/4yr6550u3KuCEhCpkt1gxyKyCFVAch2q0Zim6vNyq8kE2UFENdVkBZTF2kkW4HyxLrR17DPDd8epNpRsj24k5HcluIEUd3Y9dR+xOlgOrX8C4bxtZcOL2klDxTJM1sidOgbzPPc51DFnuqqvx2eXQF2IjawAhK+GibDGwYtS/XWAB7eYZTwxDJ/sCsLqbj1synpfaFZQ/gh93uFGJc5kRPaoDd1+hKr4dieETiONE0v8TWYO6+lhbsaIowp5tnsvtfhyxnBL6D1Zzx8PYLKog/4IQ6v/WUe3BfqEEVTSS/XV9outIMChJZa+Iiiym056nevoXfmooL/3lcDejL18g4RfqVg4d6QuJBDmWUxrX+vn321gQ3Omva9JpfAWFW7FA4OOdcnSUO7BV1iYKnoTm/B+olq1lEznQMaMmk0rozh7ShMptIABBc7wrulKyhrmqych5rGc4HgykVsoc88ZJPimTZQjCdz67DxIHRUoGaP23seprVfV+DGtpKnFIWT989Ubl3c/dnoQTD6MO/yqvircWNTugCUPFei0tSRYTMl+MgF0j2xNTGdpefH01YVKtCV5ZoQY3SQXWyVOjux6xWfKu+Va0uW1CEkGTGLDR8EhogDyNDC3Nn7E8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Phv/vfIB3CqvJP+xKT+vfPqU+Gn+MjgShe8FM2eP4k80xQcdDeU9NZh7UNG?=
 =?us-ascii?Q?fqOUBd6a1zcEc7zZK0qpI1VWuAE4tg2Y763d7SvoSs1vOAu147+WkrV6/7iD?=
 =?us-ascii?Q?+2vI+JaOwiCBUPYRWaJYPz+nhKStB5WGaF2CMfj9op88mP21qyy0Td104BVe?=
 =?us-ascii?Q?7AHXDXQJZlaxLT06WlVHD+x0k81fUEVyemQ+i64g5TAr7kM3SSgqlXylSHgI?=
 =?us-ascii?Q?dMpUmQZGpfEkr9m6klJw7RWUb47kYvgTHGbtGVJlHdMk3DB6WWczBsHz3V3C?=
 =?us-ascii?Q?5sgbPTDBZGc/PrPKG/YC9HW7PoESGT/w7KPMS6VPQNiXKZMYIc9wq5zHUC1T?=
 =?us-ascii?Q?CZnbZsebYNqvgVqD6dOtHWknuk7kNnLkMMvLRqrIDqkg8gCUW94k1Mb7M14t?=
 =?us-ascii?Q?NwsSnklbziGztywlzz+WiSFtzvUU2i3OD8yq8OXnfqtNonhw+z/RUQfA2CyW?=
 =?us-ascii?Q?1bdUd9AxgWBW+SqUSi9lEaQ7nw05J6UisPeazgCBN9+f75HrYdMwPdoXkaC/?=
 =?us-ascii?Q?346N185FX70RjP5OEkr3YXnYbQ5CGSIh5BK9pWD6Z2yCMow93Ij5VPvZKGfx?=
 =?us-ascii?Q?cKPKFy9oHxABVhO/gX8HK4LnX27eviF4zq4+wjK5ZbftfGPvuarfILqtl2Lt?=
 =?us-ascii?Q?m8kDNTCAycvAZKrDqfok9ew5bsWvpiUhgtYGQp86Pr/MH8Fa3V/4W3/VhT1g?=
 =?us-ascii?Q?Mvsl4gZ9pGO2LlL1NqvFX/MgYmlNLkDk3i7n+pcV1UgMkKl3v4IDf8q78Vrl?=
 =?us-ascii?Q?lI8miqdff2buRvDbqzTX0/PQsxmpYM7EzfiFtAKThSMh+6ht2V4ishJfENk/?=
 =?us-ascii?Q?aAMEdp4QrxOV73/imF974B76QIdzPL5fM2C+lGcfJPmhfcDhNP6gAGb1tJdj?=
 =?us-ascii?Q?jlgBVMSTJJavpOx0mZj5CQwvb8RHX1HCLVEQDixqg6BDwMKsn2ResznuPcWQ?=
 =?us-ascii?Q?xZY/nK+KJ9pWWESwTrw5xEPfqc4cbup7dYW2OZjjHdkYBC7UcbDS36s8eYG5?=
 =?us-ascii?Q?kPzMO6fQA+WCyu79k+NImPvWMzeO8t6kULj+W8V8L5hNJ+WRBEHmIlqovhFK?=
 =?us-ascii?Q?Yg7R6AkcbAVE/dBOc+f6tsKRVC6XHkON6TaV35TVsK9QjSqEekQnrym7LZPM?=
 =?us-ascii?Q?UwURRaLRnpFe+GkXhuG1lUek2BQx7Xi1UGmVZOYPZa3HnXvORk7GMaMjiKD1?=
 =?us-ascii?Q?JSBDzk/5xXY1/iU6OeKtXHV1f0Lwkfu4atxzO5X0YQdZP3ZvVWaFm98FyTpx?=
 =?us-ascii?Q?Y7TWX2ej+7nigTb8XBbJmiIiQdutXYFDaT2OinzfkenS7XC4r044WBFzHUH9?=
 =?us-ascii?Q?yvv2J6YziWamqees3TdViGsOmf+YBJofxin9zqyxD3jAgQSd2WyTToXxRYQF?=
 =?us-ascii?Q?Peg6yWNiVqOJn/NceddIfcfSR66T9LKtYf6nkGVKwH/1FDH465fywTU6mDqV?=
 =?us-ascii?Q?gjQqCwRVaybC2lmdJGASi7QMV07RyQyOvKhoa2RV2rEoPWWh0V232e1rr9mX?=
 =?us-ascii?Q?+Owtj2tzKzUDT8WqnLaDPEzvNkkR+vq2KTL8o3jUjW6DKqhNZt58z7OPhUCD?=
 =?us-ascii?Q?PdyQBmTAm1kVnBO9bO97Ji+pVEDRph3PPt36PXPHQ/LdNGgZ5ZJPAjO7N23H?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc20a8e-6cc1-488d-1bd5-08db23432154
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.3873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EOJQWkuU+yfRvcXSOPshqKwjyjhIkymv3ln/JMqJ2turRKA68Ufk0PsAts9W4yyRCOa74r1V8e+S6+msSQyhGqVOEg4I9rRb+Md5UgmDiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=40.107.20.135;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now that Akhiko's patchset for introducing igb device is merged, I have
rebased my changes on master. The changes proposed here adds support
for 
 - Correct PF/VF reset handling
 - Introduce ICR_RXDW register definition
 - Impement support for VFTE/VFRE/VMOLR_RSSE/VMVIR/VMOLR registers
 - Check oversized packet for VMDq
 - VF statistics

Changes since v6:
- Rebased on latest, which includes igb device introduction.

Changes since v5:
- Added back an unecessarily removed empty line

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 196 +++++++++++++++++++++++++++++++++++--------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 174 insertions(+), 36 deletions(-)

-- 
2.34.1


