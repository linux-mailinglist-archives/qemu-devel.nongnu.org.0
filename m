Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAE3A006C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:46:58 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgkb-0004E2-C7
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqgjZ-0003O1-0m; Tue, 08 Jun 2021 14:45:54 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:44569 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqgjU-0008Cj-Ev; Tue, 08 Jun 2021 14:45:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjk7Ogm8YLkmmQvx6jU/TKWQwa2Z5/AHnXEPk0Nstjo8ts8niIgjN/f/0rAs9tI/0dbPIHKQhAXUMt/Ap/f3FeVhRdRFfHKiQSK63hu3vz7zJEv1Z59sLnIW8lS0uQijNt06tshbJVqkHSvnD54BHKhthQHqb+bt8kG8ZK+YLM3IwhVx2nm9eqMKlqUgSI4jf3CtVq5TkJmbNViIZHof9OqBmx5p/WmXOxH+rwbHa0+uX3b2NJjpVdKhHmMEXUd0M9yG5uub+g6UTDsuT09TSkR4jm65hgipHhJmQTBMZaohgXfeWhGLERHSSW5pJ0FpClp4uaFLTErnSh1GwcI3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G5JA9lI+MHunklbPFADpARGt2HB+BYakBFgOPb1joc=;
 b=H1ZYOuW1PGRDB6DBp84p2FaKXpvX+NEcCNe59NKVFI+cbkPLs6Xq9TioSOd/t/BHStm7R+I2zqtUGpfDI4JWI7He8OgKPIU9HYuLwR2Brvr9HKm1OdOgsb5ffdLkXSVvnFQRL5RTCFcV2KpVmgeRdsXn/YGQWIUOtNoH0NXQLrgLbf7wVPota/Qq0yNJNg9WOpwAt6DYIQZhpDcSEEF00x0BEiCIoIpknXmvtLnyTRIsVYafcMa1Yl4hqmA9ykL9cJmldfHQY+zhjYpGcX4b1dao1vChsNobomWDMnnv4H48M3JDxcYcSnF13mxVjx/+1j9vM3bzcJmBwiAeKPrAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G5JA9lI+MHunklbPFADpARGt2HB+BYakBFgOPb1joc=;
 b=vdXOmogbIC4rjRgrTN+1fQnaW8OuGjLv5MsyN7R/UUBtLiRlBKEL7iT3DzlXH/OjbPsYAoDkDV2mfFoqQS4mE5rR1D1/t7vTLJ1Es81ypc6hKUN2BRQV2RpKzVcq+Fsc7UrSFST2bJTvM/DYLRnRnm03xtx4sdU9ui97P2kveRc=
Authentication-Results: euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2982.eurprd08.prod.outlook.com (2603:10a6:209:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 18:45:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:45:43 +0000
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <52ba34c5-1de8-21b3-a31c-bf51676c29af@virtuozzo.com>
Date: Tue, 8 Jun 2021 21:45:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR05CA0143.eurprd05.prod.outlook.com
 (2603:10a6:207:3::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR05CA0143.eurprd05.prod.outlook.com (2603:10a6:207:3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Tue, 8 Jun 2021 18:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e13bce9-c545-456e-b940-08d92aad9f02
X-MS-TrafficTypeDiagnostic: AM6PR08MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2982286FAA886200A1BFD7DCC1379@AM6PR08MB2982.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYX5BbVtWscamjB6bsrHd3t92mF+yVYMNQWjC1YHA0nqIq1tZDZqqMZxO8MKGRjt7ITlwv5P0b0VBH2v63BV2LK0h5EmGv5IfVQH9uX8v1Oz8HM4uwrev46IPVy4iSHwXQtdE2BGr8DBgCbEGoRtDWVoG4i7wgRYJza1b020HwEyf+5Bn/TrpH8wv5nh0+yLL8DCz/FMXK+bGUsOCO/helr33l0RMA/ysV4fN65GaPvtk0yWaEK9YY9uesU1NmE++lwmVQsr75BVbUQqYowfaDEYqkDNzmNHefFbkz0a3Lu1M+Yy86e8unA/YjiY3DWlW3MEwGrdZh4pa2QI4uH6wIGmjT4rPePbJi/s/qGfLEMOeeiHGN1+Cj4G3S4X9e2HTruKJxq9M8bV+APLtzvD9xuMEvUmvdP6FYglSIkKHc9H2fAx0tAOrCzuTph0RfddfpRoVAPrclRQIj5YXG4qmy5y/uSJlnSmQggDXoYqM4+jziO7AOCzzsISqdK6FLf/0XnaaU07rzbpJ6Y6ZSvhPttHhq7LH/pT0xLEpcV+43jwyfZwiXbJ17AsM9WlsT1eNogpxGKXCz0n3MSkKyNQp4ktD5MvZQe5/BfgWsrS7qeIEeToghirdDFK0QS5rrGDrHgI94fq8rsCMsyAH3XsP6N+zBszI6nxJIrnRQ7PX/RK5xyOrExHIj7gT1hImmggyjlptr3F077O1dwuneciwB2Ee0LzIuhgRQ2NdfGitBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39840400004)(376002)(366004)(31686004)(83380400001)(956004)(2616005)(478600001)(53546011)(66556008)(52116002)(8676002)(54906003)(66946007)(66476007)(31696002)(16576012)(6486002)(8936002)(2906002)(4326008)(86362001)(316002)(38100700002)(5660300002)(38350700002)(16526019)(186003)(36756003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0ZGMzZrK2RCVWgyTjhLL0Y5M2YrQ1lSMzlHSXpNb2NsNEZxeXlaYVZRdlp2?=
 =?utf-8?B?R1I4RHFucHk2WW9CU2pCWkpFTWkwK0dmdlc4Q0JTSWxmdFNDR3hEU01EQ3Ny?=
 =?utf-8?B?cUs1UkZDWWVsZ1pzSnRMaFFOQXErMytLUVcwaks5ei9xc3NQSzZ2MldHTldr?=
 =?utf-8?B?emo2ZE9LUkdpcDhXZmVDdis0NjZZYUN6OGIyZG0wL3lJNnFQS2NyNWxkMTV3?=
 =?utf-8?B?cU5HWXdXZjV3d2tuVlNxZWdRRFJUcytqQ1RXbWpka1hkQ1JWN2pnNWFIdjc4?=
 =?utf-8?B?Znc0NUo0YXFUdDRybjE0MXJIVGE5bXkwdlpGc1ZlbWRZd3N2MWVsVWFJcFFm?=
 =?utf-8?B?OWVVYVpsbkFNdEJhLzVRTDYwOTFHT2tKYWp1Qkl5ZTBSUk9Iam1oZngrR1BQ?=
 =?utf-8?B?MVRIOWJZemJ5cll3SncvalpQZ1FEcUdnZkg4aVBWY3lwTnFEK08xQzJVcjFh?=
 =?utf-8?B?Vi82TDlwOG5IZlptcldZVHNNclRINzJ4NnRPYURFK2pVNTVaRnE0WnEza3No?=
 =?utf-8?B?VS9CQXZGRDRiOThab0tweXE1eU9xc244YWNUYTBUcEhzWXhLcUhUbnhWUjdO?=
 =?utf-8?B?dmRDelF1N0FUY3kyRHk5VGRvd2RnalFuNno1aTVPNnYxUVBaL3QxZTFiQTZO?=
 =?utf-8?B?NjFtdEpMS09jUW4wczVIMUkzRVZwSHJBditCSllwQ205dzJKRG5Sa3dnbWVT?=
 =?utf-8?B?N3JFSU11RmdhZEMrNlE1dG9YbjNNWWozelpCcWJSWUNJcisrU2VVUURSa0lm?=
 =?utf-8?B?TEJ4MVM5dFVKbzJyQ2ZaL2I3cytLSVUrYXJ1Y0s2SFJLZ25DZ2tVZDFQbTNP?=
 =?utf-8?B?LzV2RHlIRUZvZDNDbC9lbmR2OXBVeCtKamZlaElTam4zVUxteU9jRkFKSGtM?=
 =?utf-8?B?WWl3bUpLNkZKWTNLUW45V0grT3U2bnFLRVM0RmdaOUplR2t0RW9pZFRSTTdV?=
 =?utf-8?B?TXBtY01GcXJodVlnNHZKVUJjQ2N4WXZpOElLYjVMdEpEWHgyUGc4N3F0emRT?=
 =?utf-8?B?dHFWSHJOc3QxTm5idURQZG1NSndkWmpyOHNSb1JnOGFlckR2dkhsUlhNcXRl?=
 =?utf-8?B?WVM1QlVzamRWbDR0TWxxaFFaRTNuK3FGU3dYYnNMYjZVaGxDVkd2R2ZGRUNn?=
 =?utf-8?B?NlFLYk5EYjlMVTFpajB2ZjNlQW9rcmlIam1hTTBaWXBhakllaGJiT1E4ckh3?=
 =?utf-8?B?a1JLaUJEM0pGSHIycWdUbld1Y0NrVXFoS1dkNFFreWVLRm5hSDdZU3ltNlUy?=
 =?utf-8?B?NmR2NXZRRWN4YWxVY3ZReVJJVkkzdTFTVVcrL0tzK0tqMUVjUlR6UTEyTTZR?=
 =?utf-8?B?SlcwN1l6Tzl0SytWdjlKZVcrbGtGNXo2TW8rckgvYlNObjF0TGpDMHkxWENo?=
 =?utf-8?B?VUJWVWhhbGEwVmh4cEF5WVBLblZ2aVFhSU1NUnhTYzNla2JaVzc2RFVWNG11?=
 =?utf-8?B?Nm5qSVJsYmR1RTVrb2JrNzJTSWFqNGxmVzk3M21LZmhzOFJ3c1Q1TTljN1Zp?=
 =?utf-8?B?YTlvcDlzQnNHTjlrQWt2OFUzNThsNEJiOXhpT0pNNlNLR2d2VXlVL2J2Nnh2?=
 =?utf-8?B?YTB1N0VaQmhma01mRjJSc0g4WlUzTzM2MUhodVZ6ZDhIWThtVVp2SXZGaE9y?=
 =?utf-8?B?WVBsWnppQmJhdjJMNVRJVE03S0VUSklSVUQ0cTFwL2h0R3NJYWNiaEwyVUZh?=
 =?utf-8?B?WGNxZ3JuWjhFRXdITHNpeis0d0RoY2ZIenFML0tZc0JCZHRYSGFRZ3U1VTVQ?=
 =?utf-8?Q?3Z8dYOqzT+dz/Dx6O+gu8AR6NsUQfI0XW/BmSlQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e13bce9-c545-456e-b940-08d92aad9f02
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 18:45:43.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RksUB8kSkFRcH5qajNSco4DjRf4Mkv0L2j2AVG8zVn/3OYELZPl3+hbP1Lp45Y1SdpFVxmyWRSySV/ye5co+b8WTQ6S8ubN+ezoeNK70uos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2982
Received-SPF: pass client-ip=40.107.21.104;
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

14.05.2021 00:04, Paolo Bonzini wrote:
> On 12/05/21 09:15, Vladimir Sementsov-Ogievskiy wrote:
>>>>
>>>
>>> I don't understand.  Why doesn't aio_co_enter go through the ctx != qemu_get_current_aio_context() branch and just do aio_co_schedule? That was at least the idea behind aio_co_wake and aio_co_enter.
>>>
>>
>> Because ctx is exactly qemu_get_current_aio_context(), as we are not in iothread but in nbd connection thread. So, qemu_get_current_aio_context() returns qemu_aio_context.
> 
> So the problem is that threads other than the main thread and
> the I/O thread should not return qemu_aio_context.  The vCPU thread
> may need to return it when running with BQL taken, though.
> 
> Something like this (untested):
> 
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5f342267d5..10fcae1515 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>    * Return the AioContext whose event loop runs in the current thread.
>    *
>    * If called from an IOThread this will be the IOThread's AioContext.  If
> - * called from another thread it will be the main loop AioContext.
> + * called from the main thread or with the "big QEMU lock" taken it
> + * will be the main loop AioContext.
>    */
>   AioContext *qemu_get_current_aio_context(void);
> 
> +void qemu_set_current_aio_context(AioContext *ctx);
> +
>   /**
>    * aio_context_setup:
>    * @ctx: the aio context
> diff --git a/iothread.c b/iothread.c
> index 7f086387be..22b967e77c 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -39,11 +39,23 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>   #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>   #endif
> 
> -static __thread IOThread *my_iothread;
> +static __thread AioContext *my_aiocontext;
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
> 
>   AioContext *qemu_get_current_aio_context(void)
>   {
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    if (qemu_mutex_iothread_locked()) {
> +        return qemu_get_aio_context();
> +    }
> +    return NULL;
>   }
> 
>   static void *iothread_run(void *opaque)
> @@ -56,7 +68,7 @@ static void *iothread_run(void *opaque)
>        * in this new thread uses glib.
>        */
>       g_main_context_push_thread_default(iothread->worker_context);
> -    my_iothread = iothread;
> +    qemu_set_current_aio_context(iothread->ctx);
>       iothread->thread_id = qemu_get_thread_id();
>       qemu_sem_post(&iothread->init_done_sem);
> 
> diff --git a/stubs/iothread.c b/stubs/iothread.c
> index 8cc9e28c55..25ff398894 100644
> --- a/stubs/iothread.c
> +++ b/stubs/iothread.c
> @@ -6,3 +6,7 @@ AioContext *qemu_get_current_aio_context(void)
>   {
>       return qemu_get_aio_context();
>   }
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +}
> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
> index afde12b4ef..cab38b3da8 100644
> --- a/tests/unit/iothread.c
> +++ b/tests/unit/iothread.c
> @@ -30,13 +30,26 @@ struct IOThread {
>       bool stopping;
>   };
> 
> -static __thread IOThread *my_iothread;
> +static __thread AioContext *my_aiocontext;
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
> 
>   AioContext *qemu_get_current_aio_context(void)
>   {
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    if (qemu_mutex_iothread_locked()) {
> +        return qemu_get_aio_context();
> +    }
> +    return NULL;
>   }
> 
> +
>   static void iothread_init_gcontext(IOThread *iothread)
>   {
>       GSource *source;
> @@ -54,7 +67,7 @@ static void *iothread_run(void *opaque)
> 
>       rcu_register_thread();
> 
> -    my_iothread = iothread;
> +    qemu_set_current_aio_context(iothread->ctx);
>       qemu_mutex_lock(&iothread->init_done_lock);
>       iothread->ctx = aio_context_new(&error_abort);
> 
> diff --git a/util/main-loop.c b/util/main-loop.c
> index d9c55df6f5..4ae5b23e99 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>       if (!qemu_aio_context) {
>           return -EMFILE;
>       }
> +    qemu_set_current_aio_context(qemu_aio_context);
>       qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>       gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>       src = aio_get_g_source(qemu_aio_context);
> 
> If it works for you, I can post it as a formal patch.
> 

This doesn't work for iotests.. qemu-io goes through version in stub. It works if I add:

diff --git a/stubs/iothread.c b/stubs/iothread.c
index 8cc9e28c55..967a01c4f0 100644
--- a/stubs/iothread.c
+++ b/stubs/iothread.c
@@ -2,7 +2,18 @@
  #include "block/aio.h"
  #include "qemu/main-loop.h"
  
+static __thread AioContext *my_aiocontext;
+
+void qemu_set_current_aio_context(AioContext *ctx)
+{
+    assert(!my_aiocontext);
+    my_aiocontext = ctx;
+}
+
  AioContext *qemu_get_current_aio_context(void)
  {
-    return qemu_get_aio_context();
+    if (my_aiocontext) {
+        return my_aiocontext;
+    }
+    return NULL;
  }
  


-- 
Best regards,
Vladimir

