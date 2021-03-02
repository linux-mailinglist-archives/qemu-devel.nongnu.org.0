Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56D32A614
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:34:08 +0100 (CET)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7yJ-0007tq-CW
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lH7xQ-00073m-UL; Tue, 02 Mar 2021 11:33:13 -0500
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:42119 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lH7xN-00029o-Eu; Tue, 02 Mar 2021 11:33:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY469RJn7/5L+3elu3flosoGE/HHekS8Nf9TEYAPSDR9wH1ihrdcKi/8o6JcZPdJsnA2aUo3mq6WyuJciZqT7ostlISiSYtmIgISqtEp7P1rYOhlcLYcywuMW5f0Qa0Z6cvMtiTs19n6vlpHcNac2Dqq4SjugfZaHvcV0PYufAccNSUj0C37hCFMjsCOPkJmHm9tmroUHRo8Gdz119X9PFD26bbzbtn2/6z3978Szh1s53/tQZq3QhoBGftAMu8sXTTZ6hf/TvDWhGWsz1ExoO6JzWnXb4XaSyMckIwixX1WHiLRff8SM92hDUOOuv+P/UWWQ0/8Wkgf5SDAcuWf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/de5FyVdwYWbMhPFIqPzq63j3mjcfHzBQNkD3Vl20w=;
 b=NM4Uq9qiy39z4yFKnF/wdgkGsK/IPCTUyARewqQLyk0m1ZopcmGgoUrpJc1JoRa98hW4DV7S/uoaO+N+854evg/0bXtp3n/GR5ivkE8mQsHFRvvAGKuRNl9QQDVAAnvh9K21FKRPNONN2pUNWX59si3mE9HATvqOiVAuN6zSleXj3h9tRKMES/zjmZtpnjVnao/HZj6liQEuWKHtbfQJJgP50z+5Ow8WFCxNFWCGmUZvjUFo65wSa4JwvBstkzVtIsmw2z4PS0lFMfLfpFmi0Hg2jUjDZb/AQgpj278p7isSvOHgTjWaJ06qTY8u/7IC//BKDXsOIccd8vEevUPmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/de5FyVdwYWbMhPFIqPzq63j3mjcfHzBQNkD3Vl20w=;
 b=FbzrOkLAtQQvZB7Teq/KNPyS4ZLea0Hec+dILw+Rc7aqHdOOrcmXRwiXXJRoc3v4a92TGO/cig95qq9XnYHAtUZwMNtRTIEDNwMpPP+M14sQ4Qulxoqm6Qn7FBhSws38oQ9hlkmn1PjVQIAtUfzbJ8wDKTGslpYyqTRgGtko+T0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 16:33:05 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Tue, 2 Mar 2021
 16:33:05 +0000
Subject: Re: [PATCH v3 2/5] monitor: drain requests queue with 'channel
 closed' event
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Shinkevich via <qemu-devel@nongnu.org>
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <87h7ltll0m.fsf@dusky.pond.sub.org>
 <b2f95f97-6305-7bc0-8e22-720972b105bb@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <1c64992e-c125-65c1-fee6-77b5d7e6637c@openvz.org>
Date: Tue, 2 Mar 2021 19:32:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <b2f95f97-6305-7bc0-8e22-720972b105bb@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::30) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 AM0P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Tue, 2 Mar 2021 16:33:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 862fb799-a345-4cc8-1965-08d8dd98dab2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434262BD7B5B83B9124F85FFB6999@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gh+oBeG+coqDvFUHETOaZu83oLRktNbwC3KaJu/pNA+OsWOUefaoHL4ZYKEHLMdE4uJXG5WJvkIs0gG93RoGgqD25XcnIQtO1dLCUdvLlOKOEsqbZjgt2bT/vp3oclHYZnfiEF4wEhr3Q0IItmzyD2is08AWDuJNnLyzgNaDLFEwliyg3D0vvslfR2sxEvX57MkEcPsBu7drIsyJrM1aOq5uzjXcCpOFFlIe/o3EkzGWEKKIE+474sjCWCrFfop8Qt20FTPtMd/q2x8JD/7xYwc+2OOvt0/U97mauHQ3ZAoAZ2FCbtANlxn3ZhBmksYisDBb3w+XxVP/WjYAlLxoEH/0TPNdb4MXKgbuTjyHruyCWLFcW9xAblneCllmg1fcHfYxwRh6Y34n412q46HZOmHSt+HbK51QMeao18OyhqyboKRgPkI5zPjplwbxK2dq9wppAsSgMHbyiFOh45f0j+l4NxdAMbMrB+WFZG5gvmKTwfZrjuYqtmjm3EzAUMbmEBNsu0EMW5jFPczc1qNcHLwJYcDitddWRav7LotmEvLDwC6BJenl33nbhfRvM8CodYSCthgvUL50mMKdO87NEraACi+kmwMQ+BXToAFtPD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(396003)(366004)(8936002)(16526019)(31686004)(36756003)(8676002)(6486002)(66476007)(2616005)(478600001)(42882007)(6666004)(186003)(66946007)(66556008)(26005)(956004)(7416002)(31696002)(316002)(4326008)(83380400001)(53546011)(52116002)(83170400001)(16576012)(110136005)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWJpUkwrM1Q2cnZJSnE5QlVNeEl5eXhoTjRDdmJoc1l1REtMRzI1T1BmWEM3?=
 =?utf-8?B?ZXpDdGZvSHRSdU1RUEJ3YUNmM2JkR1R3YVM3Qk9sUC9LeG5PQ0ZEZmxXZU40?=
 =?utf-8?B?RE4zYjc1UGROYkpQQ0ZsbWdlQWRHTHI4WDRzYjV4UitVbG8zRDRNWEtrdzdy?=
 =?utf-8?B?Nk5IVy9RdTlwdzU4Y1FOd0xNWE9yRVFyVVQ0aVdZcGl5dWd1WHVWT29LTEdP?=
 =?utf-8?B?MUdGQ0RWRVB2cTU2cW9aY1cxV1VMUzFmREw5NG9VZEJTV2FSVUhDYU96YUpY?=
 =?utf-8?B?ek1PbmVURE5tSTZSSzJ6SmdiOU93OUt1NGRVaU56Ymh1SmJDMTl0Uk9JUlVx?=
 =?utf-8?B?dHZQYmVERjdHYlYvSlM1TncyVDFlY2ZWWkdMTGJ3cjRURWZJcjZBZVltSHFL?=
 =?utf-8?B?dTRKUTMxOTlJREZDcXVDSlZLV2xyVCtQVDhFUm5FWnVHYVVRU20wQXZxQk1u?=
 =?utf-8?B?bkhQeEl5TFVrcUMvZGFVMUtFQ2ticUZ4VVl1Y0sybnlXZzdEaFZRYytraVJO?=
 =?utf-8?B?dlZXdTRSUi9TVjlQaExrVW5ieDFMRklUZzhjZHIyUE5ZcVVYa29kREF2UFd1?=
 =?utf-8?B?R3dBL2syTERENTlMRDBFR3NkaXVFclVpODdpV3dYZDBRR1VoYTMySVJ5MmVw?=
 =?utf-8?B?cVBCVkRTM3lzWUx6MUZ3aHVEbitjVWM3RUpkUEs4THNzZzhUSm95UU5qUk1s?=
 =?utf-8?B?VTBheWlzbTZCckI5dXFuUldSSHAreFpRZGVqRStRLzV6cEt6b1VUVnRCck5x?=
 =?utf-8?B?MW91V1BENW5IV1VaVjJ0M09GcS9laFFlK2k4NWJvOEhwTjhDQWNnV2FUR01u?=
 =?utf-8?B?WndKcUVrZW01ZWNhNS9WVzJaallCR1lyZkthTEJINS9HRHRpQUxOeWpxU3RI?=
 =?utf-8?B?UldkN0htOCs1MHZDKzBBcHpCS2RXWkE3Y1czT1E3bFFGSEF4bk5NSDdCSXph?=
 =?utf-8?B?MXdUZ1ZHYWxLdWExbUgxUGUyaVNkOGlmcDN2RGNLS2dlVUE4NldpanBOT2I2?=
 =?utf-8?B?VHVvOGpWdytUQS9mcktnaWdDUVk0UXRUUGlrK1NOWkQyVU5NRkF3dGdIZk5L?=
 =?utf-8?B?UmZGVkJXbDdYWC9ZYjNiUlMrNDdJNHo0M2lxckFPc3R4OWFWQ2tzamNKeEhX?=
 =?utf-8?B?NllFVW1lNTA1MEl6RUl6YWlOZndHNHBFMWVMaWh5RmhyczZ1MUcrWU1YS0xn?=
 =?utf-8?B?b2lEUUpxRXlCOTRFKytkbjY0d2hRb1pkU3pQbDVoVyt1c25CVkI5aC80SjYw?=
 =?utf-8?B?N0FyMmp2YWxDdmFhWVVDaDhiWVBSUFVvQkJQUmZOSHZWMldEVnczK3Q3Wjdk?=
 =?utf-8?B?azg1Q2tOUVUvbllMMnhscjNoVUJWK1BxOEFISU44VjJ2aS9KVDY2SGFaMGxt?=
 =?utf-8?B?RzJieDdZdFFkR3YrMFhwQzVDNENDQzdkUi8rVVQyUEJ0czQzQTd0YUtmVW9L?=
 =?utf-8?B?TUZ1SVZBRk0xb0d4SmlhWHllWWJPaWlDVDZENnhVT2I2K2c4RG05RTlhSVhj?=
 =?utf-8?B?WWRQTW40ZThBUUR0YnFGYmVSR2UwK0MwK0tBTk1xcDduUlZUNFQ2ZXVScEds?=
 =?utf-8?B?eDFkYllEREdvWkM4dXN5YndPTS9uczM0bzJnVXczcFZ3UGlTUDI3V1B6RW5I?=
 =?utf-8?B?VEdlaDlPc0FOc3VHY0pTeldKd2k5RFJQQ2VoZW54bUxLRUtEVlQxdUU3RURI?=
 =?utf-8?B?NFFlYWpQRURVbjlKVGZBS3lBWms5UWdkZmNJdWZReVIwcFdGcE96NTdqdjRG?=
 =?utf-8?Q?rcqjgxWiHaMK2dTbJYamvvaH6BYvxnQ4HbuKtbo?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 862fb799-a345-4cc8-1965-08d8dd98dab2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 16:33:05.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnRmioFSoQgiNwgiKo79Ufe+NWzanq4u0cZ3jYaSJ7hBmbVOsK6ANWfkH3P5Z+DfaZCFBe5taJwhloHYsQMn0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.6.99; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mdroth@linux.vnet.ibm.com, mreitz@redhat.com,
 pbonzini@redhat.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:25 PM, Vladimir Sementsov-Ogievskiy wrote:
> 02.03.2021 16:53, Markus Armbruster wrote:
>> Andrey Shinkevich via <qemu-devel@nongnu.org> writes:
>>
>>> When CHR_EVENT_CLOSED comes, the QMP requests queue may still contain
>>> unprocessed commands. It can happen with QMP capability OOB enabled.
>>> Let the dispatcher complete handling requests rest in the monitor
>>> queue.
>>>
>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>> ---
>>>   monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
>>>   1 file changed, 21 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/monitor/qmp.c b/monitor/qmp.c
>>> index 7169366..a86ed35 100644
>>> --- a/monitor/qmp.c
>>> +++ b/monitor/qmp.c
>>> @@ -75,36 +75,32 @@ static void
>>> monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>>>       }
>>>   }
>>>   -static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>>> +/*
>>> + * Let unprocessed QMP commands be handled.
>>> + */
>>> +static void monitor_qmp_drain_queue(MonitorQMP *mon)
>>>   {
>>> -    qemu_mutex_lock(&mon->qmp_queue_lock);
>>> +    bool q_is_empty = false;
>>>   -    /*
>>> -     * Same condition as in monitor_qmp_dispatcher_co(), but before
>>> -     * removing an element from the queue (hence no `- 1`).
>>> -     * Also, the queue should not be empty either, otherwise the
>>> -     * monitor hasn't been suspended yet (or was already resumed).
>>> -     */
>>> -    bool need_resume = (!qmp_oob_enabled(mon) ||
>>> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
>>> -        && !g_queue_is_empty(mon->qmp_requests);
>>> +    while (!q_is_empty) {
>>> +        qemu_mutex_lock(&mon->qmp_queue_lock);
>>> +        q_is_empty = g_queue_is_empty(mon->qmp_requests);
>>> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>   -    monitor_qmp_cleanup_req_queue_locked(mon);
>>> +        if (!q_is_empty) {
>>> +            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
>>> +                /* Kick the dispatcher coroutine */
>>> +                aio_co_wake(qmp_dispatcher_co);
>>> +            } else {
>>> +                /* Let the dispatcher do its job for a while */
>>> +                g_usleep(40);
>>> +            }
>>> +        }
>>> +    }
>>>   -    if (need_resume) {
>>> -        /*
>>> -         * handle_qmp_command() suspended the monitor because the
>>> -         * request queue filled up, to be resumed when the queue has
>>> -         * space again.  We just emptied it; resume the monitor.
>>> -         *
>>> -         * Without this, the monitor would remain suspended forever
>>> -         * when we get here while the monitor is suspended.  An
>>> -         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
>>> -         */
>>> +    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
>>>           monitor_resume(&mon->common);
>>>       }
>>> -
>>> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>   }
>>>     void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>>> @@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque,
>>> QEMUChrEvent event)
>>>            * stdio, it's possible that stdout is still open when stdin
>>>            * is closed.
>>>            */
>>> -        monitor_qmp_cleanup_queue_and_resume(mon);
>>> +        monitor_qmp_drain_queue(mon);
>>>           json_message_parser_destroy(&mon->parser);
>>>           json_message_parser_init(&mon->parser, handle_qmp_command,
>>>                                    mon, NULL);
>>
>> Before the patch: we call monitor_qmp_cleanup_queue_and_resume() to
>> throw away the contents of the request queue, and resume the monitor if
>> suspended.
>>
>> Afterwards: we call monitor_qmp_drain_queue() to wait for the request
>> queue to drain.  I think.  Before we discuss the how, I have a question
>> the commit message should answer, but doesn't: why?
>>
>
> Hi!
>
> Andrey is not in Virtuozzo now, and nobody doing this work actually..
> Honestly, I don't believe that the feature should be so difficult.
>
> Actually, we have the following patch in Virtuozzo 7 (Rhel7 based) for
> years, and it just works without any problems:
>
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4013,7 +4013,7 @@ static int monitor_can_read(void *opaque)
>  {
>      Monitor *mon = opaque;
>  
> -    return !atomic_mb_read(&mon->suspend_cnt);
> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>  }
>
>
> And in Vz8 (Rhel8 based), it looks like (to avoid assertion in
> handle_qmp_command()):
>
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -9,7 +9,7 @@ extern __thread Monitor *cur_mon;
>  typedef struct MonitorHMP MonitorHMP;
>  typedef struct MonitorOptions MonitorOptions;
>  
> -#define QMP_REQ_QUEUE_LEN_MAX 8
> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>  
>  extern QemuOptsList qemu_mon_opts;
>  
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index b385a3d569..a124d010f3 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -501,7 +501,7 @@ int monitor_can_read(void *opaque)
>  {
>      Monitor *mon = opaque;
>  
> -    return !atomic_mb_read(&mon->suspend_cnt);
> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>  }
>
>
> There are some theoretical risks of overflowing... But it just works.
> Still this probably not good for upstream. And I'm not sure how would
> it work with OOB..
>
>
I believe that this piece has been done to pass unit tests.
I am unsure at the moment which one will failed with
the queue length increase.

At least this is my gut feeling.

Den

