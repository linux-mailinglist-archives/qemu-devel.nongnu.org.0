Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAA53E51D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:42:22 +0200 (CEST)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDvx-0005GE-Jg
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nyDr5-0001xI-GA; Mon, 06 Jun 2022 10:37:19 -0400
Received: from mail-he1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::727]:42372
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nyDqo-0000Ti-1b; Mon, 06 Jun 2022 10:37:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6L0jmwZM9MHnY5PjHRk4SZ0f57NmUQPC+SpN3144fzlhzCYUPHxqZf6DGc2DHBXJH8bNiel941FdfIB916hed7Pwihk8A+UJ3m/AmfhEnXiUimh5ZGw0kIQ1otMHxbKIVxQvUy+4ZY3UIM1YNSrHul78QCAGkOzw0FBpqGgO3bH2+WqLfSavrbiegeLHuml+3hsKDIgZjjH07AxORvuy1VNFMKueWqNdh2uYROztMHKciUZ9DcrtFU6ycRbVPdHXaER2V/Y8bk0m2gtmcFVZ2aTnZYeQhE6SFl184c0YcLEI3V6Tb0N/U3xVOfHeFXfm8tRsQtGnOC6og4O8xUdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+nOg8cs1x1wFyM/rdbb1R04q5CJE2mDpJi7oLFaWDg=;
 b=ft7YaPVMWJdeSz+yyolEIA691P0c6/xamGTryPcaLsifP340YfEnDsArb07F3lBfwZHZCSN3HcPunO4e2dpuddxin27Y/J+M56DGbKZei4TUE45f6yMMs5m+8jqtAOR078v2iAZuplAapcOkb9VsNb7IZwAHPgWIpgIEne9pEi31G79w47H4xz5GumDNPH6wZeoLblDEdl/z914GO1L8181rWmYhvj3F0DCYnTom6If6KE7iaECht3soOYe/6gepGNQnuA2NphjvKrnQ1y1svDlPbDgX7p/EDoo7Rqwq7jhdznBQgkSCX7MSte1epzbbyPKDDbT23nGNhmhbduxD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+nOg8cs1x1wFyM/rdbb1R04q5CJE2mDpJi7oLFaWDg=;
 b=NFlv2sxR6HgNwROyD/ByjB5AGB0m54zoWEy9OXDsfBcQeVNYTd+VYBHCPCf+/Z86KiN/wwco/OvEmGAtOZTooswlXB2IngswycraOSnrdWfkYnUp/gwEeY/SZi7aluTL0U5qrDKhjXqdacW3y3QpyuBqGV8NqaUoOEG3c2x3Ki0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB8PR08MB5275.eurprd08.prod.outlook.com (2603:10a6:10:ec::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 14:36:44 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 14:36:44 +0000
Message-ID: <e3fc30fc-ebd4-e46d-8090-1634dbe40dac@virtuozzo.com>
Date: Mon, 6 Jun 2022 16:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] block: use 'unsigned' for in_flight field on driver
 state
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220530103957.629398-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220530103957.629398-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0029.eurprd05.prod.outlook.com
 (2603:10a6:800:60::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b37fd2f-bb53-48bb-4b1e-08da47c9fabc
X-MS-TrafficTypeDiagnostic: DB8PR08MB5275:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB5275E44FA4145C9C75758812B6A29@DB8PR08MB5275.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZY7jjhXUObu4BtGhea5Zr2EaErM1D4ki0jYzgdKtsQjaz60dOlh/Mk5gEdmw6hatpHKBfpHmU9SpBLmQ+VGmivwQVCK1F1hS0KSN5+2VtCUSNWeT5f7fa2gkinGIOSWeEZZMdGMlryZHYTfZeHaZtwZeIFdgiAEZteGPC8/tvuMtRc4QfAFCJ5hCAnlDSt+eIrDaPHo6nr454OI8P5wwte8tsH2/ckvaRLS1eVAk7kbEcV+NeL2XdUCzVtHxE8cF5n2yo/JoRfyh/W5dThbSurrq+JjUyOHpKwuO7eMQo3jgwnRd20aUPPc1K20/PmTZ72OEgx7gqo4S1gFYMoTvo3cAb1q/joHcWfhI1nxWiPZoz2Bit7kMltlUmcgkUhLK+F52fPgLyCzSzPm5nvIlHNVZXC6PTqPUjImqr/B8CqUWMp5lqoFVPbBZne91bsDBAMVFEB/Gqg8uyLn+MGxg0MmTWaaeUqxY4l0DPpwIpbNSztwZU4RJ/5FZjy9G8WB7Vca5lriAFgbIBoEBPfM5B39LHJtyNnIrX1izf9M08T2skQ5o9B2RPRNzdXeWcxin9nGmejdfs7qMHeA7gC1vdMbuamodYyoz06KlJSCrMJR/Pl7iL7N56RS8wUu+j1yPODY1yKLh8YNmtbjBDUEwfk6SurdoqG6MvaV+g5G9pNC4eKA1hU0m0CTDRXrALo0s5z+VvZxOxwMFJbdAmmzo3EfNloO+Bq56c6d+07qoXrbFN8DkMX98ojHCgYtMh21iT7UFsA6rMdYgO+2JBd0mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(31696002)(38100700002)(6506007)(53546011)(66946007)(66476007)(6486002)(52116002)(4326008)(86362001)(508600001)(8676002)(186003)(2616005)(8936002)(5660300002)(36756003)(2906002)(66556008)(83380400001)(54906003)(31686004)(6512007)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFydTNaMm1lMzlxRGdlbnFvZEpzd3NxalJtNnd5V1ZNTkVDdHVPWFNLWFJq?=
 =?utf-8?B?MEMyZHpwS0VkYXZVbHhlSEMyZnd0QlIrUGtYL0N1ZlZtZEV1ZXFQdUZocUg1?=
 =?utf-8?B?b0ZwNytVSnNUejF2WEtRWUlQV0J1TTlGR1p4N1ZyanhUNjB5aUxOVkJGQU52?=
 =?utf-8?B?R2t1T3JvbkpBYStIT3FvMUxrcjY2K3l6U3gzekJIMW5UWWx4VDFrQWRWTjJY?=
 =?utf-8?B?bnZ0UnNVSHcxTzFrVzRXMm1YSmY4U1BpWVRRb0NHL0NRdzhaNDkwWEhZQWNp?=
 =?utf-8?B?cjcyVER4OHVxQ1dkLzRVR3ZsdWZvMUNuUWFrR0N4RFpCVjRGTWdjcWlUSUFa?=
 =?utf-8?B?N0MvTkE3aWdMMml5STQ2dUk1YkZJcTd0djR1blp0Tyt1cURBaW5pQjdFYU05?=
 =?utf-8?B?bzhORjJzYmVhVFEvNURDS0JmR0pKS0lXMWxKc0wwVU95dEM3emZDZkpBTEJC?=
 =?utf-8?B?UXhGMTJIaVlSZXFPU1JzcGhNWnBua3BXT05SWis3cXllTU5oQnR2M3Z5RThB?=
 =?utf-8?B?L2p1cVphMHdyK2M5VUkrUkNyS1pnWE1FZTRNeEMzd2I3WVdMaE8rOEpPQnQw?=
 =?utf-8?B?UHMyWG43RVBZaXJTMXpZdnl2Tk8zU1pwZnpmb3hETjZFMDh2WHdGMUI5YlNm?=
 =?utf-8?B?TEYxQ0gyOTZ2ZG1JTFhUM3pEQW5PS0l1OTIrT0pUeHJjZ3krRWhSYkVwcVVC?=
 =?utf-8?B?VC9PelNhb054NCtLTyt4eXNpUERWdVhyaVNILy9WeDlHbGxPZFpNSkg1RlVz?=
 =?utf-8?B?Vk5VZWZ3SUpOT2FUbEtoNkx6dEZjZk5ScUV5VzE1MnkzRkt6cFRRMUVVNGZP?=
 =?utf-8?B?ckg3RXJUNDQ4ZkRUNW1YbjYvc2ZZa214aEV6T1NGR3Z0RWxhMFpObkRsUHEr?=
 =?utf-8?B?Z0RKNGZrVUJsUldxcjh1dDVPSG5FRWEvQzZhQXUxQ3BzUzFmeFNKNnZHaFRr?=
 =?utf-8?B?aVMrRW9UeUhuajd6bDI3OGswbmR3dVJlbkREOEdURFdXeEYzRmxhQmoxN25L?=
 =?utf-8?B?bXZNRnBoOG5aTkxqd0RjcUVWOEg4dU5OWmtPR25DS3VFeEZDMXNUQnhhWVNL?=
 =?utf-8?B?RXpFZ1htRVQwejZyamk5UE5iUWQ2eHgzSzhqR0ZUQTZ1VU1CMmtmUGN5aG0v?=
 =?utf-8?B?ZGxSQzYwVnhzdHYrSm0vZVpCNDZRR0x6YW9reXMrYzRkaTNGYXZ0NS9raUxR?=
 =?utf-8?B?cENJYTBJQUFUN2toYVFCbzZJd1hJdFM1QmMrRGYzNjNWc1doa2o5UExqVUdL?=
 =?utf-8?B?ZEM5Vm52Y3J0Tlh2QzFmTVp4T1ZJTzN3aWlqVzVhTE1QcnVRV0RDNXhBVW9v?=
 =?utf-8?B?UDg5eDE3aEdkSlk5d0dPcGpCVkxvajFraXlBL2xqWmd1WmJ3Zk1BWC93cFNu?=
 =?utf-8?B?RjJxaDE3YVZDeWVjK2I5eE5YRzBGdFZhYXNpZVl2dHlKTkh0b200dEI1bmhu?=
 =?utf-8?B?UnZtZDBYTXhDN3g5VDZJR0plR3Z2TXB0RHJObHgwNVRKWnRUN3VuYklYZjNI?=
 =?utf-8?B?MjVLblQyMmI5dUFNcjlienp1bWNjOUZDMTVoRGFHL0wzNFVaSDVRTWdzRFFq?=
 =?utf-8?B?VWx3Yk03NWFOV1JlTlM2aXhhUXdkbmF5OEl1aVl2WFZnRHBweWI0NmczS2wv?=
 =?utf-8?B?VGZOVjF1Mi9ad0pERk1mbFhmQVpzQTNuSW9xd0pseko0aWVVaHRab3QxRWFW?=
 =?utf-8?B?UzlIRVBZZmFHY1hYNE1EaTYwYytYZFBRNEIzdmRqNlFnWEpQeVRTMjIyNlp6?=
 =?utf-8?B?cGdldW1YQ0NLZi9NQnk1QVFpbGNlM2pFWmRKM0lIZXJaRy85Uk9uaGFZVXd1?=
 =?utf-8?B?N1hyZ2FUQ1JWQ1dDdnFEZEJhZ2wxVXc3aXFHbUEzWERld0VkSlNpYWVLbElj?=
 =?utf-8?B?eUZkNXRGUzUxMzdKdURnUWVDTGNOUllGclhraGJOK2ozSjg0b0Y2cGpkK0J1?=
 =?utf-8?B?dlAyNzIvelZQcDE5WTRWRTFiQ05lNXJmTDI2enpySVk3aU1GMW94d1F1eUdT?=
 =?utf-8?B?V00yWE1XNFUwUVpEWXNJM3J2ZWsyLzRvbjQ1TE1UQlczMmp2dlJ5T0Y0TzFo?=
 =?utf-8?B?V004b1kvU1duTEFnUXN6aWsza0pjYUUzcHkvTHhzQVBVSUloTDU0d1RCNmtU?=
 =?utf-8?B?TmhMMVQ1NTlkYjBmY3lZd0RTTHd4azU5ZUU5b2ZPUXpSZXdjNTFaek1YdzNu?=
 =?utf-8?B?QXVYZ3RlbCs5RjRMYVNZRUhWWUpHcCtrY01Dc1JrWnlMUkM4c0RMcWVVMSt6?=
 =?utf-8?B?MzhFbFVLQUdBQnFJL0thSUZOZGRtUTloUmhzZFArcGJFL0doVTJIOHhDTEo1?=
 =?utf-8?B?TlFzTFg0QlhMb1lXVmNrOGNLeVJuVGNwTWcwcTI2VEJ4Tjh3N3Rxdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b37fd2f-bb53-48bb-4b1e-08da47c9fabc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 14:36:44.8082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0A0TRy/05DkYQE1jroAcMz5Ar6F9EdGAu4xKlbWh0jd5bYCfDYTQDhTuG9/sgLVU2c4BO6pv05/TpwaKf/drQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5275
Received-SPF: pass client-ip=2a01:111:f400:fe0d::727;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.05.2022 12:39, Denis V. Lunev wrote:
> This patch makes in_flight field 'unsigned' for BDRVNBDState and
> MirrorBlockJob. This matches the definition of this field on BDS
> and is generically correct - we should never get negative value here.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: John Snow <jsnow@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> ---
>   block/mirror.c | 2 +-
>   block/nbd.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/mirror.c b/block/mirror.c
> index d8ecb9efa2..3c4ab1159d 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -73,7 +73,7 @@ typedef struct MirrorBlockJob {
>   
>       uint64_t last_pause_ns;
>       unsigned long *in_flight_bitmap;
> -    int in_flight;
> +    unsigned in_flight;
>       int64_t bytes_in_flight;
>       QTAILQ_HEAD(, MirrorOp) ops_in_flight;
>       int ret;
> diff --git a/block/nbd.c b/block/nbd.c
> index 6085ab1d2c..512a53bf73 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -77,7 +77,7 @@ typedef struct BDRVNBDState {
>       QemuMutex requests_lock;
>       NBDClientState state;
>       CoQueue free_sema;
> -    int in_flight;
> +    unsigned in_flight;
>       NBDClientRequest requests[MAX_NBD_REQUESTS];
>       QEMUTimer *reconnect_delay_timer;
>   
ping

