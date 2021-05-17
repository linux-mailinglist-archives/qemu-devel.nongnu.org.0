Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D83824D9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:56:03 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXAY-00036V-Mf
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzj-00033s-W9; Mon, 17 May 2021 02:44:52 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzg-0001jR-Hy; Mon, 17 May 2021 02:44:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnJlZUQ+tLrcUfGncKo9qdE7xlyp623dRQgU+0GmX23Yavbj9GWA5E9EL0x+iG/0g0vh2Hx/r17GII1Ao7BMSzIxG5bDbs+L2a0RAYawc9Ilo/JYzWX7nno43qxIsOzmoxJKrTAlcbtrDzokxThlVSydE1y4qlEXkt992MrZ2bNA2UOtd3roZcDzlAGjn4b+Syp+DfM5M/zAvjh/wQFY4XJHQfv0evO+H4xkZkylpAzYfSA/JKuXSOofiO9vM3lROs5VvJWymJv8HtPt1qBe4zeb1XYr5/HA1uJnsAV50Mmp1/bIaDM+Wx2OJ+NJfr+3o5+YsBid1btaBqtHw8zCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1B0BUUqGiZHLsUnEtAzP5QCX4ficOeRlAHZ3GOYGDg=;
 b=SNra96o5p57iDdAKxFQ7l3dTf4E9L5H4jW7fptQCZPJxgFlcdE+SHLDDyUccS5xzA+4Vuso9vse8Kxo9tChzy3Kz9G4s2j+axhZ7omqVzruhH4LVOpuEpfRcS7V21zP3Ft/Busgi5jRkbYTPSsBW2nue57dGwjbQbE/7AWFxaXOA8uzhHgbrQda7jPD98zImgJR/P/l2ZYJ+9+IxqC0FjehVpOKMX+H5ZJHD0S/FQcs8INHTvqto5RHhL5bHF2cv854/XpkZbNWFMujW/9g1u9CAUJcFLQk5OthkNScfTmHS34nC1GBJnJnF1GrhSBRVZcpzvHOtU4JSd5aKT+AC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1B0BUUqGiZHLsUnEtAzP5QCX4ficOeRlAHZ3GOYGDg=;
 b=rspPzzwm2RABEfzTR93gF9QSdHNhI0t/uiR1CWA3cHJ/C8XVcjNcwGhWmr4SBMUnnfuJ0AMvhYz9RpwYblMmXV0OnMQOCTkydwNeNVY/DX36Hnt0r8khuFEAh5JvN8Oi94nx12DzB4AaTe+Q1hbdJ8wqz+x+pVHqw5YcOVIrm14=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 00/21] block: publish backup-top filter
Date: Mon, 17 May 2021 09:44:06 +0300
Message-Id: <20210517064428.16223-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfba23a2-93c7-4caf-5d10-08d918ff40e9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33822DEE87E4A9590522BF91C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCHCQO4c1gZ3mmZmtD7vDOgn2sa/jBJkEv6MIkTOk/IoK6QyibfUOeg10t+n7j1+5jxpg24rNpV8wWtEsgX38em+osypMRF2huPFPlO4KZW6yeLsCOpZ/XD0hH2nqgyzB7sFamE2adNkCtlbO0OKGUC2OeAuYk/GqRC2bRCejHGFyzqRqz9UpizYg6oBYZefis+BoqMxxwdLxhO/sQWwaW7fZxwFYQxfivuDU1Yod40veeBgSgwv4stTz/Ushw3PDkBukvEQX6ch7vuT7vzGBV5W1y0Lw/j0D2HEykrVHkOBS5HVsGifIII4SGioJ6EuM+r5ge1L1YrUY+ML2CNZw+myiJRsx2g4BVY9tbzlW4oVD5dbxJ6Awcjror75H/ems4dgWCGM6PaAD4PtrvtJGfwuOtnwgfKJyf/r0XWuNEhOlCcU+ssUidlXhU72ObPL+6QUHxNJRQsYhAqaRnGzfJCiKkXgoCPKMu/UjqN+NuvcUNz7J8KtK/xum5mbTwYPymlQPDwWGMYybG4obFvz3oh/4l2q2+e+4kb5t+9CrHxytIYImZMCcmkznkM4U6vs+g1ettwSYdbhAcOOIKZSa7h2r2Xf4XBUYwmc09NEdjxEsoC1i561K06IkifIx7v+JXh93mLignHyQrx7JuqoNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEltbWk1a1FTb0dJWDlISFQwekxNZ3hqZThHTGlicVdSb1V2NWpXenB2dDJ3?=
 =?utf-8?B?OUplMlJUODdzRnBuVHMweU5MZCtKUUsxZTZ6WFpXZjBmTmtMSWZTUU81ajB3?=
 =?utf-8?B?SmVkemFHMzg0dmJQVE5nYWFDUkpPeXpSRnZsSDc1QTB6aEE0MmM2MlZEL1Rh?=
 =?utf-8?B?ZjZxTmFrV3pnU21kUVFWbVgzc3c3LzdjMThIdFFHRGNDbDgyOGhyV3JXMjVH?=
 =?utf-8?B?STVtdzBvUHBpd0VWeHF2QytGLzRUWC9wVkQ4cHJBaTJNY0FyZkRacGI5ZWQ1?=
 =?utf-8?B?aFlVamZIVTg2NHkvK0dlMS9OQWlIM3V1akF3dk1DV0JFQU1BOHVPRUIyK3c2?=
 =?utf-8?B?RlAxeElQSDN3TE1nU2t2MTlhMGM1ekRkZGtMTFloTGt0cEZZcFBCc3B4N1dO?=
 =?utf-8?B?eUtIMm82c2FHZXlxSWUyRk4yaGcyN2I2L3ZHUlNncXZ5WFF2azFocFRuVkpL?=
 =?utf-8?B?d2hlTWFHUTZJU2VXQ1ExdE9MSFpUMExFUnNRNTArMEVDc3drNjdYdmpaTkha?=
 =?utf-8?B?cHZhSlRzWCt5Wk55RCtCendZblR2MlFWcXNXZnJTVm9FMnF3MWVHVVZSc282?=
 =?utf-8?B?LzdUZkIxTlVlejZqQkx1MWg0TEd4cnlrRnJwOGxvTWw3Ynk4RktDc0pUUGta?=
 =?utf-8?B?a05mdEc0Y0FlUG9NNnY2OVlsVXRDWGNxRWFpdHZMN2greW5Fc0pYVnJDU2hV?=
 =?utf-8?B?dG1LbDMxRG1FQkhwdjFIcUtDV2RQdmxkbGZoeUdHWERneG5naVgvd1FuMjU0?=
 =?utf-8?B?eEVOSGNFcE1yK3I4TzNNZDNSQTFBOFEySVFER2FqSUJUeFhad0N6ZGFXaFNu?=
 =?utf-8?B?bWpXREtObnJmWVVRclpQRnM0T1hBNDFIVmVhMU0ybWdXaTM5dVJNUEFscmVm?=
 =?utf-8?B?YS9NUkxRdEJ0SUVhNEI1YkFlL2ZNSHBZTVlLbXp1Q1ErQkJibWNkY3BZdTA1?=
 =?utf-8?B?YlBpUFJ3SWljNjVxTCtpSXNZemdoM2tvbk5rMk1VdU81OFB4UEJsQlVSWDFi?=
 =?utf-8?B?K3ZsQjlaa2RWMDNqbWhZaWZ4ZWQyU2x3VHdQSG0rTlJ6YjZBM0hKVlVYczNJ?=
 =?utf-8?B?R01JS2pzcEhLMjRBV3RBV2cxNXlyVkNJcjI2WFBUSUs0WjVWTUZHZ0IyaXZJ?=
 =?utf-8?B?eFZFaWh1TmhrY0NHaGx5em0wRlQ1T0taektmck14QWVaTGhyWUQwU1RiYk5E?=
 =?utf-8?B?WGZGVEluRFRtTUpKTjl6UGdjYnNZY2lqcnJMa0pxNXRJWGtlR25xVXhxdjBx?=
 =?utf-8?B?elNSeFgvVkltYVB1QTFzQkh2MWVWNWVGaUEvcWNla0o5YTZCeU12REs4S1Bu?=
 =?utf-8?B?WEI1QlliWW1KaVY3Q1Y2dXVpUU5Sa3NYQVdONVlxdWsxM0dTeGQ2c21BclVE?=
 =?utf-8?B?dk9DNElEMnZoVUttYXZUWGUySEh5TDhxbE1ZMXdMdHE5QTFvdkREMVR5ME9B?=
 =?utf-8?B?YjhCWDJvRGtrRlp5VWNoeTJoWDVoR1BsU0ZvTmk3TlZDbTZmeTdTN0lhQ3JC?=
 =?utf-8?B?a0pqSjlHbTZ4Y3A1ajNlYlRRSTNSdGVTOGFUTngrWWpPa0xNODVGd081Q2xo?=
 =?utf-8?B?SC9ranJGb1lQbFBId1BXeWo2NkFlbnhybmFFT09ndHU2M21HSEVjVEpaMjJi?=
 =?utf-8?B?K0hGSlpZeDhpbmxyaTAwYURLTm5Vd1pqZi9iMTFNaFJvQ3IxV0pLNkpmOS94?=
 =?utf-8?B?K0pMald2bUdNYU9vUDVZcW1mU0JIczQwbDdBM2QwejNENXJjeXFhU3lpS0JZ?=
 =?utf-8?Q?rJ9doow7JbnsLA6acjmrUEVTnGZyw/RKWDKNJv7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfba23a2-93c7-4caf-5d10-08d918ff40e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:43.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNf6YEwK8gIVmBulJIVAmDc5ur0oGq9GjGBuoEoILu/+KRRDW5rWUir3RdTlz8jiHt9nGpbok6E8zXmPPUYcjVqLEn+n5ToDBJHEqogZxx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
root node (patches 01-04), rename backup-top to copy-before-write, do
other preparations for publishing the filter, and finally publish it,
add qapi interface and test new fleecing scheme in 222.

Vladimir Sementsov-Ogievskiy (21):
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block/backup: drop support for copy_range
  block-copy: always set BDRV_REQ_SERIALISING flag
  block/backup: stricter backup_calculate_cluster_size()
  block/backup: move cluster size calculation to block-copy
  block/copy-before-write: relax permission requirements when no parents
  block/copy-before-write: use file child instead of backing
  block/copy-before-write: bdrv_cbw_append(): replace child at last
  block/copy-before-write: introduce cbw_init()
  block/copy-before-write: cbw_init(): rename variables
  block/copy-before-write: cbw_init(): use file child after attaching
  block/copy-before-write: cbw_init(): use options
  block/block-copy: switch to fully set bitmap by default
  block/block-copy: make setting progress optional
  block/copy-before-write: make public block driver
  qapi: publish copy-before-write filter
  itotests/222: add test-case for copy-before-write filter

 qapi/block-core.json                        |  22 +-
 block/{backup-top.h => copy-before-write.h} |  26 +-
 include/block/block-copy.h                  |   4 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  36 +++
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 115 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          |  95 +++++++-
 block/copy-before-write.c                   | 257 ++++++++++++++++++++
 hw/core/qdev-properties-system.c            |  30 ++-
 hw/core/qdev-properties.c                   |   6 +-
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 tests/qemu-iotests/222                      |  56 ++++-
 tests/qemu-iotests/222.out                  |  72 ++++++
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 20 files changed, 606 insertions(+), 423 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c

-- 
2.29.2


