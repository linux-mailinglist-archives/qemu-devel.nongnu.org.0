Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7086393298
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:42:43 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmI9i-0000zp-PD
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8Q-0007ln-Ao; Thu, 27 May 2021 11:41:22 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:51616 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8N-0006YN-Tw; Thu, 27 May 2021 11:41:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8+15WtChwG18tJNeiNSOUFA5ODsGFZjVTjM5t9nUsQg6ita89A+MvdC1H5fU5LusavvjxlQfSi1h/kI3W82ZnxVkqlkC1g22/r06T8hxQm/zdYq2Nu9sbvyvRnhDNGM09U67W8KsX2r/7EMVM0gDPBH6nnIonyGTdAiEmWB8rvtyPD9ENSRGq82hhAo85X/K7wkpOjynXehlihMZuDCF+qkMZ3XaNdGRQrEQndzwvUcatJfYZ2wHCfHG7xJcBZeHGTLCvq8tslPuEyIMOze30nlq6nkWwTPYdKMXC0j6qxc8L16l1GK7YucyLGhDbJgFVea05OrfZnCLSQCK7cDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKbi1XgTtjcf6Hxp6359Xlf3bCXmX6YkhTwxCiopQuY=;
 b=U5c4t9gIm01SzFz8uNpgh2XU9xFmbkMOl/mPTaecuaHE5zy+wZS92UJ0oOHzPvAUEV/YOT1oZQ/cZbePODMPgF3U5WdWZhAK9HvVn9svmR53/qa8Dntr9DSfN0MedEOk/R0d6XpUHG2vgkgfW1/xFnz/Zy5jKWl8LE2ZSW0ws1iLoSt8uVQUy2eTOvZPVfkQaWjKMoMgjwSUpDqD/mxQoaAHWU61yvx4IvXSEqx+ZQF2Pvl/ptuSWI2qOp1si065nQXJVs9WyJ2yWdWdsqDQe/AEblgmqVbep52uTuVFKNsCmCB3cgP8fT/gr4eYYOlmLNqFm7g1dsaojM5RkMQdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKbi1XgTtjcf6Hxp6359Xlf3bCXmX6YkhTwxCiopQuY=;
 b=ov/wHBfCY1DWQtsP/9mFMESuVe0VZ0pDFbhKWUXeD8KGNX6ydLDurQThKdmX0ehSI7VBLprL6tWJfNd6YmBA8FmH+5sDBC5ipLcfcVwgV9DLOXgvwR5KrIvuglIxHmVUTtJhZQEJWL2Rl0iI23fJK2UaAMJG4uW+SkWbhXt1bxk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 15:41:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 15:41:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v2 0/3] block: drop BlockDriverState::read_only
Date: Thu, 27 May 2021 18:40:53 +0300
Message-Id: <20210527154056.70294-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0901CA0043.eurprd09.prod.outlook.com
 (2603:10a6:3:45::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0901CA0043.eurprd09.prod.outlook.com (2603:10a6:3:45::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:41:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3022028-8984-40cc-63ae-08d92125dd89
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1780C01051950B3BA9D87A33C1239@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwIIOLe4qxcqT7Sjc9f9hFgvKmsBuxq5RaXkXU7c+3rPUkwh8DNfnnjW56WfbL2rpDuWmrDtxe7flD5yUVBpE35CdMnWVdZi62Brs9pw1TqfdlTM25KTtXs7T5sY2M30vevJjOofcX/QAEmFGnixdXHBXGLEw2flfvmleaiiFTnpgzOo6obgwjop029FiQSdijwpcUP6DRKWYreYntyLNbKg5tINtNr44HIj4Ba+8tPqU57NZ5x0K4kxVpT7hF3mhQ0Guz/nIfM8BccofltQ/MKD934O75fN/ZXzN/bej9rYgA/3lU5uW4iko4MyRRGWXvsbIyGTScyxCAzwOeZzcA39yE+e2GDRx0hAV12RMHLmCTi5OSj1L9vtL7tfpgRQmajw43b4cvYcL9wwhxWJilzeJ7E3jivSJa792/xz2ZLgqoAkdz7k7nJvU7dYq0pGBjlTh9EQrZoFovxPDY9L1lg7Qz+HZIqE6v2CHcqULsa/HSBTe95d9R2oophhstUKzEhyAepdhICQxdplMZZXGZt7cTW8H218J87daa2es8KQFHhY1yrFoFZMO5kkG4sQWkhmvky6WUcwPSTP34FR0nHcLOH6liKyedYRvG/hs4uLoEFmhdwNWVtR3jN7hSL9j+HsCI0p+hx9tymAb0Zg0vPinI5EcsKnFx/F4LKm4w7plarh6TLqkZtIh68/rm9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(52116002)(83380400001)(186003)(38350700002)(16526019)(478600001)(4326008)(38100700002)(1076003)(4744005)(6666004)(316002)(6506007)(86362001)(5660300002)(66476007)(66556008)(956004)(8936002)(2616005)(66946007)(26005)(6486002)(6512007)(2906002)(6916009)(8676002)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qn3wIROnD9HJTk5ys97JbGqstnccFMuwHuXlVp0hV2ml70ByP9yvZk8ZxPhl?=
 =?us-ascii?Q?khc+E7nYggSgSVDiHRS9O23kbmsyX0tnuQMTKo8A7GR09M2eMl0PrNQUpheN?=
 =?us-ascii?Q?15KXFMwMYlpf10PrBWednM3IMkJnOPfShwXR9KwKLohFHfViotBMVa2cgSiE?=
 =?us-ascii?Q?dJ3mM/jl+V3kHP8VpZGa101fG9QKhqTpBWiT1FByn45dwHj0vP+oW6Kol5NM?=
 =?us-ascii?Q?WFT5cuknZnokTb4WUgh3yYQ9bc7O6Y0bGuGmvwTHFMGaFcaQOb7lCSvKe6rk?=
 =?us-ascii?Q?hgR0RVlJ27sSUu9/bUNnQR+O9elYGpWt4wVXGDGlASXUIRSmBJ/RdfBh6ZAV?=
 =?us-ascii?Q?Hd3/GcrNhD2zPolm4LcV9hBSyCfPkHq+SxKsace4auMoJgZ+hIwz/qH7U7Wu?=
 =?us-ascii?Q?H/jE4+PzafwWTE1I4uAAI2TCL+raZ/acDH2Zb0mByj58cc4pOqTO+U1QB5kQ?=
 =?us-ascii?Q?nkwk1ejZs7lb13cqRhxZiAi71B/vIlOhZ3JRO85dHxWJS2wEQBY/qbIffgEG?=
 =?us-ascii?Q?0f8RuDZhbq1HhsRdrt1M2d1YnmzUwXv8E0DA8GQzyzdFqZWVYflxcmyuLEdG?=
 =?us-ascii?Q?J/vw2pqr8XVIPSPXmEITispariSykvy0qgYMkV6m4eiyAkwRfUbuvA6+dE+8?=
 =?us-ascii?Q?CUCwQpEQmjgJ3BO6Zfbvi2LA73Dr72scQbZnD5dM9BxjNvJQHFE5q7J4LhcB?=
 =?us-ascii?Q?H/QDJCQaYcWlHRrCnwVP1jv76dr6nuxVsWFBg+ZvSgd2Nt+KtI4S90XHGi/4?=
 =?us-ascii?Q?sp/n1p3qmMqUcj7s6BjI7gJeAiVR3GiMEdkyaEZlcBS397zRZS5NH9L29jaM?=
 =?us-ascii?Q?73e6/VoV1g/b5FKxSNGptsFvNQB4Q4uQgFzYi2jlKk2ya85f0iiGgpgG1m2o?=
 =?us-ascii?Q?DPkKW/akWWR8nkkKyENmLHa5FdLck6gU7SYyTQ/VxGvP1AcAyYrUPAoA64x2?=
 =?us-ascii?Q?wNNs8BzNcFs3fR48ccUGFincONNWllXkb6WtbOqZEUhzx4y/bEPsrTMWNUSp?=
 =?us-ascii?Q?+XP42sD4wTJqkMhSSyj1FRiUgGyYvnQCYy/cyCLD0v++Z21LTz1Aq1iXnHQc?=
 =?us-ascii?Q?JK9KmU4sHXC9qk1oSbcVxpV4zCFlIS1nW+y3A9i75nk6d+tznQk2+BIE5iWF?=
 =?us-ascii?Q?176pkNaqOsCV37fgXiqpEVtJ54cuJKzzQvTMYJzK/Yyd1BeYgx6fulQzoKd6?=
 =?us-ascii?Q?6jtrEj6VgBycCFOJZlNU07WVFcxOsJDf4GI3uI8Maqiyro+q5kEle3DqTJ5L?=
 =?us-ascii?Q?SmhDevFNnr3T3/8GxudtKhQ27hha/Zqdz4o+VJsLJC4BZCwp4NzAU87IsZxt?=
 =?us-ascii?Q?nHBLkvCy1xOxGhT+4M/njxag?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3022028-8984-40cc-63ae-08d92125dd89
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:41:16.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Effkb+qoxCz8IAM6w8PBwngJepSu+8wy/vFsEe1exMbQuVVzHuPB2Kq2Cg85jUA03kuGmAN4Cs3zb10c0KE5N0wNCjUppxbQXVxQD+RavlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

The field duplicates information in .open_flags. We have to carefully
sync these two fields everywhere. It's simple to introduce a bug by
forgetting it.

Let's drop the field, and fix users to call bdrv_is_read_only() and
bdrv_is_writable() instead.

v2:
01: write "update_header =\n..." in one line
03: only change BlockBackendRootState, don't touch side logic

Vladimir Sementsov-Ogievskiy (3):
  block: consistently use bdrv_is_read_only()
  block: drop BlockDriverState::read_only
  block: drop BlockBackendRootState::read_only

 include/block/block_int.h        |  2 --
 block.c                          | 16 +++++++---------
 block/block-backend.c            | 10 ++--------
 block/commit.c                   |  2 +-
 block/io.c                       |  4 ++--
 block/qapi.c                     |  2 +-
 block/qcow2-snapshot.c           |  2 +-
 block/qcow2.c                    |  5 ++---
 block/snapshot.c                 |  2 +-
 block/vhdx-log.c                 |  2 +-
 blockdev.c                       |  3 +--
 tests/unit/test-block-iothread.c |  6 ------
 12 files changed, 19 insertions(+), 37 deletions(-)

-- 
2.29.2


