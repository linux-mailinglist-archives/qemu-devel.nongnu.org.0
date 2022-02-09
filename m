Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF0D4AF421
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:31:46 +0100 (CET)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHo0X-0006jr-3e
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:31:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZ8-00019F-3q; Wed, 09 Feb 2022 09:03:26 -0500
Received: from [2a01:111:f400:7d00::715] (port=53856
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnYz-0000MG-DN; Wed, 09 Feb 2022 09:03:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5+wGu8SPjE7tWL64qG1AxxjW97e8QUBHm+7it+V7A3d4/bv4LLETmrDuZ+t7ooEyv1Fpz8GfXOjsTZ8gAhxwR6uoAAGsUBbGXhYFYzAIFl/oMt4tIMPNtWY99ZyXMinkltFAd5kCl9cIX1PTCdB0U0JpOG4CixEd/DkfYyzHroJ+DQ3+9Sa0NhC1nJ6ywb4uYzQ4PnE4MgNO8F2cRcsjOGZUEXklq10LhXSYCfWMdXNPmMRaKUQQmD3k1usU3WL927o5uSJnzK/vyWSgCmnw/Yjvqlhv6wAcyTfSZn8jOzXAC2TU1RLbpgWsoLvyaZVWkFH19fCjf+0bCp6Fynfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0vNGZP1csMTdTD8rIykPfw4SolsZUJCx7Adb8kJdh8=;
 b=Kf/9Do7+v6Ni/wbBdF1zQ5euio14VSzpcCIQwz4qoj9Ztzxoj14uxDL41bFgm9WdcCdAYce4qN+qO7VsKJ63fpnxY/UAH8Cx2o5vz511h1gOcUSJy1NbqngL3lwtITSBjsfOxkfLNI6/EG1i3fTC/fDf8H+VjTy3OoKBSkTd6CKv6zHHq4OdDyZvA9yWBKUylNS/X/C15aBjFA6cBZQ/78a/uyBBcOcz8AJg++9WttDpKYrboaKbssfNpM8xCLv+rjP6D23YKxfMbM15+BVbVLUhB8TqWKyWQfmdpnLX9lJffSnxIVwI5p/n+3wvgM5zmNWxkjzGcAvtHaoRmQmu7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0vNGZP1csMTdTD8rIykPfw4SolsZUJCx7Adb8kJdh8=;
 b=fGZwiFBTg6C3LHPP+GwkzjHhYzXydYtjQRoK1j1y/iweBUe0t0AbehVPbU1Vip73AtVcJlExVGkMeHY0+H72PFmvOEHoE1ZNVshw2JrR0ZG6wkNKpHl7mAuCOCB90u8D0C9LEbpScYI7XfEXwmroFVXEeJ/bTc+GGjtG2UOxAOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:03:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PULL 0/7] nbd: handle AioContext change correctly
Date: Wed,  9 Feb 2022 15:02:51 +0100
Message-Id: <20220209140258.364649-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76bf033-ffd7-4d94-1b14-08d9ebd4e808
X-MS-TrafficTypeDiagnostic: AM8PR08MB5698:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5698EBF1F8CCE58DF3B6E63FC12E9@AM8PR08MB5698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:378;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MG8U+V2wbQBuv4MYlBxV1tFb+M2au93jAi0UbsfBUI7EPR9TXXD31YkqVaG+wlbmeYdiCvoQnWA/OLYFGhg8KNWeKn+aaTTR8JSI6UYl+GL+02J+xnFre06w8k8Wgbmr9Xpfi63V+hnoyr5EkNEJZexjuz/rC8va1nPWL/rGa2oP4Lm3bjKBtqQGo9hXCJKUZ0ao8esuZKYC+RxXa+azPBnh8T7TyrciQ5oe8CR55sRNjzhlRjERGKXDESIUDVlJcmzlAChCqKu1G175ZeiUp89YM8VmceU/1ezquOnqtASqXSZzPnj4ciOf9WyHnSFE5Y/EsXILLhkSrS3KxoIBlbT+v/jA9KbxlXeAUzlot2obtKWXV9c9QGmx7c6hUiI1ELcLiMcNqSckNci49QdssJoWyW656E42wb5oIIT2h8CYytNjZHDyMl5pPLo7MF3aOt4gmiWBhxi/ZiKk2zcnarVAxvFCTKyd5HUiwTLZCmruMyHGPxZOUnRIhouAz9501mg4rwFctWs2k1evJJ7onWXsRX919EE/JPXRvddzxGxusDPKIPLryYnKe6CzJEBkolhR2lVX/MlvBhGre6NHxFCVD168208tBg4PVq52fHFonswi1jlnAUVOIYTCkIoxnKFITc3tIMpx8dlgb9yEjXk8QhL0WGDvoXuNsLXzwUKpCAla67TITvIC7OpYByqxnu91dNFuoUpyQ/FmOOSoBrZaZG6+/T7BwI0QHdnn16mXIEiPT8NWStwCm6Zsif0B3Xt5SzMRl3Zo1jCEcbumgNQNY942Q9JBj4ObhQgViKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(316002)(6512007)(83380400001)(2906002)(5660300002)(6666004)(8936002)(1076003)(38350700002)(66476007)(66556008)(6506007)(8676002)(86362001)(66946007)(38100700002)(4326008)(508600001)(6486002)(966005)(26005)(186003)(6916009)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGPBQ+j6i69cR/0q/zl+Z87rvcknU4JMv5zD57yb+KsyD8QYezEzCb/pdn+a?=
 =?us-ascii?Q?26vggv7tkpTPDQQsaAke6uW5OOhGaNEqPS5TcWtcOFE2HimxsHEh0cH9k8CW?=
 =?us-ascii?Q?iPsyB0lkxFwWG1eHslZf5q103FnUZ79LU3kpnztX+Y3QiffJBSEzUZMkY3dO?=
 =?us-ascii?Q?6mwQ0omORi8XI/lWsd5dB6H5QTScCzm3F+7ROIxJ0B/1kTzN2KB1zZMVUqgH?=
 =?us-ascii?Q?ubzMF8Uu3+2FPUHAbCnuLzdGbti1S169eApsHeBFesssRoVhQmDpv4JLQHkO?=
 =?us-ascii?Q?eWlxu7yOghKxGXzsDbkOIYQMmBHKjeuLAGfGF4diTLzzzwJeiuuTVe9FXMYn?=
 =?us-ascii?Q?WnjabAy8q9qAC6Z8aZibS9SR4qJXS0O1cW5fQoYhnFDhDepkSavE8s6j8zrp?=
 =?us-ascii?Q?D19dLyPZXR+Ua9HuvqZTYNwGvSzC/Rr0CBLAR3IEEqLxSxSHx4wvfllmxQHP?=
 =?us-ascii?Q?br2obGuPuY2inlTLFuFy2KQ/HLrBT/m3g54iYyGUmERsVX5UVTKYOKdLraty?=
 =?us-ascii?Q?BpODk2sEtRQK1mwnBdF+PKwqFWvT/ZlzH1TUk1QFnmLmJHfITa/5lv/cQSxQ?=
 =?us-ascii?Q?3rz71uOYCl/He2CYdvW5/oePaMxmvaloR9ws/MztEHqh1z6qESYL/QHxkz6u?=
 =?us-ascii?Q?jA88kwl4XU6mZRFSSLiX42I7/oh0lscMEDKcna43Ltv5JriqTFs6TLjavQae?=
 =?us-ascii?Q?XIvUJxc497Mvi+rf78vDtHx0Y5e49yEFhzGkpnYHd14qu5RuIpXhJFWNNx5x?=
 =?us-ascii?Q?6GeWKNZXMmvPMS7uIqRArKao9cpIPwe8hFjQlnmHIsU1/5o4D/puvkI6Ep/y?=
 =?us-ascii?Q?r9FmOd3wNyTKlT+vOGgbGSKjgC+a5vfBL9dgSvJBZA9fpjRN8MGkjQGjEZQY?=
 =?us-ascii?Q?px3/LqblTUJZf0FRl3Y3e2lkNsOAV76U4BqfLev/L9pbqmNP3YmkCq897DW6?=
 =?us-ascii?Q?5niu+GRvwl11pvwLMidvNOZpBlfj5CsoG0JQy7fc9Ac5wGsSWEo6VaeLSgef?=
 =?us-ascii?Q?kvYEY1J4f7hy29ouQq/3ttUV64LAZ6M1epTCjURv5vctFj1lNJtG0h0m5MEZ?=
 =?us-ascii?Q?MNvbiWrBcJJlB76YFN/CvwKeNPS0ZssVBcmO87bz9Z5HN2hjN6dY5ka8HG++?=
 =?us-ascii?Q?fZnaT7ofUsSOv9OpJk16xM7iAj7dE8p6yiiNkANCjiKRLbaA2nmHwXhhcE+M?=
 =?us-ascii?Q?CfTxGlo+DgsqdQVOuf4QJ/VRmoW2VcbAtEh3wwSPRTQKcsbFo5jIWo8aY9fc?=
 =?us-ascii?Q?gRW2RZSXQwJ/ri+x+pviNNgh3yZJTYgj2opjQ1QrROGPzV0c0XyazUTAF211?=
 =?us-ascii?Q?+uPLKuGe86DH07FIBfhq2tOYh4X5O7JKn1xdTN0NCG0XB2F8xMcnL4fXmiQh?=
 =?us-ascii?Q?pgHWPWZdcIrydiXkrJMPxqoC3Xc4DoY42opcz+tKaCsjl3s6m6j8q4zk+nxs?=
 =?us-ascii?Q?l09/+HW0rwCjUGHl0+sNYkqZiMPEPZkDNYnOQPvhkTrgAvXVt3gjdWWVWfxm?=
 =?us-ascii?Q?dJCtYeyyvksBDRqvw84okhSgz+03yer2Sd0nPJ8qA1AmYOG57w8qZmaKc4ns?=
 =?us-ascii?Q?eR6d445PNprMW1AF6DJK+p7Hm+XYxsKkR8l3dzrTLeUgXA7Ddw+wrEjNppuz?=
 =?us-ascii?Q?pqCJYgemyCs40AAqCrQYjHS5feurArS7612ZOKdABR9QjikZnyigjJiLYt3a?=
 =?us-ascii?Q?rgQz+Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bf033-ffd7-4d94-1b14-08d9ebd4e808
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:10.9481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2EfWRpOOARIOeObAcwIDR99PlZrkx2hOnRoK+RLm45ZOK36MconZtOn6zRpfe92e1hc6rm4NDmYEBRGQ8xcwhBkdHC2CVMf9rWyfwwvE6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::715
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2022-02-09

for you to fetch changes up to 1bd4523c2ded28b7805b971b9d3d746beabd0a94:

  iotests/281: Let NBD connection yield in iothread (2022-02-09 14:15:29 +0100)

----------------------------------------------------------------
nbd: handle AioContext change correctly

----------------------------------------------------------------

Hanna Reitz (7):
  block/nbd: Delete reconnect delay timer when done
  block/nbd: Delete open timer when done
  block/nbd: Assert there are no timers when closed
  iotests.py: Add QemuStorageDaemon class
  iotests/281: Test lingering timers
  block/nbd: Move s->ioc on AioContext change
  iotests/281: Let NBD connection yield in iothread

 block/nbd.c                   |  64 +++++++++++++++++++++
 tests/qemu-iotests/281        | 101 +++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/281.out    |   4 +-
 tests/qemu-iotests/iotests.py |  40 ++++++++++++++
 4 files changed, 205 insertions(+), 4 deletions(-)

-- 
2.31.1


