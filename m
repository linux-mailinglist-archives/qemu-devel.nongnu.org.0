Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D33ADB6C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:55:13 +0200 (CEST)
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lug7b-00062Z-UG
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lug6T-0005Lw-CB; Sat, 19 Jun 2021 14:54:01 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:36242 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lug6Q-0001Ag-9u; Sat, 19 Jun 2021 14:54:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbMQ4NhQQjwn1oVJMB0xMSdUpmu9WmeF1p7477qLP8jyq0ZWL/vTGuBXeIHJ7drBt2UXsRIvOu4G+l/pdRt/ygCM6xag26LT7Cutug/fbaNdnBNuFJYloODzZyDQeppn2VriJSO2UBSZ51tPxqSHJ6LQeIRMdstnGLHCYoGZlMo+sdzHT+zwAASFsdfjzUAX2TEf7Gz8DVNnhOATPAD7RdVwifVpnylclH2yAtolCgsRXQuU+tHBYKvkirdkTu2qhUkvk+mlvgRI+jateuqJs9ap0/bZv6OsTBNYmrKV4o2UX+yG3KgwTKxj+3QgR9gn2MDNWf8KAV1laeejUHtScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9cNiabJMExa5AjpjSUqgbT0lXVoxj8ESVtdwUdq8Y4=;
 b=l3JOaLMxv2K+F/1iR5IpIpwnnNf7iLQ6v0kxSeiF4xVQpzPbreZNxTjnc3ZjPqFQUx3CYy3qa0eoeQD3UNGBvy+U8w9VxPoQ4xZJIuNZr2rOFoplgqJQ0f/V0op4GlnyUHI3R07YHucV6CTXYetfFqUJFDWEGguP0HV2oFhF3AOxVHXKdegGC5SpqMERxc5YW6xSLZ8b6gn92yWqRrEyB/vU+C2RIsxIlkl4QsmAvV7EHKnKrfR6Lr86zU4nSqAR9pzsMdASP+1K0Y52hcjIWGUzC36++f8wRXgS5QORHoiPq39alvyBaWxcXMMFSIe6ppw542//ANQ8Y3mqrAOVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9cNiabJMExa5AjpjSUqgbT0lXVoxj8ESVtdwUdq8Y4=;
 b=q6E5c0D61hvCLqPMNNqMpNa9tp+aRqLZCZkLviet3S7HckO/FoyQGbBGDCuyjBz2S5ClvsUjEZearQ34RSaJbxTsRc7b0GidJj++9STq5M0aJxAR1827CnzXutLzc5BAig/j8p6Nu9aXCroz3hwVMU3NYyWAcN6BnAa/ZozsgB0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3093.eurprd08.prod.outlook.com (2603:10a6:209:41::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 18:53:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 18:53:53 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <47ed70d3-dfac-089e-3da0-e50455c4d0bb@virtuozzo.com>
Date: Sat, 19 Jun 2021 21:53:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR02CA0092.eurprd02.prod.outlook.com
 (2603:10a6:7:29::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR02CA0092.eurprd02.prod.outlook.com (2603:10a6:7:29::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Sat, 19 Jun 2021 18:53:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee63666-2e45-4667-154a-08d9335395b5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3093:
X-Microsoft-Antispam-PRVS: <AM6PR08MB309315741349D76885AA4C1EC10C9@AM6PR08MB3093.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpEOH6LGtT5k7PzbB9vFFVFYuSFx44PJgzhakjm5mtqWUjjm97Aq7o6wNpXxyzJTeb77kjlMMuoS/PtXN9rs9OknhONKZ5aMH0t3FiFpdgeV3S+5pnPhKKzLm+KyIuu4RmHXJUHayAT4Y6iLYQNm4LuR+BZhQFuq7jB2xZtVQP38Pcc1PXEua9Uix+wZ70pYXo/48uBFvtBaDYUr+hsstrMb8S7sqa2U4oAj6GArUYbn/5Swl6eXs3U3TeQOd0FpxbCM4Q/+dTdBIA9A47yITh8MGwYYScOf9gi1mITCDoWI120CLj+reGjxwCkBLasb5Of6kWbkbsRec4EoqIE2R68A3LH8rWeJtZNOcL43lCHjejhjn3rZjNow/3S+8ex1Td44NyDFRiaBk1aOMTl0qtiEQKFWcnLi/SB2ZJiccRaUxqzTBjfpRdPie2tRf6vQaBbpV+cay6z5ohUCn2lw95ZN/u1mblPy4IolYthbeX7ogkehIrMbp7GpksCNXXb0AcGFtMaqB2dfFjpckxdekaJCaxAZvHiqa806HoylzNV2rsRqr/TsabpToOtcTf9fG0KOoFPNfVVQQ536hQeHGRD865dzQSgvqUxZ6G1WZZyn7s+BaOjXj4/498O3Kj4KBrNJlzu3lV7VV2IfvP115wmOZv/B9GJbIaf/fKAdPw5GlSqxDUUWUKAsLgE+0gZ/cWCwF5BZHlYvLNnq6ZQbReOU/pFs7TxxVp2sp6QThlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(86362001)(186003)(38350700002)(16526019)(26005)(36756003)(66946007)(38100700002)(2906002)(31686004)(8936002)(66476007)(66556008)(52116002)(31696002)(5660300002)(54906003)(16576012)(478600001)(316002)(6486002)(83380400001)(2616005)(8676002)(4326008)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVXTktvL0QxQmVnblVkaVRTZm1OMHd3djM0d0o1MExVbER3dmlqNEd1K0RI?=
 =?utf-8?B?Zkw2M1BqRUY1VVoxTFVBMVNIN0RqNiswckNxcDMraU9OVktXY0w1S2h6WWU5?=
 =?utf-8?B?cWpnL3hzTVlNVkJKSzZBdjRneVladzdDejUxWGtlNHhCM05oaUJ5ZCtQY1RB?=
 =?utf-8?B?Q3dFekhDRnlxTnZkWitiNmFpbk1nbXpVNkxuYnBrbXc4T1dKWWllQ2JIYWhK?=
 =?utf-8?B?dVp5OTZWby9aTEpXSHdJbFU5ZzFKQVM2S2FKQ2o1d1BnUmcvbVhtVzU0U05M?=
 =?utf-8?B?RGhRRzJRamh2YU1vd0lQTDh5S3FWYURYUXlyOTA1ZUsrSEhrYmFuNTdHeGxV?=
 =?utf-8?B?aDVBd0ZnMjQwNXlLOWFzSHZWelk0bTdmVitJeFRJemJ4R3l6eVNDQmt3SnQz?=
 =?utf-8?B?NVlqbERKeWdxNmliWFptY1ZsNFFIeFBEVXhqMnNHVmVhRjg2cTJiSmRremhC?=
 =?utf-8?B?UjNITnNGNGttZkdwUXZqV1d6VzZZQUx0UmpUTVRYVWhGb2ZrMU40bmZ5Y0Mw?=
 =?utf-8?B?ZGZIZWdjZTBJQUtIa0xpcTFNKzdKNm1Wb1lTTktpRHNZWDNtNUlmMWRZR2xB?=
 =?utf-8?B?cUFqQitXWjNDZWJVRXdaSFRGVmhMdllwWXJTMmVwWlJlWHZhZS9pN2RFamMy?=
 =?utf-8?B?UHhzZ1ZGdEMyUm9QbWM0eGFDSkw5M3hXSk5OczBoY0JxUExpWDFqOHhYUDFD?=
 =?utf-8?B?MHFaeEtTMkxkSUlHSTVabDM1MXhBN09SU2pVdG5MbnB2L2V6UjFpSUdodEQ5?=
 =?utf-8?B?S2MrWGZRbFVOanRSaCtLclJRb09zQjBXRUtWSXNDVEZiSy8wVXFrbDU4UWh3?=
 =?utf-8?B?MTFHWU0zRW9JME03ZGFVS1VrMG1wcTRGMEJQdWp1azNjVzZQWVUxNCtCdUQ5?=
 =?utf-8?B?amdiK1pXdU96S3htSEdycVZsazZrYzRnOHI3Wk5pblN6WExjMk15TGpzVUp6?=
 =?utf-8?B?VG1FMVJBdm9kbFBnNFBWYWYvU3NyMXpoWDUwaUR5aW9GS0RuY3o4ZXR0U01D?=
 =?utf-8?B?UDhIWHJRdy9KNnQxRS9QcGhTQzBSSDVDaFkzZ1pFS29OdE90TFdDQjRZMEJX?=
 =?utf-8?B?dkZJcG5kLzZwS01HQzExcy94bEJGOEl2TG1qWkpKT3F5SElFUXNMLzNuYldu?=
 =?utf-8?B?dTlQREJoWW05WkNmTkFoamcxbGNjMlk1UVZnMEdXMWlCQS9uS2YrbXZDM1BD?=
 =?utf-8?B?QnhBbjIxTFhsR0ZSZ0U5dHJzbEpIMUZMR1hTMmV6eXltZmFjYTRwNGxHOGNo?=
 =?utf-8?B?Z1V4TUxqYXhsdWRUTTZNVXM1OXBCZW9mQkk0NUVXNEZvK1JvVnRFaStuMUU1?=
 =?utf-8?B?cUkzVWY1VHVBUjYzeE5xdmprdWIwd2dxckhyS2owelBLL3pwV3p1a3o2MEJG?=
 =?utf-8?B?OXBtMlFvWTVxaC9IbkRUMUxLL3JkanZsdTd4blhaRlRIcDQ4TExHNDVvM0tv?=
 =?utf-8?B?WG4rYWNmamV4b1pBNk03dXVnZmZyalRyUENuL2E3blJjZmFia2RRZ0hWTGJT?=
 =?utf-8?B?c29qQ0R5SjdwV2hHUms1cEJBOWpkQ3lMZE9aeUdhM08vaTM1UForUWJNK3BD?=
 =?utf-8?B?Q0d5K1BFcWFEa1J0UEtwQU1rdEt2RFpZbmw5ZjM2VmhNdkNkZmFSVVl3UXNr?=
 =?utf-8?B?UmlEbVZZZ2VHMmNIZVN0K0llclRMa0Q4Z1dteXpjdUdhbERCdko0ck9BYlkx?=
 =?utf-8?B?bE9YRmVpQ0hBZkRFckJQUFk0Y1FtY21zTzJOd05vQXRiZk1GMFc0S2hxS2tF?=
 =?utf-8?Q?PG3PmqVwfdVL4G30UvnH1UAs/TPr+du4scUPYso?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee63666-2e45-4667-154a-08d9335395b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 18:53:53.7337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XYF9IJI5iLpVqIK3cknGcF5MZhIp3YPYoRwvNTXgPQ+05ARrt3rGbhvJUugKR7/r7Y8d9u7/UuJMF023d+65rq2axnqVvbs+ip6Uf9hpZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3093
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>       /* Coroutine where async block-copy is running */
>       Coroutine *co;
>   
> -    /* To reference all call states from BlockCopyState */
> -    QLIST_ENTRY(BlockCopyCallState) list;
> -
>       /* State */
> -    int ret;
>       bool finished;
> -    QemuCoSleep sleep;
> -    bool cancelled;
> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
> +
> +    /* To reference all call states from BlockCopyState */
> +    QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* OUT parameters */
> +    bool cancelled;
>       bool error_is_read;
> +    int ret;

Hmm, about that. Is @ret an "OUT parameter"? Yes it is.

But someone may think, that out parameters doesn't need locking like "State" parameters (otherwise, what is the difference for the person who read these comments?). But that is wrong. And ret is modified under mutex for reason.

Actually, the full description of "ret" field usage may look as follows:

Set concurrently by tasks under mutex. Only set once by first failed task (and untouched if no task failed).
After finish (if call_state->finished is true) not modified anymore and may be read safely without mutex.

So, before finished, ret is a kind of "State" too: it is both read and written by tasks.

This shows to me that dividing fields into "IN", "State" and "OUT", doesn't really help here. In this series we use different policies of concurrent access to fields: some are accessed only under mutex, other has more complex usage scenario (like this @ret), some needs atomic access.

-- 
Best regards,
Vladimir

