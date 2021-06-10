Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98D3A2A4B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:35:03 +0200 (CEST)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIxi-0000KJ-R0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpf-0002ls-Ii; Thu, 10 Jun 2021 07:26:43 -0400
Received: from mail-am6eur05on2118.outbound.protection.outlook.com
 ([40.107.22.118]:26592 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpa-0004Ko-6u; Thu, 10 Jun 2021 07:26:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC3WFdHKyMuqzViSUZrTOEknU1H0Xz1jhSbZilADdKJsGbJnoIr7EbWOdvSGSS6i8aFAnmSCc+uUJhWFJ1vo0A2lWbplBPcbQm1SPjr/keGqkk6NVS8r4ZBr0z+NwMw6cnKT253Fm9uVI1WmJdo6aQwqajaVy2zj6UTtS5eYsXfIFb/kvW2LhesaO+ONBHQ4Cq2q5P5kWlcPhN/EOQwkAeK0TMKoXwIjyfSVU6rneiRXcgPM41UYv3BMP2pYose4LrcwjaeihImtIFWvgAyYuJf+ReFEexScq/a7l9lkgT6npcYCmFmfK+m+2ODOLGJFKwkE1ckh0qXyx/EaHHNHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19GXVxEAxIFHviZD+ylrxq7KwYdT/p4eFHBfEBetGf0=;
 b=dGIyFgIr+FxPFQV+UQGoK4BmTwwzYYTTfmTbTUq4H0qGQBFYnjHyGvFQmRMqRYjBt0O3VrT5pmZj60AOrjwmWpU9pzdCrA13T+1ejYq8TdGiZbiyiImUtfFyCxnPxbPepshFUXiASLOMWP7qUlv4EH+SJ3fpiwLRgL8kFwGsjkZl/vS2GMmR/ZCAIHfpDueAwdMCrqIYIb2+9DYHh4BDUb5kJQ+SO2MZ6eW+zIrR6MDba8rw4bQKHyrU/iWfoa/kWV0lMoSw/Q9rbyUARo+zHPiaGNM/wPDNRLL6OBUGlpciFJlUB9ahYFR1BjBXfDY81NGUbMJYC+NZ6DJLA4atpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19GXVxEAxIFHviZD+ylrxq7KwYdT/p4eFHBfEBetGf0=;
 b=t4JUkAF8o5hbYxm82WqlF1mrIjOpArqfa1D0YdEoJyMZkeFhT1AqIs6Y1CIxx9xmHMz78SNuhplxyjpHNQjyuUB7+txe99TTC3xpGVz6rGRrr94LY6oaS+EXaCUnSQCm94hpDSeFjGn+IQmk6cv03LZcjou8H/0gf8kZgfiCY3Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 00/35] block: publish backup-top filter
Date: Thu, 10 Jun 2021 14:25:43 +0300
Message-Id: <20210610112618.127378-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 182d48a9-7aff-4617-ca1c-08d92c029a2a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB39606E1D4CBC02A59352E13CC1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAPwnobe/b7fTmfUqeG8P+m54QaBDKsW+BAIRg8XzvKYIihoyLZcvNjfhac8Ozd8EO5wHPkqvmLmUluqhoAeaojgce3UIOiW5TrKTG++fV0ddASYlsiYECupXAZE7Qr19j+TV64ZZWjWa8nyZDvOsGZH6RUuN9F79XLbDNesHwd5mpIUqJjQcc7pT9PUVCRUwk2xRPYLpe2t6C+NpvA7GgP2lM0hwZb01RJykh8M5xgu3o+qJjw9OMjp7KAuRHo1koMtBF7YJOLe2Fk1Ub49/o8oLCwpA3f4vuHIwU6QwznNZ8H52WgfgzxxBgRMo7MQQvWMee/nveTkbPxwv/zu0GBCaBXobE4NKemxmsoDR8OVG3cgKFRqnsuZCua0BiDS6b6VPaZcJapwMeribZOuCF+3+bOBzkfH+btbhCZsualJCo6SxttecIY4MBNuqsj3VYfVdE9N+/qrV0OnRvidVyxALAM17DPjL5cS/2iBx8JgLUqL+dbcr04WCyYf2DAyGz57seCmfrEMcg+PQSZ3w5Q0xaCFecgmr3JTWao6bfFw8MuCjYlLUBkpHXRJ8ADSryNIRTV2E5N0khu3zkVp0JZflmfjhWBSo1Dy2T5YijK7rLkGkbQHKRPW2SgI2DJ5HFhfoIP5cOjKVM0xeLI+co7vdi3uK5fL6v0EvGy/+i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0p3cGNYZE1IY0IrMWhjWHBYU1RlSnVtR2J5c3pCQXFKQVpJZE5ubFU4VUts?=
 =?utf-8?B?ZDRDRWVZVkgwM2cvbkZUVSsyTWtZanlBVUNPVXFRakI2L2pLY2RxSiswcUJi?=
 =?utf-8?B?eEc5OHVoZEYxU1BMNlptY2o4a1dEaGtZQ0dSSzY5bzBHRjhKQnhvcmNNNmli?=
 =?utf-8?B?TkRBV1VxK05DZ2hZSlhITWRyYzRYMGJzSDc0RkI1NEdQZzl2czR0alBzckJZ?=
 =?utf-8?B?VEFabTZTS2JuRnRrWW5xTFVFVklONUh0dllveVhoRWhOZmYxazNnRmd4VUtz?=
 =?utf-8?B?N0N6ajRLcjVuTk9PZXJaalJNV25mbmcwdGV0QnBiVUZrU1oxSWZvbFprZ0VP?=
 =?utf-8?B?aFhSNjUrWVRpcFh1bUEwQ2lmeHpOUC9EdmVTUEkrM05acHFkSmhWL0FSSlUr?=
 =?utf-8?B?N1BsSWtkVGxyQ29NL0RNN1AwTm1zNjEzalNPRmR2WFRWQnF0ZjloZ203UDZF?=
 =?utf-8?B?WHh3ZGwwMkg4TzVhUjJHbklVOTdYRWJPTHNNUDgzM01JenFZbVpoTGlnTVNr?=
 =?utf-8?B?WVlXS040U2Z3Q1RGSTBFQXVIOExNMkJsdEtJV2tHNVp2Tkp3eVdoMXJXQ2do?=
 =?utf-8?B?M2hqekZKNVBXQno1cEdncDVPZDVVMmxia1lrQURLQjRsbGVMa0JPNUU1Q2tk?=
 =?utf-8?B?RUJkRkEzbllLTGViYnNjQkhZWmNEQjRERWxGWEt6eEJWYzAzVWpYTnByeVNU?=
 =?utf-8?B?UHFCMDhwbWtqVWs2V1BvNHVCR0pIUzlMTSsrVUlzdGV2dFBvVGxmREdTeC8x?=
 =?utf-8?B?YTlOdy9sTW5qSy9hWnh6NVhRUVlaazFwSHZOUE9SbmE2bnYzNm1sdDlHUlJy?=
 =?utf-8?B?MHZrK1p6eGNvRkRCdXlaT3JOVjM2cGF1WlVId1NVa2Z1TG94alBmaEt4ZERI?=
 =?utf-8?B?TERVUFVDZlN2bUFHUWlZN1hCSEpsU3kvT2JrL1pzY1IyaWRKb21FaWZIVkQy?=
 =?utf-8?B?RDY2WXpaTVh6UTNiTWsxN3RVTTRDd1FJZWwzaFJKOERCZnBDSUkreWRXK0Zv?=
 =?utf-8?B?bmE3SHlNcWFHMU92S1ZhRVR5cWhZQzdEQkw5ZFBkQWdOZCtCRmxMWVVnRGhn?=
 =?utf-8?B?TCthRUl3cS9Bdlk5MEJDenZ3VndFellERDEwTExPS0JPOGRtOCtvWmNodk8x?=
 =?utf-8?B?TG9uQi8wem8xWXVvb1lhWlZFV0xvRzhJR3pvd1Q0by9YL0F3MGxBRmN6R0ZJ?=
 =?utf-8?B?eVpuODRWTUZQUmhlSWo2eS9FL1VjVUdtY1dTenJBelpjVVY4eGV3eFFtV1ZJ?=
 =?utf-8?B?ZXprUXBRcnpMVVRKZFhCODR5dmRsTEw2ZVdnUDNDTkk4L203OThmdjNQUDZ5?=
 =?utf-8?B?TFpnOW1NK2dNZDViS0NMSHlYVU4rNlhVL2lkVGZXNzYrZDhMT2RFaUQ0aVJQ?=
 =?utf-8?B?Zk5CckExcktFRWNtdVM1dG84WDAxbENNSkdoN1NQRWs4UDdUWUtlSlA1QTFU?=
 =?utf-8?B?NWNNSWg2MlUycWJST1o5ZG1XVHluWE54cE16bkNQOXdaWGVLRUhUdmt4Q2Q1?=
 =?utf-8?B?RjY0Q01EcFZFRXhXRWNQMGNFcWNIWnBmRzd3THJMT29Ubmo3Wi9RNkhVYk5k?=
 =?utf-8?B?OEY1VTg2bE9KaERYbUlyZkxEbWJORk9vQ1pDUHI2NXo4Q3hVdG5pZlUzeG42?=
 =?utf-8?B?TUFUY0owL24vTWs2VHhSNmtDYTdoV3EvRU8rUVJpY2srYjNUUTdZaXR6dmhv?=
 =?utf-8?B?TE85ZUhCLzA0REdqRnlvaDhHdzNVMjhONG84U2FBNStSdUs4aGJYN3hPalo2?=
 =?utf-8?Q?KTFiLYkbrAwug2h0jDw/RBcjDhlIpR2hVYO3Crf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d48a9-7aff-4617-ca1c-08d92c029a2a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:33.9052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzk+Ul+j8fN892nBNXtkWTOH2+rVeRoX1wwsQ2j8klRsUUVkm1XWNWeP6jQBkfRmtvlnLk6ptnT5KHmOtwtE3/Xs6hqNRB71jXNCIfLRzx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

v5: rebase on master
25: fix pylint complain 'Unnecessary "else" after "return"' [John]
25-26: rebased on moved machine.py
       use Dict[str, object] typing instead of Dict[str, Any]  [John]
       add John's r-b, keep Max's r-b

Patches without r-b: 9, 10, 19, 20

v4: rebase on Kevin's block branch
v3: Keep x-perf.copy-range backup option.

So, additional function is added to set copy_range in block-copy after creation.
And if we do so, it's better to set "compress" option same way instead of handling
x-deprecated-compress option.

8: rebased on not yet remove @perf argument, keep r-b
11, 21, 23: small related rebase conflicts, keep r-b
9, 10, 19: new
20: drop x-deprecated-compress option, drop r-b
24: fix typo
34: fix qmp( , **{}) to qmp( , {})

also, add a lot of Max's r-bs, thanks!!!

v2:
01-02: new
03: don't bother with supporting empty child: we should never have such
    at this point
05: add comment
06: keep checking conflict with global
    add realized_set_allowed to qdev_prop_drive_iothread
07: improve cbw_cbw() name
    improve commit message
10: rebased on unchanged backup_calculate_cluster_size(). keep r-b  CHECK ME
12: new
13: drop extra bdrv_unref()
18: add compress local variable
    add comment about x-deprecated-compress
19: new, replacement for "[PATCH 17/21] block/block-copy: switch to fully set bitmap by default"
22: improve qapi documentation
23-33: test: a lot of refactoring

We have image fleecing scheme to export point-in-time state of active
disk (iotest 222):


                                      backup(sync=none)
                     ┌───────────────────────────────────────┐
                     ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                                                             ▲
┌────────────┐                                               │
│ guest blk  │ ──────────────────────────────────────────────┘
└────────────┘                        


Actually, backup job inserts a backup-top filter, so in detail it looks
like:

                                      backup(sync=none)
                     ┌───────────────────────────────────────┐
                     ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                     ▲                                       ▲
                     │ target                                │
                     │                                       │
┌────────────┐     ┌────────────────┐  backing               │
│ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
└────────────┘     └────────────────┘

And job does nothing here. In a new blockdev world user is intended to
operate on node level, and insert/remove filters by hand. Let's get rid
of job in the scheme:

┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                     ▲                                       ▲
                     │ target                                │
                     │                                       │
┌────────────┐     ┌────────────────┐  backing               │
│ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
└────────────┘     └────────────────┘


The series prepares qom-set to make possible inserting filters above
root node (patches 03-06), rename backup-top to copy-before-write, do
other preparations for publishing the filter, and finally publish it,
add qapi interface and test new fleecing scheme in 222 (first, some
good test refactoring).

Vladimir Sementsov-Ogievskiy (35):
  block: rename bdrv_replace_child to bdrv_replace_child_tran
  block: comment graph-modifying function not updating permissions
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

 qapi/block-core.json                        |  30 ++-
 block/{backup-top.h => copy-before-write.h} |  25 +-
 include/block/block-copy.h                  |   6 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  53 +++-
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 116 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          | 148 ++++++++---
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
 25 files changed, 911 insertions(+), 680 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


