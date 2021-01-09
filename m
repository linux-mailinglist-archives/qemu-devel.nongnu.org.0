Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CD2EFEEB
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 11:15:07 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyBH0-0001iP-Gl
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 05:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBFm-0000rQ-1B; Sat, 09 Jan 2021 05:13:50 -0500
Received: from mail-he1eur04on071a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71a]:11022
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBFj-0002Ue-Sx; Sat, 09 Jan 2021 05:13:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j58yC35g4pcwqjLttEWX8nKsTTnB3g1aPwT2f3w0rutChG+a3Ntv4FaBzUGbX0orbgHYlOm9C7xM/GKtE3hNkDUh+Cx82zPORh4wzPMLbrnnB4ksUCsDSEI1NY5ELkY41ApcPaaWeC+mylnUrgGZZ1iCkTtqVc5S3Mi2mh25ZCTFSM+psP1Cf3rapMP7ThiK7xoC83V2a36osWtXgWfwkbMmDwFTQSY8qBuSPEBaXzhAVlCmdAsbVHeqN9GAwg+nd6a+vBU9C4rrECV1wzDBJnX1Gxo8IqhGlR/4Tl62yzW1nZAZs7KL9E8Wq6PPS4ogn8YjyLTYHkVlQddCv3dXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLjp/GQ0pULR8qgAF7rKurd2b1aRq8BPQgLSHJ56mjo=;
 b=Afqowse8SB6yLuNJqnm3MGXVapNgKIhxRJJMZ0ClWwXqFi5q0BrRQ2rF6frwCFW1d522OgKUDFgJpwKfZgfPfKEPaX/V3WkacStHkBL4CcnkoLF5MaR2kzaUeHWx+oomLthcT18wpxpbwcrSP3y9EYf8ZdhA5Q/apVB/40hFi0Y/1lQjTNaObu1OuvNzOPsqQulI2G9Cemnb8NXBh2g+Q2S/Bu+R0qWr0PeOGCHaHm8Hgt5ED+9aOug/1mFfCuQGLTj7kKVrLPioCC2503Trm0Iyo/+5kv5BzjowbtdNVR5m/t33phcBg/aWzVNxAP6+nsk3aJv8/EE9iB/lAqFzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLjp/GQ0pULR8qgAF7rKurd2b1aRq8BPQgLSHJ56mjo=;
 b=H3fapOGSACKurtrGtqMvDruh5j72mgS44Ig5zl/EAK06NSzjGc8RQd7lMdVSavY8wnFHrveDitEU8XAzqr2zWMVgeXzNHKg0Y+q0ti4rmw7Eri+BzBW9SqpoQtFUoQq3QG/1qn2liBro2sg4XC6LSwnbixQjUrs5OIxVGLSTeLo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 10:13:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 10:13:30 +0000
Subject: Re: [PATCH v4 00/16] 64bit block-layer: part I
To: qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <848a571d-2c7d-cd3f-602a-d17ddf87ae22@virtuozzo.com>
Date: Sat, 9 Jan 2021 13:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM0PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:208:d2::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 10:13:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d566b9ff-5c3b-4bd3-a376-08d8b48736fc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62805E70BAB9313702C299A0C1AD0@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVQF66J19hu5LJXjYyniMX15cEAzBPC0voVbepQKimLgWCVe/buIULgNN/dN4u2fOiH3Q1CCmpYRobFgV44KE7ZmH6wc0TYEE+psL2PcbvuM9kaov88NXaGiUlKCFc2OCWorNHUO+ppcBT4+/Uhgo48cIEqlbbKRd/iH3rUcT7xAhJ1QuAVVZ9OQ7LLdKapoxjp1w7XYe4phyBSQPpS15B29g0e2fC95bDQMVDbGikGhb7W4QVmb8asyHh0IDaZ5ciXvizZSvx5AobqvjQUk3yivYGkKutRgH/e3FCSlrHMW9YjltzYCYFP8WEdMJ+V/bv5VYbbCUDo7Pl6ZBCKjYdzr1gIGqBHPFCjMfFa9xI0dnrpyUKP3Bef9rSTXvLk7fhyEL3NcDRQ/QKpCpGmVBSvh0R+baWVt7yOr6gN3vZ4+Un+1z5zV4D6BQWSX4HNIvZ0PKpZVg7H1tOQpOnpODLuXOV3jm0bqdFu8GVbuyIfqsnynXGFiuf5VBcwp2hTK2pUaQdQeoAO7AEj3xre0PgX0xW914FOpZ8aOTvfahSSgHYp9auwhSCG7OAi/03k4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(6486002)(83380400001)(86362001)(16576012)(36756003)(478600001)(316002)(5660300002)(31696002)(31686004)(66556008)(966005)(2906002)(66946007)(107886003)(6916009)(8936002)(52116002)(2616005)(66476007)(956004)(8676002)(4326008)(26005)(16526019)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3VVQUFTZFdtckJYUHRHVVV6THBHM0Y1QVoyZkJvV2dwc0g1OUFzeHZNcTFL?=
 =?utf-8?B?U2g0TmI2UU53b3R0OXpDZXllclRscmIwR25keTlETmtCTFZBYUIyeUdjK1Np?=
 =?utf-8?B?djJMTXlVVEVyTDUrSjBGUG9ISTdhQmsvalRhekNKeUt6azNUY1M0YWxvUHUy?=
 =?utf-8?B?a29vb3MrNkxYMTVOaXBQcUtTREY0MCtzc3NUQ2kwK3dFTThBakZTeklwckxC?=
 =?utf-8?B?dGgwVzNtMFBIT2xkUmhkTm9PczJ5K1B2NllhcFFSN0xKMTZRRHZoUmcvYmcy?=
 =?utf-8?B?a0tKV1RPL3NIYnk1ZEd3WXdlUENMczcvVDg4WHJlbjR4dlRLZWZTa3Q1VU1S?=
 =?utf-8?B?UnRDRElFemU2WWhwelJNemR0bXhpMUl2OThuSDZyZmZMN1VPV0MvTXp0K2FJ?=
 =?utf-8?B?aGdxb0RBbWRUVkJURWwzR3hPYnM2aGxGMzkwcUxaaldVaUhqQVRaV0xJa3NB?=
 =?utf-8?B?M2lWMGRCQ0E2dVFMa0l6VWRKUC9COUVJZU1SUHd4QTgrVDI4NXZNaXZTYzM4?=
 =?utf-8?B?U2pEWFFYVlpzZWo2WHZBZEE4cGlobHFBYWFRalVlR3ArUHpFL3Fsd2ExSERn?=
 =?utf-8?B?aGNBQlBTL0xiN1ZKWjBjTmZOZkFqZFQ2OTNDY2o5Nk5QdE95bjc4U2lOM0pT?=
 =?utf-8?B?OFcyMkxQM3F4SzlUa1paRDhZVFJudm5nalc5OU1iVllWOHdCWC9xbGtjbTBK?=
 =?utf-8?B?MTVucWx3Tm40NTNtUnNjSURNOXhuenpoNy9EWitoc2N4N0NBZzhiSkdIcnpP?=
 =?utf-8?B?dUQ0VWVQT09GcnNQT05ZUVdVZjlwZTBCaWlXU3JMWkVKSzArNnJNbW16Y2cz?=
 =?utf-8?B?WXFFSGhpWENEdEpwQ3lOM01EakhKTGp1TDdoS05rd0I5N2hDWXpaaUMza0Ix?=
 =?utf-8?B?bVN0NXUva3N4S2laaHF0OWNaVFNtZ1BYeThoaEVqZzJnbkUvZlA1cVhDeXNU?=
 =?utf-8?B?azYvcE12U1BNblR6NU5hdnpMTTR5TkdQcnkvREl3T3JRb0FiYWVqZXlkTXN0?=
 =?utf-8?B?SUNIU1JWcE1wQ1dpYzdwNDQrRm5oUlRWZTZMNGh3UkdLbE90eDFONnZ6eGxk?=
 =?utf-8?B?cnhtK1RhL1cyUHMrQzFjaTUySDcwNVVWcWd3NkNyUkJ1ckRyZ2FueGwxeG0z?=
 =?utf-8?B?OVZXZmpjSmEwc2Jzekd6S2pFTEZGcUVxcjU2WGk3MVB4MXNiaDN3MndyOHNt?=
 =?utf-8?B?Mkd5ekkxZHdndXRvMytwK3ZTM3BGZ21EaE4yb0VjditTMDlpVGpsSDNxdVox?=
 =?utf-8?B?MFd2enp6S2RlQ0NObDgrV2kwc2ViaFhOMVc0SnZaZ3hrV3JvTGY0eFNGRUFy?=
 =?utf-8?Q?zBQj36MxJtEnkhnBzL85MaKXYzeoR5h/rK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 10:13:30.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d566b9ff-5c3b-4bd3-a376-08d8b48736fc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svVHRrwtLu6owQrY4CUZ7lPvB5rOdQQEyO9zZZJ5qHukXq39EQkFN5Gt84LG0Z8ePxc/oq5az0kmMuDNsoDwHCj8oT+YbqXqZX4hLETXNJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

11.12.2020 21:39, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> We want 64bit write-zeroes, and for this, convert all io functions to
> 64bit.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> Please refer to initial cover-letter
>   https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
> for more info.
> 
> v4: I found, that some more work is needed for block/block-backend, so
> decided to make partI, converting block/io
> 
> v4 is based on Kevin's block branch ([PULL 00/34] Block layer patches)
>     for BDRV_MAX_LENGTH
> 
> changes:
> 01-05: new
> 06: add Alberto's r-b
> 07: new
> 08-16: rebase, add new-style request check, improve commit-msg, drop r-bs
> 
> Based-on: <20201211170812.228643-1-kwolf@redhat.com>
> 
> Vladimir Sementsov-Ogievskiy (16):
>    block: refactor bdrv_check_request: add errp
>    util/iov: make qemu_iovec_init_extended() honest
>    block: fix theoretical overflow in bdrv_init_padding()
>    block/io: refactor bdrv_pad_request(): move bdrv_pad_request() up
>    block/io: bdrv_pad_request(): support qemu_iovec_init_extended failure
>    block/throttle-groups: throttle_group_co_io_limits_intercept(): 64bit
>      bytes
>    block/io: improve bdrv_check_request: check qiov too
>    block: use int64_t as bytes type in tracked requests
>    block/io: use int64_t bytes in driver wrappers
>    block/io: support int64_t bytes in bdrv_co_do_pwrite_zeroes()
>    block/io: support int64_t bytes in bdrv_aligned_pwritev()
>    block/io: support int64_t bytes in bdrv_co_do_copy_on_readv()
>    block/io: support int64_t bytes in bdrv_aligned_preadv()
>    block/io: support int64_t bytes in bdrv_co_p{read,write}v_part()
>    block/io: support int64_t bytes in read/write wrappers
>    block/io: use int64_t bytes in copy_range
> 
>   include/block/block.h           |  17 +-
>   include/block/block_int.h       |  26 +--
>   include/block/throttle-groups.h |   2 +-
>   include/qemu/iov.h              |   2 +-
>   block/blkverify.c               |   2 +-
>   block/file-posix.c              |   2 +-
>   block/io.c                      | 274 ++++++++++++++++++++++----------
>   block/throttle-groups.c         |   5 +-
>   tests/test-write-threshold.c    |   5 +-
>   util/iov.c                      |  25 ++-
>   block/trace-events              |  12 +-
>   11 files changed, 252 insertions(+), 120 deletions(-)
> 


-- 
Best regards,
Vladimir

