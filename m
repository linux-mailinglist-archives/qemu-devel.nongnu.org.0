Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AC3C8957
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:07:32 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iM7-0001nk-Qx
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC9-0007f1-De
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC7-0003fD-AY
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:13 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGtQLr008692; Wed, 14 Jul 2021 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=VFu4Dz+F/xmO123Eque0chsmP6ewKV9gQKrNZ/jUFDVqK46KEagqS6ZJQFME6IoqTGsG
 zNqGEfCBgj5X3xC8xv/79ASaFzCYDfWyLEqqk9dYSr1EWgKOccGC2FUa1MSusVDV5+hg
 kq97Ze016qC1ImGnwqGYye5pj3aox0tutd7X5hUgTEp1K9c0USlfBMX96Me+bwQw4vy5
 kBqtSy57hd7KK37uRy0MO21gbw2V2akJieCc6pazV9bjL/YapcKYvoSvLq7JEjNtreSm
 fSrzKSc3qFO6lvxSaypvto9AwD1E1PhsuK8e9EK9uopnARMITNKWgSU8bteMso4PFY8p Qg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=LiimVfJEtPUum1EkUXsr2Hqxt+enjPUHoxv8T7RAOYzDT4WPDBd5JGvDv4Pfx/t+esmi
 KLcHaFGdvqzi44EQ1X5ANxpdV46K5vIyd7PfueETZpbnuCnkHgJBYKIimZZxg3n7l2YI
 bk9LNrWBpsbQC5DLGKRyzuVizdeHWvWGCz0aIjkQ5zdcr579xb3IgbjEpXqbW69zrbqz
 IjpLSoKzJxFSFCjlXika18BXstG4cCjeSA265cBSFtKw6+4r/feezJfbcEK9WNwk1lDv
 5Q1PEQJf2RRgP2A3jU9Nnozi+S4YEpVS7+yK12eW3bOYHiSm9G2F6DhOs0wsV2187/f9 uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39t2fcg6xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16EGovqB168314;
 Wed, 14 Jul 2021 16:57:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3030.oracle.com with ESMTP id 39qyd12hr1-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnNOTHXgKLGmhb0a+Jtxk8a6Eez6xWoE6NbS74Bph+1vnLQ3bWZIIexkCcuhmfM3/iOSnE/ZjkSnPldX7cCqMmsnEo5pkupHKOls8+ZPGSCrLsMoLYnncCkF8bXbjpLcQaNAOjpKld9I5IPPpSLvGPCBg/U9JrgAlAelTewTQAmdI5z9EkHZgD7XuqUiYlh7+CxEpVfTbjTStbUT8VBjfk4uteyy9cE67Ruj+afU8jdkl9eXekILpN6D4aONF51dGbAzan6BPE90IopGwTKA0Ex1g6g9juEGZmYKv9u8YGEj4p9VR2NGhl8OqkJpDWVMUewmNwBm9TgWysND5zFTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=THJCmXBm67mT1rlUPFsjA50ar1nlBJlCNudqU+4Xhh1KObZ6JVxgphRNM8qrpLUz1U1TbSAJjNCCxUXxsZlcO+YLvKiogJQ4Cc55YRm+vq5FvgQt3RngbMmoLHvCkTYSoYmgq7qEPJWpF8QD1AzLSV40Dnm6fTU1ArAQYGdf30zR5ZJrcN11dSdmGAfZ28zJ0zV17qZ+Z+J3fIyAALdlISPbNhZxak/4F2LVJRi6TZoJLLD0MN6I6XZvjw4W11xfm9uVt7LJGJKPa/Ba7z1vq4Eu+yJkVe2l/BA4LTbFkPcEUs+SnYK89Z7IiN5bI+sAkbMSU8GuUzsjZSl3slZrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=NMrv0jJPcSaR6vnFMdEnEAJSzopU98JaMcpk0XFlbt8y6ZqOgfWQRJxMIUvG6uNc7kGmzT3lFKqFrI3lBYefNG3GKA4uH6mdQl2+KSr+0w4TSSRawq734iphLNgeXIvo2GmgSYiLfGWCwr1+bi0VWQU9/aP7x51g4DjDwHuvo6I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5438.namprd10.prod.outlook.com (2603:10b6:a03:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 16:57:08 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 16:57:08 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] virtio-pci/hmp: implement device specific hmp interface
Date: Wed, 14 Jul 2021 09:56:54 -0700
Message-Id: <20210714165654.23211-4-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714165654.23211-1-dongli.zhang@oracle.com>
References: <20210714165654.23211-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0009.namprd11.prod.outlook.com (2603:10b6:806:d3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 16:57:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b187de1b-89a6-440b-8f09-08d946e86a3e
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB54388792D939A60F0C6E6E61F0139@SJ0PR10MB5438.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KrL7mw48o6eGUgjHevpEEgiAcYbBBrZhP8WQEbZFMAScfoYU74bhEuYeWFkpIl2MZH1+K1XSBamyt9ikIhOBXLCt/9QwuJz5vioBZQQdWnCO+TM+JwX2jK2FasXZVhO/R8FfVl/oNOVuU+Xsy3w3dj9MJj5SDF/cNuNBrRXQGWBrkIC0m5/KFybYlyXtnuU+6oNATh+LoJJLYjf+LwGq9Bk/QblE+pK9PJhB0p54FHALDcPMbOJcDOxZEuzaYbHeuhQQtKxgiCXkoNw4mO3hTK/phVnhXiwpM4x8JGsX8IFVHNPSmzJza4H6h5Xz+W+/xDUdBvd1oQqXQBVONTupy5ikr2+N1mxqwviMWIiC07p8oA9mPw9CC7DiZh5qUUFT97aXObk3/DzbCaZ15X5obdn8Oedb54O7uVmqdoB2O8fdJcoqwxs51swzMadR66DfAv9hbTwnti0gnzZbnwaFSrlrqacAsI5xf+EB0KDoXIhy/wcbNp6hUrpj9hBeRv/lX2yoOpnnAb5Fpuc0LpuqqUOs9S/k3Dc26wwl1fLoRlGah5lz1/7+TwDjq2mINI0sp80APHkDa8XCkCBT3tmA3JJM2Vd6c4u8x+FrU6ivvPN8JgMT7/Mz9e9TDsHh1Npuz+kbf6h2ShUx0ccUPZgVyF1voz2wzwr+cbffig4MJ98rCUqx4bZqyTUaQaIeV5dp+8LxMywMQJ6/9wzIuGa02g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(36756003)(52116002)(6916009)(66476007)(6486002)(38350700002)(2906002)(8676002)(956004)(6512007)(44832011)(66946007)(2616005)(66556008)(6666004)(478600001)(8936002)(86362001)(5660300002)(4326008)(107886003)(26005)(83380400001)(186003)(1076003)(38100700002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WKPUqEXdws/VQw7PONM2MjJ8XsAT7zunyo2t+ftbmoKBs+giAXvsu8cc1AKa?=
 =?us-ascii?Q?x0+vEpk7dC+Bu8RLHurAYZPd9z+snKMmkIcXSzO5SsbF2hXRZNq1tgDcq8uH?=
 =?us-ascii?Q?ibVV69W/eAFOyAm90KnmmWVRVYCQWl5qKcEA9ZzbS3Hk7RhGSb5I4s1aNb3h?=
 =?us-ascii?Q?d1OkSvQLwmeTtKoluquLdy6vKM0YQmFCAg7WrcpnZh+JaJV7RavQvhMAeaqP?=
 =?us-ascii?Q?sftnuFaQG9Z6aJFslSZE9ICyWlrDCc9gwTzgoZO9afNdmxXNoQcqxkbcy8qj?=
 =?us-ascii?Q?Mjosnt8gjTd/3CniQnArRktry8nct+otn+3ek5pnOxNCEPa3rkQN0XWe2djy?=
 =?us-ascii?Q?43aokt0DSofPlMx42v7MtL2DNECf8G9woSkpXjf4tjk/UO34jRxo0hatu5Yd?=
 =?us-ascii?Q?waLuolx+aXw9JaDRfUd3A02qelfCunz/2o14VcmPtbv5le3N7K5LDI4yvZe7?=
 =?us-ascii?Q?0xvY3Oros+24Lcexrav2mxVXtNs+N8KVwacQ4rZBKA3d6tAtoKnO+iz80/Fy?=
 =?us-ascii?Q?EWh/++iq51pTGzVAUo5JAA7iGbrzH3CBz4i7ifJ+SEaIk+AJNV+5kytocqnE?=
 =?us-ascii?Q?c5SqeXuUZXNuSDd1iiCgRR9VmvR9YLxAwUiIxkVp3Oc027Dx797nEFo09QpJ?=
 =?us-ascii?Q?8aqdmXk+XaltZ1MwkaN70/ZzN/JAMhrBfYPIrBghNvkw3tKa608ra3dhiwdj?=
 =?us-ascii?Q?3gYsTd9iqtlHqfz34r/Il56e3OCAYAKJJUqnJq+EhHZVKvw3WsbWEuBlfyHi?=
 =?us-ascii?Q?PaspS2RLBMXjI1+TRezhKe0YuUNqmNQ3N+gmf7uqEZnzEpDfqpvh/emhIZ5K?=
 =?us-ascii?Q?G3Ndvrj6PST+uQE4N15BLwth94s5tJJsYBQPbhqTkE6YAC0jKIYrtYSs1zXx?=
 =?us-ascii?Q?6zB5ogSz6DF7jMoikx32Yy9YMfWloZp6nDA+HqYUEo7dOZSVqmQ/129CHQ1u?=
 =?us-ascii?Q?jYsaNAe3q5rTeE3F2NaoxiThPvDypnBClWVOiGstGT/TgdG3he31umhyzZIZ?=
 =?us-ascii?Q?e7cu9sTrImJ6z6GTGb2qdYmRbbB3rLJLyO/7ytE0UgqP/T/EEUTws5BHt+iy?=
 =?us-ascii?Q?VCaKNis9+Brq/dPkvYHFNrmTT3UcXnRoRNm//lMK4MsDoJOqfc4PCiQzMqvU?=
 =?us-ascii?Q?591BFjRxQvuEawa09jIWIyYJpssbFIhcd82bWgZhVvwDAURWJD+8hF5k4QWV?=
 =?us-ascii?Q?FQTqMSy0pjy3f0pM4e5La/eGsy3UZwicuv9DbJhdMombaAqHusy0PHaC6B7s?=
 =?us-ascii?Q?M7YKHqSBw2/3CKD2zGfFBFGCFf/7YqZIUXsjSa4UUMh02qKBe9YB3SUrXuwp?=
 =?us-ascii?Q?I8wJjh+7Q1udNzPPFavVMW4L?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b187de1b-89a6-440b-8f09-08d946e86a3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:57:08.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsdVhe6O2EDD3Pn3Do4IvrMEq4JUhYOYnxwS63R4Sik1nyj6Iedpr/+GHuw2VDnBOS9Zhg4nD6lQrC0QumvD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5438
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140101
X-Proofpoint-GUID: Q189zVZsaX9bke-fuJgcQHtkYrFqc3ql
X-Proofpoint-ORIG-GUID: Q189zVZsaX9bke-fuJgcQHtkYrFqc3ql
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

This patch is to implement the device specific interface to dump the
mapping between virtio queues and vectors.

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

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++++++++++
 hw/virtio/virtio.c         | 10 ++++++++++
 include/hw/virtio/virtio.h |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 433060ac02..2971e8049c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -38,6 +38,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
 #include "sysemu/replay.h"
+#include "monitor/monitor.h"
 
 #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
 
@@ -1587,6 +1588,26 @@ static void virtio_pci_modern_io_region_unmap(VirtIOPCIProxy *proxy,
                                 &region->mr);
 }
 
+static void virtio_pci_dc_msix_info(Monitor *mon, PCIDevice *dev,
+                                    Error **errp)
+{
+    DeviceState *qdev = DEVICE(dev);
+    VirtIOPCIProxy *proxy = to_virtio_pci_proxy_fast(qdev);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    int num = virtio_get_num_queues(vdev);
+    int i;
+
+    monitor_printf(mon, "virtio pci vector info:\n");
+
+    monitor_printf(mon, "config: %d\n", virtio_get_config_vector(vdev));
+
+    for (i = 0; i < num; i++)
+        monitor_printf(mon, "queue %d: %u\n",
+                       i, virtio_get_vector(vdev, i));
+
+    monitor_printf(mon, "\n");
+}
+
 static void virtio_pci_pre_plugged(DeviceState *d, Error **errp)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
@@ -2004,6 +2025,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     k->revision = VIRTIO_PCI_ABI_VERSION;
     k->class_id = PCI_CLASS_OTHERS;
+    k->msix_info = virtio_pci_dc_msix_info;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
     dc->reset = virtio_pci_reset;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a..ea54939e98 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2581,6 +2581,16 @@ void virtio_notify_config(VirtIODevice *vdev)
     virtio_notify_vector(vdev, vdev->config_vector);
 }
 
+uint16_t virtio_get_vector(VirtIODevice *vdev, int n)
+{
+    return vdev->vq[n].vector;
+}
+
+uint16_t virtio_get_config_vector(VirtIODevice *vdev)
+{
+    return vdev->config_vector;
+}
+
 static bool virtio_device_endian_needed(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..6746227f73 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -268,6 +268,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
+uint16_t virtio_get_vector(VirtIODevice *vdev, int n);
+uint16_t virtio_get_config_vector(VirtIODevice *vdev);
 
 /* Base devices.  */
 typedef struct VirtIOBlkConf VirtIOBlkConf;
-- 
2.17.1


