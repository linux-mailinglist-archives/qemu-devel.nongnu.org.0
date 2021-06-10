Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BB3A2F06
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:06:25 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMGG-0000VS-A1
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrMFK-00083h-3u; Thu, 10 Jun 2021 11:05:26 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:1924 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrMFA-0006IF-PE; Thu, 10 Jun 2021 11:05:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGTxACPN/YVItkxwN/KISJW/HJzQl8CPVie5yGamhRnTConKn34Sl/aqtlPwmGNXduA2HM+EwNgMwjICzIv4cm97qBgQZs7ei0bJKVd/HLwYYt9PP8z+kSNyMMgrWfGWFmt0y7IzqVh85l5JkSUGGH1tcGzWNujd5lzRmqpQstQK2aF3yxHN/4/RBvSW9hcT90e5qSdkJdbJx5qN6AExDb/L6ZzCsJ7d5IEIDDlPRbkcClxi1ka3k9Zvd+/5WpCA9c7ycm7nKbLQmm5rMbQEocYPtcpr4KX1nNKy5M0rb7zMz7g6VTcD6W6xz2oJSkQBF+cbmG9Ro8plI5RMVnoIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY25kNfO5OE3RGhfpOC68zQjmnG1HKXnsNrbNVdTGu8=;
 b=j25TeT8V8BXLnojVgRm8j+r3ss/ofZ8nxsu5pRBi2P94q8UA9iUVUEkTgNOS+56LiwP58FFy5FloLne9kdVjrb8RR2mQ5bgX4Iu37va6EDuhOlwqKyJuG3k5JcYakFzpOxohVRKlMsIS8NnB3wF//hs5EgumKBgBmuqq1iDJGOdJ5wb/0TO3L/fFkZXZUDIvwz0gsZN2TuOpzWP9lcRzFJqsbIEvkXCMo0RK6Y8DzENaUwNmIJ2IUc8DUwOxSdLwDHwrifaNlUgYzV6f9oVqczBT64gbNmNAT0mw7TNYZ2Dhqxr1sLFrcGj1FYE8DXaq6aQ8UyCcJ0wK45H0zEntAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY25kNfO5OE3RGhfpOC68zQjmnG1HKXnsNrbNVdTGu8=;
 b=Blq2SVFkLZk6fCQjLh9FkoO5Oppw9+wHRo2SbFI9oO4dE4dQbqK5osHtHrAprvxMPK5pB9c0bq23cnn4gFnazxs7hmV8c5/zDoJc1Y44Ydd7YipEgAt/bnQZJWno+mkY12e2b+D9DlDE6Od0xM0fTsYt3EcviCZ0Jp3BDfQfIxc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 15:05:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 15:05:12 +0000
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
 <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
 <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
 <9d24d1c2-bcf0-59a7-f934-cd67bdff7fed@redhat.com>
 <ef104344-d857-c741-2893-315e9f0a77a5@virtuozzo.com>
 <f3790bfb-b151-df6b-5c78-0e536a8ad310@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f1df484e-332c-a323-cc8b-c86ac27b39f4@virtuozzo.com>
Date: Thu, 10 Jun 2021 18:05:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f3790bfb-b151-df6b-5c78-0e536a8ad310@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR05CA0102.eurprd05.prod.outlook.com
 (2603:10a6:207:1::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR05CA0102.eurprd05.prod.outlook.com (2603:10a6:207:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 15:05:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb24c7c9-2916-438b-c0bc-08d92c212582
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6117ECE176AD01916C683F2CC1359@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ajeWOiwB3iYu0Qnehcu7QuU8jwj3+Sph8JqxuW+z26oFnWRH99Zpk/pdGsohk152KS2YBmhAi56qJNEgxig++AZiUpzV194pcHlwVf3dlhes0lFEVM38u2fjI6ziDVr2F5jPr5E9TErI/tXIkCanX44y0QT/muCPTdqQ2SNF7X18qyOpb/DlFqayz45YnQ6him+hzIAJ8YBn3GRJNr49ZCB9ZjX9MRNLe4S+MyyyM+6Geqm2vf0C0pKOFOHf6WJRtSw8sKNAig/09pv911Byp2CKhYNOuI/btoSesbUmGeCklmVf9ZkFFH2vlHweJf7/lxPDFHn2gQLsn4jif/lv3ifM28yfPIq4moGUTU1R2yyzoNxhkX5HqzNY1HGAy0PEhGpgpiCTG56ZLB8WWjxZ5NqhHt5cpot1+dEw6nLJaPLmAw0AGkS6UBw3xOwbnVcZGLxFA9clnW9mLoLELTcsv0H0GcrD9Xgy/PhTORni+DCUahAV+e5aniaD1vMRujmW+ckcb8ZBVa7zbwPICA4b1Ri3UZI/IJPebdThJruOG1UlEBUEkniWyumzTM8hvjDQ+ERd5VurEicr/HshK7Ast19XdE4dtYVAJpANjd/KIve7pM9nrBNkyu1VYqOPoQMw296KBLcX4sJAOVgU+g456KNuV13Bw/k5NgOiLtcag+tZogE/uFpnTlBtQpP1DxnhcCKXAToK68igdTFsxSXZuDNA8xZRzrKO/0ffL8b3WY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(31686004)(66476007)(66946007)(956004)(66556008)(6486002)(5660300002)(186003)(16576012)(26005)(16526019)(54906003)(52116002)(53546011)(36756003)(31696002)(316002)(4326008)(86362001)(8936002)(8676002)(2906002)(478600001)(38100700002)(38350700002)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVlsS2tnZXJCNkQwRjA5NlBGYjNaS1NLUUxmbHhEbnNqTmRSM214K3NMcGE2?=
 =?utf-8?B?aGtIU3l2S1lVYWJIdCs0N1VITTFCZDlKcVIwSFJRZXUvV2hSQ2JxZSs5bzNo?=
 =?utf-8?B?N1ZKOHFHYUQwakNnU2l2YlJ6anhBS3J5YVRaYzkrbzNTSi9HcmRGc3o2LzlT?=
 =?utf-8?B?ak1jWDdQTUl4RTVFM0tYM1NqUkg0U0ZWaHRwUTFmMWZmZ0c3cGVmZy9FMGI3?=
 =?utf-8?B?VDVRRldHVk9jdGpSNXRvNXVZdWhRZ1FkWEtpNVlLbTlrdHp5V3lEUkJNdm9F?=
 =?utf-8?B?a3ZxMWNGd3B3aEJpVW1LWlMycFZ5VVpHRTE2ZEtPTklZVk5Ud3lpZExmRXR5?=
 =?utf-8?B?VitRZDVFYk9xQ1p5bmtUT2o2bVVJTGJHU25kbkFXNmwrdVVHQ283cjlWQUdZ?=
 =?utf-8?B?ZVJXSGlwcElNWXhIeUY3NWZLN3k2TlA0SXgxbzJmcWVLbVBPY3JTY1VEQ0NF?=
 =?utf-8?B?ZzZHZ01sbFhNUzRRZDFKUFNaVDBJd0VjRDZBS0tLVnluNjRjb3dIRWN2M2xv?=
 =?utf-8?B?MWFxMDNxR2VWNEdaOGRjdjRkYWpVYTZ1WitGNE50ZTZrcjZQYThHNHZDOUEz?=
 =?utf-8?B?TmowUnN6SjEvUUlpK2pnR0VVQ1VkV1V0S2hYck9DRGx6WHQyV0IxM1pRL09j?=
 =?utf-8?B?cEE2U2M4bnJrRGx3LzBlemRobHRIZGlpc3VIQmxtMjZiMWVHdDUzTVVZbGRa?=
 =?utf-8?B?SVBGeHpUdGFRMU9zRUpYbmswa0F5UzdiTk5tcjJHVmFzUXpBWmIvRm9CYWhy?=
 =?utf-8?B?ZDlqQ28vS1cyVFVrVVZBTkJocDRkcFg3bFpFb3ViUC8yd28rY25CdTNGOC9I?=
 =?utf-8?B?S3ZNNWllU3N6Q2I5WXRUTk5ka0ROdHRpSkJXenphbU16VklMblh1NzJyZmxZ?=
 =?utf-8?B?Y0kvRnY1UG0zRVRETWZWUmJmamwrcFh0a3N6RnpmOXpHNmQ1cWRaLzRHWnpO?=
 =?utf-8?B?K0xXeUR0cSswVmYwbk5qRGZmVUN2OENLcG0zc2NoelBORW5KZUdyQ1RvMldx?=
 =?utf-8?B?U0NZMDVwK3o2UzI2cjUxa1E1NWozdzVMQ05TRHRkQk9pWW1wNzVKaE5wTHZ2?=
 =?utf-8?B?WWNja1pJSkZLN3VzcVNtZThwOUtKdm1vOXFxY25pcm1NZjJwZTVOUk9oSllx?=
 =?utf-8?B?eWZoNVNDZjR5UlhHNlliV3hhb3AyYyt4OS92eHVSalpwWnFGRUR0eENVd0JO?=
 =?utf-8?B?Ui9TV2dDVVFTWXczZWQ4SHI0VGsvYWloSHZPTTdsV1JzNi8wMFZjS1U4UXJ6?=
 =?utf-8?B?VGZuUVVHTmlCODk0RjdmN1B0S2RZa2FnT0F2MTZiOWlzKzdERE9talNvWUd0?=
 =?utf-8?B?OWwvQWJIWENoVk96T0hnSWx3cWFSTTZLRGlibUh4TXJvM1kwWDBCeHVCV1Nv?=
 =?utf-8?B?cHhYelFKMWk2VWsvc3JYSHlmUkh0anpUYjh2d1RLWFJsUS9jTXcxb0o5cE5n?=
 =?utf-8?B?a3FoSUc2Mm5hb0dyR2RCZjFGZmhTVThsSjF5WWV3ZUQxSjdqdmRGOGg1Z1dq?=
 =?utf-8?B?V1gvZVlZYUhET09aQWZMaExFQ2Q5L0VIZ0cvMUs4b0pCc0g2ZDArOUJtVG5E?=
 =?utf-8?B?RWhkNEFGd1lIV1dySkhGT1lDblM1bXQ4UGFXeTc1MXp4MUhtR1lQSjBJVCsx?=
 =?utf-8?B?UVBBWnErelllNkRLbUZHcWNhZGtHWjVPU3V3cGVWc0krTytvZVd5amdCWDZs?=
 =?utf-8?B?alFvY2tPQXliN0VsUkFqTHlOcnNGa0E4Z2V4U08vNGRmaENnR0hhMmF0WWR2?=
 =?utf-8?Q?GGDK/0s6EpgzmDgiTDnIz9PivoI7mVhMYXXaorJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb24c7c9-2916-438b-c0bc-08d92c212582
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 15:05:12.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1FXvf/FT4/RYtyJBWeek9RfxS2g5BnPEXqlsvMVVjBQg/2hn5Ta7Jqqlg4Sbk1D5WWYazNhxSUtKBxgAQ3wkldXzIUpJSPm9TVJvHSRHK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

10.06.2021 17:21, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 10/06/2021 13:12, Vladimir Sementsov-Ogievskiy wrote:
>> 10.06.2021 13:46, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 10/06/2021 12:27, Vladimir Sementsov-Ogievskiy wrote:
>>>> 10.06.2021 13:14, Emanuele Giuseppe Esposito wrote:
>>>>>
>>>>>
>>>>> On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>>>>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>>>>>> and BlockCopyState in IN, State and OUT fields.
>>>>>>> This is just to understand which field has to be protected with a lock.
>>>>>>>
>>>>>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>>>>>> and thus here left as TODO.
>>>>>>>
>>>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>>>> ---
>>>>>>>   block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
>>>>>>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>>>>>>
>>>>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>>>>> index d58051288b..b3533a3003 100644
>>>>>>> --- a/block/block-copy.c
>>>>>>> +++ b/block/block-copy.c
>>>>>>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>>>>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>>>>>       /* State */
>>>>>>
>>>>>> Why previous @list field is not in the state? For sure it's not an IN parameter and should be protected somehow.
>>>>>>
>>>>>>> -    int ret;
>>>>>>>       bool finished;
>>>>>>> -    QemuCoSleep sleep;
>>>>>>> -    bool cancelled;
>>>>>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>>>>>       /* OUT parameters */
>>>>>>> +    bool cancelled;
>>>>>>>       bool error_is_read;
>>>>>>> +    int ret;
>>>>>>>   } BlockCopyCallState;
>>>>>>>   typedef struct BlockCopyTask {
>>>>>>>       AioTask task;
>>>>>>> +    /*
>>>>>>> +     * IN parameters. Initialized in block_copy_task_create()
>>>>>>> +     * and never changed.
>>>>>>> +     */
>>>>>>>       BlockCopyState *s;
>>>>>>>       BlockCopyCallState *call_state;
>>>>>>>       int64_t offset;
>>>>>>> -    int64_t bytes;
>>>>>>> -    BlockCopyMethod method;
>>>>>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>>>>>> +    int64_t bytes; /* only re-set in task_shrink, before running the task */
>>>>>>> +    BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
>>>>>>
>>>>>> hmm. to be precise method is initialized in block_copy_task_create.
>>>>>>
>>>>>> And after block_copy_task_create finished, task is in the list and can be read by parallel block_copy_dirty_clusters(). So, @bytes is part of State, we must protect it..
>>>>>
>>>>> So if I understand correctly, you refer to the fact that a parallel block_copy_dirty_clusters() can create another task and search with find_conflicting_task_locked(), or in general also block_copy_wait_one() can do the same in parallel, correct?
>>>>
>>>> yes
>>>>
>>>>>
>>>>> Here there is also another problem: if we add the task to the list and then shrink it in two different critical sections, we are going to have problems because in the meanwhile find_conflicting_tasks can be issued in parallel.
>>>>
>>>> But we shrink task only once, and we do it under mutex, so we are OK I think?
>>>
>>> I think you understood, but just in case: I am thinking the case where we have:
> 
>>>
>>> But maybe I am overcomplicating.
>>>
>>
>> Both shrink and find_ are done under mutex, so they can't intersect. But yes, we should keep in mind that if we do find_ under mutex, and then release mutex, the information get from find_ may become incorrect.
>>
>> Check callers of find_conflicting_task_locked():
>>
>> block_copy_wait_one has one critical section.
>>
>> if no conflicting tasks we are OK.. Are we? Ok, look at the only caller of block_copy_wait_one() - block_copy_common().
>>
>> assume block_copy_dirty_clusters() returns 0, so there no dirty bits at some moment...
>>
>> than in parallel thread some task may finish with failure, leaving some new dirty bits.. Then we check that there no conflicting tasks.. And then we go out of the loop, when actually we must retry for these new dirty bits.
>>
>> So I'm afraid you are right, we are not threadsafe yet in block_copy_common(), as we should check conflicting tasks and dirty bits in same critical section to be consistent.
> 
> Wait, we are talking about two different problems:
> 
> - What I wanted to point out has to do with @bytes, not (as far as I understand) with the dirty bits. From the example I made below, I assume there are 3 separate non-overlapping critical sections:
> 
>>>> T1: block_copy_task_create()
>>>> T2: find_conflicting_tasks() <-- sees the initial task
>>>> T1: task_shrink() <-- bytes are updated, T2 saw the wrong amount of bytes. This might or might not have consequences, I am not sure.
> 
> T1 creates the task, T2 iterates to search for conflicting tasks (called from a parallel block_copy_wait_one), T1 shrinks the current task. I think that T2 in this case misses the updated task, even though the worst it can happen is that the task is smaller, so a false positive (a task is not conflicting but might be marked as conflicting).
> The outcome is that T2 is waiting for a task it shouldn't, but there is no error there.

That is handled in shrink: we do wake up all waiting tasks in shrink()

> 
> - Your point is about a task failing between block_copy_dirty_clusters and block_copy_wait_one. The task failing calls block_copy_task_end and sets the dirty bitmap, but at that point block_copy_wait_one won't check it anymore and the bitmap is left dirty. I think the default behavior here should be that block_copy_dirty_clusters() is called and a new task is created. This, as you pointed out, is a proper error.
> 
> In this case, we need to stop iterating only when 1) the whole bitmap is clear, and 2) no conflicting task is present.
> 
> Therefore a possible solution can be the one below:
> 
> int stop_looping = 0;
> 
> ...
> 
> do {
> 
>      // create all the tasks, clears the bitmap but
>      // adds tasks to the task list
>      block_copy_dirty_clusters();
> 
>      /* here a task can fail, but then the dirty map will be set */
> 
>      lock();
>      // make sure no task is running for this operation
>      stop_looping = (find_conflicting_task() == NULL);
>      // make sure that the dirty bitmap is clear
>      stop_looping |= (!bdrv_dirty_bitmap_next_dirty_area()) << 1;

bdrv_dirty_bitmap_next_dirty would be more efficient to check, is there any dirty bits in the range.

>      unlock();
> 
>      /* if stop_looping is == 0, no task can fail */
> 
>      /* if a task fails here, the if below won't see it but it will
>       * block_copy_dirty_clusters in the next iteration */
> 
>      if (stop_looping & 1) {
>      // there is some conflicting task, wait for it
>          qemu_co_queue_wait(&task->wait_queue);

we should do it under lock like it done in block_copy_wait_one (and qemu_co_queue_wait() release lock by itself)

>      }
> 
> } while(stop_looping != 0);
> 
> ...
> 
> What do you think?

Yes something like this. But please, let's use boolean variables instead of bit arithmetic )

The reason why it is written another way curretly is that I wanted to save extra call to bdrv_dirty_bitmap_next_dirty_area(). But now we should search for conflicting tasks and for dirty bits in same critical section, otherwise it doesn't make sense.


-- 
Best regards,
Vladimir

