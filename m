Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9B3F59F2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS01-0005dU-4f
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRxw-0002Nf-QH; Tue, 24 Aug 2021 04:39:30 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:56386 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRxq-0007HX-B6; Tue, 24 Aug 2021 04:39:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h70eZJm91hSNIjY93/bQCGaLW7wD0KFi2tSYBK3brdaly72yukdvegYYmejbbVi1qZitYP2+ZAJjAU3NdjFWDeD4Noem5I5M4PqEUBeVpjH5Nl8qQyiKVjzGi/Xuw2px6w9enxBL1pmPM6s3moNfzitctHNXn5NlW5nANtADoKN11DTAi4DiX8jaJhDQd6GKfkLx0LU51GW7Vzxn+VNJpF2pZJg0MOnLcyTsquYRI6tDQZZFu7EHVRdP8P81LLRtewlPfFo71y3PMm7mUt8d9MJ5pftR3ip1dPk86clCipPLIGCEUbQdgJDxxIfxXt63Hs+QVqUrQq1zG6UiQUmiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ/hGq2rUPzsY/I9C4q6nMFoPwVLeU+pysWgMrayteE=;
 b=UR52bMRk3vcFAnhEEDBRBNgTepMg8AFvHNhQOXB1iSKtC5HaG6HrwfVIRJKLV8WenkqzbxAZXrYnIuMePL+MLIfqYIY3uTcgYnUeaq0MGPEYSKYIbGOQlk2g5XE1/aaXtPuYPTCIl8XSPU3XM2a9mw+bNYcaLYA97xtoNNweNqhi3czkuPS5Iz5nOWGPeL66rZjmZjZxS14Ko2hEBT3GZYhTVHr8UKCUUCX8ceF/iP2/phy9ixqDGKl9TwtL418bnQimlMhTlsjkqYy6Vem7FvSxSW1SL0QrkfVRQr/C2SS34EWTtNn76hi3FixXegrTYd4Cn5r8XL9W43rHBApk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ/hGq2rUPzsY/I9C4q6nMFoPwVLeU+pysWgMrayteE=;
 b=DtPxVVILYHH1QddakYs4nVBDt9TsHUzjJqzZctCafxtAVOVXuZI+HKcS9Wn7m7A64YJGOyop+b9hQIkIpEMycZzJYugZO1TDDq78vo7YV6joIhvDN32bNWlbXnGvkoUPrBmVkgY823om4u0H4iowh3kjnUaYLCqmgYR8b2u/xKs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 00/34] block: publish backup-top filter
Date: Tue, 24 Aug 2021 11:38:22 +0300
Message-Id: <20210824083856.17408-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4e00b0f-86eb-4f2e-0fdf-08d966daa89b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533B78359DF03B0882A2221C1C59@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4i0X/yAGkJN7jdBAuwxBPOOKSnDNjWgQI5WK0A8v/hU+WwfP4GKxrT9zfRojPDnWi499gV6+t3FnLXOpCaltN+gD2Mpu4j8fOUmphsRgL0JGMjH8OAvow1KBXYxioZDMaFE4Z8o+VxC3ObFwP2jODstk6HwNDyHI/mkGRkROUWBQkHfCEmGzRHmv2No8nRkHioekdxqQ1N+UYafDU+5WIHR8NgfFsKUdCohUTdJjnv8iVDg2yfqkLZ/H9LoL0PyHhn5+7kTbQnm4Fkyv9uIULJL3ZpQP5TSxh7LjP7QKdGzzITNQu2JLaCVaNUW+iMi1Yv3wmKSD+8MzFJBi20NG/D6OLbVUAsVAC2/MtehGQ95LIx/3bXXyrPXHMMR/AirgSjpdBCKr6cAR9WXfk0D+kHAyElRH9uuSkRiTyOZ0QCkwa7jItbnCls+kA9n82QP4EHbz1ys60XlQYDXAbgKSuwIgPbrb378UO9lMt9GPRsLQOSmct8jXCICKGd6HbnUdRmmDUM0PPrSRTzSwJsVfeg4iWwf6HgreGM+oc7a0DaasUdH3eyZb1i73JUiRhkYNZhD38S10ONoyE9zJ6SdKY9S8FJE+V5Fu8dVK1PJfuZFdOMNfdgWu8WXJ7fOqVFy8i3V1X5RLmOQGwMBGRfHxUn8O2P3zjJawevEW5dIXGMFRPNtYNjBIWwkJa+LqIvWL+UAEhhmn+0HWBuCQ7MW8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(316002)(83380400001)(86362001)(36756003)(4326008)(6512007)(186003)(6486002)(478600001)(1076003)(6666004)(6506007)(26005)(38100700002)(38350700002)(7416002)(52116002)(6916009)(2616005)(8676002)(66476007)(2906002)(5660300002)(66556008)(956004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3l6Nmw3aG9wK1M2UXRDRVlyVi9uOVhHSXFKNkxGcWxyenAyUllYQUszNTI5?=
 =?utf-8?B?NktSY3B5MkVwWEFEaGpEWlI3ck9kMlJRUWpmUC9KNGFhdXpMT3c2V28rQkpz?=
 =?utf-8?B?L21qTUpDRStjdXlsTkZSbWxBbDJuZ3cydlBWdWN1VFR3anNQMHpxbnlOV2k0?=
 =?utf-8?B?S2p4YnZtVDAybWxVQWhoUnU0TXN2NHRUelRzMEY4VnVMZEpNb1B2TzV0Q2dS?=
 =?utf-8?B?bjF6b1llVFpFUys1K1l5SUVKY1Bnc3grakJHUWFiRzdSK255S0tTS1ViNzhI?=
 =?utf-8?B?ems3SkQ4bmh3eThDTGhpVEpudFk5MUJaeUpvdTVET1JIc2NhMERRWmFwWEx1?=
 =?utf-8?B?empEeFY0b1VNVTJydUlGT2liMEIzcXpQbUVzYklnNmM4N3lLczZ6VGttd0wx?=
 =?utf-8?B?anBSQ2JRZ2ZUbTN2YUp2YzB3Y0l6Wk5ET21uSlF0bE8vbmdZbjBjak9qUVVq?=
 =?utf-8?B?QUVFZU9aL1g4VFhsN1BnWFhuMDdlWEtnY1k1eEtUZzljL0g2SHMwTTUxR3Av?=
 =?utf-8?B?WThtalA1bUZQa1dXd1NZdzYzVklGR2IxcG1SVk5zRW50Z0RVeDJQSnB0OFZO?=
 =?utf-8?B?T3BrVGVFcFBYWjJyS1F3YjZabnJZVC9lT2hUR29jdUdaNmtyTkRjUmROTjhz?=
 =?utf-8?B?cFhmUFlPdm9xZGpPa0p2Rkg3Rk9SSXJvN3R2dm9HQVMrek5ydkZyalpIRXR6?=
 =?utf-8?B?NllGZC9nb0psQTkzZEcrdXdHbXFEQ3ZrMnN2MU1zTGdlVFcxQkV4RTRJQ3Zs?=
 =?utf-8?B?VG03RkFxTjd2cVRlRng0aDhqb01Iek43ZzFodGc2UmQrZzdUK0VPOVR1OXlS?=
 =?utf-8?B?ZUtibHBoSVJsQ3ovK1kxcExxSVZ6QlpXMFE2KzJLK0dBLzhsdkhQZUlHUE8w?=
 =?utf-8?B?UU54YWJpTldSQzZzaTZaaUVQY0hmbGppdzIxMno1V2dGNkNLeTlERGNiNE5B?=
 =?utf-8?B?S05mb0t5MEZ1MyswR3hIWFdVMnBHc2ZoTkRrWmpzamkrZEVLODVsRE5uakw1?=
 =?utf-8?B?ODRVL2RKL3RUYjRQTHVCOGF5ektqakNuTmg4b1dTYnptYU9IeGszNHZUWm83?=
 =?utf-8?B?V3ladTlmQ1Z1U005b3VlZk16Tks3OUlZMHlYdUlKd0t2bGJUQVVyTHpZMzJh?=
 =?utf-8?B?MjVVNklaY2ROWmtkQkFqVUVKWnM1bmY0VW1QSDhhSVkrWWYvYmNoOUJVT2w5?=
 =?utf-8?B?Slk5c0ZwcFpPN1BDTi96UHVXYVVKMVRsOHlxNVoyRVpoUlBkZnV0TVpxdWtm?=
 =?utf-8?B?bVlBRll4dFRFZHYxYXAwazhCZU5CeER4VEs3VjRjR0psZ1R2ZTMyTTRkRjUv?=
 =?utf-8?B?Zm5qd0lIU1EvcTYxVmdwSWxVeXlWK1BEVVlZcmFqQXRIVmgrdW1OcUJvUy8v?=
 =?utf-8?B?QVE5M3JmemlMT3pDQTkzNUZTNld3TnNaSGVIQlNFaFJaNENZeEJ1eStjYmI0?=
 =?utf-8?B?eTAvdVNaMUJBY2NYUEp0U05YMjd2U1c4MHUrZk5ncjIrOVEwUXpQK0hqdGpJ?=
 =?utf-8?B?QXE5V2UxUUk1b2h5VVArN1FoSjRLV2tKcld1VzdJWTVMM2E4b21pWjRWcWI5?=
 =?utf-8?B?bG9UcUlwTDNTWkdNY2pBTWRNdGdPVUFkaTE5V0FUc2w5VW4xVi84cXlwZnN0?=
 =?utf-8?B?U1Z2T2dybEJWK0szOVRBUU1yZHZFbnlOWEwzYVFaS1JSelF2SmJlTWVvTWsx?=
 =?utf-8?B?bkpoeFRPSUxmNmhUWDVvcXNmMjJ4VXhIZUN0Z0NFMWtWaWlUMUlZOHZSVGJR?=
 =?utf-8?Q?VMEWmBDBxfrxb12TVUQ+7FUCbpkM0AxHXNqo/F4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e00b0f-86eb-4f2e-0fdf-08d966daa89b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:16.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKQHXxAKC1qbxiJkPtWE4fFXAMu9NlBJWuvW9wJv2zsC3opt7OuYqOGevEC7kF5X+EFFG8O3lTGg2SuVme2ARpIhVwu7rYK3P7exBK0WC4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

v8:

06: add Hanna's r-b
07: keep is_fleecing detection in _new() function
08,17,18: add Hanna's r-b
19: wording, s/6.1/6.2/, add Markus's a-b
25: new
29: add John's r-b
34: new

Patches without r-b: 07, 25, 34

Vladimir Sementsov-Ogievskiy (34):
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
  python:QEMUMachine: template typing for self returning methods
  iotests/222: fix pylint and mypy complains
  iotests/222: constantly use single quotes for strings
  iotests: move 222 to tests/image-fleecing
  iotests.py: hmp_qemu_io: support qdev
  iotests/image-fleecing: proper source device
  iotests/image-fleecing: rename tgt_node
  iotests/image-fleecing: prepare for adding new test-case
  iotests/image-fleecing: add test-case for copy-before-write filter
  block/block-copy: block_copy_state_new(): drop extra arguments

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
 python/qemu/machine/machine.py              |  40 +--
 tests/qemu-iotests/222                      | 159 ------------
 tests/qemu-iotests/222.out                  |  67 -----
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 tests/qemu-iotests/297                      |   2 +-
 tests/qemu-iotests/iotests.py               |   5 +-
 tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
 25 files changed, 885 insertions(+), 672 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


