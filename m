Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB55477A32
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:14:46 +0100 (CET)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuL7-0007GQ-4n
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxuIY-0004s9-2p; Thu, 16 Dec 2021 12:12:06 -0500
Received: from mail-eopbgr40119.outbound.protection.outlook.com
 ([40.107.4.119]:3904 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxuIT-0004sR-T1; Thu, 16 Dec 2021 12:12:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCiG+Co5EQ92NKmFnfmwMsTqX0y2Y2nR6Jr26YRBcDiyxrdt8iNVgMSSnNjpJNlVfIdUqhbjaJxOXJ+t2DUzM4yJzcK2BouaVAfPbzn/XA2XmkhJVrJmolLIOxiyB96y8o1yCFbN10tgQ4gFB8hGAdVlpM2y4M+jVYmiCBWuSEYGoc8TpYp/2kOJmmeDsNM+QndDRsqJEXXX/0xHapdIpu1gNQOx5g04SKcjIroDqCNCpF9/F47aep7bhaW7YPF17DXiDLQi9RSXojFy6EhOmc5QYjUAHWkYHq/O+eTN1uhCvSAMPSDeR7w1txe4P1tDuOPZqQERhpvdFgNimb6j0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXTJuw4JaTqQLp2rlJEUiyVSXJvxVfhlrVZFcEIzFkI=;
 b=RpK8krp7DqwZB1vGOjKUsymDuPSwebcgk//kN3NdWWWhQRAiidHAy96Sx4RtJgVUi8MLvgtXZ0bESEGDNJn3+QbENePvZcoe1BZVt5NTC+K5/sOJGGg5/CXy5OLxVnlLiBrPQx7OysUzow7DCzjd5zxhlwls71VThF4wg4m9bkAI6L5kR16ibnJKzlUopBc0OVCgmgtwIsSSmmzKAYCYPmyUgD0+TRj8Fh10IXhuW0k51Ll81XP3SDQ6sBJcSZcOXjf1vaxDMkOA1Q+2eXAkBOmZdVEw+iVXZr8dhoCNY479cxh1IFMoJSSqsV4Q6iqUIOCXC/SDIwrqLepU06sBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXTJuw4JaTqQLp2rlJEUiyVSXJvxVfhlrVZFcEIzFkI=;
 b=Ln7dQwDsZ/E3KJ7BMO7kNnWcwmMwElPzmom8EBGYR+GNLnbCdoHga/Zd7/ftN+8XHXGTXkjeC3wpXhTK/EYLwZOIA+9ZE1UiabiHIYIUMKHZV7dbEyPPhV3wQGAu5VpnI1eRuySe2XwMG5jo3eU3ZmILPX/eQjjNwAXViBkkidQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 17:11:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 17:11:58 +0000
Message-ID: <d218179d-26fc-04c3-1009-747106faf116@virtuozzo.com>
Date: Thu, 16 Dec 2021 20:11:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 03/14] job.h: define locked functions
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-4-eesposit@redhat.com>
 <Ybtt591Fe+PgDCFm@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <Ybtt591Fe+PgDCFm@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 17:11:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 316f6b73-92a6-42f8-a6f7-08d9c0b72b26
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5857C3095A6D09FB6FA6E7CEC1779@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUBLWXvW3xlVpEyvWiYUc82MIFIWIdYOWwUjwxGHc7jrCAmB4cVUpN4wfkYGoQBBcO/5VrAAeohxWq0368BaxNDGHUMmNYOD0HTiGBsPMbuc1cIj54ErGVdOTUyiXWbEIVXoKp3GTh3xu0i9yLMHN2HqOu3A5yqtrmb/VRd/W8OW98dM+yqLLRpsJfS2rUBgkhbF1/FwReqOxIw0Xslq9LMFcZo7iu/IYTw8swgQ44ZfzGR2gEYKHRTLa1Unl5/8pipTnnDQAKpgAwEHXf7lCz0Z87MQdCteYqcqYztw4M7r8Dg1Tt3RJSld8RSqmI2/1XYIqwdzazQ3d8zB+LMdVR55nWakMx6h7Su8G/rsMX8mBfDhFRXCxUlbhOmlg/HknAdIchWLLD3Uidsjj2uIlROW6JpaKOTi0Q7uxmMEXlPxrB8aXvx0IjNUm/vCeDSJbvtr3DFpeC4bapKKZ1qhDKoWOjWqHTBHVL8nTyxZaRjldBroJWeJbHuY2Z8DbmTdEbrPurcOQ868bbi2s186i9JBvvwYWmgQLJJlg+bjjPMITUNp9cHrwy0qSF5JtOyT6nEW1KdiMARx3AIlhwYYITS9u++MLGMjyqdQFL0+7Sy5blsTJFSxoXr0aHqXZaWCQsbqeGLu03K4hinUAxeybWDJO/EAVsv2RZfXmlrIVv+8O7MqQiPPbDqoO74BHyX4xJ2nJVy40nBgI3PuEmuizC3XxYzWy7XXeNZjFZ58DUkJAVduK+3lo3v73QWEkuFQdphT70uMsrBqUrhyxMkAmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(31696002)(66476007)(316002)(2906002)(38350700002)(8676002)(186003)(508600001)(86362001)(52116002)(83380400001)(956004)(26005)(2616005)(4326008)(38100700002)(36756003)(54906003)(5660300002)(6486002)(66556008)(31686004)(8936002)(7416002)(16576012)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkszcjQxdmphUDdPZ09LcFMxVUg0Y1dnNzcyQm1XUUF0SUFnd0ZPcmg1d0ZN?=
 =?utf-8?B?M2p1SVFBV1V2dDZyM3c2aXlVRXBUSEVKbXRYUTBtTytRMnVYa1BaWjdrYXUv?=
 =?utf-8?B?YmFUUmxGeUIxZTd5Uzcvc2VxT2VycHU3cVRWRlVYclhMMVdzVkxwWlppb2RM?=
 =?utf-8?B?L2FienJ0Q3ZMLzkrdHI4Z1hvNHpDZFp6VUc0Z1FvVE9rSVM4eVlERzRUMFVy?=
 =?utf-8?B?SFZsaE9QeFdQdjNIT0tlMDlkWUR0d0NQWk1TSmVKNWk0Y1J5cjUzUWpxaTlW?=
 =?utf-8?B?QnRXcGpLd0lpMkhGVHVJMXVQSU02VEJWSzhvWUF5MDg2TGxLR1pWelpkaHlH?=
 =?utf-8?B?MjRVRnFSYUxqRjhjamdlY0hTQUNYVDhoNzdBRUFQTktoUGRxUHJvTHdHeUoy?=
 =?utf-8?B?WVVUZ3VqbnlvQWI5OVFkbkQ0WCs2QTJNNTYycllxb3B0Z1FhaTNXUjJ6SFky?=
 =?utf-8?B?UkZlSnpMUUZQeXhNQ2xOVXFMQzY0R082L1BISVVRbFp5WXlKR1lNeWlyMnRs?=
 =?utf-8?B?YXdpVit5RXB0RDB0VEEvby96Yjhrb2tHcjk3UVNINVpOYkVwOWxTREVEeFdU?=
 =?utf-8?B?Y0ZuRnc0ZWNtNndZT1NsT1YwWkIwaFNPUm85OTY4MllqajlVNWV5RmtYcWtj?=
 =?utf-8?B?NWg3Tm9RWkQ0N0JhNkljN2Nsd3k1RWV6Y2w0Y2pXQUozdUxWeW9DV2xUSFlm?=
 =?utf-8?B?S2pwbkNtUlFQZkxJWGpnNkQ1clN1cWZQQ1lxOVJvUjNkNXBHVTN1ZzEyc1Bi?=
 =?utf-8?B?dlZad0xUR3EwdFpCZ1ZoOThmS2huWmdSdEFqc0dxeno3eUQ4WUc4Vjhzc2Qv?=
 =?utf-8?B?WTc3OUZ2eFh5UDBSMWxUeUZjbXVMVWM5TklZUUNBNnArY1R5eUdkSk4xZWFF?=
 =?utf-8?B?blZjcUpEZkd2amt6akZsTWlCMWFWaFp3NTB4TnN1Z2hhS244aFkrdzlCYlk1?=
 =?utf-8?B?VXlUZHJzRzIwRjF6ZCs0U092bWF5cFFvKzZZMDVqNCtveHZMWkN1ZHdjVXk4?=
 =?utf-8?B?eEVSdkhBUUplVUhMOERjZzRwcnk1bVJnWjhpVGxIS3BaS01iTTEzQk95YkRT?=
 =?utf-8?B?aXRyZGt0bk9sYkFpWEkyaEcvb29yUGdmZk1qRllxaFM1VElBTUVCV3gwbnhW?=
 =?utf-8?B?ZkhrSUhsYi94ck41dU42MkxUTU9BcXVtZitoUDlpclJodGk2V29DWFYvbity?=
 =?utf-8?B?aGx6QzNNOWxLZjQ5MGZxaHBvcWxEQkg4aVNHZ2pqNlExZGpHSnJkWjJ0bWg1?=
 =?utf-8?B?ckZramM0djBVM0M4cCtHYmFieE00YTZmdXRVQzdxMGFpMWtNbFBOSWRhWjZQ?=
 =?utf-8?B?L3MxQUJtN1ZGa2w2UDAxelhCdERoV0UzVm50Wk1HTjVxYm5JVWxkMkNtblBp?=
 =?utf-8?B?U281RGhSQnE0b1U4eTBGY21kYzY5ZytmN3VKU2xtTkxrUzd1eFE1RTJIM3l3?=
 =?utf-8?B?STl5Uy9wcW5Tcldadk05ci9Ka3IzbXpyK3NHVitIS2Zla2E5aEtsdndCdldC?=
 =?utf-8?B?UnJFWVEzYzI0czl3d1JqbnRMUTdoRlZGRFZIbGxqNGhqcWRoNTFhU0pYd0h6?=
 =?utf-8?B?N2ZSUXNTa1VlaFltVW9zYWxLTithRWRzdmQxR09IeHVoMGhmdGJDUVczU3Rv?=
 =?utf-8?B?SUtSd0R5WTcxeFZ6U3RQQnZSdXVIQ2ZDa2poUzB1OU82dEhxeGNBWUhVOVFD?=
 =?utf-8?B?UFpkeEJ6Vk9OWDBzMmlqZGFTaXdoY0JnYlhwMnRJbUFTYVFDZnZUcUJhNkJ5?=
 =?utf-8?B?WGxSei9Ra0lBam5qaHhWVkcxWUpoK0JQVWtFak9rdFl0Q2hOdnMzb1huWGEw?=
 =?utf-8?B?ZnZ1ejNpTExyMDVha2tPeFNjand4Vk9RR1N0UGdDdFNlY0R6WHprT2ZXRmF1?=
 =?utf-8?B?V1pIYkxKSG9yUmxqQTVJREdROHZIbDZhNXRBcy8zdE9aQ1FBVHBnY3Fsc2lZ?=
 =?utf-8?B?TkZSSUFZM0xPQ21TMGZhT0JJQklaRGkrbjliZVY5TTNhckVlRFRoTHFEUEpO?=
 =?utf-8?B?L1lQbjBsS1ZBUHlVeHkzY3I0cG04ak9UWjhjb3N0QTlEeWlBbWk3Z0h0dzRI?=
 =?utf-8?B?SUtjL3RraDRDMFZ6YmFPSEVPcVBOc0hpQ1h5cWtrZVF4UGJ2VmhJWVNNcVli?=
 =?utf-8?B?MnpKZ0hoa0VTOURodFQyYlNiRFZ5THlEL0JMSGlpMjIvV3B0a0pjQm9sVURj?=
 =?utf-8?B?YXplSnMwMXMzNDNRNG9OcEVEa3AzSStTQm9XWGw4SW5MZExGQ21ycStaZWM4?=
 =?utf-8?Q?1wQ6/5cpw537+1olyBDxpcdWgQCAbOSvWTGQmmEb3g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316f6b73-92a6-42f8-a6f7-08d9c0b72b26
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 17:11:58.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SI7rEAPm/xqVmVdB5o2WMz6QP1AJaErm18dceMMqKgfRwyv+cSXTG8XR/V4a1DCjIrEGG+HlsvhUscreXQE6I9UHHQ3lnSow2OmMjWxhzVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.4.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.12.2021 19:48, Stefan Hajnoczi wrote:
> On Thu, Nov 04, 2021 at 10:53:23AM -0400, Emanuele Giuseppe Esposito wrote:
>>   /** Returns whether the job is ready to be completed. */
>>   bool job_is_ready(Job *job);
>>   
>> +/** Same as job_is_ready(), but assumes job_lock is held. */
>> +bool job_is_ready_locked(Job *job);
> 
> What I see here is that some functions assume job_lock is held but don't
> have _locked in their name (job_ref()), some assume job_lock is held and
> have _locked in their name (job_is_ready_locked()), and some assume
> job_lock is not held (job_is_ready()).
> 
> That means when _locked is not in the name I don't know whether this
> function requires job_lock or will deadlock if called under job_lock.
> 
> Two ways to it obvious:
> 
> 1. Always have _locked in the name if the function requires job_lock.
>     Functions without _locked must not be called under job_lock.
> 
> 2. Don't change the name but use the type system instead:
> 
>     /*
>      * Define a unique type so the compiler warns us. It's just a pointer
>      * so it can be efficiently passed by value.
>      */
>     typedef struct { Job *job; } LockedJob;
> 
>     LockedJob job_lock(Job *job);
>     Job *job_unlock(LockedJob job);
> 
>     Now the compiler catches mistakes:
> 
>     bool job_is_completed(LockedJob job);
>     bool job_is_ready(Job *job);
> 
>     Job *j;
>     LockedJob l;
>     job_is_completed(j) -> compiler error
>     job_is_completed(l) -> ok
>     job_is_ready(j) -> ok
>     job_is_ready(l) -> compiler error
> 
>     This approach assumes per-Job locks but a similar API is possible
>     with a global job_mutex too. There just needs to be a function to
>     turn Job * into LockedJob and LockedJob back into Job*.
> 
>     This is slightly exotic. It's not an approach I've seen used in C, so
>     it's not idiomatic and people might find it unfamiliar.

Oh yes. If we need something, I'd prefer function renaming.

> 
> These are just ideas. If you want to keep it the way it is, that's okay
> too (although a little confusing).
> 
>> diff --git a/job.c b/job.c
>> index 0e4dacf028..e393c1222f 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -242,7 +242,8 @@ bool job_cancel_requested(Job *job)
>>       return job->cancelled;
>>   }
>>   
>> -bool job_is_ready(Job *job)
>> +/* Called with job_mutex held. */
> 
> This information should go with the doc comments (and it's already there
> in job.h!). There is no rule on where to put doc comments but in this
> case you already added them to job.h, so they are not needed here in
> job.c. Leaving them could confuse other people into adding doc comments
> into job.c instead of job.h.
> 


-- 
Best regards,
Vladimir

