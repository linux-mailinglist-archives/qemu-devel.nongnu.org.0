Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33F687BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXTN-00037X-00; Thu, 02 Feb 2023 06:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pNXTD-00031z-Nu; Thu, 02 Feb 2023 06:09:36 -0500
Received: from mail-ve1eur01on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::715]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pNXTB-0000yf-2r; Thu, 02 Feb 2023 06:09:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKPDsQNuwFi67Fe2pXyvjg3WkP2YZ+sDKqhmb1LoVe+v3LPoNNUhLx6RPtnUNf81s1Vm5BPcv8O0UJjysH6/0gBJC0Akje+NZfFXSSiEux70fRnFAaf6lq5W8siWAxjNywVvE1wHfB1oED7GWXLlRvhUsdiIfbXP5bjrwMdjnAIO/+2zajmTOJ/0nW1qIOqp8F664CH5wSFXyIyrM79u8NtBdD9qsRXbi9fE18GfWyps1YESIZB1NbGBk+/3ovYQwzywV/zOaP1yTiDGBx4L6u1ncnSbeQgLCTCKrRLqgPI8PWWZSKgvgosL61LfsVP9je0F04ZkZRsbGXAPRbnSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/jZHeACbQ40GCbqq3Am8BCUNjhRSulT53UPJ0kfMMc=;
 b=jkvBXjESXIG+NMk2at9F9UepF8Z6UF07/4Tr/OM4DqlwoQ0BY67A31/UIiX3vnChKU8lNfYuyivt1TlZwOVsCoPFIDusNXg61VRvItxQKWoX4DjCSD3PU8Ns6uBj6hS0W61T6F8hB6mjzLHVV8T7rAcBSVUgwWZqBP7wRvYQPY6OoGys97VbpIVvxpQbqMGp50EWWTR9nBTqEFCGANsUZmeDq1b79kweNm3Hi66RxT7H0V6Wqb62qadF3LbDFmpBOZWgiNbn3us23o3JWwruod2y+75peRDLWba7Zm6iJblMhMNnd96oG0toprEQ8zdJeJDig/G4UZVbIIydGqhclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/jZHeACbQ40GCbqq3Am8BCUNjhRSulT53UPJ0kfMMc=;
 b=Dj1KKxnq9B/2o5JH2y2Hs9mRsfK/8i0ZkvBi7RTW23z73/nkEFwdQV1CJLSAiI5XR7z8EG/PU+eFj/MKn0A91MsHaLJAI889XectbY50ELq1Ulqt4c+DnaadEhtf8SAA3Ha2r79vr38E3EnAQ40qNsJgzOaBKrWgdnJkijeFGn3EHKIxPmI7wMjM9QoXBg0MsHQTvYi8AjOIfPInqgEMjkCBiZX9FOwr/rPwE6mA/Dqf3JV4k8jusigZsm4JYAWcOnvd9RKn1+NkTxy5RwIJtBpJ/0Iktu1DjeKR27qXHQsBRfRNkY/95pHRVO5JYFhZWQsrITor0i6LiujpeloEKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 11:09:24 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 11:09:24 +0000
Message-ID: <cac5cf55-b4ef-90d7-1598-f8118fa4018a@virtuozzo.com>
Date: Thu, 2 Feb 2023 12:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0154.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PR3PR08MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 160177ac-2213-4f38-1ca2-08db050df161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lzdal6pRtVVIu+52lRNBm5Y4cRCRv5WPtlJ6XOO2DGlvBTZh0Ps+/KKoEHDv2scbW1z3U2bscULXe3U3H08OYSEf92UBcSYL/9IporLjJIqdRlB4gSrya3AZ2g/quPX/K6UWhkAg+hcSLoMiHurdnm7yJq2fPJhAaRAkuD7W0Ab5NyN8XjOKGRP7EhQaiq6XHOv19egVB+OY3ddV83MpTMajKoNNe+Kqs2knn6wJQIMjuvfjKaQNKpUHaurDGHWXktGclIDVhONfJh52qEIh0EVZa62fC2STPcYQoEQpz6j/PCHQPbFiSSzbkS6xHomDo27KkprwREQgGjv9g64K86HpYUPSla009ij8vZOy9+5JeS4WCeofsJ3RzkKqvCGWLOmChfZWbUz5LgibrvT7q2N7MfMPHnrQG+9hVJEeopxx1dzdyFHf9LaX6sY2BypFnwVs4nZV7hozq5RzgUzq0ZQKFLCNlZixAbXsOnbitxqo7MZ5upVN/yQ2Gm6GO1Z7IHJ0gstdPFsTfAXCESzowK9zxuq74i98Ckar9P58s3volmna0ZK6inPFAqAr6EBJL3Sw6YbqwLEjQK614+t94R22kVKxEAY6RDBAp6HukYGTgCoh8DMOk8OOc9jUOk8ARmQbNnAnwstLXtT2SiJWxGzDYiDdwrcmsY8Gg7qmy7ugEtMeZBp1Rir5Weax2tJu1SXWzHed6Jvf2MRSG3jyDUN57ljUKS8npmMP9gm+wVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(451199018)(31696002)(8676002)(86362001)(36756003)(6506007)(66556008)(38100700002)(8936002)(66476007)(53546011)(66946007)(41300700001)(316002)(4326008)(7416002)(2906002)(107886003)(478600001)(2616005)(5660300002)(83380400001)(110136005)(186003)(26005)(6486002)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjdTV3o3RklEUlphb2hwb3RLQjZPeE92d24zWjVNcmQ4OGkreTBSSGVvR1pi?=
 =?utf-8?B?VEcvUWJ2TlcwWllteStJVURySlErSWlMQmFXcy9CaXh1Mk9nVnhMZW1GWDNm?=
 =?utf-8?B?b3pRMnVzc3c3bk1kVGN2eHV1U24wTTBNZXhNRWRxZitBL1Y2a3Ziei9FSmNz?=
 =?utf-8?B?K2pscGF5TmRmbUo2aUx1Uzh4Y2YyRmUwVzFnMUNCeExpaDY0c1drQWsxSzhT?=
 =?utf-8?B?eGZkVitoQjhlaTdFRGhYMGcyZXhGK0FwQXpNOVZQR2FMSEJiSmdycmZtNzNJ?=
 =?utf-8?B?WW94WU9UemxFeWZSMlVGZkZ4QThZR3ZmVUJLa3F1YXdTWFZ2eHhuYTN1Sk9Z?=
 =?utf-8?B?dDhaRXZ6dVRWa2N5TFhFcXJVaUtDQUp0YXdCdmhuYzQwUnE1bW1WQ0RNUXpn?=
 =?utf-8?B?N1FWUGtuSldqWm5nQ0haaHRqYmE4VmQrbkY1QUpaS2FtbnBUSzJSb2Vsd1pm?=
 =?utf-8?B?eUlvL3Q2MVUxT2VJSXcwL242VnNFRlVibExDK1ZmckxhSW5vUXNrWGN0TDhu?=
 =?utf-8?B?cDJlNXMzNklVekJrTTBTL1BPRWR4NE5RdEgrUGJoWWhURTFLMEN1aXY4U29h?=
 =?utf-8?B?bWdNUm9ZQzBRVGtpaEZzK2Jqa2hiOFNkdmtkeTZHK013QXhZbWhGWmVIRHpZ?=
 =?utf-8?B?WFRVeGgvbEdzdzdldmpRN2NmTnpEOTZkOUFFaEkrK2NzWncwYTQxcXJkQTBr?=
 =?utf-8?B?UDNlVHZDTmVwN3dqcWdkK0RINHd2K3ViZE5RbjVKM1hId0hJUkVHNWUrVEpx?=
 =?utf-8?B?eXNpNDNYdFRBc0o4TU1tclNPeDRoTk5UaXNyNnllMlhTNzNpOStsc2dOYi9B?=
 =?utf-8?B?clhWQXZISUxLYWErZkNHbnJWY29KZklBLzJONk5uczBuTGhhRzFaZ1NhRDRp?=
 =?utf-8?B?TlVxZkczQUhRcXJBYXg4eHhiNFRUeTlPYzBORXpjWTNqV0NYTFMvSytRK0d2?=
 =?utf-8?B?TGhOcm0xSTdmSkdvczJGT1pOYzg2ZHlFT082elNGTXgxZEZlWnFyVzZJb1V1?=
 =?utf-8?B?RHp3MGRZa3FHa2hMU1d3cVErZDFLNFlZL2JKZVV0QkpZSlV3WnNQK0VKYi90?=
 =?utf-8?B?WnZuTEozRjFLNGFNSytEanNkaWlaR3U5cEhtYnFNcU1wcVk3ejBKWDk4bzhz?=
 =?utf-8?B?Z0o0NEUxQ3VSSlJubzdyc1YzWTBzaGFNQ0JzaFRyc2lyVkZ0MU5JWm1hWVRU?=
 =?utf-8?B?bEVlaDR5aDR2S0hRSGFYRDdjaE1JTnNiYXFXRitzN09yZHVYcDlYODNZOUo0?=
 =?utf-8?B?NkFvT0NjeFhEVFhneDV2SjJiWDV5MHU4ZkZTNWptR0pGMDBwTEJ5NnhpbXBm?=
 =?utf-8?B?Z29YQk9rQnhoMDVaWDNoYllLWTR4R050UDRhU1Qybkk2TDVXU1NwbUhtWHpr?=
 =?utf-8?B?NE5TV3k3ZmVLaXZFMjNGNks5b2VxMURwbDlXZ0J6RStNMlROU0tWUDVVVG1N?=
 =?utf-8?B?UHFaR2dkcG9OVCtGMXZFZTI0cnpqT0dhamNjSlp4dVE1cXZGTWtmTjBlVzZQ?=
 =?utf-8?B?RjNPcnZ4eDhJazlrNis5dHNNRGEzVVdmU3BrWDlDanZOWEYwSldvbExsMk1n?=
 =?utf-8?B?SWdEeUNQSWFIQytSR0Q3cXJ3REN1eXdlUkZCcUxQakN6L2IwZDgwVFdjMTRq?=
 =?utf-8?B?SkFHMHZJOUp1Q1RzMWs5dGdHY21CdUtTaG1Uajlpc1RmUFlXR2o0c3V1aDRY?=
 =?utf-8?B?VXJ0TDFqV3FNU3NzMzJwbTBkZGpHYS8zYzYrWHNoTGhZN01XQXBzUzZTa3ky?=
 =?utf-8?B?aCt3YzluWmlwTjUwNnNpNHpEMWJiNkNwRHNnRTJZQUErUmMrS1gxQzV1Ri9v?=
 =?utf-8?B?KzdlV2V5d2hGTk53TWk2MkQ5bUM1TDNqVmQyRENqclpPRUY5MGJnRzVrbklG?=
 =?utf-8?B?eTVQWFY5UC96TGQyd2ZzTUVrd1lVRit0c2ZOSDNUMWJEcFVaRHJqL2JZZCtu?=
 =?utf-8?B?Y2R1dDJDMDJQcXR5UkJVV0syQTYrdWc2ZVB3SGVCRWtEVTd2VTVtaWxMOEJr?=
 =?utf-8?B?UmtBQllrRU1vZ2dpME5OSU53TXZnMHhsbGFjNTlwRVFIaFRTVi92SWNGdkdW?=
 =?utf-8?B?T2llb0dmZXltTWU5NnhxMDg2QU80RTgreXBPdzFxNFVpbHFWZ2tZRWgreHhY?=
 =?utf-8?Q?it0ha0Dkk721pRpYMuY2Nb05J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160177ac-2213-4f38-1ca2-08db050df161
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:09:24.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMsgFzj5y1pE0+L8ibfOJ8eQSCFELd0GNPWv6NK0rx1FyDa6ZEkVz7PqlnYikIQ2wDp+l+dZG42sKsrunalGqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5852
Received-SPF: pass client-ip=2a01:111:f400:fe1f::715;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 11:19, Fiona Ebner wrote:
> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>> On 1/31/23 18:44, Vladimir Sementsov-Ogievskiy wrote:
>>> + Den
>>>
>>> Den, I remember we thought about that, and probably had a solution?
>>>
>>> Another possible approach to get benefits from both modes is to switch
>>> to blocking mode after first loop of copying. [*]
>>>
>>> Hmm. Thinking about proposed solution it seems, that [*] is better.
>>> The main reason of "write-blocking" mode is to force convergence of
>>> the mirror job. But you lose this thing if you postpone switching to
>>> the moment when mirror becomes READY: we may never reach it.
>>>
>>>
>>>
>>> Or, may be we can selectively skip or block guest writes, to keep some
>>> specified level of convergence?
>>>
>>> Or, we can start in "background" mode, track the speed of convergence
>>> (like dirty-delta per minute), and switch to blocking if speed becomes
>>> less than some threshold.
>>>
>> That is absolutely correct. It would be very kind to start with
>> asynchronous mirror and switch to the synchronous one after
>> specific amount of loops. This should be somehow measured.
>>
>> Originally we have thought about switching after the one loop
>> (when basic background sending is done), but may be 2 iterations
>> (initial + first one) would be better.
>>
>> Talking about this specific approach and our past experience
>> I should note that reaching completion point in the
>> asynchronous mode was a real pain and slow down for the guest.
>> We have intentionally switched at that time to the sync mode
>> for that purpose. Thus this patch is a "worst half-way" for
>> us.
> While the asynchronous mode can take longer of course, the slowdown of
> the guest is bigger with the synchronous mode, or what am I missing?
>
> We have been using asynchronous mode for years (starting migration after
> all drive-mirror jobs are READY) and AFAIK our users did not complain
> about them not reaching READY or heavy slowdowns in the guest. We had
> two reports about an assertion failure recently when drive-mirror still
> got work left at the time the blockdrives are inactivated by migration.
We have tests internally which performs migration with different
IO write rates during the process. We use such kind of tests
more than 10 years and before we have switched to QEMU
from previous proprietary hypervisor.

Once the switch happened, we have started to experience
failures here due to asynchronous nature of the mirror. That
is why we have raised initial discussion and this code have
appeared. I may be incorrect or toooooo self oriented here,
but this could be my understanding of the situation :)

>> Frankly speaking I would say that this switch could be considered
>> NOT QEMU job and we should just send a notification (event) for the
>> completion of the each iteration and management software should
>> take a decision to switch from async mode to the sync one.
> Unfortunately, our management software is a bit limited in that regard
> currently and making listening for events available in the necessary
> place would take a bit of work. Having the switch command would nearly
> be enough for us (we'd just switch after READY). But we'd also need that
> when the switch happens after READY, that all remaining asynchronous
> operations are finished by the command.
That could be a matter of the other event I believe. We switch mode and 
reset
the state. New READY event will be sent once the bitmap is cleared. That 
seems
fair.
>   Otherwise, the original issue
> with inactivating block drives while mirror still has work remains. Do
> those semantics for the switch sound acceptable?
>
>> Under such a condition we should have a command to perform mode
>> switch. This seems more QEMU/QAPI way :)
>>
> I feel like a switch at an arbitrary time might be hard to do correctly,
> i.e. to not miss some (implicit) assertion.
>
> But I can try and go for this approach if it's more likely to be
> accepted upstream. So a 'drive-mirror-change' command which takes the
> 'job-id' and a 'copy-mode' argument? And only allow the switch from
> 'background' to 'active' (initially)?
That is what I can not guarantee as we have Kevin and Stefan here. Though
in general this opens interesting possibilities for other use-cases :)

> Or a more generic 'block-job-change'? But that would need a way to take
> 'JobType'-specific arguments. Is that doable?
>
> (...)
>
>>>> @@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job,
>>>> Error **errp)
>>>>            if (s->in_flight == 0 && cnt == 0) {
>>>>                trace_mirror_before_flush(s);
>>>>                if (!job_is_ready(&s->common.job)) {
>>>> +                if (s->copy_mode ==
>>>> + MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
>>>> +                    /*
>>>> +                     * Pause guest I/O to check if we can switch to
>>>> active mode.
>>>> +                     * To set actively_synced to true below, it is
>>>> necessary to
>>>> +                     * have seen and synced all guest I/O.
>>>> +                     */
>>>> +                    s->in_drain = true;
>>>> +                    bdrv_drained_begin(bs);
>>>> +                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
>>>> +                        bdrv_drained_end(bs);
>>>> +                        s->in_drain = false;
>>>> +                        continue;
>>>> +                    }
>>>> +                    s->in_active_mode = true;
>>>> + bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>>>> +                    bdrv_drained_end(bs);
>>>> +                    s->in_drain = false;
>>>> +                }
>>> I doubt, do we really need the drained section?
>> Frankly speaking I do not like this. I'd better would not
>> rely on the enable/disable of the whole bitmap but encode
>> mode into MirrorOp and mark blocks dirty only for those
>> operations for which in_active_mode was set at the
>> operation start.
>>
> Do you mean "for which in_active_mode was *not* set at the operation
> start"? Also, the dirty bitmap gets set by things like the
> bdrv_co_pwritev() call in bdrv_mirror_top_do_write(), so how would we
> prevent setting it? The dirty bitmap does get reset in
> do_sync_target_write(), so maybe that already takes care of it, but I
> didn't check in detail.
>
I thought about something like this

iris ~/src/qemu $ git diff
diff --git a/block/mirror.c b/block/mirror.c
index 634815d78d..9cf5f884ee 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -230,7 +230,9 @@ static void coroutine_fn 
mirror_write_complete(MirrorOp *op, int ret)
      if (ret < 0) {
          BlockErrorAction action;

-        bdrv_set_dirty_bitmap(s->dirty_bitmap, op->offset, op->bytes);
+        if (op->need_dirty) {
+            bdrv_set_dirty_bitmap(s->dirty_bitmap, op->offset, op->bytes);
+        }
          action = mirror_error_action(s, false, -ret);
          if (action == BLOCK_ERROR_ACTION_REPORT && s->ret >= 0) {
              s->ret = ret;
@@ -437,6 +439,7 @@ static unsigned mirror_perform(MirrorBlockJob *s, 
int64_t offset,
          .offset         = offset,
          .bytes          = bytes,
          .bytes_handled  = &bytes_handled,
+        .need_dirty     = s->job->copy_mode != 
MIRROR_COPY_MODE_WRITE_BLOCKING;
      };
      qemu_co_queue_init(&op->waiting_requests);

iris ~/src/qemu $

Den

