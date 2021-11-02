Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242F442BE4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:54:53 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrRM-000739-Fn
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhrOM-00043B-9S; Tue, 02 Nov 2021 06:51:46 -0400
Received: from mail-am6eur05on2107.outbound.protection.outlook.com
 ([40.107.22.107]:29920 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhrOJ-0005Rx-2L; Tue, 02 Nov 2021 06:51:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqMWqjrk9r3QyqAvdtTRqZXJmgatFT86RvVI8Jf+fzMrGkm9s51Vf46Nizdu/ojiEdZPt1L9atMsmCT4bFg8Z+4HoHPwzl8I7h4FcyWmSauovDnPyxk1rmqXWHlByz3z8FbQPxEs7ICnYz8RGZHtThGmfnbm5wPKbghXGlhdyJLBJYD3zp1BxacZi1Bsq8XheAweULIGJ6CIhTsgdBIFeaKRkFlbHB7pGPyJs6HkBxF/3NlBUvM93UKwq5RO8Vtmdx6NaofFrj5s9PIsmNlh0deMFceRB6u3nHNWdQjpi8hiV3QDUt+TTlAp+sRchCj5x33LOOl4U31emDAme02kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boFQKSAfbk6oYS3w0O/y43w/C4eba6EfUZBZmi5ozpk=;
 b=kBMt7Ex/2Y91w7KxFLbp2Rci001rCD1ufVkUxXinYXrhpJkYWBOU3uj++Ko6ynzmNstlaZEde3yDS82A4TWTdCmL58W1W8ioW5pNJGCl6CKPIqf7vzFBauZh1qSeqElSpJaLHDYjD4D1ur5JV1Y1PU6W/kuv4x76Q3ehhGr1fHOjz1EAyoO0sMCjcvuXqwJM8sjWueH2UTpJwzBa9YmFbcAyXvGeiLS0bzCCZvTqGPF6MdYQP3luytnXKtmQXry8ZP32z7jf0b5bVKKOTEQEY9icdJwD39BOMH1auk7cgTL7PbqYKQ4bTSvpFlyfrYjsBMH2t+Yx7D51Lu6fcXpvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boFQKSAfbk6oYS3w0O/y43w/C4eba6EfUZBZmi5ozpk=;
 b=Cnr6q4q6O5Rsodu46yPJRWw+x20XQCMioOR/QqbuQtwGz/wE+Vb6vE2g4nNENYxZ9kfQwNt/wqep52gDyucltXeWG6nkTVlmLI8dOxlwVYvSSLfhF/kD1olwINb0w6jun2NKUslKhHcJ+0K4JJO3icZ2lw5LE4uBVLb5tLnRf+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 10:51:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:51:38 +0000
Message-ID: <0e0a5f6e-ce4f-df73-1fae-c4d6e10c832d@virtuozzo.com>
Date: Tue, 2 Nov 2021 13:51:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 08/15] job.c: minor adjustments in preparation to
 job-driver
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-9-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029163914.4044794-9-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0078.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AM6P195CA0078.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 10:51:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebe20629-8730-41a5-ce61-08d99deebef7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6166:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61660686A632B141A38F0DBBC18B9@AS8PR08MB6166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeAQObM11i9uKJOQJGLCQpxJc0AehHmVUC+7GPAFhYcC+fws4dlLRM0LIscmK/Wrbo0uBrnjtEJHvCm79Ve80BWXXvqcKUvgwQ6c2TjFqtBYsK4tBDbOLMQ4ufVXtwpv09VLwAqbX1WC1IPO3FEy+wkfqJ3w046pwXWcVqplVUCLsZ+sln5oPCizW6I/2bAQ2dUguddBmJz8Ret14KcAnZ2V34laQOA26dl0XlazwM3Srsv0Y8oh5ZMOXh2ecoQLMQbt/dajbPnpgKjE9BjhzVxyCypjOyQYTCcQ0qFIYugxcjQV+tmTjBOOMaP3H2ttpynmLCdqjGbYwz3CB1hxaw7PzU049NPUEyITBhwi9R/dxzq7RuOrAsK1ASWMHkvkppBN1NH7GagfN+tDVkhmE4f6JhEJ7u7kJxZIPb/FTZZNhglanPW6fi2quEhwuAELW3inb+hTX0ncsF49nh2dKpr7bp1aiWa7hKxJwoE59koj9fGfqIZ06JJbFX3ZJVBWutgJ10wKvJ5y3mdEvNn+zKpgCWhtRCjmh0LwxeJqA1bfeF95qXu/hrrqlIkpkkNdW817xhgY7WnZvJauyVzX0EXN3ZsLO7Si46XzwcnpYrYC1UQS6qrZ+VIErE+87nEQ5mXEqRaS/o7gTGSKp6d3WjICPI3f2iRE1+8CQfZGpuBVJXqBLSn35jv1g5nNpqqpaS54NmSHUA7IwR5WhNKvLEGmItRh//oJPB62qTKsecoChLfS1tvi/iyg2PGGwysl/BamfisZy62RgIxWXKyaxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(83380400001)(4326008)(508600001)(7416002)(2616005)(66946007)(8936002)(31686004)(6486002)(316002)(2906002)(86362001)(52116002)(26005)(8676002)(66476007)(31696002)(66556008)(956004)(36756003)(5660300002)(16576012)(38350700002)(38100700002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRvZGhRTWs5cXhqZmg0U1dZK3VnOG1SVFc2YVJpK3pEWWFlbVRVaDhjZk5E?=
 =?utf-8?B?eUJQK0hWYmM0VVhybXo5MFJoaHRQby9PZ3dyNGhIRmNVVDNZSERZMHcvaHlY?=
 =?utf-8?B?eFhOUHNxK2Z0ajlOQTdRQkFZTGhwejhkNEF3R0ZGTkdKbWpyeDRxLzl5c251?=
 =?utf-8?B?NGlwdXZhVXBCd2t4TkNDbjNEb0VENmhmZDgwNmZ4b2ltbnFFU2ZiQUx2K0Zq?=
 =?utf-8?B?QmgrVElqeGFLMTBlQ0Q0b1hBVnBGYmZpYVJiVUdyT0FLRHEyQ1EyYncxdG5Z?=
 =?utf-8?B?NWNhM1ZRRmhYcWRHWXZUVVorMG5rY3pnS2J6MkJSc0kyckM1VWxFQnZZaHhW?=
 =?utf-8?B?b251djliQVZqb01MeE1LK2pta2tiY3FhNWdjQkZzYnNLcHE2Vk03bkl0L0I1?=
 =?utf-8?B?VUtrTjdLSmhwL2xyK016emtObHIzNEE3RkpUYTdJMURaUC81cUpQYUVValBP?=
 =?utf-8?B?NjN1OWZaSmZYVlhCWFlQSGhialZCZXlUdEN0eEhHU2FaYXFGTGpIVEtuWU53?=
 =?utf-8?B?cHFlVkF4YVkwajhLQmRnVEhRQmV6RlJ3aU04SS9sMXJJQjNlUU5hUEE5dC9o?=
 =?utf-8?B?RlNrR2hkQXpCZTRRRkw1SjdxS3hxTXNNdnpJWHF5SXlBeEZCekRxQ1A5TFdR?=
 =?utf-8?B?TUtPcUdWTW5RcGdjYTJKVmpRSS84cmNkM2tkakwrTXlpSlVKNVY3RkN1Ynpn?=
 =?utf-8?B?K01pVmREQ0g3VXIrNytsUmUwR1REMVdOS2lkd1hjTFhaK2VTL0hvUTI3SEk5?=
 =?utf-8?B?VTFmckZwb0FacE9QQkFaV3V0SFM2cm1HVDBFUmxMYnJEZHMwTnJ4Sk5pRzFQ?=
 =?utf-8?B?TEUvNlJEb2tjVjBoSkZZdzJiNXdhTFQ2MFo1NmlMd1h4dEJSc0Z0bmYyTUNk?=
 =?utf-8?B?bjRxU1JtU3hJcWFUdDRBYXlUdStNK2x1UWVrMDFXZTBRQjBXSUt1a1JwbFRB?=
 =?utf-8?B?Y1FtK2tacmpOTE94OWJWemwzZzdGZ0U2THAyZ2gvTFJMb0pnc0k3elpaUUY5?=
 =?utf-8?B?RmZlOTUrUG1PellZL2xUZzRjSk9XcmFFcFBNR1I2anhBcEhxcWNBNHIyVVI3?=
 =?utf-8?B?YWJDUTNCVDY3b0hQODY5MFNPU1J1VmZOb05rOFY3YmtEUFZESFBIbHV3b2w2?=
 =?utf-8?B?ZVRtRXhDVHd2eTJNOWM0YjBoVGFDaVBXdkxBMGtUcDNQdDZHekh6RWFuQ1hB?=
 =?utf-8?B?dTdHM2lIUEZDMUdMb2U0aHNHTWZvdjNna2hhbXRJK3pYSkJpeTd5MU9hV1ZP?=
 =?utf-8?B?NVBLSjVhY09tM2JxcEtzVWlGalgrQnFoakZmbXlGZGFseWsrWFRCcStBdXBv?=
 =?utf-8?B?ODhaU0pDR3FGOHowbWxJVVpUVVErSlFIUW40V1pHUlJmODRENWpHYm1VNDlq?=
 =?utf-8?B?Kyt1V0hIbFp6U0l3ZVNvZEZVMlJpYjlPdDdHaHo1aHBUYjVqZllZQVYyclVa?=
 =?utf-8?B?bTI2Y2tXTDF2cCtHTHkydUlyN01ET0NKTzNvbER2M3U1bXJra3pOL2F1dG5Q?=
 =?utf-8?B?RWJLNENMRmwzMmd4ZmJCc1pWbnU2VXRNNGFYdlpZU3F4amZ6N0UrQ3VRVXZz?=
 =?utf-8?B?L29DWHZYR0ptbUpWT2c4ejcwcFkwNmY2T3Q4UU9uck8wa1UweFFsMCt2Ykts?=
 =?utf-8?B?SEhYdmoxR2l6ZGRJM1ZWcUlpaFkzMytoQmJrbFhtUUt0bE00Vkl0cmt3SjVB?=
 =?utf-8?B?VXJTMkxOd3ZyQ0ZLSzJFdzJqT0NwMDJGWDk2Y1Biemc5MjBiczZZaVJsaUYy?=
 =?utf-8?B?dGwzckdQS1IvR2g3cXlBL1IwYmprKzBsUktCMWhUbXZrOS9VbmUxZDJpNXl1?=
 =?utf-8?B?dG12SWJQK0RKcnJnRzd0aU1NdVFmN3hqWFVyNjM2cW0xS3dzdWRrYzAwZ0JS?=
 =?utf-8?B?L0kzVkI3R01FQUJSL3RGRFRtWG1XU2VZSVFNZkJjZCszd2FteHZnMnhBaEVL?=
 =?utf-8?B?Q3lJTW53Z2UxUThPM2hSdHdieFdWcktPTHgzbU0rdTVNVWVOUGpsVUpnZGYz?=
 =?utf-8?B?ekV1VE1rVEEvM3pFeks2THdHRi92dUkrL1o2bjMxMjBzMnVtV293TGNnLy81?=
 =?utf-8?B?STJIaXFVc1BMQ2x0c0FNaUFqb0FvdXgxSmVabk9iTTVvbGxCN0dEdUVHMk53?=
 =?utf-8?B?ZGVxRms1aEplclNWbHhKTVY3endxMVNmSUFIaisyVUFCZ0RRbWZxT3ltOTZy?=
 =?utf-8?B?NzRhb1ByMklTM2l2M1Fid0hnOERWZFBpMG55VHcrMkNIMzZMdTQ5ZWRJNFp3?=
 =?utf-8?B?bFdZb1luYTdzang4VVhkaHpyVi9RPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe20629-8730-41a5-ce61-08d99deebef7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:51:38.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOncfw7ShuRQ4BNfycPgKVqIFB8k2GheN8sXAULLmzfZy2RIEm7UHE6eGgMeQwULJoLNGWrwzQc2Dy/XAP8cldfeMxk9Q3BHVozoniVfr0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
Received-SPF: pass client-ip=40.107.22.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.10.2021 19:39, Emanuele Giuseppe Esposito wrote:
> job_event_* functions can be all static, as they are not used
> outside job.c
> 
> Add also missing notifier initialization for the on_idle
> list in job_create().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   job.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/job.c b/job.c
> index db7ad79745..88d911f2d7 100644
> --- a/job.c
> +++ b/job.c
> @@ -464,6 +464,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>       notifier_list_init(&job->on_finalize_completed);
>       notifier_list_init(&job->on_pending);
>       notifier_list_init(&job->on_ready);
> +    notifier_list_init(&job->on_idle);

Is that a bug fix? I think it worth small separate patch.

>   
>       job_state_transition(job, JOB_STATUS_CREATED);
>       aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
> @@ -527,12 +528,20 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
>       progress_increase_remaining(&job->progress, delta);
>   }
>   
> -void job_event_cancelled(Job *job)
> +/**
> + * To be called when a cancelled job is finalised.
> + * Called with job_mutex held.
> + */
> +static void job_event_cancelled(Job *job)
>   {
>       notifier_list_notify(&job->on_finalize_cancelled, job);
>   }
>   
> -void job_event_completed(Job *job)
> +/**
> + * To be called when a successfully completed job is finalised.
> + * Called with job_mutex held.
> + */
> +static void job_event_completed(Job *job)
>   {
>       notifier_list_notify(&job->on_finalize_completed, job);
>   }
> 


-- 
Best regards,
Vladimir

