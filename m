Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABF32ED6D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:49:11 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBlO-0001sZ-1h
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIBkM-0001Gz-Hh
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:06 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:21965 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIBkH-0006z5-Vf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaF0RZZaMoTdUD1JuWv4+jBPIg3sw9kSooSg0ql5kUfpwufcTiNnd6p2kHDNkKAEVYgdjliRLDHkQab4Noi0dmG8KAj8fA1USM3hChUYJfy1gY6m6yVfgLrHh7EZ8tOzhKq3NHM+zeSEmRJuHQlJKU6ZsQjuTZnM0JPt6FlIaD+Ud2K6LHxjl34U+iAAeHsomu3R4F8QKjhtfOiZ3YgK8dCgyoLegCImK2BTK5qZcLCBdBQQpNNd85sIGB1PAAr12TFZn88r02xNgnf8JAWafohqDPJUbwOnWAWYjQQ1fkX/K0YrvEzo+YIdMUAnPaSEzsnxav2WBNv1gecwR/UZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjC197Gri29rZUXdvY7NAPEQbz/5aWwJa21GRPpNaXw=;
 b=Xu1xbFFfLgeLEFMmNT2qxY8DehX1MOs7fkO9I4PNBotGPFXc/OsGercjae5mwG6cj98iXqChXSnG18j2sFKBaw8IbmGnZ6liZCqLISwDut+rtjZuWLZYmcMy7VP+zhA0YyN/qFYf2T0TQZRXM5WoPb0jKjeZo7lbfGXIAbsKfolCmw/PX6qqZroOuVK3eMv55pzO6/ywQCPRF7fEwhk3x551tm5OHUYXQNU7lAFNAjG/EiXnTxOF9En3c5gMiFc/gLa8dGj9rx8l/6M0bJShgnMRzWwo0d2dgHntY7/MFjphzV1pCatNYFO20TIPWPCaa7iw7cTNjG5jymMDZGxI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjC197Gri29rZUXdvY7NAPEQbz/5aWwJa21GRPpNaXw=;
 b=evbU0v+Lo0ewm0c/lZnXj1rogzpKNJzM5ynqouV9ylhYSZLzu2KBd7JPAGCSGRnw+SYBR3lOFERmDgAbKqFcPpuF7S4bDeXhU4ghmMv+KHV5qd8OoRaSTi9Nh/DGS88Sx2WvTMk+I2urIs1G3MTXGLPPj6NeJKx1kXy9j78/oM8=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 14:47:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 14:47:58 +0000
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for monitor
 to read
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 den@virtuozzo.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
 <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
 <87ft19zo66.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <405eb948-cab6-869a-80eb-cca4c99f110d@virtuozzo.com>
Date: Fri, 5 Mar 2021 17:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <87ft19zo66.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.13 via Frontend Transport; Fri, 5 Mar 2021 14:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 283b6069-35d4-48d9-d6f4-08d8dfe5ab2e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6534C3179249231EF85906A6C1969@AS8PR08MB6534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQE3sqhGCmf7apXpj+cakdEj3AuVup/HubY/hPKMeh1uAoGnMl3CvSWXdq0yz1Qy/A88ikFeIhlI4u5nfNCMSNvdWt6zk1wy66V70dRrMlxI7kmVNDGVVlnBz0jHZyWgkSIL27IEL3fHa0GYReyQ7r2yknJPYLu/0MbAfLcqFGLPYT/C2wYxmmOMSHV9YDJTVB4eAIzK/mSOkiodCNM9412RsjG12LnYyQeuK/zfMT9jPawe2tGBp0DQOHmJysoUriwQgBTD5xP2jnA9fa6RKltpY637c8s0I4TigSWIgnWyL7mO+TSEUEYLvMeoZJzOpyDb28wM09767vWuQNqGFLvX9ZwxfXeZf+lUb0Al63W0XUNOnWrsS7mAb3fzeNwDV4Um9TWQAQGfhPMRQEtLa502umOQFh1UP6SeNbLi5FN2Kb6tmPBG6B5YAr/pplzeB1+DOkFXCeP3488bKoeo7wLO28fmSrbN5ia7fK2TL1tCBAaSfmBSws1JuvixGekpY5WrptSz20rYj/bl+qwIrHlfCcQUr2p1T0NCr2ve/OLcRKuHFlMLoMU68TaQUfbBUVu7spUEK1B+Fm+3Q5oCBevyO9mgLLPVvHR5xM5FR+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39840400004)(136003)(346002)(316002)(956004)(5660300002)(54906003)(31686004)(86362001)(36756003)(31696002)(2906002)(16576012)(26005)(4326008)(52116002)(6486002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(6916009)(83380400001)(186003)(107886003)(16526019)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTEzWUdJenlsYU9oT0VYYXEwbUpiZUV1aGdpY2NQNW1KalFSQnlzNFVnUTc0?=
 =?utf-8?B?NVNUZldnenIvVGt6TWtIUHNldm5jaGtMUlNaTVkzRWpqVmd3VkxwTHhHNEFw?=
 =?utf-8?B?Nk9oVTZma2JGdFZHcHA5NTdSZGZncFl1dFdqM1lzenB4bjJkZzF6YUpndkpS?=
 =?utf-8?B?MmNBcWNEVW9XelF5Y09lZHlHcUtOM0lVZ1ExWlFsYzh6alg3RWp0cGJZUHRo?=
 =?utf-8?B?QUVqRGNUMHpLaTRRcm9xcTlnbURnYitsODNnQStvNEIzU2ZGTUliaEs4blpz?=
 =?utf-8?B?bkxpb3pIdDFuRlhXaUU4czhxTUhnVktHR1E0MDNFU3VqYVlOR1NsTFpGY1VD?=
 =?utf-8?B?dk55NC8zYzhRSHFyc09SQXZVclRaV0NId2hhSmI0K0hHYkM4MFJoa0hUQ3hQ?=
 =?utf-8?B?OU1MT2tNV2lnRFRCVzZHcm13VlVQMXdGSjQ4YTB3UUx3MnZhTU1ERG5Na0ov?=
 =?utf-8?B?RHZsZkVjY2k1MTc2VzhSR1A4Tjc3a1QrSC83NFVCUmhIWDlyUXRtRG1ZRWhP?=
 =?utf-8?B?VUFBQWdlejN5dE9Fb2pJbVN4c0UvUmlMNXY2cEVlSC8za1MvM2loT0UzbWpI?=
 =?utf-8?B?R3hvRGk0bDJOZ0h6Y21WcDBzZFlpeGU3UWlXNFplY0kvV3ErdFVIVmEreUlp?=
 =?utf-8?B?bDQ0enk1aVE5dGMyNHh1UVhLRVh2MmtFdlBrRk02VXVhRGMyVWkvTnRmd2R6?=
 =?utf-8?B?U1RwZGFvVmlUUG1LcGt2emQ4amtYY3A1MjhpeG5PVU1DMWpSeEVWbGhrNENT?=
 =?utf-8?B?dXNYWFAwZ3JJdGNvRzMzbmZXMDN1TGY2eG12UE1Edk5hN2NCVnNDQU4zQ2NN?=
 =?utf-8?B?VTBtNGdZN2M1THJIclpvOFdSOS9jckN3WHkzK2lYTUJOMW95endQV0ppd0E0?=
 =?utf-8?B?MThldnNiM25yb3U3R3JsUkM0d1lXZzYzUjRWcndtYXM4eWxBT2RPUFI5cXY0?=
 =?utf-8?B?MUpZTGc1N0JnSUthVEhNVWttbVN6WnFGQ3A4MHFmUkFVZnNYQnpMOWp2RlND?=
 =?utf-8?B?WCs5NDZsOTVGVVRWRkZoTkFVNlVSNHcrYkFkRUpWRGdGWFpBTkxyZ0g1MVFY?=
 =?utf-8?B?dG5lWEdYdm5rWDUzUUZoSUxoM2RVVE51TCs1Y2hXQ2svcDZhRnhia0p2anov?=
 =?utf-8?B?cDBvaldXUGJJM2dXK2phOHpLbDlzemJyYWFHNVJXMVcvZ2RRNDl3U3pRd0Ni?=
 =?utf-8?B?aHVqQmFMa3hleFEyYlpiT2xoYmI0NDZPLy9pdjBpVnpoeFhGbnhVWkhyRWFI?=
 =?utf-8?B?ajNRUGgyNmtVcitDYkxFYUhoTVdnQytpVDE3Z0R4WjZ2dE94ampneDFKZnVZ?=
 =?utf-8?B?RW9DQzVoTkN4U0wxMkF1TUhpT2hXZk8zcUN2bGVucXRJdW1XM2M3WjcraXJU?=
 =?utf-8?B?VjQ0aXJCRFhLSlBHZ2NPMzIrZlNOYWRUK1hLeHYyVi8rdE9waGYwK3JRRExx?=
 =?utf-8?B?YlBIVGJiODF5ejN4MWh2S296WUwwcDZhbXdxUG0zdDBzUDFKRlNhU3hnZytK?=
 =?utf-8?B?WDR2U2xXVjBTTGFhZkhXRHVuMVQwUGhRdCtEVnpjbmVwMG51bDUzSnRZcGZM?=
 =?utf-8?B?TWpRZlc1WWpxMU5GSEYzSUVNUHEzdGdCaEgrODQ4VUY3bURGWFNuTU00R2Q4?=
 =?utf-8?B?YXN5dzlzUXJyaXJVa3VWQkJqdGVZaFNqV29UclVYTFlNUnJjT0JKZGswV1JD?=
 =?utf-8?B?b0xEVUNlUE5aQ1BQWUtsdDFUSHo0U2xIa1dLS3pKcVIrZmdNb3N4MG1YT3kv?=
 =?utf-8?Q?j381ujfuGuY3aslhEtueJ9bm4BYaTWdGTWiJJfu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283b6069-35d4-48d9-d6f4-08d8dfe5ab2e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 14:47:58.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+pRaPttIRjuenX0iMz6v8oxmBxAjZ1yYv/I/RuDSffj2sE6RkeZUGfHhyJhQs8/rh304dRDBygVNUcLvtuWE7WvkcKOlrMFVhNogYfksEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

05.03.2021 17:10, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 24.11.2020 18:44, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read
>>>
>>> We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.
>>>
>>> 10.07.2019 19:36, Dr. David Alan Gilbert wrote:
>>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>>> Did this fall through the cracks?
>>>>>
>>>>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>>>>
>>>>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>>>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>>>>> a lot of unnecessary system calls and CPU usage in the system.
>>>>>
>>>>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>>>>> didn't expect it to impact system performance.  How are you using QMP?
>>>>> Just curious, not actually opposed to improving QMP efficiency.
>>>>>
>>>>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>>>>> buffer size on the channel level. Fortunately, monitor protocol is
>>>>>> synchronous right now thus we should not face side effects in reality.
>>>>>>
>>>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>>> ---
>>>>>>    include/monitor/monitor.h | 2 +-
>>>>>>    monitor.c                 | 2 +-
>>>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>>>>> index c1b40a9cac..afa1ed34a4 100644
>>>>>> --- a/include/monitor/monitor.h
>>>>>> +++ b/include/monitor/monitor.h
>>>>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>>>>    #define MONITOR_USE_CONTROL   0x04
>>>>>>    #define MONITOR_USE_PRETTY    0x08
>>>>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>>>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>>>>
>>>>> This looks suspicious.  It's a request count, not a byte count.  Can you
>>>>> explain what led you to change it this way?
>>>
>>> I can explain, because that was my idea:
>>>
>>> It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.
> 
> I can't see offhand how that happens.  Got a reproducer for me?

Yes:


[root@kvm master]# echo '{'execute': 'qmp_capabilities'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}' | ./build/qemu-system-x86_64 -nodefaults -nographic -S -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 5}, "package": "v5.2.0-2359-g0b9242f339-dirty"}, "capabilities": ["oob"]}}
qemu-system-x86_64: ../monitor/qmp.c:400: handle_qmp_command: Assertion `mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX' failed.
Aborted (core dumped)


[root@kvm master]# git diff
diff --git a/monitor/monitor.c b/monitor/monitor.c
index e94f532cf5..41679241b3 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -562,7 +562,7 @@ int monitor_can_read(void *opaque)
  {
      Monitor *mon = opaque;
  
-    return !qatomic_mb_read(&mon->suspend_cnt);
+    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
  }
  
  void monitor_list_append(Monitor *mon)





> 
>>> So, I decided that if we allow to read up to 4096, we will not add more than 4096 commands simultaneously. And that works..
> 
> Uff!
> 
>>> Still, now I don't think it's enough: who guarantee that we will not read new commands when queue is half-full?
>>>
>>> I think, that we just need two limits: QUEUE_SOFT_LEN an QUEUE_HARD_LEN (suggest better names). So, when QUEUE_SOFT_LEN is reached we do suspend the monitor (like when queue is full currently). And in monitor_can_read() we allow to read (QUEUE_HARD_LEN - QUEUE_SOFT_LEN). In this way queue will never overflow the QUEUE_HARD_LEN.
> 
> I'm not sure I understand.  Maybe I will once I understand the queue
> overflow.  Or revised patches.
> 
>>>
>>> Also, what is the minimum character length of the command? I just decided that better safe than sorry, considering one character as possible full command. What is the smallest command which parser will parse? Is it {} ? Or may be {"execute":""} ? We can use this knowledge, to understand how many commands we should be prepared to accept, when we allow N characters in monitor_can_read(). So, 4096 is probably too much for QMP_REQ_QUEUE_LEN_MAX.
> 
> I'm supicious of solutions that tie the request queue length to the read
> buffer size.  Maybe my suspicions will dissipate once I understand the
> queue overflow.
> 
> Now let me answer your question.
> 
> The queue is fed by handle_qmp_command().
> 
> It gets called by the JSON parser for each complete JSON value and for
> each parse error.
> 
> When the JSON value is a JSON object with an 'exec-oob' key and no
> 'execute' key, handle_qmp_command() bypasses the queue.
> 
> Anything else goes into the queue.
> 
> The shortest JSON values are 0, 1, ..., 9.  A sequence of them needs to
> be separated by whitespace.  N characters of input can therefore produce
> up to ceil(N/2) JSON values.
> 
> Input that makes the parser report one error per input character exists:
> "}}}}}" produces one parse error for each '}'.  I believe every parse
> error should consume at least one input character, but we'd have to
> double-check before we rely on it.

Aha. Let's check will it crash:

[root@kvm master]# ./build/qemu-system-x86_64 -nodefaults -nographic -S -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 5}, "package": "v5.2.0-2359-g0b9242f339-dirty"}, "capabilities": ["oob"]}}
{'execute': 'qmp_capabilities'}
{"return": {}}
}}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
}}}}}}}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
{"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}
}}}}}}}}}
qemu-system-x86_64: ../monitor/qmp.c:400: handle_qmp_command: Assertion `mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX' failed.
Aborted (core dumped)


So, yes, we crash on 9 '}' brackets..


> 
>>>
>>>>>
>>>>>>    bool monitor_cur_is_qmp(void);
>>>>>> diff --git a/monitor.c b/monitor.c
>>>>>> index 4807bbe811..a08e020b61 100644
>>>>>> --- a/monitor.c
>>>>>> +++ b/monitor.c
>>>>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>>>>    {
>>>>>>        Monitor *mon = opaque;
>>>>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>>>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>>>>    }
>>>>>>    /*
>>>>>
>>>>> The ramifications are not obvious to me.  I think I need to (re-)examine
>>>>> how QMP reads input, with special consideration to its OOB feature.
>>>>
>>>> Yeh that was the bit that worried me; I also wondered what happens with
>>>> monitor_suspend and things like fd passing; enough to make it
>>>> non-obvious to me.
>>>>
>>>
>>> OK, I don't have answers..
>>>
>>> Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.
>>>
>>> I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.
>>>
>>> If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.
>>>
>>
>>
>> ping here, as a replacement for "[PATCH v3 0/5] Increase amount of data for monitor to read"
>>
>> If no better idea, I'll make what I propose above (with two limits) at some good moment :)
> 
> Digest what I wrote above, then tell me how you'd like to proceed.
> 

Ohh. Honestly, now I don't have time to dig into monitor code and prove that everything is good. It's OK for me to postpone it for some future time.


-- 
Best regards,
Vladimir

