Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AB3F9EAA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:21:37 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgTm-00042M-DL
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgQy-0000q9-SA; Fri, 27 Aug 2021 14:18:32 -0400
Received: from mail-eopbgr150114.outbound.protection.outlook.com
 ([40.107.15.114]:15647 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgQv-0006Rv-5i; Fri, 27 Aug 2021 14:18:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjLEGqHz5thnKvB3TOBUUOsa2QNAI3UQNilwXIMExiX3qX26zOTe3IQBNlrnVPnJHBuruFkKGgl2zzmNtyZkR1tMkGx2/Tp9s4ulFbSnD1I3w8SV2M16pHvRU5gQpKf3KxyWN+KPSr+EirCBFIquhIJoTg7lGGy6dVkJbvJVLcm08Y1bjGYXa4NKgzEjSzbkmxiIfHozV1IBa933y4VRtX+BZD3kHpaW4z8OO2KfiwhgyBMM9RvOVa8IlyjDKWBa4Exz0fr+JiFJUgNm881whBcv/mwTnloAkBTxXAIKmsWT4IYpPIYu29HsAktxmeC4w7Vd2uSQVhRhpyRi2v86zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPM9UAe60GuzpLOy7UywMRiI3KZrnmAigWDM0SJtQFc=;
 b=ARf95ZgopmRtItPpUjcz/chW0YfhsibwO6rMNr2sfHvLnquTzHCW4/KzD5icYb72UqERSd0QapENdYuIUkxgv/rqqRxMQulVP7qzi/mTL7BH2fd639OY9LIPXG4QZavfT3R5N7cUcxNc6sLnGhNvLfhuRuygiHs55IBLFrpoFL7BKwCpO/poESO5qT5OGNeyAB/WAqdxJsbPTjSyAQC3+4GGcPpbV0k/dsq+eS5fTGOk48OYSI/9vHIniqvsl68ufZrABUcV3lD98c7ac5qp8pGr3Z4LjbwnI/0znRe38NEuc+MlH23JFnttJtnpU1BDJWbYidwc8gzTJ8GrX/ELHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPM9UAe60GuzpLOy7UywMRiI3KZrnmAigWDM0SJtQFc=;
 b=U3pQ+OQ0wZcf0CsXoFniL6dwJo7RRZWb7p6Yfirc/vZrgSx/40CiU0Y/fjQNX49FRDBMirHVXk3ZNrE67MZc4lSVGwXRvhncMnLOqwQYPvjiEcb+9LhctVm6UR/5zN8DrIHQafNpCoslqULSh5XRY16o0GEh/L6TxsTK6a9FZsY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 18:18:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 00/19] Make image fleecing more usable
Date: Fri, 27 Aug 2021 21:17:49 +0300
Message-Id: <20210827181808.311670-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c40e407-9858-4ff1-4b6b-08d969870ef8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870D34AB8CD16876C82464EC1C89@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jl4LEEksacgUzddUaH5cCf0tbu7MB+0voauik6aIQpj+mgzVs8nAUyMRGJ0WBLafy379k1ml2ptgNrVY+LVn3zzQKqDVD1s3k3Xe6I5Gvxl2CHFl9rSFsFOAvOCw8I7Yq8PKZiCw2Qr41EbXVgk0O1O+Eb2je5ye52GKuJYb4O8Ndcj7valbb4sHNJCUCzpTz+VqPbAijuxi1cZfze0jOZkRGCxPJ0beXasQIenpiviq1WJRohnz7vHWHdesu7m8QX5qmmYPluuV/NjLYg3bGCO2BI3o1rpCZpdJuaMnJbE94b5qc8tVHTJ10mXH1OR5eq8bRRlzwNIzam5HLTFi0l9UMOsq10axnCmzhfTUeGLY7hTiqjK40tUiqJ2fMa2PhIYSMRGpkkNcHJBzs2OGTkE4zDrGNbEM3plINamlWlDG3fXjZJjgvUT9qgF/xBx3iuGdlGqH8THQ9WnplvUgHTi+2/SHF36zf1hvUYD6/2W7ZD2mh7uW0D+/7SIt4GqA0CE0VIrrOjUKvZirdeYa61X8LJ8gzu2kAynaGzqP0akrfAxLPpjtiKnu/MkC38Bck45HJk85it7zkTSAo+IMkoR4LsD0DAOKexYd5sepOBFyXNBJjLEIpujchlP9LfN0A8eAfnqM9EqNlMMBNVqxNFBgnapzbz52H/PEZ97oJnpvIW4GTXWqXJUwJWDDHUYpRyvY8cBQr4Al/DY7/6oQzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(956004)(5660300002)(36756003)(8936002)(38350700002)(4326008)(6666004)(52116002)(8676002)(83380400001)(6916009)(66946007)(6512007)(6486002)(26005)(86362001)(66556008)(66476007)(186003)(2616005)(2906002)(316002)(1076003)(6506007)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ajf+WU62f0Gq9WUqGlK1RyJCE5Rl6YgXq+t3fsWWQ/pOXFcU/wvILhiFXCxP?=
 =?us-ascii?Q?+40UftLXx7MwXV+4lZDoABkiTLEVi6cxCrPL0Tf5ezS3jehI2920jqoo3fWr?=
 =?us-ascii?Q?Ur0Az2oQeFqs8YLX/bktKZtZVmdnXQ4o92l78opPh7OlEllKUP3FJSvmsK1A?=
 =?us-ascii?Q?orbeyvKA7u2Wt/CWLnbF3a735I21RoIgsmuGdnjhJDl2w6z/UxrvnprCbLa7?=
 =?us-ascii?Q?m4pMGqTOk4JXFyP6eDNVettH5rBztTac8fIXaj42N4aYjpJwGi1nOhEnGJlD?=
 =?us-ascii?Q?0ubOHayd6NAszAXpiBN+3VmYV5MlMaKdzMCyBUm6wPzrl55KTHAFNh2Bkqr6?=
 =?us-ascii?Q?rh/p+aChNmXsAy1fqWwvTv3AeBbi91TDxCSG5dmyhRIUYimI8pJpEa9d0qqt?=
 =?us-ascii?Q?FFdQTu+SYnd5h+QH2/l1BOwCaTRfdZml/D0AiHZJPWnefmf3CjGSmsLQ7up6?=
 =?us-ascii?Q?PcfR+lHMdmhafFwheGXVaO/xHviivHykW3S5OjF0bR8t8EPMqm8e0eLIb9Sd?=
 =?us-ascii?Q?JoId85ThM622v92u/QH+qqLVlAV7SP3Q/Dry46nGRIasxHHq0oqG9GS4N5gx?=
 =?us-ascii?Q?6q4cglFiePVutKJD5pDVdzcjYDZcRFtr/zpJmF516+/n/TzCgVeyY7yteWZn?=
 =?us-ascii?Q?tT51Dlf0ncMiiQHI0vN5vcudIf8B4yXojoEHuAk1bIjhVvLU1U1teiRnbowG?=
 =?us-ascii?Q?I6mQJwQ+SvySJ9Wi5/fgN7Wk2bsz0iwY2O7UCN4GflQs/8Egpgi1x49/Emv8?=
 =?us-ascii?Q?4LBYFCABrtsu/uRAOlBTlFTqG0LxYLCfWpK25X4l7lBb42sNSXyRBypjYhsU?=
 =?us-ascii?Q?V11IhO9yzHOOsDPqLUUZmWRGfGfa4dQ/b4AD7JUXXpzzG7hobyK6kwCg8YPP?=
 =?us-ascii?Q?c1RD9I44s6FtfJMFx/Qwxizm1+bpSFb5XCB8m5s1T/DjaDl9lQC2KO4L0ABq?=
 =?us-ascii?Q?dlGdk++HIYEuKSpWPUnooO6B7KtJiVZYbkKtoIIbzURTwcM3o+4JV2sVshbR?=
 =?us-ascii?Q?Zka93lAK3UNFBcRtXg55r5S09VvHm44nuFLJjgCtQ34kLsW3rPja/UwhYj7X?=
 =?us-ascii?Q?5J73e3W4y+d9kdNySLpBvzH2TPuy69hCMy4zvTeYJBcdLG7au/IZtEInB/Ss?=
 =?us-ascii?Q?TpOv2ebpZOc4GSCR8C/vCCr9LylV62+QgIzLoV8aDrVF4yn2CFX0HuEZ7SdK?=
 =?us-ascii?Q?Imb2nH+D7hZNSQUxgJqGFO4lZqZBmzvFR4GHLHDMFpRKcIALuEU5UIO5gNe5?=
 =?us-ascii?Q?+JRcqxUX0okaFPGjSNmb3oLlDY3V4IJ9fZk6XJRyyElkvGBbHDBGp+oakNzT?=
 =?us-ascii?Q?vtDpKTmbmS0u+ofyUBOTGnt/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c40e407-9858-4ff1-4b6b-08d969870ef8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:24.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T740gJuWw/uqmL2KM0ZGkFyKIx2+HKPUkQctHcmq8iBdo0rgx1kxoekVmZoUfAzAQcchocAxa1p4iIglV40zEc+oFaT7B5otecHue1Jt4Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.15.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

That continues "[PATCH RFC DRAFT 00/11] Make image fleecing more usable"
and supersedes "[PATCH v2 for-6.2 0/6] push backup with fleecing"

Supersedes: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Supersedes: <20210721140424.163701-1-vsementsov@virtuozzo.com>

There several improvements to fleecing scheme:

1. support bitmap in copy-before-write filter

2. introduce fleecing block driver, which opens the door for a lot of
   image fleecing improvements.
   See "block: introduce fleecing block driver" commit message for
   details.

3. support "push backup with fleecing" scheme, when backup job is a
   client of common fleecing scheme. That helps when writes to final
   backup target are slow and we don't want guest writes hang waiting
   for copy-before-write operations to final target.

Vladimir Sementsov-Ogievskiy (19):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block: introduce FleecingState class
  block: introduce fleecing block driver
  block/copy-before-write: support fleecing block driver
  block/block-copy: add write-unchanged mode
  block/copy-before-write: use write-unchanged in fleecing mode
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  block: blk_root(): return non-const pointer
  qapi: backup: add immutable-source parameter
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  39 ++-
 block/fleecing.h                            | 151 ++++++++++++
 include/block/block-copy.h                  |   4 +-
 include/block/block_int.h                   |   1 +
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  11 +
 include/sysemu/block-backend.h              |   2 +-
 block/backup.c                              |  61 ++++-
 block/block-backend.c                       |   2 +-
 block/block-copy.c                          | 157 +++++-------
 block/copy-before-write.c                   |  70 +++++-
 block/dirty-bitmap.c                        |  15 +-
 block/fleecing-drv.c                        | 260 ++++++++++++++++++++
 block/fleecing.c                            | 182 ++++++++++++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/replication.c                         |   2 +-
 block/reqlist.c                             |  84 +++++++
 blockdev.c                                  |   1 +
 util/hbitmap.c                              |  36 +++
 MAINTAINERS                                 |   7 +-
 block/meson.build                           |   3 +
 tests/qemu-iotests/iotests.py               |   4 +
 tests/qemu-iotests/tests/image-fleecing     | 178 +++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 221 ++++++++++++++++-
 25 files changed, 1420 insertions(+), 155 deletions(-)
 create mode 100644 block/fleecing.h
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/fleecing-drv.c
 create mode 100644 block/fleecing.c
 create mode 100644 block/reqlist.c

-- 
2.29.2


