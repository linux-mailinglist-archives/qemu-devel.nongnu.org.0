Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC23DEDF2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 14:37:06 +0200 (CEST)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAtfM-0007AR-MN
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 08:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAteK-0006GY-Ij; Tue, 03 Aug 2021 08:36:00 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:8193 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAteG-0008Gx-LF; Tue, 03 Aug 2021 08:35:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3VFGxRiltivmCARy2zIxgPc/AHl/VqjFu09KaPMRyMrUxm0/1h6O91wcBog85FkHfYLm6IRdCfpRSUmRNlEwf1O4BedqDo5vbGFEghSIpyXeNLDdj4QDFcC+EyucX+bZ3y5fkVLCgilCtMyfV982rP7wtlWUDWfNm7s17n8TNJ4oby5NboWkVWI/zLOuW7z+eHLEPY3ZRAaXiAzi4tZb8JvonucdmnHzSfQdMgFqNEw1ZgYSwC8UKaUlJ5W9EW4ukMQY+hsSFY9m64Fckcf4V1ogCEFohq3fE/82VRdUz68O+knmEvnTKoAjhm+EToZFd1ki3u2AR6HD1br5dFMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrFC98ItA/2s5dT4eqk+LyM7NUeZD18l/jUnvZnIEYo=;
 b=ZcdQtKoOgx6obUJqW4Ror8Qpsfj3i6U+jXlfQ6UNWS6DXlGXG0w2JZ9ZT0+CvMIYacQnEEKHLXaC6QjFjKSw0ygyjohI/BEHR0OgIv+4ltXeHrwiIiuQJGKog4+AMkAUg3s6s0a5eXfPGDYTflheWVtlWQHwyX48P2EOxDAykYXlPieWd7owXucvZqMZlHmefGfTqa56aIcjGhnp3TpJbjjK+TCJd0Rz1V0GpMUKr5O5UNlZt3a14+LUpol10xGzUA5gtrBoGqAFCX3ZgUof/fRxhCqNUixr6OSrjpRE/heVaax1jPJh1o5LtdMBL5s73969zzB6B0cndRFsFqqGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrFC98ItA/2s5dT4eqk+LyM7NUeZD18l/jUnvZnIEYo=;
 b=ZQcnWFkKQF7k6/zjxsyhg2QcqYnxg+Xy4TUSwyqDTjd4DGxfCmmwgLY1dgRZg7w/2nAQn6AmSe7l4BS9Rj2GGx3KzOqCF4I3HSlTIoVgApcg9Ig1IUFhUK504NmprDUI0u6Em5vqbXPidrvHbH7SuTNczaTNVJY9ZvvBNbtAkTI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1777.eurprd08.prod.outlook.com (2603:10a6:203:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 12:35:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 12:35:52 +0000
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
 <e8042bf7-713d-26d7-1ba1-502bb566db1f@redhat.com>
 <79105dcc-eaa3-086b-34ed-b66eef584a3b@virtuozzo.com>
 <6ae8d39e-62cc-bd8c-c78e-d2747eb83715@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d370135d-9a34-1863-61a8-309c21e9e368@virtuozzo.com>
Date: Tue, 3 Aug 2021 15:35:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <6ae8d39e-62cc-bd8c-c78e-d2747eb83715@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR3P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25 via Frontend Transport; Tue, 3 Aug 2021 12:35:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4070263-e9d2-4882-b4ff-08d9567b3b33
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1777:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1777AB3BF3BF2025FCB75436C1F09@AM5PR0801MB1777.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gUFcIbO+E0BEWhJxoofVYLcZGC9KTYhcAK7ve7EINz6s8y4hg8VO71CIKsjeGuacvQDBKtzZuGrjQuW8l0ogw7l/ZhHCs2PQ4Opp0V7ug8Ut8HMO78N+DzIVzD76xMGX5Ntj2C9AaXzbepGBTry2czqUMUKzBBdoeVVauloFyXz9CHXsQ1dmzmLLjhom8ZozW99U28R/G5WM2JpQSZPvxifYsnGm1OSULBCWg/uo5WknIXLQbkM8k018NccB6l8I2qAmaQHWds8Em1VDXacokASVydBP/0p45C+0pq92utluUzrPt4GQg5r2hjHioSAOgxg5F0wENa1Cd271zaCNWIHeSiQ9o3RAlElRdjLzoEpUdKRez2pH5ZG+zPuNHCgZ4PAFM1IjYVnRvqunOTx/27X2fXN7YT3rEmjSeeKCU0abA0N0pAeuYmKh/aMp8VoW4Sqvi5BUYblFJLFC1IYnPMwor4T5Ls2wgoPr50GiNfQSJYEUhzz4fYLm72p+ZXdmgsTNxltt3qGeS6BQOe/O7iNZM5P81H6yi8+WaJ3kd77iJpzh+xH2Yxymckyz8XXhd1J7Q0cLRzDyG0rWleCpFLPpwyJtyTMg2kLgC9tdwRxutqSZsfsGy8pqudTFDlXTFmKrgpMCsnxTDs78pNgMx8ulMGYrPlxREMTGBV8mOaY96X7JTEdGTbn13/reJQRHIuolSVccIfY3Tntp+8AXhrHMA0zspCx0Sr3RU9JJUPVqKQwUuEhAdHl/u5kdpstTYgQ5tavWP0YOa1sobxaPE8vjf6laMH7bqZ2bOGztFyawsk/LSTe282nPh8/Op3sTO4jIqVoTxcCpgsQaqpOm69xb3MxTNZ+fJWsnG4dwwpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39830400003)(396003)(16576012)(316002)(2906002)(38100700002)(83380400001)(8936002)(36756003)(6486002)(52116002)(31686004)(54906003)(38350700002)(2616005)(956004)(478600001)(5660300002)(66476007)(186003)(31696002)(66946007)(8676002)(53546011)(66556008)(26005)(4326008)(86362001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anh0UGY5Y2RBa3VOZFNWZmZ6RENyTERMN1JFVC9OS3UwcGtIRmVsak9rb1BE?=
 =?utf-8?B?elUvbmI2SEg5bE4zTGh6YmlZd0RBYVlWQ2h3OEt1a1JEVDJzR25qanpoM1J0?=
 =?utf-8?B?cWMyVjg0cERITjQvRXp3eUN0Mkk4TGpEK2FLeTJuWCtUZ0NJMzJiYS9CR2Rt?=
 =?utf-8?B?VXRuL0NmMGFzeXI2Ui9FRlhTNTRYcEY4cDdZQWczT3k4c3FFeDJERklsNjg0?=
 =?utf-8?B?eXdNdmR1emVFK0dnaTVmYmJvS2hPTTVuL2IvVzl5ZE5HY1pvN2llWU1JSFVM?=
 =?utf-8?B?SGJhNG9VWlU3UWNiM0xvRTRMVjZSaUFjZytkMHU2bUdOZnFWbUZTLzFCUkZU?=
 =?utf-8?B?WjliSW4wYXpaUXh1bXdyUm5JZy9BY1N4RmV1TzZ1eTFnQ2NaeGs2bkFHYnZw?=
 =?utf-8?B?ZHppdzdmSEIyYlE2MjdEWFYxUlFmcjN2STl0QVBWcFlEWGJoNHB1OUFvaUVH?=
 =?utf-8?B?KzJ6RGprTDlxWmE3VzNzWGZTOFBCYi9YemYwWVowbWlpdjMyRnBhaWp3UGpM?=
 =?utf-8?B?Q3VHZEZGZkpnSTNkcklZbC9ibVJDcVFkRkx0ZkxObDc2eVM4ZzRBbTNhYXlk?=
 =?utf-8?B?cDIwZUVVOHZ1MGk5OVFhN29HZVBMMjhWY3hnemlwUndOejhYZWYxc2JobVZq?=
 =?utf-8?B?NCtITHBwV0hsdnB6RUN5TmwxUnNGUldlV3EwZVhXdTI3VzJZWVYyWE1HQ1pS?=
 =?utf-8?B?RW1pMUdJUFZMcERlYnJleGowaWdpZkJvNStFZnhrR1o2TkJsTWI0LytwSkFw?=
 =?utf-8?B?dWhCcVJGZk5KNXNycmF0VUhidUtQU0g4ZkUwWUZWOS9wazF5NWo5R3RvK3ps?=
 =?utf-8?B?U3hxQWR4ZHY5WnE3ckhWeGhhcEUwR3hJZ2wrUjI3UDB4a0FtdVZWaGVoa0xB?=
 =?utf-8?B?aHpyWjJ4SGlXOFdIV0VBWkpCL3YxalM5cDU2VExZZFZocWFLckptOFVsY3Ji?=
 =?utf-8?B?b1RzSi9JNVpnWTZGQitreThZdFg2c1RabW9tVEtxNFNLU3lLdlhVNVpXV1RI?=
 =?utf-8?B?cGhnUUt4TE9ZV2wvRXZsdVJmc2d4QzhSOEc3c1pNdlpNRFhmdnRGUnFjSWxu?=
 =?utf-8?B?ajZOOW5ZODVLVHY2ZnRxTytrU2J6M04zTlpkMHV0MDMyV3M0WlZCODhTek5y?=
 =?utf-8?B?OTV0S2NydnFIcFkvbGZMUlRTZENVbHhZVFJTa09pTTJUNjBXZWFyNzkrWGxG?=
 =?utf-8?B?RWpBek5RalE3cTQwcDJhSEJzV1c0d2RWVzFpUUExeFUzeDFDNzNtUjllalo3?=
 =?utf-8?B?cTQ3OHJUVU9BUS90ZGQvK2xBUS9reWhFRzhiWTcvUEFBQmgxUkx3WWFMYlBo?=
 =?utf-8?B?R3djS0RzMkNTc2hUNkFUdUozN1paZ2h4NjRyaEp4M2lxWTIvT0lqR2pBV29q?=
 =?utf-8?B?SHN1YnVmYVFsTk54eGZYbjMyaXVKSGF3QUMyc0orcEZ5VHdTU0dZZk1UVkRi?=
 =?utf-8?B?bWs5UC8rL2Y3MnROS1ZPUkRoRmRvcjhwWEFBZG80dHd6RjJFa0RnU0VZaCtl?=
 =?utf-8?B?elhWd1pva1VteDJremxyZUtYM0VkUGlDL3pLMVFvQTRQUVB3SHVaU2JUTXI5?=
 =?utf-8?B?cC9wMStpUDcxZjRKUEF3NTgwMGVodnIzeE00Q1hGU1Y1U0t4ajV1WmVKbElC?=
 =?utf-8?B?OGcySjlCMWtkWDBvRjNxVlQvOVJSZnNINi9kS1FoendSNVN6SDJBK2lRQkZp?=
 =?utf-8?B?aTdHR0N0OEtMZVVuN2tKWFBoSnlGeHR3RytBcTBrNzRycmlKOFZkOENXNzFF?=
 =?utf-8?Q?IgMHr2TgBrI77n4CT0Jchw/dapZVTqD5ujiiHBa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4070263-e9d2-4882-b4ff-08d9567b3b33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:52.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEQPFeNRRtAmaFoh7xdObxHmk0YLBjyN4MrSbfETpfh+EH49q77aFSbjxeK9jSLabQXO4+SklaHAfbPukJ52EaGpQeqnlm1f0es4XZ4mKbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1777
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

02.08.2021 13:23, Max Reitz wrote:
> On 27.07.21 17:47, Vladimir Sementsov-Ogievskiy wrote:
>> 27.07.2021 18:39, Max Reitz wrote:
>>> On 27.07.21 15:04, Vladimir Sementsov-Ogievskiy wrote:
>>>> 26.07.2021 17:46, Max Reitz wrote:
>>>>> Most callers of job_is_cancelled() actually want to know whether the job
>>>>> is on its way to immediate termination.  For example, we refuse to pause
>>>>> jobs that are cancelled; but this only makes sense for jobs that are
>>>>> really actually cancelled.
>>>>>
>>>>> A mirror job that is cancelled during READY with force=false should
>>>>> absolutely be allowed to pause.  This "cancellation" (which is actually
>>>>> a kind of completion) may take an indefinite amount of time, and so
>>>>> should behave like any job during normal operation.  For example, with
>>>>> on-target-error=stop, the job should stop on write errors. (In
>>>>> contrast, force-cancelled jobs should not get write errors, as they
>>>>> should just terminate and not do further I/O.)
>>>>>
>>>>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>>>>> are force-cancelled (which as of HEAD^ means any job that interprets the
>>>>> cancellation request as a request for immediate termination), and add
>>>>> job_cancel_request() as the general variant, which returns true for any
>>>>
>>>> job_cancel_requested()
>>>>
>>>>> jobs which have been requested to be cancelled, whether it be
>>>>> immediately or after an arbitrarily long completion phase.
>>>>>
>>>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>>> ---
>>>>>   include/qemu/job.h |  8 +++++++-
>>>>>   block/mirror.c     | 10 ++++------
>>>>>   job.c              |  7 ++++++-
>>>>>   3 files changed, 17 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>>>> index 8aa90f7395..032edf3c5f 100644
>>>>> --- a/include/qemu/job.h
>>>>> +++ b/include/qemu/job.h
>>>>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>>>>   /** Returns true if the job should not be visible to the management layer. */
>>>>>   bool job_is_internal(Job *job);
>>>>>   -/** Returns whether the job is scheduled for cancellation. */
>>>>> +/** Returns whether the job is being cancelled. */
>>>>>   bool job_is_cancelled(Job *job);
>>>>>   +/**
>>>>> + * Returns whether the job is scheduled for cancellation (at an
>>>>> + * indefinite point).
>>>>> + */
>>>>> +bool job_cancel_requested(Job *job);
>>>>> +
>>>>>   /** Returns whether the job is in a completed state. */
>>>>>   bool job_is_completed(Job *job);
>>>>>   diff --git a/block/mirror.c b/block/mirror.c
>>>>> index e93631a9f6..72e02fa34e 100644
>>>>> --- a/block/mirror.c
>>>>> +++ b/block/mirror.c
>>>>> @@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>>           /* Transition to the READY state and wait for complete. */
>>>>>           job_transition_to_ready(&s->common.job);
>>>>>           s->actively_synced = true;
>>>>> -        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
>>>>> +        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
>>>>>               job_yield(&s->common.job);
>>>>>           }
>>>>>           s->common.job.cancelled = false;
>>>>> @@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>>               }
>>>>>                 should_complete = s->should_complete ||
>>>>> -                job_is_cancelled(&s->common.job);
>>>>> + job_cancel_requested(&s->common.job);
>>>>>               cnt = bdrv_get_dirty_count(s->dirty_bitmap);
>>>>>           }
>>>>>   @@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>>>>>                                     delay_ns);
>>>>>           job_sleep_ns(&s->common.job, delay_ns);
>>>>> -        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
>>>>> +        if (job_is_cancelled(&s->common.job)) {
>>>>>               break;
>>>>>           }
>>>>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>>>>> @@ -1099,9 +1099,7 @@ immediate_exit:
>>>>>            * or it was cancelled prematurely so that we do not guarantee that
>>>>>            * the target is a copy of the source.
>>>>>            */
>>>>> -        assert(ret < 0 ||
>>>>> -               (s->common.job.force_cancel &&
>>>>> -                job_is_cancelled(&s->common.job)));
>>>>> +        assert(ret < 0 || job_is_cancelled(&s->common.job));
>>>
>>> (As a note, I hope this does the job regarding your suggestions for patch 4. :))
>>>
>>>>>           assert(need_drain);
>>>>>           mirror_wait_for_all_io(s);
>>>>>       }
>>>>> diff --git a/job.c b/job.c
>>>>> index e78d893a9c..dba17a680f 100644
>>>>> --- a/job.c
>>>>> +++ b/job.c
>>>>> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>>>>>   }
>>>>>     bool job_is_cancelled(Job *job)
>>>>> +{
>>>>> +    return job->cancelled && job->force_cancel;
>>>>
>>>> can job->cancelled be false when job->force_cancel is true ? I think not and worth an assertion here. Something like
>>>>
>>>> if (job->force_cancel) {
>>>>    assert(job->cancelled);
>>>>    return true;
>>>> }
>>>>
>>>> return false;
>>>
>>> Sounds good, why not.
>>>
>>>>
>>>>> +}
>>>>> +
>>>>> +bool job_cancel_requested(Job *job)
>>>>>   {
>>>>>       return job->cancelled;
>>>>>   }
>>>>> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>>>>>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>>>>>           return;
>>>>>       }
>>>>> -    if (job_is_cancelled(job) || !job->driver->complete) {
>>>>> +    if (job_cancel_requested(job) || !job->driver->complete) {
>>>>>           error_setg(errp, "The active block job '%s' cannot be completed",
>>>>>                      job->id);
>>>>>           return;
>>>>>
>>>>
>>>> I think it's a correct change, although there may be unexpected side-effects, it's hard to imagine all consequences of changing job_is_cancelled() semantics called in several places in job.c.
>>
>> For example: so we now don't set -ECANCELED in job_update_rc for soft-cancel..
>>
>> This mean that job_finalize_single() will call job_commit instead of job_abort, and job_commit may do some graph changes, which shouldn't happen for soft-cancel
> 
> So the question is when these two conditions come into play.
> 
> There are two places that set job->ret to ECANCELED if the job is cancelled, namely job_update_rc(), and job_finish_sync().
> 
> job_finish_sync() will do so only after the job has been completed, which requires the job to either have been aborted (i.e. ret is non-zero anyway) or job_completed() to have been called. job_completed() is called by job_exit(), which is run after the job’s main loop has exited.  If mirror is soft-cancelled, mirror_run() will clear s->common.job.cancelled before returning, so job_finish_sync() will not see the job as cancelled.
> 
> job_update_rc() is called from three places:
> 
> job_finalize_single(): Asserts that job_is_completed(), so the same reasoning as for job_finish_sync() applies.
> 
> job_prepare(): Called by job_do_finalize(), which can only happen when the job is completed.  (JobVerbTable only allows finalization when the job is PENDING, which is a state where job_is_completed() is true, i.e. after mirror_run().)
> 
> job_completed(): Same reasoning as for job_finish_sync().
> 
> 
> So it looks to me like these places that set job->ret to ECANCELED if the job has been cancelled do not consider a soft-cancelled mirror job to have been cancelled, which makes using job_is_cancelled() instead of job_cancel_requested() correct there. (And most likely, we can drop the `.cancelled = false` statements from the mirror job in turn.)
> 


Hm, reasonable. OK than, thanks for explanation.


-- 
Best regards,
Vladimir

