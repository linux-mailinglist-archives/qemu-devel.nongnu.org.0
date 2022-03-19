Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD24DE5E7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 05:15:36 +0100 (CET)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVQV5-0005pN-Em
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 00:15:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nVQTU-0004v3-Jx
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 00:13:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nVQTQ-0004nz-I1
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 00:13:54 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J1VW0Y017377; 
 Sat, 19 Mar 2022 04:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=+20sGeIIbTMis7KWxBNX1qivIZNgXIx95BeebeIqFvU=;
 b=V+Xnxn6EfjBGtbXreilr3rpgkkM/LO8nPmuHVHguCGquzvKXnoOBEQ8ZiOkneDLhWyGg
 JpEQNziZXQqV/WosVF2Cg5F1uHJwbW5gtTmxMtd1jFo0VavNmn2tohZ71pA7Ioq2+zfz
 h3ERKd3BpPuqTQ9IOZFT5boBaYWtatCBalVhmvOxXu/ZQieSQQf62ul6yUPmKdMza6Wn
 Qhazg9pXgJtlK2TcetS5vZn0kOj9UhexxWsevoeZMpRkMzRKe8sTBq7g5CORXAkaT+F2
 yvTKQ368A/hkA2KXpmp/sqBp1R9RxYRXclcYuwpMqhRjcM1EqBnWxRA/X3XX+YMSs3Wm lQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kcg34f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 04:13:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22J40BjI009696;
 Sat, 19 Mar 2022 04:13:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3ew6yygq28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 04:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVcx8tAMXtzQxaOBlN9ftUGojMDe8qnAueG9KkiPfoRm5w2IJ2t7TeWaRgXB65qehUuakVNSToYTGgAQalvGJN3ScT6Id9aD00c5gaX5CFS/MZEzJNG0pEX1IcpPqc5lqshi0XlHTr901c3dET1aKU276jKeBNwzSDD7vGTRP8RVPGKFLGS4oxiLwIZLNtF0q/+8MHf7VHqdjkEVoSPnB8KKFNBlMTyOD/HoUXsHIwQ2GRQTRhcBpC7fdu/L5XjpZpo4uhJPeaZIEZctIhHC5FqGWjd+jSWkSpnx3ZgWzU8m/kL/Zd1W8bo0yskVflQPMf8aovn8ygyfdz/uC+nBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+20sGeIIbTMis7KWxBNX1qivIZNgXIx95BeebeIqFvU=;
 b=ONdmaIhnsdknSBoVhdHq8A2n/1DSFJdFrrC+BIBdCcpogy+3yhjjFgnKk2H+tubfxDTGoxej417Msr4oep9D6rPp4aVjf7hXruVG1IlVT4yLCH1PUrA2CTLOHvGYFr5ZgcTHl9fdu/Zk6+o1pJHk6sICtx/X5F4AKBE3GwC0jsDjlf2bvFqc3zJ9PqeufUmJn4GhcHFajS3ZmSNuH8l7G1WTx+DiD7QHuAXhgf8wEc8kDBUx9BV7pNiYVZ1rj7uVCcbqu17LVcn/aB053TgcIGhLMTaOwnR0R5JlJCFTiCENmmHM6Fdu/Ss0X4bRr8re2wNVKFTuL+VOys16unQYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+20sGeIIbTMis7KWxBNX1qivIZNgXIx95BeebeIqFvU=;
 b=E9G4gg76JMRmpkJ0hgIjFcwtwyV2k9nLfBw4v7pv4jtsh9UuImfw4z0c6mycoxTkiat5awa3EpkoAuQeIfE2F0bPC3dhj0reFO6OkN47sgcb8eeZoJtcVoT/KJoQjCYAbuoqS/oIrc31elb/KKHMEf8w/Z5CVNKLX5mlgY69DDc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB2604.namprd10.prod.outlook.com (2603:10b6:5:ba::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Sat, 19 Mar
 2022 04:13:44 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 04:13:44 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com
Subject: [RFC PATCH] vhost_net: should not use max_queue_pairs for non-mq guest
Date: Fri, 18 Mar 2022 21:13:36 -0700
Message-Id: <1647663216-11260-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:805:de::31) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3c24699-f3bb-4004-a051-08da095edb84
X-MS-TrafficTypeDiagnostic: DM6PR10MB2604:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2604B2886B1097023104BE02B1149@DM6PR10MB2604.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5uz24xb1mA2zyZ9V9v6iAbvHMJaFl53O1ERuQ62ldrzlNQyByrDD40oQPJFs739U3Jd5sU5DZgWYwinFFegDsEyKhm6NIfE48ma9a7/aNWYeA1cLFlTq3WD9cDAnPu82yP0ERFMvQgQXQYUOqDVXsfzREiA6673vtpPw7FJrrgPrnz2ETEPibeNHrzqwvklt5yK/t548UcPuWKDKYggqSU8p5jJUl9L7bUkvwJQkTz7LABg1JIgYQqC/Gd8ytN6UUaXZedUJVw/r8kY+sHaYFbaSjoySUCwr4HwS9Ox2XczoRAXipC18dUo50plLcC/wdWCBJhOSM/GFxqpQb/iyedP8Uh/myZMDLlkh9JImao194pGO5YW7Tu6rNaATaelZQ24mFP3HHoCe5G9mYA6RYlN/Xm4nEYkaiiKWUq6s97R2vgGIuYqwL5Wj9Atf8dLKoHfPZqDvKIdCxIZqm+4jqOMwKYLnhrLWM9E2oymnUCAiUszWNcyfQwxTVmu4+ZdX7CttqoEX8238fSJBuBI73FoL0fxXpub3+0uMC50XAZQ7QZ9KRaZEVZ7ZyKKe7NMbp/V/c75o4TCbggv3Dm27LuZvqePJYzH8u/He9YH+WzzLhYEYKOM1ft8J3SKS/b/l8xRgDewK0z95KYLT9ha0DUPv9l4wqltrudOuLRe1pIeGezvzR+5lpz097tgqp3/Nx4H+RVaNlcoki23V06hPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2906002)(107886003)(2616005)(66946007)(66476007)(8676002)(4326008)(66556008)(26005)(52116002)(186003)(6506007)(6512007)(508600001)(36756003)(6666004)(38100700002)(38350700002)(8936002)(86362001)(6486002)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D+Db7vJhcJfvH2lfQSDPE8q9XVvwUvTCWQmeVcRqPkM2WQ4fWaZYt65tu3KU?=
 =?us-ascii?Q?J1FV6MNhmGMFJ0PuOuUyoehkO6hqqDToDYlaxMylENtxrsZDV3URgVfYSdcc?=
 =?us-ascii?Q?69QwfWOn1jqqpQqI3s/STWU5lpaBzPeFkle6Z6PhGGCEKSrYRkiBJDUAygrR?=
 =?us-ascii?Q?pjMepvRNND8mdApJg2poX3HKTuYmiFWkqT7t9WYwaDnVfruGN6p7p33iMd5o?=
 =?us-ascii?Q?IcKELn/D1I0CGplLdhdf9zYC8GXTonP+1yHcnTFawSd5yMXYxu3tjDZk49lk?=
 =?us-ascii?Q?DXx7dEu8rk1ET6xNKdlzZca7PIT8S8QoeOA5QBZcpcgQOvJVQQZeUsxWm+Lm?=
 =?us-ascii?Q?HZxKhDuypeE1dCeixubgWTyEI24rsSX9pZ+Qy5ZQenzAb1v26MtXwE3a5Ix7?=
 =?us-ascii?Q?EcsA6hJkbnaFTx9CNUv82tgyKGjackHp/z0nv+qhrXuUJcjqBCB12/3A/2uX?=
 =?us-ascii?Q?O5inb/z/eS58ZhobBksZbYrrtkTHAO0JDxuGYfgwWsAtisJN6pSKkj8Jp6WS?=
 =?us-ascii?Q?5PKHweYFjQxfA5utKXegK+HtOdFIHZqE8qzq+YdWAoYjWMNQsNPDd6+WFOPp?=
 =?us-ascii?Q?SU7YRNA8Om3CP/GZOUsxq9svDeGbsgL5cNz08znFAvw52Xt2CHyKujkFl7mC?=
 =?us-ascii?Q?ZOIIPWbFQd/pbEL+u7Q6TkGYW3v3b3a/eKOTPWZA52LPerIXJ2kXBC2fisEk?=
 =?us-ascii?Q?6auChIDj2gAjP3lYzjsQL4fjxg5LMOCbG+aVkH9EJYdmL5E2aq2dUmAL/tw+?=
 =?us-ascii?Q?wuJ1iKWp8JDVVvBd/yRcvvCuHdguS5hZiPej42rXQhydgBYcSnvDz1BQLfiO?=
 =?us-ascii?Q?D4rY5kPGnEvzgV32QqtYx0NW4Q5DY1U+YSOMFu/JfCvslqyjJuI2CX9wNKWy?=
 =?us-ascii?Q?oYuY6qu5sw9OJJ80YX+J328Opkkk170hiMwIbabQipMKdMzz8RR+5yupi1Nx?=
 =?us-ascii?Q?K3jgKGgBWSXPryheEweAWefegO3PeqygSBWbtdUezHXdmsqGzR9cHKzuY4hO?=
 =?us-ascii?Q?rE8cOD198nvVEGPBew8caVi7jgen8uZOaiThI6hL1Q+kq5+cXkPXSB2DFMzm?=
 =?us-ascii?Q?k24xWq6f3ZGB0nD4cRlxY1AXvOSi1tcOSu4rtHz65WS3eWTDoWTJJ9sPCATc?=
 =?us-ascii?Q?7Z2Jyq0776xnZsRv51OWyljbFO7zGlLT+oDXtuqNVyQaKZvtm4dIdGel8OHB?=
 =?us-ascii?Q?/yTGFADRu9O5hdgvveYp7YrGNc7LSahkg69t0YyjNK5kiUNxR1lPjKxkYK+s?=
 =?us-ascii?Q?Wt2FfLs4/BVWVPZOTx15T+P+Faq6NHWbrCc7BUVc34IDBizOOgVbq2VtMks3?=
 =?us-ascii?Q?4yi0j82HQ8Aw5hvuGY4IEaAkim7uANdvXjNRkIAHfNFGcjNuc+Cu/8NUoC0K?=
 =?us-ascii?Q?Te6NcLcWE+5bw5r9G2spI+g0bO9VLEVAhNymn+MfbMjl/IPiSf5pU4wi6mtG?=
 =?us-ascii?Q?/YMf9yrep34l/LKhXquzW5l6IMSR/wMUgJ35cUuSO4zWDWLKNnCiEw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c24699-f3bb-4004-a051-08da095edb84
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 04:13:44.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAYG2tADuABsoeTS1hmh7B2RJWdmwzs8uz8XL9V8MB/Q1AbSbjEqQ/D5L7H9GRFRzwYF/cmUmgTe+ZdwdIg1QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2604
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203190024
X-Proofpoint-GUID: dflwhlatweJKFRe9vEJ3n9BxzihR-lL-
X-Proofpoint-ORIG-GUID: dflwhlatweJKFRe9vEJ3n9BxzihR-lL-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, eli@mellanox.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With MQ enabled vdpa device and non-MQ supporting guest e.g.
booting vdpa with mq=on over OVMF of single vqp, it's easy
to hit assert failure as the following:

../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

The cause for the assert failure is due to that the vhost_dev index
for the ctrl vq was not aligned with actual one in use by the guest.
Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
if guest doesn't support multiqueue, the guest vq layout would shrink
to single queue pair of 3 vqs in total (rx, tx and ctrl). This results
in ctrl_vq taking a different vhost_dev group index than the default
n->max_queue_pairs, the latter of which is only valid for multiqueue
guest. While on those additional vqs not exposed to the guest,
vhost_net_set_vq_index() never populated vq_index properly, hence
getting the assert failure.

A possible fix is to pick the correct vhost_dev group for the control
vq according to this table [*]:

vdpa tool / QEMU arg / guest config    / ctrl_vq group index
----------------------------------------------------------------
max_vqp 8 / mq=on    / mq=off  (UEFI) => data_queue_pairs
max_vqp 8 / mq=on    / mq=on  (Linux) => n->max_queue_pairs(>1)
max_vqp 8 / mq=off   / mq=on  (Linux) => n->max_queue_pairs(=1)

[*] Please see FIXME in the code for open question and discussion

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/vhost_net.c     | 13 +++++++++----
 hw/virtio/vhost-vdpa.c | 25 ++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2..9a4479b 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -322,6 +322,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
     int total_notifiers = data_queue_pairs * 2 + cvq;
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
@@ -343,7 +344,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         if (i < data_queue_pairs) {
             peer = qemu_get_peer(ncs, i);
         } else { /* Control Virtqueue */
-            peer = qemu_get_peer(ncs, n->max_queue_pairs);
+            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
         }
 
         net = get_vhost_net(peer);
@@ -368,7 +369,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         if (i < data_queue_pairs) {
             peer = qemu_get_peer(ncs, i);
         } else {
-            peer = qemu_get_peer(ncs, n->max_queue_pairs);
+            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
         }
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
@@ -390,7 +391,10 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
 err_start:
     while (--i >= 0) {
-        peer = qemu_get_peer(ncs , i);
+        if (mq)
+            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : data_queue_pairs);
+        else
+            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : n->max_queue_pairs);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
@@ -409,6 +413,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
     VirtIONet *n = VIRTIO_NET(dev);
+    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
     NetClientState *peer;
     int total_notifiers = data_queue_pairs * 2 + cvq;
     int nvhosts = data_queue_pairs + cvq;
@@ -418,7 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
         if (i < data_queue_pairs) {
             peer = qemu_get_peer(ncs, i);
         } else {
-            peer = qemu_get_peer(ncs, n->max_queue_pairs);
+            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
         }
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 27ea706..623476e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1097,7 +1097,30 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+    /* FIXME the vhost_dev group for the control vq may have bogus nvqs=2
+     * value rather than nvqs=1. This can happen in case the guest doesn't
+     * support multiqueue, as a result of virtio_net_change_num_queue_pairs()
+     * destroying and rebuilding all the vqs, the guest index for control vq
+     * will no longer align with the host's. Currently net_init_vhost_vdpa()
+     * only initializes all vhost_dev's and net_clients once during
+     * net_client_init1() time, way earlier before multiqueue feature
+     * negotiation can kick in.
+     *
+     * Discussion - some possible fixes so far I can think of:
+     *
+     * option 1: fix vhost_net->dev.nvqs and nc->is_datapath in place for
+     * vdpa's ctrl vq, or rebuild all vdpa's vhost_dev groups and the
+     * net_client array, in the virtio_net_set_multiqueue() path;
+     *
+     * option 2: fix vhost_dev->nvqs in place at vhost_vdpa_set_features()
+     * before coming down to vhost_vdpa_dev_start() (Q: nc->is_datapath
+     * seems only used in virtio_net_device_realize, is it relevant?);
+     *
+     * option 3: use host queue index all along in vhost-vdpa ioctls instead
+     * of using guest vq index, so that vhost_net_start/stop() can remain
+     * as-is today
+     */
+    if (dev->vq_index + dev->nvqs < dev->vq_index_end) {
         return 0;
     }
 
-- 
1.8.3.1


