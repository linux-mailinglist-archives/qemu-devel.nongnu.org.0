Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE9424F55
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:35:51 +0200 (CEST)
Received: from localhost ([::1]:52278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOsY-0007JI-Rm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOqY-000509-Qk; Thu, 07 Oct 2021 04:33:46 -0400
Received: from mail-eopbgr70133.outbound.protection.outlook.com
 ([40.107.7.133]:25255 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOqW-00061R-GT; Thu, 07 Oct 2021 04:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNTG8H4KdOy4RwRV6tpbMSE346z9csB6KbT8AILacQuEo/9+aykZeiyjG0yIj6bwd5MzTa68xbSVJGZe4H7kQnZ+I0Zqzs7j3S7IgpIJXnmk/TvvmqnuKBb8Obt+FPRIof2jcgqb+3J2KNBu+L38PQSb1haK1trE69Cjiio8MOgNlBTsoHIe3UsRPxdzDt6n5VlVgCIpntTy9VIIbli6Fraf0UPvFYHsohfROwfQ4WsxyMqWd5dt+dS3qjv/pduxkQWlOAwZpBxCQUMogazYxYFpFwnPHAO54rJ/9P9ogZsn9i9GJ+pCQ4k4rsCbWC5rURxXCRkU/yA+ezaepsbzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3ZYTwspJj5M+qLkI1Wr1Ki6ZX0hDn4gqsycuMQE+A=;
 b=I70BUtkRTrg9kwNYLiqLz/d5w8w5ZFTPyie08CL5ay6jGFOPtOtOQ88RUJuRAuWyl0QDfx3+x5wCun3Ebf8DOOkKesEDOW8PmwWGHOTEzA0DMyJJ3uLPyLSq61isMXgGuDOzZLfnkBBKYNNZs1Cy1CVVcKILTaUgVpdcFpYWG8otznHgQ0mr5OOoRHRRnWoeN64Sv/e+omL6XhCGTxpJ2EwbUKy1V3fQPx7qHPsgz3AYRSwHcP31c3/xnxgOLLXfXKnlACdFZCviD5jyX0JZc2NOH9b3Am0mJcArJ0wB8Pr6yBq9kyTA22Ikwb1lM1LdPfTF9+NfcwVWmCEC51xQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ3ZYTwspJj5M+qLkI1Wr1Ki6ZX0hDn4gqsycuMQE+A=;
 b=Cgt0TttqdWOC2Umn4imTAM67XurTMvor6ngWftG4p8fAvcilj26CFGDZ/yGSqmqah8gW3WmVS84tHsYGE9aYnK2lkoWh3kjH8JlIwDDBPAgFqmJA4LuVe1X54K7D4ByycLOFB5Rqcj0MxLIFYxym+eGGibMy5xfQ9OUOUP/1E8I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:33:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:33:41 +0000
Message-ID: <93faad77-fb15-99ec-a6ed-b0c6bdf3d1f1@virtuozzo.com>
Date: Thu, 7 Oct 2021 11:33:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 08/13] job: Add job_cancel_requested()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
 <20211006151940.214590-9-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211006151940.214590-9-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0076.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.207) by
 AM6P194CA0076.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 08:33:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb12bc2-2e15-47d0-6948-08d9896d2ad6
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5495662E08AF4A25A6C7F75FC1B19@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBUsOfNcwVgAY8e/w4vGKtuJ/rVaJORZwWF9ZmwLUJbP7d4j7059fqHgCJl3ze542Ew3oGXt9KNdTWuY1l2FhTTEKPmHCGZLdLQ9ZKTv+ijfvWa4tygt4KQl0lkR3wstZdO7CNQtFfGHZAa7OhzuJTqA4mT5arXK5jAwLw8hgXI623YENQKPX7fVAL6m9htSCh9LLMJeAMo6EPEQzgGSVk9TVjVb0zrU/7ZFpd/ERRS6TIZruut1QjzNzr4tiP/mEdbbltW+dQPPw1kaFEAP2tCq3yQlAOKjpIOnPpFzzJq/qOyRAzyPFFp7v0sbDrK//Anw44/NNNSCnI0KCDeat6552DX7pJMM4DcFMbcgnZRnLtHbp8IIbtSfcESv6T3Kyxl5Zfe6RLL7O6KYVUfOx0/sPNFYfTuCrTyhsLTptRy/ObIiHLNfEj4X88bb1xMjnWHm2AvaELS3cFv0wh5F04rNJEir1t5XfqztaYkggxIJVqVoJAqerXtO03IY6Vy3RdasnK4jj53aFXxZu14iKSFWOmei55foUsH5VI6wyoSsM3/2R51jkKMX4gmOiQneIaCIbmvcirPucNWPvxdYP0caavAOsuK2d8NmuLRicd3+cYQ/h9uXG+0aboXnUAEAtgEbvG2fCfF9V2+HK46AiODY8mR7HfCcLBdxykb18S+hyR5nCwLK4AcI8o6DxtmJX/R4EW887QsmxO8YgwhYRVswm6AtiPKYmp96JLu/PiVhPae4yac3KX4S8ktOFABb/E3icAekCgEMLb7JETOpVtW96I/hs2m57cYEEDxtr8AwOqz0Hdi9xT0rHZSC0kEEi2lBQuSFw+omBXVRRpyYL3OCTo0ciIueoCi+7bxfNMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2616005)(66476007)(66556008)(6486002)(186003)(31686004)(54906003)(956004)(86362001)(16576012)(8676002)(2906002)(36756003)(316002)(508600001)(8936002)(26005)(38100700002)(52116002)(31696002)(83380400001)(5660300002)(38350700002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkluUGdxUlR5bCs1NlBGYW1nRTdCUDJUbnBEeWRxS1dzR3NiQ1FFK1Ewcnpy?=
 =?utf-8?B?WXRobHJ1bm1udFB3T0FtTFErdVYvZ3pNUjUwcEtJbTBoQmM3TmRLYTgyUEpF?=
 =?utf-8?B?cVF3eVp0YW13bHhmdWtrakU0dWZCZ2RtelRKWDNlRndLZUZSRkR4emFweExw?=
 =?utf-8?B?cWpMdWk5UUxURDRtU1pwR0pXd0NFelRwWkphTlIwaFRXUVMrR2djVGEvdTJp?=
 =?utf-8?B?NkNZQXZ6dGRiclE4TzlpNGhmbVkycVhYMEFHYVREem1RdnJNTlhCWktUZEFN?=
 =?utf-8?B?bkN5OG5KUUVabVVyOFJzN0tPMGVaVVk1ZFpFd0VGTVhBTDdRajlISGc4c2xR?=
 =?utf-8?B?cFBYUlpzSWlvVUVKejFJYnBZTmoydGh6cEV6TGVlZU1IS0ROTnltLzNnYXVM?=
 =?utf-8?B?VzlBdTNaSmNJSEdjald3eGRPaCtBNTVWMFFjOVkxY00zSWw5eGtVa2EvZ0ps?=
 =?utf-8?B?ckJKM1NsT1ozNWhzZmdSTUNwWGNrYWxzM0pYcVRHUVNsbTEvdDBsdTh5Y0NS?=
 =?utf-8?B?emt5dXRHQUpJRnRNSEUxQms4NlRtQjYwYmhYdDFiemh4OVdVSG5wbys4eHFh?=
 =?utf-8?B?YXFVSkZXQ0JoRitkc3NlUm16YldvMjJiZitEeld1SVpmWDlwTEhBb1RnVlo3?=
 =?utf-8?B?M05VL1MwcEY1QUkzSTVDNWdsbmlOcXJZekRqa2x6WkMwUEkxMWtLb1hlZURo?=
 =?utf-8?B?aTlYMk5UQUZJaHVjaGJjZitXaklVelVKcHA2bzZUNzNxZ3d5ZVRqL1RNb0gz?=
 =?utf-8?B?OTZFVmtLb25zb3V6aUV4WlhmTWQyemNCdHREaGRDUC9Fb05Fa0JmUURWWStQ?=
 =?utf-8?B?N2FKRXdkcTh3Q3hvQVArdW1Dc0w5bnRhZFZxdnlzSE5yR1JmbG9yQkVIM1I2?=
 =?utf-8?B?RFZOTVlkMXVPV202U2VzQ3YrRjRXd2NQZWtLeEIxMnZrZnBKTTA3OVY3d213?=
 =?utf-8?B?TEZxcDdvU2l6alFOeU9EMHlzZ004NWE3ZHViaml2VWwvTDh5NFJOZlRyamMx?=
 =?utf-8?B?NVJyWVl0VTJhaklpUFMweFhMVFQ4TTlKYnBaWVNZMFdNZ0RuWjNSa3hKT0lw?=
 =?utf-8?B?Y1Zsbkh2QW5RUnkyZTlNWnUwSmJZcm1vL0w5YklJb0xNemkrMDBzdWp0UGF1?=
 =?utf-8?B?bTNHd3Y2WnlaQWIybFA2Z21JZ0RwR3Erb2YxVm5EbmdLdlhrcEZrN1FuM0RX?=
 =?utf-8?B?S0RTQWJBRUs2NFZnbXZBZ1Rhc1RGQ0F6ODhYaCtHMHBsSXFtQ0hzak4zUENv?=
 =?utf-8?B?SWNwcEJQbURBV1pUTFRma2VzUlRNQ2s2ekNZdUp0cG9XY0dpWUk2dzZFVSth?=
 =?utf-8?B?ZHNNUkJlendoU0RhMCt0Z29EZUh5SDFQeXIyWGU5K1paRm8xendHQVVmSDRH?=
 =?utf-8?B?ZEVXR2dyZURsZ1dSNDNoRzEyUDFsNVNOYWpaNWU5QmZpTXZma2s2YzYxa2kz?=
 =?utf-8?B?N0xKSmYyUlpaY0tUWnEvaEFxMWlIUWNqdjVwbm04V3ZCQ1VQeGZVYmUzdXdH?=
 =?utf-8?B?aHM4SW1ublpCNHIvckV0VzdyeGNUdW93dG9vSlh3ZFRIejFndUpwWXUwQ0l2?=
 =?utf-8?B?TVJORXJieml6TXJMMjNJNk1lTExEMkxPZzY2Mlg0dmlaQkQ4WUlmcklFQU51?=
 =?utf-8?B?NDFtLzhTY0xYai9EcUlDS1RkYUIva3RrTGpLN0pGVEpwbXZTYlFUZVBjcEFr?=
 =?utf-8?B?aVhDOXhYWmFQcFovNS8xNWVGaEk3TWpWRU45c3gwcW5MYTBuNWdDMWlLMlZj?=
 =?utf-8?Q?qTVOyOKDr+ScR9bB9LP5WetatRdLqwaknAtCIJg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb12bc2-2e15-47d0-6948-08d9896d2ad6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:33:41.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/J3CFDYtbEXRjVna5ajMq62qhRKuRJt9Jvr+ZNiAMRGl+oW5yIwNan0GJdfhzb3R76Y8Hck1MUJGcE89AQX0BmkwSWM4NIc6e0aVE337cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.7.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_NONE=-0.0001,
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

10/6/21 18:19, Hanna Reitz wrote:
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
>    - job_cancel(): Both functions are equivalent (see comment there), but
>      we want to use job_is_cancelled(), because this shows that we call
>      job_completed_txn_abort() only for force-cancelled jobs.  (As
>      explained for job_update_rc(), soft-cancelled jobs should be treated
>      as if they have completed as normal.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>



Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

