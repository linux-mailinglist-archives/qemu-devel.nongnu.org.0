Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B559532A3FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:27:47 +0100 (CET)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6w6-0007bO-Or
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH6uZ-0005tg-VU; Tue, 02 Mar 2021 10:26:12 -0500
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:48397 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lH6uT-0000Sa-5T; Tue, 02 Mar 2021 10:26:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/xgg2WzIGTiMNPlYnpCocWDkF7SeE2nhF+dilQ3GN88RDa50Ab+fIKWgZVDedVw/wOyzZ2J+xVIWuWgeLpSVNfrvBTVXNsTvVeMQr77XudBC1FArtTzk74F8L3uGuM5nuX6xU+FcLgorLAyxczvqKi+l4m5SsPdqEcWR0dsibs6xqTcqJ2VvwCoy+K6CSvw7F89HYksquQ68DProDf1QKEGM/Ad/Muo/t4qJqXHbzCJ03cW0SrM5cxpeNGtAp8iCo2tVR6HIh18RNtj6pxIe9BL5Oy098wlonqpvqIUfZwOlq916k617OYw4Q/D4VVFYKvKEadYQJUcZuV/Ei2noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxM0E8jT5MNLNd0VnFVCHZL3vaONx34GsLpt8xKOveA=;
 b=jWX3mHFBxgwdeYlmbDjjbbiPy32COWdYjSZrW60PWtwAfBH6ksiBvY5dc9ZOqimgnTfAEoXcBK4rIThLEAUkDcESFQfNiMhQqlq3wlCRWZ7BZw2U54U16pME6GhUy2r4H9ejNIEUTlJTlQ9Xb6nG/kXgmkV7c/QTaonuETYwBt9LUyB1d572IWGfGfRmFtOJjZYh6CKMdplrJ3NV0+kCZE/Jp2PmlU8seB1EcfikLf0jBnA53yu5R+t5FykUUUu/3n4ebdtuQRhmX8rs3bNR3rQaACp1KuqZL6xlk/OgMpnCTl0r7pd0ihG5kserOhFODlfmnOut9gvDwGb9mdqk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxM0E8jT5MNLNd0VnFVCHZL3vaONx34GsLpt8xKOveA=;
 b=aHVsRGDW/QgXSfDkwiQLD189mkQ15u8CaYQkh/5iY81/JZk1ADn5XqdNV+ZVxheBXyGMxykg9fELp1ldq90II/QCFrOAzK7UrBYrGRXGs6Bx2qJ1ZlCn0N8kd6rY/yl6UZcKo8/zUUMcmPUuUDVBlqLz4qUqp9pCmwZlSNuiFEw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 15:25:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 15:25:59 +0000
Subject: Re: [PATCH v3 2/5] monitor: drain requests queue with 'channel
 closed' event
To: Markus Armbruster <armbru@redhat.com>,
 Andrey Shinkevich via <qemu-devel@nongnu.org>
Cc: qemu-block@nongnu.org, Andrey Shinkevich
 <andrey.shinkevich@virtuozzo.com>, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, den@openvz.org
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <87h7ltll0m.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b2f95f97-6305-7bc0-8e22-720972b105bb@virtuozzo.com>
Date: Tue, 2 Mar 2021 18:25:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <87h7ltll0m.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.246) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 2 Mar 2021 15:25:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b700ff6b-d3e8-4cbf-8201-08d8dd8f7b88
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077CE38038FA07BFC42547FC1999@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BWy4w6qDQVw1r1SKtTNpr+3+M7LRqUQw4p7gFVFfWMjktt7yvbaS+9J/AGthop1gpXTBzs/WrxKXUVAEPh7sIrvbSxNlSerNyxuUXcynLYcLB05QeIAV1SU28auBTk7Kt6kJw2nx969yKnRjpRD7iGdsoMPGpinfIigDXqCmzO82m369p8W0XuqZ5k4uFata23vDhzOdIE2q/GQ1sLUdUDYos0MDfpeC6JTNx1VaSVdDsRLrSioe4O04ug0StFLwHfJMkxenIuu2GS9B/ZP04dSkjcWei2weu0qP9vD+dZOAO9QJ74zZOIz+ZIHXjQ2L2Y39VEXCDZ6u04FKu2jAcZE+KudXVoP50QQeSSSOvLl2kHVbyd6Cck9XVeZPDPq0Ix754XsDK375e5RZQ7g8hQAjwqwd6WZlzgv0HotkUbPGZCdUCiTQmX4VhpmR8wnkmqe8hUxCeXtsdS9IWi95ge7S4eYj2x4duB2ObRnQ/u0lIa+wut9+/yf6mIxESClJ7b3MtQzJT1InDpCONL262IUycMgA+CCvgFZg0D5yhfowZlUQzU0p4w9dJH9HsxT1KjK96Wx7NDRKqjEqXXJF05N5yDkyoCWFX9n66nIpcM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(366004)(346002)(376002)(2906002)(7416002)(16576012)(107886003)(110136005)(83380400001)(31686004)(6486002)(316002)(66476007)(186003)(8936002)(8676002)(2616005)(31696002)(16526019)(26005)(956004)(5660300002)(66556008)(478600001)(86362001)(52116002)(4326008)(66946007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWZaeVhOb2greWZrcXhqZGRSNlFIVjdUaklGSUFqOC9zMHE4K2J3SVAzUlk4?=
 =?utf-8?B?Y2Y0dTVLQ1MxOXZtbVJZOFVGbGd5S25xbGszNytBVjJ2dlZ1TUlzOVJlOG9r?=
 =?utf-8?B?OUlPVHU0QWV1SW1kN1c5MFF6Mm9DRHZOQ3pNZHprWlB1R295clFqY0MyU05n?=
 =?utf-8?B?Y043REV0UjNCN0FObXRHQVJEakV0TldESTN0MlllUnhYOVZodjRkNlQ1bEE2?=
 =?utf-8?B?MFg1WnpqTXRWM1owNUpTWGIxUXZGSDhsVENvVGVyWjhsSTRKVTdnRzVYNFNR?=
 =?utf-8?B?eXR5VDcyNGdjQ2EyK2dqakZEdW5jaVBQL2lBbzhnZm0yVVhEN1ZLcHdqbzJv?=
 =?utf-8?B?Wk5aS3RoYmZvOGJQZ3cwWHIzanhnNUVhY0tISzM0MVUzZXNNVDFlWXBhUmNV?=
 =?utf-8?B?UHpOb25xTmZtS0dRYVFBT1E1QlhIZ3ZkRlJZelhpekZ4ZXdEVEIzSjRIbFJ6?=
 =?utf-8?B?aUhRaHVBc3NrdHJseHNZT1gyb1J4cVdiMk41cm16QjFGMktWU3cvcGNNNW1r?=
 =?utf-8?B?OUVucVk0T25IbGpmN3ZuMktka3Z6VzRQYkxPbFhaQ1h0MW1aOERqVncwM2NM?=
 =?utf-8?B?dWh0WDl6eWhwR3dRamlJNm5uR3kyQ1Vkcml6Zm5JemtyUjdPUHNjSUQ0N0xW?=
 =?utf-8?B?WlRJMzVVNHFqT0Y5NjNVWmEwY1NnU0dqbVEzUW5rQmRid2dUNVRNRVppRnFt?=
 =?utf-8?B?OU1yWXprejZEaVBzZkZQR0IvTHRZK3FncTVoSG8xYVdibCtHSThLenJldVZQ?=
 =?utf-8?B?NFN2cG41bndOamt2ZjYxSFZsRVBpY3JNQ3NXNUs5MnZzVVhONHg3M0lsaCtB?=
 =?utf-8?B?T1I1MVA0UnVPK1UxWC82RmNWY2tDaHBZdWpjbmpqSGRVOUt2eG56cG1GN1ZV?=
 =?utf-8?B?WWRkRmFFZWNxN0Nid3pWL1Zoc0s0QVZDSXlrTHVhNFowbStMMkFTUWRJSEo0?=
 =?utf-8?B?RzdmSFIxdVVXVXdMcWtVaGg4cDFjUml2UkZLNjc4QU9TNFlzWkMxRWtsSXpv?=
 =?utf-8?B?VmgraHlYaHlHRFVyaFJzT2hUVnl4TWYzNDg0OEx6aThlRE9nOHlRR0FabmJs?=
 =?utf-8?B?WXVMaW5OYWRsZUEyOXdlSlYycEtUdlZ3cURqdzZsOXg4K1lXNGFoeFkrSGRZ?=
 =?utf-8?B?S0loOGJ0a0pnZ0ExaEhmcU9WME16VGpzd1BHTDJ6ZG5ZWk9yeXVTb3BtS1I5?=
 =?utf-8?B?dnpLQUlWdmFzL2JycktMdkVLMDRJTTFrZEFrcTB3ZzVhUFhCbC9EeVVhSWZj?=
 =?utf-8?B?VFpaa0U1SzIzNVo2bUhuYmRDNHUvM3dzcTlOOENsVDVuZG1XM0paS0lHN2Nw?=
 =?utf-8?B?OHE2blFGRlhpMThBK04xR05MTlcvVlhoY3ZrRTVkMDlrUmtZVVY4VmIxbFJa?=
 =?utf-8?B?MU83WkpCU0N2U1pPd1VRVHBPSmFFUWluZjBIckhyWkg1bjV5OEpJZkpkZnAr?=
 =?utf-8?B?RHVnRVNwZXdDYzFMOTR3ZFhlV1VoUTd1SCtrbUJRdWF5RmZhdmZOMmltSXZt?=
 =?utf-8?B?V0VFc2dCN2cxVlNPeGpnUnN1U2paRmF3enZPcmd6TENQZkNpc1FvOU91UCtD?=
 =?utf-8?B?WHhkYktFTno4ZndObzlYUEdCeGIrYVB5SG9mcjNxZlEycjdvVlY1UDFMTjRD?=
 =?utf-8?B?cXhJOWQ2czJPOWs5N2Q3MzdhN29jTjBEcjkyYUVvVTNKdUZtWGxIWndkWlg4?=
 =?utf-8?B?SG8wQWl5bnQzUDMxVGtCS3VaVjdxZ0YrcEFvaG9qdkUzRlMrdi9YSXRvSXVi?=
 =?utf-8?Q?N32NRm9RELC2crFtfomPJ0x7rWYlzoc9xrBwSl/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b700ff6b-d3e8-4cbf-8201-08d8dd8f7b88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 15:25:59.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lGtuc7Ucbo8vxMXljFX/my87ZT6otRHwixkTG2P84fctIlEePsFUSEQaiSqGbkdA3mGGAWgntVSyA8h2BFDhyRX+ySzTZnNS9DhZoDMxWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

02.03.2021 16:53, Markus Armbruster wrote:
> Andrey Shinkevich via <qemu-devel@nongnu.org> writes:
> 
>> When CHR_EVENT_CLOSED comes, the QMP requests queue may still contain
>> unprocessed commands. It can happen with QMP capability OOB enabled.
>> Let the dispatcher complete handling requests rest in the monitor
>> queue.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> ---
>>   monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
>>   1 file changed, 21 insertions(+), 25 deletions(-)
>>
>> diff --git a/monitor/qmp.c b/monitor/qmp.c
>> index 7169366..a86ed35 100644
>> --- a/monitor/qmp.c
>> +++ b/monitor/qmp.c
>> @@ -75,36 +75,32 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>>       }
>>   }
>>   
>> -static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>> +/*
>> + * Let unprocessed QMP commands be handled.
>> + */
>> +static void monitor_qmp_drain_queue(MonitorQMP *mon)
>>   {
>> -    qemu_mutex_lock(&mon->qmp_queue_lock);
>> +    bool q_is_empty = false;
>>   
>> -    /*
>> -     * Same condition as in monitor_qmp_dispatcher_co(), but before
>> -     * removing an element from the queue (hence no `- 1`).
>> -     * Also, the queue should not be empty either, otherwise the
>> -     * monitor hasn't been suspended yet (or was already resumed).
>> -     */
>> -    bool need_resume = (!qmp_oob_enabled(mon) ||
>> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
>> -        && !g_queue_is_empty(mon->qmp_requests);
>> +    while (!q_is_empty) {
>> +        qemu_mutex_lock(&mon->qmp_queue_lock);
>> +        q_is_empty = g_queue_is_empty(mon->qmp_requests);
>> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
>>   
>> -    monitor_qmp_cleanup_req_queue_locked(mon);
>> +        if (!q_is_empty) {
>> +            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
>> +                /* Kick the dispatcher coroutine */
>> +                aio_co_wake(qmp_dispatcher_co);
>> +            } else {
>> +                /* Let the dispatcher do its job for a while */
>> +                g_usleep(40);
>> +            }
>> +        }
>> +    }
>>   
>> -    if (need_resume) {
>> -        /*
>> -         * handle_qmp_command() suspended the monitor because the
>> -         * request queue filled up, to be resumed when the queue has
>> -         * space again.  We just emptied it; resume the monitor.
>> -         *
>> -         * Without this, the monitor would remain suspended forever
>> -         * when we get here while the monitor is suspended.  An
>> -         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
>> -         */
>> +    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
>>           monitor_resume(&mon->common);
>>       }
>> -
>> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>>   }
>>   
>>   void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>> @@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
>>            * stdio, it's possible that stdout is still open when stdin
>>            * is closed.
>>            */
>> -        monitor_qmp_cleanup_queue_and_resume(mon);
>> +        monitor_qmp_drain_queue(mon);
>>           json_message_parser_destroy(&mon->parser);
>>           json_message_parser_init(&mon->parser, handle_qmp_command,
>>                                    mon, NULL);
> 
> Before the patch: we call monitor_qmp_cleanup_queue_and_resume() to
> throw away the contents of the request queue, and resume the monitor if
> suspended.
> 
> Afterwards: we call monitor_qmp_drain_queue() to wait for the request
> queue to drain.  I think.  Before we discuss the how, I have a question
> the commit message should answer, but doesn't: why?
> 

Hi!

Andrey is not in Virtuozzo now, and nobody doing this work actually.. Honestly, I don't believe that the feature should be so difficult.

Actually, we have the following patch in Virtuozzo 7 (Rhel7 based) for years, and it just works without any problems:

--- a/monitor.c
+++ b/monitor.c
@@ -4013,7 +4013,7 @@ static int monitor_can_read(void *opaque)
  {
      Monitor *mon = opaque;
  
-    return !atomic_mb_read(&mon->suspend_cnt);
+    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
  }


And in Vz8 (Rhel8 based), it looks like (to avoid assertion in handle_qmp_command()):

--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -9,7 +9,7 @@ extern __thread Monitor *cur_mon;
  typedef struct MonitorHMP MonitorHMP;
  typedef struct MonitorOptions MonitorOptions;
  
-#define QMP_REQ_QUEUE_LEN_MAX 8
+#define QMP_REQ_QUEUE_LEN_MAX 4096
  
  extern QemuOptsList qemu_mon_opts;
  
diff --git a/monitor/monitor.c b/monitor/monitor.c
index b385a3d569..a124d010f3 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -501,7 +501,7 @@ int monitor_can_read(void *opaque)
  {
      Monitor *mon = opaque;
  
-    return !atomic_mb_read(&mon->suspend_cnt);
+    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
  }


There are some theoretical risks of overflowing... But it just works. Still this probably not good for upstream. And I'm not sure how would it work with OOB..


-- 
Best regards,
Vladimir

