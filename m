Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB623307C50
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:25:48 +0100 (CET)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5B3E-0000iQ-19
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Ayw-000645-6o; Thu, 28 Jan 2021 12:21:22 -0500
Received: from mail-eopbgr10116.outbound.protection.outlook.com
 ([40.107.1.116]:5014 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Ays-0000TB-CC; Thu, 28 Jan 2021 12:21:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5BpqJ+HI7gKlIfwRDa6xzUTYEvg1w/8ORRLvCM58AKVtnYzHISrKU1egxVhDs0OchkfjgHzPrxIoCdb/HsB2KTBs/9EeFP6gGKimoXHiYsksiQC/RVxZTRwS+tHapMs1tNhyEaFFNP5IhxvqX9MAFQAObtZ3pTEvroyn3ts9jp2wFeQ/iYfEh5/Sc599Z/GVLVHFZio2S4V+Nz7TOyygvXwk7NGF3E5qYCgowr3crKpM4ZMQt2uj/921C4KM8bbZsdVwd5xjOz8uuUWYyhle7l9zAYMAmt5lOA1wEf1fL9OlxexNPYY1QYZsCUh63cz6Hu8HL5Qkr2CN7TqK0lBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV4Mq4qFLdFXAWcsAsyRuCKag6KZybpGZM57RyQg8sA=;
 b=LRAUGGxqa9z9ozzeTrxZkdH6HCZOAHyFiNdi3TZ+7M5uJCG8GggQ+qEfzo92T78LbxoIkP6iMfWefpSraqg1a1P01rj14ddeyoqDC3actmpg6Npd7Q8uiaYZFoJPj0b1RrNnkDvvVEzwqqnXyaimvwwsrBgD701GFdkDT5WJ0B+/LbLz2TFhnKDRKtJGivaayDjPL+JOE5zOzWqSTF2pdUflPcuOlzr2yOYRliCdDWRI/N91iQwDuschHJrUXOu9/ZpvjjBzZnRHWMrNklGthgr/bdVJzStv6c7SPgaWvAKvYbUv1RzlyAyLVx8dLy0ML+K6CJGgSy7e7c+RI2MpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV4Mq4qFLdFXAWcsAsyRuCKag6KZybpGZM57RyQg8sA=;
 b=dK9LmLtovbXtctwxa3CQdQA3qLB5buO9I9GmRRIjNsgH1fAUa7HarH+2rDJr9HUWNHT1Ut9UfuAPJYvY1QeMq97/ckZgYqwnsn4Am1IBhWP9gLdgywDgLIY7J7PMWAu/fj3dq2A6lTlDOWGFmolNLf2og4UDtBkom55FzP5cNc8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Thu, 28 Jan
 2021 17:21:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 17:21:14 +0000
Subject: Re: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
To: "Denis V. Lunev" <den@openvz.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20210128171313.2210947-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a88ad335-05b1-b720-5689-1c477bd55d1f@virtuozzo.com>
Date: Thu, 28 Jan 2021 20:21:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128171313.2210947-1-den@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM3PR05CA0126.eurprd05.prod.outlook.com
 (2603:10a6:207:2::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.105) by
 AM3PR05CA0126.eurprd05.prod.outlook.com (2603:10a6:207:2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 17:21:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 037d4960-2348-4b80-6230-08d8c3b11d5d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551FCD06E1AA8C37231B618C1BA9@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABPGp7y+wH0jQFJtPTZeoFGJ6Yjj6EL2K7XZ1Y0QiCWhqGILVOHHAvZW8PhhkS91r+EGNayK5+QVYLXSzCpH+8EE/6TAFAmMB3cn8vvzTQpVbNXd8W2oZBKMUKcq/r15mKLINxD4h1EKle3cHiRp8xcmfYIv+NFnBT28+SaaPwePH13oqmmN/lTRaT7JAqPFl19TnBubW2/k8KdiaIrUu79lvtyv7DuuslsPaJaEvp2UST/fMqkR94PjQ2zsGEPJWj0Y8lZC2D7GfgM0K+WoMlN5vcdE1I0AAQRm21KMUYGHX13g01aVA+GahXJs7IVZX58RtUi4FRRYYlBE4oxWfHm5kCb1JYOcbFA60GERxQWU43HDknsc2vyVVxjT5cqpcdkRW/D4l06fstKTRLm5CFoItzrmoWVMhW2eW/FEa906ij/eT+hmEz/seXtKhw5g2KvrG3SV+oNZnD9nRFiIRrdUJ4oE15BqZF9Iclr71aJtDhAWe3eQD4glshGEf/Jt9SzDjnU9o8NuQg++4+iLqjCpl4OGpELkF0yQCxtt7wjN9CBlcqONfuAiv7M1OOABW6KZuq35+njslWxeuFVHeDaTK9RrsYcAyem8Awot9cU1r6qu4KxQxD4Q3vHrXMOx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39850400004)(376002)(396003)(31696002)(31686004)(186003)(8936002)(2906002)(16576012)(83380400001)(956004)(66476007)(2616005)(6486002)(16526019)(26005)(4326008)(8676002)(316002)(36756003)(66946007)(5660300002)(86362001)(52116002)(478600001)(66556008)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTY3TE5hbXUzbEdKZGJVdmNzZytYT2xtV2JMWW1IMEF3a2N6L1p0VTlZRytv?=
 =?utf-8?B?OUcyTVFac1Z3dnZiUmZ3amRWc2JtNXI1UXNYdE0wSGExNVkrdUhZWEhkRjZv?=
 =?utf-8?B?SWZxZTF1RnZ6ZU5ML2QrRlpFQ1QxZWNTMGhBT1JEOFZIdkpwOUNVL052MkJh?=
 =?utf-8?B?b2RYaFVOdnVid2EzY29hdWZVOU94cUk3NENvS1JwVHk5REIxR1VseFV2eklU?=
 =?utf-8?B?OGpsTkE2ZlEzTGdGZm5EazJXZUtTeVBiMjhQRUJuZXNaWjNCRUZxTnJ1eUM0?=
 =?utf-8?B?Q3h1WE1Zd1NGaFUzTjd2SVJSRVRxVVRNWjNtTHdaclUwc3liQUxxbjF3TlQ1?=
 =?utf-8?B?M3ZNejd1K1ZScjRxNHVGVERnNjNLMDdjckQxOHloemY4Mkg0dmd2UllkY0Nj?=
 =?utf-8?B?SjZOdHg1MjN6YkJ2SVRaazBudkdaZTVzdkVMdjY1dklBeWs4M0daUTNudUlz?=
 =?utf-8?B?VUEwQWlrbUplWjh3cGZQV1lRRnRUSlpkWExZc0k3VnFvcWxDSitQUmFWV2dE?=
 =?utf-8?B?YXdtMkFhM2l6VEN4L2pVY1BVeE9VNGROVFhiUWpLOWRLcGFDRGZtQWNZZDVI?=
 =?utf-8?B?VFJvWFF2SXFuYmVlKzBnejVJNDJTZm9FQkhvcWFLb0tJd0tjYjZXZWtxSU5G?=
 =?utf-8?B?MXZWaUFGcVJHSEcwUm5pNFloc2N0Q0NCMHJpSldZSkc1MW0wNXRDMVk0SENp?=
 =?utf-8?B?czZkTEFPeGpuNTBBVDdKQk5Sc1luRlJNN0xFTjhUaFBCL3ZwbUh2MUdvMGtN?=
 =?utf-8?B?YmE3UzJxZnV1eXQrNVp0SHNGcndTZnFWaVE5SG95NlRvRnJiRkFqc2Y4dWor?=
 =?utf-8?B?Y1kvTTNCMGtDRmphUEhPR1FPaEx5Q1hXbGpQV3V4NWRSTjlVQjNjMHJOeGtp?=
 =?utf-8?B?Nk90ZGVTSzN6UFM4T2E4TGZUenMyV0Vka3I4NFgxemNzRGtFZGgyN1AwMUlH?=
 =?utf-8?B?aUgrN1J6QjFsNUFOS3lOeWZhMEZzdVU2dldRYkpUaGd2V2hCNzRHU3FPRW9s?=
 =?utf-8?B?ajlSTWJ0QW8zUVl2YS9KdWdGNFp6TGl4N1YzaE9sYk45SjMzL0p5cDdIK3h4?=
 =?utf-8?B?OHdzNW10bHczUzF0VUY3T3EvUjNqeE95OHh4eTBNVTRRZWhNWG5McHJnNHdy?=
 =?utf-8?B?aFVnT0tudUthQkxqeHFrdjZ4SzdveXViN0Z5Q3VsdkJ2UzFaRk1PVjh0Mm51?=
 =?utf-8?B?TDl1T2lYWE9RejJ6RFlWSURpaW55T0MySXZYZVEzc1JQdkxVbTNCL25SQWUv?=
 =?utf-8?B?OXB4TmdlWnh3WlU2eWl2eVpLVnZmMDJCMmtEM2IyTzVNeE1uNjlWTXFFdUR1?=
 =?utf-8?B?Y1hPRmV4OVlITWhSRCtpd3NhenptdmRPNG93TW1PYUdlZUtCNkRKdnFPVEUv?=
 =?utf-8?B?UjBSMDVFOEF4d0VlVm1oYVVEbmFaMzA1SDRnRTBJeTQ5dllJNzc5VEdhZGx6?=
 =?utf-8?Q?18s6s9CT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037d4960-2348-4b80-6230-08d8c3b11d5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 17:21:14.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UmuwpcgeoPBtLN/co6Jsuru7e9sWB9KSBHNScOcdlBdFqNa5o7FiuiDfmuVL56rsDTiAaCSfCqOvLfUOYOm6N6AkvlfnOQnQi88cP5imGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.1.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 20:13, Denis V. Lunev wrote:
> Original specification says that l1 table size if 64 * l1_size, which
> is obviously wrong. The size of the l1 entry is 64 _bits_, not bytes.
> Thus 64 is to be replaces with 8 as specification says about bytes.
> 
> There is also minor tweak, field name is renamed from l1 to l1_table,
> which matches with the later text.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   docs/interop/parallels.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
> index e9271eba5d..f15bf35bd1 100644
> --- a/docs/interop/parallels.txt
> +++ b/docs/interop/parallels.txt
> @@ -208,7 +208,7 @@ of its data area are:
>     28 - 31:    l1_size
>                 The number of entries in the L1 table of the bitmap.
>   
> -  variable:   l1 (64 * l1_size bytes)
> +  variable:   l1_table (8 * l1_size bytes)
>                 L1 offset table (in bytes)

I don't remember why this "(in bytes)" is here.. What in bytes? L1 table size? But the described field is not L1 table size, but L1 table itself.. It's not in bytes, it's just L1 table :)

So, I'd also drop "(in bytes)" while being here. Or the whole line "L1 offset table (in bytes)" altogether.

>   
>   A dirty bitmap is stored using a one-level structure for the mapping to host
> 


-- 
Best regards,
Vladimir

