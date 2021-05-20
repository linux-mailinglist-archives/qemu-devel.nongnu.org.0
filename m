Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E0B38B1AC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:25:45 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjcO-0001dt-4T
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZK-0005FM-Jh; Thu, 20 May 2021 10:22:35 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:56810 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZD-0005Wz-40; Thu, 20 May 2021 10:22:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSHb54057wOkGWP2aMuDnb3aA6r/cVeWhl8j8+KdY7eywjF73Feunv1BVe60PqDvRDGjm+WtAHg9gVA27lqszYb9OHBc3DSdWTf9jmYu3M/1RY5PflPyLlMN5s/rRu6fJJZjUQK0gclIPPIcTKvFf8AebE96hRjyR2UcPGtO0ekkLqu1/SgUC+s/73OLpRH9NfbeL329IFCU/nLLR12VhzIzsYWVnLkXBfbxfdLpcqiiRir8UwxnkVYYtcAZiQXMhg9JPOmmw39nueqfUf+IyTnULEMJ9+JvR47hgAAuoBiI3zcC7Rpy2dvMy3LiQlWsHmA65wHAWQQ7g1SZg1Ft0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYpPhm6I8cWrz4MQeUm2wrh6XvOM2Dn1U+FWEsV5J1A=;
 b=BZ2DX43bnzNieGTZxU6V/CkJuDAxmmt6Hz/1xds4H2p77qOHrTaw1fxNoGCcvH/rVPMd81b0/zK2S6R4GuR8rMc0ygrp0QKBpAaHA0loRnupkoEkYbd88hIP8efDeGCa5LOptcJ6WHqruFoapIWNpUunskCkpbcZ4DM69BC3/+OXimz3BvUH+d1SDgjb6Mfi62hH5GxVbDKz4ho5qvhr5noQILRiQrZ4AD4teTqZkj2y15QV7gcqW5ET62K0Yq4KZvNhE3eW9ki2VsroMx8Ex7T1Ei1EDJYZCH3fg79rsk9d3DD9Fpl6XNbXe50RsOx5DYyxhzj4t2oby2HQaoHGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYpPhm6I8cWrz4MQeUm2wrh6XvOM2Dn1U+FWEsV5J1A=;
 b=hGX+hxGJO/EvsUnmqBhAvt67LjVKRPFOVLSAZZjU8134UezUDC1EgoK7PXJvhtztnluZQveipFfElvyzroY5DEEuL7hBsretg5UiGis2yh3T0/jRt4rQ8Ae9o+HrfgXnZ1XPKVQ33EUmz79HrsqfR2wixjG7zWyz0bT5Ti0JQ0U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:22:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 00/33] block: publish backup-top filter
Date: Thu, 20 May 2021 17:21:32 +0300
Message-Id: <20210520142205.607501-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdf417f-28f4-4871-04d8-08d91b9aaeea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63094A4DCB5178EFA5538C89C12A9@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nd0RgLEjePlXivnWwOTre4CAnlNTfiqbp71vxxJwi7h/0Bh391/dM6unU9mOsZg84iwpJkQi18YyOVxk+tvq7AUs0NliRdAk7OxC4W5/zZBBEvhniZiLajV/z4lGfkJy7pWxbvdeN7M9+QcLc4uj2dN6RQKDfI3oXwVmGaB/UEIwjJwwcG1WbxekeC0iAQdhMzTS6B5jbZ+yUjo0u8bTAa+KiGiPoyBOF44Of+wMLevhhypWRImRZRA/bFfA5TR3MVyawJb2kP/tCkBPvek5nt/0gngEUDpFdidGIFRVjGoJERp2N6EGMb12TG+FFb73Bvv6MmT1/ksM4DDMmBZoJpIhJ302c+fYAWQmA5d2uAKtQimZPM6Cb46hX/Abw31IV0hGybsg9jRfLzjDMfCQSEtVDEnsX8JYdlR8XqVSxynfWyX7inZm0KXuHRv2cz5AKxQzK49cr4RgGErX9oW7nOJa3LbQqvahNGSKFdX3hv6yQLGPmMU6GCbszFVn8SeUwCAcBHrZP4PVcPgABxwF3LuDVspvfw/sW8brx0ahjIWRZQ5TzOsciPXZ6bv1IDC0RWb3NZlHz0gadp4gtVcnHU4OgT8vlTGDob6DgwblJg4FS3mHcag1vybOMQsEF3xo8kv/buwB0AXtNQydKXEFWFXA0WZuItN/tlMIpyMKR+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(136003)(366004)(376002)(6512007)(26005)(66556008)(107886003)(2616005)(66476007)(956004)(86362001)(6916009)(66946007)(6486002)(8936002)(8676002)(16526019)(186003)(4326008)(36756003)(478600001)(5660300002)(1076003)(6666004)(83380400001)(52116002)(2906002)(316002)(7416002)(6506007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUJCQ1RLQ2h5ZkZuV01NTnZRcExVNXhqUjRwK2dWT24rSXgwUmkrY0NJUlM1?=
 =?utf-8?B?ZEVOWU9ZOWIvYTdFS09XcnNhY0hZSXdBVWVOTWxRakR5UGZzV1gwNnVnQkdP?=
 =?utf-8?B?TkZydlJrK01sTkRMd0U3elN0VGdkRDVBKzRxcS8xaUZDV05ORm1NMWZTSzNw?=
 =?utf-8?B?UXZYbDl5UHVDQ1RBWXJOM3p3YnlkQW1EL2Z2dFhvSjZxMmdNVmNxQmdPdjRo?=
 =?utf-8?B?cEg4U3JuZDBjSkRWNTU5SmxUbm1WUGlBb0pRMU02dmtFZlhlNnlwazgyUys0?=
 =?utf-8?B?SG5qWGRGTGx0MmN6dnc0S25uYTRncGthTVM0RGNVb09IeVFGMlhGMkxtZkdh?=
 =?utf-8?B?VkZQWTAwR0ZmeFlOMmRRN2sxaHlpVCtjdEpNcjg5WHdoM0NGVituRFF1eHcr?=
 =?utf-8?B?UlRnakdmbFJ1aXRQVks0L3ZtSS9GNjZBYjhTMWswVzdyQTg2UW9rNUU2ZE80?=
 =?utf-8?B?UE15ekNXa1pQVUhsaGVDZkdSQzQ1bEhla2g2WUpRNzRLSzBqTHdtSFBSbmli?=
 =?utf-8?B?UlVyU0pWOGdvbzdVRWNGdE0yT2xUMXk2UEU3S1JsRXE3V244dW56UGs2aGdz?=
 =?utf-8?B?dGlRVlZmSHRYRkRnWU9rUWs4aGUrUzByTkdBSmZRSWQ2REU4ejhVSlhDTDFD?=
 =?utf-8?B?NnVpcEVTUDN0ckFLMUFXaEpkcnFySTNNN2FjMHVIQW92UnZKRHhhTFNjODk1?=
 =?utf-8?B?Wkg4UEUwUHNvTStodzh4ODNLcEY5ZUpJZ1VPeS9rY1l0WjFRMDFGVEQrZnJs?=
 =?utf-8?B?TTJSN0FBM1dFUi9ROXAxVkJSbmRqV1lzdHBodnRQV1pHT3JIelRrUVFPUFFq?=
 =?utf-8?B?TURaYjQwWndvR29YcXNNSnBOTU5hNjhZNFB5bVU0bzZTQjMvcHZCNnp1ek85?=
 =?utf-8?B?N0s5NEVZSENFRjlGN1V6N3FiL2tyZnE2a29vOGJ0WkVFTm5TYnRRSjRyd0pI?=
 =?utf-8?B?V2gyZmdkR0lCaEQ2RFdxSEpJU21HcDRTNTJRbThjczc1REhjNlRVL0NkSTc0?=
 =?utf-8?B?ZHBpNHRvcjhhWkMrdHY3Qjh2dWZodUJnRVNDN3pDajd2UjRCMDhIUzRpL3J6?=
 =?utf-8?B?MlVLZXp0YkE1VUtJRUVaTzAzZE51RndHOXJUUTlGUWxHK1U4NC9kVTEzZmpM?=
 =?utf-8?B?U3ZXYXNvSU9MN2Z2aDZObFJEZmxxNkpESEJwaDNLUEtDaWhHU2VielhoWDkz?=
 =?utf-8?B?RnhzRUtCZGN0WHBLTGYrellKNDQwcnBkQ3ova0JRUjNEdkhjeUdQMmN1OGg4?=
 =?utf-8?B?RDFVMnN5NWV6L0p1UVRnWUIvZUpvUE5hU2Ewdk5lbEpTZnBFVStBVlNhcFdr?=
 =?utf-8?B?bTdXVlo1cWdqVEtzYW1LNVNJanpMT0FQN1gwZXYwVEtTZ1dEUjFGR0lWUXIv?=
 =?utf-8?B?OUNNallQSWxCOHZDemNPZmQxcWJqbzU1K0M1R2dQNlliUHVMNEtwd1BxUUQ0?=
 =?utf-8?B?NHBUNERORG9NeXpHSzgrdjB0RzcvUlE3alk4dFN1aG9JWUw5VHZxZUplWEph?=
 =?utf-8?B?TzBjQ0pVOTI4TzdTMXYvcE4vaGRqZ3F0Znl4ZHRZc1pIK29UcHE4dm03TVo0?=
 =?utf-8?B?RDljUDNFMGczcUQ3MHNaQTErSEFtYlNCdnlPT21BRy9nV3ZQWC9GcnJITWpx?=
 =?utf-8?B?NXcvb3RBZmFDZFlrY0NkR3hYQjhyS0FCUmxBZ3Q0ZEg0bk5XTklqVHE1QXV6?=
 =?utf-8?B?ZVd5ekJ1cExLa24xeitQME03aSsxazMvcHFJZU9uZGdRNmZRNUtTREptOWwz?=
 =?utf-8?Q?5aJVViMAA1pV56Ic3EIt9t8leOk9LR7/Y/CM+tq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf417f-28f4-4871-04d8-08d91b9aaeea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:22.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCvkYsPfCLj2rMGfnbg5VxqwEYo+cBTiRkB2dMYVaN5qq9trtDN9w1TceOnbBv7ax0VnPzIxcM9k6IcKhPRZqDZ3oGLV78t0R47mh1Rl+bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Vladimir Sementsov-Ogievskiy (33):
  block: rename bdrv_replace_child to bdrv_replace_child_tran
  block: comment graph-modifying function not updating permissions
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block/backup: drop support for copy_range
  block-copy: always set BDRV_REQ_SERIALISING flag
  block/backup: move cluster size calculation to block-copy
  block/copy-before-write: relax permission requirements when no parents
  block/copy-before-write: drop extra bdrv_unref on failure path
  block/copy-before-write: use file child instead of backing
  block/copy-before-write: bdrv_cbw_append(): replace child at last
  block/copy-before-write: introduce cbw_init()
  block/copy-before-write: cbw_init(): rename variables
  block/copy-before-write: cbw_init(): use file child after attaching
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
 block/{backup-top.h => copy-before-write.h} |  26 +-
 include/block/block-copy.h                  |   4 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  52 +++-
 block/backup-top.c                          | 253 ------------------
 block/backup.c                              | 115 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          |  98 ++++++-
 block/copy-before-write.c                   | 268 ++++++++++++++++++++
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
 tests/qemu-iotests/tests/image-fleecing     | 192 ++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 ++++++++++
 25 files changed, 890 insertions(+), 660 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


