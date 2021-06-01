Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A72397877
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:52:38 +0200 (CEST)
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7d6-0004J5-PA
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bP-0001II-Go; Tue, 01 Jun 2021 12:50:51 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bK-0001yq-Ac; Tue, 01 Jun 2021 12:50:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NP0lj1WAzhUorA1CAiWM3kDuYbXQ3XRey2pPRQaJ1G5wvID8H54sgiWExMm9fsO9t8r2g6pmO+4EljrjqRv6qiyK6tOcH+4/56GtaNhcofJJCo7/yOK+BzjfSPNmZPGrMs7LazYa0E25dloMuaD6kN6gQYBOj6al1Pq15777VwpP8p5aHPDRJ89DzF751gbscFf2LDih6vdY3+8Y3Wwb835lbtVXywF4NO2GI5OAdAP4Bt5Q647B27+umUWhQzgUb4ojhpMak0kqAivtCHJlE5isis+GnEN/d101PioeD7010D30R/sJOK7W8KY1v7R4PhsjY76RyclWrP/Vzpz2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xp/7O5glXkAkIA8WevvFeuBBrBAA7hcWSsg97Y5LC0=;
 b=aHIXQ/Eu7kRiMgNEkNVPBD4ZXC6Kvp4NFTcmn5XKLZuAWgyDyrJ3voqSNkjz9e1DYyt5u9H+ziM01zxWJuZTiHp4aW8hxCBQuUi2RAgUv3pUg2QGVCSoXp/92w9snR877H9ijDEqOJCQdc52o80e52BL8N37RzcCSEMQfwTJ/boRLxfdUYoi6ANPCd+7NzRfWHCCs29OgXeNx5/jziSAVLY7y0pw6dYq0kZlsnm8BsI64TF3VD9s26rzaQIHA1UYqx7ujmnvTZTA4DC6w0To1k1ocohhD2OEVC+gz/D2iRq01C/UqWjA2uGBiPEPt5JKwLfAM6x4U00hUu0GLel2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xp/7O5glXkAkIA8WevvFeuBBrBAA7hcWSsg97Y5LC0=;
 b=MJgPstsMujytmCBlKkiKSE3FcepPnDr/OoLAxU5dXQlg6IveSfaoauSKkh1pDwiQ4bnDgmEppBMskx7iyVIV9b7rgTJIocAeSyUhkZB0bP2uGA9YpPTReStVK9U1HAsP33GdHk/NUev3a/fgFcZ9J+05h1M818ZrpPP2xipeMEs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 00/35] block: publish backup-top filter
Date: Tue,  1 Jun 2021 19:49:51 +0300
Message-Id: <20210601165026.326877-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a38f88c3-3ea0-4842-553e-08d9251d63ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471342930184E6C9A015AD0C13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0acxILq9yKInQtDW8SMl4/ELcJuhH2YpBL0IErMVMNISkcrvRR0Thv9fa7kWe6Pij1sMR96Lv+UAnei6SMayYTvJY6rQF8qXlMkdD2CMaJq0mEZxWxXNUgB4XwKI3TC9s+dejn/FMm8brXr+pvxybHBAwBcd9PUxVlWiyB6rqRz6k29Nkxk431KUilaIZQTix64wkd5uCSVCwZ19aHO8/SOg+4D8WPpQDBlLkXx2ZCqCXx4wysv7mkgVh2xM7OZLWD/Z+KEP/jK3YWPdrKltpx0WkJ1bs/g6Sy0Z6YGM1pX40zNNIuXx7t0Bsvv+YeM8UAouhY9BYtTZOIswbdTedIWVmFhO8rHCM7eALJpCvvAmVtTBZcyh14Kbwk28yVYHgY4qMtiyX7jTdWFmqrZ6VKLRA8KejNJ+VMt276J76783Jy3LAO80ydiJwufvk8p59h5t3xNZiPtyXgO5rAMc4upp6uXnOJyWCWhS6TaD0PX+YWaNinyOSgZsnv7ajw8v9M29GbC/igQSl6rQkXGZbEFRYZJBQTRo60UxaxSX3YQEJhsXYnMjVH5lIPrEafl/34uVB1fw3moFJ71q4qIJb9e44wNh8WvvQ/R0qqmXhhJp/d9AhNyiPcA2FXJle2hJwgFpPVWHB0x7v/suAjA6KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVJVWDUrNUptZk1mcFdUeXkvRTloQUhvNGxhRzFHRk9OYkp6bzBiTzBqdDRM?=
 =?utf-8?B?VU1pOXZ0cVZnbDFpOVJ0ZDdGZnUyMHZXYXJhSUJxdW5yQWlTd05jR1RmMWtQ?=
 =?utf-8?B?b0xoQ0F5UVhCWU5XSkxtTHA2QkhpWjdKYlhPUFVReTF3d2RobkFMWStqNHhJ?=
 =?utf-8?B?Y3R4ejV1Z200V0RvM0NRNlZmZnJSemVHYmc5MzlGQ29CNXJUUmVMTk5SVUNJ?=
 =?utf-8?B?a1hZeERWbmRjbEJ3K3NZWml6bHplUnVlajM4ZW5tbUt2UExmTUJxK0pFUHVp?=
 =?utf-8?B?NWRod2VTcGx0OUY2NnRFRWkxaVQ0ancvSWVyd2w2MUw3OWY0YWZ6dFlDRXpy?=
 =?utf-8?B?Z3VmVWU3RmtuQlRaZTJtN3lKT0FKNXh4a2pzMCtSY0UvU3hqaEJCRXcrTHdB?=
 =?utf-8?B?V0s3OXRmUEd4Sm9mRUQrMGtPSTd3N3ppUjZkUmYwRmY5Z2ozNmt3emc0MTQx?=
 =?utf-8?B?SUl1dG41bG9HbU8xMkZJL2hIdm9GUGZuTlRaVmRqZ05YOS9yd3FHR2NvTldm?=
 =?utf-8?B?WDZ0QXhiRmh4elVDQlBwUm5aSzJhelYvdTZMb3A3czNEcFhxRjBVUW8rb1g1?=
 =?utf-8?B?OHZOUG9IY3hnbEpqalVWdHBhckdXR0QwZXl0bXlFVXNRWGIyK25USFdZOGJ2?=
 =?utf-8?B?Uzc3eGFvVTlVbHNyNlIwdmdkZjFHa0dKVDFlK2h4VUdoOFBXNFd1SEMvSCtj?=
 =?utf-8?B?dC9zT0hQNHBkcDFibGp5Si9ETkVQbG5UQXNUVzU3clpTT1I2VlJWREZHOG9r?=
 =?utf-8?B?TEpzTkR6Z3JnZDJaTWpiZyt0a21BQnFmdXlBV0ZDSS9Uam9Ed0F3dXFJVXUz?=
 =?utf-8?B?Wm81SGNjTUE1TkFjN1dqb1NocC9GSzk1QVc2TWFTeitaZ0llcUZVNG43N0FM?=
 =?utf-8?B?amlKOVZwNWl2T2xwSytuRHdSWk95VFBqQW9hMDVCK1V0N0pWWHE3RUFySFVY?=
 =?utf-8?B?UUEwQlE2SzVsbUZpWEhiTHBPZEJ4QkhETmhNNHdGOWRNZVBWdlAvT2NvUEQr?=
 =?utf-8?B?VDdjOGlNd0swSmxUQnVRVXJiL2NqM05lNHp0bGdPWEpvaklkQ0xKTnZUSzBo?=
 =?utf-8?B?YzIyUDFkTkIyYkZxWEpQYXBraENYUkFXRUtLVkZ1VWQxVUp2REFTSVlRRmtv?=
 =?utf-8?B?cXNBUDQxUnZrbnR0VUtzTkQ4WXlFYnBoSkFjNGJVNEZNZVRyUEpLQnNtbU9S?=
 =?utf-8?B?OWw2bWFWN2pYeVkvQU12L2F6NUJBamtuc3FmRE1ZMzZvQnBGMCtyY09zQUYz?=
 =?utf-8?B?aDNKRUI1Yy8rVnpySXFCQzlzUVN3MzR1VWVtNlVyTGduRHNlWDJMQmJtNEJ2?=
 =?utf-8?B?QSt6ZUN2Kzl6MjJvRXo5S0l4cTRTdUVKRjNLNGFpOUNJcVhUZVdXVXc0cENL?=
 =?utf-8?B?NklYYm50bDFLcXdJUEVHMkticWM1VVRmWU1uVG5ZV1FraWpFWXRueU5xT0Zt?=
 =?utf-8?B?bm1jWk93ZURVMUlOd0M5MFdTRWVpTnhNa09CTmE4NHFEeUhINFB0d1ZOWTNX?=
 =?utf-8?B?N2JTam1pVWFHQzJab2pIYnJCTSs1K1ZTQXhOeHc4R3FwYythRDdEZVBaN0xi?=
 =?utf-8?B?d0J2Skt5WFBMKzNBd21ualRHcFpSSWdaLzJOU3F0NzhKY1F1U3RFWGM1MFhN?=
 =?utf-8?B?Tk45L2RMUEp0WEkwZHA3QVNBckgzV0xlMmk2b2o0YUx1MEZpcENFbVlhbVcy?=
 =?utf-8?B?TDY4SVRVeGNGb1dYM1ArcTFlTkE4ZW1TaXFwTG8xZjRiMzNyMzFyVkhYWE1x?=
 =?utf-8?Q?1gzmuwfVBq7Ne86Iw6hf7iXtnz0lMXfIl7KUHbr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38f88c3-3ea0-4842-553e-08d9251d63ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:41.2251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP/AMcFyzJbx9Y2o63MNe2r2vih28w9bN3jYYX7RrHYf9oYe+ldB7znjBNs4NjsftpvNMPguW/flCu5L9O1yTFXQby8+EF6cBWhu5+NRos8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

So, patches without r-b: 9, 10, 19, 20

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
 block.c                                     |  52 +++-
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 116 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          | 148 ++++++++---
 block/copy-before-write.c                   | 256 ++++++++++++++++++++
 hw/core/qdev-properties-system.c            |  43 +++-
 hw/core/qdev-properties.c                   |   6 +-
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 python/qemu/machine.py                      |  30 ++-
 tests/qemu-iotests/222                      | 159 ------------
 tests/qemu-iotests/222.out                  |  67 -----
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 tests/qemu-iotests/297                      |   2 +-
 tests/qemu-iotests/iotests.py               |   9 +-
 tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
 25 files changed, 910 insertions(+), 680 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


