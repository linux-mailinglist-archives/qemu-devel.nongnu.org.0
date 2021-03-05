Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2432ECB7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:03:20 +0100 (CET)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIB31-0005u8-6b
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIB1U-0004YI-VR; Fri, 05 Mar 2021 09:01:45 -0500
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:12911 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIB1Q-0001vN-Kr; Fri, 05 Mar 2021 09:01:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcL9R/4/DWDCfzURD+B9f/J5I5KvOw5uCzSQH+JrJTnGR9gS5135j/uQjP0+PQa1jNlzznY+iH30+JDuRU58jb3e5gcqu9Cz90qid+HEiAXGP7mbMbtMqB0iz3e0mWBujYqhtjr9cu0lHEH212Ez7bpjaXMvFDfPA7LyY8kt3mPKjm+2G5Npjlz/xPfYy1clRIsnFtKxtejDmPbDq0lRTA5PVGqhaouY67YQQ5vFFE00/o/aqEHTlLaGpQ/aKuR+RdtrNKP+nj9KNzNTuRKhh3w+6o8BipoPEP3vc2eGkziVcxG0l97EGStlijzp/SoJlEavYTiohmMMQGO5Y2vzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFFvC9iso8xNzNwjudFNC6AfMdIZ29llDa5W0d4uzvA=;
 b=f90wn/eP//uYZCC9IxSh0rVqxLV14FANgehlndTllU4KtncVYM9l/0qIJoxUoWkJosOkEO3ixWB82KIyfYI84lGCfNIFf+8VDYmo/JafhKjP0FGxFxwF3iU/xdC3sG0aMRGVd5xWfRfCYxJkNS9YXyxHlNRypXcYcAHSvVta+ZVrHUZLls8syH5pPehk9HLtZJ4974UDPRamxhE8OFeFGk4qpGG7/k6z0ZMOPL8x0vFgNtob8wWwusci5T8hrYnMJfeBextbcFK2Zh0Z45zpqJlttEMmhp7hHuilPN91ip+wZRMENtQ1LG7JiNtg8Y59TpQlGt0mAVDDoDQ/ESHvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFFvC9iso8xNzNwjudFNC6AfMdIZ29llDa5W0d4uzvA=;
 b=T5sbGoyHybDuu+HLT3De+cBE5oXzN0pKX+qKps0UBOiZnpYggEnmu5oEBvdbpXS6K9DDcBrM5X+eqCalHDCY4+30fH8tKFRixROF1NEamauljdhV8QLyUJ4woyl4W4cHc8iYxStMak5GjPogpIyhS+GxUeW7rQJTPua8tDhQhI4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25; Fri, 5 Mar
 2021 14:01:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 14:01:34 +0000
Subject: Re: [PATCH v3 2/5] monitor: drain requests queue with 'channel
 closed' event
To: Markus Armbruster <armbru@redhat.com>
Cc: Andrey Shinkevich via <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, kwolf@redhat.com,
 mreitz@redhat.com, mdroth@linux.vnet.ibm.com, thuth@redhat.com,
 lvivier@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com, den@openvz.org
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <87h7ltll0m.fsf@dusky.pond.sub.org>
 <b2f95f97-6305-7bc0-8e22-720972b105bb@virtuozzo.com>
 <87v9a5zpie.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4f962192-3bc7-45a5-17d9-0aa8ecbd30e2@virtuozzo.com>
Date: Fri, 5 Mar 2021 17:01:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <87v9a5zpie.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Fri, 5 Mar 2021 14:01:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82776afe-db3b-4b85-ffc0-08d8dfdf2f8c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47876481952BC8E330A8EEDAC1969@AM6PR08MB4787.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ICYjWwRUhJUEpAcV3IIV0WhajuZgxgv3P9Rts06ZXI6srthuDZn19D3/dYvSiWauIuMo5etkU1I6jaH9mfpvG09/zURf0Ja+VcQlZmQ0oIdzDQ7GlPyJbtAV+RR5CnoFDhl8A49xudo8wYitvKo5+AX/Mys+s2Fy2X+6XOzvfvE2L41c9jn4O/4PUIuAQxYdTNHqnvg/40gfbDJzAZA0cPfiiN41oVRFcho3Gd1oxjHnftU/dx6F9+mKgni291v0oJRe3suRyYVrFOl5Vz5nW0d1IpJOR/TVFq0PSBTEk6TLWKYAsBOeel2heTv6J9CUX7ztqDSdwffCIoKp3gdQI/xzM7xtTQ9oaLudYQt6ROQkuEe+rGGVQ4bW/2UYzUqNPQmt0QfWRcS/hzztUMjlp3HF3AC7d6q2icsx8/d0CKHG0+qgjnggrWZ8qlqJtqDwgQfQyWXL4n0wMN1KN0W6OboUEjEn5CsknJAI39nw2kSrycdLpyKMB6ybZU5eeg9LcQFGIL9D2TCq/JoPRdQH6fCdAHkshkaw3sf17xoKRh09nDDN9dP+5jahCfaiGQqw9jYM+HsSjdJszeZaD4mUMQn8H1UX+ri//wzW2XpIVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39840400004)(396003)(66556008)(83380400001)(316002)(107886003)(4326008)(5660300002)(54906003)(66476007)(52116002)(2616005)(6486002)(478600001)(16576012)(36756003)(956004)(6916009)(66946007)(31696002)(8936002)(31686004)(7416002)(86362001)(186003)(8676002)(16526019)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WEx0RUJubkNTOXlQSG1uZzFwR1VzKzBnTU5wTlYrQlRlMS9qU2pDdmt1R0RG?=
 =?utf-8?B?eHp3SHlaZmRqbTRkNUNsMmFRdG9TODB2VU1abTYwOGNuamw1eHpVZTdMajZQ?=
 =?utf-8?B?NG1EcTN2N0s5WUVlU3lLNWJTVTBmazdHNEZ4ZDRISXN1ZmtTL1R3bWZ1TTdu?=
 =?utf-8?B?YmdyOTFPbkdIU0tBZDhQNWZFYUxSc29TcHdqZFlIc2VnR2ViSUhOb09pck9I?=
 =?utf-8?B?eUxycnBOZ3dwenp0Wmt0QlhuRjRZLzM3d0h2dHdkSGNjRUtUbkJvK0FLaGdB?=
 =?utf-8?B?bUFhdEQ2dkt5cElwampaSVEyQTJyclluZS9tWkVBSGlKZ0FTSUFQdW11Unlx?=
 =?utf-8?B?ZW9tQmI5NitrRGtZRW5QTk1UL3hoSkhOYSt3Nm1GMFRaWlUxWHdsb25RRXJu?=
 =?utf-8?B?WDI3Si9hVzZ4WCttVG9yOFhzaHd0aXlqbjd5Umd6aFMvTjlwT1ZSZVFSRlZi?=
 =?utf-8?B?TkNBY1FNZXNPTHRXdmd0SWtsT2pqRjNQR3BEa0c4WUVKdWd3THRISkhyZHM0?=
 =?utf-8?B?RlFhK3dOdmw4TUdkZTdoVVp4bmFOdVlqd2FPSTNQN3gzb3dwSDlLRDBVd0xy?=
 =?utf-8?B?NXhoMW1CZXpoVzZLWUgvNDZpK3lWM3NBcmR2QzdqZE9uKzEyd0poblNvZHoz?=
 =?utf-8?B?Nm9vSkltcE9JR3RGc0pCQjJNQWcyZDhXSGdOdFRFaXY2UnFFdEpuYktnNHlk?=
 =?utf-8?B?VldnVkJlSDBDVGpnajZ3MlR2Y1VYL3ZUZzVxSWVPeFBWbDVhVVh3TDJYQ0ZX?=
 =?utf-8?B?ZWlZclVScHBWcm5Td2NyYVoybXVwWWRiUE5BQUVRYmRHRndhc05TTG9NcVRX?=
 =?utf-8?B?d2tGVXBKL1pkUC9yYzFNV2xXYVRvQ2ZrKzBiS2xUMjl5c0tpVWdBTlZPK2NM?=
 =?utf-8?B?TWd2WWhidU0xVFRxSUEvSjgwNm5CNFBqdXpyUnhLTHh4Sk5iM2RqYUhFZ1ZH?=
 =?utf-8?B?eTRGZFBrK0V4ZDhoWHNIeWlxZ2UwQ1RTVkhqbEw1dEJjRUJXSFhrdEU4VERU?=
 =?utf-8?B?Qk9oNmROcHMrckNGM2VrZk9helMvdjAybzA5a0wzZUp3TGlGQ3NlWFM1c1J4?=
 =?utf-8?B?V2kybVFJVWZnNUV2VGNHbDJWSXdQa0ZUcHQraTVTeXFRNFRiRWxqYUVob2lZ?=
 =?utf-8?B?WGhUQkhaT1cwUE4wdTVPMHdsdVFna3ROaVd1L2tFZHduMzlJWW9FOTFQMTFy?=
 =?utf-8?B?U2N4ZE1XN1hwTnZBQlV1aElFTUpZU2ZrRXcxZGxRSlNqbzEyeUswU2cwaVpt?=
 =?utf-8?B?dTlsNDBNNHROSmtBTHltWDZRMlBRL2o0eGdXSEozNEZTQ0c3V0dzVExTallB?=
 =?utf-8?B?U2lMSm4xeE1rOWk1U0tMZWhqU2dtSmtpR00vL2Z6ZzgyRzJDdFFFTXpaVi93?=
 =?utf-8?B?a2plNzdyY1ZYMjloL2FyblpFMnA2MHcrVmM2a1NmUW9vY3grRU82dzhOcWtm?=
 =?utf-8?B?VDFkblBLQXJWd0p5V3N0TUtEKzk5KzhSajUxejdOTmFsVm5BTjNPTlEwZzVj?=
 =?utf-8?B?V1daSXl1ajZnazlST213WElKYVJRc3Z6NHEvcnliZFZEK0VVSjR2ZUFlVGxr?=
 =?utf-8?B?NlU2M0pQYjJmbzZhaWVyRmNqMm1WQ0NCc2dZMTd3Z05GNVB1WDk3SG13Y0J6?=
 =?utf-8?B?NXhZd3FqOUFBU2RQUDRaVUZrWkQvUUhnakNHY0Z5bXBFZ0F0WVZ5YlJjZHpx?=
 =?utf-8?B?cnI0SWwxU2JZWkRpaHJlYlhpc0xrKzA3NGtuSFR4Sk8xUTh3S3V3bzhpaUZn?=
 =?utf-8?Q?TMPnyOUG5KFe0s8ke8Ls4Lg/wMlI5pi2QWW95Tp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82776afe-db3b-4b85-ffc0-08d8dfdf2f8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 14:01:34.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9ewFfKjJNsVo14BJhQUkHWjXbKARDllHfxrKv43WtNVOvOZ1h3pDleWWUnW00JO6VaJ0Gr9rLE52knIdN28qFzGI0IdlKYwEkDmJHLZU2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4787
Received-SPF: pass client-ip=40.107.21.125;
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

05.03.2021 16:41, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 02.03.2021 16:53, Markus Armbruster wrote:
>>> Andrey Shinkevich via <qemu-devel@nongnu.org> writes:
>>>
>>>> When CHR_EVENT_CLOSED comes, the QMP requests queue may still contain
>>>> unprocessed commands. It can happen with QMP capability OOB enabled.
>>>> Let the dispatcher complete handling requests rest in the monitor
>>>> queue.
>>>>
>>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>> ---
>>>>    monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
>>>>    1 file changed, 21 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/monitor/qmp.c b/monitor/qmp.c
>>>> index 7169366..a86ed35 100644
>>>> --- a/monitor/qmp.c
>>>> +++ b/monitor/qmp.c
>>>> @@ -75,36 +75,32 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>>>>        }
>>>>    }
>>>>    
>>>> -static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>>>> +/*
>>>> + * Let unprocessed QMP commands be handled.
>>>> + */
>>>> +static void monitor_qmp_drain_queue(MonitorQMP *mon)
>>>>    {
>>>> -    qemu_mutex_lock(&mon->qmp_queue_lock);
>>>> +    bool q_is_empty = false;
>>>>    
>>>> -    /*
>>>> -     * Same condition as in monitor_qmp_dispatcher_co(), but before
>>>> -     * removing an element from the queue (hence no `- 1`).
>>>> -     * Also, the queue should not be empty either, otherwise the
>>>> -     * monitor hasn't been suspended yet (or was already resumed).
>>>> -     */
>>>> -    bool need_resume = (!qmp_oob_enabled(mon) ||
>>>> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
>>>> -        && !g_queue_is_empty(mon->qmp_requests);
>>>> +    while (!q_is_empty) {
>>>> +        qemu_mutex_lock(&mon->qmp_queue_lock);
>>>> +        q_is_empty = g_queue_is_empty(mon->qmp_requests);
>>>> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>>    
>>>> -    monitor_qmp_cleanup_req_queue_locked(mon);
>>>> +        if (!q_is_empty) {
>>>> +            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
>>>> +                /* Kick the dispatcher coroutine */
>>>> +                aio_co_wake(qmp_dispatcher_co);
>>>> +            } else {
>>>> +                /* Let the dispatcher do its job for a while */
>>>> +                g_usleep(40);
>>>> +            }
>>>> +        }
>>>> +    }
>>>>    
>>>> -    if (need_resume) {
>>>> -        /*
>>>> -         * handle_qmp_command() suspended the monitor because the
>>>> -         * request queue filled up, to be resumed when the queue has
>>>> -         * space again.  We just emptied it; resume the monitor.
>>>> -         *
>>>> -         * Without this, the monitor would remain suspended forever
>>>> -         * when we get here while the monitor is suspended.  An
>>>> -         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
>>>> -         */
>>>> +    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
>>>>            monitor_resume(&mon->common);
>>>>        }
>>>> -
>>>> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>>    }
>>>>    
>>>>    void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>>>> @@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
>>>>             * stdio, it's possible that stdout is still open when stdin
>>>>             * is closed.
>>>>             */
>>>> -        monitor_qmp_cleanup_queue_and_resume(mon);
>>>> +        monitor_qmp_drain_queue(mon);
>>>>            json_message_parser_destroy(&mon->parser);
>>>>            json_message_parser_init(&mon->parser, handle_qmp_command,
>>>>                                     mon, NULL);
>>>
>>> Before the patch: we call monitor_qmp_cleanup_queue_and_resume() to
>>> throw away the contents of the request queue, and resume the monitor if
>>> suspended.
>>>
>>> Afterwards: we call monitor_qmp_drain_queue() to wait for the request
>>> queue to drain.  I think.  Before we discuss the how, I have a question
>>> the commit message should answer, but doesn't: why?
>>>
>>
>> Hi!
>>
>> Andrey is not in Virtuozzo now, and nobody doing this work actually.. Honestly, I don't believe that the feature should be so difficult.
>>
>> Actually, we have the following patch in Virtuozzo 7 (Rhel7 based) for years, and it just works without any problems:
> 
> I appreciate your repeated efforts to get your downstream patch
> upstream.
> 
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -4013,7 +4013,7 @@ static int monitor_can_read(void *opaque)
>>    {
>>        Monitor *mon = opaque;
>>    
>> -    return !atomic_mb_read(&mon->suspend_cnt);
>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>    }
>>
>>
>> And in Vz8 (Rhel8 based), it looks like (to avoid assertion in handle_qmp_command()):
>>
>> --- a/include/monitor/monitor.h
>> +++ b/include/monitor/monitor.h
>> @@ -9,7 +9,7 @@ extern __thread Monitor *cur_mon;
>>    typedef struct MonitorHMP MonitorHMP;
>>    typedef struct MonitorOptions MonitorOptions;
>>    
>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>    
>>    extern QemuOptsList qemu_mon_opts;
>>    
>>
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index b385a3d569..a124d010f3 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -501,7 +501,7 @@ int monitor_can_read(void *opaque)
>>    {
>>        Monitor *mon = opaque;
>>    
>> -    return !atomic_mb_read(&mon->suspend_cnt);
>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>    }
>>
>>
>> There are some theoretical risks of overflowing... But it just works. Still this probably not good for upstream. And I'm not sure how would it work with OOB..
> 
> This is exactly what makes the feature difficult: we need to think
> through the ramifications taking OOB and coroutines into account.
> 
> So far, the feature has been important enough to post patches, but not
> important enough to accompany them with a "think through".
> 
> Sometimes, maintainers are willing and able to do some of the patch
> submitter's work for them.  I haven't been able to do that for this
> feature.  I'll need more help, I'm afraid.
> 

OK, I understand. So, when we are ready, we'll come with new fresh series and good explanation.

-- 
Best regards,
Vladimir

