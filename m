Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA847B170
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:42:58 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLkX-0001hU-Bt
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:42:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKJc-0006bz-D3; Mon, 20 Dec 2021 10:11:05 -0500
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:41319 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKJT-0001Rk-T9; Mon, 20 Dec 2021 10:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S08UGQyHDgQn9mF5LCgAPXRkGFPouWo0Vr1HIjiDQHVp3YwvxkYRPDZfgHI5W3TezQblLWWUlfi7Bq91lMMkPUFhZmmXGqA2nAfF2hBYtEvosicBy62Hl9AQ4bMB+PkcM1HLcqh4bWAlbnxMSXkUCo8azuNaySYxJk1X85PCguDt3YWeicSBbYSEDY4Q3jtgqLOxGCT1bAbS1XXh+Qfyc35cmvfJcgsYu8G0mLlsTJRb804JceeC3eaDaTP2LxMk/TV9DUSccAfc+fuoP8YFBeShhubFLUovD8OFbKmexCvRwdCFnH4letNC7HejaW11ugv9GPIQu+cgSfs3IOhV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2k7bduGinPNeJrw0gNN5pr/eaU3r/Iommy/cnI2Iht4=;
 b=TZLJrXO0OtYuqkZQm1H/Ahkhvnl2VGokAl+2vMuf+bEMpTLhNv5Ftyvibift2MHa3aFLVpCM0vbEQQkJvkC30nNRK3rB5eGUkpXaOPmQwBzlthjrxWV0vtvPN1JTNScILsAVgGolAcwHtyuY48JiRoC/7CmTv/biItoLypn863y2SZreXiimbbOHVwD2j+p7kQYcdWHvVqatea0CDNlVWM1RmdRzr1pwzk6KK4iCh27X+kf4b1XiMw9arzv1MAjcy/xvoNk+yCCaojSGglfPn8T4MWYirOWd0ff9JWsR6RBYfMMBgJEpXpxdH4ilXPyF2gkw3fTvQj+gLOP7fJZcjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k7bduGinPNeJrw0gNN5pr/eaU3r/Iommy/cnI2Iht4=;
 b=nGbECOS3lcbLN+ndk9D+SYJMitTgQKoV1jJ22G02AdiEyZRwe3hTVzuDfTMiP2DHb7gjqZW+DbCPhsp4JVYk+3TzUAYBnD4365xxwwKSXXXa9dzTwpV6W+zTYZnrvQ47gD88NwMRRtiQ1P1aFj+GsIRnmBwK069By1pt6LwghE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3650.eurprd08.prod.outlook.com (2603:10a6:208:da::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 10:47:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 20 Dec 2021
 10:47:04 +0000
Message-ID: <bed1cd66-2fe0-e619-fd08-d80dcafdd867@virtuozzo.com>
Date: Mon, 20 Dec 2021 13:47:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 05/14] block/mirror.c: use of job helpers in
 drivers to avoid TOC/TOU
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-6-eesposit@redhat.com>
 <e3d234fc-6937-61e0-c4d6-988196f16a09@virtuozzo.com>
 <67f2e473-b621-a57d-6c76-3235633649c5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <67f2e473-b621-a57d-6c76-3235633649c5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:92::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 20 Dec 2021 10:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e3bdceb-a2d9-4b07-a0e8-08d9c3a60fa9
X-MS-TrafficTypeDiagnostic: AM0PR08MB3650:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB36502A1DB348CBE679B6C115C17B9@AM0PR08MB3650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zmAcgVJX6kbt87HZXJriInsXbklxRLX5MI0qWeTA4RmbHntLtbUvoU4XEbAgdXSyHvhWSBJVY1LP5+NKPULy0htLzjjLHXdxD48JKXRgWBVdQoPiReHaRZF1K0s5bsCrJEExRaiQO4dmtumZCLv688yCrhloE588Cy7IJFEDswztZx4++GT8FidhQwcl+8D0OSC9fc5+WEgB8VlV4PYPEVGCbxWS5JMqpuMBw2s2RMXN8Rv9JIawmqHqtb/KjEVeUAVMk0pShs8UPAAB1nrWv2aMr8NJ7inOwdgEAR+ovT+24JZcTxdAPKV3f0bPyzH3RYrPNGG+l6/celfW5hLjswdfjyqyL2XcNDTwuN+Bn8BXZ9FNAOnoUtHVBcZTIvRNGq5bFgyaxYUSXce/BEfEpSDRvYefZQkq5R0uv7qpz/y44xNeHyAgHim8rEH0T9tfIg0ph8sXXWE7rfOK11LLMln7m4EhgiQnoXocyv20UqnoKd85ocPWn2fSRlnOajvkEvZO7FkYIahjG0VX45AxoXNuU5g4ZOQv7cc4EHXd/aqpcRyOEy9bZBWXbPW2mkR7nswh87QunWq+wnq5mfFlfffwvBeWjgdQsIPCKv/G3L94kAe1GfGFVcUbPvxQ/qU+3j9M96Wq11pxk4CPZRKX7eUCbJb5JphnC0ifpMUPeQInXLpEyDMH+j1Jner7ZMALmt1qDBWU19ldooI/5hrlwak4B+f+7xtcX4L56FVaII7gEXJYjtXwrX0xr1r4wiIJx+Lop65Gr5aMCdmvH21J1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(26005)(6486002)(186003)(16576012)(8936002)(66556008)(36756003)(54906003)(52116002)(66476007)(7416002)(66946007)(38100700002)(2906002)(38350700002)(83380400001)(53546011)(5660300002)(508600001)(4326008)(31686004)(31696002)(8676002)(86362001)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1XSktFbllTamF4dXFnQ2V3ait0S005OTcwZVp2TFZ4cS9qNjhseUlPR01T?=
 =?utf-8?B?SHAraGk5OHo4WVZxeDdmL0tVdU1IWTBuRmcvZmJnL2NNTC9FbVBMY2VJTWZn?=
 =?utf-8?B?WUN6SDhwcldUaUdVTElKcWNxSzVTZUgvZHNpdExTMnRsdmJ2VFNBdGF1L0pp?=
 =?utf-8?B?RE9hcVZNakJ5OU0yaGdiRXZ4TmZhQUJIQ3VxeDltVzVzc1NpNzRNak5VZEov?=
 =?utf-8?B?UlNmN0hGc0JjQ2FPZ0xScXdSSVhUQ1p6NmM0VGdNK00rQWdRNGF2Wi8yRjIr?=
 =?utf-8?B?dXB4VFh4SXlGOWFMQTVkeVczN1F1WXJuamNscVplYnI3WTNjd1BQMy9hcTd6?=
 =?utf-8?B?UmR4RjhwQndwcjRaVUlWTlArbnBrbmhUU1FLYWJiSVcxcEhZMjBqOGVIVzFr?=
 =?utf-8?B?V0Z1OXJqa2FVTlJWVC9IYlJSQ1l3dnVqeStYSkdHWEE2dE5WT0Urd2NVa3BR?=
 =?utf-8?B?M3lDdEJUSlNGMzBxTlBtQXRjd0NaU0Q3YmdXQUw3eUVXd2FhdHVITmxaK0o3?=
 =?utf-8?B?dFhSSFZVSUVlTE94KzcxUjFBanlxSERVSDNhNTljNVdoRXNGQWQwbjl3Q2Ji?=
 =?utf-8?B?UWtvNkRlQkt1azc3VE55UVUwaENKQnMwUmZIMzZqWjErcFRBenl3OFgzZDBW?=
 =?utf-8?B?NzdJTitrMUlrSG51eXI2L0wwZXJxZEV5R2hwU0tJQ1FTczFTT29SL3I3Mi9I?=
 =?utf-8?B?d0pMT1FmL3EyYTJwb3VmbnBVZDJkVTZpRm9XbGpxL3JIbzFzTnpoa1FVQXVQ?=
 =?utf-8?B?MUZaMzNzRWxnRkQyMk1pZFhGcmZua0VVUlkxcU8wd0M0MHh6YUNvWE4yUldo?=
 =?utf-8?B?QmgwQ2RzNVZpWnpSSmZMY0RZME02cHZVS01VUXIzQVlmZXY2VG1kQjczL3BL?=
 =?utf-8?B?cVl5amFHOUtuZWtXRUJ1R3JpUUNwSmU3TTZ4cnNSNDNNSzRPK2VnNXI2MndL?=
 =?utf-8?B?L1ZaK2JZVUh5emZicDdqRExJaEloK3kzOE5wYUhzMmZJZzB1WUFKZHRNTGNq?=
 =?utf-8?B?OWpneHpHSFNDSkYxMTJIZmFraHdXWlNvRkZ6a0Z5YWk5anFKSHZVWlY0YWdm?=
 =?utf-8?B?WDB2NXJkckxLTUx4S2JiU3ArbC9hclF2UEJJWElzRTE1ZzBYRVFzT3QwNUJz?=
 =?utf-8?B?V1BvUEdHcDFWcHhqdENDYmVsY1hmcFk3T3VtdzgzZ1FNbEF1a3Q2K2E2REVH?=
 =?utf-8?B?MjRsV3Y0VTJEdVBXbjcxbUFLamtoSlUrSEdkSFNiQ2NBTUpOeGJ1TXBoNUw3?=
 =?utf-8?B?U3p1UGluUFlwaGRyTFFVK0FwSGkxc0htK3VXeXdQaFpMZTU2NU9jU3ZoNDI3?=
 =?utf-8?B?S2pqVmUwK3R3a21zeitNcGtwOEl5OE91UTJqaEMrNXZQdGk0ZU5VczZvK3ds?=
 =?utf-8?B?NG5ZdUplbG9GT2Jzb3RxRTUrQ0Q5OTVnTlZOSERXOFFLazhXKzhWYUZkQmo5?=
 =?utf-8?B?Mmp1NVRZSys3RnZ6a2FSTFFTQ25XcUdCd255WkFTOHQ4dnBweE9iRHEwUFZt?=
 =?utf-8?B?WnI3WHEzRkRXejJ0MDl1RGpNMWxMOW5MbTBrZlZVT3VVc1d5YjNVYTZuUlhN?=
 =?utf-8?B?ZlJsdjBkeDlmMnhHV1Z5OXJPdXdMYnhWbjlwa0dERXBZRE44UmtuMFRZcGRP?=
 =?utf-8?B?ZlpNTHdSbWovUjRzcGZBcFRyRytPOHB4bGMwVXVkckNoOE9CZDFpbldkMnhD?=
 =?utf-8?B?OFhpZFYwdFA4QkhYcHNiWHdxaE4vWkFVbzA4anRIeGtMNGdhU2ZncWY2MWV2?=
 =?utf-8?B?WXNSNUJDSEVYQk9DWkw0YVBHNWxlWS9Teml3Z0lmZXMxNHhDTmtqV2xYNUJ0?=
 =?utf-8?B?NTdtUXBZMXJkKzVnSzZFeDIyYmJiOWxOOVhFd2liMjErbEt2WE5CTEdoYzZC?=
 =?utf-8?B?MmdpcUVnb2daSk5KZjF3MlFVNWY5ZXZuSDB3emVkQXQ2eE9Jd242WjNKVzJI?=
 =?utf-8?B?aDVxckVXN2hHS1UwcjZtcEsyWEJMQ3BYZ2V0eXdNbEFvK3REeFlJMGNXNmFP?=
 =?utf-8?B?dGl4YjdSeFp2M3lBbktHL0dJMTRXSTBjVTVOcE43ZDVhUVNvSmhrOGszbVNj?=
 =?utf-8?B?NWZHN0RUeis2cEZrcGtDYXIrbm5tdjE1akNQOEhPend3azl3TWRsQy9reU9t?=
 =?utf-8?B?Rkc4SU5ld010RnNpSHg4VUxMK0U1QjZ3ZmdWaEF1blQzR3JJeU4xN3dDa2Ev?=
 =?utf-8?B?ZzRwZUIvTnVaT2s0RjRLWVlWaDBHazZqRDFNa1dyTUdOS2dpMVhOd0lRTjUx?=
 =?utf-8?Q?Z2pyc7Eft/kmer75UeMT1w6u0KwYGYeCvP01RXsib8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3bdceb-a2d9-4b07-a0e8-08d9c3a60fa9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 10:47:04.5503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zojqGueLNna3G1Pz5FwXpQSIX8M7cc7g8jYdOXGKAuNQOiDmRWBYsNPR+67Lph6OCc9vSRmuUFHMcV5huNEJn6pw2bGdzWoRBumdH94p6WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

20.12.2021 13:34, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 18/12/2021 12:53, Vladimir Sementsov-Ogievskiy wrote:
>> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>>> Once job lock is used and aiocontext is removed, mirror has
>>> to perform job operations under the same critical section,
>>> using the helpers prepared in previous commit.
>>>
>>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>>> are *nop*.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/mirror.c | 8 +++-----
>>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/block/mirror.c b/block/mirror.c
>>> index 00089e519b..f22fa7da6e 100644
>>> --- a/block/mirror.c
>>> +++ b/block/mirror.c
>>> @@ -653,7 +653,7 @@ static int mirror_exit_common(Job *job)
>>>       BlockDriverState *target_bs;
>>>       BlockDriverState *mirror_top_bs;
>>>       Error *local_err = NULL;
>>> -    bool abort = job->ret < 0;
>>> +    bool abort = job_has_failed(job);
>>>       int ret = 0;
>>>       if (s->prepared) {
>>> @@ -1161,9 +1161,7 @@ static void mirror_complete(Job *job, Error **errp)
>>>       s->should_complete = true;
>>>       /* If the job is paused, it will be re-entered when it is resumed */
>>> -    if (!job->paused) {
>>> -        job_enter(job);
>>> -    }
>>> +    job_enter_not_paused(job);
>>>   }
>>>   static void coroutine_fn mirror_pause(Job *job)
>>> @@ -1182,7 +1180,7 @@ static bool mirror_drained_poll(BlockJob *job)
>>>        * from one of our own drain sections, to avoid a deadlock waiting for
>>>        * ourselves.
>>>        */
>>> -    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
>>> +    if (job_not_paused_nor_cancelled(&s->common.job) && !s->in_drain) {
>>>           return true;
>>>       }
>>>
>>
>> Why to introduce a separate API function for every use case?
>>
>> Could we instead just use WITH_JOB_LOCK_GUARD() ?
>>
> 
> This implies making the struct job_mutex public. Is that ok for you?
> 

Yes, I think it's OK.

Alternatively, you can use job_lock() / job_unlock(), or even rewrite WITH_JOB_LOCK_GUARD() macro using job_lock/job_unlock, to keep mutex private.. But I don't think it really worth it now.

Note that struct Job is already public, so if we'll use per-job mutex in future it still is not a problem. Only when we decide to make struct Job private, we'll have to decide something about JOB_LOCK_GUARD(), and at this point we'll just rewrite it to work through some helper function instead of directly touching the mutex.


-- 
Best regards,
Vladimir

