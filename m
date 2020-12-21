Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8012E0106
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:31:19 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQtq-0001ZR-Q3
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQkh-0003h7-4u
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:21:52 -0500
Received: from mail-eopbgr20117.outbound.protection.outlook.com
 ([40.107.2.117]:14596 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQkW-0002sz-IK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:21:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao2miV6X0nk5d82meL5uR2oDPKFARWUW11q3WRBHzUXSRFRVrvs/ThkHxqUQxsUH7vFfH7bjXWsTI6K20hNxnA8iNfT6AqW7FOVIfHF4lnbZRlGf7nzCvtS+TJk59I+QDZpH0BRFlJXgvlv2Ee5a8Q52gFmmOhzhde19KVmjZoFruhcX08PZfMEm6SvTu1IqoGVLbs2AyuXvio7vy4VWJAMHRlVcMsaoZDrrkPMafvdujnAL9Mq9Rsu9i2I+eTR2VWQ+Gir17VNyenArDKY85fcaLdm1UT1ybL6nVrkcGkV91hePnj742GGmI4Nmyzgg8zvevH4r0hTyeezMAsDS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lPYTZmHAHelVm5V5/R4+Xybx8uw5JNRkMVK0MilDYo=;
 b=GG1FGQi4I1WPkx9D7nuE70qsieKMuLnZpnAx+44yGOMWj8KKOjm5rhYsr3w/gBOwt4FuDM5dmS0q52+yxQYE+M8yENAwTBSXWkseugpO67t8RCUI/fx+iCxRHfm3kJYgpC72Dkkrcl3hPsXQhYPOfEyE8dKMi3siiX9ABGBscV+BZBSTI4Uv2qcEc12256v7vZmtGKguwaxgGL0ld36wCu/laYvZ85RG5OU2TtVZzTnic1X6vjISvPdvhyhnmEcxgCR0pa5YUi7Onx6O1/inexGol+4EPrLua9jQ1V1yNrgIqtIdx1KxVG5LXqOxrZS46gflbubgf0CyBluF+Jw/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lPYTZmHAHelVm5V5/R4+Xybx8uw5JNRkMVK0MilDYo=;
 b=PuhoSj3VV9R8P3OR5j5KmJgWaoj0LVe9+asc8OEhLwuoLxAAIPhTr2J5fwXbMVIsrF6tdC1Rbo6+eX+yiJNlMcvY0mosdnTitIf7utVTKRDy0+8xsBVcjus8J5AXbrSVCBKL8GyLQjBn+BX2HWW5tTcVtX+Itf8tDsSsV5EoL64=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] net/tap: some fixes and refactorings
Date: Mon, 21 Dec 2020 22:06:04 +0300
Message-Id: <20201221190609.93768-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12388892-646d-4888-454c-08d8a5e38633
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652335097771096ABB6CC92C1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0EzFR4lJLyxV/4l3PFAMDb4Qvmp5VbI8OXtAcU6gVUwczGAa1c9xZWaO10LHVHWlOYgnwXIEBEmk1HKXcyFK5XTsua8mTq3cNv56/pNpAbt14JBa2MHKC0CymHYFT8jWc6FdLGPA4xJiRj9y1mcXvrUMe+hH7JQOOQvQR2iKCHMn4abIWwTameATZPAGgqwNdnp9zQNPPeQsvhb2lHIUKqvQoiP6+wzvcHVCQVmdsPgub8tYpyADT/vyyyQXULSXocAGmscx+w19k0ep97l4FhOanU2QxTpfW7Habutko5LsO3K4014fksJcFmT6rabdNM9ZvzjVHFg6Hg03IGFrdwGs74eSL8hDY+4wRgrsNaV8Kxi6JNHeTPNpRWCm4UNlIp41sSt5Kiv31f43pMGLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(4744005)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KT51LYNcKSsv3HPanTdIeBi8IeX3pNqCYPqQYR8osBaPIs2W5cEqFuLbgAgE?=
 =?us-ascii?Q?x8tjjUtu0x7rpp3wVgKv+IL0IDqxGW1sj7T4nfiJ7z8hTkVLtK9FdH9sxqIo?=
 =?us-ascii?Q?D+8DtvJmLF9iHASH5feiJEwTMNxSpTWEIXdIqvA8bgOD2ukUOeE9GNMYuRwL?=
 =?us-ascii?Q?K9Qx3LKksDkgI26yO2gjQs7SiM/d5Z5dcPWQiyDoSkapz8lxirLZne0q6WDP?=
 =?us-ascii?Q?yH7Ao4wFgofVnJwecbP/lXowvWZ8TFdLg2nmrBes9Jzoas7/XfMIA/9iZIBt?=
 =?us-ascii?Q?sv7GOzFjzKzzO46Nt6hs1jM7RLBVkFLQHJrGlDYPJqRl93K01x8g8hTndp7D?=
 =?us-ascii?Q?0xVioeaYHGhTZogp7MD9Y5s+w+TcZxdPanHXO9+C/iyWJ0ZbZPUT4Swb/l4O?=
 =?us-ascii?Q?uM78uwae8YRTj/BaDDadcZus8i2NpMUBfZZEpM7vIZmq5buh4GGp1So/TZV+?=
 =?us-ascii?Q?cwD6GD376kPzsw2a43vjey8Ef4AklfMRRvhGyzLjjxp3gWlpJIc7GFngYJj5?=
 =?us-ascii?Q?qjO9/cU/UHReE/9MGBnudUVySgl12EeEvoZgGhxON2Vj3mV0LkD8GBktzFJb?=
 =?us-ascii?Q?i5u5OhdVTvWmHCOnmEQ6VDluI96ph5AMhER2nxZ7+/1uwvyvCdMpdIjmCGhy?=
 =?us-ascii?Q?Sj/DrXqfwQkDH2tJ34CNNgdskmC1mrG33VO+oxBxkWvz22VLHHeL7PEaHQ7o?=
 =?us-ascii?Q?4nKRLA8DSJgayWq7uE8ajEBSyD+BWSii2IV0lp5fuLrj4Uy+Fvg5tJA3yMoE?=
 =?us-ascii?Q?EqOM6G1EBN9CmFXbdh4u7VBsz8CdVEUPFmO4E/z0iQcCUaeNO/vjMRPsTH9m?=
 =?us-ascii?Q?vuim0VjOXe0ZDPdVYOcQSjmgLN1CGivAxXjAImlqxZEEvkeoOW57E+1fh+t3?=
 =?us-ascii?Q?BQ3KOrE1VmFUcNgW4A0ZYK34ybjEHcBXBmXWzozeFam4Kvxfp40VQ8CrkRon?=
 =?us-ascii?Q?9CTuZQIyqN5u27s8qVMcaNoYnmEP+lwEzBuALdag91JJHui6zairRe0ItX2X?=
 =?us-ascii?Q?eNiJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:29.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 12388892-646d-4888-454c-08d8a5e38633
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHivEUPIKfL9tNwFSMEcNe+EL9eeKGfb+suRu+9T6gZD9aP/1poK2S6b8GvzgmrlE9KUQEJssOFURMGNxoyxQmNCjtXdkOqzf+FzBh3QJk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all. I have a work in progress around net/tap (and not sure, will
it be done or we go another way), but some fixes and good refactoring
I'd like to post anyway:

Vladimir Sementsov-Ogievskiy (5):
  net/tap: fix net_init_tap(): set ret on failure path
  net/tap: drop duplicated tap stubs
  net/tap: tap_set_sndbuf(): return status
  net/tap: refactor and improve net_init_tap_one()
  net/tap: net_init_tap_one(): fix net-client leak on failure path

 include/net/vhost_net.h |   3 -
 net/tap_int.h           |   2 +-
 net/tap-bsd.c           |  53 ------------------
 net/tap-linux.c         |   5 +-
 net/tap-open-stub.c     |  34 ++++++++++++
 net/tap-solaris.c       |  53 ------------------
 net/tap-stub.c          |   9 +--
 net/tap.c               | 119 ++++++++++++++++++++++------------------
 net/meson.build         |   3 +
 9 files changed, 108 insertions(+), 173 deletions(-)
 create mode 100644 net/tap-open-stub.c

-- 
2.28.0


