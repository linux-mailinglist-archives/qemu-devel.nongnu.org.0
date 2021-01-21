Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D52FF4CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:42:12 +0100 (CET)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fqO-0004hG-12
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fJZ-0003pV-0i; Thu, 21 Jan 2021 14:08:18 -0500
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:33632 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fJR-0006Qv-Rc; Thu, 21 Jan 2021 14:08:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7qoy2eg8+ACi2D0lIqtjHYVcJDBrSYPiDtT6qScajo8B9RVBBXu0CSrpIque2AHbiAQP6LgZzEoiy82c09I1upJwRnBCQQmA+b6QM7xYzRK6rxN6l94uDm2LPEXQMvc8LO0hQfQmVHc8Y4Ug99w32wZziJ3+FbuPRzzUS7KYmhIp3Z3ecnnKLNA4f5nYqR+Hc5U9VePmv5qh0ZjZmNJNnDHmk9sbZy9Odu5wmM8E39t7oezsVnhO145RTdUEuO/6756y44stxiXWER4JsJnHdeL1k7bLWzPo7dAYmUsEQpoB/De0WiXjKpP+Iojsw5WeMtUxMJmk5IU//qCTOGzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10lhLgQb1Vbmor0Qnihxb8iZNXF27gVejbRT6YN9mZg=;
 b=R3LE5fdJIKDNVUYFVFB77E6Kbh2uEWcsPBnXKXahZBR41l0cO4a0GTHMonknuXgH/LsNw8HB7GDpqOJOG0tb8D2//iEZ6vaYw3gpqkNxfQgF+C6MEUMRJ/hpAIfeZ1GP3weWa7/hePVWBGLlGrtJ83mrJ+z3TDiTyJ4DTpqSbxy8AvRwrVux7ems3olpWEWJHzeZaZEYsXLxerBaPCuEx+znt783RtFq9+EvPQR2PUM7Ek+PuLXyFJZz0u3VGIBaY1eVT05GMtz8yVqMmFroxjGd+cLcrmAMR8IxzMgrXkqz8VUOn2TUz7YgxSM/rdHqgroOmaAJy9daQs1AhJqR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10lhLgQb1Vbmor0Qnihxb8iZNXF27gVejbRT6YN9mZg=;
 b=uNychGLKk53674kmCSqoRf0iRlJdsQ91zWnbjgdk/D+YdeujXlVEOQlCut6dsO137yQlG97ojKjYeZP9pLBWxpWnbMt2w1/klEeuCLOhySQ3aXyKx0Xn/L8/YlZXjDB58yY7DJnnSCVOorTiAcFJB8rxdrLIDvh/hSBOenWgPxU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 19:08:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 19:08:06 +0000
Subject: Re: [PATCH 03/11] block/raw-format: implement .bdrv_cancel_in_flight
 handler
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-4-vsementsov@virtuozzo.com>
 <0484adfa-2822-dfd6-b311-e947892d7376@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <04bb4bf4-db63-0d50-5352-9abc5ae0a976@virtuozzo.com>
Date: Thu, 21 Jan 2021 22:08:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <0484adfa-2822-dfd6-b311-e947892d7376@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0026.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:208:3e::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 19:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 608725a3-7d82-40ed-82c5-08d8be3fe250
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36224232551261B4DDFDCC22C1A10@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDQkbv0BQtEeovNbZ7EzwRI4JqEfQfj7s4fxRq2Hchv5wqhhKCCkjoGoBKyU4pBw4T1WvdvY1bb28+zqDKzo8dC5GGM63Y4sfW4v505fTVrm4s1gfSoGzlS4oYErX8P3SZwbt7nWooL3pt8cfuk8VLlxzdyuNb3VaIQiQJgPNuhsJsxmde8Dpj4uKRmi5/J37xTngEFl/lO4ZVGC/ILSvic7iQCTtLWo6FOUmA6jpkIR9go5VUXL0Mff02rdgo1b8pFgRD29lpHejJx0vFu/Bek5rWsDQCDOI60NLKwGbddisz2fqTGoNd88nfEJU+O0wsiL4CzDZBYhdy6EItViJf0RCBFBIodehDZjnnwtgOZRhm/7olOwr6YU9/RN/vO88OfeIPIvxEOYwFpEU1SWehedJSExZNQF5eDaxUrnpI817RutzZ2CSnCBxqnuua6jgokjUUBI5Pv5FxctOsVFIZaOoKs06BEb+wl2Xt4Y1TObxV+0EaOKrKYzpOpApn8+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(366004)(396003)(136003)(4326008)(107886003)(5660300002)(8936002)(31686004)(2906002)(6486002)(956004)(2616005)(16526019)(186003)(26005)(83380400001)(52116002)(53546011)(36756003)(8676002)(16576012)(316002)(478600001)(66946007)(66556008)(66476007)(86362001)(31696002)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXgydHpXNko2b1lGMmlwbE9SWHl0ZGxMMjRPbnNxUFFuMm10QWd1OHFMVmdi?=
 =?utf-8?B?bFlGSHI1MDRQTkFkdGJpMXFXUjlBMlR2dWVkR01Mek5ySityV0FCZnJCRmNw?=
 =?utf-8?B?Nk5pL0xlTXV3bE9JTStZYmsxYzMzL3VoR2ErMHBCNENlUTdhNkJXUlJmbGU0?=
 =?utf-8?B?Q1RmMUZ5ZEx4RUxFZHdiSFd1OEFLUGtLcXpLZFMzN3pGNTUrVXUzbUI1V0Rl?=
 =?utf-8?B?c0R1S3VmUXBKL29FU2lIaFhQZk5mV1BLaWJ1a0RqOER2dXE3YTFvdWZvQTg5?=
 =?utf-8?B?T1ZHaXhRYXhzbGptcWhQWTZRQnFDYkxteUtuQ3RjSkNKVWhYM0FLTjdzV005?=
 =?utf-8?B?QUFRaGdqZzBvRjhxYjJSRWZNdkk2bUgrM1pKcnN0eHpLMEpQM0IrZ2FRRU12?=
 =?utf-8?B?Mk5tOHl1QjBiSmgvKzRObDRLOGcxQ0Ntd2IybHZ3eitoYU1pT3V0SFJTbExk?=
 =?utf-8?B?cnVvVGtIV1ZjS3JkWlNZc3Y3L2FHaVFTSHM2YmVxU3ZTSHgvaUhnUFlidkE2?=
 =?utf-8?B?WjNmeXNyakl0bTJSUWcwRmZneFQvS3hWZDBUQm9xcGtvS1laaFM5VzEzR04x?=
 =?utf-8?B?UnBNUWVJM0luTHBTcGV2VE83RDEwTm1CVVMwR1hvTWRsNHQ1TEtLemF6NlM5?=
 =?utf-8?B?Wi9wSW5MTDAxSWhiUmZLNW1tTkl0RmQ0dzEzUmpKV2xYTExvRHR1azluS0dL?=
 =?utf-8?B?ZVJTWFB5M1U4YWJPRFZ6UE1jR3orMENaekFSK0kzaStmVU5YL2lnclNSVGxx?=
 =?utf-8?B?QWphV1NESE9zbDB5d1ZRdlVZTWpBb2JkS1dSbEZVL3dmSXdjb085RXVnYlFF?=
 =?utf-8?B?U1gwZ0FoNHFNYk8vMS9keUdoWnJocVhjMkd6clRHVVM4VlVPRUljOUprMEFh?=
 =?utf-8?B?cGxweWZLOXlmOE0yUlNLcEZvdjJmMFdxSVVaVzlhbWtyY1h0WWxZT2J0a21x?=
 =?utf-8?B?QkNIZFNCUFRqdjBtWUh5aTFmMFNvcXpBN3FHb1ZUUzNUbHdkejdWZ0FWT2RY?=
 =?utf-8?B?aTB2c3lmaDlCZmlhSldCb0JSVk44cmJOUDVvYlM0UVlJTzB2UDd3bTRKbGhO?=
 =?utf-8?B?RFZzSmlmc1cwaHZMSDdOTTNnSUFtWFVTRmdLODZuSDc1WXVaR2gwbVZiblpQ?=
 =?utf-8?B?Ry9OMUtCS2J1ak9rYWl3N1M2aFNkSWZWUlJUS0FOMU1ENHdpcnZ5ZjBVRmI4?=
 =?utf-8?B?bUZNOHFtTk44Mk9IT21nQmF3QlF2L0FFb0Fxd2ZuUW5PSTlyRGZrYVFLQzBX?=
 =?utf-8?B?NWt5OFRRdkZNYVluc1pMK2NrNWZHZGNQN2NzU1h1NkwzcUFqcVoxelh6TWlm?=
 =?utf-8?Q?XqNeuiLf/BLDuqi+9fIhpBo+0xmaEvHbTX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608725a3-7d82-40ed-82c5-08d8be3fe250
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 19:08:06.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b19Mlp2h4JxYTjXrQFn+a/Oa/lf2VDUjDJFp7IuGf6UFvrPobGIbtZJX9QWpphexHV023TsAW3oVARk2z/yFXdWc9u5B5NwECw/Jmm0gOcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.20.117;
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 02:15, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to cancel in-flight requests on mirror nbd target on job
>> cancel. Still nbd is often used not directly but as raw-format child.
>> So, add pass-through handler here.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/raw-format.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
> 
> Should all filters do this automatically (or rather, should the block
> layer do this automatically for all filters)?  But I understand that it
> does NOT make sense for format drivers in general (cancelling a guest
> request may still require metadata updates), where raw-format is the
> exception, so doing it in raw-format instead of the block layer makes sense.
> 

Hmm.. probably not for backup_top filter. But of course OK for throttling

> 
>>   BlockDriver bdrv_raw = {
>>       .format_name          = "raw",
>>       .instance_size        = sizeof(BDRVRawState),
>> @@ -608,6 +613,7 @@ BlockDriver bdrv_raw = {
>>       .bdrv_has_zero_init   = &raw_has_zero_init,
>>       .strong_runtime_opts  = raw_strong_runtime_opts,
>>       .mutable_opts         = mutable_opts,
>> +    .bdrv_cancel_in_flight = raw_cancel_in_flight,
> 
> A demonstration of why I don't like aligning the =.  But it's merely
> cosmetic, so doesn't affect:
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

