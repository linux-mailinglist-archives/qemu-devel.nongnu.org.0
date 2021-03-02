Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44132A75C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:09:01 +0100 (CET)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8W4-0001Wf-De
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH8TP-0006nj-R8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:06:15 -0500
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:51332 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH8TN-0007B3-HY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:06:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MckxjOxoTMXD2kYQ9nnC0xbmCqijx/lgHqLcRrCviPw5iyOC93erGU16hr0BHj44PSrJDTE4AgDP8rRbSKt+uSzNTyg6Z7ZiSJpcTCynbA+mVLg9hWuDv6n3zBOd0d3H2VmBPugefB6rU3uOGC3JVZmBHhK8mkvWmFpm3C/RnVlembJp0AtAf+KEa+Rjx7Ks40F964lPynNtu14UfK+I1Yapdoh3Nnreha6mQqN1QxXBPOZsggtJZCmS7CBePX3UdyfbUFeYwuLr82zQB33R1MpF0fHdvm7hJEbLRO+4Zbk5q1S1zXm2JSmYlNoUNRvc5VSqsOrb2dySTsVcKL5ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBI8sD7dgkifx5NxD2CMYgXQi9foiRRO7NEm/hVynLs=;
 b=WKglX1uydzRp8VSAPaUSmKarMz+Lqft3Wb9iM1+GpNwfEyKKieHDkg+SYSo+xDKYQO4aEWwr+uk3C29DZR/NlQ4LnvzFV8vehzWeltYhiARvCp7phK4vX0+SJjobtOLveQEkIL3jHgfaz3cNtigqaUfOv1ZDs4d1QP8MePow+q4iP3ICjVpgCV82NNW10dkZmzc8kgh/f3VJtKiyNVVjImTCnaFJTIx0nWgouxOZyRpFlI1zh8RhP5PYcKEJvgrOxnL0oio42L3Tje+Nkzk2bpwNnsozDFpspGIUkPXA5NNol6sf77M0ONHZI2QrN9hygi+8RrnlAFFHQ8FNPfDJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBI8sD7dgkifx5NxD2CMYgXQi9foiRRO7NEm/hVynLs=;
 b=atqGdwNrkYXHYE0U9U77wVc1vLJOAaFn+vK/b40bqokzWxNcIlmZTDqDGBpT/iu662xpzInh0HmzzJhdB4eb6HcmWxkriwf5g8t+3hDlnIbeTSy7YeXD8uBzUUFzj8h+gmllaxLmEFL664MkBimrBb96tO+2GC19C3z3EbyRgdc=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 17:06:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 17:06:07 +0000
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for monitor
 to read
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
Message-ID: <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
Date: Tue, 2 Mar 2021 20:06:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::49)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.246) by
 HE1P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 17:06:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 144a0875-fceb-4066-e83b-08d8dd9d7807
X-MS-TrafficTypeDiagnostic: AM6PR08MB4024:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4024089C6D1FD9248BA3D39BC1999@AM6PR08MB4024.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i6zObW2H4m9KWKa/PJtzv7mJOaMUjtOGFCFTvxieAo0WDv3PkMeYBbk/hiKl4ap4B80jZdkFE84+wdQ/UM9Sg1ko3y2885uJ1gpg991KRDKpQqJ+9cwSHv3e5IwBGrvRSHHTiNmzRh9icCwS706HA71ZHXmsL+hOSBiBDEZgHfnF9k/jCJ1lfFfbLI0MDK9/up9+KqFFTupl7Xual9FdoiNZ3lSCQWBKrNE0fsVe5cbLooWpQt6UI6M12xAls1tt43OkS08xEqu7tQ99KkLBxQ5uag/dkHrMpW9P2TOf86Yyl+t+6KQtiVTpTVtCUJQNBhdiw83PkAqx5iQz5sLWmiEduo93wmqgSjpjWofXw73Ttm6s4etlB9ksNORW8VRQI4oiPoPN7qZfEij+lu04a6uw1qY7zNwiFYlUsIVZC/ugmviw+QB7v+rta32N/q/dVqdgq6SA2l5I5V7xrtmc5OUlrI0NhQLlEirhFybC5f1Q6E6Wa0aYO61pvbIv+SQNQ5adJWjS1+dY7AGozo48Q7iofQxtNeEoQRKMtlNYwBnMcGe76Xw1oi8Uk4ENkf3Dep5FTfuFtbAO6DOgohZ4Ix2rFxF0qkdOlIhZNjd2+7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39840400004)(366004)(66946007)(8676002)(66556008)(31686004)(66476007)(107886003)(36756003)(86362001)(31696002)(8936002)(16576012)(4326008)(316002)(110136005)(6486002)(478600001)(52116002)(2616005)(956004)(16526019)(26005)(186003)(5660300002)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnNVNzVCWm41U1BvRzloWGRQOUpjNDRCS0tXbmEzRitNVXpOeFlsVHRYZW9l?=
 =?utf-8?B?ZkFJeHZEWDdkUVdmUnVLM3kxVU5mTFVFUDV4VmREaS93Ylk2WjFGYk9qRVEw?=
 =?utf-8?B?YzhTbXg1THB0MDhwUTh5QytZNkxJU2d6N2wyd1o4ZGFDSE5nSWgzREVydExl?=
 =?utf-8?B?SzhHNEhERlFIWVVpOUp6UGVLNVdjNXlrSXEzWHJKZkRRMDBnWFY4cHJVM3Vz?=
 =?utf-8?B?azFKaUxKUHN4bG1lM0x1R3BBMFFpWml3aS82VENTTWUydHJKVS9UelM0Rzg2?=
 =?utf-8?B?Uk9WL0lBVUg2bTNOT0hQZE1sV3NmY3o3dGdWdGpvbDdTTHJvbkdUVzhoME1z?=
 =?utf-8?B?bms5MjE3a2w0UitOcnJTcnQ5TUxPY1Jqc3JIaWNyaUtXaXkrdGxndVN1eUtW?=
 =?utf-8?B?QTYzRnFvUW5EZWR0THBUWkVwdUIwUGRKaGF6STZzc0JtamFoS3hJQnRUOFA0?=
 =?utf-8?B?STF6dzZrWVl5aW9VYnUwTWVEaHF6MWFSVXltTGNUbzVjTExQOVJiWEUyZW1F?=
 =?utf-8?B?RTlPWmNLMEFqMTNnenk3eG41R1ZtMDdpTStITmFpWjRQQW5MNmhITTlrTjI2?=
 =?utf-8?B?QThRTDcrZDBZa21ZMTk4M1FaakJ2alpWYUtMdXNaMExWdUU5UUZDbWd4RTVU?=
 =?utf-8?B?VEJET0ptU0ZtcUd4Y0NNOEMralRmMnUyenhZMkc0YXVFd0JjaENyUmpnT2Zp?=
 =?utf-8?B?aW5Zekxpd2dwWmJKRjloS0ZoSUp1ZWxCRUpCalNuUERtcXBPQXE5b09EVnNi?=
 =?utf-8?B?SXQ5bDVkd2M5UEIxVTRQVVhvSXRDS2FYdEh6SzhSc1I0Z2E3QnNUMFUwU1dT?=
 =?utf-8?B?S0MvOU5NOFlDeW1tTlhXK0tsZG5uWmJtNC9rZ0piZnFpaHhMUG5yN1V1S2tO?=
 =?utf-8?B?bHBzcm1jSDd2NThiZmsrcS9PMmdKd051UTJVaEZJNjcwK3JMYUhOVFJ0clVY?=
 =?utf-8?B?YlRBOHRxdVFISDhOTjNZbDhkMHpUZVcwZzFxMktvanZ3UU1wREEveTNVNEk1?=
 =?utf-8?B?NTU4MGM0bnZuTmR2cWZjYWF0aWI3Y0dRc3N1elBPa25HL0ZmRFZqNThYc3pV?=
 =?utf-8?B?c2xPcGVtbUJoS0lITHBCdldNSFM1azlTamxDU3AzRDJ3VkNXdWt6UXp2S1c5?=
 =?utf-8?B?ZnY4VzcyNGF0WmpGTHRoMVNWZmNldG8rVldNUnFQR3gwWWY0OFBSS2dndTUr?=
 =?utf-8?B?OE02TUE5cGxhVnBzbzZveHVqbVNKbUJOMnNTbFNsRHZXT0dNUGZIMDhxWG4w?=
 =?utf-8?B?MXFyc2lLWVRJMmVrMXpLQzdmZnIraktlT092YjRqR3NwSUZaczlhV2s3aFBY?=
 =?utf-8?B?MG0wemxzdlVnL0FBNlBxMzk5RVJUWGVjR2hZU2RCNklxTGdxRzdFM1RtL2Y0?=
 =?utf-8?B?SmJ6cHRDL3FCaFlwSWlhdENHUEJGSHBaWmlDZ0J4KzZJQmlwVGgvZDkyTG5t?=
 =?utf-8?B?ZGlDNnRCVjRhYnRIbVhwdC90NFgyY2NZTkhsZTJwclVSZURqK0w2VlFIcE9B?=
 =?utf-8?B?ZDVRelVRdFpMTk1kcEkwVGFxOHBjTGxMUkRaelEwVWpleEVSNUtINVpsZFRE?=
 =?utf-8?B?VlkwUk55alZ3bHFmN0E4b2JhL0ZObWt5WGQ3ODc3ZnF3UGUreWV1cFplYzJQ?=
 =?utf-8?B?dG51RjlMbkpUMHUvSTF0TGIrYjl0b2lac0dtQjMrajV3K3BwNjVoVWh1U3Nu?=
 =?utf-8?B?MG90SXdmeUUydy9lTWJVREFVL0N2UTJlVDB2dzFCRjRJWElVbE52bEhBNFNT?=
 =?utf-8?Q?tL808UN0Eoytcfm9a6oHuG/YHSm/cfCIPNIGlSm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144a0875-fceb-4066-e83b-08d8dd9d7807
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 17:06:06.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oOCN591jaakVmym6qibxBEeEovXsfhf4eqxIYWDg000HpjL0iQnoGw0yrS02N2J0jKl1HfEy/h+NpWFiT6IoEC+FXW9+UL1B0KjYjQ0s3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Received-SPF: pass client-ip=40.107.6.131;
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

24.11.2020 18:44, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read
> 
> We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.
> 
> 10.07.2019 19:36, Dr. David Alan Gilbert wrote:
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> Did this fall through the cracks?
>>>
>>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>>
>>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>>> a lot of unnecessary system calls and CPU usage in the system.
>>>
>>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>>> didn't expect it to impact system performance.  How are you using QMP?
>>> Just curious, not actually opposed to improving QMP efficiency.
>>>
>>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>>> buffer size on the channel level. Fortunately, monitor protocol is
>>>> synchronous right now thus we should not face side effects in reality.
>>>>
>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>> ---
>>>>   include/monitor/monitor.h | 2 +-
>>>>   monitor.c                 | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>>> index c1b40a9cac..afa1ed34a4 100644
>>>> --- a/include/monitor/monitor.h
>>>> +++ b/include/monitor/monitor.h
>>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>>   #define MONITOR_USE_CONTROL   0x04
>>>>   #define MONITOR_USE_PRETTY    0x08
>>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>>
>>> This looks suspicious.  It's a request count, not a byte count.  Can you
>>> explain what led you to change it this way?
> 
> I can explain, because that was my idea:
> 
> It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.
> So, I decided that if we allow to read up to 4096, we will not add more than 4096 commands simultaneously. And that works..
> 
> Still, now I don't think it's enough: who guarantee that we will not read new commands when queue is half-full?
> 
> I think, that we just need two limits: QUEUE_SOFT_LEN an QUEUE_HARD_LEN (suggest better names). So, when QUEUE_SOFT_LEN is reached we do suspend the monitor (like when queue is full currently). And in monitor_can_read() we allow to read (QUEUE_HARD_LEN - QUEUE_SOFT_LEN). In this way queue will never overflow the QUEUE_HARD_LEN.
> 
> Also, what is the minimum character length of the command? I just decided that better safe than sorry, considering one character as possible full command. What is the smallest command which parser will parse? Is it {} ? Or may be {"execute":""} ? We can use this knowledge, to understand how many commands we should be prepared to accept, when we allow N characters in monitor_can_read(). So, 4096 is probably too much for QMP_REQ_QUEUE_LEN_MAX.
> 
>>>
>>>>   bool monitor_cur_is_qmp(void);
>>>> diff --git a/monitor.c b/monitor.c
>>>> index 4807bbe811..a08e020b61 100644
>>>> --- a/monitor.c
>>>> +++ b/monitor.c
>>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>>   {
>>>>       Monitor *mon = opaque;
>>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>>   }
>>>>   /*
>>>
>>> The ramifications are not obvious to me.  I think I need to (re-)examine
>>> how QMP reads input, with special consideration to its OOB feature.
>>
>> Yeh that was the bit that worried me; I also wondered what happens with
>> monitor_suspend and things like fd passing; enough to make it
>> non-obvious to me.
>>
> 
> OK, I don't have answers..
> 
> Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.
> 
> I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.
> 
> If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.
> 


ping here, as a replacement for "[PATCH v3 0/5] Increase amount of data for monitor to read"

If no better idea, I'll make what I propose above (with two limits) at some good moment :)


-- 
Best regards,
Vladimir

