Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B8589E9D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:26:16 +0200 (CEST)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcjn-0002x8-4p
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcfq-0006ee-A5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:22:10 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:43797 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcfn-0006w0-R4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:22:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVVSe1UzTYwgOotICYF0fCewBonDJsYRrEGnoMn3i9+OqduaHwNctq+MBC0uqj6WKms38BUdy42z/787f4QJunZ4+/f2Nt6UcM9P8dgbNKx+ISWQXIG32nyATdH6HaXSB39G8NSMIHwwhZk0lx2fm9UsWE5dfUUatTEf/YvBw8VRsknGbmxk8y7JZJUzf6hCFhzj6lapZJaALEN+bkLIQDlN8I7f3B4y1CfAlCfJkUQywKM4HQKqyXYQ8J+0me9eeU7zI+erugV3AV0M0AHF3+tteqdaCKorMJ1s6k+VRIrvuYiOWBkxFYJRefN/4KItKYs2seKbCdr6KZuUfbdmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNgp3BUZxRU35NULKKvq/k+00TyWGXlpW2vJcZtBYRs=;
 b=lA3hF20BxWfRqhevB0BzyOzCSepe5A6jK1dPqC6Nq9s7KppjfoHS50EalC0mN3BHjYRc+mTI0POiUxaZfqVE9QUTw0+15BSkbaA1QAQK/q4sjWPM5D5SwvkRg2NFvWnPVpVFRLv1aZccAivRJCFC4hAlCOvB4Llyrm2Ls1nbehjO+ydwH64SPejA9WZXJ3vijeEINgVoGxngTJbGUjOnGwuRdC8a3wtdSw8H7NvjPBiXlKikWSY0jq6SHMuhgjdAAaUCgwnCabx77Fyra5dfPvKLvnuiUrw0Cj/a0k0710KP7sQdxVQYk2nlOUT67CYHi0YSurhM7QXMC5h4CpBkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNgp3BUZxRU35NULKKvq/k+00TyWGXlpW2vJcZtBYRs=;
 b=Bw4fpV6rxDUr7FfY3FTi+ZioqhuMDg0nXUVtEfcuFnts5dCr0sVyvOyuAUMwcHPRCEItgZWFDhYkh/puQfqE6jgbtTpUYBV7TtlF0jKNcLDjUiPdWvqCHJUoHkbDvTnE5NkibBt7UeZ9yVwqi1x7tdtuzOUfSK2NDyiyPe5a1rAv39+ef/Rg0OpWu5JHqLDZbB8C6vJgb9MZQ6BCVSDBI2M+tcuD6LqFoN4bQW8NDpxFMsKHEEH83FDXSgj62ki53XvyJgRFH71B2eiwvHKrcmSodG7tA4coYwNYt/D7nOZRQ54WVnUIqkz3sMGT4zBtvrqLr5JC6yf7Rm3RYMeULw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB3646.eurprd08.prod.outlook.com (2603:10a6:803:89::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 4 Aug
 2022 15:22:02 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:22:02 +0000
Message-ID: <1a9eda62-9620-cd0f-b9ea-8774e2ac930a@virtuozzo.com>
Date: Thu, 4 Aug 2022 17:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] parallels: Let duplicates repairing pass without
 unwanted messages
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
 <20220804145200.564072-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220804145200.564072-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0802CA0016.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::26) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5726687c-c066-4425-eae5-08da762d14be
X-MS-TrafficTypeDiagnostic: VI1PR08MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1f1uJnw8sqIlcnlj6O3D464DMUw8pqA17VR8vb7l78JbI26BnsZJU4Ce0YF6vIM6JgPLwyKa7mYerKrskYiJS7j6ClFoVahpied9SriX35dJUJMM7Nj1LHUVSYLq7/QkgQZdzUn+TRvMln7+G0+cBUCsr3t6x02FWAXItMQ2hT+XMrJ49CluCxKiWDRb6nJ3r7H7Kn7e72aUjaPPwJlKbgHxcS7cuEYQ9a10NznmmRLl+NABFxRe7kICkO7WBKbjVuT5U1VoShLrSiIWZ/VB913r1Ro1jhy3Bll/eh6S5wbUdCwbd27ntItwILHL2j5TM1V022dxSdijK3QtvFYTFQ2VO+T2v8GH6i7k97rMYhY7LBFA5ynvJpPzhCe9SVIyG2wysQBdT7I6TAitXuMFsH/K7g+PjbwCGYlUi+QyeEAvuZbYok3X0zauTID5846YxPboGHQ7K8kk9kyoyuB5SyXNMPLOW9tqk1uTJ4Sp3OrnpsxjOjLLDDgMNDtLimMJiyMT0SmISyFWaIsH+VvqdhoEOtHXfHLgTqckdgByH6MH7S4skxmn/7HE5V9HxUcuqPP+NGSEIgHiOs0/tv31M7gXsfRfaBKXvfLte/A0q/mUEnPxqbPklo0YB1D+1XJGLdEQDOSYIUfu0CBPmztHyLxvNcqYyRJxRT/lpedcLBhsddxGfoJQ3xnGxfXspTSg+b+2CD40qf0OuaXH6HyOpSc+vOZj4sPz6J8ju0EGBhXDteTKE5Sm8iVVDyinLTxXTb+whW8P5uIKlilnJsP2WX0903VmvJK4eZ3ju78mU4eIGkR3drUiU9b3UudD+sg+0LZz7Omwrk0H7hEnx9/20Anu6Pq3+ENh4aBYyJGudTjrUDkr712yldDic8LN79rLwil88v/EYMvhgBr48xxuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(83380400001)(66556008)(2906002)(66946007)(15650500001)(2616005)(186003)(31686004)(8676002)(36756003)(66476007)(8936002)(5660300002)(6486002)(316002)(53546011)(6512007)(31696002)(41300700001)(478600001)(6506007)(52116002)(86362001)(26005)(38100700002)(38350700002)(26123001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBGMWM5b2kvRVBTUWZKMmdBU2ZXMTMvR0tad2pEQ1F6bEVzcXN6U2s5SlJz?=
 =?utf-8?B?b1NzUlFodXdOUkZJbERsWEVlNjNaSGFvV2UyelZTYlJoRDB0c3o1UmVjdWVW?=
 =?utf-8?B?RWxMVmh4NHpac0dyQ3VVMDdIRjNackEyRG9OSXpxUDBuVkxNVHM5eVhkYTlX?=
 =?utf-8?B?VW40WllFb1Y0RmlzcGRYa3NIRVMvUjNKMitla04rcXJqZWpPbGllRDF5YVFZ?=
 =?utf-8?B?c0FEN2Y3cGM2R2pOOGhYYXJSc0JTMWRPTHRuQnhveGZSNzdOTXExQXU2dHV6?=
 =?utf-8?B?eE9xTDE3ZkMrWWtUYUVtclo3cmlRdmQxRE9FL0J2RGtTYWlJeDViZlkxalMx?=
 =?utf-8?B?eTR0N0Y5a2laM0ZuK2wyaG4xV1BVZXJuTWtKenZXc3pjclFQQS9BcEJoc3pP?=
 =?utf-8?B?QjBMN3Rtbk8zUDU3OGs2L0FUYnVxcUJRQ1ZBL1NCaGlSNHBjNlJaNXRzdzhu?=
 =?utf-8?B?MlN1UEZObHhYS1dWSWRLZWQrWGh4Wk52MzZicm56d0VubWtsU1VrZmIyQkFl?=
 =?utf-8?B?ZUQyb2ZaenNncWcxWFN2Q0JYWkUrR1dSenNTUXZ0T3B2NVFVbVNNQkMxTi92?=
 =?utf-8?B?RzZhRU82dG8rTDdqQ1ZnK2hhZlRkMXFjamg0anI3SWdrY0podGVzZExXUHF4?=
 =?utf-8?B?YTJydms2S1dFMHRYbnhtYVRuVmtKcHR5aXF5M0NYZEdDMk4yeGhteCtVQlNj?=
 =?utf-8?B?UU9YU2gzOUoySEZudFpkMnQvWEprclJUcVZyZDFrMmtqTU9IcjFDUkQ4T0xC?=
 =?utf-8?B?c0hnNVlPY3k2cTRlaVlVUU56U01iKys1MzRibldlZkJ0Mk1qSmhrMHFKc3VX?=
 =?utf-8?B?UkZMOVRDcitjbmVtSUVGblN2dXhBV3Z3YktNUDkvOFF0ZXZOZGdpc2hsNXlR?=
 =?utf-8?B?ZmFFcnpzZ0MzdzFpZXMvaDBxb1J1UVJ1TUYzLzFXNmE3NWhTWFJMRmdkL0l6?=
 =?utf-8?B?S1F5YmN3SVVvUkpHcnk2czVMd2VOZHBBQmNCTXFQSEgvQW91TTVFdlBZOGw1?=
 =?utf-8?B?Z1lUN0F2cDlWbXBOTTFoS0lNU0hXRTZpVjJMSTY0T1h3MzhsSVhwTnQ3bmhl?=
 =?utf-8?B?Mi9PSFBOT3ZVUEc4Q3llQ3B3dHRNYVFmZFIydTFvbkNlN2Foa3Z6eWNhcTVy?=
 =?utf-8?B?cmFzWU92YklYejJ2UTZJQlZnT1NpUlZSVmRCc2UrL21CYVZHQUNFc25BeEVq?=
 =?utf-8?B?L0tHOUhpeW1MNXhoZ3ExYmx3NTF2R0Y1N0hnUksrbUQvTllDTFRVUTNlbzVK?=
 =?utf-8?B?VlI4b1J1c21BbTdWU0pxdGE3RUFOYmhSaHpCZ1c5RXIxSWdlQThLOHN1WDd1?=
 =?utf-8?B?blJCOWRqZVFYSGdnZ3B1NCtDbGJWdVR3aFBSTTFOSENCc2w2cjl4UlJPcjNS?=
 =?utf-8?B?TlpIRklpZTJ0MzZ3eEtHNXNrZkw5czk5SzlzU1VLdGVBbVpla3dPYzhpMkdk?=
 =?utf-8?B?dzdEalN5Z2xHT1RGZU8vV2cwY2oxYVNOTGlvbEova0RrRGhGc2M4RDBLY21R?=
 =?utf-8?B?eGlzaFY0ZVo3U0ladERvRVZVTjg4V1ZML2FXanF5R0R2cndxQWNOVnF5U2tr?=
 =?utf-8?B?ZXFtWlpXcU5wMHVtaUh4Y3l4QkkxRmlyRHFORmR5T1UyRXptbEhUMFEwRDAv?=
 =?utf-8?B?RVc0VzBRbHJDMTZXc3hmUkZjNnQrVW1jbjh4UmRseTFTSWpVa3dHRklSR1g1?=
 =?utf-8?B?N1hCblJqei81VVAwaFhsRnRGeHBFcFJRenk1eCtQVlJkVHNWZlZ0V3B1T2hU?=
 =?utf-8?B?VHQ1RUZuNVNUYXRQb2pwT1k2L0RvN0E1ZmltL29wbWR5QWoxRWJlZWgxVDdo?=
 =?utf-8?B?b1BHek1sK1c1RlhhS2kxV0lmYk9OaTdaeDlzSzlRbTBqeGE3blRDVDVZOWY5?=
 =?utf-8?B?dk5xYitQVVI1V3lWTkUwdUtzV2UzZVZvOGRiUDJIZEtCUThXM2h6OU5PNVAy?=
 =?utf-8?B?aGdIWGFFc25HUWs2djlBMytXQ3ltOXJtbE5tbms4SVExQUVveXRPY2NnUmZO?=
 =?utf-8?B?MGRmb3c2NzJtUnAwSnVUU2J4YWVZbmJXRXU5OWlJcWtCQnZvUXpXVXU5Yitu?=
 =?utf-8?B?QSs2M0k0aUpBdTZXSC9pMlNtYjYrLzVKM0xEYllwbGNNWEN3NS80QmFFUEJD?=
 =?utf-8?Q?vVlHkyQigTcTDsDMzIA5Cx0s7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5726687c-c066-4425-eae5-08da762d14be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:22:02.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do7Ps5G3bzWpj8tiG9MTok1iSz1+dhxpPf0IIryuOQMnUOk848XUfA+moossfbgpbRZf0du2JgQhNL9xt5l79w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3646
Received-SPF: pass client-ip=40.107.6.121; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04.08.2022 16:51, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
> When duplicates are repaired a new space area is allocated
> and further leak check considers it as a leak.
> Let fix it without printing any messages.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 6a82942f38..1f56ce26e4 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -429,7 +429,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       int ret, n;
>       uint32_t i, idx_host, *reversed_bat;
>       int64_t *cluster_buf;
> -    bool flush_bat = false;
> +    bool flush_bat = false, truncate_silently = false;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -547,6 +547,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>                   res->corruptions_fixed++;
>                   flush_bat = true;
> +                truncate_silently = true;
>               }
>           }
>           reversed_bat[idx_host] = i;
> @@ -576,10 +577,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       if (size > res->image_end_offset) {
>           int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
> -        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> -                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> -                size - res->image_end_offset);
> -        res->leaks += count;
> +        if (!truncate_silently) {
> +            fprintf(stderr,
> +                    "%s space leaked at the end of the image %" PRId64 "\n",
> +                    fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> +                    size - res->image_end_offset);
> +            res->leaks += count;
> +        }
>           if (fix & BDRV_FIX_LEAKS) {
>               Error *local_err = NULL;
>   
> @@ -594,7 +598,10 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                   res->check_errors++;
>                   goto out;
>               }
> -            res->leaks_fixed += count;
> +
> +            if (!truncate_silently) {
> +                res->leaks_fixed += count;
> +            }
>           }
>       }
>   
This looks a little bit cumbersome. Yes, we need to make a check that we 
do not have
leaked at the end space, but it would be beneficial to make this check 
before we
have written to the image, in the other case we will lose that information.

