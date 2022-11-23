Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A0636704
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtXO-0001oc-0q; Wed, 23 Nov 2022 12:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXJ-0001jw-Or
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:49 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXH-0000Fg-5O
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:49 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANBcmLa020554; Wed, 23 Nov 2022 09:27:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=5KDA7FF0EVn5hq0wwR7Xi/6KITbvO7lUxmg7nuwUuyE=;
 b=xQpE8A34kQIIr0V7YC07f+xWP/r+4wiLc1Sj3DmpecVQxJiMr3FYLDAgDFhRhy8wmvGY
 VTiAXZAzoZcb4SsOfxUr6yEL76rySn3KZq7jI0hg2qAfbyI20O7yJYJ11YQvc+8nEIwJ
 yamTg6RipTJBROGKhnCum3u9h7H5BKUwTQTlYDePCDr7VGtrNO5e3N+1JRmLD+WykvQI
 Ec+H4aKcHkR2l2fLpRnHhio3xTe8eTqQvU7Lhod6uclyaW58fUQkcAKGh+fHDw4U2KJL
 gIzy55tG0CriAWbx0EQCw6IIJIZCusLS+KgoSWhQpMIDzta6p/8SieRBd+PojzgIA9O3 6Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxuxctxfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 09:27:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCZS+paLeL7LX6vBsXGSXEGCtRnHPWjl4S/PALAXdZZ32jKdmLKfEZ5fIXA5H+v+e3351yJ4YWV3+846K1oSwnETmjb4s1TVxj0mtQmchoqoAAuG+QKgfWjvD/YQmjRsU40t8e2ERalo6D8Nb2i5BzxMVtHmhsRxiwJcdac62ioCmVFvjjqogIROoLLPPOT1B3WiRhr9Kl4nSpCsikckZ3gnb/3PAzK5x9wuqTf8bPRKY1B5Lcn+R9zd1Szgx8rDOVJ439U7Y7x9bq3lIMTyXw0ed1mRFyw2Eeujt076m0xWn7wn+nCt+qJmq1HJMjpC58qhPwvYrnlxVgVRK/SJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KDA7FF0EVn5hq0wwR7Xi/6KITbvO7lUxmg7nuwUuyE=;
 b=T66d4avSncK2j+sKEa+jdxoBijM3ipyitssZKKTUaEeEbkyzxgk7vKyqGq6gzZHHZcJc4v8RU1oI3c9SBLdG/gMhYixG35wmNZ75Ote5KX6mLMIaK4h+U3MtrMcNLOjH8Tcb3Qjl68tJSuOP6KhlyyFs0PmalKJjRJoj+U1iVwAI0NuoATspdfTiZTKYH6yUeGBLAfJDKjZ7QWfIQbDfbiExnQ8Z9XZxb4MiKYlOCMS8S6fzTjcXY97WhxgcQYz/XU/i0GmJvL9n91JlbUihoVK38Mz7tSUk1VTLjJLw2Ncol+iDz222XvqsEWW8SQJIOMIzehrAaOBzadx73rEunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KDA7FF0EVn5hq0wwR7Xi/6KITbvO7lUxmg7nuwUuyE=;
 b=Naq8MGO1b0/MabAgETfCABQcbWvhWzwTZRMO59+RbZzoLKiZh5thUWlzwL4UZ/Xp5kA5bP5G53lm5NIJUUSdNfqUmZv6jLT4UM3VQr+67DBex01eoEZJy+XMtk6RtaowUPBSc5UT0KfnyaRA1Vqc8wMs5vfqvPHZQl9VNc6NP3Fk9E0luGa2sby+7PA6TH9OwgX8qEc67puF+bKVEjSuta2WIVN4uLWu6xCpMl2ZLhW0j4EkxMSVggjIlGjklNalhHqlEZiDjye3UAAjg0CZpoIpgrEyxAHwhv8RtqdXnSkMT3smHjcEX/pVokvVpzlbwbXKY/4wFsYsib/9jVzEHA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7375.namprd02.prod.outlook.com (2603:10b6:a03:2a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 17:27:40 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 17:27:40 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v5 0/2] check magic value for deciding the mapping of channels
Date: Wed, 23 Nov 2022 17:27:33 +0000
Message-Id: <20221123172735.25181-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a7f23e-eefc-4f92-558a-08dacd7804d9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUxKZeG8C5yMHjTOkQjmCEGUn9gnJr6cecDtH4dVa5d73pfow6o8LUrQzB07i+yjEX8wXFgrJR/2RX+atOyxL9EvHxwcLkYNUiSUmf57eaZeqqPiYrNEFEqFTn8Pfy1K36LtcAXBoAm82B7CM2rIU9kdY9XIifTWQExSp4EXIBz5mhcJGkV1HJNm/SwYw7CRKd0ux464Odz/ZSkpYY9Bw4lWjMcvHSgIxfxdqD8ZtarMboW8RskcWEaPjavNXdmzsaBqPvcBoe2Rc2ND26k25eOrmK3edFuA9QR2Dqc9e3kZfH1ZF8pYjEca8lSaL+oXuq4TS0im4gdhIDQGyE8eFHb7UE6sAJT5jO5Wv68gmxEOw6+BvqhVeIgnrEfQnn1PI2YBi5cfRWkRa5y/nCAJw1D7Fpz7unNA9e9RPeIk6/Jmblh8nnua88X0s9wPPmO/5JjgXQu6N//56JKTgPsuE4irdjHS+O5HSxQfAkbmSLR4ltVLS4yQt0QzvvO5Wkgitw7xNJ/IEY/9eMksRYc0rW7jcwyZtplI5BKQrVi3c4bU4ap6g8BWIj8Nf8dHZEC2/8MJruSY7Qqcevxw++U69SMQUTYh53xcTQ9+B8Jv2EnTgXzYLMhuLUQ/eoj1HoQNioqulefYRC99upYgXE0mf5Yinz2NX8el30EmEyb4HpHHzaCJLg446IM8GGrNAkpp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(26005)(83380400001)(6512007)(2616005)(1076003)(38350700002)(38100700002)(186003)(2906002)(5660300002)(8936002)(478600001)(52116002)(6486002)(107886003)(6666004)(6506007)(4326008)(66476007)(8676002)(66946007)(66556008)(41300700001)(316002)(6916009)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ExZ3YmSfeucu2AAxgcdHOQXhgVe8Px+10kcVuGOtpJAEIaZPSA2oQ4luz/m/?=
 =?us-ascii?Q?uQot+5bZsNxhprnfoJ3inACseQ8CLtMqqrudE6sLM1s0pmapIB5d2pkAPEUo?=
 =?us-ascii?Q?FHlE0Oq2IKeA8iLYjsI2TO9ue0EvCZhCiz2J4N/GQVc3O4TQNGC8pM7lKwEg?=
 =?us-ascii?Q?LMd8EUW/M2Ps5AurqUjY4c6SyP9DtaqimwXOXJJT5icRweWoatucfFNxZ63l?=
 =?us-ascii?Q?1dQ3jhFNvP0HF/MHBgqIU6iSnTHHNcgo5jOw6SiE16/jfQplADIq+rt0fgHK?=
 =?us-ascii?Q?y6lK8qVYeLZ6RcSz4r5ZIKkBZoQ9klBBf7sNKUzDfcRj3I5VvNKUV211zRbt?=
 =?us-ascii?Q?MZPTDfSOFydOU0V6d7wHt1RLzVFzjeFqd3MKHEhEZeUTA/6ItybGmgcEVow6?=
 =?us-ascii?Q?/WjAcwQZuYyXqZ48v8+xQU5gxZxXGCWb5S5+n4kH7sElT6LBeGMlqZaKTru+?=
 =?us-ascii?Q?vNWOtJd/NSkKWHNeuHd4fDZe08qgnV/qIjM4vZrXkjzC26BQSRWmYEmB5tLi?=
 =?us-ascii?Q?n7IAzOs9U64iEcXPSJohC4Z2PuMcG+6sA+8hedbZ2cGkPDz6NTmYtAPPFTyU?=
 =?us-ascii?Q?fpCyXCyhBtBqL3tWaQa+RM10N5h7eiXI26W4omzOjbHIGd2sxh1VaFcoq5ph?=
 =?us-ascii?Q?kPnzrqskiuxaCNZdo4G19q6ZGDtm8QACk84a0SH+PgK8upTN4N2XFpqiYQtm?=
 =?us-ascii?Q?FJtzvpF9RHkVuHk1m858BK9qmXkgTUr82Key1FChaqh3AU0b+5DFiGDKZPQ0?=
 =?us-ascii?Q?hyDf/+n49nLUkq2zsD+nIIyOANNlkIAhL/wy7UQc7QyAtxj3qmWrRQdDOOh/?=
 =?us-ascii?Q?Eo8KMytBbfF8I3oGq7uBgHz+aZxdQ7Um7Gc1Q1EUXFFU1nTViEiHlTC6V0J6?=
 =?us-ascii?Q?cWKhIugmA0sfYiUVX2+kwtuQCjhjc84HI1mVk/udaraZKzQc32vw/vRbu/w0?=
 =?us-ascii?Q?Dphn+vvs17DZiwMUhpZ5Ry0t+skE2+/s+pWZZdUO6pbhAFao5l+VM9atkUC1?=
 =?us-ascii?Q?nYx/DJ66TEfygDlfnmN5SXF8nxIuvLnSeonX7jDC1lTeXt1xgaInOwjEIwSA?=
 =?us-ascii?Q?Q5ItwKiyw8kUMHdOpUSsYbhD/V3YCFGOlkGdHCkPNJgrl0oYnLYmUXauvzNh?=
 =?us-ascii?Q?lbN1Ug3z9QSfzo/0mfIy1u+iUNpH4PfAOlS1viSQ32ZLF2mAAcVxtkhPyECe?=
 =?us-ascii?Q?4ASrBgfZX6bCiBLFlfzSi5/3biqOHMIiuwo7zUDfP8v36W9F772u5ptgLJA3?=
 =?us-ascii?Q?VENmfTyunM+P0liPn6WICYBQDJsIyC9BPDO7N+yCcKOgm5xIPTB2MyYDDsdX?=
 =?us-ascii?Q?FEBDQ1/xTRaXlmUblpuUXUclErRUgMdQJnrR+GztEcQBM4bKXUvzJz4w3/pV?=
 =?us-ascii?Q?5w0TZzcaA2lkUFZPqv9ETZz9zbyNxiXjmAsj5OVB9kXOPvbykQiuCPb8Q86y?=
 =?us-ascii?Q?MHngOJC2SR4Yl/EpnxHFr7st0Lzwlw6qfdUfQuaXQkU+rh3UB14LO6ltgTpG?=
 =?us-ascii?Q?0VeqpHHOX5F1zL6sUSexeOqZo0P6xCXjDbreaatDo6luBqf9p4A9tq6evMXK?=
 =?us-ascii?Q?ERzz7JnbqckvKOLXNpYZrOg2SDHL1C6VTmxcIPvimGjDISAA6xWtTJ+sqHmR?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a7f23e-eefc-4f92-558a-08dacd7804d9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 17:27:40.0779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6G6C/mNDOqH2VY8wqvevDAWa2xFC0YgrRkpKzZ1rXnK2pKnpgJ8fMK5sEZgVUOuKbf/bvKrFXd0uSNNlON3wQ0oz7IURXuOqYuDrATrPFX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7375
X-Proofpoint-ORIG-GUID: UaDkM10PVTCY7kAZiBomBpLvhfy1fHZa
X-Proofpoint-GUID: UaDkM10PVTCY7kAZiBomBpLvhfy1fHZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_10,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 +++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 +++++++++++++++++++++++++++++
 migration/channel.h                 |  5 ++++
 migration/migration.c               | 45 +++++++++++++++++++++--------
 migration/multifd.c                 | 12 +++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +---
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 137 insertions(+), 36 deletions(-)

-- 
2.22.3


