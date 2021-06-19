Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17893ADA5F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:22:55 +0200 (CEST)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubs6-0003A1-PV
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubqx-00023b-Cp; Sat, 19 Jun 2021 10:21:43 -0400
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:8480 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubqt-0005FQ-Ti; Sat, 19 Jun 2021 10:21:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK0UqmnqxOS52ZzFeFwxtOS3if+NX6e96I7GNWi3+MVO6OoznY3knIWAV0BPC2YgUjTX3w5opv4Es3M4sOESpbxXS43embWSJEyE+C4bVGwOwZHoc9JIO1z8yPMJuv5EKH1PV9BSqzd6wCcEulGXHCexJhaO02xbhHQ3aeJhXHiK7WqKUrXG5fGAEJEXB3mTpggXewJn8pQkqso8z/+wtMWO79U8RwcIoXrj54FB4FgR8YOugPA59bJbbeel+XTydt57qW7QCM1imexx0wFEHJj59cIMlUqbNLdFaZEE5muhSyH2+1dzT8xLOH69ROwtElR2lZuilJFWKfT5mbPNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2sk7ppvsePeoFJmKhGF4aC0EXWorDfGSY99eFEgC74=;
 b=FKVQQafJTNZ752IV2G3Q/ym6kgvWXhZ74bXYQr+QCgNWd1o/dF6wr8faGkCJnqigcwpd0D1TKDwzgjY8MEgAzAEnTuXI9MI/2DRUqaeN6Vha4Ip6TJDrn20gc3ET5j3rEUrr/uRpJtzlBKExkc+rq5VBE3zzbAGa0tE/biZeVP7K0v3GZBYyXFfw3hca9JjgV/VxI+2DiOkdo+V/6JcW95zFonJxf1MxQeAFnz0HHnpa84acxZht3857mutC7ISV28aiRlRgxONmciGG0ws+7jCUL8QlAhNiH+gvYMPiCx7sm/j9dg/PIoyAbzJ3tp5cztCSh0TFOakSL+ennFDbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2sk7ppvsePeoFJmKhGF4aC0EXWorDfGSY99eFEgC74=;
 b=U/W0zOIzJDPysCVmAuhcjKQ6UoXhgjMoxAIKm6GuQNPkR6e1RYX2ZgRj+WiCEOiNx+zEb+X9iRLGR8+h89u67rgGM7a/IKgYstlZ/v2Zypxc3YmZQFrJsx6bpv3Ixbfndwu4UiBzxeMCVov9DL/vQoLEHNr/vO16151zzT6RYrQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:21:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:21:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH 0/2] introduce QEMU_AUTO_VFREE
Date: Sat, 19 Jun 2021 17:21:18 +0300
Message-Id: <20210619142120.48211-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0902CA0059.eurprd09.prod.outlook.com
 (2603:10a6:7:15::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0902CA0059.eurprd09.prod.outlook.com (2603:10a6:7:15::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Sat, 19 Jun 2021 14:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d6e464-574f-43d7-a0ae-08d9332d8c58
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB606914061A490A4FF377FA14C10C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MB821U1AdcuYeOsED+rrQ36L9eRgw8eOHEYZ1Ln4hBnJhvY/YCRmkq9JPjbNsD/2c2hnEr1umtOmRgmPb7TsNhChbQg4MGtpQTTLsQOIP8LJ6W09geoidbqqLnBM7dkoteNkv7Q8YAVK4wRV47au1Wfh4CPhF17wv+87gABawsyFiy8NCVrodZgyUiPa1GTJRPLuM9P82Kj0ca8Pa+61zE9SWGBNUXB6fuE7JdQn9ZVnEvb8XtyE9msUwD9gZwEFS1tumKObDiDvWVrjzfWeR8PqmSoWF52TWcrHyTUgQbp3DuofcWjK1t+xJCsiqKeaEyLLmhDm9p9cAEkc/DOrHO2WgMBaiojHppaOPn6NKdOBCDkjTjlr6S3U6hb4LyTKQOlu+O1usf1ehGpF4DW871jUvFgo3dYJefyJxlk0QQofZjTYPnRHeH+pMbaC+mJUimYNIAOj8FYa4x8y8E30uipvd9850JsM5e94kg7hmLViz26Xvoc6OotoSj7544W2dAXD4A9Ddy0KkmJrspHN/Wuh1zdDOoM/T+NqNVhbvLzvhrmzOgJ3uWcn9UARKZyb/Ys4r10iIniPe5pp91Z6K1w1l20DMvDQO3kzWvUjHb1aPvfZXB67O7f5hzU6mj1V+bEoh+0YY5cGD+ZnEjDcoU4DPaDlFnAeSq0SKbqRJyoyHkAz3FFDC83ugURAgHhlBhrXEQ8oJVGMngfk25u8YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(136003)(366004)(346002)(6486002)(38350700002)(2616005)(956004)(38100700002)(66476007)(2906002)(66556008)(6512007)(66946007)(6916009)(5660300002)(6506007)(1076003)(4744005)(4326008)(8936002)(36756003)(86362001)(83380400001)(26005)(8676002)(186003)(52116002)(16526019)(316002)(6666004)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5aAbfjf89PBbkQmTLc5a+eK+2o6uPmOwwqMK7XFAt8t7MAhtp6LBdWQNrnf?=
 =?us-ascii?Q?UVgAG4cxVe+/xBsZcO7S558P/95YpHxr2e3cywCfn00ePDpWxucbLLAKYMS5?=
 =?us-ascii?Q?+2ApCEEyKQ5KExXqfzh3Vhc7KXeG8syovauQ51QTjsLEA80IOF3GhIz7zlcW?=
 =?us-ascii?Q?JJO4QQNs4+Cpbu3l+H5bs0U7Gb6a1CsARRUuDwr13kiRw2j5quq0eq692wX1?=
 =?us-ascii?Q?/PTff8bGQHmpi7stzRn3r2frtUQNKGg5uGXME3XvFNAZRNbikwc7IlX7Dv5B?=
 =?us-ascii?Q?OS5+MDBYlAnCoZLFNeVXSDcOPTr8o5eCf6pyDGT0avwk3Zr5D+1EWVtzRdFb?=
 =?us-ascii?Q?+7++IZnLHQJ3n1ZANqel7rW0NOZtonCwRh/UBoktwDptvzJlDemtjwMaGBxZ?=
 =?us-ascii?Q?+NEMrsekzdO9zupGzrq5nklNIG/zXY/mR2WgZylGUyhSZgdFJrnreQ8Atm29?=
 =?us-ascii?Q?0lscD0ZPj50mtNoHEdWPfh3x+TM7wfrLobszfEzasJ6PQm2sCfJoy14M4Zli?=
 =?us-ascii?Q?Jh3mg/9PbxQt2zpx2G9UitFz98PEtdK3EjagDDn1Jc2KoOKgttWQpV2/TMdH?=
 =?us-ascii?Q?KDqtWIkjrR21lZYAYsZE2QhWLQS2XAMquQUHysMcyKfN803Wg0I3zed3XIDV?=
 =?us-ascii?Q?3ovzBlGwPCbZCGUw8DXY6douL6fMjRsLPKe4gtBjZx0SDn822JYdf46q+3xL?=
 =?us-ascii?Q?m7zXrTf5zZmePBg09jXiTebWxIJMv+1M0GsiMVJ326SUutJSy4aA91RhKfgC?=
 =?us-ascii?Q?JdMMTIdkMNXg78+aBsoomCrWADkKJThsxu2o08w7cWiNweBt2ikBVZoOmE0r?=
 =?us-ascii?Q?/pPHlwyJ6YauYcTLKqA01fmyemV0erCB3jc/cdkOdypcJqRH5mUukoXDOoUc?=
 =?us-ascii?Q?/6yF8oI33zcVwF3NM/39mdhZ8jZDqmtKBNRnrAHfc/MN0j6nwa5X78ETJ3ll?=
 =?us-ascii?Q?58SXWV9/gVnrI0Hl5ZdOXJx+zhgz4CjPKtXwIk5Un3i3OyAHuAB3nZY+al24?=
 =?us-ascii?Q?HS7zc2vs9aT3z2y9TBJzTdKCjtXwV2Ws+dD4clukqCPc+cJx8YQHp2hTflzp?=
 =?us-ascii?Q?1ZAZsfI6jnkU76eSkQJ/r+eaKWq8nBiczYCbV+3jnrdXsR8z1U4CFX3SA/cU?=
 =?us-ascii?Q?DGgvF54JNnllifCL1OyRxdHAe4CcjIa39Hg68wAvu9YiPpbqJ3Q2wCEaTnqV?=
 =?us-ascii?Q?ZI9fNOz5W6dEitceR8xT+suG1hJHSWqJb02ILXNAnIbAHuXDRQ9MOhtrFRKh?=
 =?us-ascii?Q?KtVXL0fBgxrGcvrawlTyHgCj6YJ2Ld2w8puql4bxasaIHJ62rWqI8uhnFmqR?=
 =?us-ascii?Q?KX8v/YSR4C7aP0ovt9v5CgzJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d6e464-574f-43d7-a0ae-08d9332d8c58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:21:37.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERh0ZkXqCYJoLObYOaNXgwz3+ceaXzynBUCqDWVKv8PcRWXggAbj667xNrrFBqusGAh8dnwomU9MdtOFN1Dh0JfKTIES0MRZhNnkpvRXh2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.20.121;
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

There is a good movement to use g_autofree macro, that helps to
automatically call g_free on exit from code block.

We lack similar possibility for qemu_memalign() functions family. Let's
add, it seems rather simple with help of "cleanup" attribute.

I'll update more places with a follow-up if this is accepted.

Vladimir Sementsov-Ogievskiy (2):
  introduce QEMU_AUTO_VFREE
  block/commit: use QEMU_AUTO_VFREE

 include/qemu/osdep.h |  2 ++
 block/commit.c       | 25 +++++++++----------------
 2 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.29.2


