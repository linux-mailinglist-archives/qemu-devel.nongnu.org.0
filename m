Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911923FD8FE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:49:09 +0200 (CEST)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOjs-0002Nd-KE
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOfY-0007kl-7d; Wed, 01 Sep 2021 07:44:40 -0400
Received: from mail-eopbgr80112.outbound.protection.outlook.com
 ([40.107.8.112]:12288 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOfM-0007iR-Ds; Wed, 01 Sep 2021 07:44:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAL23pVmcss+RJllR8Y42KRfXRnpPYKG04ZMM2zoMfz3qh8xBmo0LxCiChzi1QzSExytHEh1E0ai33Gj3oNWqjDF64D2ei8Ma+4Ol04H73LvParb5iq+6wcN/VK4+E0B5VZp770b4j9wT5nIEFWpLUzkz8vFsxzUvZLKadAJdXKO0NZmaKtDt9V5gGeu0eqVlNiYkUvGNwDSYcMh4WXGl/MF8UkTqx7rzXqMCv4bCvE/NFTzzxVygWCgMbLE+oZN6NjnJ+U5hxEA8tE9Z3ZxRfttvWj0WKvgvyimYuPfqi5TVzNUC1BdDj2xOLcj4MBaJUjJzIE7eaS7h/RIyiA+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dyfOCQ6pnxE31DIN5vEz9auaQWWyqngyQuMljFzcdzI=;
 b=LeMuejd2aTdmqc9gnHKYjDrhvo/A1TxpPNOGXrambPJ2RkwgLQOO9ffiv/SmXrBhhJZK9tbqtd1ZnLgeyYn+WCSf1nJ677iFcD/ItNkVqV2m00+Fi1jaaxv3Kjtwqtec5TIx/h0dIru3+mjd7FiVhvbXSK1qiyXrY9zMbNDSeqoSUAwNbrMNeRhcy0rcy0P1ezesvzsJKPAa1REsIwqfp72O/ESh821fBvFOHkf9MQPV02W/gCJv0ZQ0mNQEFJe6nRSk2fUwsfaLrzL6ry5/P1dArGyVviTMjCXAFs4nJDUdToKp+kNBD7gKO9YuwpPsN2+S7RxUcwLnLsA6RFZ/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyfOCQ6pnxE31DIN5vEz9auaQWWyqngyQuMljFzcdzI=;
 b=wtczPSlB4jB8LBGtrwNOVq5yr2AoesVK2l64Jm8Via1KHYYZF6/kgoQ3L9hJ/4UDQm+X1vT9rn8oSPYIRxi28JN3sCUCbE3ro4eTNkYaOHbyQdXoV8MlTFRAkp1Fbicsji/yshNI0Se8xIFuOW84Mx3Jp77/MTObCQeLrRAgP3I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1662.eurprd08.prod.outlook.com (2603:10a6:800:52::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 11:44:22 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 11:44:22 +0000
Subject: Re: [PATCH for-6.2 v3 07/12] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-8-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <07fb0ea4-5bd4-255e-2eea-6cb8c1181b43@virtuozzo.com>
Date: Wed, 1 Sep 2021 14:44:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-8-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::25) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 11:44:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d088ceba-3560-4254-6329-08d96d3dd779
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1662:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1662C89DE5B73FA063B722B4C1CD9@VI1PR0801MB1662.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I7pqDVllGdzzubwNxSH/Bj1WrKGRJpDVlT5mS5k76pHN5G3JugnxpkciZFsBfLmcF5bXzPU7ggjy1xtqj+E+TRE8+OqlQ/HOvkl/Co7cEVMqFb7oykNVXpaV9ANldb2HxSQ1oWBsEWLPS20gx8Ifc7U8U3Alf7lMU/xYvKqIHf/OFnh+bj7YCFzah6V4wzZkqbHe/1ylhOd5p6UoiyJKLTKGdBmSVH9wwiH6pCZrv3hnpLF3A/AwxQGHJlm0RIAu0ujRZSYru/8HsatSHX21/Y9qL8TE7eNdmtPsHvxiUAg9nKPupGTP/hHdeVpI5P+D7YQnWJyN6Jp1LA6TxKn3Z0SQbxCgDvcwOR9tg2UzdCTWtE/XovtrEkklooDt+IvuDlvSkp46yr5ROzSYm6DlhH18QYHoEFaX0GpyIFOiu+pXhjTabG/RylsERITyoyiwxQqa6v8X0xLCZsD5id6qeEA0DV6qZe8zGFvLVnUa5W8lRpPM7aFp/kEaCKl9DTHNLyxKdw5mRQXXV9dQ6mfu4g/NeY4LSmIEc3RG+KWvVO5lYhm+hridpTucDcKttBOkN3ppwweLOJGpWyYVXZJgzT27zCx9y42obtmdDqld0qkzL4I+SDo7taZYwG1nSSgDtcTWYtHXXpf4RjkjYCJNrQrvRhoBTZwu9ZwxVssbwFwiKdyVdFzwrceq9yLr4IGN2oxaydpPoU/Ctjs/Q/UNgZJWNvRuGDYp674lPRif0uQfaZotAXthdFSCpO0B7zbEzP10/xQGf1ja09lCCCBzJFnaFTdNX06By0/Rixtkips+B5oXiVHN4uzj1ZiF2a7fpepmFM/3U5XU6NrNA9zMgU6KjuuxmnTzynXKmFVsXhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39840400004)(66476007)(66556008)(8936002)(83380400001)(16576012)(4326008)(2906002)(316002)(478600001)(31686004)(66946007)(5660300002)(38350700002)(38100700002)(6486002)(2616005)(36756003)(86362001)(8676002)(956004)(186003)(26005)(52116002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bml4VlQ4c1BPOWwxQ1RpeTAwY0Rjam1VQmsvUUxxakV5bnE1OVVzZzlzN25E?=
 =?utf-8?B?SzI4NU5VZ0hpMzMyQXBqVVg1Zy8yUm92NVY0U1Z6RnhkVlVOai9JZ3ROZ2FO?=
 =?utf-8?B?Y3VmTm44TUVwTG1zTHpKVGhwZGVGMTFxZ1h4NTU5NWFwSHBpenM2bnpobVVx?=
 =?utf-8?B?cGpGNVoyb2ZUTnljOEJZanNLZlZxdUVyaGtLZzFJZnNjQ1lvOXhtRDBHdy8v?=
 =?utf-8?B?Z0FUVWU5bWU2Q1laMkxCUnVPRU9HVXhOcDZpU0hKUjZ2Z0E3NW9YeWJvRW9L?=
 =?utf-8?B?clg5N0dURkIzTS9udUo5Syswb1V5eEkxUkgzdnBHaHRUd2gyVmI3L0FIcmQ5?=
 =?utf-8?B?QVM5OFRnNWg4Y1d3YmZqN0grSXpxVHhIdlYzR0oydWxoc0pGREh4SHF3b282?=
 =?utf-8?B?SUpNQk1xemc5a1JOU3B1WFpRdy96Q3dwVnJzNThzV2RGTHZrRU53TldFaTUv?=
 =?utf-8?B?RHFCRUgyYnZjMVlRZzcwRjhlbkRnV3kycGFGVWJHT000b1dUb0lKOXkvVDN5?=
 =?utf-8?B?WjNXdXBBYkFxbTBEeGo5aldJcUQwTzR4WUo3MmVETjNVaFNjT2xQY2J2RUo1?=
 =?utf-8?B?ZEVxckJmeUViOW1US016ZFh2djB4aUIzRU1wd1gwaXNhdlM4R2FVSmg4QlQr?=
 =?utf-8?B?dEZWTE95cktsSEdyTllPZHJkKzdkeWx5ZmhvY2hSRklERW1yUStVc1JFT3Mz?=
 =?utf-8?B?MDlzLzlGVHU5VG9SVkJwZjhOVVlVbW02YlVNcEY4U0hZNHRRVHlHTlRDb0h4?=
 =?utf-8?B?Nk9nTTBTU09ldFNQMnBSQTdheG14RDV0aDM3WXczdjkwTW52YnZzOVMwckNV?=
 =?utf-8?B?NG8yY3VJTHREYTR3allJWU8vQXp0cWdnQUdKRENnVjc1RWZKNjZPUkU2bjBr?=
 =?utf-8?B?dDZ1eVljY1FnMFIwd2REOVA2cmhQdDYyNCtqanpSN2xLMzNSRXZWbGJNajZY?=
 =?utf-8?B?aDNJZDFLSXpSb0ttdXR4VjFOL1lvandDRlN4T2JDRmpxcUhWNEp6dXJMemxL?=
 =?utf-8?B?aDRzcVF2M2NUK2RBMmxKaWdGNlgzb3NHdG16czdnNjNsbFRBbHFMMDBqdkx1?=
 =?utf-8?B?Y1haTEI1UzY4bmxxR1hNNm1PNlZvZzNtaVQrclNMVzNmcGRTMnF0SlpNZzF0?=
 =?utf-8?B?WUdGVlMvMUpYMUdERk1kVWh3T1Y3UjVyYXVmdmpOYzl5L1FPZmlYdmpJOFNZ?=
 =?utf-8?B?Z0FzcVFZZXpwQVFRY0orYlZRRUtxSk4vL21ESk5VOXVtVDZXK2YxQzJhK0Vz?=
 =?utf-8?B?VFpXd25jL2c5M09zb2xieFMwTkxnOUhVaXRCZXlOWUROcFVkUGdaUmNwWjBI?=
 =?utf-8?B?TGtTZm10dDZvSVFJSlFJUEhWOXN0amo1UEdLd0pZemlsNllINHVWcjNranVq?=
 =?utf-8?B?eVFjSVRSTUR6N281aktoWFZxUHdyTUI3TFVFZzRETFcxdDVUMnp3NXhoZjBn?=
 =?utf-8?B?RzBJL3h5NTcyeVpFcGhaMVBNNnBKZG1uMm8vdmMyUjhuUzhWcVhxa0VLZ3VU?=
 =?utf-8?B?VEE5QzJQVFFXMDlHcE85cFByN0gza0dhSmRuNjFTcGgwSndyVlJQWXZRL2Zh?=
 =?utf-8?B?VnpTSWpJVmFXTWY5VDVFSlRIMkFiTlJyb2sydFIzV0piVW9GaXVSQ1h5aUFW?=
 =?utf-8?B?THlKRnZ0TXI3dzgycU9OeTY1MkVCNXJwYjlxRGV6a1VoRUo3MmFpRXdmL2ND?=
 =?utf-8?B?bWlqbDFCKytDdll6L2pMVG9TS2orZzlSS09BTGpBT1hjdy9jRHh4cGxDNUxF?=
 =?utf-8?Q?4OkX7Zulmfac6hgfFbLXdr3lNNAoGbjy1bHDEHk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d088ceba-3560-4254-6329-08d96d3dd779
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:44:22.7673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk9Q4elq8l8m5v0DwwVrpZ+TRyL+XuLFXwMqNFXAH+6v5oWS44N0jC+1qt/VV+4dI+O4i23m6rH8Yq9BX5FBbodSqzuJFJMaOpy/u8nlJD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1662
Received-SPF: pass client-ip=40.107.8.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> Most callers of job_is_cancelled() actually want to know whether the job
> is on its way to immediate termination.  For example, we refuse to pause
> jobs that are cancelled; but this only makes sense for jobs that are
> really actually cancelled.
> 
> A mirror job that is cancelled during READY with force=false should
> absolutely be allowed to pause.  This "cancellation" (which is actually
> a kind of completion) may take an indefinite amount of time, and so
> should behave like any job during normal operation.  For example, with
> on-target-error=stop, the job should stop on write errors.  (In
> contrast, force-cancelled jobs should not get write errors, as they
> should just terminate and not do further I/O.)
> 
> Therefore, redefine job_is_cancelled() to only return true for jobs that
> are force-cancelled (which as of HEAD^ means any job that interprets the
> cancellation request as a request for immediate termination), and add
> job_cancel_requested() as the general variant, which returns true for
> any jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Finally, here is a justification for how different job_is_cancelled()
> invocations are treated by this patch:
> 
> - block/mirror.c (mirror_run()):
>    - The first invocation is a while loop that should loop until the job
>      has been cancelled or scheduled for completion.  What kind of cancel
>      does not matter, only the fact that the job is supposed to end.
> 
>    - The second invocation wants to know whether the job has been
>      soft-cancelled.  Calling job_cancel_requested() is a bit too broad,
>      but if the job were force-cancelled, we should leave the main loop
>      as soon as possible anyway, so this should not matter here.
> 
>    - The last two invocations already check force_cancel, so they should
>      continue to use job_is_cancelled().
> 
> - block/backup.c, block/commit.c, block/stream.c, anything in tests/:
>    These jobs know only force-cancel, so there is no difference between
>    job_is_cancelled() and job_cancel_requested().  We can continue using
>    job_is_cancelled().
> 
> - job.c:
>    - job_pause_point(), job_yield(), job_sleep_ns(): Only force-cancelled
>      jobs should be prevented from being paused.  Continue using job_is_cancelled().
> 
>    - job_update_rc(), job_finalize_single(), job_finish_sync(): These
>      functions are all called after the job has left its main loop.  The
>      mirror job (the only job that can be soft-cancelled) will clear
>      .cancelled before leaving the main loop if it has been
>      soft-cancelled.  Therefore, these functions will observe .cancelled
>      to be true only if the job has been force-cancelled.  We can
>      continue to use job_is_cancelled().
>      (Furthermore, conceptually, a soft-cancelled mirror job should not
>      report to have been cancelled.  It should report completion (see
>      also the block-job-cancel QAPI documentation).  Therefore, it makes
>      sense for these functions not to distinguish between a
>      soft-cancelled mirror job and a job that has completed as normal.)
> 
>    - job_completed_txn_abort(): All jobs other than @job have been
>      force-cancelled.  job_is_cancelled() must be true for them.
>      Regarding @job itself: job_completed_txn_abort() is mostly called
>      when the job's return value is not 0.  A soft-cancelled mirror has a
>      return value of 0, and so will not end up here then.
>      However, job_cancel() invokes job_completed_txn_abort() if the job
>      has been deferred to the main loop, which is mostly the case for
>      completed jobs (which skip the assertion), but not for sure.
>      To be safe, use job_cancel_requested() in this assertion.
> 
>    - job_complete(): This is function eventually invoked by the user
>      (through qmp_block_job_complete() or qmp_job_complete(), or
>      job_complete_sync(), which comes from qemu-img).  The intention here
>      is to prevent a user from invoking job-complete after the job has
>      been cancelled.  This should also apply to soft cancelling: After a
>      mirror job has been soft-cancelled, the user should not be able to
>      decide otherwise and have it complete as normal (i.e. pivoting to
>      the target).
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

