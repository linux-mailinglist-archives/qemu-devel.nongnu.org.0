Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389B3A324D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:39:09 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOe4-00075h-BV
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrOcg-00065n-E9; Thu, 10 Jun 2021 13:37:42 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:17376 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrOcc-0000yI-AV; Thu, 10 Jun 2021 13:37:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJW4+gCOq73ZhwaNHYz10bLFKVgUvvQK2UmskpKsvcWr5MZuAppkrZke9mGGAuDClHg0kwtR+A/gHhH7Ou7F/4ajz6efZLTEGp0kezqq7GWtymym2scnitx4MdJkKfpg7OCYr9ejfy5W6ER8L4Qet6liZlVYGSxYyIAT2vSyIq1lTjtZqpSsf/es+nY0Z6NU6+w0WHeFn8gCiqVcEYPAAZBCTI8APvtBYiECQN0BSpIw+Y4kDNr9dEHjJR7KCviH/nabKfs/GghBYbYH0gdGvI9Uu9Q/0wXS1nZWOdYaBVte+3jmHI4aNTIxslAzOhLMJOezePGMBRgiHJPJSdGjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H/thYIyxSMTKnPSAmhDrli/UOsRNoIVMhrmHtPJacQ=;
 b=Khdv+vOU651/SySjTSBnh8RV2tfM7oTN+42YNq/JjlIEGAiiU4bvR5bZjA6txMkuc++Hkn0G2ofcHlewhKJduWMxHclZB7bvOJ0cO4ykmRa8gk5pX94DMp3lmU51xiXyYODIj295CD0pqIpTLrAko63MHjTxtqltAPAZYsvhie2sySQ/ku56jfbRy1okCKuosvjgVkp8vDOeKEx3CbzIF0b+cPffaWOSJ8VBQTx8r8hcz32XOU4xfqwo4t+9i/tjROd7H2+/cnt/767OrEMutv/AcW6EtcvZiJr1lOEnWeTPIHujk0vm8Hkw4ur2jKWS3sWTmTujf63z82nlN6c9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H/thYIyxSMTKnPSAmhDrli/UOsRNoIVMhrmHtPJacQ=;
 b=J/EqL0wlURGDjZfHLWR4AA7WXGpm7MZeY1DxM9+o0mO3uWjhmS0f+DJZeNag6ZTTl4P0R7zwRrm7SPOffJUnpLAW/V2Z+05pPVAM8TdyT1hryqE7E5RAbcMrIFf+fQM1pFwnMmPfPa3xwu2DOYqfU5NWIBvE44qy85eIwBFLSjE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 17:37:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 17:37:34 +0000
Subject: Re: [PATCH v4 01/32] co-queue: drop extra coroutine_fn marks
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-2-vsementsov@virtuozzo.com>
 <20210610172204.w2gtdeoj3v72m5rg@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1610543c-24bc-ebe5-8c93-60f609a17e1e@virtuozzo.com>
Date: Thu, 10 Jun 2021 20:37:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210610172204.w2gtdeoj3v72m5rg@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR1PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR1PR01CA0011.eurprd01.prod.exchangelabs.com (2603:10a6:102::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 17:37:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd505214-4187-41f6-363a-08d92c366e6e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158F3ECE04F8B414E49EBF5C1359@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FPsPcINcDaSWpMeyYrnIDuf6F9dTwu6wWaQxiZxQ7fPxz236kFYZfHB5V9INzN4xxdyyPGnLLScXk4DswbYBcLnhw8DcAHjtbtJKWXdtvYWIkop6FYCk2Cqs4+C5Jk5+Y7UJ01AqCTam/tXD/co5FEOaEiUG7RbO1kw4YD3mu7LYxDJk6p6i8FEf3eC2ONZeqqN73U6hPzDErMYU1Y5IwPnTb4ckPOcNwES6K8v05KeCimg31UYBpZ2BGgvyhXDj7RQYYshBAjGyaNRgQ8CAG4bF1lKKMfur5HBHPImeXtWp0LhoXh9NDHQto12pbe7KtfmfTLFkdSFG6DD8geGgjhJNXw7aH/4sfB06ZIgEtGGi0eTaTZrYbkVOK3ki1mOWYrknGBYyq5CAIHANAbvjbTGma45QYn8fklDRKzrv0Ao7mbWNVY36NwRT7TjxOd8+wc3AGCjn1gs9Qap+hzyTg7rORA9GvJQiYlJyZzy0ThJUpeSjKOEr8gI0hl/jdNM6IYmnkIF3D4QsFfA0ECx2i7qenxhmA6VvdR43jrOueLwZyiifVk20w4O2958xrYBAuPSfT9CHhl9KGC93zVEVy9z85OyD9ewRSBTQuk5q9LReyYYYZJu6aAXoC508dUgbgC1Z/783Yv19piKaHGYh9qBxH6FBtABHJTRvA2NkKNSY/4xReUL+f8mRI0OYwSO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(396003)(366004)(38100700002)(6486002)(83380400001)(26005)(38350700002)(4326008)(956004)(2616005)(2906002)(36756003)(86362001)(16576012)(31696002)(316002)(8676002)(478600001)(5660300002)(186003)(66476007)(52116002)(66946007)(66556008)(31686004)(16526019)(6916009)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWxMMDRZbDdRYklxekk3Rmh4RlNoTm9mamhHUkZra1c2cW1vSzFsaVY4UGU1?=
 =?utf-8?B?VG5ad2JWUDgxMzJaSGJoNytvZGViZWRiWE1vdnNkYmUrRXVPMGRMZzJQL3VR?=
 =?utf-8?B?dzNuOWt0UkpTY084UDVVaWpjaHcyYVVKaXlUMUZLaDZMKyt6RzZQaXhDQXQ3?=
 =?utf-8?B?L29vM1FLNFc4RThHTFphUnlTUUpFRVJ6UWhzbEkzeDNQSDAxdzZGd1VERVBQ?=
 =?utf-8?B?MkJHUVJ6bmZtdlEyZzNnVzVOMnVuWU90ZU1Wa00zUktYb3M3OVZWR21ycWZx?=
 =?utf-8?B?M2JhV0ZlVDFXY2NWSlJ3UzRiZHJVb0pzUlVodlpxRFdlNGI4Tk5PNUxYc1A5?=
 =?utf-8?B?VVRmektld3gxays0YUpwNldrekYzWGtwQ1Z2Rm9nRUpNZXV6enJSSCtXWTdI?=
 =?utf-8?B?TVpVeEZYaGIrbmhxVTFhMkFxR2kyamUyM3kySkZmWUJRT3duTzI0ekVZSEl1?=
 =?utf-8?B?WXdlY3VUVHY0MytQWmIxRjI0djhFdTRhdG0waUZocGZrWkt1TFpuNnhPOEFw?=
 =?utf-8?B?bTBPakRNN0dxbjh3bUdhNWtNcnI0YVRKWDd0UXRlTE1rYWdrU0d0OXhhSTFR?=
 =?utf-8?B?T0hnMFh3K213c3FteElhNzhnOElLSGhESDRlbDAzVTlpWW1peGhwL0t6d1RE?=
 =?utf-8?B?dlczaHhTSEVJSkx6TEFZL2ExY0JnZ0VOaXVESW14aXFYV3kxalVUZDI3UmhX?=
 =?utf-8?B?d1NaODREVHZNM0FDZFJyVkszUDVVWEtKaDdDWGlyYnNtN3gyZmxTQm5yQ0oy?=
 =?utf-8?B?UGxwR1ZhNDhRbXA0VTJNZ0U4YTN2M3NzRGIwUXoydFl0amJiVFBibFcrTy95?=
 =?utf-8?B?azFKUWwzSEtwcGJQcmNBYlprODZWeUY4OVhoMDUyWEZIOHN6cEVTbDNVeVJ5?=
 =?utf-8?B?ajRGdnhiNW94Tk9VTXpEVXNkTnRvM1ZwK01MN3JIOVZRV0JHYm8rd080Uloy?=
 =?utf-8?B?VTlWMCtTNTI2NE83amJTSllOOFdHOERkTGN0WUIydm5HWnlBMytoY2dVdFZv?=
 =?utf-8?B?K0JPaFk1eUEyeVBGTTZYRFcyL2QySzFOeVFMd1Z0N0FwL0N1aERDMzNGb0Fa?=
 =?utf-8?B?TjJWK053bHVhYmFlb1NtYUQrd0owMUxIUWcvQVl1Uk9DM016RHNKSjdnU3dL?=
 =?utf-8?B?S21LYzZOUng2bUsyc2tuV0ZLWStNazgxT1F1R00xeUpLaXBndWxNVEhXYlZW?=
 =?utf-8?B?eVpROWpzWlpPWmRrdVV2RlhJQTJkd1BBS1JULzArcHRaQVFDSlY0U29UdnhE?=
 =?utf-8?B?WmRMQnVOYmF3TkVUaHlsY0gxY3IrMVdXOXZSRWxzdFJ0SDZ1Uk1aS3NKRC9y?=
 =?utf-8?B?L05RK2o2QmpwOVdod3F4MUIrWFZrajN2bS9FN2hWK3hNNFRZaUNlUERkc2hq?=
 =?utf-8?B?cjZJQmRRc20vdmFGbEF5WUVtc2pBRXh6ZGJBZVBDamV3SC9sODFuSHJmOVRN?=
 =?utf-8?B?ZWMzcnM0UHQ4MzZkRDVsdkJJcHdWWThzNVJzd0RzejZ4bFhRYVRodFpnUy9L?=
 =?utf-8?B?eTc2RFBTSTY3OFhyUEdMMmllc3o2N2ZtUkt6dXBZRjBadXFrZXJGaTQ3TUZo?=
 =?utf-8?B?dzhrVzBzUC9YcnMyazMrb3ZjZ3kwdGpUTFpKaWJ5Tm5tVWt3eHBXZkkvUE9r?=
 =?utf-8?B?SE5iVTlGN1JCeXZpUFVaT3R1NExCRU1TdDc2cDR6cTdVY2hydWNPcGZiYkta?=
 =?utf-8?B?MFFZSWZGUng0enRMNDJzN3R6MmtWam05UWJ6dlpNdkNhek5jOGdUcnFYTm1m?=
 =?utf-8?Q?2NTi+c7GjweMx/UXBMKYNqyqF0i8GLoHv66H+F0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd505214-4187-41f6-363a-08d92c366e6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 17:37:34.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8N+uoJdJYPa53K2v/YezHUXs/jdg2ud29Q7RkhZVnwxEM2v+UnXwfYuqmuKe5aVm5Qi8p7iRks4nobr0XCIF1SXnPSgy5CVTnV/OuPkxRPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

10.06.2021 20:22, Eric Blake wrote:
> On Thu, Jun 10, 2021 at 01:07:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> qemu_co_queue_next() and qemu_co_queue_restart_all() just call
>> aio_co_wake() which works well in non-coroutine context. So these
>> functions can be called from non-coroutine context as well. And
>> actually qemu_co_queue_restart_all() is called from
>> nbd_cancel_in_flight(), which is called from non-coroutine context.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/coroutine.h | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> In the back of my mind, I have to repeatedly question my faulty memory
> on whether:
> 
> absence of coroutine_fn means this function is unsafe to call from a
> coroutine context (that is, coroutines can only call functions tagged
> with coroutine_fn)
> 
> vs.
> 
> presence of coroutine_fn means this function must only use
> coroutine-safe actions, but not all coroutine-safe functions have this
> tag (in particular, functions which are designed to work both in or
> out of coroutine context do not have the tag, but coroutines can call
> functions without the tag)
> 
> But thankfully, rereading include/qemu/coroutine.h clears it up and
> both of my initial thoughts are wrong although the second is closer;
> it is yet another definition:
> 
> presence of coroutine_fn means this function must NOT be called except
> from a coroutine context.  coroutines can call functions with or
> without the tag, but if they lack the tag, the coroutine must ensure
> the function won't block.
> 
> Thus, adding the tag is something we do when writing a function that
> obeys coroutine rules and requires a coroutine context to already be
> present, and once a function is then relaxed enough to work from both
> regular and coroutine functions, we drop the marker.  But we keep the
> _co_ in the function name to remind ourselves that it is
> coroutine-safe, in addition to normal-safe.
> 
> And your patch is doing just that - we have functions that work from
> both normal and coroutine context, so we can drop the marker but keep
> _co_ in the name.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Actually, usually _co_ == coroutine_fn. I don't drop it here because it's the name of the object: CoQueue, so qemu_co_queue_ refers to it..

We also have for example aio_co_wake, which is safe to call from non-coroutine context. And _co_ refers to what function do: wake a coroutine.

However it would be strange to have a function with _co_ in the name (in any meaning) which is unsafe to call from coroutine context.

-- 
Best regards,
Vladimir

