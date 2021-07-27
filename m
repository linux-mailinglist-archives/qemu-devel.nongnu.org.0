Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6D3D7A28
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:49:02 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PKH-0007hn-KT
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8PIu-00060B-9p; Tue, 27 Jul 2021 11:47:36 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:48551 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8PIq-0002XC-PV; Tue, 27 Jul 2021 11:47:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmsme5QVOqU7XiG8q9CeR81NX0f+keamhBRD20cFQdxUT7d7zyDwJQrYAv7dMVz7IFdCLMW9l32AFfny719RW4Mo84Wo/rXT9eJSGbDwxdv8xna22jpRpupADj1mgnt7HlWUJdXQkv79JjgokCPZ32GTF9NiMhNrWJriZNjWq6oQhpk6lAKAObW/spHLem+MDArYpZf3YZ+6TlgF8r2SDWdRbbQcCsL9EyJVEqTyGRScSuDAcwhZCP3wVo7QJAdYstIXy3hkT9GTNBo3C7LbbKjXvxPMRNhy4xQGmve+erKOb0nGTwbNKTpZjYVjy+UZT6YvbcZdLHKqy3mPfuFLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhwumRfS7NwqN8OLZByUi7MCq41aLVEcKigY0Iww8V8=;
 b=I2Z5AVi5BqGf2biokxh5jJU3BjBOsxOZP2V4+BxNPnE2TuXbSgviDUBHxFIu0JhxOXHyKippbuxd+eTtP9GES4Lhd0XIY+OPn1OnkPvuSXHysMR/KOChSUpHSwjO8NuwejYGWQUk/bIjjOa2zPrRaaiTjxmKoTzVO2Y84L0oxSAE0eT7xpRa8GbdzZpDwFs7+uWdnj4oV9cn2x9kzLmyd44wHIy4SGHwZfLwEqbQCmIgYRk7drdTg4Uutdo0feJVMJlYIe5kz4xdYg4fGEwkHHQaIf83jpFVsfkhQM/jPZK7L5T4P8dr/6oidcam4LExJdowtUdimoZgW8/YADZLXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhwumRfS7NwqN8OLZByUi7MCq41aLVEcKigY0Iww8V8=;
 b=pL+rw1wuSTaxnh/WDf4qnOqYkjL6Of8mBEwE0bqIBSHCwr8JWa34+Q3Qo224mBI2x9Wj74xcc8yyzZn2Sd+8INXi8fEtTO3RHUpU/R99yNY5cMSxLMuQWtOceEx8UyfsB5o2b4psWwxEwuh68Jc8BvoUxyClBo7FqhvPZ0pxaQ0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 15:47:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 15:47:28 +0000
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
 <e8042bf7-713d-26d7-1ba1-502bb566db1f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <79105dcc-eaa3-086b-34ed-b66eef584a3b@virtuozzo.com>
Date: Tue, 27 Jul 2021 18:47:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <e8042bf7-713d-26d7-1ba1-502bb566db1f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Tue, 27 Jul 2021 15:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4995f921-f176-4bd2-7ea0-08d95115d676
X-MS-TrafficTypeDiagnostic: AS8PR08MB6423:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6423E7222D102420C0D3AD0DC1E99@AS8PR08MB6423.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfZWMiyGdMwQOzhiAMZKCMdeKV280qeMdXcMn1NbZ2PPzECqMAQnpmA/1obvXoxwmrMZAfmdBxg8a6MbQtTU2gzdXHl2Qy/iL4xgyTJkVM4BojkC3iovKILZ7OblyELdWoS/ppsol++Px6o2r6gm2m+1k8jwx5/cDpaXgf+O8upq+2V8VN5LlI+Husel9YNhNwtjukIwQkrGqo+AZa6IZKGEMhPfonV8tnkUzsS3NSK1oaIJxfFs3tAEA8R6SweX/4ib6fdsv2U6tpIjCnI0NDrBPnIEjJs7tJniXkjErDeNwbPVVTIIS7S5ideFmVmTNcd9jKMewzGeCQsnBlcz6PIZprD2GFJHqmsEQGtx55JmYIPS2+yDH4HtNAy1L5RlJCIn+Ajg3vlSYFxlu4JvFdOBiBoSPw5E9XMk5HwNs5hxeFSoygr/5yCVHZ+Cweew1LfNpqIotlAHDt0SEeb8mJ9PVlfgcaNwyixjt++WF2g0GwRrohZXxamriUtG+yEdUDTFDYATTGtjdDMCV6MwdEJMshRLFOdW4Gv613uofyivD1A44Czyk8sbLwAN8w1Geb/sa4tFrgnUBZzFEQM7pPD5nYO8B8T8ExVYpxi82T97o5M89cRTp55RcWK/SiYNJM6FwvXArOoCrBkRvUmGjF8zddK/Ai4YyuA7qSO9bLgir38XaHFTx0SF0EnmtHhPKwu4BLLFv3ttkMtHBr88FEPn5xFQOWbIXfcaxcMCQoGPQIbV8R+YKVny5fUTFnVQkiaoMP5VJWajp82QhEyR40qDvQbzusRH2WnXVYV5Ts1nSzzOBztRj28jd5y65TqmbHn0uI8lbJubvMecpjch9JnhZ+/8qda5CChrQKYMilk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39840400004)(396003)(2616005)(2906002)(478600001)(66556008)(31686004)(36756003)(53546011)(38350700002)(38100700002)(966005)(956004)(8936002)(66946007)(66476007)(186003)(52116002)(86362001)(4326008)(5660300002)(54906003)(8676002)(316002)(26005)(16576012)(31696002)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVQwa1ZyUHpJVUJWK1JRdk9LNVM3NjRjdXprTVFMdEMrVnBKS3B5VUUrTzFT?=
 =?utf-8?B?Yzh3cG80aUZnMmJyWjR6bTJLNVNWeDJhKzdMRmwxL0RNcEFZUVI4cXJOa1JU?=
 =?utf-8?B?cTVCcTh4MWhCMDNMcWlqZVdneEg4dWhJVVF4cVp3cFpzYUNXdDVhbHBTcUJZ?=
 =?utf-8?B?NjQ1UDM3d3B1SDlqRjJuMmtmNGdNZlV1ZnZ1ckRmcllvUVpSRU1SQ3dlWit0?=
 =?utf-8?B?RTZ2cEt3VHpLa2RDY2VLUE0yeW5mMGxpWUNpcFhNMmtxM01jcUhiT2tGQmo1?=
 =?utf-8?B?ME5jeW5pV3Vrc0Nkbmh4bkZMWDVHc0NFUkR2NDYwbHhHbit6UHNHYjdMS3gz?=
 =?utf-8?B?M20rVUtQYXVDSHU2QkdVeVpJRzUyZDdqd2JzR2xhMFUyUTZMMUtrRUZmUjc3?=
 =?utf-8?B?L1VqclQwLzhPWTZjMmN1VjJ4K2ViVlp3LzBkSHp1UGQ0c01sS1NoLzlsTUxF?=
 =?utf-8?B?bk5ETzltWW85WmxYcVZ3K2xmeTdBbGYrUnlKK0ExR2JESU5nNGM5eGVZZW4v?=
 =?utf-8?B?Umg2aUVZa2l1L0FqdnJENnRnNzhzVTk4cGowb0RJZHg0Z3VnVDMrOXBqcVds?=
 =?utf-8?B?QUIvWERGZWFjb0FQQjloM1RhY2VvVWRDUzFFeHhSdHNsZ01Hc0ZHbnljZEhO?=
 =?utf-8?B?TU5BMGxld3YwWVV5ZStMdTlpQnpBZHJ3dlRTYTVKbkpaRlFpdVdXenNWUmMy?=
 =?utf-8?B?Q3Z0R3JFR2tNNVRCRmlwcnB2aWs0T3lQLzB0MzNORW5BbmxadldWdEJSdDk0?=
 =?utf-8?B?Nm5BUmpwREpoLzFGaVZXcGhKYWNQSEJJT0RJS0RyRG4wTUUxb3VNODdvaFU4?=
 =?utf-8?B?bzlTMVViU0VYdkZHSnBZajVLbkkreEhibmhXZm85Y3ZRREIwQzRXMjNVazRP?=
 =?utf-8?B?VWZmSDZ2dUh0TWxLSjRoaFRidVZMbVl5Z3R4U2VZdXgway9yWEJ2VkQ3aVd4?=
 =?utf-8?B?NVg5VitRa1gwNWQ3UG1GSGNYckpWc3NQVC81Zi93YUxhY05kOXZFSVZYQkxn?=
 =?utf-8?B?MW5sWjg1eC9iK2RVQVMxQW04cnNwYklOVWVBTUw5RURteG1VY05wcGk5cll3?=
 =?utf-8?B?Q3V4RE8wQWxnSVhMdFVmOXR0Q1paM0duLzBieEkrME1oV3VzZHlGYjZRanlH?=
 =?utf-8?B?cjdLWm1XbEh4a1ZMejRLeGlKSHhDTndsdnMxL000RDVUSW1HVzF6TTc2YnUw?=
 =?utf-8?B?RjliM2c0MDh1N1ZhRmQxTFlHK0dzeW83Sm5LZkZwaDNZTTNHRGdXdXY2R0FD?=
 =?utf-8?B?YnhBaERsajZrdWhWeDRKM2N4NzNQNGZpc01LaEtIeVRXcWdKaGljekVUOHpC?=
 =?utf-8?B?R2pqbjlTTmI4UHMrTnBCcGVFdHVOejUyakMwbnJoN3BTRGhvNXlGWk1jTnRF?=
 =?utf-8?B?WnpmVXhXSjFhWEwyWDhaZEdUMXZ5TTNISklnU1JpZk9CK3JCWCtBMlFxZ1FH?=
 =?utf-8?B?WkFYT25qRE5GVmtxK3ZzMndrVFc3bXZxZkdMenV1RkRsd0lZbmkzSWFWRUdn?=
 =?utf-8?B?cy9BUE56eEdIbk5sbjhxTThtbXZxdXhyWlI0T05hcnRSTGlobVNKOEhwZW5D?=
 =?utf-8?B?dmZ1WlFVR1RqWFcwMDVTMG40SDVUUzRxUDkzK01xa2JUVnhDWlpyS3RndEYr?=
 =?utf-8?B?ajRweWxDZ2NJZjQ1UFpCcnRHYWUvd200U3ZrYlRYQTFzVVJTdzFGaEh3c1hT?=
 =?utf-8?B?MklPd1hCdmpRRzg5VzBWRkZHeWZoaE1nYllBREl0aWh6ZnFrWXB2TytkYjND?=
 =?utf-8?Q?CsDW+J89NCuZOPaHQ3h7vyNPeOOoPTsqdsl3eG+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4995f921-f176-4bd2-7ea0-08d95115d676
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 15:47:28.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtZCCDLNmpChDKRo2cHar52ghFuI+Izkxqw9tbx/bNvodrzAHQLP7aUkRmuRMwttyi/YFQf7ur0ARsUzCn8gAEZ4NRetBI8n/10SMp9umOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

27.07.2021 18:39, Max Reitz wrote:
> On 27.07.21 15:04, Vladimir Sementsov-Ogievskiy wrote:
>> 26.07.2021 17:46, Max Reitz wrote:
>>> Most callers of job_is_cancelled() actually want to know whether the job
>>> is on its way to immediate termination.  For example, we refuse to pause
>>> jobs that are cancelled; but this only makes sense for jobs that are
>>> really actually cancelled.
>>>
>>> A mirror job that is cancelled during READY with force=false should
>>> absolutely be allowed to pause.  This "cancellation" (which is actually
>>> a kind of completion) may take an indefinite amount of time, and so
>>> should behave like any job during normal operation.  For example, with
>>> on-target-error=stop, the job should stop on write errors.  (In
>>> contrast, force-cancelled jobs should not get write errors, as they
>>> should just terminate and not do further I/O.)
>>>
>>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>>> are force-cancelled (which as of HEAD^ means any job that interprets the
>>> cancellation request as a request for immediate termination), and add
>>> job_cancel_request() as the general variant, which returns true for any
>>
>> job_cancel_requested()
>>
>>> jobs which have been requested to be cancelled, whether it be
>>> immediately or after an arbitrarily long completion phase.
>>>
>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   include/qemu/job.h |  8 +++++++-
>>>   block/mirror.c     | 10 ++++------
>>>   job.c              |  7 ++++++-
>>>   3 files changed, 17 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>> index 8aa90f7395..032edf3c5f 100644
>>> --- a/include/qemu/job.h
>>> +++ b/include/qemu/job.h
>>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>>   /** Returns true if the job should not be visible to the management layer. */
>>>   bool job_is_internal(Job *job);
>>>   -/** Returns whether the job is scheduled for cancellation. */
>>> +/** Returns whether the job is being cancelled. */
>>>   bool job_is_cancelled(Job *job);
>>>   +/**
>>> + * Returns whether the job is scheduled for cancellation (at an
>>> + * indefinite point).
>>> + */
>>> +bool job_cancel_requested(Job *job);
>>> +
>>>   /** Returns whether the job is in a completed state. */
>>>   bool job_is_completed(Job *job);
>>>   diff --git a/block/mirror.c b/block/mirror.c
>>> index e93631a9f6..72e02fa34e 100644
>>> --- a/block/mirror.c
>>> +++ b/block/mirror.c
>>> @@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>           /* Transition to the READY state and wait for complete. */
>>>           job_transition_to_ready(&s->common.job);
>>>           s->actively_synced = true;
>>> -        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
>>> +        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
>>>               job_yield(&s->common.job);
>>>           }
>>>           s->common.job.cancelled = false;
>>> @@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>               }
>>>                 should_complete = s->should_complete ||
>>> -                job_is_cancelled(&s->common.job);
>>> +                job_cancel_requested(&s->common.job);
>>>               cnt = bdrv_get_dirty_count(s->dirty_bitmap);
>>>           }
>>>   @@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>>>                                     delay_ns);
>>>           job_sleep_ns(&s->common.job, delay_ns);
>>> -        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
>>> +        if (job_is_cancelled(&s->common.job)) {
>>>               break;
>>>           }
>>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>>> @@ -1099,9 +1099,7 @@ immediate_exit:
>>>            * or it was cancelled prematurely so that we do not guarantee that
>>>            * the target is a copy of the source.
>>>            */
>>> -        assert(ret < 0 ||
>>> -               (s->common.job.force_cancel &&
>>> -                job_is_cancelled(&s->common.job)));
>>> +        assert(ret < 0 || job_is_cancelled(&s->common.job));
> 
> (As a note, I hope this does the job regarding your suggestions for patch 4. :))
> 
>>>           assert(need_drain);
>>>           mirror_wait_for_all_io(s);
>>>       }
>>> diff --git a/job.c b/job.c
>>> index e78d893a9c..dba17a680f 100644
>>> --- a/job.c
>>> +++ b/job.c
>>> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>>>   }
>>>     bool job_is_cancelled(Job *job)
>>> +{
>>> +    return job->cancelled && job->force_cancel;
>>
>> can job->cancelled be false when job->force_cancel is true ? I think not and worth an assertion here. Something like
>>
>> if (job->force_cancel) {
>>    assert(job->cancelled);
>>    return true;
>> }
>>
>> return false;
> 
> Sounds good, why not.
> 
>>
>>> +}
>>> +
>>> +bool job_cancel_requested(Job *job)
>>>   {
>>>       return job->cancelled;
>>>   }
>>> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>>>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>>>           return;
>>>       }
>>> -    if (job_is_cancelled(job) || !job->driver->complete) {
>>> +    if (job_cancel_requested(job) || !job->driver->complete) {
>>>           error_setg(errp, "The active block job '%s' cannot be completed",
>>>                      job->id);
>>>           return;
>>>
>>
>> I think it's a correct change, although there may be unexpected side-effects, it's hard to imagine all consequences of changing job_is_cancelled() semantics called in several places in job.c.

For example: so we now don't set -ECANCELED in job_update_rc for soft-cancel..

This mean that job_finalize_single() will call job_commit instead of job_abort, and job_commit may do some graph changes, which shouldn't happen for soft-cancel

> 
> Yeah.  Targeting 6.2, I don’t have a bad feeling about it, though.
> 
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Thanks for the review, by the way!
> 
> Max
> 


-- 
Best regards,
Vladimir

