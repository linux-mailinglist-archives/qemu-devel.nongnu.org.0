Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A233727BC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:04:14 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqyT-0001us-Rd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldquH-0007vX-JE; Tue, 04 May 2021 04:59:53 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:45664 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldquD-0000ld-1K; Tue, 04 May 2021 04:59:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBtzHHy2RsC4MGw7t7dGbql1SiKqW8FmlQ9sAzwrLdnwni71a4Dukiji6rDBUm9PqqDyoUFC3mQmFBK+TE/HD21aX/ZKY0eAr52Hzjg9YM39lppP0Kxbt6ZHIaZR6hpnTGARwlswNe/5OXF+Hi/43btQduv0qHf/YJH+nsR2vyUZLvj//2mN26gnnhn2/Jt6wxjmg8bJOVumWbt/Z17cTY6PhZRvgtx5fbPJbYWUwYCjyCgP3RiKNML34NXU6kOaaVDUduLI5ldV2GXKAPJHAncm7uSG9J4KoOAv2joYdU7n36ibbCJe974N8o5JwPj+IgSc14REVez1nFYD7cZm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqwjDb+2ulyPcMzLUb8QUyjeIDnW5Dky/Q+hdAAGVkQ=;
 b=MGovouMXI9qqHi/Xx3dp/Cl4UiBDjyE3ZZ03VuK4tw64NEBWXVESI0p3phBtmjXwgzpkjy6iY2W75ADNK7rFptHO6KrSxFZX1RUaM1B23wDRzYeDZB9SAysHHFMo9+iIYIDzOKrJODgLxboFB4TYY3W16VdDzYcuG54k5ijGu3Sm2p5gBZRPUlunhXDC+beFQ+04+IJgNnYOASOGPg0I+a60GMwlLG9v+axE080h/Bwub6uyMF+5t7SANG93sl/ebKt+293UFBeHukaOovFyszrAnqkd+1Wq5COhD7uLOFSwdg0mA8ZhGd+96rVWDpnMRX86dgcllLwdXw69ftWXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqwjDb+2ulyPcMzLUb8QUyjeIDnW5Dky/Q+hdAAGVkQ=;
 b=BqEhFhxxND65XnbybMHVBgswzEg6KjA3n4b8NnAM23O6SvFWd9g0ebt3kegXqFjEpKOmdHz8odLDWhWM9/zioO/gXK3ThujPGCGgi9Ev0EhqzEIgIOsHfyD9NHr2mApG4b9XRbiZ0dfpv4cT8jLDAmVOobIrHbIJPrhCPcnqRgA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Tue, 4 May
 2021 08:59:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:59:45 +0000
Subject: Re: [PATCH v3 0/9] simplebench improvements
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c4196102-adbb-c6c3-038f-c633a39f8530@virtuozzo.com>
Date: Tue, 4 May 2021 11:59:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 08:59:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031b99df-c0c4-417a-df0c-08d90edaf6bb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3446B7879DC0E73B8511CE33C15A9@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nhokwsdv0zfwIRyCazITr3AOh2mw5Zt2taAaA8gicg2+Amg14Zcg0M1ZRx5lX84Ls7k2+Ou1tWpJn/YKL+tJTHW48Vbw2hxxIRj81LW/hS46jpgKIFB5dDeIF86kjaBqHJDiQi14Q+C7t4xG4xnKvfZM19j2tKu8QC2G/lkD3UexavSZDvS3xCkmpR/zRoZFzDRfMUQ6WZN7pBezobSN1n4X47xgR2TnkXDDZ2+hlxYTmhNwpMS2tpkcU703va+Z0oGkNTGzVQ8Mpst60omfMZV7SbpvhtDOGADgNOxwGxOevFUA9FIeqnYdMTLuxjcsbiUO771zYt4Qd8BJRmmqsq3dOxpqFhI2dsRNZj3PahffrqTgSavwMFA/tAmYH4l+TYdrA1mpFzYGpQWAvG8A6BaDNJrOxU5Y9mod+G5PbeJM0ej/m4dfMIM9dQb59aBupxPrJifK7EK+qch7lDysWebKhypDlMmnWqY4ZAHGKPe76jevFAneSe/k79EPpWGaPy+DbboB9rq8ah07AVF2LQvjmL2I51hEqHbMX0z3AmiDqvwP2B7R+lseFM+N+KTc7haSJfhrAIQPoGnSX8nSLOeTCJMtdCUleGGQmqOMwGhfOkf0uFVAVDt3jouLVkZmIp7x33sPef2zWcACqMUskN77etMaouaeM/Qb4Mee6Z9beRuB8Xb0JXhVj3uezfXcXVh/vHKCUrCZu18HnbjFgF2ebgEUwYpx9Zdb85c+w2k1hlZNYrg+GydFtPoUN6a1W0MxnierMkm3yDhmaQ2AOeM8OG16v88Ve932txntp/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(376002)(366004)(8936002)(31686004)(66476007)(2616005)(956004)(5660300002)(36756003)(16576012)(4326008)(316002)(52116002)(31696002)(66946007)(478600001)(66556008)(8676002)(38100700002)(6486002)(6916009)(38350700002)(186003)(16526019)(86362001)(2906002)(26005)(83380400001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHJCYXZXL01DblBpYmdzT3ZkUGRETWZUellPclFWYlBWbytqZjUyc2xGa0ZC?=
 =?utf-8?B?ZG1wblVpVmJUTFlNVlhBTU8vbnZRdEtrWFpGNHhEZ0o4Y083WkQ1cFl1cUY4?=
 =?utf-8?B?NTJTNjMybXVSTXB2MjNCNm41dVRFa2ZNSXJlYTZWenFEZENsTWoyaTBqN1Nj?=
 =?utf-8?B?RXdvcVF4ZUtOWU0vVWpqYy9NUFlWNlp6L3EvU2VOQ3pwRkUra2RmaElzTHdF?=
 =?utf-8?B?V1BJOGdkTjhndkRNWlhOcVlYMVdpOXhmU0RPckFCaXBxYmtRZWZpQlFVbGN2?=
 =?utf-8?B?bFBiNlhPUUkrT2RVb3FBMEtxRDh1MEJLSmNWVlVrdXV5aUpPYU4vSUUzRWVh?=
 =?utf-8?B?R2RXNS8wWnhidXE5YllydkNzK0hSdEpabEcwdER3Y3JPajN2K3RaV3dxOXRC?=
 =?utf-8?B?Qnl1UzBiZjVKNHUrMytTWXVzY0N0VDRtdm1FNkVnWXVZalBpQXVkbDFJL2ZS?=
 =?utf-8?B?L043WXZOa1o2TWZqaUtCaGdLYkxEbDdMSUdTMUdMY0FJM1RUdUdJcnAwdDhw?=
 =?utf-8?B?MDJFdURKSFY3ay92dmNVOC9BOWI0UmhUSk12dU1SZnBvaVlUTTVtZTJrNjJn?=
 =?utf-8?B?SWdUeDZZRXlNY2tIYUI2LzRqUEhJQ0VWTWQwTS9CeW9yRjk1ZzJNZjBVYTYv?=
 =?utf-8?B?cjl0RlpOQ0Q3VWxMOGZ4Y05jcG5rVi9NbUh6aFlDRUhDUTZWRjFWcVRDUGpi?=
 =?utf-8?B?RnFTUW4vcWxXa1JFSWcyU3dHWndGTGQ2VEt5SXY5MDJlcHdZTXU0KzNLWEVY?=
 =?utf-8?B?TkhEUXZSWGpjeDVZZ0pqMTVHZ0NwTGFOQ3VVL0FYMXp1cGNEQjJXZE5WZCtU?=
 =?utf-8?B?NnVtQ1owTmFuUUl0U3Nsc1RaeFVmeXBUWVFSTyt4djZCQlJBeVFvcE9iZUtp?=
 =?utf-8?B?LzkyUlV1dmc5d2I1amR2RjhySjJRUWJOYnJPcEk1eHdCS01zWjNEaG5LM2Z1?=
 =?utf-8?B?US9hK0ZLNUYrT084NXlEUm5jZXVwMk5TaFdkTDZKMCtvK0dBeXd5UUZ5U0x6?=
 =?utf-8?B?MHFEb0NXMStCNVBieHBZTGxnSm5Ga1B4Rkt5ZksrOTZZWXhPR1A1K2QvMWN6?=
 =?utf-8?B?L3plY0sxcVlVOW5qSTVzajB4WDdQb0l2UE5ocmpkanJXODhWYXZLNW5ENGp6?=
 =?utf-8?B?MWdhVjZkWXl6SGF3NFd5RlE3ZFVsNThyUEthQmNaVEhlYkYrNWxHVnZ0WDk1?=
 =?utf-8?B?NGE5VjlLNVRNNUlSM096RlpXL25CWFFydnk2a2FtcGFPZXAxRm1xeGk1anNH?=
 =?utf-8?B?dXFLc3Qvbzc2RGRsY0l6eEFBY2tEamlrZktmK3JCU2VmRXF0S0NDTGtpb0Fh?=
 =?utf-8?B?eVFEQ3JnUktiblJzYVlhWHgwYzRQaTJsRXFVL21tT0I2bGU4V1V0WkhYdkFG?=
 =?utf-8?B?Y0hURDFPbGg2VHlma3JNb0V5dVVhNUE3NllaUXJmYU50VGtMZm9BNlNGYXNp?=
 =?utf-8?B?Z1ZYOENnUm5ZeUo3Y0h0S0dOUjJZVytaeHpjK2pPc3A1V0h3VWRYekpoaEpx?=
 =?utf-8?B?enJVdjJRK0xVZmZydkVwL0d4VUhiZFBYb1hwQStITkorZ0FMQnhnaXFWcm5I?=
 =?utf-8?B?TUoyWkVucGh5WGJGajYxbk8wYjVtend2MndxODdTZkZMYmUraGRDTytTNzRm?=
 =?utf-8?B?SEsxWndmekM2RWJKRlNjUUJ1K3RKVE82MkRydHFkQ2Nqb2xrVy9mbnBZanY4?=
 =?utf-8?B?UjV4aDdNSllVMjhBNWxpQkx0NnBFblRzcUVRa2dEU3pQcnBvY1Jyc2hIWjB2?=
 =?utf-8?Q?2so+wDAVAVgh2hNrxG+IHaPnJhp7VBDjOj/lPZd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031b99df-c0c4-417a-df0c-08d90edaf6bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:59:45.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL3h7I7hAtJskvhZUTr9l5R135JcR1MbuGsbU2cRcf+UUPWSDpE4it1O+4yW7NR2OgS/+CmforbyAYlscn3GQF3k6SMPesRhtJ0PadQNWlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

23.03.2021 16:47, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here are some improvements to simplebench lib, to support my
> "qcow2: compressed write cache" series.
> 
> v3:
> 01: use simpler logic
> 02,04-06: add John's r-b
> 07: use BooleanOptionalAction and
>      initial_run=args.initial_run
> 08: rewrite so that we have a new --drop-caches option
> 
> Vladimir Sementsov-Ogievskiy (9):
>    simplebench: bench_one(): add slow_limit argument
>    simplebench: bench_one(): support count=1
>    simplebench/bench-backup: add --compressed option
>    simplebench/bench-backup: add target-cache argument
>    simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
>    simplebench/bench-backup: support qcow2 source files
>    simplebench/bench-backup: add --count and --no-initial-run
>    simplebench/bench-backup: add --drop-caches argument
>    MAINTAINERS: update Benchmark util: add git tree
> 
>   MAINTAINERS                            |  1 +
>   scripts/simplebench/bench-backup.py    | 95 +++++++++++++++++++++-----
>   scripts/simplebench/bench_block_job.py | 42 +++++++++++-
>   scripts/simplebench/simplebench.py     | 28 +++++++-
>   4 files changed, 144 insertions(+), 22 deletions(-)
> 

Thanks for reviewing, applied to my simplebench branch at
https://src.openvz.org/scm/~vsementsov/qemu.git

I'm going to send pull request now, and see, will Peter take it or not :)

-- 
Best regards,
Vladimir

