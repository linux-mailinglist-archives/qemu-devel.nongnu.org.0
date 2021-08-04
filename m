Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0E3DFE36
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:41:23 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDOs-0007Ue-Fk
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMK-0004XU-Fw; Wed, 04 Aug 2021 05:38:44 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:22757 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMG-0005wf-DY; Wed, 04 Aug 2021 05:38:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NENAiuY3G6f8O9rJJtG1rZrtXGW6wF2rUDxRtwz+cvaKIgLKWzsoGxPv+KSqSkiewYfdcrC5OyghAGbE0nXPA1dPdTeLmCtc7tcoBflMxyCMl36//vP5RJ7B9Km0Q/L8eKpRZSzHwy4qUogMB0uhu2+BdbyaP3zYCpOBwDBlJ+rGMqWt9gqLBfkfh+9m51+nSyjz51er4yZjJg+xz0q6SevWl/2YtTLE2YSM1a7TBelVqpEAjv1U1LsBve+XgMM61uG8Ir/YA0fQQb7411L3d69CHbAg9bAm9FYyiXPE5Uc7kR7raigALFuxajp2DEqtJVvMS32YOmU9+4jCEkRBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqU+9i8DDJ6SdOFYeEgWpbOycC+oU/w/1AixIlXNF/w=;
 b=fHp/665nyOGeiXeP1szDB4pGUxAYnpKtz2oFtll7ZJGMoXkHIbOoR6165HhNNAD1p9zd6t8cQuTC7vxXlis7ZAI+ZyM2WFpuaJvHpgoJvacO6VEh3DVA7QGDeErW7bh7NmQ2snKLr+PnCfHlzmxx8fxrpEAH7peZYnOm4gjGL94SCjfGMf9dXnEZc6B1AeU7+M4A0a43sDIOtxXa0CenfHelyQH6Z5X9SJIEHS3pn6UOpp9XCjJF+3Lf7/qFLqP2cUWihH89nI14FR7nxnyvilt1xqudQlRC84I6z6zuUIEFA7pJ+OhhnD/zcQ7N7eakQKMs/hdqzX3yGNC4s1dXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqU+9i8DDJ6SdOFYeEgWpbOycC+oU/w/1AixIlXNF/w=;
 b=mA8CKSxGtSJVkLGoGuwMjyx9eBJAbUHLQrC+u5jz38h1RWnRo1TJE+AeGJtm8pa/X4x1JcRFKDGDMjm8HH9z2KVODGsGzYiOigxfY9Kj0u0XoSN0X1zfSAkWI4Y+uXEBdy8XA+d7LsmDToXxIBrysDyahB3KBWZseEgl+txS+mk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 09:38:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 00/33] block: publish backup-top filter
Date: Wed,  4 Aug 2021 12:37:40 +0300
Message-Id: <20210804093813.20688-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83b3d16f-d1f7-4b9e-d91f-08d9572ba11b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622DF9C55B2A8860848F027C1F19@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWYMEgTUJ6zbA6B1k/xB0I98LmEPLwhhpKDSqNYWAJzgGmf5vzHwKVtOiNPx/CrPF+4kQNxDTEOkIdBbXJp2ChEk6sRpnjQG60jpbjjMigjTGQ6nzaokaQMN3dcxi7d+Di/Fe4jtB2DElcW/0zuuyUeYSm+Ducpxdt51J4RvDgU6zFIDnFyeXgD7/ydUoM6HH9YAeJWVxfMT4kw0eKZvw9o00D6/YkaaiDgwZriCUYSXM0K7Vr7keANebqUVUepqtkmISburj5LwwG+BDidxMfKCycVLmnPn2rZ+lHBCIe1cuS00zBBQ7M1r3iCQrD7cR1xgxXusGEu2sCCrXPGWoZyEhqWM6EEHFDd1ZtvLrqyKzvcvkyKZBXMsfB52p5v9nBtCkbeVoh62LE1o76QIzKzQgFmM20iW8fIli+jPlr2fS1gBp+htcJacxhjjP7w17GVsis9gbrX8wDu179qmamAcQB5yStmLQ/Zy5eZUfXvqtUPgu7TVEmcP64qvtyL5ZSPSuGfRxew1tbvZhdteNumART1zBFKwwrPrw+ct5TzMUtd1YcbTWkPGwFfuFc0cUGwgofHWTiBMds9XQjt56ytpxtdfEUkGzzi4BYaAYBIUDjMTh2aulpb7mugHMS1ngdwEvl5HxFSGKu08q+GNR7zrve4xT27YdglbN3oN+/ao7kg7bEZNiSniVH8se9q3ZQyEZSvN7MG5fI0XuBE6cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(4326008)(1076003)(26005)(8936002)(8676002)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(7416002)(2616005)(6506007)(956004)(86362001)(186003)(36756003)(38350700002)(6512007)(52116002)(478600001)(38100700002)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHh5YXJYanJaK0o2VlduMEdueHdNM204ZFdWaDVNeXlLTXJEZmFVZ3BOdkpz?=
 =?utf-8?B?U3ZOTkFQM1JmdVJwZkdVZkdVV1haeUNldHJNSFpUSGNNL3NzVzB0MmhvRVdx?=
 =?utf-8?B?aTB0S3VYZ1hxTHRwNVJDeXd5Ukk3U0NqNklES0Q3RWg3eTdKc3FubkVXQkEr?=
 =?utf-8?B?Y3ZoczE0UTZteCtMOHBMN2lJSlBIVEhsNE44SklGTjMwM1hOZ29oSTh3R2Zm?=
 =?utf-8?B?eGUvdFh2cDFqcXJPeHZHbjJySUphRWZRbDlDcnNBOGFMSWRPbXd2dXpRZGYr?=
 =?utf-8?B?cnJjVmF1Vjlxd213K0JyNzYycGVzN0srSWtqcFBpNitnVThuc3NMNXFtK3Zt?=
 =?utf-8?B?dGxWaHRPNy9jQ0NvSmo3dUdqeFFDQjdsQ1JSWHlvb0Nyb0Z4T0tIWXExb0lK?=
 =?utf-8?B?VG4vZWJPRzFCSnY3Yi9JbXMrbWdUY2NmN01jTzBKNGQraEJBZTZGb08xeW5x?=
 =?utf-8?B?WE9GdUgraEFIa2FtR1RqeWx0N0ZIb0xrK2pUWkhxMStSb3RuUXZlY3M4MjEy?=
 =?utf-8?B?bjRUMUZBdGgzQXhiT1lYTjg4S3dYTDdHd2Z1RndHek94MHVTSDJ1dEZWWkl6?=
 =?utf-8?B?dXFubCtRSGx4NVhMV1J3NElTb1ZGd0NvcnFWYVQ2RDNMSFBUSjRFNytRV0l2?=
 =?utf-8?B?VS8ydSsxVDd1bnZ1TFdGOWhYY1dtMm4rQURRN3FJc3Z3WUt2Qk1ibmc2amE5?=
 =?utf-8?B?Nkc4SXErTzFWQXFuNlNoNDhSVXgyYmZyZ1dKOVJiZjU2a056alRCNGRUVjQz?=
 =?utf-8?B?VmNMa0ZzczVHZzdWRGNlbm5qSkZVU20yaHQ4MjNGSlE1Y2VZZzJsbnFUZXl1?=
 =?utf-8?B?UWlxeGNtMmpFMmZpRTFYSy9XdFdaeFArRi95cnhPTGFiZHFlU1RQTmhoQlFT?=
 =?utf-8?B?RWJjd2VOdHRCUGdzeFlZdjNkSFhtODBVTlpMSTY1Y3U0MGRlMThjYmdKbXZk?=
 =?utf-8?B?UWUyNXhqS1VsMlYxeS9KWFRiZEN0bUFRYisreFhOaStOYzNEL1pXVTdEVzFi?=
 =?utf-8?B?Sk4zcEFqbjV6YW5qbFROb3BkeWRBcGk1WFBSTVlBRkhPTEU0V0pSYTZGRDBo?=
 =?utf-8?B?bW1xYnlVM3NBbWgrOXRzTmZzb1BaVUVBbWpaMUR1dUtBVVZZaElxaXZCT1FJ?=
 =?utf-8?B?MDlXUFpqM3FWSlFzOHV0YXFiUDY3Y0pNenptbjVlZ0Q1aW9MZldYQmUwQ0lC?=
 =?utf-8?B?RUJHcnNTdXhMTWhnT3pONDZMRzlWZE56SytPRkNGNEluOUkxTEZvNkpnNC8w?=
 =?utf-8?B?L3lZd2xxaTlqL00ydUUyK2hwOUozaXVtYUZ4Q1RyTG9PZk14SU1LVUN5Y2w1?=
 =?utf-8?B?Z1EyZnlyVDBMQTJWRDhkTVU1dUcyV25TZGJQUWRraUg1N3NZWlFxT0Rsa2x0?=
 =?utf-8?B?SVZnM2xrelVNdHNRb2kxNmxkZ1Y3U0tHYXE3dWwzSzg2MkI4STNjeCs3NFhl?=
 =?utf-8?B?dElhbzFiN0hNdysvdWFnejNyc2VPQnF1TDM1Qkw4dXhTMEtVbUVMempUUU9Q?=
 =?utf-8?B?M2E1eUVQMkZEdDJ4b0N1a2RQQk5QOVVpcE1qTHZRTVY2OElydm1FeFdJN1Zp?=
 =?utf-8?B?T1ZrNlZSZlkzUllWZnZDbXpHS0hDRi8rSVFzaVhCUmQvcU1XNHN4Z0xqNEUr?=
 =?utf-8?B?a1JPdGVpcUd5NWpwVjBjZGE4UHVHaU1keVh3MGZKMmdJUzNDaHRuNlltTDB3?=
 =?utf-8?B?R3RraHhjRHVaYUo5bHY4K3hMQ2pkdWxPMTJXTzBSQlhpZU9Ca1V5N0ZKYmZX?=
 =?utf-8?Q?FynNslt4l5XUY72XasFkci2aYNxtB1QsTEhxt7/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b3d16f-d1f7-4b9e-d91f-08d9572ba11b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:35.0202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDAjh/g7Bb1r68RDZtGWJV6NZIenwvCQsySvCiodgioSwQZwbELmBM422lg4hKfGQh/CLnjwQK9dpEM5pLhMMrUZDzEsV1KSR6Tk7RTOrdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.7.101;
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

v7: small change: keep fleecing detection logic. I'm now implementing a
more effective way to do fleecing, that doesn't rely on backing chain
and on serializing requests. So, for this alternative way we'll not need
BDRV_REQ_SERIALISING flag. Let's keep automatic addition of this flag
when backing-based fleecing detected.
So, 06 is changed and renamed, 07 rebased on it.

Patches without r-b: 6, 7, 8, 17, 18

Vladimir Sementsov-Ogievskiy (33):
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block-copy: move detecting fleecing scheme to block-copy
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
 block/block-copy.c                          | 135 ++++++++---
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
 25 files changed, 882 insertions(+), 669 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


