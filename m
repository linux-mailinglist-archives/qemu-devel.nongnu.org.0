Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250C47D73A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:55:06 +0100 (CET)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06lV-0002ja-Ib
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:55:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jb-0007vt-9t; Wed, 22 Dec 2021 13:53:07 -0500
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:12544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jY-0004aJ-NX; Wed, 22 Dec 2021 13:53:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9689unmqsq+lY1W6h92ywWhX3KRs1Qh07rQmG6cBUBScWUJMzBCUXJSLFLXSjXTiGIx2ieX38aemUrNCKE0cteotxvzHBua1iUZT5mHYLXKfPTFPrK5HqzNRG00OicNcyRkqyRclIKUYnHKV+2SAIbceWyWGeHoQycQ5c2Njl9ACSWORpdDX2MC3quW/p9qDWijyOtw+EhbZtfYr8+Ehl5ddoi9S7cCuoZgYP1TgvOc5PXd65uSuX62psKMqJf28mF6m/p136/FylAtbEL7ICn/IUlwzjDp7nCro68DSd2xB3NRUGpl7Ql9zZyD2zD1flG6BGPdfBHAC0cyAqsErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVDC363ijlbODBBL37nrIiBRp02s8ZDJohsn/EIMAj0=;
 b=cXlSBaffdTElAGaLDpst/VgX6sAKO8an+LS1XI4NNfDTGgKTGa71pfQIy4xrWIsv1x9rdO/c9J6/d3SvlD0bb/ZKJROjxNqJQQICjYj/XuILXIVQ6bXK1vxLLl24V8guvmOgToz046Cg53Ai2nEFj2Sis9UNH2n4AkJFqwA5t5dnpJz6XWWMSx9VTxyfPZcRgGmNFXlEmVPhZMbIsqUn89yT9kW/4BaQ9bnnLli4l+03IBuPfS/TmwGC8cOiS9EQ2r7hIgi4/YrJfIE+A2QSo5Orf0Ga9Toy1Is1POwYFSnApAKlZ5YrA/+7+/TFW66DdgJlZOZYvmBTkbOkt+wmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVDC363ijlbODBBL37nrIiBRp02s8ZDJohsn/EIMAj0=;
 b=lQISEz4LHNGlJKhy2MrgugnIybbWF4geethCSb431ON3dOd7y452g53buvLBXQO4o0qupDIEkQJvUqEsfNzkjAz4nABhgu88tSkMlea0hzN+STdJS1rAl6K272FkGSJs/BEodhSNJJOVERwHuVfb/BSrnqSS82XCfgzsq/svuqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org
Subject: [PULL 0/7] NBD patches
Date: Wed, 22 Dec 2021 19:52:41 +0100
Message-Id: <20211222185248.466010-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab72f567-bc4d-4eae-f321-08d9c57c4718
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5857F45EB2F2A6C808829E90C17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qc9rNQFohrlVneutv7IAcu8wS6Ds8jfbeCUieibeaqzSSuQuCHCSHXK03rX42Xuzd5/5ojpn/HsSYypCQ5oAfJa8ns2N6VfvgW2zUkR43BSE+FTPHVkRf2y47Z8+ofVam3MRJsMwhfxsYerhA18xg+anuQ4Vovxl9M14WzTlytiNlrWDR9rWArmp4XfDpFq/3jsZMDU4GUCkbL63+GDyPbJMIG3VcdTUQI7rsS+iMjyIBR49TuRcEMpftiGIbIeJ6alm0Gw3Wl0/mFsdzONjTMf3NqVOzp7eZNkuAmouWz6fja4146LRn5QodfKWx0HnG2hqq0fsIZTz/FD2r/r67Z5RoJ2pZzhhvHv93fblLOMjfpw0ISptEeC3MclgQ/39Od8Pb+LshnpxCLrA81HYyEpt+5oxli9s2UrRR8Uu9h77q3wOzVyUMrYf8Fo3u5hsAcItS94sfVDnJ+aKAyn0Mfi52lMJsKuwW4VhTHy+uVQ4vzlJOgKOgha9Q2EOYiStxUhXKN21HlGUtTIJy63J7zAItGrpCsQs5BXhuUONXzr30QAHmDj+1W772fi9BABdMCzXRtPNAAGlbECSeWk1Pmmo5+RBbY//fKBefOtYlJfpFyPMY6K1FfbLnY94ZkvnxXYs++B+qBPfdRQlxOr9Kx9t4A6uxMTMbXz2HjL3g/MjngF6hv62bhQBS+HcrmLApII85/jcpy7BwrrWzfjR8r0qCkK11Fsr63Nk8RE7fy5GyAu3kVX3P7J9kBEg1//QWUtwoaQDHg3bitF73R5d60nRCd8CoYXOpk9XsR5vFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(4326008)(4001150100001)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3DJA1ypZQzvYss4UotXT81oethI86icYKyAWWvjSAOlyzyiWIS9VCJHDn+MT?=
 =?us-ascii?Q?D5tTLQkwz7fpWwM8xan91ZLYo/6h4syZrYEwMhNgRr5OFvswLb7F91+rgEjH?=
 =?us-ascii?Q?cXwwhvkjsaufg/w5uzH1m6n5lWPL/HVx5REbQiqVk6lBe9LRkRz+IB7Melqo?=
 =?us-ascii?Q?S0a9UrLDwe7G0HiGjIERiQGpILdq6QmelaQeC2sNWgbN7LnSJlqE/ouIOngM?=
 =?us-ascii?Q?wO+hcA5TY7CPs2SNqgVvepMrpwtp9G12dwTyQVsUk7OO82UyCfeC4eHIecyE?=
 =?us-ascii?Q?XlPkm4QS9e0Pqe+qiK2c/03emFwmLnX9wHuPtwKVJBl87E3UC6v8dSRMeeRg?=
 =?us-ascii?Q?KhdFoG+dWx00Rk2kSkxkpVTR7b9tmRRvyevnf2ylDxjJkWYc0Q+nIPC6OibT?=
 =?us-ascii?Q?Z/C8hP2WCWW64NWyK+mjqeZYK4HYMVSE7qNzst5Aak9zNlszidEr7fx+HpO5?=
 =?us-ascii?Q?oXK/UWEgTnCy3aJIBYGbRJGDL3UQGYd7TyA83AAwZ/graPLRJHN07w4EHjb9?=
 =?us-ascii?Q?nxSddU7UovZrzqezhne68HLMzM94aO8ivl8u1ziZ8oj3ultDJ/o7PF6cYJQM?=
 =?us-ascii?Q?saGQubfI8guTYL5pQ0K98ZwNpcktYVmWSbXG4n9K7y0vi2oLm6OEtdHW34iD?=
 =?us-ascii?Q?5CHET35e3CiGndnd0enRw4RQsy3yfy5Z5ZwTlZXfjZsK7mtEQH/iPkPr/SF2?=
 =?us-ascii?Q?CtQkGzcykZ4MEK8El9bKabt1ScFDc+ZVtvzVK/L114CB0152Xj/rL3T5WlGk?=
 =?us-ascii?Q?f5Tr3Ur/iOZhQp/aB296vtn/ewKBK02pf2QHagivu2MZ1Q+bH2GNMZdX72+8?=
 =?us-ascii?Q?0v1cdLHhvBp4EtYauBE2w6XHeuxhEkF7UN4NBb2on06GRQdR/PAG7+zCp8nk?=
 =?us-ascii?Q?pd4470hEac0bTmsguuJ/nAQZhHE+4Y+TH8A7mk6/lqWggyj/krEt/D4lQnaz?=
 =?us-ascii?Q?dg2/hSO55DDsFOQLMBlwp9lWmZRxQdo0Nzl5iHDaGXO4+5JenH/4+KGH7xL3?=
 =?us-ascii?Q?Jz9BK+LiuAI54CX7ftvpMKGQo6hREBAJX5skuKm9PErGdNzpMVVGYwq+iBvZ?=
 =?us-ascii?Q?Mhdfg1Pk0DAJMSFQw0Pp42NiXxMRb7kBWCMlf3wWCggHNN3OUREnAe8BWXaV?=
 =?us-ascii?Q?Yk4mlW9GO3D5qGOh3ZUHlgPvxLACFCqyY+hGx4mlwMbX4StzWwmJQgf0c7tQ?=
 =?us-ascii?Q?UAFEICRASyKj4RRMHfoy/oX65/B94ni/NE1wl5TDQ2KMUd2PwwumQzJPvxWl?=
 =?us-ascii?Q?nNKgcnORhrKy+rZn8oRw0qp6L/KDz5YgCkMLffBBEhtmQKFOU+EcOiWwd4S5?=
 =?us-ascii?Q?6BDWZWT3J4ZDlJ6Q9ol8Xar96234WqkmFJ0ZamzAgyGuUzdSnZY13zDKcrDR?=
 =?us-ascii?Q?Wym0QHCOQQvPAaBb7C4tBlG5vK1nYNeGyyy/DP2WmleCri5cpUSdZ9q5bYFt?=
 =?us-ascii?Q?Jcxgv/EYPXAflMwDboKBOwJxfXGNeJfAxPQNNRuFE78qvmoN1r/HUBRYl1ha?=
 =?us-ascii?Q?ORDLUzRrT6ExnqyOYgZZJ+gbjWA05xTb35tDbP87SJTAet/RbjqE9CACC8mD?=
 =?us-ascii?Q?Z/eXXtT0LU4/DO5sOJz6NS74Mk37gFc/zJ5sekXs5co0mn1L9j0Vr1Th73G/?=
 =?us-ascii?Q?PiiHU8efRMYY0Hyxt6nnXJl/tM6q07g0iR3TdqhY1A6ci5Mm0xRayC7xwUaC?=
 =?us-ascii?Q?1PK2dA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab72f567-bc4d-4eae-f321-08d9c57c4718
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:01.0488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXSL5xumwvdltbIXc3tSgo+5H9uZHehqq6vfrXDinSIjdM2J/KVo2u3wCh9VV9F+any6mR0R8ia6eK0Wgs1KqQIYp88amY/lnMwaJjMPw04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:

  Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-12-22

for you to fetch changes up to 7f82e44de82ae1eb09c4202fd8282c8c0a0a9b4e:

  iotests: add nbd-reconnect-on-open test (2021-12-21 14:56:25 +0100)

----------------------------------------------------------------
nbd: reconnect-on-open feature

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (7):
      nbd: allow reconnect on open, with corresponding new options
      nbd/client-connection: nbd_co_establish_connection(): return real error
      nbd/client-connection: improve error message of cancelled attempt
      iotests.py: add qemu_tool_popen()
      iotests.py: add and use qemu_io_wrap_args()
      iotests.py: add qemu_io_popen()
      iotests: add nbd-reconnect-on-open test

 qapi/block-core.json                               |  9 +++-
 block/nbd.c                                        | 45 +++++++++++++++-
 nbd/client-connection.c                            | 59 +++++++++++++++------
 tests/qemu-iotests/iotests.py                      | 36 ++++++++-----
 tests/qemu-iotests/tests/nbd-reconnect-on-open     | 71 ++++++++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-reconnect-on-open.out | 11 ++++
 6 files changed, 199 insertions(+), 32 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

-- 
2.31.1


