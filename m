Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37376479AB1
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 13:13:04 +0100 (CET)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYaF-0003e6-AH
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 07:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYZ9-0002oS-6M; Sat, 18 Dec 2021 07:11:55 -0500
Received: from [2a01:111:f400:7e1b::70b] (port=14827
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYZ6-0005Pd-QY; Sat, 18 Dec 2021 07:11:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcgM4krpKfJyF03WomqVrlsO2T8ic6OLwyhZSWYwVcCitqGsUqOzweixh9StGzEzRy/F2qPIlMlFuw+UJCfkSPZ6iZ/EpGYdj9057jhO4uIzmORWwhkSenYwjIiJMEr2xNAeTcUGpWVrPn0xUkkcZIRCDPdEdzLH/zN+sHXWMhUS1NslNWFmfT6W0bwZ1Uh09965HP7JXgkK3Lo/2ybNvz+/+3X8JHyG7N37HfczjeFVRa75b4TBSMRLXMBA5HDop2dS+N3sPuBZ8OqmkkSwvAISkkcOecOJgfPj/ZsMxyoCMpu3btI+7/cy6xZ7wcogjkcwWjK91NLfYXfPoMEFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hZnLwEyRXOSRPjd4wzhQWU+/rjqviBY9lmVzkx7mdY=;
 b=JD13hK4ukvz9GH0Y4u4+VEjIYTLpe+dNMZR8iXtSbKFJFSZ9RhLKwL0h9H0e643lcZguOfDWJHJmUIW8R+0Nw9JJt1OZtAEDAq1uHvDzbgqqn0HbtLp0bT6TrESEZjzG2aV1Qd1z+VvVuTEvxZ2nVwcELYCW6M99HKrkKTVGPdSYHEZZjUcNJ7jcFyOYrf9l74T5dN2mT180+/s+9IU2z/3YvYzWJ7pavvHPGKylrkBVdXqKYshcze4hMSEbAw1Ju65YUrr/kK4jk/e9VvrfgkKhQ9QaHVWc28CVDbFZFs85y/XFEpF+GKCvknkyjHoTGOPswqvoioez1XhWdAimwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hZnLwEyRXOSRPjd4wzhQWU+/rjqviBY9lmVzkx7mdY=;
 b=QJY5FatikmUM59rnb5EVLmBWSEikLC7ibXmX3yWVYnreftLKnOgzbyz1MLEqEY24TrTvLLeHSNO8wwXW5QZzj7RhtP2tDkYOTfTtck1X7ZYMHZf0ouHFUROAELAY7vivQdK1y7NIAMYVOW8IsuCx4zEEzW1GGUvBpr/Vt3NGDnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2849.eurprd08.prod.outlook.com (2603:10a6:205:5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Sat, 18 Dec
 2021 12:11:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 12:11:48 +0000
Message-ID: <c1919268-88bd-6fae-0bbc-4ebe7830e7b4@virtuozzo.com>
Date: Sat, 18 Dec 2021 15:11:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 13/14] jobs: add job lock in find_* functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104145334.1346363-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0058.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::35) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM5PR1001CA0058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 12:11:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56fc95df-2d51-4c86-8453-08d9c21f911b
X-MS-TrafficTypeDiagnostic: AM4PR08MB2849:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB284910453677BAAEFFA17D0FC1799@AM4PR08MB2849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +38V6EGluZCUXasytybyGEbwcnlQOQIuDmEPKZB3LU26MkhJNJiHeOeTfZPqjzmFK0Cqjf8wJmPfKWxgwddLUCCsnzxXZOK9uZ49RmamwqBZCcsBmA2o7SflJVFAs0x9/x+KpsoXPbLa98u/R6dv0jvPXeDAEfxi2Ge4Za3/z4ZQa/+VNUSAdy1239ylDp+vGATIGYF41PuG2DFxK9fPXoUW+EPxuj4iSvUo5imOPYwu4D/QfqYYB7dRqwrK0FPSE5yPvF3AkYM0QYdQGh6EHbrL5g6jOUXQ9R8WEOtoWudQSe2KTKHYQ8AE7BPLJGIjwlVnK5ZqOoHyga9ecjSQvCrjKJ9Rsr7sdNWexUTPsyoB6119thFQ/wuMtGC2PLJGGOzROLFkRsbahpZ6nxL3dtooQC57aFTlu2UVswReRJDyNpdw8wbhRxrBhDOKTjbtOkPRCKaD8n8/jgyLcK78c8/ZT06i9lcV0SDou57goqTITOP2YovSb+wsnz/JXyUZo7l9Oxu62UeMMlORhi3f72887hCScT3FrCa1wFSLYp/42ODPU5Xddx4mgo65c1V+h82UVbuvBYTHFaIszyyfK9D7XffgdO1QYhgIy+jFkPO65Rom/aqryXEuE7QeaF7pmXlttjeodAWnOTu10gg7ZI//2aMmv8PMnoJFD36d9R+gtzjd4UhGL75r8eSNTxB59gtHxLy+w+uw/tVxTuK07mKqZCvtdO3MPg8eQzbssXHCR2O+3TMciknbnrKNBp1ntEHKmrQKrg7WVYQpJlyOzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(38350700002)(956004)(2616005)(66556008)(66476007)(66946007)(16576012)(26005)(83380400001)(54906003)(6486002)(316002)(52116002)(186003)(5660300002)(31686004)(508600001)(36756003)(8676002)(8936002)(31696002)(7416002)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG4rYUgvVTRySExVZXc3TFBwY3VYZzFkTHBYSTlsQURVa0JkZituZGtCcXFJ?=
 =?utf-8?B?SmdQd2t4V0oyeEx5SzdxY0Z2eTk4SkhjaG1ET0NRQWY0SVFuTDE1RzZONkFx?=
 =?utf-8?B?UEVnV2I2Qk1MYUk3ZHFadS9ZM3RQV2J5VmFmZEFkTHNscUdYS0d0cXo3cG1E?=
 =?utf-8?B?OVRYTStsSGYySW1SSjZkZTFieUlqMDh0VWUrdU9QcnA4QWE0S3pWSjBEdk5W?=
 =?utf-8?B?Z1ZxNnhGTEdDZjJoTHYrdlU2Z3A0TmtWZXpMSmg3SlZaM1R2ZUp3TkgzVkht?=
 =?utf-8?B?LzFNZ250c0R4TXo3Tkk2WFp3Q0puVkJVL0tDZmpsQmhlUjdVOGdFMXlnUzFx?=
 =?utf-8?B?ZzFjT2RoZGluSGpRMUJ6dTFwWG9jZ0dyOHljZVlPUCtqdEhNdGtIWEU2bjQ5?=
 =?utf-8?B?cTlnSTBORUFqWVBMTTNFUEw0ZXNETVVCdU1NTTJXTWQyYTE3M1hxNzF1ang0?=
 =?utf-8?B?UlkvS0xVejljV0ZJVlcrTm53K0FhRFFrNlNJSUtkemdNclJWb3Y2S0NkbXdF?=
 =?utf-8?B?ZW1UbzlSNmw0ZVYxOTA5K2VGTjZBRmg2SCtQK3ZIRUJjV0FDODJncnA4a0JB?=
 =?utf-8?B?TEtydUNFTWtQS1RET1VJSytkd0gxWUdYWTl5T1lkaC9TdWNPcDhUUWtFYkpZ?=
 =?utf-8?B?TGlJb1NKYklSWmZMVWtPVFIrTE0zeFNlenZvN1Y1dWtIYUFEL3BrMUZXb0xs?=
 =?utf-8?B?WGRXL2RJVUtHR1lrdzVOenE1Wmt4SCsyTG93QXNFVzF5SHhwQUxqOTViRjlY?=
 =?utf-8?B?WU8zNkdCbktTTmN6eS9UdHh0OTN6aHJzUDZvQ2IwV1U5b0VMVVVtalZOS1NE?=
 =?utf-8?B?Q212c2J2eXpzMGJadDcwcUhrU1JwdnlBL0xVc3Z5dzE2V2ZVSTRiNE4wTENl?=
 =?utf-8?B?SWN2T3UwR3plYzQyODMwY0ZxL3hadGl2VTd5L1FmRDA4V1JXMjNHNm5OckFT?=
 =?utf-8?B?U3ZBakhybVB1OXYzRXYzRFgva1ZuajlOSUxveGt3aUIwYU5xeGhnM1ZhaDgv?=
 =?utf-8?B?dU9MZkNtSC9LK0JPaTZjZU9Jc2ZWbzFsczZjR3BsK3p6V1dUcmVPcVozZmlv?=
 =?utf-8?B?a1RDY2RaMzQvNVBCQy9PaXl6OVFMVFNLd2RYTW1ta0hwanA5Mi8zQkdsd0lW?=
 =?utf-8?B?Qkp6Y1lXaTQwSkszcUt1MUNWVHNGYmsydDk3eFBaakxxOVM1dzF1NkxvcCt2?=
 =?utf-8?B?NXljd2JDZ1J6Y0Fyb0RCODdMdE5PWE4wUE4vUTVPdExKekhJUVMzdnFHUTRz?=
 =?utf-8?B?VzJ1NWg3QnZCRlF4UHo5QWdhQTJlNVUwNnNIMTBsMXg0SEQ4ek9qdmprUVJz?=
 =?utf-8?B?SjBnNmF3RjJoUTRPYVR2N3M3cVJMU2d4MmFHTHlwenZvcGtHelYvNkNOWElt?=
 =?utf-8?B?RkJselA5TFA3YU9oM21mMjNLMmZvdjc2UFlmby9XSjRTdUtCQnNFd0ZHUUFX?=
 =?utf-8?B?NE1DMXVEVXhrbjZ6OG9oL3B3d2ZMS0dMcTN4a1lxWnh6ejZKd2d1YXJJUVVW?=
 =?utf-8?B?Q016TXZLOXZ6blFrM0p4dzlZT3pFUzFwU2YyRVIvLytQbTJRdVVNK1ZqZmFV?=
 =?utf-8?B?aE85cTJ2Qm0rUE1tUVJGeEdLVTlGU0p2Qm5TZS9haTk1UzR3anFQWjVkTFRR?=
 =?utf-8?B?eE5FSWJDY2NzSUplYVNjRTVsdE1kamM1WFhDWUZVWFNtdmYydXNzY2J1M25V?=
 =?utf-8?B?K2x5ZFJBN2tTQVJMSnoyQkhpTlpBM3c3YmZwRm9BdFQ0ZCtjS3VrUmJ0aVBz?=
 =?utf-8?B?M2R3QWpmSVVWUk1leE12M3loWEZNUG5MYm9veFN1M053SXNNUU5QRmRIcldP?=
 =?utf-8?B?ZXBZSko5VEg3aXBnUWRPZjhhRWpMTzQwelpPYUNNOWEwN2tzV3FhVEZLMEJi?=
 =?utf-8?B?WUhnNFZ6eXpwV2J1dmYvb2ZOeVBXdE1HS3g2SkpHYmtzMzd6V2tsYUlHMWlY?=
 =?utf-8?B?OUF1M1Q2V2NualR0S21KYURPRjFhNjhqazMvYkVMVmZralhGMG5kN2JsRXdF?=
 =?utf-8?B?bFlMMFBmQlpzMVJ1UTlzb05odGlYYXJxWk5uWTZEQXlPUGFva0V4WmhMd2Vk?=
 =?utf-8?B?NUd4RHlvV3BvMmcxOHZhU2VuSDBmNHRkVFNFMFdEaWlKYUdJd3BsaHdNb2N2?=
 =?utf-8?B?MXpXUzZheWQ3c291TTFQSnYyMlRSay9jVDU0T1MxUkIxVTIrbzBEOTA3NnVK?=
 =?utf-8?B?eGkxYU04WWVGWExscjFYM1VncE1VdDVnZXg2dm5rd3labnRNMC9FYU8yV0Zw?=
 =?utf-8?Q?vJD/XOFPaPLrLcwyN/xCB0hghSt58G3cv/7PMmapZo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fc95df-2d51-4c86-8453-08d9c21f911b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 12:11:48.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ba7oItcrbCNVs4jGqFYWUGgVI/BAFJCJ9253NBzx4HOt56wnEgaj7wNPzuMWBwfxJ6qQKYRzWIKf5VLAMihDgSoaeDmaUHcGm1ZNB8sSclE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2849
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::70b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
> Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
> they first search for the job and then perform an action on it.
> Therefore, we need to do the search + action under the same
> job mutex critical section.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockdev.c | 9 +++++++++
>   job-qmp.c  | 8 ++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/blockdev.c b/blockdev.c
> index c5a835d9ed..0bd79757fc 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3327,12 +3327,14 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
>       assert(id != NULL);
>   
>       *aio_context = NULL;
> +    job_lock();

JOB_LOCK_GUARD() will look better in this case

>   
>       job = block_job_get(id);
>   
>       if (!job) {
>           error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
>                     "Block job '%s' not found", id);
> +        job_unlock();
>           return NULL;
>       }
>   
> @@ -3353,6 +3355,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
>   
>       block_job_set_speed(job, speed, errp);
>       aio_context_release(aio_context);
> +    job_unlock();

You add job_unlock(), but not job_lock() ? Something is wrong. And anyway, I thin JOB_LOCK_GUARD / WITH_JOB_LOCK_GUARD are generally safer

>   }
>   
>   void qmp_block_job_cancel(const char *device,
> @@ -3379,6 +3382,7 @@ void qmp_block_job_cancel(const char *device,
>       job_user_cancel(&job->job, force, errp);
>   out:
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_block_job_pause(const char *device, Error **errp)
> @@ -3393,6 +3397,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
>       trace_qmp_block_job_pause(job);
>       job_user_pause(&job->job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_block_job_resume(const char *device, Error **errp)
> @@ -3407,6 +3412,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
>       trace_qmp_block_job_resume(job);
>       job_user_resume(&job->job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_block_job_complete(const char *device, Error **errp)
> @@ -3421,6 +3427,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
>       trace_qmp_block_job_complete(job);
>       job_complete(&job->job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_block_job_finalize(const char *id, Error **errp)
> @@ -3444,6 +3451,7 @@ void qmp_block_job_finalize(const char *id, Error **errp)
>       aio_context = blk_get_aio_context(job->blk);
>       job_unref(&job->job);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_block_job_dismiss(const char *id, Error **errp)
> @@ -3460,6 +3468,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
>       job = &bjob->job;
>       job_dismiss(&job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_change_backing_file(const char *device,
> diff --git a/job-qmp.c b/job-qmp.c
> index a355dc2954..8f07c51db8 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -35,10 +35,12 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
>       Job *job;
>   
>       *aio_context = NULL;
> +    job_lock();
>   
>       job = job_get(id);
>       if (!job) {
>           error_setg(errp, "Job not found");
> +        job_unlock();
>           return NULL;
>       }
>   
> @@ -60,6 +62,7 @@ void qmp_job_cancel(const char *id, Error **errp)
>       trace_qmp_job_cancel(job);
>       job_user_cancel(job, true, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_job_pause(const char *id, Error **errp)
> @@ -74,6 +77,7 @@ void qmp_job_pause(const char *id, Error **errp)
>       trace_qmp_job_pause(job);
>       job_user_pause(job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_job_resume(const char *id, Error **errp)
> @@ -88,6 +92,7 @@ void qmp_job_resume(const char *id, Error **errp)
>       trace_qmp_job_resume(job);
>       job_user_resume(job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_job_complete(const char *id, Error **errp)
> @@ -102,6 +107,7 @@ void qmp_job_complete(const char *id, Error **errp)
>       trace_qmp_job_complete(job);
>       job_complete(job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_job_finalize(const char *id, Error **errp)
> @@ -125,6 +131,7 @@ void qmp_job_finalize(const char *id, Error **errp)
>       aio_context = job->aio_context;
>       job_unref(job);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   void qmp_job_dismiss(const char *id, Error **errp)
> @@ -139,6 +146,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
>       trace_qmp_job_dismiss(job);
>       job_dismiss(&job, errp);
>       aio_context_release(aio_context);
> +    job_unlock();
>   }
>   
>   static JobInfo *job_query_single(Job *job, Error **errp)
> 


-- 
Best regards,
Vladimir

