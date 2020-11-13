Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5642B1BC1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:17:41 +0100 (CET)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYxQ-00037z-HF
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYuB-0001mB-79; Fri, 13 Nov 2020 08:14:19 -0500
Received: from mail-eopbgr30128.outbound.protection.outlook.com
 ([40.107.3.128]:31456 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYu3-0000jN-1p; Fri, 13 Nov 2020 08:14:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKL7tY4HFLOS4fS2AA57GKur1y/8Vv1w0UZ3Hgf3TOCbcjtvp5HQFtF1IwhvN/I5KjAdIUcpXWcBDSTdq17ObV5lvhP1zOoR1lMbOXNibNwhVnyDUL1jFUMPrr32ZuDTL3GYpvgQm68am31MplbXTJYkUCek6oMro09tcPB529+FrPz02JqBqNQUW4XXl+c7XbKOvLVe+S8fpdk7U9ulrmmESGJoQnB8vVpdmTncTpCfjHupkIN/6fEsLN1OT/9JpV+hvbPPvfyAdvDOtA6ktcJovJYlr1AkYyCgI2Dwub15KCw6XUlaGz0LTHfQW/fRdqvHRiOWqgD1qYqGa27Flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfqEB/DikStWr0B6LP71RXPMHZ+PdxdqQOBqq9S0PvU=;
 b=XZ81Fi+p3sdbGdtwjN4qhgGfxYNIViVujq56y0TFgO77eO4WKYqu+ExODQRrAjW1T0WN+XhBkV8J8FwVXT6+rwByMObsU2NG9JDP+j5Z1Ey9781kuLQ7CQHBkNrQbdkyKMCj8KafBXXnQLZkGy5OeASZNgxjLN86QhG6gAZY5IJWKvom9dK8SkO0o0homv9Vq3T8xnDDxZmADzjt2dY/8BX2E7iAWeXPhr7uNyRa/0PQtR9TzAZs9//q+FB5u3zQqQhTwileXlcY5sg61DvNLaPW9gyC7YhiB45ixmGnvzK8XHqAXgkyUCaHtLIBeasjXEHJyl71nFW94WDR/DLr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfqEB/DikStWr0B6LP71RXPMHZ+PdxdqQOBqq9S0PvU=;
 b=Aub7qEr956HI6C6lT5iVWgM9C1p1BbGXHBODUbGTFkckw3/uzJUXqJnLibSz6xDFQ+93eGzl3Ibk+/KAE4zEPbLBSGFz3GcR54Gb0Ur2DRHsHfzMrhy+45LDYqKuVSGEcXokxqKRstV2Ub9CA1X+3+ImKASVJk0QU5dzc5bzKY8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 12:59:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 12:59:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 dautovri@hpcdlab.com
Subject: [PATCH RFC 0/5] block: implement Parallels Disk format driver
Date: Fri, 13 Nov 2020 15:58:43 +0300
Message-Id: <20201113125848.20498-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.71) by
 AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 12:59:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96091fc3-967c-401c-994a-08d887d3e5d7
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5877996CE46733BD017F2BC4C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+/4XWPleOZTnjknCERrx7glh6RWxL7EjtDp0b77iBvI3LsP+o3EWXupK8red0L5E1slqwtj5uDIQhx5Nq3Ut9oVIY6DE0rMgiaRgIT+Zh95pyuOKIFURNLfO5Ock/lpTI1AbwwMOODm53XPhQK3NZ0ZGVgpPyro8DuKtqhtdyLpJZ+GiIBqmG4c6yTfAtsmetthoFvEYmz88JNVWtBP+guSFharSDduLJwrJxPH4uBEJ5bfugPsObuksgRpEo6A7212877Y0IlK7yVBUiqtMIv+2K6wQaACw0xNfIFpgFAvi1H0MEUsnBUXjCdV5k49oF9VsXcVh75/84yAoh4ILA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(19627235002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: DrSB+VSgngabwUZmes84SLPeWpmsxizrs0WkVZi3ycKUClLSAxUf3+YPNh6x7BcaIM8//Yo0njOJXwU86uwHPZte3xBAzFMkBYyJ0h1KOAdaCgrJvqDklXpGccrtvm22YQQDc9WfJsuuOZYiWVmim70T6ZYTjFGcIP5O+xVh8Rb5J18tUJ+jTYh9uQGnRWwFtMz8iLLP0voLCg124/RUS7uQAWN5Ki+EkN1/zHZk3E/qb1AXw5kYVJ9Hs+KVGNwgnkG9DRv9W+7ljPO9ScTRj+DahZSdjJP2V/s3UyXUVBVm1PeUtIvyRwpg0MEqkLScT4dyLMhDjOHny8B29y2KziIQPwhuEF6O0d5NYyjA7LQtBAttDBIWhnNN1+ujpO+wF2h2F+CDJhy/bMAF5docACHVZ1+gMnperNs5xEKEr9ICS2C0LeQksYMb2vGJ3MDsxRBILNKRsXqvtbC8xuEZaBgU7Rkw5Rzt4cBpalUfT8Wzi49hPILaWFkgvfvYcNU9O8fn1U/1kulIPPBTfh65djV9ASjEVJz2otOx9QYajHCEHlpzvGrNcagTxXtBD6sVH//Wq8R35E9j9FDuJ4fTULdRisW2j+JiNhG5rDqRVgQ4kFZnU0WFa3L3qZwBTgLoTKkEvk/q8cSCCK2hal9gkw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96091fc3-967c-401c-994a-08d887d3e5d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:03.8499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW8F7RWimfz4Jb582OPIbh2u1kOasjSpJ6sAnH8jDiXXlVtCSv1VOd0FMVjpcw/zNJ0bOKg4DZxksZ2L3gAYEoDOifqf1FG0ZMgYkTbKwpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.3.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 08:14:07
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

I just send these old patches as they can be useful. I'm not the author
of the code and not going to discuss them. "RFC" is here just to mark
the series as "not-for-applying-to-master". So, please don't answer
here. If you want to continue this work, post v2 first.

Virtuozzo doesn't have plans on improving Parallels disk format
support in Qemu. Still, if someone want to work on it, these patches may
help.

Note that patches don't apply to master, they need a rebase. I've
applied them onto b0292b851b85ba81c0cfedf5b576c32189cfaa11, to run git
send-email. So, you may start from applying to same commit and rebasing
onto current master if you want.

Note also that Edgar and Klim are not in Virtuozzo team for now and
their @virtuozzo.com emails are invalid.

Edgar Kaziakhmedov (1):
  iotests: add test for prl-xml format

Klim Kireev (4):
  block/prl-xml: add Parallels xml BlockDriver
  block/prl-xml: add bdrv_co_readv/writev and flush
  block/prl-xml: add bdrv_probe
  block/prl-xml: add bdrv_check

 block/prl-xml.c                               | 560 ++++++++++++++++++
 block/Makefile.objs                           |   5 +-
 tests/qemu-iotests/164                        |  98 +++
 tests/qemu-iotests/164.out                    |  54 ++
 tests/qemu-iotests/check                      |   7 +
 tests/qemu-iotests/group                      |   1 +
 .../prl-xml/DiskDescriptor.xml.bz2            | Bin 0 -> 457 bytes
 .../sample_images/prl-xml/Snapshots.xml.bz2   | Bin 0 -> 307 bytes
 ...aabe3-6958-40ff-92a7-860e329aab41}.hds.bz2 | Bin 0 -> 93 bytes
 ...476cf-d62e-45d1-b355-86feca91376e}.hds.bz2 | Bin 0 -> 93 bytes
 10 files changed, 723 insertions(+), 2 deletions(-)
 create mode 100644 block/prl-xml.c
 create mode 100755 tests/qemu-iotests/164
 create mode 100644 tests/qemu-iotests/164.out
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/DiskDescriptor.xml.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/Snapshots.xml.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/parallels.{5fbaabe3-6958-40ff-92a7-860e329aab41}.hds.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/parallels.{986476cf-d62e-45d1-b355-86feca91376e}.hds.bz2

-- 
2.21.3


