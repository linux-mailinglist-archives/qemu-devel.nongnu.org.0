Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CC3784AF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:02:49 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3gW-0000Vk-CI
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3em-00081v-9g; Mon, 10 May 2021 07:01:01 -0400
Received: from mail-vi1eur05on2107.outbound.protection.outlook.com
 ([40.107.21.107]:49658 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3ec-0002of-Co; Mon, 10 May 2021 07:01:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzvsHizl9vzvEKJSWrTqBMHxIMdEdXj82jOjkZ1huln8fHDpI7iypMj0Qf9vC3qeBv7ECVfXA6BpEZmYi+w+fN3dbwdC768dxLoJW7KokhsXQvvt9lxX/sKAWMvtkTNRQP8xqidOaGyrZHLVWVJtBLjvZk5ptJ4dGslYWcvdIOldre4GdMqmGtyXrZmigvJ5n9rCiswO8I7SNb8NWR///mXbIDTfyepWiLRNFD7WhR18kZxPRg3o3M3dqcIbTs11fykzCubTLMELTr+u+iUKtWgJ8Ic4jdArNArBZXP0FeE0GC9dq2IC/nWluRi+6H063HtmDzmE5TpAcdQ9tHmvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHEn/tSQi/tMp/FrcCjammpbbYZC95zbvTRipZdDpFI=;
 b=IohrGA3hYkAMFL5S947ShiVIYwGw4D7dHrhVwQZrwY+Yfavy9SqmwK3Typxm1AVo4ifMi7EwHeiw20Dbmhwl/vfaqWM6MBDTOW0Iwfaiz1Swo5godqotnQBGP1RPJbgF8hKgs0LEDI/IWgqIEPm8tywH6kLnV6C9ZwTu+Hl7whyHIBFoG1XxHfoeHYA8td0R1PyvAwJPsDzCSJwYtP8MkQ1mjzDQvCBIXe2dVR++Yj1pJI42CiZ9Ni6bUx6FdL4pgWc4OxmxX6OmBFnD3s7s0Bnorn6DNV/PVsKfNk5aHwH8tn4+petNb/OwSseoyUP2L/yW2N4jLA3CLrDKnazkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHEn/tSQi/tMp/FrcCjammpbbYZC95zbvTRipZdDpFI=;
 b=rwuTmtUED8UNGA+THpLevPwx4nMw0BVjPlyGw5bxbV+H5clld+QYneUhrBn6kyjmyz9lVcaapJoeVEVaHp9pFUB8fgMn0wJdJsjk5Ca+Nq92sjJetvDu4tYxJPyLM7vhBBRTVFhDL5Bx/JWBLRtDMi57qbShvjUYto3oLtGh3xo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7012.eurprd08.prod.outlook.com (2603:10a6:20b:34f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 11:00:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:00:46 +0000
Subject: Re: [PATCH 1/6] ratelimit: treat zero speed as unlimited
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19a53c3d-911a-3444-1d10-4771db9b70e4@virtuozzo.com>
Date: Mon, 10 May 2021 14:00:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:200:42::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4PR0701CA0023.eurprd07.prod.outlook.com (2603:10a6:200:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend
 Transport; Mon, 10 May 2021 11:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb422c3d-15ce-4998-96f5-08d913a2dd0b
X-MS-TrafficTypeDiagnostic: AS8PR08MB7012:
X-Microsoft-Antispam-PRVS: <AS8PR08MB7012916A3C84116BF43F0DD1C1549@AS8PR08MB7012.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BPEwFsSgQcOEfWqaQXz+JG5X/lGUBNZZrJXp/UjBxQUuGhIOljCGeLQoZ85LbyOFOJLrp2Q7B2vj+Pt0uhYhwJjTTK25qmQF53uUhtQsNwXlbympGvBfqlqQEV4Ao172h5Awclfa69j/LwT7pMUkloFT8vQ0NX/AYaoClGYFFjx7cde0aVAQxxJ/NrebHP8K+ZAB/e+v5NAxqAP55/GZWwah2NODp1ShfRQZdFK26RNXTh41bDAAJlzsxS+LQ4TZQ6LxCasv9EsZLKkwAuZu7+GgmCvQQ2ABspnaVquM/TG8aL6WdqBAc/Bci/z7AKTN7Kha5c0CBldiRLXrGNKscDUk8dBRAz/qY4AroGbEcpMSoHCBOvNZ7q7RNbI0f4koB+/IVVmy3dA4SLHWqiI3upOdRMK+8oGRpIHWOqeWvQwvp8suSSVg/t2p0LvToOkWLZ8HxUalidphQLEzcGvJjKyzxzA2IW02GNuBQZGjoX3OYU9YVIh9ieauEdT11pt9vk4aa6e6G5w0693TjfX2uhnB1hz48zoLQSHj4USnM6n1W7v5FlGfOfVlsqPL3ssCw+8gNg2JJBkbT4bwSLxKc5YheRIVBN5SHY2xenEQUf8otrewLuHVaeZYD5iw94iCUfZoEa6iBxxgpggBVZtpVapIRwJC5aFyZXUgWUQHXrjN9uhDqLLkVLqsU25mgU+ru48IDfEhDnLLSS4C8LVs0aOUOpUSt0gwz6ODzjEpS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(136003)(376002)(346002)(8676002)(5660300002)(36756003)(4326008)(66556008)(38100700002)(52116002)(186003)(83380400001)(16526019)(6486002)(66946007)(2906002)(66476007)(478600001)(54906003)(38350700002)(31686004)(316002)(956004)(26005)(31696002)(86362001)(2616005)(16576012)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzVCbHVqZDA3UktCRkdRTWNNVnRKQTJrNEJ2UzZ4L0VpanJGRDB6SmRwb3hr?=
 =?utf-8?B?aUNvZHNjS0VFTGxmS2c3Z3lOajZ3L2hBZkliQXUzQi9KY3lNMkwyYVRzL0Na?=
 =?utf-8?B?dy9JZ3Mwb3kxVlhELzNGaFI5Z20rZWhsTXRwRUZHR0VZS0UrQ2RYU1JlY0wv?=
 =?utf-8?B?ZDE3VWZDU2RBV0JWL24vTlVmOWlUK2Fla3EwVW8xK2M3QkVVMXI0V3RLdnVy?=
 =?utf-8?B?U3BpQmltVUFOU0VLSmIwZ3lBL1U0T0FtTUY5R2U5UVcwMEJYOHIwTFMzbHJu?=
 =?utf-8?B?RVpROWpOUDhxTnU1QWI5Snh1OHFQdmszWXFPL3JqRjhZd1grVFRrWDFuU2I4?=
 =?utf-8?B?a1R6UjEzbHFUZ2pJM2ZneWtWR1BaaWVnQUF3ekdkbXBSWXloSFY4N0lUWUht?=
 =?utf-8?B?b0E5TzNBQ1pVa0F2T1IvZE8yNnlWOUtLRmtHQ2x6dlJqYS9QRzBGbEtRbFNO?=
 =?utf-8?B?cEEzbFlwTUxHY1BMOStZN05HeS8vOWZRa3ltenhwMFRESU1Uemx6US9LYjQz?=
 =?utf-8?B?RXpXTnp0NW9zQnpBK0tCTFJKblFuMFh5ZFY4RHY3bFdBbFpQNzQ4NUcxMER6?=
 =?utf-8?B?cjg2WkFMbGo5QjA2azIyd3BWOGt4VEFEemh0S0tObzNtUFNCMzNaNStMNmh2?=
 =?utf-8?B?TjJ0bDZocmVETDNYSS9nZ3paV2tBOVllckdYZHV1bWRZaGpGak91RzZjcXQ1?=
 =?utf-8?B?WXNkZ3NqRXNseXdJVEFreW96NzlhK2FEdG00U3NBemJQTDN1Q2YwMXhpYnpI?=
 =?utf-8?B?Ry9oa1FiRUZOVmZlZC9HNlE0S09CL0V2bmIyWEF6c2lRWEhYN3l3VVd3Q2F5?=
 =?utf-8?B?VHVHeDhJS0NDNnZvNlNzVVRQdkRmR0dmemJ1Z29CNkpDNGtoS0hUT3IxR2g3?=
 =?utf-8?B?TXlxUFBnUUhCVTAxVWo4NEJwNlhGaWlvMlhBQkdMa1lHUHEzQm1XMUxSR2Qx?=
 =?utf-8?B?Skd0RGVpa2M3SFFURVVLazh5TmlhbDM1MFM1dVFmMmFHME1rVnJ1dG5xNHI4?=
 =?utf-8?B?R0NnZm1PVkMyTStBUml0WFFuOVJqWmhleVVRQm1BQVRvbjg0cXJFckVzajhZ?=
 =?utf-8?B?TDJ5TG42R2xrcXVVczRtdlp3UVVzNDBHbDFzTGZOWG1jSEJSS1lCQWdFU0Fr?=
 =?utf-8?B?ZlFkVnhkR045ZWtEcGFQbGNMdEJVcHBqeDM5Z0s4OUxLVkZPL0U0OHV1bThF?=
 =?utf-8?B?Vm5MWnMyOGg2TlJOYXRPa0VPbkpzeEQ4eFhISzFDcFFId1FmbXJ4bUQyUTJo?=
 =?utf-8?B?MnV5UmdxaEpWbDVLK1FONy95TGJFOVI5ZktuZ0Vudmp0eHcwY1krTWtFSWZJ?=
 =?utf-8?B?eXdXRHFNODQ1Y0NWQ2Q2djJ6RitLVysyU3NaUm5DeThDZTNyQ0dsd3JreFY3?=
 =?utf-8?B?ZE9lSHFUNG9WaG1HZmdOM0p1enpWaGZ0eVJKTUR0bFMyNkVsUTZBdTBzN2NB?=
 =?utf-8?B?ZzY3QVMxMmJxQldTbE9WVDZuNlR2dmpuRmFZR2hiRmhJdHA5VHFpUzhuUTM0?=
 =?utf-8?B?b0pRZTd4M04vM1p3TjR6T2l6Z00yUm9oLzhHQ1dOaEZJemw1bDBOeXpJbm5D?=
 =?utf-8?B?amt3U2NzV2hjOWJYV0F2YWtFVlFYT1BQbHFEc1kvSVhRMExWQnNsUDNLeVNz?=
 =?utf-8?B?MExEV3A5U1dnU3pyM0gwU3hWZEduRmVzWll2N2JTQ1dMTnlkd3pMN0h1dzA1?=
 =?utf-8?B?dCtERXc4a3BpZW5Nb0t5OGQ5d29yUkU0N1dLVEZHWDhrT1pKeE9RczJpOVlI?=
 =?utf-8?Q?CFrRPjkRTndWy3xqTrAlYmcFKMXB/zWH9TfEtcN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb422c3d-15ce-4998-96f5-08d913a2dd0b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:00:46.4805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xp5THO+vrOVWK0swjyGDo5ObKM9HePa43MuDxkItsNK6MNcDAfAZOj/O/XrKCst7fKvFUn0T0tdofzXrBNdJwyRu5yEIdL+sl5QljxwHt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7012
Received-SPF: pass client-ip=40.107.21.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Both users of RateLimit, block-copy.c and blockjob.c, treat
> a speed of zero as unlimited, while RateLimit treats it as
> "as slow as possible".  The latter is nicer from the code
> point of view but pretty useless, so disable rate limiting
> if a speed of zero is provided.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   include/qemu/ratelimit.h | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
> index 003ea6d5a3..48bf59e857 100644
> --- a/include/qemu/ratelimit.h
> +++ b/include/qemu/ratelimit.h
> @@ -43,7 +43,11 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
>       double delay_slices;
>   
>       QEMU_LOCK_GUARD(&limit->lock);
> -    assert(limit->slice_quota && limit->slice_ns);
> +    if (!limit->slice_quota) {
> +        /* Throttling disabled.  */
> +        return 0;
> +    }
> +    assert(limit->slice_ns);
>   
>       if (limit->slice_end_time < now) {
>           /* Previous, possibly extended, time slice finished; reset the
> @@ -83,7 +87,11 @@ static inline void ratelimit_set_speed(RateLimit *limit, uint64_t speed,
>   {
>       QEMU_LOCK_GUARD(&limit->lock);
>       limit->slice_ns = slice_ns;
> -    limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
> +    if (speed == 0) {
> +        limit->slice_quota = 0;
> +    } else {
> +        limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
> +    }
>   }
>   
>   #endif
> 


-- 
Best regards,
Vladimir

