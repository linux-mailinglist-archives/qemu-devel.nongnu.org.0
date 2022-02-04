Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583304A9871
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:32:55 +0100 (CET)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwpi-0003gf-FG
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFwnI-0001X4-E3; Fri, 04 Feb 2022 06:30:24 -0500
Received: from [2a01:111:f400:fe0d::71d] (port=35690
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFwnF-0008Kw-GD; Fri, 04 Feb 2022 06:30:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SigkFci8LyC65tARXe7Yat/ZbWA43DLiRTb3SPCBHJtTFqU8hbAVwrNjR4bI5RxxHtm1Dx61B1s6vcl+Zde/uaci+F6IlhFej7RlgSTPJPZ3y8FdWidchMbOE5PNE3oEpt8q0mqm3Mj44VJgAU3NrwmMH2WRSwc3+tdveJDbfcSSIayZfDRulNtNx34cNlauL/XAELxMl4mGd2Du3gaKb+48CEtW3zBwTOyFLZwwVJIZaBSI0aT6VM6PLBTk9GctjW8w6sB6HsbES38q/HGDJ5jTrX4b2PRdyQoobh7P9QuV06lm6NeGEcejCZ4sK4hR6iFl9qH3AFWlzpaNShFaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Knw7ji85qemToOVFhWCd/OaKm8RbtQ+8Mi+e/wn8zuU=;
 b=Jq5Lny4UHt6lQyiM6B5crA6nv+IzJSuSHwP2RXUknV772c8MG0oeionIfcoWKw+jUEPPPDNZqFz1Br1JlKylgm2c7IwQ9jDk1ds1wGalExT60feberBNBpjTpDc1QwZOWjSEGVXbePEWFFgZcNIyW/mHe5YAtDbZe59TzfoJbUYk8CgFoSh5m0JlVBtYL+YYiUgrlEgewZFoN3crxFPDodMvAK/w7qhCe0eZPX6eLUjUPhhWInb7MsipUjEMB+Df+UWIjr72CSMV6b5Z42EU7rD3MCdd2TPc/W15RanXI0PzoiXzWcLyrEUNL+XXp7nOnNHGhS7hg6AAUB2Bkl/hsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Knw7ji85qemToOVFhWCd/OaKm8RbtQ+8Mi+e/wn8zuU=;
 b=PA2bXynFrGkQqnCsrThuFw9WUIabNr3PHuD6o0M8KHHVuQ3EHOF39kRVmVNpuyS6jVF+2dxZ9aQTeeaZI06PLWW5hx24k7nMQbDAaMywbF09cijspJ1QTf9nRor/fhjD62z7rLXobKhS37PGjsc2G/FxnQJKqiQa1z36Q2NiVJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM5PR0802MB2515.eurprd08.prod.outlook.com (2603:10a6:203:9f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 11:30:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 11:30:16 +0000
Message-ID: <f96ccfda-427d-c4a0-3151-f29b251f3f8b@virtuozzo.com>
Date: Fri, 4 Feb 2022 14:30:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/7] block/nbd: Move s->ioc on AioContext change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 737f3e40-9fac-41a9-1ca9-08d9e7d1b7af
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2515:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0802MB251583BF50EC73A1065FA37BC1299@AM5PR0802MB2515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f05lTuF0s2S4XOTMzVp0bhCIuRDQCHU+A2ZZY97qN81eSn5oF9936I8oM0+hXaz2kSu8gc+42HTPMK0kBvd9AdyYC3BzNTLBeSbqsBVRe/YsFxtzwLYP6rAxSh254ecDo0UBdSKYfqu927JZ9TBwYTt4utxPBUfQfSBUOncPtcTNwulVi4Oy7d2DF4moYKRdkthS8dZW1SMtL+dsXE5c1jpuQC7A5qPkgfq5ImRqiH39ckZLeWcOxfderfEcOKW+BfNsmDtlgp4Bl18tZakVpXndbZp5aj3T8kpMjndDDIgFeEUbqkf/e8NBlbhF6kQm7wHHF1B+2QKQpVsuGWgI4gPm5hFf1YzmMu9iL+PvcrFapamT1PZnJkarwWXmQeRuX9gJfkL2SKsgG5z/qlIxxiNKmHm8dBWbyLQw6D5QJ+XdEasX6U36QgYWLTR+qIr1Cl3vPDbzix21dmLsG22C5IRAl/vBcaI81Dh9HWeCE1S9FJSaSezGYWcRayyq8VJGiJmcr1ltX79gyYIDZJVpe+ctRqTO3sJf0ZRnS3va3JkwYFdCOvBZreOaeH4oZvPRluukLY6uK63pPl8pi4gtBt0Qcqo8hFzCAtnlcdfOw178sOav8swKz77+Oj4Kfr1/iJT3cd6YZMsG9ML5qx8utVLuKav49vo1ZpHnCFLsT7Gdxy6LHWVXtPxUq/e1jIsP7FCoXSfinhgXTVkOdp+N9Ih3RLgMUOKbCRHVi5duosr0884jH280v7YhApUHDcRerlRKAxB451BQqq7f9hqO+AOmPQt6CM4lPJqBA6psL06bYaCgVNtoTuHm2r9TvJyTPVAKET+d3Qo3ByU/SWckll9HKn40j6fOhdoInQf/z0ApLSlKHi0/nncZEcDCgvUEDQauq4q01G/DEQFH/CFu2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(38100700002)(38350700002)(6512007)(54906003)(66556008)(8936002)(4326008)(8676002)(66476007)(6506007)(86362001)(52116002)(2616005)(316002)(31696002)(66946007)(2906002)(5660300002)(83380400001)(966005)(6486002)(508600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJqd0J6bGhSSWhxWjVNSDd3WmRyL2VWL1BHRVJMMm1FTWY0eXZJc2RqdUZS?=
 =?utf-8?B?S2dhdTIzK29EY3RlaXdvNFo3MTRLMVdFWEJQQUI5a2NIL3BFQ2JCUjYvRUV5?=
 =?utf-8?B?Mit0ZTFoNGRYa1JGQUhCODNJcjVOSGhGTFZTOFBZM05Ya1lvQTVtV3RYUi9Q?=
 =?utf-8?B?UW9GNkNyUGc0Vnh0WXg0ZFJqZUV2Q1R4Rlo0VGc1c2gzdzVxa3RNNUh0d24r?=
 =?utf-8?B?NEp1a1dSQjBzdUFsSzFtT29lSFFHZGp4cDFFMVRXUnRURTFUUGRvTURGc2wz?=
 =?utf-8?B?c3ppeEpyVnBIanRmeWljbVREM2dzeHA4K3VZYXJQOUtXU3BYWkhDTHh6c2tt?=
 =?utf-8?B?QWF3b2ZVRXpXTUR3b0syd1JZcmMvU2dyOG9Sek1aNTkxL1VONjd1dG0rNUZM?=
 =?utf-8?B?SUtBay84TjRBODM2SDlBVnhZV29TQUN0L2tyak1BaDk3aHY1T01RUzBTWmZO?=
 =?utf-8?B?ZUkySHJwMFRTaER3OXVXbVR1NjZvSThUNGJxWTFVYmtQT3lIQ0hFckRNdndO?=
 =?utf-8?B?dzRUWHNRSUFqMXhjVVJJOFBzOXVzM2ZEa0xmUkNoVlNORDhEa05TcEppRHVa?=
 =?utf-8?B?U2VqMm9GeS9oaDBuWWRLSCtvK2NXQU1ZS09TaXVKTzM2ZjFxUDZZRGhNVHF3?=
 =?utf-8?B?WERmWUpHdXh3TWUveGM4OHdhb1QyUXRGSFd3dkhZV0FtNjVaQUFsU08wWTNn?=
 =?utf-8?B?bzc3TXIxbmhNdS9mWUp5LzVGNTRIaU1zb1luYUpvdDVoTXFTTERYbEZEUlVt?=
 =?utf-8?B?dWE1OWZpZ2k3cnhqdlVuRTU5YzJpMTdRbStFZUkrVjdFRVh0TmlKL3QvVG9S?=
 =?utf-8?B?bVVRanVmSUFNeUtUa0R5TXl5TG40elMzMEE4TVBaY2x5blRQd0hHOGtFclJX?=
 =?utf-8?B?QUIwNG1ocWpVT1pTMmlSNEh0ZDZyVFI4UzZnZkpyNlBmUHlzWHNVdUZGNm9i?=
 =?utf-8?B?M3ViNUcrdmlHZStsMWhlQUpvUUoyV2N6SDdBeE13cHp4SVVoUjEvNDIzYjZv?=
 =?utf-8?B?U3d3dHRtQ0xSc3VQWUFBa0FTOXFRRGhDZ1FlUC9jMFoyeStjaGM3VnpNdE8v?=
 =?utf-8?B?dzM3NTlKbTN2cE9MZEp1aEtkeUFtZ25SL1BtSUZvOG9wNTZlRk82YzlnNVM1?=
 =?utf-8?B?QkRiU3RIY2ZXV25LT1kwK3lEdGxBZG1nNlRHNnU1Q1docGJMaXp4bEEralpO?=
 =?utf-8?B?VHJxQUI1T09XQklXODVBSk9WNlNIOWpLSkdvSndTNE5qK0FkTGtOc3pqNWsw?=
 =?utf-8?B?bzQ0Zzd0RUFqbjB1bEZXYVhzRmdXZ0NReUJlMDlEUUhSZThZUmlvWVJLRlBK?=
 =?utf-8?B?ZTZQenZVOVA4Mm5xWitKUWhZVWJKOTYrK2FZckpobXJzSVB4Q0VZOFpGOGg4?=
 =?utf-8?B?TDdvL1hMVzFuTWhGSVR6c25YbUlJV3VaVEhhaGNxanByQzA5K3Z5aldyZkFE?=
 =?utf-8?B?SktldU40b2VtaEwxZTRqQ0RsWEJaZm1GUGp5czZIN2VLZ1VEc2JqQVRhUGFD?=
 =?utf-8?B?MGVUTkJtcyt0UG9VRUhxK1RsZFFkem12NmdoeFBVNkxPamRqNHJSK1NnZHJp?=
 =?utf-8?B?Ny8yQ002SUlVT2luN3FjT09adWZpbkhrSU8yTnVNOHFXZzVzZVNGTHkrRHNN?=
 =?utf-8?B?TjJ4R2kwaEJhRDFEQnNyT2Z0eHBuT0tNYTJ6bzlnVlFZY0lJbDlZSWFMdTdi?=
 =?utf-8?B?WWpJVk9iTHM1TnJlWEFvMlBkcThxWEhpMXA4ZjJZdmgyekFhdTIyZ2RVL05x?=
 =?utf-8?B?cGw2Skk1WHZrR2NIZnF1Y1pjejU0T2FOLzIrU3gxTmtaMmZhNEt2TkRTYzFn?=
 =?utf-8?B?U2dINldBcXVxc1VrRXpDTDBVb0ZIUlJEM1F0NXNlcUNzRFA5OVNtNFVhU3kz?=
 =?utf-8?B?RzBSTStKR1l2YlpVb1V3ZmJRanQwTVhzOTRZZWx2dlhyZm9LK2grSlorMk5w?=
 =?utf-8?B?Z1BSaHJ2L1h5YUYvY3hVRnRPbzg4Nm43YWVvUEMyZzVJYnZyTVJvdEM0REdO?=
 =?utf-8?B?NzR2UDVoYnR2eE95MWNMMGtKSlllRE5mcXMyNUtlTUZYSlh1YVZKZkFsaEVN?=
 =?utf-8?B?M01tUkFtblM5S0phcE1JNk1abnpyMjVBaDJXNldRdWE4bUR3eXdDUE8vUlpY?=
 =?utf-8?B?TXNjVmxtd2l0a2hBNzNaTDUxZ2NPenh5djFOZFV3YWtuQzlHcHVtM3FpWXlQ?=
 =?utf-8?B?MTB6S1cyNFF6RktqbTEwbFluOW5jRDRtU0NkQnd0bUZEa1k5VnhZYTg0Q3ND?=
 =?utf-8?B?d0lHNHF6ZzRVaStqQ1laek1lbjhRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737f3e40-9fac-41a9-1ca9-08d9e7d1b7af
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 11:30:16.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ox+KE7GicpMl8zbuSkv+IZfzw90I30QWSFAndV2acuIScdaf6wwftw9YlzzzLLtVHN1Np8+968kkBCn26JqJfuhCQo5V6XOaFY12wp/M040=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2515
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

04.02.2022 14:10, Hanna Reitz wrote:
> Hi,
> 
> The original RFC is here:
> https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00765.html
> 
> And v1 (whose cover letter has some exposition) is here:
> https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00124.html
> 
> 
> In v2, I’ve fixed the QemuStorageDaemon class added in patch 4 as
> suggested by Vladimir:
> - Have `__init__()`’s `instance_id` parameter have its actual default
>    value instead of some weird `if instance_id is None` construct
> - Assert that the QSD class users won’t use --pidfile
> 
> (And added Vladimir’s R-b to all patches.)
> 
> git backport-diff against v1:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/7:[----] [--] 'block/nbd: Delete reconnect delay timer when done'
> 002/7:[----] [--] 'block/nbd: Delete open timer when done'
> 003/7:[----] [--] 'block/nbd: Assert there are no timers when closed'
> 004/7:[0006] [FC] 'iotests.py: Add QemuStorageDaemon class'
> 005/7:[----] [--] 'iotests/281: Test lingering timers'
> 006/7:[----] [--] 'block/nbd: Move s->ioc on AioContext change'
> 007/7:[----] [--] 'iotests/281: Let NBD connection yield in iothread'
> 
> 
> Hanna Reitz (7):
>    block/nbd: Delete reconnect delay timer when done
>    block/nbd: Delete open timer when done
>    block/nbd: Assert there are no timers when closed
>    iotests.py: Add QemuStorageDaemon class
>    iotests/281: Test lingering timers
>    block/nbd: Move s->ioc on AioContext change
>    iotests/281: Let NBD connection yield in iothread
> 
>   block/nbd.c                   |  64 +++++++++++++++++++++
>   tests/qemu-iotests/281        | 101 +++++++++++++++++++++++++++++++++-
>   tests/qemu-iotests/281.out    |   4 +-
>   tests/qemu-iotests/iotests.py |  40 ++++++++++++++
>   4 files changed, 205 insertions(+), 4 deletions(-)
> 

Thanks a lot for fixing this.

Applied to my nbd branch. I'll wait for additional comments until Tuesday before preparing a pull req.

-- 
Best regards,
Vladimir

