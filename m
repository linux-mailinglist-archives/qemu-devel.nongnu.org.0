Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4415652661
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hTj-00010F-R0; Tue, 20 Dec 2022 13:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hTX-0000rl-WA
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:36:28 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hTV-0000W5-VH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:36:27 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKCqp2q009283; Tue, 20 Dec 2022 10:36:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=uTWqlIeX9B3k97uNVfyADarEtw/9xhKPe2a0pV+J6gn7kNQUTec7e83ubz+TaDbVZHUP
 BFReTlSjbz50/gNqFl74/5yLxin5RXk5sJQgyZBh7MB32OnRd/oUFg9MjlwxOzbxCPme
 VmCbG+HkPX9gW03gQw4jxDn07JNAPIlIX9gxOd9+BVyoKcg5nL4kQ56LCWBBrNVCKX1c
 5zMNAMsVaSyg2y4xEbYzKjCjRymTnHmAFw1/mfD0hvuN3SL7m8kNsj6fyY/mM4tSGTsz
 MFzkFzmGRg31+vUGjpqI8ITnBch6ItalDoteQlJVzKIsKuVUk8w0KAhdOhAA6v3d3rAh XA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhc6exv0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 10:36:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS4Z5d98IVCzDvjwd7x21JabS95T64lMhCTa7FBzDaGukcM7sFzZhae6Brfn3ZlUoPOYjGrIIlgUjuan7WnTFDaTulpssnCvv/ytBZOFJWpVuKbdi710+r/tbjUfYgQgmH3z9flxiw2dswzrsky3Lsf26EyfPlonvmjCOaCK8ajRkxQreo/Vg7ofjTdUop9p/N2NL1u40zOBxMG1N+U9pDYxMQoxGPOm6ZAKdXjwZ/xKOCyy+dT66c+OjIZvoU15B/00aCpMxNh5+Zv6jjoVkxnKFCp7nN63609muJRVUE6oDx6WH0GB6W6DztB6biuXEaxIeF6mWOD/XRjfw07DPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=MJe/wBkwD4n7Fm+WOJ696OL6vNihYhmSvEG6YpgeJ7CwT1FAPYuqdYhVmZtMQapLfOYidYik+V+36QnhVeWH52+y2RVqY/c3yDtz6qTiWwrYS3/YbudQYsYV6fC+Zi0eTnST3t2U5/KmC9Etol2aIJO+MKBqoZvty4GyIUlOU9dpwPY9vf0PuxRQkx4R0mjkXpoVjIRg1w2zRqHRYBlwtIZww538BnKV91rcH1Qsdn4wLErB9un+yDnf65TKu4uoS3MxzEFartJq+3YluZaSp+MNuwkXnBn71DPb0PSj64dqVnHKsw7TbRFrFyIGB08Z4NG1Ik8YfgMkJ98romo2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=gh3QLjJH5zN+N955A4AhsW4bm8REMPSjwmoSSstdwC2PWcVRoLMRaVks3Xx1iuz3JWPhX3mxLZxdk+w3J4xWqE0jSSgjHkfNbx01M62MaTlbPy3BNVx/XDRqn9K+ZMpgt0PIUJAFPAnS3975Sph+fmmhdb3J9XO6LQ9fcWwhBss3bKclVkPyekKEwnPoWkJMuUQsi49qrFKEPSQKe8sEBr7k+uHy1v8pnZl3agx7oi7tB9vJw1ck5+/11s8/71Uv/VX/5BspkbBGCfx9uGGzANqvwXxUir7bAcdeizIx3L8UrFR1vBgzwFLUN1FqeoFIg0T4CEv90n1r7+wLK7qdDQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB6652.namprd02.prod.outlook.com (2603:10b6:5:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:36:20 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:36:20 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v6 0/2] check magic value for deciding the mapping of channels
Date: Tue, 20 Dec 2022 18:36:14 +0000
Message-Id: <20221220183616.228621-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM6PR02MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4bfe34-2a99-4bfc-b2e0-08dae2b916bb
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiBnLKs18NRBvDl6qvmT20JIMOCzUxeyQQsjTRI/cVfoJ6TooYqu+5CywWmwjxLARVA/wPH220liNctsI7gA/fbD0WgkkzPngkRwuXaykHpkcgXYO3z5/Fl694h65mrJdy5Ev+KV/SapvDSqr/G68ok/1ruxhnrU4wyDlAtCw7X6op0p+DE24zaiFTHlQzgdIDLaVkxgO5HHvTnjmk5bsOXWQitgRmzNc+aHvf0x8tXsh3PbPDgmGOkkS5UD36Z6G7gpk4DGom1JUBzmcsjoD+UEMj4musOMSHO52MWBsqb6lzXg5a9xkjtT363EkHb+HIS0jmcSqFci3IosTwLuxXXcMYF53XNdndDc/COG9gCb4yr36KtQBCSS/1cRr/ogTpRoiIZxp8+uj7CEVFSNS7hbCIPyyms07B+TVyGbTmPa2hy0AK+qnozAN1Q5gaLdNZBS7yAX5De2HcWnDhLJy0v3rak3qAB65+IPMDL/vXU25PZJ6DPD7b3yyHO0nR3/2jUuDMYTfC7PmHgQbfDh+BNd0uIQoSi8p7zEEDbn/7uh23XfFNHLriORQJg5ubgjCx/3//7q5pKxx4HA/CNhzwLHYmQb5vdEkMd2h7g3kXJA9hgvpyckQjidhaPW2Mgchkauf2JYW3e9h2ZCkqe5JDMjawQ6K9E9SpoYMYya/rCJS3Q+2x193FpxN7gq1gtEvuOcfCkv9C6WM11ZpJadAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(107886003)(6506007)(6486002)(478600001)(66476007)(26005)(66556008)(186003)(6512007)(86362001)(6916009)(66946007)(316002)(2616005)(6666004)(8676002)(1076003)(8936002)(4326008)(5660300002)(36756003)(2906002)(52116002)(41300700001)(38100700002)(38350700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/8nJlUsb7eHnreVmYNfxxrCM2yxXt7/dzH/3Ht3XZFojG/pXPW2J0U9Gf/j?=
 =?us-ascii?Q?ZMr/Rr29dOzmTAGwsUTBFwUUUirwjAjIaHUsVVDTO4Ih73039nI+TpSRYF2z?=
 =?us-ascii?Q?63OQ4NAAPDuG2aL8T3OnvWIZ3366BtQoTrK8kmKY8Gf2F9z68DPRFk3ZFjcb?=
 =?us-ascii?Q?V9Cs2RJ0CnTHAUPSmYNXvNYNz8OjTTSidTVF+mHMj2RmVYHsAXgJHcIMXmB7?=
 =?us-ascii?Q?IwrTxlcibhUWP/b1BfJz2p62WE0mCTRVGJM5eYx55I3XLP+ZS14cjLbm/1y0?=
 =?us-ascii?Q?0YCv501qt0+322+PEe0rd6vXcdazd3KnHrcXwyfbMKCAog5iLSTrdJDkqmTg?=
 =?us-ascii?Q?8p8jP2CwZbEoIuF/XhCzJJYUJrl+/+LU6hsLGqt+3DFSezvtmui1q09g1ou4?=
 =?us-ascii?Q?Me7bKd/sMNJ2z3Q9AbPEHJvpUS1yhT9/S5mVy1kwx6UxO0X6Sf2SZKa0y7qs?=
 =?us-ascii?Q?6Jr25/z9leFzjcPl+drSNUFOaxSK54gtc5VMhYe8sHMgo+ADhzISVAE88o4v?=
 =?us-ascii?Q?9fJ+g7yfQIKo182DCrOi8QVOckTueNe2bJB2ioea/rX0G4p1lkwrBJcZSCln?=
 =?us-ascii?Q?yYlmOu4gMoYe/UGkaZTsIw0zFBvvhJengxuaKy73HPfbDAEv8WZt8yVabqfl?=
 =?us-ascii?Q?WmzYVc/ZC5AGKtlfr0vnVSt0OIPggqSxVGu7lumLSTHEuElrQUtDfPoWfhew?=
 =?us-ascii?Q?gLpZVEfsMc7Ak7mwdzV4iQAagt4hknuxBJRhuwWl08O4EooZ21tVc2JmSGI7?=
 =?us-ascii?Q?5IkA6mLtNNWo3A/On0z323UHl9U0BkeCJ3rFuf7ZffJ+G+7zTQLG/A8QKWQU?=
 =?us-ascii?Q?qo6tPd36XuAehU4/OjvogCFmsyl1fe6N/+KaGI8+1nAEqkDJng/+UXyTRTc7?=
 =?us-ascii?Q?LjPSyIcW8spoA2a4J93EC/8p+9u6ahCjEtg3IN3Ne9HRfiO0X5H3xiyhqwLj?=
 =?us-ascii?Q?1cLpZAGUgeuuuRTsBDdC13EG4EguxtspvKAGFVt/JJgdvOc3WiT3xWhSe2BJ?=
 =?us-ascii?Q?hZISahOcVMCG+9yKrI9dtzkuZnLFcIjM7+TIrdBDbU5zoxFY5w37OHUph7Bs?=
 =?us-ascii?Q?UTaiUaSmoNo87DdBWjQfPEL21hunFteXEecojd0P9VOYYRhi5r7+oKwKGarh?=
 =?us-ascii?Q?qA5weQhFNLxGmFt2TNn2MKo49mkkQSqAmoEIJwhbSrtZAWVJZxHBEj+dsRDO?=
 =?us-ascii?Q?orjvXcXod0fmA/Mup2wEGw4HBrRQ6LhDf76ncBHL44mv6LdnDgJ+RYKTHoTy?=
 =?us-ascii?Q?6JzcRSTlUl/6sV9PyBs9BJZ859vv45H4AAS1yJL+/FRsjQZbB/kKfAkGmGil?=
 =?us-ascii?Q?84nP4naH9ZnTk3srwjv3yF9A8DKNdsgdnDtIAx6PtKPR0geRDmUvUrZ3+h/w?=
 =?us-ascii?Q?OfkCXrqPZ7fos+6OXUgSP8iWSZ+Wq2S3nQjZBk/bmR8NbXm3L0aHlNrZ0ek6?=
 =?us-ascii?Q?Qq8qheZfhY4CqBp8ca7UzSUJitVpGX015550AEn7PWC3soyxFAZlZwcFCTZe?=
 =?us-ascii?Q?tWdJugVNQlrTakRr/wVl8naf0YVO3Ii8yPdqZTWSQVufNQfVK/QLoe2wUdvC?=
 =?us-ascii?Q?e9+uawqDpq4UV6gB5g9qMs6i51brljfk/wtM26ZrPczo/3qsWVJWRa1AoTfY?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4bfe34-2a99-4bfc-b2e0-08dae2b916bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:36:20.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfWhvO3z8KaetqjTgpUTMARGGdP7zO9MON7C4OPc5w809xxXNBhasA6cIb0QXxQ0eNT4fCWhSas0hKkyaXBjrrGByA0A2tZ7Htn0nK7WHk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6652
X-Proofpoint-GUID: iDG4y-uiPvbP3dXTwfIKOxeY39ttJeEW
X-Proofpoint-ORIG-GUID: iDG4y-uiPvbP3dXTwfIKOxeY39ttJeEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_06,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

v4:
  1. Removed common *all_eof routines for read peek and added one
     specific to live migration.
  2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
  3. Some other minor fixes.

v5:
  1. Handle busy-wait in migration_channel_read_peek due partial reads.

v6:
  With earlier patch, multifd_load_setup was done only in
  migration_incoming_setup but if multifd channel is received before
  default channel, multifd channels will be uninitialized. Moved
  multifd_load_setup to migration_ioc_process_incoming.
  

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 ++++++++++++++++++++++++
 migration/channel.h                 |  5 +++
 migration/migration.c               | 54 ++++++++++++++++++++---------
 migration/multifd.c                 | 19 +++++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +--
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 148 insertions(+), 41 deletions(-)

-- 
2.22.3


