Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747864142DE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:48:02 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwz2-0000xC-4g
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwx2-0008T4-Bu; Wed, 22 Sep 2021 03:45:56 -0400
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49088 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwwz-0002qn-Jo; Wed, 22 Sep 2021 03:45:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxPNrc9YYT3RIO6ewWPG+oVO4VAN0vizNz1Ep1zxoFMeGhMRM31kvwEsgcbollPjTwTdi/w5XanQhl4wWfZqYg7hmaKTAyy/yAozKarm05gis4pR8Nfma+HcBM1Y9XpBIjlsB7Ob1vc4led74f+RJRIdxcGHO0UGZcQxgxZZIr+IZGonti9mYtIhbj/T4s6lp1Je4g9JCIAa7zkgFXP+5d+Ryooz62Tc4FjO46q2tvJcF0AmOZ3Y92oBtUrWzbv55NECnV8l9DdcOF2khFj4Yk9XSjq+jIwb6zB80AAG5UszgvSdGilA/G0ruasUcALlYvTskmChVWk9xg9vDKVltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/lVmeByL5P2Me1I8iGpiNv5w9bb+/qNFPbJgNceWZRY=;
 b=TBzz4PQHrP6wyUKGu/FpyMIgE0Llw+Gx1cK6fxgxo3rhYLCgCmzMxWU7M4umPrzA6M5ZCMwLP7TcC/uqjAKOlzdAAkfGsdgtNF9RfCB6VCbV3KsUVkmEeH9YgMhnxdJptauuUMOLvOAmQ1yGULsoAGkhtwydndfB4LIEZwjhGAz1HpkifSbGk853P5QGO44O4wPMLCWk/92g2caox15vYLVuddtbjiml54PhdwbwDzgUQDUsxaAlCRqeprpmyEpt2o/DqMEAP5U27odaWOfcd/IbKUfbgpL7qwiJXOkj3u8NHN05jsZJhwm2FUY2bRkscwFUzNM0B80XDS3r8ES9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lVmeByL5P2Me1I8iGpiNv5w9bb+/qNFPbJgNceWZRY=;
 b=k1bOEXQ6GbMlx1s0Tgiv4FE2+rLBC1+dd7jIE+H4nT8VYMREsKoGtbpzUui9KbGYPLIO+A6Pm6g5OVCBVzhFV3mrqZNvtcojoWfT3pmVV8hPILJJKQeuL9UicNIOkL+2lKSDWtP+RS0ouHgOIurO9aDB3DA8geibDP2Sh7sPDL4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 07:45:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:45:49 +0000
Subject: Re: [PATCH v2 00/19] Make image fleecing more usable
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <87a2d181-55b2-6a23-5499-5d82b2144e33@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:45:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0042.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P189CA0042.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Wed, 22 Sep 2021 07:45:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7149159c-357a-40d8-1204-08d97d9cfefa
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34470EB71279394AF72B5BCBC1A29@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSG1WB4lYrT61y5OSYWuOVAzgh0i7V1bfCw2pOrqz/x7dlvbOzBq6muysmQTXpswhgu125LwWZ/NZ7Xmg9mZ5+ddtDsFBk2/rHXhm6RyPyzwYhHncJq/cmftMdjRxm0529r48nRl5DTJZtRPvFAgARjsZnIvSLVxsPXvd6c55m/bv4bTTxbtZ2rUrjgr/5ihVWNYjTeghm+/5UhEgvnJM6ayu6uU9v/GON8z6Mdc+KJS5r2Xnih/ZKqAef29+iJgvMP/Z2HclnAx6Lwu/xc2EkztpdDSplLRhqNNckXSqSrqG3XlRIollntLWBu2k+XwMyVr8Ia7JEsy4TBirBBgz/okVFE2ddXRTj+aaZ30G+JX0v0cwiBprE75BCBVk6LCEEk1r4K2LGIzTjgnyNNCH4NYNzU8ApuShFV2ilJa+uUcbWUv6i89/e5FQcD+Tf2R47JUv2nX5lA2C49awTnbXjMvZyzQBKBzUDPhA6ze4qedmr/Ryr8uICJdSbpYI+artph6rPVPoFrakSGtfzKL1l8OUq1flTCby2COIQ+lMLjMYpvqCeQNAwBk69QYin+6B+x45pUGewi4iWBfTMnUeWY/T/RElEAtwHGABxgf0AVZzFq6bG2V9Qd67k4hc6Un+uYP1JM3VhLKNsKCCLqaEGaOmr1h7rnQMZep05qjedW5FJV91rOnu9MmKRJrsX7rPPPFDZsWFkqttLQEA19UVaNkrmx8jiBagMos5hhLisVnAbB18kSmKbBKMuLbpkXwFoVdPL781L7gKq/v18EkVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66946007)(52116002)(83380400001)(86362001)(66556008)(66476007)(31696002)(8936002)(4326008)(8676002)(26005)(36756003)(6916009)(2906002)(38100700002)(31686004)(508600001)(2616005)(38350700002)(316002)(5660300002)(186003)(956004)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZjZzZJa2tSMlA1WHAzaThZdVEwSWZPNm0vM3V1Z3F6TFdkallic2VQT3RY?=
 =?utf-8?B?djdmVm5SZnhXdnF4UmVLcWVBUVhWdlg0RXpOMFV0MTd6bG5Cbzg0NnJGRjhQ?=
 =?utf-8?B?aTFscW00alNpblNFTFNMN0dwSzdJK0RXRlc0TXBGUlVWYlErTVlmUlkxNVB3?=
 =?utf-8?B?WC9qS2lVZnJKNVFUTnlHaHdGaG81MmNnSTB6ZUkvVm9vdFpMVGp5WHVzczBl?=
 =?utf-8?B?bG00ZHhQQXRtQmRPVGVaZGVONEQyMExBR0JLQ0RoZGw1bDVjWEtEamIyUmpK?=
 =?utf-8?B?QzVWaWgrVnVyckxwQ1krVk9xTjRadjRFRDNXTk5ZaUpCR3R5ckh4QTF2cVlH?=
 =?utf-8?B?eXkrbkt4b3UwaUhuYzBZYVBWang1ZXZVc2IwdzFEZHhBQUJZWlBva2RPb05L?=
 =?utf-8?B?dXhtekQ2MDlKa1dMNFdaeElmcEE3b2pqTnFTQis1NVNIdkxmQ0xuSUFWbVRx?=
 =?utf-8?B?a3FSandrWTRGTE90bFpYQU1KS3lqR1R6bDE3NFdGTlNadzQ0alBqVEZ5MXp3?=
 =?utf-8?B?YTBHdjlmcGpGMEYwcm5IcExzY0kvVi9nNzJ6Y1dESkhCbTVRZjlkdk1oVlI4?=
 =?utf-8?B?WFFVdkRBUUU3SjhVaVNEdkc4UURWd1VTNXdaS1YvbTIwd2UxeHJnNWF1b1c5?=
 =?utf-8?B?STZ3UWpBTmU0dGRFalZmZmcvSnlPMVVpMzBxWmJ2TFFKdElvTUdzV2Z6eFB5?=
 =?utf-8?B?UzQwYytjTWVDL3ZKR1JJTzZoRUVPVm85UEtLWkxsT1lvM2p0UVg3SnVyR21s?=
 =?utf-8?B?b0Y1RGFoNVhSSzJPU2RnTmNXVjNEb3NZakUwOTBzUGpqWFlJQ1FHSnRtWkYx?=
 =?utf-8?B?VnhKNWJHd3dJdWtkYzQ5eXBROVk1S2R1UE1FRUR4RFhzV3JiL2ptNW5zTVFz?=
 =?utf-8?B?bVdxSTgyRHhLdHF0Wm5lTnhnNzRrT0QzTXR2Q1V0cThTSnFkYUo2ZlN6a0NB?=
 =?utf-8?B?aEZuRENKQ1FXTmdQaU03MWowSGFNU3lNSk5mRkRGVkJJbzlMTFZaL0Rla25E?=
 =?utf-8?B?T1pyaDV1VEptZ3NaSDNmZFhuR2ErUUp5QW9jVDlDeWlyZjJpd3FqVGlJSUFP?=
 =?utf-8?B?TUNjTk1uR0xhR3M2WnlPVUVOeDBVSkZ0NXlxRXU5TE5qU1UrSHRSRjF0Zjhk?=
 =?utf-8?B?ZEJRK1grUjloeGtrdkxzTjlVVStJaWhhclpORHFjTm9ibHl4WDhWVnNtRmk5?=
 =?utf-8?B?S25ocHF5SmV6b3k3a2JOa3oxRXRKMHl4cXRjazlvT1Bwd0VsdGF1ak90MkFI?=
 =?utf-8?B?TStIbnRkS0U1NGdPMGhSeDEvRktGNXVHNFVaWlREaGVsSXMyU2p2eGFDeXB6?=
 =?utf-8?B?eFFwSnVXK3RyK3RtaHRkS3A4bFpDQmd3THJMeUdSTlJ1d3BuK0N1WFh1MUZO?=
 =?utf-8?B?Y3FYaUI3OXlTUXFzSkl0aWwvSnhyYlpjV3I5WlVkcUFFbU02SWtYY091SVNw?=
 =?utf-8?B?SlpVWnFIRzFJT2dLbVIvam5kTjJXYjZQSlFIYnQyaWNZMFVNUEpGMnc3a21h?=
 =?utf-8?B?L1dkcjgrV0RhSEE4QUtXV3ZHQm9LcVZnRWRjOTBqSGZZSWhJc0JHQ3d1MnR6?=
 =?utf-8?B?Sm9sQ2pkRWI1Y1p0U2xRY1BldEs5dzZVWUp0YzlKNEI5V3A0WGNhTFJvaGl2?=
 =?utf-8?B?ZkYrREVSdFFEdVRnY2IxUEtudjBXd24xWDRoY0lWMytFL2NiZ3RwSVVGelMy?=
 =?utf-8?B?T2ZQd2ZUa1VWdXdiYk5WR3hmRndmZlFUcnhHQ2huUVJmRjQ4aW9zM3ppWW1q?=
 =?utf-8?Q?TnUhukDnmUNUR3wd69K1U8AZgPsqu3GcHIkuqLE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7149159c-357a-40d8-1204-08d97d9cfefa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:45:49.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iM8QLH1TYOzEO2vcgsgz4MEW3VanLWZsCJcK0h0HfPSTRpwDI6lJnUUEdb1rxRI1Zc3EttNA04Is9NQqrCzDXy02z3JJroQ1kzsDJq6XEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

ping )

27.08.2021 21:17, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> That continues "[PATCH RFC DRAFT 00/11] Make image fleecing more usable"
> and supersedes "[PATCH v2 for-6.2 0/6] push backup with fleecing"
> 
> Supersedes: <20210804131750.127574-1-vsementsov@virtuozzo.com>
> Supersedes: <20210721140424.163701-1-vsementsov@virtuozzo.com>
> 
> There several improvements to fleecing scheme:
> 
> 1. support bitmap in copy-before-write filter
> 
> 2. introduce fleecing block driver, which opens the door for a lot of
>     image fleecing improvements.
>     See "block: introduce fleecing block driver" commit message for
>     details.
> 
> 3. support "push backup with fleecing" scheme, when backup job is a
>     client of common fleecing scheme. That helps when writes to final
>     backup target are slow and we don't want guest writes hang waiting
>     for copy-before-write operations to final target.
> 
> Vladimir Sementsov-Ogievskiy (19):
>    block/block-copy: move copy_bitmap initialization to
>      block_copy_state_new()
>    block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
>    block/block-copy: block_copy_state_new(): add bitmap parameter
>    block/copy-before-write: add bitmap open parameter
>    block/block-copy: add block_copy_reset()
>    block: intoduce reqlist
>    block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
>    block/reqlist: add reqlist_wait_all()
>    block: introduce FleecingState class
>    block: introduce fleecing block driver
>    block/copy-before-write: support fleecing block driver
>    block/block-copy: add write-unchanged mode
>    block/copy-before-write: use write-unchanged in fleecing mode
>    iotests/image-fleecing: add test-case for fleecing format node
>    iotests.py: add qemu_io_pipe_and_status()
>    iotests/image-fleecing: add test case with bitmap
>    block: blk_root(): return non-const pointer
>    qapi: backup: add immutable-source parameter
>    iotests/image-fleecing: test push backup with fleecing
> 
>   qapi/block-core.json                        |  39 ++-
>   block/fleecing.h                            | 151 ++++++++++++
>   include/block/block-copy.h                  |   4 +-
>   include/block/block_int.h                   |   1 +
>   include/block/dirty-bitmap.h                |   4 +-
>   include/block/reqlist.h                     |  75 ++++++
>   include/qemu/hbitmap.h                      |  11 +
>   include/sysemu/block-backend.h              |   2 +-
>   block/backup.c                              |  61 ++++-
>   block/block-backend.c                       |   2 +-
>   block/block-copy.c                          | 157 +++++-------
>   block/copy-before-write.c                   |  70 +++++-
>   block/dirty-bitmap.c                        |  15 +-
>   block/fleecing-drv.c                        | 260 ++++++++++++++++++++
>   block/fleecing.c                            | 182 ++++++++++++++
>   block/monitor/bitmap-qmp-cmds.c             |   5 +-
>   block/replication.c                         |   2 +-
>   block/reqlist.c                             |  84 +++++++
>   blockdev.c                                  |   1 +
>   util/hbitmap.c                              |  36 +++
>   MAINTAINERS                                 |   7 +-
>   block/meson.build                           |   3 +
>   tests/qemu-iotests/iotests.py               |   4 +
>   tests/qemu-iotests/tests/image-fleecing     | 178 +++++++++++---
>   tests/qemu-iotests/tests/image-fleecing.out | 221 ++++++++++++++++-
>   25 files changed, 1420 insertions(+), 155 deletions(-)
>   create mode 100644 block/fleecing.h
>   create mode 100644 include/block/reqlist.h
>   create mode 100644 block/fleecing-drv.c
>   create mode 100644 block/fleecing.c
>   create mode 100644 block/reqlist.c
> 


-- 
Best regards,
Vladimir

