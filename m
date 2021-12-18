Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40560479AB0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 13:09:39 +0100 (CET)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYWv-0001Sf-55
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 07:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYVX-0000Yp-Kb; Sat, 18 Dec 2021 07:08:12 -0500
Received: from mail-eopbgr60126.outbound.protection.outlook.com
 ([40.107.6.126]:58422 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYVS-0003uq-8J; Sat, 18 Dec 2021 07:08:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk4ItVkVyPu10P2GWKjhi5+vN+JWqUdMsbpEfO55CRyJu4O2Rs2rTf9PjgciN+iKk3w7k764YwO8vAmMnlxCM3yejpb/6DNPrwlTGyeXfGyHvJBXzNQHUYHmmvM2N2/4MPPLLSNjVygwlh9t6TAl8TGgwBHynZ0iT8hwX1X4o2PWf5An5U4WlIyRESrp3BMcAJC6kwcPAYZX0jCIl9wkAe5qyBcNLv/NI2CCKYEbwmUSEKC9B/383B9hp7JiwLh+tG8FoAm1lM7/JvIO+PLguAUIcRTLhFh8UxcsGR6Rj5mbu5UuWr75h9iF+TTkwylhu2E+gVpr8zfXX2u0FX4JMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AFy2CUjlNt4XJ6nSucNFk7ave2+Uw4pZyaVL3jhNmQ=;
 b=Ef8YPTX+X7wzyo4E6DLbNfnUJmEpa1CzJsR7YEDkoPt5eVUVGpzig6jc6WFlx6f9GBRR6AQeJCuSsxaVzYTYeTET1uIG1XdHrTr4BRMI7E4ELtxY6eGHdJ5vtuNfvHH8Xpekz2w4nJvjf8i/DnU1AmvVV1zaFXDf/Yq9/Q6uMhw1mm1xUvx0t8m+3aGqxTMFAcEyVze4WqiyS39zL3ta2rQEbvJnh9F1wO0fAafiI3BW8wYPPwCydJmL++0qPi/0gkCxLDNvedYeXhUsucA4wU7fH7BwT4SRpAgHijyaFn0DhlcU51GDGDkD9E71MOvLXGj2Ps3hq1+tBBSXg+AZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AFy2CUjlNt4XJ6nSucNFk7ave2+Uw4pZyaVL3jhNmQ=;
 b=ko2xGBj4DoYMGMvKH67zFyCFIIAQVvKODTJeNhlc1PfKSI+zDOFrZ14vlOKUbjT5JnBlCYLM9cjllqiU9BHXARBeo9+XhJVBF8vHCklcH2dfLtVnhZU2p/SsIaFFrymz/FeGgscqBfxKMd3uX1lAEjTf6qldFZSdAurr0hdPTrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3843.eurprd08.prod.outlook.com (2603:10a6:208:fb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Sat, 18 Dec
 2021 12:08:02 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 12:08:02 +0000
Message-ID: <6982e901-c03f-6b90-b226-77814804c00d@virtuozzo.com>
Date: Sat, 18 Dec 2021 15:07:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 11/14] block_job_query: remove atomic read
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-12-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104145334.1346363-12-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 12:08:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ebce537-debb-4705-5f2a-08d9c21f0a58
X-MS-TrafficTypeDiagnostic: AM0PR08MB3843:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3843A83C6BA4A773570B23A3C1799@AM0PR08MB3843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GcHBFY1TSY/CCDrNdz8jD4lCzVzo+vvw6+kUQDwyCJDlJigIbwJlUe/Lgq+FXOTPeU3bxFJszxeWxPdHFs05CLsxE/WD7KZWSFUlogo+VWwj8UQhzrr9evxAcJvCMeGmDKRI+0YmHrmUwLWD5OvUo87tKhS/4p6PUzpUrAZZA7zfTXFwjZznQbTwnmGSLI07wdxqaMfnSJLCckpZFa3BtpEOxtplHoXqf0KzM4vZL2zgvHDiS98PRSe/LbI0lvILSddWxwDxMvhpyXAuQmZB6VHkEApmzrNprBkxVPGl0pKbfcCaSCusaSAmFoGuewnGUPnhN3oK6pZGS2roheihGWtHRy93I8vCMbunANIAbMA9KsYZPWIAAO0fkwtA3SCTG2rlnBBbXYqcAzsg0H49ksTzQPUAO7VVtr8Dn+rfo18qMIJynj7cCCiFYQAmvvVNTOE8ydHeurQaEknrSrr6xRP39npklS6E2icA0jLaLpaA5slEJOSPWb8Go9YLHdXVVhrsZa2QisQASvWmER7kpPkwBE/0vv/l3roWVSDmtFqu9CDeARyvTf/NqJOME9wkAMOyVVAmTcf/PU5Q6nbYvsrIhGPB/eCMY3ThYayODHIW506Tmgp0fXJiKtsw17R+dFtIeQuCh2UH2i+YkdBfZV6pytHEEpSsW3dRyjATTXiFzUV7xwjnLDZHdY3D68eNvupJtWJknfk6XcladwdwOLA3fTmd/1Fk9DIgAv9P+y9+A8d/HaDYkJpqSveCm/shvwWyh8wpNQjPT249IVF+Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(4326008)(38100700002)(38350700002)(508600001)(52116002)(66556008)(66476007)(2906002)(16576012)(36756003)(66946007)(186003)(956004)(86362001)(31686004)(8676002)(54906003)(316002)(7416002)(31696002)(8936002)(83380400001)(6486002)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm5zbWlBaFdncFJTSnJPVmNUdVNZeTdxcXVlNFp4cnZHYVlyREV2VlVZQVN5?=
 =?utf-8?B?YzNGVzFXcktWYlFYTFpVelFFMzVVU0ZueEVkcE5qU0F0c3VzTjFUa3BTZ1pX?=
 =?utf-8?B?a3lYay9ob28xaXVKV2ZJd2cvejhKWUUxYWxvMXV5Vk5uVERrS3FJQVdjRnNI?=
 =?utf-8?B?Q0hFTEtDQXhiREVvbG1LUERnN2pOL2xuUmFia2Fzd2lueVB2bmFKdk5aclJO?=
 =?utf-8?B?WVA1dzIrUENDQVc4OUcyMGNvY2c1K2UvVGtsd05wV1RaZ0pBM1N6T0UxN1I1?=
 =?utf-8?B?UU9uNTFnVGNveUc2VFovbGtld1RETWhtYXdWNEpmZGtVT1o0d1RwMGVCTWFh?=
 =?utf-8?B?R3FjL1luU1ZKWnhUYnA3N0VqNlovdWlaWTN1WDgxZHg0TnY0alVrUkFDWk1O?=
 =?utf-8?B?UEt6b216aXM2Z0x4c3ZTeFBsaEwxTW5pQXBnNXdVK1NUMzFJcFZ6TkF3TURt?=
 =?utf-8?B?amJjVm1TS1Q1WXhBQnlvbW05b1U0Rmp5cXlCcmhzRXBkOFJKYnZ4YmliWTMv?=
 =?utf-8?B?Z0FyeXJrc0l3dEVBcmpRM2ROTTFUU2JLRkhVTVMvc1JhdUQySmZFeVVudklo?=
 =?utf-8?B?OWY2VXd2dkpzY25nR2VvSVlMSXFITjFwSVBjekVVcHFYbURWUnE0NnQ4bmpI?=
 =?utf-8?B?OE1tTDlhbE9oYno5NmR2RDlQVDlLOXk1T0hmVSsxRkNSbzM3S3lpN0JlRVVo?=
 =?utf-8?B?eWhVaGlCZUJZbEVPQlNPMElWZGFBZXBETDkzYnNVVVNSaCtQU21PV01hYUU1?=
 =?utf-8?B?enlhdHVOMnZWZFhjTHlGUGdUTVVlenAxMjVXOW1rSHZuTVppSFRlR3dZa3Rx?=
 =?utf-8?B?OVNLV2FPVmEzZ05PUk01VTJ2cTA3ckFNSWR0Q0d0VUdyK0g0WmM0c09HaUJD?=
 =?utf-8?B?RzVZUyt4NkErVHphbldwUG5Fd2VTV2xKOWppOVFrMkwyS3JaMldvTm5uUXI0?=
 =?utf-8?B?aDAzTU9jL0xRcHNsTm1FVjh3ZEFlUC9ITUNwLzlxMk1CMWUrRFMwK2J2Y0N1?=
 =?utf-8?B?MUJuc2FKd0t5eGw3ZkRHZkxhVU9nelVFeTQ0dXowUFNzUDhkZ1lCUUhwZXhR?=
 =?utf-8?B?cU5sS1QzNkNPQU1NcUtvbGoyeXpYNDFwYUNNdHFpRW9JWm1KNXdPS2JzUW9i?=
 =?utf-8?B?bGdJZUlEcWpzL21vcm0xQkg2SFhjRUpkU3FMYlBTbVRnMDdQWHh2SGF6dXgx?=
 =?utf-8?B?T0hKc1lFa2J3TUVyOW8zTWhWaHJ5ZWtWRE0wanptU0xHVEpNSWhuenNZcDFl?=
 =?utf-8?B?dkZaMklYZU0vTXIzZkhkVFBCR21ZaGtKZ0N5QTJkaTMrTlcyWEcwL3FGeWpY?=
 =?utf-8?B?cWZsZ25ndVBZS29GWFp4ell4OUk2R3ZjR09vTVRua0d0VUFRcGNyUHQ5eXlL?=
 =?utf-8?B?enVKVlFuQWdYUUIrYXN3c0VOQmZudURZdlpRR2xkclFpRnhRblV5UzNhYUdG?=
 =?utf-8?B?N3l1K1dEcmdjMnRYWE85U3NkT243amZZejdIRldmV1V3V094STRXRk1DYUY2?=
 =?utf-8?B?T01FbVV6cWV2SDdneVNVcmRITGwvSTVSMHNNNmJ4cm1lOVVINjJ3c1QyTzZz?=
 =?utf-8?B?dFdZS21XZVdYNFY5bHlNUWVuQ0l0Vmxnc2IxZ1B2MHNvTkNZT2RjMExjTVQx?=
 =?utf-8?B?cjZ4V1JLWFZMQjRjWDVleWlYUkd5S0RrbTQxZmlTU1Rvc2duWTBoWXFDNDFT?=
 =?utf-8?B?RjkwSDVYazFpS1B3amF6SkRqc3d6bVN1M0VQVGZxelZIWVBiaXUxREVmMjNo?=
 =?utf-8?B?YkI1UFNIRkVkU3dDeVpLdFJ6RWtRU0ZRSDFYUVlkTGJYM3ZuWHFHa1hma21t?=
 =?utf-8?B?RjcvRURabWIwVm9rS3g3L1A0aml5RUd5VFRNUmQyckdMalE3NE1PdmJzbEZG?=
 =?utf-8?B?VEt5N2I1TEM0WUVSSjEyb09wZGhRMWN0NG9BcUlsM3B5SzBQSTVkcTZCYmFC?=
 =?utf-8?B?QWdGQVR0MmZZbUpMOFNueDIyQWxuWlRzbUI1RDl5aUFROVNBQU1VYUc2ai9o?=
 =?utf-8?B?b281a2RxeXVCMFIwUUpFdGZjUWZaY21oNHJGMkJGc0hzVzkxVVlqNVdtOWp5?=
 =?utf-8?B?d0djc2ovQytjV0FaTUhTOFBpamV1NGhxV1F3ZFBhLzltU0o5L2F5M1Z2QUNS?=
 =?utf-8?B?UVdoVlc3NDhBT2pzeEZoWk9OTHFPYXpBK0p0cnZSU21Ga093cktDQkhqeW8y?=
 =?utf-8?B?OG9aeWYrMC9JMC9GaGtLVkxMUVVxTldYSTA2L2ZlZ3l3blZnYTlQbkxmR0RN?=
 =?utf-8?Q?2iuI7fvScX/yOvg9te5ZmXwfLU/9vszRFtRdAoUaKE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebce537-debb-4705-5f2a-08d9c21f0a58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 12:08:02.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BpPUNCEGSo5s82HNHVbyE4c1eMEl2FBeoHc+j2LmB4k9IfswZ2mWkveoJuOxXh8RyEmox5FTZUfsHsCQvijFFeNX5xhIgo7ZEKY3nvtspc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3843
Received-SPF: pass client-ip=40.107.6.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
> Not sure what the atomic here was supposed to do, since job.busy
> is protected by the job lock.

In block_job_query() it is protected only since previous commit. So, before previous commit, atomic read make sense.

Hmm. but job_lock() is still a no-op at this point. So, actually, it would be more correct to drop this qatomic_read after patch 14.

> Since the whole function will
> be called under job_mutex, just remove the atomic.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockjob.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index dcc13dc336..426dcddcc1 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -314,6 +314,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
>       return ratelimit_calculate_delay(&job->limit, n);
>   }
>   
> +/* Called with job_mutex held */
>   BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>   {
>       BlockJobInfo *info;
> @@ -332,13 +333,13 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>       info = g_new0(BlockJobInfo, 1);
>       info->type      = g_strdup(job_type_str(&job->job));
>       info->device    = g_strdup(job->job.id);
> -    info->busy      = qatomic_read(&job->job.busy);
> +    info->busy      = job->job.busy;
>       info->paused    = job->job.pause_count > 0;
>       info->offset    = progress_current;
>       info->len       = progress_total;
>       info->speed     = job->speed;
>       info->io_status = job->iostatus;
> -    info->ready     = job_is_ready(&job->job),
> +    info->ready     = job_is_ready_locked(&job->job),
>       info->status    = job->job.status;
>       info->auto_finalize = job->job.auto_finalize;
>       info->auto_dismiss  = job->job.auto_dismiss;
> 


-- 
Best regards,
Vladimir

