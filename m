Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C77444271
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:33:35 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGOU-0002Tn-7L
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKt-0007WM-3f; Wed, 03 Nov 2021 09:29:51 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:3553 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKp-00076y-F8; Wed, 03 Nov 2021 09:29:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPzNvLZZLUeddPxbd3tpE5ygOgBTXkTE2FyeVLi+lKLSfQad8WcKbxRopKqHyC9x8xq/Azn5RWdxXR0kO2k5Yb3ZmdzmsVCFuxIl/Nr1Cfm2G6g3IlkiGbMzoLEvKTX6A6wqI3ya3LBx50VpGssvs8GD2PirT0uEl15IO3gehTJMtsAoS0Y/in8tRZkBmCMFIz45Ao4wVPe+HAYfZJ/I8pwelLyDbyY6Pt0wMmrXEZvoW+rkWJk4LpDM0jsc3ZSuHzr5+4borhgXZYCB/wd332UQbdSaf2FyYng53neulgGpmDxkssc2ubcU9fqEMnshR9tSh3qSkoEYua6gsrKsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xFPIRii+vatFY5UvNqeFEHVQKm87/i9p/uNJhW90N4=;
 b=c2W6Y6tttyMpc0INE6FutoEkNXh3rNuHFc2rrLGD5TEIRuQyoCxpBJsmjUMkJawBo2Ae2roDCKUaOivhXW8ApA1CK7px26c5Nth/BKoSOCswws6AZ5h5LxQuiICqATZPSW63QnlSsHlp7D0Xdmvul65SWmo0gemyfCwB3TOUrmMyAGytB9U9d0uUj9ltloFvRVuA7THPTnVLoDXUVXqgS4E7TvKAz5c2qloVTQJnaWqyV0RGqvYa4IWmaWWXk4B44UcBrEsp75eJLX0uMMt9hQADDRNzbhJBZScdCmX5G5Z4PB97knQt4n1zrS3cuW4ZsmUhBJ2SXGMgWCW+ZJkYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xFPIRii+vatFY5UvNqeFEHVQKm87/i9p/uNJhW90N4=;
 b=hFE+TKOwO2UH+wMgSwb1F/VcGfXUGWuPIJxrnAn8g8Z4KKMBecwLdsGSDgwEl3jMvnfu9CBD3fJvoGzQxu9uI6z/7CWbAhE6YkOKybK19YL+95JoUXyFF343hECtTZO8exe83p2X01pB50bI7eDq5mgogoeSze+L6XfDYeviokk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:29:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:29:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, libvir-list@redhat.com, kchamart@redhat.com
Subject: [PATCH v3 0/3] qapi & doc: deprecate drive-backup
Date: Wed,  3 Nov 2021 14:29:09 +0100
Message-Id: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR0301CA0015.eurprd03.prod.outlook.com (2603:10a6:20b:468::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:29:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b936b1aa-092f-4c88-c62b-08d99ecdfb8c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256251FBCF029AC83CF6388C18C9@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U4/+duTuOlXB6U5y7jZYtaI7zttOoJKmQRKkP0hTgCrr87gKQQNw3JNaTHGP3wxU9TKE8FDpAZzubRCZR/J2gcQCrw0ClVMCHL5L/a9cXZr6mJ7cjjL99kethQHGQQDQOKDpTFdTc36hg0PAuvctDkQlyG1oDD1EbYRD6gH8CVIeFdxnvGhWvIJHUCVaE8iEMcloraqktUfTgCsp5LhRABfQh6lojN7fuXQlgAre6HItmu62GlmoFBSO3ib1lYDUofpRiKXFOPt1zDzMZBz/8kQ/kVYFGGrs+qvMyDWke+GBCyPo6FTdW3wAffwimRPTxDojf6dwt/xk5EjGF+2+sWNqb7LdATS2OE5HPvOXw1TeWnE2GK7f9uhowkjzv67MdXtxbjfZKqKbgG/7JFxaVbBYEkokwfW86kOp3tjPnC3JAn8x0nL4u04c4hG4PeaFfPngamQdJQYTdBPteNdmAJSDYKfqp3b5itlhSgtRwAES4OqGDFlGwUA33DO9ttFO9q3ikwpABjwVxtfV7TerXxgcwjF28kgdvljVoEVrmU2BxZ0asVKFR6LOq3YP+hWy/OQOkIJcrmACmzoI24j3sz5SZRBsbtwc6EWgslfpx0UoHfBd6BvyBSvebQV4uVrLOHFdEW/SCJQk41MF+jRCio7aknTi4+65vKJISDo+obkZs5pG3op5hYy3OnKkL8vyeTFxKZXYbvE5rr/xm/+/PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(8676002)(52116002)(6486002)(6506007)(508600001)(6666004)(4744005)(186003)(8936002)(2906002)(83380400001)(956004)(2616005)(36756003)(66946007)(5660300002)(38100700002)(66476007)(86362001)(6916009)(38350700002)(4326008)(6512007)(66556008)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hjpTQ2k0rJtfgDI4by/bBeqkmsVfmH1T61GBLRU9Z1avHOh822BUXdxTs9sx?=
 =?us-ascii?Q?PIDPn+H4oKle3t66N92+cEFZOH5FK5z8SwCkOhpKxdX5A+bdY4JZvieHp2fU?=
 =?us-ascii?Q?2iiviF5WkETdGaCnovDU4W096dJYdGlcKjL6aQ4rjCLXWxdPQ2RwIsh76J0z?=
 =?us-ascii?Q?8Xum2CE8R1PXd3GYnHgK1Ltj4OYx9hdqYjbBipHAKxiePss5PLg1+ox+e0Nm?=
 =?us-ascii?Q?nEWW+TWOLVnC/3v/trquh2QBP6NXqU0s1nr1D21SKLtMHSRGbDhbc0bEpeBs?=
 =?us-ascii?Q?xwxBwfCNToUcZHoEycCKXm5qqCYZcRjA2gL15rv2eCzT64KB2gsetr/VAxL0?=
 =?us-ascii?Q?YgImjEgp6cCFqWHnZZE37yipKiwoxY19Zx1vG/Wie8UCrSFk6QSewI7DDmyx?=
 =?us-ascii?Q?Z/oKrw+F0Lq7OqSg3mAofK9rOkAHjItCk72lsnfQetypjDNWOxHUKeuCbjpX?=
 =?us-ascii?Q?Zenub3gNzeegHHMQffTSFXirWf6Pl6BhvPFuOQlajgM28wFALX6fbH6sJWPr?=
 =?us-ascii?Q?oHmIGTow2w66XwBzObLkPb+RgkKNNdmfbym5mnPcn8LLr2nsq7Ot/xTNfD/K?=
 =?us-ascii?Q?6CXoeJ4ZDF6HdzNYxOl2w29hYOOWt6LvYmC3iVHJhKxA+M3fn0EUzSCjx2Xz?=
 =?us-ascii?Q?F5H/nso2aBJ9qdfxqcNi35JFs+kAuujv2vC5P3QSDG19avBQoaxkS2yWHJtR?=
 =?us-ascii?Q?iU/7kfY4iu9B64WHFI8qIW2m7ZWhoZ5pjIVdgctsz1b4eCimGo6XHRUNelic?=
 =?us-ascii?Q?I60EOTmFadGXl4up10sHBT1IleNVzb3NWsfOe6v6l4Td2ZhCRJjTVHH/SNBL?=
 =?us-ascii?Q?rrUL+AwZCleemAL22zCqAhBQTztggB293a2dX+Dt0f/dW2V/xV/1JXdQGX7Q?=
 =?us-ascii?Q?WWQEEpu35MapD4dS9k/HUYupy9/tOPzRyF3Ru1sWqsvLo4TFWrNLuKalalSL?=
 =?us-ascii?Q?xUGjKKfCMvEB+Z1qRtPFP+JxAcmIHHhYbsz0+Ogiy70LUZHMjGa4AuSCNF9G?=
 =?us-ascii?Q?lbyCO6nQJAQSRkcj+KQG0bs9uQ7U3Oa2RFB0TD6HAePZpLOJGZGnk+4+qfRY?=
 =?us-ascii?Q?41NoHRgvb9hGMXHi8sBog6X1BBNaApUZxX6tFzSsn5YaNiJRi+BbdwQmlH4C?=
 =?us-ascii?Q?5S1LRqbvJzKZKKE+Htg4Ua7rXnDj1Xz3LjudjXZWUIam8jUyKeMWoqMxBS4a?=
 =?us-ascii?Q?bsZV1+xd6jM0Ly6OuQyFgNrOUnWdQYR+3Hbll83YnCU11mnbRy3rGoBpAilh?=
 =?us-ascii?Q?e2kSpbbqhd7+ByTQfgKr4FMZucnP4G3wkPoDme9XI9ePvwwblFeRVJgxc7DR?=
 =?us-ascii?Q?Y8OXjmYa6QgY1yVDA6nlGpUjVuGXk56vyAo6l3o78biWIAMgSa4mlsu7VXoO?=
 =?us-ascii?Q?h6PXT3BQI77pvrjvbo9WqWgpzJeV03nv0px0WubNHo4hN/wOjoqWavvO2NCj?=
 =?us-ascii?Q?8SRMi2Ijzkjfsqp4XKOx2xzljF6iDGe5ndU6jYN58DBUKBxSKwRSc/934Yjp?=
 =?us-ascii?Q?JwGP9Q4Q2iDnM5sxxmBFkDP5B6AEphXKYD9tcrb5jQe8xCBQr+WG6UYBd6M0?=
 =?us-ascii?Q?jOWKQUN7+oBCcm8SWvmL0xusYS36eJ3kxmZKXQbAj/6tKmjl1mQv9/PX31Rj?=
 =?us-ascii?Q?Af0DOKGm9lK1u7DXCQFUETqizyNkaaP8bAtgpqOO6aJfz0Vh/1GGeE+l0hh7?=
 =?us-ascii?Q?bonE3Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b936b1aa-092f-4c88-c62b-08d99ecdfb8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:29:37.7179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwIDWN80uyhuHP9otrZGjloCB7cPehRgKL69fr47sz2L9syvSWlPnXK9VQG49hxenLDx55hUXsxNFYCjaCgMSp52SP0P2er2phq4xoLZYaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.20.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all!

See 03 commit message for details. 01-02 are preparation docs update.

v3: wording fix-ups and improvements suggested by Kashyap
v2: add a lot of documentation changes
v1 was "[PATCH] qapi: deprecate drive-backup"


Note, that this series lack deprecating drive-backup transaction action.
That's done by Markus in 05 patch of
"[PATCH v4 0/5] qapi: Add feature flags to enum members"
So, the most effective would be to take these series together.


Vladimir Sementsov-Ogievskiy (3):
  docs/block-replication: use blockdev-backup
  docs/interop/bitmaps: use blockdev-backup
  qapi: deprecate drive-backup

 docs/about/deprecated.rst              |  11 +
 docs/block-replication.txt             |   4 +-
 docs/interop/bitmaps.rst               | 285 +++++++++++++++++++------
 docs/interop/live-block-operations.rst |  47 ++--
 qapi/block-core.json                   |   5 +-
 5 files changed, 263 insertions(+), 89 deletions(-)

-- 
2.31.1


