Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B438FFAB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:02:45 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUpg-0002Jt-Hb
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llUnH-0000QE-ML; Tue, 25 May 2021 07:00:19 -0400
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:20450 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llUnA-0004Hp-Cx; Tue, 25 May 2021 07:00:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF9DHM20RlMHF7ZHu4Mj0CyuSySLG3q4qc65xxuVDmb0N0SAxMbIZ6It1Do2Dw0Sg16eOufXb6ciu1/1/NF2MbEfeqlF0uEWz78yT7s1WI4k+7JS0z38mBiy2h9ZVXPEu8IQPHEJaUWK7EFtqzyEclr6erLgD5811bEJVD+3S+wDNkT8N9PzH/5UoxC5kuewKsJy1YDxp5TC7jIAS0jGnV+Ufptza3sW/Fg/f2fL8IgN5IpeHxGy3iPppShXt9O/nMdlCrMejwAaZiUegGX7lA85CG7QtyauY2nU84u01l2pdbVyJBJIr+1A3gEwvn3HmdL4FU4N8b6CdDHgAF9q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2JEK06CKP246f8NjxaaJhQv5Mt8RuWqfxnhrCKpdyA=;
 b=X2OqB3pj7l0whxAImGcvAAMkfFLmj55BSBsnR2KyiZg8WXXARuQ+r/2i5i5rCccYi5RqDSUTRzqBTGsR6ANGTOf9ERQFp0uwNi2sYzXr9tydSoaH4YBffvEvduomjdQgyP1Gi29DLlZsLkKl++Kh2Q4pD1WJXD/28exX+2ogVzKSnK/RouOYx9Y340K2qko0JA+A3mXZo/vpBJWhjPsl6Fhinc84cgfjfiYoqCTAnpeInms+2dl9M5kk2nD5u4kyvJLrl+Vc89X0w+V2QW8kLse3yUOaDdpHMUBQ2q1XYDFaHeSEbig7szsKloK8N+Gq7s31+A8m3m5x5KzCHbTnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2JEK06CKP246f8NjxaaJhQv5Mt8RuWqfxnhrCKpdyA=;
 b=Z6m0s1GpuJgPDIdiA2Q5ElgCpom9xLmj4ZuSvYy1SwH1xAVBOjg6DNMzqtTduu4tNRfLsz8lKbwtZPdbS9wY/KhcUin9JjVZk7LPg0HiysYiHokEPmBoaScJJ3WhApRcUqtMz8BvCyzNwBOYwNt1z1DI5+V+XvFEYxeRZEiSmjM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2449.eurprd08.prod.outlook.com (2603:10a6:203:9c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 11:00:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 11:00:03 +0000
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
Date: Tue, 25 May 2021 14:00:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM3PR04CA0137.eurprd04.prod.outlook.com (2603:10a6:207::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM3PR04CA0137.eurprd04.prod.outlook.com (2603:10a6:207::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 11:00:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da7a4067-6e28-4451-210e-08d91f6c3fda
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2449:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB244955374226713B9C632AAEC1259@AM5PR0802MB2449.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4pIuWqbkmVI29LGy9xqA8bi20OxTqiO1UP8ko4i/e9b52dxfthYywc3UIdS3fS1V15YmuUZs44jpMyuBnSbJXeNPYjl7prYSuJuThLUfoRYsAZRdn2p/YWwd/IqtZtXtIV8Yj91IaLVOPi/GhqNt/ahH/WrGMmLmoSKHWuJTCpySwPIVPNIqE3mNz1MHy3rzJZ+dqPkRuG4R7AAr1SJZs+i2xX5rq4YOxQGeQrn7ZYnrhz9Jkc3u/zczOwAEb1xYzHPsCBmGJFx73M8VEf1FedRZ0FeFA432kI2nlF+dmEUOV1EGstI72JErDkAfGYDD1tXHkr3V2osmxz4AsFccmMiYgtZSdk2DDlo35NPrQ5ar+SinkE/WQ6dqMz9rbNqgvhgfaUP/8NQT2HNcNn1OiBYtkgxqKsrRSenLK3lFdJbxERbGY5MLF7h6zAMwLxwbJ5ftmpj6WH2XluSpImAtYoWZ7cRXRgu1A4Wfx2RfoA4B6/ptktvSM/sIFfJNnvM1KQxmetm1eGo9SV0xjOBL9/E7axwzQeqwFEkK3zCOZCxssSn58nOclMac5/OM8TBUlOb5lQI8tMikHzT/lu44tJezOtEIqX8WwGdih511BZJE0jWmwlm3xsv49hTOvleBjOrjGaxig+CdqgfO6ysVzzAcwCJE0QCHoJjlNYEo2OobHsWSztQeMqxc8Xxik0FKCS61fRW6B3PS4XDQsPgGTGsoPmqVejaIS/IL7rqVb4epfa8zW8qXjb5h2ztXJNe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(346002)(376002)(136003)(66556008)(66946007)(4326008)(66476007)(8676002)(31696002)(5660300002)(38350700002)(38100700002)(86362001)(54906003)(52116002)(956004)(2906002)(16576012)(31686004)(16526019)(186003)(478600001)(36756003)(83380400001)(8936002)(26005)(316002)(53546011)(6486002)(2616005)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVlYdDdUczBnYTQ1dk5IR1QwNklPR2RTVVFKSUljZVZCeHhyZG84TWtZV1FZ?=
 =?utf-8?B?MjFYeGNqM1JmaUVYNTFBS3FGZExBQ1EvUzhLNGorbFQyaEJMak1XYzFRbjd1?=
 =?utf-8?B?eW5qRGZpVGFnL1Q4LzFyRlFMelYyT0grY2ZmbkZBdHhXbWQ1aU9PZTJoMXo3?=
 =?utf-8?B?Y25qazVaaVVDZDBVb2kxZlVjR3luV2s0WWd6dTdEVW9NT0g5dGEveWNCZkdC?=
 =?utf-8?B?aWxRZVI5Z3VCTWtUY3ladkVsSWlaZjd4RHZ6bGF0WE55VUFrYVNBazhhNFFs?=
 =?utf-8?B?L3NVbG8xVS9aRjErR21aWDhtSm5GKzZMUUxPUUlFeGxFUlhZTVpHQlhJMlI0?=
 =?utf-8?B?WmlqSzZ4U2dKRmNUNkZFTkN3YlNmcFZxS3hNUjRUZWQ1dGFmdDlmNVhkd2Rr?=
 =?utf-8?B?ZG1NcWIvZVFxZkZwc1ZSTXdWNUk1dDFpVWc3WDBMUVBKV2Jhd1lWUzJGQURx?=
 =?utf-8?B?NjlIbWJ1YUx4eVBUMUFtcHc2NlgwUUNoR3lWZk0xaUJueDUrM0daaTVpZjQ3?=
 =?utf-8?B?U3gvQ1JCT3IwVVZ1Z0VvcjhmZDgyRHB3bmJXOURGa1F0L1pNNzFlM25FeENt?=
 =?utf-8?B?MmdQRCtLN0RGaEovS2RyS0hoclJNZ2h1SFRDZFJTTGV5VnVpK2FyaHlneXdQ?=
 =?utf-8?B?NFBYbGtvakZGUEZ4QUhyQjUxNFhRWFVPaDNCbVZFMG9FdkxsaGZmRnNLM2w2?=
 =?utf-8?B?MW5qUDFsa3o4RllqSG1WYlUrdnU1V0Zxc1cvaDhaaldDS2VCQjI3M0l1eVdn?=
 =?utf-8?B?NkowNlg5SXpsOVU1ZEY3TFZCSlBlKzYyZnAzM2lFWW5sdFpmbHJUZ2YvbHQr?=
 =?utf-8?B?ZUQyU2o2YmVCTG5EYVdGOXNRTEhWYW1Yei9QUVN2ZGd4YTdnK05SejJmdm9B?=
 =?utf-8?B?Q1NzSjkrSEU4b05OVmpHTzJGYk42TU9MMDJMazZFaklqTUF6a1JZOGdDM2Vl?=
 =?utf-8?B?MlZvNWhOeW5FUFBJTnRGV3BURDBYS1lBQWpweEFSUEVMZ3VrT2pEUVVXa0R2?=
 =?utf-8?B?dCtkVlhJdXYzeEFBUndWZDJZOWpLcVh3bkNIeWZqWlBsY2hUcWZ4SStTenZw?=
 =?utf-8?B?RlRVRVRFWS82ZWF2Ri81TUgzT3NSbElpcEZGZDNJY1cyZks0eGdtK3JyMUR5?=
 =?utf-8?B?ODg4dzA0NGpyNG5xOTB4V3Q0bFhIOC90Ymh3WFdNRllOVEs4OXYwSk5tNU1u?=
 =?utf-8?B?bnlueTZqeEtLcDNjVnJtaTBib1ppdkZFcUVaeTVIajAzMDlmaFROOEhjcW5S?=
 =?utf-8?B?Q2w1NjBLdkdBR3pOSnlHc292U2pXSDJmNmVTYzlzanhEOEFJb3E3QVBGYW9k?=
 =?utf-8?B?N1JjVGZCSUxlMTJ0KzZ1YXRIREVnZUdqMVgzNnhockpKY1hTc29mTGorMnFX?=
 =?utf-8?B?cU5zbHBMZFJyUThjYlFWd0ljMWhvQklOSVovQUVDZUN3WTlzeGlKRFhwWTlk?=
 =?utf-8?B?S1FLbXc2WWNaNE1DbllxOGVyQ1VDLzdTbFpScnNyWjRuWk5TbnpnQUtITU9V?=
 =?utf-8?B?RGtRcUI1L2c2eUhRek5lQnhQVHJIV2FUdGFKMHhjSXk2TkR0cnNYQVhJNjF1?=
 =?utf-8?B?NlJnR1E1Mmc4cGYwNXN0N2dVaGh3OCs1MS9KdndSNy9GWWVqYUE3VzR5NWVi?=
 =?utf-8?B?UW8wZHVlV3cwcGJXR1JOeUcwaVl4YzhsRTFPNWt2cVF6eDlvNnYybGd5ZWsy?=
 =?utf-8?B?VW5NcDAwMnB5aXVGSUx6VlU1cXlSYXVpblpEbVl5bmZReTBaL0Vzck4wK1Zo?=
 =?utf-8?Q?HCIloQRIm2QKtlSDGfznYKsOmEZMiP+qpWVYOgS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7a4067-6e28-4451-210e-08d91f6c3fda
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 11:00:03.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb4FUM/WTe8OCAViTl8TXekJLZxHbZ422b0Sly2ds/0aGdjW10Q9td6OWGtf5+WaHnso1eINGaReRj+H69xUXJjHKNIgITuAXbGzPBxYUjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2449
Received-SPF: pass client-ip=40.107.21.103;
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

25.05.2021 13:18, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 21/05/2021 19:10, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> With tasks and calls lock protecting all State fields,
>>> .method is the last BlockCopyState field left unprotected.
>>> Set it as atomic.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> OK, in 06 some things are out of coroutine. Here could we just reuse mutex?
>>
>> I believe, that we don't need any kind of protection for .method inside block_copy_state_new(), as it's just a creation and initialization of new structure.
> 
> I agree here, will remove the atomic_set in block_copy_state_new.
>>
>> And other things are called from coroutines. So, seems no reasons for additional atomic access logic?
> 
> But... why should I use a mutex? I think the .method usage is pretty
> straightforward, adding a lock (which one, tasks_lock? does not seem appropriate)

Paolo said patch 05 should go away. So, we have only one mutex. We can name it just "lock" and use for all the needs, like in qcow2.

> would just cover also functions that do not need it, since the field is modified in if-else statements (see block_copy_do_copy).
> It looks to me that an atomic here won't hurt, and it's pretty straightforward to understand.
> 
> Thank you,
> Emanuele
> 

Hmm. OK, let me think:

First look at block_copy_do_copy(). It's called only from block_copy_task_entry. block_copy_task_entry() has mutex-critical-section anyway around handling return value. That means that we can simply move s->method modification logic to this already existing critical section.

Next, block_copy_chunk_size() is called only from block_copy_task_create(), where we should have critical section too.

So, no reason for atomics, as we already have critical sections.


I think it's significant:

Drawbacks of atomics:

1. Code becomes harder to read. Just because instead of simple access to variable, we have to call atomic access functions. And the code become the mess of different qatomic_* calls.

2. The thread-safety is harder to analyze. You argue that use is straightforward: yes, it's obvious that atomic access protect the variable itself. But what about the logic? It's the same as questions I asked about critical sections in a patch 04. With critical sections things are clear: just protect the whole logic with a critical sections and you are sure that no other critical section intersects. With atomics you should analyze for example: are existing critical sections OK with the fact that the variable may be atomically changed by other thread not locking the mutex. It's not a simple question in general.

Probable benefits of atomics:

1. Performance.. anything else?

So, if we have some lockless performance-critical mechanism, atomics are needed. Still, in general lockless algorithms are a lot trickier and harder to understand than simple critical sections. Still, sometimes it worth the complexity.

But, if we already have the mutex to protect most of the logic inside some subsystem (block-copy for example), it's better to just protect the remaining bit of things in the subsystem by same mutex, than to add drawbacks of atomics with no reason. Especially when this remaining bit of accesses follows or goes directly before existing critical section. I don't believe that in this case atomics may bring better performance. I even think, that performance may become worse (remember atomic operations are not free, and simple accesses to variable may be faster).

And I really doubt, that someone can demonstrate a performance benefit of atomic accesses in block-layer. IO operations are a lot longer anyway than all these simple variable accesses.

So, I'm against adding atomics just because they won't hurt :)

-- 
Best regards,
Vladimir

