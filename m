Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C66B3D47
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:09:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paacP-0001WX-Co; Fri, 10 Mar 2023 06:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1paacN-0001W3-4K; Fri, 10 Mar 2023 06:08:59 -0500
Received: from mail-vi1eur02on20721.outbound.protection.outlook.com
 ([2a01:111:f400:fe16::721]
 helo=EUR02-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1paacK-0004z4-Rt; Fri, 10 Mar 2023 06:08:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5hMDupXWD07URJZdB3WGzy4yebK9m1PsojqWxsja+C+zsynDddH6FvJ3KjKGEYrpbvRGBCMmYLIb7/zWj7LNUQnkb1ZrhLEYQBKyUrkngPLdWuXKIpQ31VArM07qA2ginRzXz5vVu7H+eKgJKh5MSg9bq4qTIu4aBKM49pATuQtPZNoRuSzw5uvE2SdJlQCnUlwQTBzyLzEciSkL5lFE18oh9edwmVVCgB5ut3K0b5CC2vspAt2aH21DmgjOwWfCBzxxItm0GlMJXUOj2HznixbAHytibYYyLnwGGQi17JX25JeO00VK1tmboNyQurWzxI47b/3o4DEf5UI2OTu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncbsHdfBTX0mkXtccMNsOAcHNEfzR38BFOOx5gXZG4c=;
 b=epl8UC11Yk8sYhvP1krQE8b2whCqf2TTlDPmbZBTMzsc53l5zUS1nB0JYVQeMxSIt8RLjkJ2fAWrfOiHt1DHgFdh9TdUab8ZCouqKmpfXJM8z+NyCcw3OvgoBfUD2wDkkH7kW3FeMzvcjni0fLPWIwkuC3Ariila2wGoxVg+nEf1XA2NNZ466c8ezDgmDczQWdwCHfsZ3o3hr22Fwb/3pwO5vECLZRU3ydndUDvOvAM5w9wZMJpkLeLxmZpOTuZEXckUFus1j9lahaVM+xemfpyDQzEonDUJiUWoI/guYL7lxUKVfhBASNW1qBDRdPUZhKwrSdKZGC26fxiwzAHn6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncbsHdfBTX0mkXtccMNsOAcHNEfzR38BFOOx5gXZG4c=;
 b=VKs3KOSmdPfV5WLMKaEMtZis8cNllFEGx///XfXOMDFXMidMGGnaLmk3zstg/5BZNa3PYErhMfmNnwEyq2HvD3ZAp/+lAyGeQQ/1+JZORmnlMdqgB8XEsMGgznkLXwPtF6DgT4XPl/TO8/A1zvSiRVxR1f1+TXvGbS1q/5UTaKZZisg/tY3PQOwP0yfGnAgTHfcED9qYYn9i59B/v1ovcHoUnKuWx5qWILO2bknZ2yI66McIc6tjgeJDwHYUAg5w91mlgRWabtGtT/PFng6K5hEB0R0wkXHM0/xVTPNNqZSN6Z5pkPoPYpe1IJPl6Sn5ud/wfj4T1WfU9LLzaDid0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB7353.eurprd08.prod.outlook.com (2603:10a6:20b:444::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Fri, 10 Mar
 2023 11:08:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::f7f7:23ec:9f02:a18b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::f7f7:23ec:9f02:a18b%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 11:08:50 +0000
Message-ID: <13f924cc-a47d-e117-4993-d223937744a5@virtuozzo.com>
Date: Fri, 10 Mar 2023 12:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 07/12] parallels: Move check of cluster outside image
 to a separate function
To: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-8-alexander.ivanov@virtuozzo.com>
 <fdc04f4c-b921-0d58-8b0a-8def13220847@redhat.com>
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <fdc04f4c-b921-0d58-8b0a-8def13220847@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0290.eurprd07.prod.outlook.com
 (2603:10a6:800:130::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 965cc184-a54e-4cd3-81d1-08db2157d3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71THkx0ZcoMeF8J/Cayh3lveaXkD/F5TKKxTwWff0Htntz1E2xKH5O/Y8m/MDpIht89o4r7xlkWrUb1dPFl4u7nXm3HcGP3yl6pSPYFHXzZ4RNgOIVSHNb8dDUQXaj/FRkkK+fWvHjkNUyPxepyQsIZFCxvA0x5XZFTB8XhkHujHLj+hM/+O7wiq0BJN4zQWNj/RtjisYuvcAtECTAwquHC8AHhT2mDAGF/vvDnimrIDaudkywPlNMmozUojG1BNxNz1IB/OvowhSpnY8ziDOcL4cE0A+V/MhBqgRK3w1SSiqdVUpINCkBlj1mSldiucpHHSDVlm5hpMJtftQ88cdDTa8Ub2sge1q9VzZpygV49pTtWsRzvWrgcPPRmaBdtJWrhZ6flb7kL99k92gRT3g3gkJsmc04pGWmqPCh/qoKQoq+B+fDMVMgOtY4nsN/CPZ5A0xt0sOXpFAdAtAdP23TRk6go+EhJXc2NRvVg8td6sBKnfIw0egauaUYvUMqvyGRnpzTR1MpZ5tSYfxKJY/H9qySbd9HmdlJqOGknoX1U5Z54snNZvgsd4z4dEa0hQqbOolewSKH5CEABXMjTQHESqUha1l8ubEcNJIWzPid2OsIAXuOPsdJjFaalVadh+6Zvc2VkoUwE5zWPgH3ObTw5TDlFFMd7Gu4CTAc2b2OvYSAaJKEkC8eCkIP3p/Tb7NbjiD7q2lGr6hFfL8Z3SCTw2cPbuMtTZXFB7G37h3uY0/IVWE7guFUf+Z42bTnzxWapq4+tWWQx0UK0rKz6qeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(396003)(346002)(136003)(366004)(376002)(451199018)(6486002)(36756003)(66946007)(4326008)(66476007)(8676002)(8936002)(66556008)(44832011)(41300700001)(5660300002)(2906002)(31696002)(86362001)(38100700002)(38350700002)(26005)(6512007)(6506007)(6666004)(316002)(52116002)(478600001)(2616005)(53546011)(31686004)(186003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZhSTFhZGlPUElkaGpOYlhOWmlDdzJacXlWZmhSaXVXSmxWZDI1L0FhTlZu?=
 =?utf-8?B?MGh4NnFRUmgwQVFWdmxxb252N3ZLMXBxd2hhb0kzMWdZamcycitVVDhhbDVu?=
 =?utf-8?B?RUlTazF5c3c5eDU5RFhPcW5pWWkvTjFJQmRxcjBaalhPekY1VVhPakhTTUFE?=
 =?utf-8?B?ekFwYUdna2pheXZMNm1wVGVobHlhSWYwMzJXNFVMcmtuTFU2Z29tc051SjZ0?=
 =?utf-8?B?a1daT3Y4bmoxWHp3TzRKTWVXamJ1Sms4eDhSNU56d3B1VHMvaXNDWGREb0pS?=
 =?utf-8?B?LzJoQk9lZUlSZmNYMTRaNkU1UUFPcEFKUTFJN2EvM1ZEMk9CTUpXQ0gzU2NV?=
 =?utf-8?B?TWduZG9OMmxQUHFHZ3BMbm52UUJKNXoxTkQxKzkydnJQWStUa0w2czJtNDQ4?=
 =?utf-8?B?YmkwcVJMMDJiM1EwbTQrZHVGMEdhTHQwbWFaSmFUSE1uQ0U3WkRmWEpoaGFH?=
 =?utf-8?B?b0EyU0xoaVNZZmVwNkNqS2dxODMvQnZiV2hMeGpPdjJzNWFQNjJKWng2clFx?=
 =?utf-8?B?a0ZXQmhSb3lDR3VET0IyS1dOekdYR24yVzdxQ3ZwT1JXTERHZ0lQTzgwZ1hL?=
 =?utf-8?B?SFZ0TXlYajZmNm84VlBhR1J1emN4VlMzSHpQZEJQZ2tyWnp6amJzTGs1S25q?=
 =?utf-8?B?bU52NU1TY2FLTitVNHFhZ2tyOHYxRDBvQ01rclpRbkVwcXNNMEhVSEExUjNJ?=
 =?utf-8?B?Rit1SzN5WHZwQjJEZjRHZGhXOWdSSjkwMTkwTUZUdy9zRmZxRUxyamVzdmRB?=
 =?utf-8?B?d1c5YzRtZEVxVjhPTFQrRmxpblJnY3R2T2xxeEswQUpNVmVPZ296SE5aU2tJ?=
 =?utf-8?B?enN4QjdqVXV1VitnNVRnNGZnKzVYOFFHQnJ3MWZ2NlpuVFJVVnpCVUIwci9n?=
 =?utf-8?B?VDYwOFluMFhYRFd3dkd6TVlqRXNRY21sV0ttcnJzTE0wM3VJd0kvcUoyNW9H?=
 =?utf-8?B?ZjgxMHViWjVGWDJXa2RJMDBMa2psRXhUUHI0ZHgvRmV1aFAxL2k4WHVrZGhx?=
 =?utf-8?B?Q3BnRk4xSjdiSTNvNi8zMFQ4Wi94N2lCZzVYMUFMbjRCNXpmZE1ueGxIZnB4?=
 =?utf-8?B?YmdONmp1N2x6YzBsaVZhVlgzSjRjTU5naWRrczlveHZiMVk5V3ptTUoxZ1Nz?=
 =?utf-8?B?OHRLQkxmTWVBdTRVM2k5SmtCNnRZQ2NSZDAxN1pBaXRCNXI5cW1HM0d2N3V3?=
 =?utf-8?B?WXQxTGFqQmNyR20yanpwcmhlT1ZZdGwxaHJiMk9UZDVQekg4U215THFORit2?=
 =?utf-8?B?c2p2bDg5Qk1YeGRPcW1VR2VPVi96bGNSRnFkV2k5UXVXRys0OW02enVZR21j?=
 =?utf-8?B?VExYTmVhdW5qK0N1cUx6WTY3Y2ExYXgxUzlBL1JiTjByV0VTdmNrUjlHbk1n?=
 =?utf-8?B?b1FLc3JwTmk4V29URkFNakRKUnEySmtDRnFJWU54QTg1ajA5akxUb2VhaWFS?=
 =?utf-8?B?ZjV6S2g2c1VRMXJkdm0wYUdpVFN2VGZQRFVidk53ZHBuK0JrQ2lnMWN1VEcr?=
 =?utf-8?B?NElkS0tEN0NrRTIxeFJ6aFFTYUQ3Q043cXdMTnlhaGg3eDMvUVJSK25uVnRv?=
 =?utf-8?B?aDhRY2wzajVudjcwQW5kV3liOHRVSzRaYzJrWnUyaGlBZm1NdnhWR0hhRUxC?=
 =?utf-8?B?eFNsWWN0TzJFSkJHK0V5QnhDaGJ1WXhhVGw1dUdGbXNocEp4YVZtM0lQamV4?=
 =?utf-8?B?UmxxVERhZ2J2WjZ1NlU3K0tnZm5LK2xqb1NQQlc1T001U1puOVkyUDlicU9W?=
 =?utf-8?B?eVlHVUVNVUZubTRjVE85ckVUUG16ZU82ZG5OTUowdXAvdTdNNmc2WGhYNVlq?=
 =?utf-8?B?M3ZUaFQ5d2ZjOFRmZ1RvdkVSSmYyZ1dPYTRuL2ErdzhaM25wVFA4UjVuYmtJ?=
 =?utf-8?B?TEhnZGY4VHZ4LytOZm9sOU1mV3B6ckY4Y0NVWGZjalVlVVR3aWpkV1hsbmZU?=
 =?utf-8?B?M29HbmFTa0JrTGpWYTExaEJqQ1kwVUxkaE82WU41alN4bmQvQnplL1p2NUNO?=
 =?utf-8?B?dEdIVUF4ZEdPK2UwaFZzeTd0djVsb1BBcGRTTWRzd0M0VThqcS80eDZ2SHpW?=
 =?utf-8?B?Um5QeGRyamZMTXpSZEhSTFR4VnhpUFZMQ01kdm5XckIza2dRSm1FVG8xRHBB?=
 =?utf-8?B?OGJmQnRoUEVSd2VnUER2TjJtY2NEdHVUWm44bFNhVTBUSUZCNnZRaXBWdk4y?=
 =?utf-8?Q?iA1cpBOm1cZGqmF7xKYk1/0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965cc184-a54e-4cd3-81d1-08db2157d3b7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 11:08:50.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RTiNQBZeNPLTeiYF8jhOI7AvMM43/4b6O02bGX/xx1R7ft7BIkXn0mc7pDgpS2InwED0i8WPqfRIL0dNFOdWAkjHAjdC0MSgpYfZ64zj7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7353
Received-SPF: pass client-ip=2a01:111:f400:fe16::721;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/7/23 13:17, Hanna Czenczek wrote:
> On 03.02.23 10:18, Alexander Ivanov wrote:
>> We will add more and more checks so we need a better code structure in
>> parallels_co_check. Let each check performs in a separate loop in a
>> separate helper.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>> ---
>>   block/parallels.c | 81 ++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 52 insertions(+), 29 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 02fbaee1f2..f9acee1fa8 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -438,14 +438,13 @@ static void 
>> parallels_check_unclean(BlockDriverState *bs,
>>       }
>>   }
>>   -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>> -                                           BdrvCheckResult *res,
>> -                                           BdrvCheckMode fix)
>> +static int parallels_check_outside_image(BlockDriverState *bs,
>> +                                         BdrvCheckResult *res,
>> +                                         BdrvCheckMode fix)
>
> I wonder, should we mark this function coroutine_fn?  And with the 
> graph lock changes that happened in the meantime, probably also 
> GRAPH_RDLOCK (because it’s calling bdrv_getlength()).
>
> Hanna
>
Thank you for your review.

It seems, parallels_collect_statistics(), parallels_check_unclean() and 
parallels_set_bat_entry() also should be marked as coroutine_fn, 
shouldn't they?

