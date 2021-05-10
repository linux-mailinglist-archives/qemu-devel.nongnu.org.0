Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0B379541
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 19:19:40 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg9ZD-0002QR-58
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 13:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg9XY-0001ig-7B; Mon, 10 May 2021 13:17:56 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:23118 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg9XU-0000uB-Ao; Mon, 10 May 2021 13:17:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esb8F++LltcqcvvQAXoJmeQet7+R0mJYO8zHQ0k3mG34Yk8YbxdDsVQ6003RszNbhXXiwPnxdmSJYtnpau3WWYjFmiQyEEZ7Lk/zk5sjS2fupV8yYFfL3pY3rUv5ijEbFv42+Bs6Q6T9An3NYg11OVcmsU1UutFqRqLDSSk/pYPrZyD61EoLD9w2TGcoi3ZpdF/ITS2LAosVTlzARcDCy020L8ERK1zdAJA/zaqZmNW6m5rowZWnbBdVWFGF8mYpc2Zd4PZA3pf9RK0tFF3GfP3RkpqCMB2LohjPQ0cMTK7E7Pytq9lWjTGn8xcNxdBy2PfDLxGIxLru0sICzByl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfW8PMr88dJtink4uheo6wVjvXfCFe9AQQH2VJ9TMb0=;
 b=H0YgTFqXNB+vwvLTqwQpBqNanXohNNSzryIACT7jWK9PiQ8K9o8pgzT3JS4BO/TqtYPTQviCWr6jE9rltlUkSE5fE6TQug0E19qHtnRBYSrBl+EIzXeSYqjl+D2JgTDIYlmqVRIUDeM4UQaqYxWmW00zVioXgqqETuFZ2cZWLb0EazdqNgElojyZLszoiSfqHJyo+jNGBmwmu90H/lVBDLCUkMFwnxS4v9CwJGD5EGFMGRLW6iMFg87XyRv0maenoo/Eb2QvJuM4iuiBEajsp+cpqZORzPlNQl4SZATFEcxcqSTXnBgR/rsT/QKLkW3e1w0xJmXNkHsaQNOWshuq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfW8PMr88dJtink4uheo6wVjvXfCFe9AQQH2VJ9TMb0=;
 b=atWG7pxszEnGnaj8qMZBJmseOtKzp8Cx2ijrA9iNx3OQsJ1Wyj7GAA+kzf7kOex7asfpoYRizUdm9nKpX0NXEjy+Oh3lx070XjTWL71L0xfk51TDxvBYThhJkcNzx3xuJ+XN6/uIfxksxLgN8y4QIMg8eEtacullC+9vMgnWoxg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3288.eurprd08.prod.outlook.com (2603:10a6:209:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 17:17:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 17:17:48 +0000
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
 <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
 <3d7d8bf6-a750-045a-0e47-5c496995e1c8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <47ca990e-5bd1-b446-3dd3-2956e9aa9111@virtuozzo.com>
Date: Mon, 10 May 2021 20:17:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <3d7d8bf6-a750-045a-0e47-5c496995e1c8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 17:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db922ea1-ca09-4f98-638f-08d913d788e5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3288:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3288654BEEB7CE4EDF4A3529C1549@AM6PR08MB3288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkB6s58YF3V/6J39iTCW0RVA83iO0AOULDt7Q0kIBS0vksdgey4zejKw4MIwxal6xKSJVFmm7GibJJldDY+JsCIbQEPhY6zFfMhapYp/3xguIsvSvwncoGiZHttvknqDjKMBcvAcMzqFa3hPcpUU3BXPXC5125oM4oBcJ/qsNEWpSzZfnFuR0HbcxNu3YLkZRyTzJ87sJV10PGm2B664MRLqWyXCfiODeMB0kwhfNssLE2wYX6cazC54j+dDc6gspsvE8P0XxYRn6G/hPykOZLaN/mfDW1osRy3zWj3ae0HAVkDjEA+3GYTT9n8a4+axSeFm2xqVIfevLFwchZubeaimOd7qblo2/VV1BxpcZKwgNKY0TzAsB6pq0sQNu48Y3w5OoC633UFCPWRmTzievy08qpVstdAqG0eCU4Z5JcUhdv3Kka/EWERXLsqi5vC6P7FGzHjHfJBZ2fbKCulgRkjGV2hnmQAKSfIUnlPiL+XetsPxv/Qemid18+SiNN0zn9mgvcB2Dg82/mmnfR7rOOCNhGdkGADf7NdlbvrIU7CbrJOuRjFk6pVL5e/PNEo6j+3URXlYcBqaaybuIpXzRWmOxTqeZXWHSRbeWofcXZZr3QTO5HYcSlbnYkc1qxPvt2LRC0qELB4fB11QipRJyLhmROKK3mI1ZxvahIz2SsZtqS05cZnrY8fisrB6wbMcy105yU72rJ4e0s23R7gxD/RIwjTPY/Q8w2G6KgOVeVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(38350700002)(2616005)(66946007)(956004)(8676002)(38100700002)(478600001)(8936002)(186003)(66556008)(31696002)(52116002)(16526019)(66476007)(54906003)(4326008)(5660300002)(53546011)(316002)(26005)(83380400001)(36756003)(16576012)(86362001)(31686004)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OW9Zd1hKbU96cVNuMkRUOWExR1dyc3l0eUEvVTRsOHcwOE9mRWdDb1ZRQ2ww?=
 =?utf-8?B?M2wreDNoR2l1WFR6WG01VlZzVytPeHRKRFhlVEVROTI5RWx3WGNWa3BmZW9L?=
 =?utf-8?B?bjRVenJGdDU4MGtIOUwrdUtMNSt6MURHTlhscEhac2ptSFczL05TUGI0dW9J?=
 =?utf-8?B?M0xWN2dJUUZYZ1FtekZHV05BR1ZDZ1VjNC9FVFlsTGFPSFNpVkgzZEZNVGo4?=
 =?utf-8?B?TU5jNG9IQzNEZG41aXRZUnF0SnB1RHVTczNYUnV1aHFsTXk5THFlck11ZGJG?=
 =?utf-8?B?eW1jZlJrcmcwZHU3VFF6NVd5ZlFlZEdmSUR0Q0NSR0xEQ3BHR1NURkV1cCtC?=
 =?utf-8?B?cGlZTlBNNVpoVHpGZ203OWhvcnZub1lqOHdSYWhIWVZBRXlWckV2OElDakxv?=
 =?utf-8?B?ZEkvNEZsMTFLcFVrb2kzRmhTeU5KUS9Zc21ROWhXdHYyQ29KYWY0bStWcEpr?=
 =?utf-8?B?aUtPTzllNlFvTEtJWnp1R2xOQ21jaURDMlpmUDBTcmNreVJaREtCM1VwNGZQ?=
 =?utf-8?B?MTVhYXNTZzlKa2ZYMmkxY2o0b3lxVnIycVZQS3JXbWdEVXZJbGtWU1d2OHRH?=
 =?utf-8?B?QW1XR2w2UWIxWGdlRTEzOC9ycG52czNPcnFmZlB1WThFelIzRVJCSmNqK3JE?=
 =?utf-8?B?eDNYRTFMeUd5Y2RIa1ZjNHVsNnJRRm9Sby83YVBqQmoydTBkT1pCaVViVlk3?=
 =?utf-8?B?Mkp4Ty81YjhSYTZGUUYvMHNFL25LRkhVMEIxQS9MblN0dUYxM1JORVhSZmd1?=
 =?utf-8?B?OUE5cWpEUmNNb0xlNldFaXlkZGpVbTl0OXdIcWZIbHdNeXJOMkNlTzg2Mzhm?=
 =?utf-8?B?NURid0k4Ny84Zk96bG5NUDk5VzZZWjJqeGhaVzlBNERTWUh6bG1TVjNPd0Iy?=
 =?utf-8?B?WCtmelppeFd3NUFIUUhNMDlxRHQvSGpqYi9PQ0I5WE1TSDdXS3k2K2tIcEtJ?=
 =?utf-8?B?MnpEeE8rQm9EYXAveHF3S0x2VjVBNlFOTjFDd3dGelUzUW1ELzJURjBubW5R?=
 =?utf-8?B?aU45QlJ2ZjdvdFNlbDZvalV6NlVzM3pNWjh1clBMSk9jMDNuUzVkcVdQd0tm?=
 =?utf-8?B?ck83VWQ4RW5lQVdsOXZtUkE1Rzh3SnJnSlE1cmZsd1l4cktJbXJPWkFKcVF1?=
 =?utf-8?B?cFhxbklwSlZQWEVKb29DVjRGRFhnMTZTSlFIbTFxM1VEMXE1SUYwUXBBVzJW?=
 =?utf-8?B?aDVLMHNEbDNyNm1IVFN6UFpPLy8yTkpCbUtXWUkyMW8vdDJnenE2Z05VMndH?=
 =?utf-8?B?RVRDV1JSb3NDWHd6NjIxS3h1c21YeDQzSE9DUDBaSUJNMVhUaFJBU3pHMWxq?=
 =?utf-8?B?UHFzNU03eEpCWFFwS3FZOHdYYWlJZ0JYaVM4OHZleHBpbUJIWm0wMDM3WXgz?=
 =?utf-8?B?Sm5DNWViazJSdytUc1l2UWg2RDQ0dXQ3Mi95TkRKZllneXFNZ2VsckZnQXRz?=
 =?utf-8?B?RXpDQ2pSa0s4ZGx3eWczVUE5NmY4K25iQWtZci9aL0JVMkZqK243Z0VDNS9K?=
 =?utf-8?B?Ky9OTTF5ZHMzYnRvdEZpbDNjOFg5bnBkV3k3MTZSckNjVlhzTUZzRlcrZkc4?=
 =?utf-8?B?SDYrRndmNTBrSHZzNFpJQkIyWWxmKzZpazdDcC9ycWdtNlNrUFpJeVFwZ1Ba?=
 =?utf-8?B?YXZsd2oyRnRkMW5QTDdrRk9HRzJRSEw5R3A4VVBkZGxYQ2RNTDVZeUhWOHJK?=
 =?utf-8?B?Zjh5SlZBZ3NKVGxWSXNPSFZES3pwVm1uTzFRdE91Y1J4M05UTlhLN01kemkv?=
 =?utf-8?Q?V/EDotubbX/FfEovNZVMwBOzr2B80af85qNXIUu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db922ea1-ca09-4f98-638f-08d913d788e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 17:17:48.6401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVGUxbpUR9YNCgkTI1O20QZU5G9ubBchoMlWT6jmo9ON/tcvJe1KO87ZoQ38TPS7p8DeV5GbTC6kEeoYSvQR0qRvePRQVLyyagZGLGx4f9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3288
Received-SPF: pass client-ip=40.107.20.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

10.05.2021 19:52, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 10/05/2021 13:28, Vladimir Sementsov-Ogievskiy wrote:
>> 10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
>>> Progressmeter is protected by the AioContext mutex, which
>>> is taken by the block jobs and their caller (like blockdev).
>>>
>>> We would like to remove the dependency of block layer code on the
>>> AioContext mutex, since most drivers and the core I/O code are already
>>> not relying on it.
>>>
>>> The simplest thing to do is to add a mutex to be able to provide
>>> an accurate snapshot of the progress values to the caller.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   blockjob.c                    | 33 +++++++++++++++++++++++++--------
>>
>> [..]
>>
>>> --- a/include/qemu/progress_meter.h
>>> +++ b/include/qemu/progress_meter.h
>>> @@ -27,6 +27,8 @@
>>>   #ifndef QEMU_PROGRESS_METER_H
>>>   #define QEMU_PROGRESS_METER_H
>>> +#include "qemu/lockable.h"
>>> +
>>>   typedef struct ProgressMeter {
>>>       /**
>>>        * Current progress. The unit is arbitrary as long as the ratio between
>>> @@ -37,21 +39,50 @@ typedef struct ProgressMeter {
>>>       /** Estimated current value at the completion of the process */
>>>       uint64_t total;
>>> +
>>> +    QemuMutex lock;
>>>   } ProgressMeter;
>>> +static inline void progress_init(ProgressMeter *pm)
>>> +{
>>> +    qemu_mutex_init(&pm->lock);
>>> +}
>>> +
>>> +static inline void progress_destroy(ProgressMeter *pm)
>>> +{
>>> +    qemu_mutex_destroy(&pm->lock);
>>> +}
>>
>>
>> Could we instead add a c file and add the structure private? Then we'll have progress_new() and progress_free() APIs instead.
>>
>> This way, it would be a lot simpler to control that nobady use structure fields directly.
>>
> Makes sense, I'll do it.
>>
>>
>>> +
>>> +static inline void progress_get_snapshot(ProgressMeter *pm,
>>> +                                         uint64_t *current, uint64_t *total)
>>> +{
>>> +    QEMU_LOCK_GUARD(&pm->lock);
>>> +
>>> +    if (current) {
>>> +        *current = pm->current;
>>> +    }
>>> +
>>> +    if (total) {
>>> +        *total = pm->total;
>>> +    }
>>> +}
>>
>> We don't have caller that pass only one pointer. So we can just do
>>
>> *current = pm->current;
>> *total = pm->total;
>>
>> implicitly requiring both pointers to be non NULL.
> 
> Is it so performance critical that we need to skip these safety checks?
> IMHO we can keep it as it is.


Not performance. It's just less code. You propose more complex interface (pointers may be valid pointers or NULL), implemented by more complex code (extra if blocks). And there no users for this. So, I don't see any reason for extra logic and code lines.

What kind of safety you want? All current callers pass non-zero pointers, it's obvious. If someone will create new call, he should look first at function itself, not blindly pass NULL pointers. And if not, he will get clean crash on zero pointer dereference.


-- 
Best regards,
Vladimir

