Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A63D0C53
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:16:46 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69HR-0002aI-FH
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697I-0006gc-Ml; Wed, 21 Jul 2021 06:06:17 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:45473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697F-0001sc-6w; Wed, 21 Jul 2021 06:06:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7nUwRFsydUrnCiSbeVQtc+NqS1kg5OiOWGtsNgg1QtUmetzmU2yGo8TAF6WIeD5q40mUvjRuZs6was3YYAckbh1cAUCa8LH1YdhUOP/Jjep2Yt6GcQVDDJUlcuT3HjAXISjF3QiIzkW/9u2PNH8O/ZlKDs/6CzxNmh2v9A4kOaXCuZgxlV/L6s4c1GLx1/zk6vuL/wK98NubP8/ZjliLL/vktH8k+GupRoSxSySJhrdMwznUDHdf+dNESf2dDP3hhcMDQtD7XAmhz+vDBQPdlSOL7LDcQbTCh1RuISkDr+xUbH6Z3mZ6nqgVXuALomPYGh5cHfbfwtIxhs1TNOnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3GtY/60899joRomS54J12PeGHFiGORsTTFPF1R11g4=;
 b=TvXVi9XmSaoD98vtNl0fnvhVAvq6mkJMVksPNUYh3Xuo3cLuVQ7WbGc8uVKq+qJRiYDWBD5Tzfbx35DJ9QSekTOZHHFbzE+WWomgvZpFVluAXk2hNuKacqTbFT4/US/Rju0QErOgsYTyWK9v5piuwFNZJNH701fFETQzVjneVVYkDPygMYGAzuTQfYE+0UCmUNK82viw7bdspf6IaQ/+4UbUblBrEy9fj5brwjczA4nTImgndmugmYovQJUIWAAfmqOolJL7VTU3S/wyX5ETvm19oWVRv7HUrxrWJNYoo8aT83u/5md2NTyhtvPVk3/Fi/r0DU7myNyGHPXXOoVBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3GtY/60899joRomS54J12PeGHFiGORsTTFPF1R11g4=;
 b=IvHNGH+LmR2qHumUavpEE5E35Lpi/T9N8+zVase/YxeWNnv1ofBZJ/D+xKGbZgajlKc5UAiWCzX9ZUvklt7wdN9lvuLJykVRH/VhA/OVZF8IH31YnyYMUojZnTUuXgyunDZgs9EGycKSMFXU9p2zTEVPPJ9kc6Ofy/EQHRh6gwY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 00/33] block: publish backup-top filter
Date: Wed, 21 Jul 2021 13:05:22 +0300
Message-Id: <20210721100555.45594-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8effadb2-04ff-4749-e531-08d94c2f29cf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168A407D456B0A6EA16F633C1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYDMwY/h8ha+L9scIu5K92zXFb8jpVe/1ewaHvDcmGhLwa2qDSmKTPB/6WbBEbaZEH8GcxSJO12jbEppZfkW4ocIOoWwTGF9/eDLTlvJzeu0CPEnKAbXYix208FOg031h89Occ26TXfx7IpW7eAlvW+i7hpm1hk44w2TE7XyfQwjpIEYLJkdkBnE/a+uimiJ4ZQwZAhrLiS1qW6l/RoewZ31GcKpJZsNIEimtNaWy0in7zY0xeKWkh2pM1TtIz/m/O7gug0/R5ZlE1EPYTBpAx8jIVvdP2IyZjYavhA0pljaD9m/sABcRDEBLKGOKFHit9/rcDYKLUaB/z9aPDshI/GIihGs6IM0yt5k90D/P6xWWXKa1gVQLbsOLij5H1jMggpO+8oDdZInprHUSaBeggxwCz/xqlqGzLM5Avu7keTwSLl5iWOUt9UjVS0926GO4jlH+y5BSnwG3JOz+kI2CZg/x30beBVWejC6U5hu1CHVqEQkXOIA/BBQvX7NaNQzFMF/hc69yl1s9Tfk2OtN9wvQsXn6cD8P7mLN9oy0wbFkyiIRw9r6GsKjZWxhpFi1e4dS3I/bwblR12P61ECVeyRp+ENfGBoEvbIuI9CtKpQCs80O7YX3wGmKkai21n6m7mluQqrgFT5JqIrmCgMXCrkSTxeIeBv1S3v0vbsoYdx6EAVbaLxOCEIzeHG4XDI+eSPUtrgN8xVoD+Qaesx2ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2YwVFd2RUNiLzJPVDF1a0I2aXA1ajVETUFFdGN5Tlh1cnpGdEFCanVYSFJZ?=
 =?utf-8?B?UWV0akZySHdGb1Y5QzZJSjlxVU5VTzlTSmZEY0wzejQ5b0hjZyttUHN4dm1n?=
 =?utf-8?B?TFRnZTd4ZkNUNHpuVVNoNElsWXBxUW5DTjJOUXNEeDE1eURBS2tROEt3dUkx?=
 =?utf-8?B?WGk2QXQ1QkRtdXVpUzhldDRieXk0QVNJVC9MUjdEY1dFcGZGSFY1LzNKOHlZ?=
 =?utf-8?B?cDV1bGFkYVlwb1JSK2tlNVE1RUx3WEJkdnljUGxPa0FxTDdJU2lxSVpOZlFZ?=
 =?utf-8?B?M25vN29tYzJIVWtCMkZ3d0xsY1laejNWUWdTbVp0c01maFFReEZNMzFEWU5K?=
 =?utf-8?B?Yi9wRzdWb3VqZnJEQTFLUFNlcmI1eTA3RW1XV3ZFT29vYzVXY29tdzEwVHZW?=
 =?utf-8?B?UDNCTlZEWnFOZHRyTU4vZWFhVkV4bm45bTd4ZEpwU3haQ2Q4UWZOMGgzY21o?=
 =?utf-8?B?SFo2ZVczUW1LaWN5NnVqODRMZklCNWxQVkdlcTVrYmtNVDBUNVVhVmQzWDgz?=
 =?utf-8?B?RmJuejlLRUVxRUFJSkpQTnpENWpNa1NHM3p0cmtSdDdKaVBTQUd0Q0U2a21w?=
 =?utf-8?B?d2dMVjNXc3hqZ3MyZ0tyVXphVCs0QUtVSGtDQ25LNHkrcS9zaW1DVUVKUHpS?=
 =?utf-8?B?cDlzM2J6Ym03c2VURkRueUYwWml2c1VUYWsxRElTdENPR2txaksrVkhTYnRn?=
 =?utf-8?B?MEgyeHJidE1adEhjSGZiek16b2t0V25uUHk2b2t1ZkhqVXBRTTNuUmZJa1ZZ?=
 =?utf-8?B?bGNKVlB6cWJCVG1XRFJCRXViZmhZNkIwVVJTYTFMVnhsbUFQcTZpU1gxQjNG?=
 =?utf-8?B?L1VSeFk4Ly9MSFd2L0dYc0czTEZJTU05Ym9wNUVjNzFUNEdPNnZpY0xCbDVK?=
 =?utf-8?B?MVZvemEvZElURkJDRzFwUXR3cHYvTmFubHhXaG1WY0hoQXNtSzgxbWxrM1Bs?=
 =?utf-8?B?RkcyT2hBTFBKSzRCeFVXWGhvOU5EMW5KZTVlVDhwVE1CYms5YWltcXhZbmVC?=
 =?utf-8?B?SkJrcW5uN0FrL3ByUWE2WWhlY2VEdXErKzIzTTh1V2xtenhhdXRpdEw5SVgx?=
 =?utf-8?B?MW1pZTkxNWVmak9xUy8rT2RTa0VucTR2Z05sYVNKV2VCaE1pNnlxS1o5eWla?=
 =?utf-8?B?NmFuN0FKT3lLUDhmNElNSW1adVlsZDJWck1VeGRhUFowTXdDR29raXpXaGlR?=
 =?utf-8?B?SUh0UkRNdUU2MExldnVKaGNuaHNNM1JsQS9oM3d6SCs0WFdMb1lmdUJUQmFh?=
 =?utf-8?B?UmRMYUo0cDE3Vk1Vdml2aXh0WHE1dWIvZ24vRlZxQkRSTk14THVHOVplTDlJ?=
 =?utf-8?B?Q0lBVkdwRC95b3VWTHRlM3ExVTQ3RS91RE9SdEhvRFFGNjlSdTJPaXljUFlX?=
 =?utf-8?B?aWJ4dTBJUDAyUmVxaE01OXh2VVVyT0R3MTdLSW5jVmxWREtCYWRJM1dUV1or?=
 =?utf-8?B?NWlOUDNXc3A0MEV1b1pGNXhEOGpiNFRnZG5FakVwUmVyYVNzNFRlaXRjRkRV?=
 =?utf-8?B?M2JoQ2wvWGtjZ2tuZWxVQnYvZ3JkNXpHQ3lpN3dIZm16S1g1RzZkWEtON1Q4?=
 =?utf-8?B?UkJnVkJoZ21GOXp5RzBPVnRCVStDRUNvcUtGZjVyelliaU5mdUNoK1YwOEJ0?=
 =?utf-8?B?UUFKR2JXdllxZE1abWRUVWZCNE1uQlRkczJjVjNxL1p5a2Vvc09mWGRTL2Fr?=
 =?utf-8?B?KzFSdXhwYWY2OERGdEZtMUpNUitpUHRGR205MDRLNG9Cbyt6MUIxRFF4eVBw?=
 =?utf-8?Q?VEwwHbMo3UccdZ3ehAef4JUAiU+W/OKEB+t+cDH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8effadb2-04ff-4749-e531-08d94c2f29cf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:09.9883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJSBamRxcMbDrXHpABL8Io736LQidfsSXrpeW6vbaxMx3tIxuf/IN2/uOfrr0S8WfJVO59AOV3yYW2opSDaYUibxlOmNEVxZ1XHQ43XjGrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.124;
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

Of course, that's a material for 6.2, still no harm in keeping it up to
date.

v6: rebase on master

Patches without r-b: 9, 10, 19, 20

v5: rebase on master
25: fix pylint complain 'Unnecessary "else" after "return"' [John]
25-26: rebased on moved machine.py
       use Dict[str, object] typing instead of Dict[str, Any]  [John]
       add John's r-b, keep Max's r-b

Vladimir Sementsov-Ogievskiy (33):
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block-copy: always set BDRV_REQ_SERIALISING flag
  block/block-copy: introduce block_copy_set_copy_opts()
  block/backup: set copy_range and compress after filter insertion
  block/backup: move cluster size calculation to block-copy
  block/copy-before-write: relax permission requirements when no parents
  block/copy-before-write: drop extra bdrv_unref on failure path
  block/copy-before-write: use file child instead of backing
  block/copy-before-write: bdrv_cbw_append(): replace child at last
  block/copy-before-write: introduce cbw_init()
  block/copy-before-write: cbw_init(): rename variables
  block/copy-before-write: cbw_init(): use file child after attaching
  block/copy-before-write: bdrv_cbw_append(): drop unused compress arg
  block/copy-before-write: cbw_init(): use options
  block/copy-before-write: initialize block-copy bitmap
  block/block-copy: make setting progress optional
  block/copy-before-write: make public block driver
  qapi: publish copy-before-write filter
  python/qemu/machine.py: refactor _qemu_args()
  python/qemu/machine: QEMUMachine: improve qmp() method
  iotests.py: VM: add own __enter__ method
  iotests/222: fix pylint and mypy complains
  iotests/222: constantly use single quotes for strings
  iotests: move 222 to tests/image-fleecing
  iotests.py: hmp_qemu_io: support qdev
  iotests/image-fleecing: proper source device
  iotests/image-fleecing: rename tgt_node
  iotests/image-fleecing: prepare for adding new test-case
  iotests/image-fleecing: add test-case for copy-before-write filter

 qapi/block-core.json                        |  25 +-
 block/{backup-top.h => copy-before-write.h} |  25 +-
 include/block/block-copy.h                  |   6 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  31 +++
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 116 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          | 142 ++++++++---
 block/copy-before-write.c                   | 256 ++++++++++++++++++++
 hw/core/qdev-properties-system.c            |  43 +++-
 hw/core/qdev-properties.c                   |   6 +-
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 python/qemu/machine/machine.py              |  30 ++-
 tests/qemu-iotests/222                      | 159 ------------
 tests/qemu-iotests/222.out                  |  67 -----
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 tests/qemu-iotests/297                      |   2 +-
 tests/qemu-iotests/iotests.py               |   9 +-
 tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
 25 files changed, 889 insertions(+), 669 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


