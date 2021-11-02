Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A67442BF4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:58:20 +0100 (CET)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrUg-0003qp-O4
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhrRG-0008MZ-DQ; Tue, 02 Nov 2021 06:54:46 -0400
Received: from mail-eopbgr20125.outbound.protection.outlook.com
 ([40.107.2.125]:32397 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhrRE-00065j-7l; Tue, 02 Nov 2021 06:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYKiOBMB3OJCh6/vbrxZ0YBZPrTAzEfbEat2TXriLwII5HcjCauNw7x/lx2BS65L2EZNhH039BxKBPTECgv5GO+18+IUU32uOe5y0TQm/P785WnzX4VB5fx+CoK7J4EXgxfJ9arE7lrrvJ+OVl9ae3rQA8wMd/VQldXcIGyqDXpl6QISPHm6A1amz8JvjAz/fSnFhoRNijiJ/y28or4vCjL3iyYM9ILGFE2CfP/3NJwaP8yhakbYtVvZm8M6LERTM/4BMTQaG9gDVCtITtIP51kUDZaeiEHi6iwtmUDW+NcOxGAj8EnnGbi82tTNPt0LmNbNAG4S6X1fj+2uqctBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0MZWq2i5NutIs7Q/jnQxZdNQOUZsqqoPkC5RXarKME=;
 b=MQykfNFt0x6Wbj+OQRZpwq8MTPNX6eEkVqkKGEaNKDjThnPBtPxjQAUK0NZP1o6Up49eLG87UW0K8YQUsBwrstCJ2tpZqf19ZxLcQRiaaA1sH2T/SxFEFsWK16efij4CBHm4uBHsFxhbqyw/kuOelZVsNsvkSv0uLmrm2NO1V+NvHO5O3bCvzfEjLCt0hYl5ncTbqJbzqXay+ExuZGCYaexrdajF0l/Ht/8LdzVfdqkcvEWD6jZZ6gBOWqOXwKkFxhJDqoRZRg8VyHHWClBWEXhxobvfn132WUBdaW9TVEmGdZVcB/OO96qfUvhPloy1Ec0S7Tk2X2CUSJcNPtEw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0MZWq2i5NutIs7Q/jnQxZdNQOUZsqqoPkC5RXarKME=;
 b=N9b8qG2mZwGfrKaMlreLfI7fM6FOGJSE8Nk06GMkVp2UoEH16IV9mRweccWCM9LFT+Rg5BrM+CY/PaFAPR6S0seyoM96Fa6R4kF6XOHujmEX1DAE1al8CMheeznpGvZY1H9aGljryi/Yhj7h0fDAftgS9QFjxxubAiPr/Eyg1hU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 10:54:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:54:40 +0000
Message-ID: <453c52d0-dca5-e91a-9915-20e58136b044@virtuozzo.com>
Date: Tue, 2 Nov 2021 13:54:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 07/15] job-driver.h: add helper functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029163914.4044794-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AM6PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:20b:6e::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 10:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df99e6df-0b94-46d9-1dd9-08d99def2b58
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: <AM6PR08MB31588CE9597F51FBDD93A0A5C18B9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukDUOQGNnedROjIa5rzW9I5HU2+SDTTEDEcjBhxzWTjzg9jVvORtd4Ulae4/Ysq2P5NPb50Tb2orvfKDMae+61Apadaw33yo9L8ihFBq/cawXxDrby5xkg7HmMlad68np4PR5S2Re1DFNigtdS6atVp92XYxxuHbOCiidxXHa7PhkN8uYkaIZdMyiJaQhiF/50GMesRaRPOFzjDYm/kOZ+ke7xjx971jTYdnxLhJaOSRFMLqxZWLaDc/tVf8UgBq69YsATMxJewdTNSZEiSELXedSOlDsbg3QUJjycmE+nJzCfzMMwckhi4HoHeLIuEncYWgI49nbWEwGIgPpY+RqRAE7CFAq87l1JVEVbGisFsAsOEM5fbWC9SmzCjLAPb3YL4P57cxZbxMYaNDdw/l0amdrvGnLs9hBhBF2bYDkm78xlUf0lPt379wjWDlP4kZz2a/Qzm08iMPyIpmI6YNUiTxOrj38mgloD7tbNJVZ9zZDTGJMuIJLuevbiesJ2B8SFHovHdngSOb/cwE4GhJk1/fCqoftnzDzIcsxFrvkxwzFb9+NDDFKKLQhF42YlyQPE7KR9BIaJfScEUeoNGYJdulDCWGM2v+fcNTMsHQ5E8Haitjhc5ysODhGo45a2YsjCmKkcz+hJSg8IeYO2hvOn8tfDIvjMRJU3lxQ4oJTL7RruJkM5yTpDRm7VToV2nJZ23RNXhxSdLECAC1OjMB8ZwdY4nMaQ4QUprfTWWQvfQ+LPIqmUEM1k9CLlk9vhaNgKLLIZl6wAfFrBxX3kIUZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(2616005)(31696002)(316002)(54906003)(52116002)(38350700002)(8676002)(38100700002)(31686004)(66946007)(956004)(26005)(5660300002)(86362001)(4326008)(2906002)(6486002)(508600001)(8936002)(36756003)(83380400001)(7416002)(186003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3VnSzN2TENxamZncCtkcmhmMHRRY3ZNUmJVNWlqVmxtRWZ5MUNRV08xbWd3?=
 =?utf-8?B?MnEvUUNmV0swb1hkL09Sd1dHQURvYjhJSjhMTEJ3M3BZVUozWDNvdVB3WDNz?=
 =?utf-8?B?T1hOSWRTSTNrZzNVZVVUcGlQVzB4Si9tMUFqQXVCMkpvcTdTdFY1bkJvV0FP?=
 =?utf-8?B?Tit1d0JFSHpKSDNVdjNnYWpMK1M0eGtVUXZkdGtDQUNscndMam5Bc25pUHJB?=
 =?utf-8?B?YkQ1ODZTTWRDQ1kxYTNMMFlyUzF0cjJLc2FpcjZtSWpGQzYxczNrL1RkZi9k?=
 =?utf-8?B?SUg0RjZid0ZuTkJzWkJDL05ONzRweEVRVDNzTGpVZWpsK1FlUzBIMVdyUGs1?=
 =?utf-8?B?TU5sUys5ZkZPZDhwbWtkcUM5ZUswenhFK0xWZm5LU1M0bHQ0aEttQ2tKSlV1?=
 =?utf-8?B?NEMvbnArSG9NMklNdTAzNlYyandjMWtJZ09TNWtCYzlWVnVvbXpySEcwZUNB?=
 =?utf-8?B?QUt1TkRoVVFUZzRvUmF1L3UxRXRxakd4ak94Mk03TjBjcSt3N09mWDNXaTZ3?=
 =?utf-8?B?RWlTVFN2L3lXa2g3RXVxREdWVi9GeE5KUzVLa0ZqWnZkMjVyMWEzZUVQOUtY?=
 =?utf-8?B?QUFxbmZueFBrRDJmWlV6QWp2dDk2Z2RycWZvRzhyZTFTSFJ3Q2lNYVA4SmRm?=
 =?utf-8?B?cTdZLzBhbTVrMHJ5Wk9mZnVBRGl1YjlDZkV5SEhJSGY3cXRiLy9raHk4Q2NT?=
 =?utf-8?B?bE1NMHprdktjZFVsNW1nMU91N0lTdHVLNFZtMzlTK1hpVlJuVTAxaloyV2NO?=
 =?utf-8?B?WUdwaWRhejhIalZOQXgyTG5MUWtzSVdNTGthSzhMczR3c1hqNEhpeVV4UlFG?=
 =?utf-8?B?NHg0ekt6eXZkMHdCYXNCRWxPK1BjNzVKQ3dOVitGbjhsRU9SbXl3SG0xNXh6?=
 =?utf-8?B?aWt3cVpIWXJiSDBXclkzVW1PbFJ2U3lmL293bktuL2RjK3Raek1Cdzk4Z09X?=
 =?utf-8?B?dkNlSnRqYzZvSnliN0dEcXBZVW9zT2pGclM1K0RURlZzYXRpSmFyTXFybzF3?=
 =?utf-8?B?c0RNbzRYaVpCRkhFNnp5M3VHMmJ0QTg0a0Z5am5oSzF3WWtkWnFEMU85b3NH?=
 =?utf-8?B?cnFSUTQyVVdPbUNrQ1pjR3hacXVNdkg4Q3FKd2xWQWhadzJtUEZvUVc1c0oz?=
 =?utf-8?B?a3BZbzA3cUdHbUxyR25OTmYrS2tFZzBCUUxBcHp6V0g2MjlZakNrcFUzcjBD?=
 =?utf-8?B?WkkyVVpRbmpvWHQvbVlEMjA4VjRvckQ2UlluejNFUTFWenFRWXlJUDNXNi9E?=
 =?utf-8?B?MTZkdnhuSzB0WDByWGE0OGF3Mklqa3ZRSWZyRWx1OFdqa2lYVDZGYWZhYzRI?=
 =?utf-8?B?ck1lVVRvYVRoSTNWYjluQ1ZlVXRSWnJORnhYODZvY0tlcGw2WlJHMEdTY042?=
 =?utf-8?B?VngxTE1leWhVbmx1TmNTR2Z4N2dnVGI2NkZSVnM1TWRTUFluOS94SkVGTDJv?=
 =?utf-8?B?OFdzYzNVYURiN2RWU3YwQWlDdzlmUUQ3QUh5OVZzWUdmQTRJLytaR2xZZnFF?=
 =?utf-8?B?OW1yMEptWkZOSHdva1F1dVJXa3A0K1k3b0t6UThMa3AyNlBnc3g0NG9aYUlq?=
 =?utf-8?B?clRJenRhdWkxZzFlRHNHZm41M3hTbjMvWWlpTTF3cEEvUm55V1FlSmJFT3g3?=
 =?utf-8?B?RWc0emFaUWZXaVFNY1prSStISjJXNkhwY3pxUm9qbGhhbktsQVBXeUJrTjRY?=
 =?utf-8?B?YTZLNENrU2xhMnZuaEhXU0N2OGhlRUxNckMyamQwQUZZcVU2TkxucmUrOVlm?=
 =?utf-8?B?ajNIRGU0eDlLaXRVcXhkZSt2NDREaXV1b1RmVSt4RXRHME52QzF3ckxPdTNQ?=
 =?utf-8?B?NVlUZTd4MFkxazNYS3JCQVJrTlFjUU5oSTArbE92b1cweW0rOWYyWkZFY29Q?=
 =?utf-8?B?NXhVVGRZRnZ3ZzVnUEEyUmdjMHQxbHJqL09OVmlYZzVDVHo3L1JkcnJ1RzVk?=
 =?utf-8?B?NExGV1BwaU5jVTJjcnBCTDFZV3BMTm1kS3EyNEZDNHloRUlIZ3FpMVVnSmNx?=
 =?utf-8?B?NVBvbWMzTGxXM0dsb0JmTkpVOEFqWTBneXZ6SDVjNnhBTklvMW91QWxjdlVy?=
 =?utf-8?B?US8wS0pGQkZwNkZZNk00K3FBcm5IQVJ6RDZuUkxBRlRsZTJMWjNteWVJck5W?=
 =?utf-8?B?d01nd21kRlRuNHJ1SXhkVXpnNk5MR2c4Vnk2cXNHTFhlWTRlQkZHUnVqeW5P?=
 =?utf-8?B?ZU1aVEw0NzZiMjNYZjY0cEdLbjJEd3kzTzA4aXFLdzQ0MFZjTlA5TnZ3czdh?=
 =?utf-8?Q?RINGQP9M3k3JAH4Cy+xlIllhy36/wgfiNfzKBACirg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df99e6df-0b94-46d9-1dd9-08d99def2b58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:54:40.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43GR3WA0cXKfJd26lCvncr+rHLMkXK6MDwfL8eS5ts+eiEbwszEqSCHRp+T19bZBD3nFh5pIIJoUBQuXrpEHakOJQmstmlsUr7eHTaguvIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.2.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
> These functions will be useful when job_lock is globally applied,
> as they will allow drivers to access the job struct fields
> without worrying about the job lock.
> 
> Now that we are done with the job API header split, update also
> the comments in blockjob.c (and move them in job.c).
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/job-driver.h |  21 +++++++
>   blockjob.c                |  20 -------
>   job.c                     | 116 +++++++++++++++++++++++++++++++++++++-
>   3 files changed, 135 insertions(+), 22 deletions(-)
> 
> diff --git a/include/qemu/job-driver.h b/include/qemu/job-driver.h
> index 1efd196da8..19ae5ce8f0 100644
> --- a/include/qemu/job-driver.h
> +++ b/include/qemu/job-driver.h
> @@ -149,4 +149,25 @@ void job_early_fail(Job *job);
>   /** Moves the @job from RUNNING to READY */
>   void job_transition_to_ready(Job *job);
>   
> +/** Enters the @job if it is not paused */
> +void job_enter_not_paused(Job *job);
> +
> +/** returns @job->ret */
> +bool job_has_failed(Job *job);
> +
> +/** Returns the @job->status */
> +JobStatus job_get_status(Job *job);
> +
> +/** Returns the @job->pause_count */
> +int job_get_pause_count(Job *job);
> +
> +/** Returns @job->paused */
> +bool job_get_paused(Job *job);
> +
> +/** Returns @job->busy */
> +bool job_get_busy(Job *job);
> +
> +/** Return true if @job not paused and not cancelled */
> +bool job_not_paused_nor_cancelled(Job *job);
> +
>   #endif /* JOB_DRIVER_H */
> diff --git a/blockjob.c b/blockjob.c
> index 4982f6a2b5..53c1e9c406 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -36,21 +36,6 @@
>   #include "qemu/main-loop.h"
>   #include "qemu/timer.h"
>   
> -/*
> - * The block job API is composed of two categories of functions.
> - *
> - * The first includes functions used by the monitor.  The monitor is
> - * peculiar in that it accesses the block job list with block_job_get, and
> - * therefore needs consistency across block_job_get and the actual operation
> - * (e.g. block_job_set_speed).  The consistency is achieved with
> - * aio_context_acquire/release.  These functions are declared in blockjob.h.
> - *
> - * The second includes functions used by the block job drivers and sometimes
> - * by the core block layer.  These do not care about locking, because the
> - * whole coroutine runs under the AioContext lock, and are declared in
> - * blockjob_int.h.
> - */
> -
>   static bool is_block_job(Job *job)
>   {
>       return job_type(job) == JOB_TYPE_BACKUP ||
> @@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n, void *opaque)
>   }
>   
>   
> -/*
> - * API for block job drivers and the block layer.  These functions are
> - * declared in blockjob_int.h.
> - */
> -
>   void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>                          JobTxn *txn, BlockDriverState *bs, uint64_t perm,
>                          uint64_t shared_perm, int64_t speed, int flags,
> diff --git a/job.c b/job.c
> index b66d59b746..db7ad79745 100644
> --- a/job.c
> +++ b/job.c
> @@ -32,6 +32,23 @@
>   #include "trace/trace-root.h"
>   #include "qapi/qapi-events-job.h"
>   
> +/*
> + * The job API is composed of two categories of functions.
> + *
> + * The first includes functions used by the monitor.  The monitor is
> + * peculiar in that it accesses the block job list with job_get, and
> + * therefore needs consistency across job_get and the actual operation
> + * (e.g. job_user_cancel). To achieve this consistency, the caller
> + * calls job_lock/job_unlock itself around the whole operation.
> + * These functions are declared in job-monitor.h.
> + *
> + *
> + * The second includes functions used by the block job drivers and sometimes
> + * by the core block layer. These delegate the locking to the callee instead,
> + * and are declared in job-driver.h.
> + */
> +
> +
>   /* job_mutex protects the jobs list, but also makes the job API thread-safe. */
>   static QemuMutex job_mutex;
>   
> @@ -213,18 +230,94 @@ const char *job_type_str(const Job *job)
>       return JobType_str(job_type(job));
>   }
>   
> -bool job_is_cancelled(Job *job)
> +JobStatus job_get_status(Job *job)
> +{
> +    JobStatus status;
> +    job_lock();
> +    status = job->status;
> +    job_unlock();
> +    return status;
> +}

Didn't you consider implementing a kind of QEMU_LOCK_GUARD() / WITH_QEMU_LOCK_GUARD context manager? This will simplify these helpers a lot, to just two line functions, like:

JobStatute job_get_status(Job *job)
{
    JOB_LOCK_GUARD();
    return status;
}



-- 
Best regards,
Vladimir

