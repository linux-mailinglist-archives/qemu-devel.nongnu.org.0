Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BB2B83A3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:11:26 +0100 (CET)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRvQ-0007dV-Af
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpB-0004Y2-Kk; Wed, 18 Nov 2020 13:04:59 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRp4-0008Qn-WC; Wed, 18 Nov 2020 13:04:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAtxH8CyLLFOimQSitvIoUD7YC/kOkLHX8xllrDpGoX9e3lRyrAuz5eU25yhCAa3KM1ddhl35pcz3e66Gj5BCi224iqD7eAhPwV8rQz9Tv+86os/f/mxc5BWKrgXgp5xY4Nmdh92qWg7fFoFEPMXb21PCiWp9D4L3IVEuyl88s0nOgw04NeaTzONZf14wVaEt10BVduWGSuAUSqXQEmTKxoWS3ePF08v0qx0OL5LzfF1lIBy6RgqfTfsasEIJG1StcpfCFBLIuH72HuN4bLEYzq4cVtHbw8o5b4gsdr18RiTjEo6qlbHrnhsWzQr7HhxoWxSRTbKsiwb05LYhKQTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otAleI8+rDZBnQYhktrM92392rOEcz/n0GiuGj9R4/k=;
 b=Hc5JJfAX7StPS0z1FTqykqM3iiDfvunX7WckDVwIWrkrwUU7dwWtX82mFZvJZiP3HYvI1KtiRgPmrdSbyC1VwL/YuLtcAFEfyG1R6/FmLa9mZr9Q0GY5mlLCKhM+uz2XZuXilXDtDfsuyWRiiGFu0zHQKyVpqLwkbnVsWL0nZzly4BpZnI023SmppfJL9kExadj5tsm/Uixu1Vc7eXDwZNeoL5vqQeZzx7JfAAXXIQN+8aDhpmYFzBP9OYy6tFR5L2ql+of/p4pxsTFtXP8AK8Cw1SePJxhb0geQWlVeVzsKNgoI6tzo5Qylfx12JVN6jU689gri0FpGsDuePn07Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otAleI8+rDZBnQYhktrM92392rOEcz/n0GiuGj9R4/k=;
 b=HDayf3YbxrLLwInSE7vhb5Oph7VsL+VFDBi2lmxEQF1/YvsbQkG2LNI19GsNthcRWrbxt1PmTeKDsvam4mniENpd8SPI+cOuEiOkuNzGYBCHT1KOai5a9Jsi2VVHpK/XllrX/Zv15v2bI0AYfsy6gXTBdNhpUCLI2uou++sPzPA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 00/11] mirror: cancel nbd reconnect
Date: Wed, 18 Nov 2020 21:04:22 +0300
Message-Id: <20201118180433.11931-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71574847-bde8-44a9-be72-08d88bec6ecf
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912F8407FE785F80D76D617C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zZxppho/fuB1km7ZllCgIpQa9gO52P1dce24GkZe31JIYs+MRa7djl4kz+ayhm0VLvFP1hdLxp521iEO8Vao2h6Hp0eLAXhGl8p3Bv4FAluCqIZejN6xEhMOdaJ/kCj7JpnLIawBMMJjeWnbjdYa2wgWNZLlpOkSflH1i53QU1+Oql4KUFzGMx5sIJjSSmm25FS5cuZNc+iUg+S28Mz9SU0HVZYA8Lz2a8vfcw8ZxfdH+31iGxG7gLonR7bTkLL+K/tsw7+ZLdyovGzalNgSnIHBvdzX7H7iWSP1un4bbo/BE8OZRX6GXlnZpGxl014ZHXpSFurAD/dax7pj5hAhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gpg+lT/m0NJDPk1URvsIzm6CQyGebq3PKhIiltExmFInTwSPHxCUnWaZJgZNv3Wc0Dvpqun7x3wwUb8P93a3UDn/8J/pyWO/xarT8lVYDttSY7/AC5rcG0RdFuJ0tZUE5olFmNPqLurhGv6vV9eU65gGiCl8ETjfuCyazrf1ZscahPzxA8YwmaoHhQKEopV8gyC873DLl9npc7eRXXT2tqhWLwd60Fb+O0szsLxpyGPiUCU6Ea82N29UJ4p2zmhRJ9TaboQq2Xlhp4ZLycEP0arOsYEy4/Ny2C4m1ehN8Kj2sUd+Bo6eUFagocPomnvzOrjdTWSD85M+M34NCQFSTEeiBPl5/vJ5SXBAb4rMEdRvCPxkYgvg+qRWfmAQUGWcjN942wU32U3uEvQVS4wl4YUYl+g2Cy644GC7D1Nv+OrY+tyzrOIJnmzKR94heS2tuOhZ9wHfCycVIXNkobjKH90LeqoO7FIEJ3Cjq5gZAAFGyXIMoLSM2PLTU/a8PcWbGdFF7OWJzYbl8BTzcn038n2YfFVkJVE/M+VZgOsRa3aTeuH7rM6Eyf/nvBp4yzoQo66WD+QzdVGgH6rI4KijFq1ly0mjggH33rkqTU6hWPPxoSjMjGJy07ocXhgG/bVDiQ6NU0j/RrgTkK7OZIiusQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71574847-bde8-44a9-be72-08d88bec6ecf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:46.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DNbN/2joe90zwtO1U+0OXpjWT+0Lw/nJizMjfNkuKuEDrgK7TBR3mrLKDorGXzpT0nVx6OqvtZqo8f7AGtf52OzyODLFOK58GQ664cJgkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:46
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

The problem

Assume we have mirror job with nbd target node with enabled reconnect.
Connection failed. So, all current requests to nbd node are waiting for
nbd driver to reconnect. And they will wait for reconnect-delay time
specified in nbd blockdev options. This timeout may be long enough, for
example, we in Virtuozzo use 300 seconds by default.

So, if at this moment user tries to cancel the job, job will wait for
its in-flight requests to finish up to 300 seconds. From the user point
of view, cancelling the job takes a long time. Bad.

Solution

Let's just cancel "waiting for reconnect in in-flight request coroutines"
on mirror (and backup) cancel. Welcome the series below.

Vladimir Sementsov-Ogievskiy (11):
  block: add new BlockDriver handler: bdrv_cancel_in_flight
  block/nbd: implement .bdrv_cancel_in_flight
  block/raw-format: implement .bdrv_cancel_in_flight handler
  job: add .cancel handler for the driver
  block/mirror: implement .cancel job handler
  iotests/264: fix style
  iotests/264: move to python unittest
  iotests.py: qemu_nbd_popen: remove pid file after use
  iotests/264: add mirror-cancel test-case
  block/backup: implement .cancel job handler
  iotests/264: add backup-cancel test-case

 include/block/block.h         |   3 +
 include/block/block_int.h     |   9 +++
 include/qemu/job.h            |   5 ++
 block/backup.c                |  10 +++
 block/io.c                    |  11 +++
 block/mirror.c                |   9 +++
 block/nbd.c                   |  15 ++++
 block/raw-format.c            |   6 ++
 job.c                         |   3 +
 tests/qemu-iotests/264        | 143 ++++++++++++++++++++++------------
 tests/qemu-iotests/264.out    |  20 ++---
 tests/qemu-iotests/iotests.py |   6 +-
 12 files changed, 173 insertions(+), 67 deletions(-)

-- 
2.21.3


