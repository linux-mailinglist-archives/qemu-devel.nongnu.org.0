Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3532A70C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:06:32 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8Te-0005qr-Tr
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH8QT-0003kr-A5; Tue, 02 Mar 2021 12:03:13 -0500
Received: from mail-eopbgr70134.outbound.protection.outlook.com
 ([40.107.7.134]:54528 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH8QM-0006ef-QN; Tue, 02 Mar 2021 12:03:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8egh1eN8WUFCo83ORHOmQaiZe3Q8JlJrOgpQ+i+07Wf8h2eU5wDwoxm0jEZQLrvOrA2VnqYsGwY+MeEEi/17HL0KFqjGuC218BnlMQ/OFKFAiex41Gg/h/P8F1J84akNpc8oP8wBwRtB8C7SIP6H4nBSkBcgG0O/l2Y9GuAQN7FjjLCqiLaKnD8SxWMYVpG10TJd+XR1Ge1ScncocunEnz4bZlOab4qAcB6ZqO/VuGIRPiVtW1+wv+pQBSMUVEjK5IVUd+nyuUNJla3c0CDXo7sLKUe9kmS74zIhEzByFEDVUGxgO/fge4oLYow6qzAX7ulomp3TYfkc78yAeIhWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSruvcDlZqOXhaaeZdPuGkK5cLOEzX/9h1ptN6PU+nw=;
 b=iwaif5xumEZj7jUA1tA0/nsoG8XjgkycxP3SFrbnUcWrge+MnhaAUKZHUnA2e0CERnp+cDQfDkDXNAFRskq17fW1gFSf8lJv2tCZCCRhIQYFcJJwtOQX/KZDSyS4AdlEPZS4x4pq02kU2ALnvd+QxWWU2DOf/isLwBRFd584tfsWhlqSwquUk2M+YJs/UIKe8cKSko0wq7FVsFkzbdFrTGNQRnif9y/mMe8hJ8Xjo0JoyBrhwoCegr4cyeAiSZW5FW8BLsWP6ZOSupIBTMjPFQHvrphT+KkBrfl1zhRKW8FtIg2xJULWUC0f4Fr4VTD7JAAWn3aV3wUl9/aL0SD7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSruvcDlZqOXhaaeZdPuGkK5cLOEzX/9h1ptN6PU+nw=;
 b=wkvPQeutNTBmb8NrjnAd4cAjnWeCt2AtcaecNAucoC9rqfAohQgBS24r2wd+Qx3NkWgP6Hz5gdGovajVbo38cS/4+OlelIwm/BSyI7Y95k+A25Rtc3K+0i3DLrcad08/KuPJ3APNxdJt0P+1gvjIulljVyrl4A3Se7NpR0RNCBU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 17:03:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 17:03:02 +0000
Subject: Re: [PATCH v3 2/5] monitor: drain requests queue with 'channel
 closed' event
To: "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>, 
 Andrey Shinkevich via <qemu-devel@nongnu.org>
Cc: qemu-block@nongnu.org, Andrey Shinkevich
 <andrey.shinkevich@virtuozzo.com>, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <87h7ltll0m.fsf@dusky.pond.sub.org>
 <b2f95f97-6305-7bc0-8e22-720972b105bb@virtuozzo.com>
 <1c64992e-c125-65c1-fee6-77b5d7e6637c@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7f518475-bc39-d892-edc1-d830d0ee203f@virtuozzo.com>
Date: Tue, 2 Mar 2021 20:02:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1c64992e-c125-65c1-fee6-77b5d7e6637c@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1PR09CA0087.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.246) by
 HE1PR09CA0087.eurprd09.prod.outlook.com (2603:10a6:7:3d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 2 Mar 2021 17:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0b2a63-fa6c-4cc6-0429-08d8dd9d09ef
X-MS-TrafficTypeDiagnostic: AM6PR08MB4167:
X-MS-Exchange-MinimumUrlDomainAge: patchew.org#1734
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB416702A8F4E0E82B716C28FAC1999@AM6PR08MB4167.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXd1Wk1q2PFrk/ZcDV+RZ8H4vSmthbpSI0+r4BKpifOvLHp54hz4KqLF2jFebSVDtDqHDayMwbBwcjfGfZBNVgN6QzTAPZlc803cP0c0Ht4gfSx6cwA0+E0rWx8uoeKTfLQYH4fy9iJdyv5f/f/Zq3xmZrI4YcMca2+/7AqHS2CPcp5P+ORH3FuYlCNWZ+SUsG/9EB0uEpfD1Rd1C1QmHfO4WCvP1XH/4zZC0BbpUjQhAsflCwLDmkQ3RR09eBNtvxS3eCs0iP2NTPR0ik5DLZC+EX1iATn6HL4C++KcszxN2isRMGHU1pQIMp1hm1HzUD6/XlOp6+5IHfMcN1t6YeRXdBPSGvOnz3opYLKDMIbIxBL3CHOiJRkeGLgsLW9yIBQTKUkCIfOGiSBso+vBTXSnSJ+ekl/jLGgLX/WiaGkPtTPxFFkG7+XAzJWrmGeIvzAd9zcMG6emLFlY6VZ8dGZ/2gGaHzBRWXX0RSEEw559io4UEsNZOsnV1G+XFIHQ+agahTN9xwfmjblm3NCRLDnczJt0oYZkRn93kJC4dwfehkCV/W4dAWqNGOsyko8TUlpaV4x6f88yKYWtFUneotUTAqE9SxXetsI/0FyzA5Bi2CNSnlkzYsacNNtj1YkVlR8QeeU+FLY+5CXmT3sKfKMzP6Qc/6WuAXR2GzKicxf6kqQLDeJtjWRf9prK9+/t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(366004)(136003)(376002)(396003)(31686004)(53546011)(31696002)(8936002)(66946007)(6486002)(8676002)(956004)(66476007)(2616005)(52116002)(83380400001)(66556008)(7416002)(4326008)(86362001)(26005)(16576012)(36756003)(5660300002)(110136005)(2906002)(186003)(478600001)(966005)(316002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0FWUFRhOVBZSFZKVkxvNTRyekRQL0g0dlVsWTRrKzRTOEdqRE5rSEN1WnE5?=
 =?utf-8?B?a1JkT0NHWnNHLzR0VTF6Z3AvYjZLbEVuY2xlQlFOOXZMRTlBNlFTZHNJOHRn?=
 =?utf-8?B?YlpWeHo0azNhUzJoOFNzSEhTbC81ajdiWXB3TkhDL2JjdmZ2R1IwMlp0ekg5?=
 =?utf-8?B?WFR1UExkbzdlQmw5UWZnZHovSi9ha0ZjYXBZN052b09BZlRuVENNczkvQU45?=
 =?utf-8?B?N01CSEF0M0tyL3hrbmlXOXVCaTZIakZvN3F1YTFmTmFIOXhTc1RCRUdPMXVE?=
 =?utf-8?B?U2hRWlVMUWV3MUQxSmxERzdDdnFvRUNSWDZKdm54OFRGOUtwUTNMZWtkSTJ3?=
 =?utf-8?B?eUxwY05SREl4ZnpQRVQ1TEhjTmFMeENMUTFTVVFmVnRuOEhUVE5jOXpaMXd6?=
 =?utf-8?B?ZFBoa254cWtVbVYyWUtTY0FhQ1daRWVtRlJmUlBtR1N4Wm0xYkMzbUpuTHFa?=
 =?utf-8?B?SVVpeUVEVUc4OUdmQzFtTVFZbWp0Zm1HT2ZCZWhndDZwSXZWZG9aeEEzSjF0?=
 =?utf-8?B?T2dHRmN0MWVFdkUwTmt2OURLZklVKzMrRzhtVGwyL0JyNVdDYjlNL3RGenZj?=
 =?utf-8?B?VUF3Mk5vMmJXckN4RkI4cUVQdmZsdkxsRFRXSmRwdzBmWVNyRVVXTjg4UlBH?=
 =?utf-8?B?dE9UMmFnYU0rL01BRC91Q0J3cU1qdmhsT2wvNGdnYWF3R1RnT0FrV2tRWnRu?=
 =?utf-8?B?ZXVKOFBsWDBnaC9ZTytnWCtxMFZkN3RxK3Vwa0NuZGoyQ2V4M0RBR29iNmNa?=
 =?utf-8?B?UElVVVV1cDUwR1F6VnVYSEZBWFJrZ3VCVGlJMEYvaTE1RjRoRTloaDR5Sm1L?=
 =?utf-8?B?a1VHZmZpWmo0ZEs4d3ZSNSs5MkdUcGNtYlVMWURtVEtZWE9SL1BaVHBjbTJQ?=
 =?utf-8?B?TkV6eU41YzZTRVhwcFpVbzlETHo5TmpuaEkwa3ZuWWV1Q0F4MVdpaFJ5a0xX?=
 =?utf-8?B?dDhmY21pZlB5SGMvWExQSEFiNFRZRzJzQU0yL1V2ZnpNY29LQXpNYXhMckNE?=
 =?utf-8?B?cWtOSldSYzQzVmFBTENJdjhXK1VvQW1UNGZDdlV1WTNDMUF6bmVJVVdHeW10?=
 =?utf-8?B?Tit4WFBDU0txVTJ1NStQdHRxczJQYlNSZTR5eHVKV25KdE45ME1pVjR2TkZE?=
 =?utf-8?B?bzZLa0dSdEdFOGI5Rk8rVTBFekQwU2NQcTF5cmxPT1ZXaXNMdy8xazlSRmJO?=
 =?utf-8?B?ZnpXd3VuUGVRWTZONDRuMkFYSTBoTTRud2NGSUdMLzdoTW9rMnBRazlRZVI4?=
 =?utf-8?B?aWNYTjFBZ01ITkVuZnVNcDA2YWJWdXErVjUwTU5FTWw0TTJocGt0LzNEVFNU?=
 =?utf-8?B?UmNod29oeHNoT3NGUldsa1VBKzhvUHQrUVZidlJXYmQ5OWFxMnZReDBPYXVx?=
 =?utf-8?B?Yk9XblJWRDRHbjVSV0U5THVMOVlTWDRYZVRFcW52SFRBZmtyRVc4RGxxK0lx?=
 =?utf-8?B?OXYyTS82VTd6YWErK0RMRTlnVlQ2R0trVTA5ejZSTm1CQitncVVYV1VhcDJU?=
 =?utf-8?B?TmZMT0NmYjNzbzl5MVhPeEk2ZzAwOGNjYmFaNFU2ZHBZQ3p4Vm1VQ0JhTDd3?=
 =?utf-8?B?V1pxWldKeU5kN1ozeXVyKzh6aUx3MlpWdFFmaTJUcWg3dnFvVXBsMFdraitK?=
 =?utf-8?B?OXNQM0oyVXZFaGpKT0xBYUZDb1FGM0dJNHViai9FaGtIaFd2VmxadldnSmcx?=
 =?utf-8?B?TDFjbUkrd3JVRDJITzVQdmlleVdqdzdLbUFFM1FTdWllNVoxT0NHTWo1V2xL?=
 =?utf-8?Q?GhVrPak4D6K9tS9LO7leihJNvYjUbBwFhkdA3hO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0b2a63-fa6c-4cc6-0429-08d8dd9d09ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 17:03:02.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO+dgKIjcEF405W3JwrymWFsSjDyIXvcjhS2rhM5YMOKhCYGO6Y8wpzuiPZXYgnXq1XbVjRP5hAnpVyAOsd3eV2R7TDMbV0QMOgTvVoaCRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
Received-SPF: pass client-ip=40.107.7.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

02.03.2021 19:32, Denis V. Lunev wrote:
> On 3/2/21 6:25 PM, Vladimir Sementsov-Ogievskiy wrote:
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
>>>>    monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
>>>>    1 file changed, 21 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/monitor/qmp.c b/monitor/qmp.c
>>>> index 7169366..a86ed35 100644
>>>> --- a/monitor/qmp.c
>>>> +++ b/monitor/qmp.c
>>>> @@ -75,36 +75,32 @@ static void
>>>> monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>>>>        }
>>>>    }
>>>>    -static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>>>> +/*
>>>> + * Let unprocessed QMP commands be handled.
>>>> + */
>>>> +static void monitor_qmp_drain_queue(MonitorQMP *mon)
>>>>    {
>>>> -    qemu_mutex_lock(&mon->qmp_queue_lock);
>>>> +    bool q_is_empty = false;
>>>>    -    /*
>>>> -     * Same condition as in monitor_qmp_dispatcher_co(), but before
>>>> -     * removing an element from the queue (hence no `- 1`).
>>>> -     * Also, the queue should not be empty either, otherwise the
>>>> -     * monitor hasn't been suspended yet (or was already resumed).
>>>> -     */
>>>> -    bool need_resume = (!qmp_oob_enabled(mon) ||
>>>> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
>>>> -        && !g_queue_is_empty(mon->qmp_requests);
>>>> +    while (!q_is_empty) {
>>>> +        qemu_mutex_lock(&mon->qmp_queue_lock);
>>>> +        q_is_empty = g_queue_is_empty(mon->qmp_requests);
>>>> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>>    -    monitor_qmp_cleanup_req_queue_locked(mon);
>>>> +        if (!q_is_empty) {
>>>> +            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
>>>> +                /* Kick the dispatcher coroutine */
>>>> +                aio_co_wake(qmp_dispatcher_co);
>>>> +            } else {
>>>> +                /* Let the dispatcher do its job for a while */
>>>> +                g_usleep(40);
>>>> +            }
>>>> +        }
>>>> +    }
>>>>    -    if (need_resume) {
>>>> -        /*
>>>> -         * handle_qmp_command() suspended the monitor because the
>>>> -         * request queue filled up, to be resumed when the queue has
>>>> -         * space again.  We just emptied it; resume the monitor.
>>>> -         *
>>>> -         * Without this, the monitor would remain suspended forever
>>>> -         * when we get here while the monitor is suspended.  An
>>>> -         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
>>>> -         */
>>>> +    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
>>>>            monitor_resume(&mon->common);
>>>>        }
>>>> -
>>>> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>>>>    }
>>>>      void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>>>> @@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque,
>>>> QEMUChrEvent event)
>>>>             * stdio, it's possible that stdout is still open when stdin
>>>>             * is closed.
>>>>             */
>>>> -        monitor_qmp_cleanup_queue_and_resume(mon);
>>>> +        monitor_qmp_drain_queue(mon);
>>>>            json_message_parser_destroy(&mon->parser);
>>>>            json_message_parser_init(&mon->parser, handle_qmp_command,
>>>>                                     mon, NULL);
>>>
>>> Before the patch: we call monitor_qmp_cleanup_queue_and_resume() to
>>> throw away the contents of the request queue, and resume the monitor if
>>> suspended.
>>>
>>> Afterwards: we call monitor_qmp_drain_queue() to wait for the request
>>> queue to drain.  I think.  Before we discuss the how, I have a question
>>> the commit message should answer, but doesn't: why?
>>>
>>
>> Hi!
>>
>> Andrey is not in Virtuozzo now, and nobody doing this work actually..
>> Honestly, I don't believe that the feature should be so difficult.
>>
>> Actually, we have the following patch in Virtuozzo 7 (Rhel7 based) for
>> years, and it just works without any problems:
>>
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -4013,7 +4013,7 @@ static int monitor_can_read(void *opaque)
>>   {
>>       Monitor *mon = opaque;
>>   
>> -    return !atomic_mb_read(&mon->suspend_cnt);
>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>   }
>>
>>
>> And in Vz8 (Rhel8 based), it looks like (to avoid assertion in
>> handle_qmp_command()):
>>
>> --- a/include/monitor/monitor.h
>> +++ b/include/monitor/monitor.h
>> @@ -9,7 +9,7 @@ extern __thread Monitor *cur_mon;
>>   typedef struct MonitorHMP MonitorHMP;
>>   typedef struct MonitorOptions MonitorOptions;
>>   
>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>   
>>   extern QemuOptsList qemu_mon_opts;
>>   
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index b385a3d569..a124d010f3 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -501,7 +501,7 @@ int monitor_can_read(void *opaque)
>>   {
>>       Monitor *mon = opaque;
>>   
>> -    return !atomic_mb_read(&mon->suspend_cnt);
>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>   }
>>
>>
>> There are some theoretical risks of overflowing... But it just works.
>> Still this probably not good for upstream. And I'm not sure how would
>> it work with OOB..
>>
>>
> I believe that this piece has been done to pass unit tests.
> I am unsure at the moment which one will failed with
> the queue length increase.
> 
> At least this is my gut feeling.
> 


Tests are passing.. Actually, the most relevant thread is:

   https://patchew.org/QEMU/20190610105906.28524-1-dplotnikov@virtuozzo.com/

I'll ping it

-- 
Best regards,
Vladimir

