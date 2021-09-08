Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDC403BAD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:41:22 +0200 (CEST)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNylN-0002io-5p
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mNyjj-0001wz-SW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:39:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mNyjh-0006kU-6Z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:39:39 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188Dv7A8012553; 
 Wed, 8 Sep 2021 14:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=T3Nf1338pMIn6y7VHmrxmZG4v/cjNumWEeVX2n0lZso=;
 b=xqkyMTFokwXUXiSg45hPX5xO837eaFqW0c9bfoq3zsN9se7ZS90zmb58xhL3oxIZbd0l
 tBqt8s9bygmV4qR/XHiT+9UuDdghzGf+wGyBdXAFh2HPplXz9evdOCAytqVJSVxDiuYo
 GCR+iosxeE8kXrYRWyNrT0vn+Y2GWRupn55HBOKV/1dV0e5UNLokmIwpE45zqxi0d56K
 gVdRwtuCKHJX6NwamRMrJN/L2lPApcx/quBuUjlnV0sDKpRzt0MmJVGWrtbYGCpTRDD1
 uAu6qv8wxVdoZDKSt0Otnv0gqmM7yD4QMt6d77JXJ4YALKn/ruX1+zP9UtrMZ0Nf2piZ dA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=T3Nf1338pMIn6y7VHmrxmZG4v/cjNumWEeVX2n0lZso=;
 b=ErRLM71KroFCPIKnq6v1KkzC/7fuzrWepxvWCHDCuf7RQbezxc9SodWclU70kcgBOPrg
 8XSTjycE3fTsFxUdAK08TLUSCLfF8N6XOs8JH+XjAjndFMNSdiGxFpyT6n71MEFpQWUh
 agUoo8hPyGA+90yoVNuj3+ke5RjQTRu4lpuRp0bfGEfnaDYbD4YXNqE7Fe853HLCw7UA
 4XGg9SpGDd/rz5KuwjhTko5ptxBm25UdNG9Oi0ZF24p0MXCH7waTSlXadT1FBHEVmxAN
 TG2ZviE31gbxGS6EtjlUEp9pbHevoa85ckSnCfrP/8cNoG4yUxXrR6f16DdzyCUVbs9L QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axcs1awdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:39:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188EaSHa023251;
 Wed, 8 Sep 2021 14:39:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by aserp3030.oracle.com with ESMTP id 3axcpnuaea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYeHfNVhJzrO16IIzjdCcY2TFU9oEsO/4/59ZZ0g99yuTmPB+sULJcmp2iIzTHOLe/KAM8hDsGRxQt2vQu+0hyJ0z9ngy8WshzdtqzELjnVVTr2VLqCCjMtVwncKt6Jr94UtD6vjaym2m0RcVPeCGp3AMwkBOLIC8vvPOm/D+67Kt5rPGXUnXUUR+SJUEYOuGsA7beXDXBPFh+MqEv7DMtxwXKRI81Mjl+rI78GuB9XRQks/dmnx659ZX/9cyu4Z/LvDPh2qsc3vytu2x4DKH6qfqCOFBwU4PF7e7n661ddZpN7bRU2NLNngarffV6r3VTQlKZ1HBMRUkwr0fvBwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=T3Nf1338pMIn6y7VHmrxmZG4v/cjNumWEeVX2n0lZso=;
 b=WUUq0bhLcKhspWvuER9L5D3UKY0viYB9KoCBz0RPkhSmEIbdQFEz+D8geDuG8U20OovnTzz8uM6hA67yauqZqMAsmImBVsySCzzsn5/yj/aiWXTwW/wriLdDrw0lWelGM8eCh0g2X7qDCPENLMcDiR6z1etx71bx8aj5Yv92p92uJCJH3ar+/TKqID+4s+HGfzU29UuUYaqk8qiIv+nnEDbJq7whoXPJHb06bKc5S0VCfXi5ioEK7wHhs2uuTfbKjYlucuDKQhV5Q4E2GS1l1kSrytYFNXSHDefx7ueiOYrrwRDtqHE8O16j3HeifYfDd9+19Nlp5EegvOb7XGjExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3Nf1338pMIn6y7VHmrxmZG4v/cjNumWEeVX2n0lZso=;
 b=dfVOtXJ1glTwvpMAPvpxq2jy9xh23jSpr5rjX6BxrV+BhuWjhHqMhzCl9KbGHLAQFB69OcYGkkFKoqVZ53/bb70IE0fcUpHDMPHAmh4ZPihqqU3aO9xLENwJf7+RB46RiZIT6HKskDwACU61bwT5Z/293CjcO1kU7pM+zmAaeE8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3875.namprd10.prod.outlook.com (2603:10b6:a03:1f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Wed, 8 Sep
 2021 14:39:30 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 14:39:30 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 1/1] hmp: synchronize cpu state for lapic info
Date: Wed,  8 Sep 2021 07:38:03 -0700
Message-Id: <20210908143803.29191-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23)
 To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
Received: from localhost.localdomain (138.3.200.16) by
 SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:39:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2d2e645-fdc7-46c8-c5aa-08d972d67725
X-MS-TrafficTypeDiagnostic: BY5PR10MB3875:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB38755FE6C641B25ABA3ED41CF0D49@BY5PR10MB3875.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ks5H/j4jLybZw2V5w1oV/XbWueu4b3UmYIDiw0ZksxNm5p6mwJIi+Lx9uIxzsbBf4cue3JvCzljvKZi0lA1vRSnopgL6Wh+5mKvAhJbPYKcgmyonH0r2Hy/wVvcKeOsP5vaLqkmxGeTaqokU8nL7cBqDFTWz7aJgK6LTPZQEC4JfJ577eZW2zLL0y44NUDfGzySR88tkV+3VwtUDhw888Eu6spMWmjnnqHnpBUdA2sPL12AOh8Kd3763JdUExlbP4fVKZgrqTSZro8yrioALN+87S7mr+QZHi2clxV/SlQOtTrS2w7NRhzEDRoEwXm2XnGkxMdLseZHB4FUcHbMF2ZHVbW34irfwx/C/FgUZ35UTMy1QJyX8nD6nmy4ax/zwACg44ZbcLxhfhMvlzqN+LUbu4rgEZ96PJ0hkugrlRzzhMMV+KLRb9vBCHgdDSJUYNwOkiCexTcdJO0+6oHBM3AY/Ag/2EPCWPPfPlhTZuAQFhiSA4tQNPoaO+NqHklNvLLjKLas1C6AasJ4NtfPwX7mPnRtJyPXVA35fdm6B6CCc6LYxbx/hvzJSdKt5KgjzKWCS8u5ZPeF5l2PYgV5mrSq7gCcN0tKbKvGLXy3NvlJu0aV3AfdskE36lzLrjeSRKUOwbAhxxltYJydRwtkMaKqSLKBUNblUQBkStff00C3O7NYRMgPUWG0Urlo9lTOekt4UBGXCQo0KMReAiZSjDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(346002)(376002)(39860400002)(8676002)(1076003)(66556008)(66946007)(66476007)(107886003)(38100700002)(38350700002)(6666004)(52116002)(186003)(316002)(478600001)(2616005)(6506007)(26005)(956004)(44832011)(36756003)(6486002)(6916009)(8936002)(2906002)(4326008)(5660300002)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bpqgY9Ij7tAGFaFRzKq1dOJyQamcsYsqlTafnaUgFXZvzDEZ7RZ7z420BcV1?=
 =?us-ascii?Q?Nzax0E1epydm7214FzsLAbbNqWymnoFrpk0LEJbHb04Lmty3YAcL5UvfDbMD?=
 =?us-ascii?Q?DikDocsnDmj8EZOOUKVMR/pYIqwpKgkJWU2wi8RcQDldrLlC2SlMPKtKXj4X?=
 =?us-ascii?Q?bnii9A22XLgm8tj64xzfs2JEVZRq8GhoRpPgPI7nX0eGqComWLbrXP7/ue5z?=
 =?us-ascii?Q?PebBAs/TFD45LqcIsfD6W2Wr4GnUONtIQS4qZLtDghXb2ljWuyPN1e9gvxNS?=
 =?us-ascii?Q?NRwaZNEGcXP8x9WsSbeu8RQsjT4dXDcewSp/lK6MpZeUPwYM6IvpKP38N8rd?=
 =?us-ascii?Q?dKNliDTIrEXwbfRrwew/vXStvN9sxhr6OInRPKldtzzfzNtCPznvjK6L4Gq2?=
 =?us-ascii?Q?N+Pqdg29HPFCvvvY6gjPctQeH41QOStIoNq4Eo9lstzAZeuiuG2Wci1NwpIZ?=
 =?us-ascii?Q?Hs18uNVD0oH5m+TeWNnP1CGS7Y98ggfJcNqyew9UpRgA7HXdDovL3YTxXewt?=
 =?us-ascii?Q?phFXwtXdwVuife799dt34OGwk08+aaIZ4ZaijF3Hr1tZl3pZCSJtlOXSV5rC?=
 =?us-ascii?Q?mT3edE1famuUSKMXXgv7i8potYoa02l0WJ7aVGfWr2gSQ2MyjTM1OfDOmb+W?=
 =?us-ascii?Q?wE8q30y1BH39iY0+LyHmOSlGe6+ejjkCRrEQRAnIVzGPAxViTsihRmNrVX41?=
 =?us-ascii?Q?10onqa7MHmkIDyue8KOCS+zFqnfJdGs7f5q3oRE/E0jUreiSG50ruYc+K5Bu?=
 =?us-ascii?Q?5I/3WuYHAwiHiYeum8dtosSPCrkTeG/r+CE2RiqGkZq9LdoB/WakUTipfPuz?=
 =?us-ascii?Q?Fe7BzuyIsMBXUu4oWfsQ8lyhBSBolFmTax/OeyHBiDdFvbgBpLTVPRcIs37I?=
 =?us-ascii?Q?UngB2GDMdvR7ghvLJbgDy70+o4nrY32e6DDy0/sRATmTGeyVEzZrwYIbjD+K?=
 =?us-ascii?Q?sqJZPyVOF9/p5d5qBz1tQS+hU2lu+mnckMz47og9GWjj5LBb/47STvIZCcbr?=
 =?us-ascii?Q?xY8AhwPlaGkb4s132lcH4Gkv6IaZ0kPMwS2Ssgr+o89qZh/YbfL0iUmDKBo5?=
 =?us-ascii?Q?SeeQDIjHaycFDKwudxKTvMoJyR03I9lDanMgib3hMd9iCZQ5+99LMDszV1Ps?=
 =?us-ascii?Q?cBB/PlkaxqMSQGZh7eoDmCmL4jdpRpspNDoJ9I0O6tES1hkespVKwzIqee2W?=
 =?us-ascii?Q?RYjOyYeyMcWYxqMlWe6m5tCXt4ILWtpFxJySK76IJt7jLtYtDRUTmNwxeuXc?=
 =?us-ascii?Q?cfvNPDAEVwkczGkJXRJRooadVIP53NIF/looqUmorwNq1FSRjoF1/wkxg+qn?=
 =?us-ascii?Q?72n73MHTqbN4H6oABHNlr0n5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d2e645-fdc7-46c8-c5aa-08d972d67725
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:39:29.9076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMuuOWx/oHzMxdDq47UbjHAimk4uB8kZJmPvOCna5zgJkp9x/2H5npWVl5mpJR35e0Gm3/70bhcsCHYbLUGcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3875
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10100
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=970 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109080093
X-Proofpoint-ORIG-GUID: XjRBnMBfH_fCfnhizRa2qz5tuCsDdMWE
X-Proofpoint-GUID: XjRBnMBfH_fCfnhizRa2qz5tuCsDdMWE
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default "info lapic" always synchronizes cpu state ...

mon_get_cpu()
-> mon_get_cpu_sync(mon, true)
   -> cpu_synchronize_state(cpu)
      -> ioctl KVM_GET_LAPIC (taking KVM as example)

... the cpu state is not synchronized when the apic-id is available as
argument.

The cpu state should be synchronized when apic-id is available. Otherwise
the "info lapic <apic-id>" always returns stale data.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
  - I sent out wrong patch version in v1

 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..d833ab5b8e 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -656,7 +657,11 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 
     if (qdict_haskey(qdict, "apic-id")) {
         int id = qdict_get_try_int(qdict, "apic-id", 0);
+
         cs = cpu_by_arch_id(id);
+        if (cs) {
+            cpu_synchronize_state(cs);
+        }
     } else {
         cs = mon_get_cpu(mon);
     }
-- 
2.17.1


