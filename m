Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5639CAC6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:42:04 +0200 (CEST)
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpcBH-0005gs-Vt
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpcAE-0004uY-6y; Sat, 05 Jun 2021 15:40:58 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:31449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpcAA-0007AR-2O; Sat, 05 Jun 2021 15:40:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAgnGqzNLaw+4N1gANXQci0ouvkBmoQ+1usRxCPbEXj0lCdzYCkq5HhVsV4H6DFfeCau1S6LqJzfBd8SRGQ6/yAuprZ/yPvWJ1LSTNu2JNxFZlT9dKUs0aW0+kwKS1Bm9xcMuNNeBHrwb9Ns22+FkWeSO6v6a1QU5+mQmY585DfTllyxTrrNtSOjEbu43NZuEYCUMNh/vnabKTmnhBtJqJHN4fBiiuclslQvE1I0t6Eqg01gztsDfjw6e4ZPvBGXTkGBmr04wLwVw7hy7GDMfFUuvWk0lbvRvr7sMSe9wYqkJuRt0awuOcOECGAn0gdjEKRK3pbXGxpJTifYiKc7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkR55/DvhFmXY7Jql4R0p9jhwB4gYjUtYYaivs/Voj4=;
 b=Ymem+U+nXmXBhatQmq3sM0gv700UJLJwUdzKFAC8vYSGTDsN0irXNDGGHA/LEwt9rs/ATbBnWm3/XOFyUYdo4Gxk61wi5WSMooNO/NwzVs1uzvnLJxB1qmhefvckWizgNeG8dVadCBZLfycqRiDHxAiZCx6DwZhkStiTrVoMgoRMatI4zl3hEVpVWIoN9nDE+9a6xeL63P/GIWO+tM68w6M2UetZiXB63nIoPUjFIl+g7Et3Fpk+0KUH8+9Ccz1KMmSQnCFzHt9LMmwlda5itVlo7igoMxXqsj+s+WFLp+MoWdwW2nzayxKlHfB/3lPeIMcl7tFIHq+SrX7/vv3Siw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkR55/DvhFmXY7Jql4R0p9jhwB4gYjUtYYaivs/Voj4=;
 b=Me6157WH6GxadCIYrvaVZHOFeA1/PGS//yIJPmMgpd2ZVv3QfzK2fJhWCTSg3ZYWrhPbSu38Tbe73dixblIlL1Lypi60pK5QLWswFckvW2VDic3/hkYiBX4HTDIokAJkl3imQo2QVFEqZrgyAy09E7xj/EWxmVfAmIOutFEmOys=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 19:40:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 19:40:48 +0000
Subject: Re: [PATCH v4 6/6] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-7-eesposit@redhat.com>
 <4d31dae3-cd23-0a37-910d-d44a6ca77456@virtuozzo.com>
 <763e2193-6505-016b-227a-490ad0119336@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <27f7888a-2b11-08e1-ac2a-c7a8dda5ab21@virtuozzo.com>
Date: Sat, 5 Jun 2021 22:40:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <763e2193-6505-016b-227a-490ad0119336@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM0PR06CA0135.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM0PR06CA0135.eurprd06.prod.outlook.com (2603:10a6:208:ab::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 19:40:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33b2439e-a7f2-4844-57f8-08d92859d1c5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168A377C9FA86CD8D9A18F0C13A9@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igkT6zYF1wf1cok/MJQm3qh59b7hCzQmLfj8vVXIYYemeocGX3B68LwpavmjQh03PbMDcip2npZlBJDqSbU0LkoW8kZnIu6BSMudoNevOKp+3PeRQoEItWQIlU28pb+F9gmFE0T/XnERMP0QZlfQqfv1aW2lZ8OCKqpAQphW1OO7Kb1JXl0WhZyEHkiVzQocwoH1weTHfAHTPupUJ4Jdc6O9zh+EiY5AESSBFVYLmPKdDIr0v9XjtnQzFFmEuZvK/vaOezpTNsG+eUzsdJqKM1r2DsdBn51pD+wWVxoD7r4olhBkCKNzOruz8ElEoUuX6M7on5PQoxNh+qOoV3xuo+37FPw736mttc2A5B7R0xCUuTdoAcWLcijM8aQAHTVEaLdnVnWPBN0CCDOnaa9/VxwMJ68AdFUtKE0gDToMHRR69Pm6nOOq1XT9VW4BH9gQAOvzEmVB30Gqz3luFG9wNO/qc+AygKopGZ9/ZpRxWqiO94YA+s61knKE8+GNmqmdwi/wM57BU9SsB1642cdUDsoXtzaecw9ulmcu5ZjfYevYKsV+wUtmzd+3Kkc/aqtxWICTP637IhAuvGKDfzdUzN2hVPiPxXqgpeL1FZxjdllGF+YTuFrjXOXbOB398uq2c/yRw2csYlwfsDejgxXArmsmkto6/TftAx7a0tRPJKravrYPiGOSuSPglOU/F008gWK/DWXI2N8fIGsPrtNBW1pyUTPqGEa/Xj71KTFUndQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(136003)(346002)(376002)(316002)(66476007)(31696002)(8936002)(26005)(5660300002)(66556008)(16576012)(38100700002)(4326008)(66946007)(53546011)(186003)(52116002)(2616005)(6486002)(15650500001)(956004)(31686004)(54906003)(83380400001)(36756003)(86362001)(8676002)(2906002)(478600001)(38350700002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3hhM3VMZExRZzlEbEdyZlN3clZNTmd2aVdQcG1RQmxSSTl1OGNzVE1CUXVu?=
 =?utf-8?B?anF0Y1dIZ3lIMTR1UFd4d3VzQjZhNU9Ma0JGK0ZXbUVHWmZYR2NCUWp1UlYy?=
 =?utf-8?B?Wk1hV0VmeVZsWTU2SHR4WmYwaUJJR3hlNitxTU00dGh4TGU0NEZ4VXFrbVZT?=
 =?utf-8?B?NHE1V1dibVMrZmg2K3RmM3AxeHVTWjU3MXJHOXU5WTRFUFRmelpqeXk0OWR6?=
 =?utf-8?B?YmVxeXhsaWNOdEdWS0lwZms2K0tZcmtYeEFIbjkvVmE2bzBQRlp2SllSZWF2?=
 =?utf-8?B?dmRZbmpwMGpJOUJoWFhGN2pMWko4RVZoWUxXNnhkM3RpRUZidEpoamc3YWlh?=
 =?utf-8?B?Q24zK0c5Qyt2KzlTSmt1ZGpGZGIrNGF0NERkS1d4elRvRk9ka0pPVitJS2M1?=
 =?utf-8?B?aS8zUWVLMGU0VlluaEk5TFJDUzB3c3I2VTBXbWI4MTV2WVdnRUw0TW12aEJu?=
 =?utf-8?B?TVJ4UDU4TXFuVUF3c1JLd08zbmVHRXlaYnZGN29HQUp1YzhaUFkyVDY3U3o4?=
 =?utf-8?B?bGFZUW41SndzSERwdjUwTFJoS3ZsYUVlczYxcU1ISTV3ZEtLaklvdU9qU2NV?=
 =?utf-8?B?cHduemZZL1lFcUsrckE3eS9kS2ZRNWlDNVIvQi83dzFtMnR6WGw0Yk9XajQr?=
 =?utf-8?B?SS92eDNPRWV1YjB5UjJmVjhzdmlUNm9Md3htSi9QTHA5dHNtUlFaSUFRZFNX?=
 =?utf-8?B?RWlGYlMxcWw3S2lpRkl6TFdzSDNMOHRRZGhmQXkwdzQxRklQbUNSM1p1QWtP?=
 =?utf-8?B?bnFLWjVHNHM3Uk1YY2xyQm1NWFppNlI3VXBTZW94amdxenRqVnN0L3VIV0Vz?=
 =?utf-8?B?T1kyWlVjdVVka0pvbkxGcWxaWWYzT0IycFczOGZvd0pZWGZZZUFLNTdVRDFj?=
 =?utf-8?B?Vnl6bllZZVdKMGQ4b3ZoZjljK3NITEt5ZDE3aWpHcTFEaURWNmRNV3A3SGx3?=
 =?utf-8?B?ZFJHa09tbkRLYU1ZZGVvVG5pb3loaEtOR2ZKZnoycFFVNDJESXkxQWZnZ2pC?=
 =?utf-8?B?ZjVLbFJ0VGdaZlZtK1h5Y3g3YUNWN1ZtcnJTN0FsaFhmUTI3UDdOeDh2R2Ro?=
 =?utf-8?B?TGJKekxtSVpaL0NqQmxBNEt0azZUYXVTNHNiU0tBK2FPUHQzMG9jNHhjQi9W?=
 =?utf-8?B?clZ6a2hwcVN1TFRmaUZqWTZXWE9qa3NOTEJISGFkNDFWdGRxZm83Z09LUC85?=
 =?utf-8?B?MHdseCs0Zi9WanUxSmxLRDBhUmlHMjlCUTQ5dDVkYnVEMU5zWDYxWkM2V2tW?=
 =?utf-8?B?QkhpVEROYnR1R29NNWJQZTZ2VG0zQ3hpOTZBRlBnS0R5ZzhzT25SbE5qaWZs?=
 =?utf-8?B?cmV2dWt5aEJYU1ZSejRNcndualJLSHhFR1gyQThxN2ZYN0ZHZlVrbzlNUUF6?=
 =?utf-8?B?L2w4N3MyNS9ZVSsvR2V1d1Y5RHhpRE1SSXdLVloyY2NMVmZvN2VWK2VEZUQ1?=
 =?utf-8?B?dElqT3F5ZzNyNXNLUjZPVWVzd2lLWS9qVVBiL1BXUnVnOGYwMzEwM3ZpMmEr?=
 =?utf-8?B?SncwRUlodDhGZ001OXBDWERPRDhDV1ptTGg4RENZd3dVTWlWTWhCVE1PTzc3?=
 =?utf-8?B?MWFPb0FhYXNEVzFGcTlPY29tQmhuaVRZaDVob2FRWElYUDhVOERXVWkvclA0?=
 =?utf-8?B?VUoxL0ZDV1F2bUR1ZzFrT09yc2xzdWMrMUFRYTFaNFErZGFvRGNlaUF3WXVZ?=
 =?utf-8?B?emtmK2RpeHU0a0o3bUl2VHUvSmV6Y1ZleCt2WnRlYmdybzR2Sm4yYURIbzFB?=
 =?utf-8?Q?kG6A00h8ICofj5LK8yYuczyp6evEZdULe+sGeWl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b2439e-a7f2-4844-57f8-08d92859d1c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 19:40:48.7372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7l6XXk0IQ6PAxeDJLTAPeB5Tk3h2eDRZPUya7O/la4hClBhpJo5cdj0VAfGsT7HYU9fO6Rjy7gEtXkfyYFgbsNkAFCaENtXtniJ+w+HKug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.06.2021 20:53, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 05/06/2021 17:15, Vladimir Sementsov-Ogievskiy wrote:
>> 04.06.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> First, categorize the structure fields to identify what needs
>>> to be protected and what doesn't.
>>>
>>> We essentially need to protect only .state, and the 3 lists in
>>> BDRVBlkdebugState.
>>>
>>> Then, add the lock and mark the functions accordingly.
>>>
>>> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/blkdebug.c | 46 +++++++++++++++++++++++++++++++++++-----------
>>>   1 file changed, 35 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>>> index d597753139..ac3799f739 100644
>>> --- a/block/blkdebug.c
>>> +++ b/block/blkdebug.c
>>> @@ -38,24 +38,27 @@
>>>   #include "qapi/qobject-input-visitor.h"
>>>   #include "sysemu/qtest.h"
>>> +/* All APIs are thread-safe */
>>> +
>>>   typedef struct BDRVBlkdebugState {
>>> -    int state;
>>> +    /* IN: initialized in blkdebug_open() and never changed */
>>>       uint64_t align;
>>>       uint64_t max_transfer;
>>>       uint64_t opt_write_zero;
>>>       uint64_t max_write_zero;
>>>       uint64_t opt_discard;
>>>       uint64_t max_discard;
>>> -
>>> +    char *config_file; /* For blkdebug_refresh_filename() */
>>> +    /* initialized in blkdebug_parse_perms() */
>>>       uint64_t take_child_perms;
>>>       uint64_t unshare_child_perms;
>>> -    /* For blkdebug_refresh_filename() */
>>> -    char *config_file;
>>> -
>>> +    /* State. Protected by lock */
>>> +    int state;
>>>       QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
>>>       QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
>>>       QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
>>> +    QemuMutex lock;
>>>   } BDRVBlkdebugState;
>>>   typedef struct BlkdebugAIOCB {
>>> @@ -64,6 +67,7 @@ typedef struct BlkdebugAIOCB {
>>>   } BlkdebugAIOCB;
>>>   typedef struct BlkdebugSuspendedReq {
>>> +    /* IN: initialized in suspend_request() */
>>>       Coroutine *co;
>>>       char *tag;
>>
>> @next is part of *suspended_reqs list (in a manner), so it should be protected by lock
>>
>>>       QLIST_ENTRY(BlkdebugSuspendedReq) next;
>>> @@ -77,6 +81,7 @@ enum {
>>>   };
>>>   typedef struct BlkdebugRule {
>>> +    /* IN: initialized in add_rule() or blkdebug_debug_breakpoint() */
>>>       BlkdebugEvent event;
>>>       int action;
>>>       int state;
>>
>> as well as @next and @active_next here.
> 
> They all are already protected by the lock, I will just update the comments in case I need to re-spin.
> 
> [...]
> 
>>
>> Optional suggestion for additional comments and more use of QEMU_LOCK_GUARD (it looks large because of indentation change):
> 
> Exactly, indentation change. If I recall correctly, you (rightly) complained about that in one of my patches (not sure if it was in this series).

Probably here, indentation doesn't become so big :)

Maximum is

WITH_ () {
   FOR {
      if {
         ***

And this if contains only one simple "break".

Of course, that's a kind of taste. I hope I was not too insistent that past time.

> 
>>
>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>> index ac3799f739..b4f8844e76 100644
>> --- a/block/blkdebug.c
>> +++ b/block/blkdebug.c
>> @@ -70,6 +70,8 @@ typedef struct BlkdebugSuspendedReq {
>>       /* IN: initialized in suspend_request() */
>>       Coroutine *co;
>>       char *tag;
>> +
>> +    /* List entry protected BDRVBlkdebugState::lock */
> 
> Is this C++ style ok to be used here? I don't think I have seen it used in QEMU. But I might be wrong, someone with better style taste and experience should comment here. Maybe it's better to have
> 
> /* List entry protected BDRVBlkdebugState's lock */

OK for me, I don't care)

Hmm, looking at git log, I see :: syntax in my commits. And not only my.

> 
>>       QLIST_ENTRY(BlkdebugSuspendedReq) next;
>>   } BlkdebugSuspendedReq;
>>
>> @@ -100,6 +102,8 @@ typedef struct BlkdebugRule {
>>               char *tag;
>>           } suspend;
>>       } options;
>> +
>> +    /* List entries protected BDRVBlkdebugState::lock */
>>       QLIST_ENTRY(BlkdebugRule) next;
>>       QSIMPLEQ_ENTRY(BlkdebugRule) active_next;
>>   } BlkdebugRule;
>> @@ -249,9 +253,9 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
>>       };
>>
>>       /* Add the rule */
>> -    qemu_mutex_lock(&s->lock);
>> -    QLIST_INSERT_HEAD(&s->rules[event], rule, next);
>> -    qemu_mutex_unlock(&s->lock);
>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>> +        QLIST_INSERT_HEAD(&s->rules[event], rule, next);
>> +    }
> Same lines used, just additional indentation added. For one line it might be okay? not sure.

Same three lines, but don't need to call _unlock()..

I think, for last time I just get used to the thought that WITH_QEMU_LOCK_GUARD(){} is a good thing.

Here it's really doesn't make real sense. So, take the suggestion only if you like it, my r-b stands without it as well.

>>
>>       return 0;
>>   }
>> @@ -591,33 +595,32 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>>       int error;
>>       bool immediately;
>>
>> -    qemu_mutex_lock(&s->lock);
>> -    QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
>> -        uint64_t inject_offset = rule->options.inject.offset;
>> -
>> -        if ((inject_offset == -1 ||
>> -             (bytes && inject_offset >= offset &&
>> -              inject_offset < offset + bytes)) &&
>> -            (rule->options.inject.iotype_mask & (1ull << iotype)))
>> -        {
>> -            break;
>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>> +        QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
>> +            uint64_t inject_offset = rule->options.inject.offset;
>> +
>> +            if ((inject_offset == -1 ||
>> +                 (bytes && inject_offset >= offset &&
>> +                  inject_offset < offset + bytes)) &&
>> +                (rule->options.inject.iotype_mask & (1ull << iotype)))
>> +            {
>> +                break;
>> +            }
>>           }
>> -    }
>>
>> -    if (!rule || !rule->options.inject.error) {
>> -        qemu_mutex_unlock(&s->lock);
>> -        return 0;
>> -    }
>> +        if (!rule || !rule->options.inject.error) {
>> +            return 0;
>> +        }
>>
>> -    immediately = rule->options.inject.immediately;
>> -    error = rule->options.inject.error;
>> +        immediately = rule->options.inject.immediately;
>> +        error = rule->options.inject.error;
>>
>> -    if (rule->options.inject.once) {
>> -        QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, active_next);
>> -        remove_rule(rule);
>> +        if (rule->options.inject.once) {
>> +            QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, active_next);
>> +            remove_rule(rule);
>> +        }
>>       }
>>
>> -    qemu_mutex_unlock(&s->lock);
> 
> Too much indentation added for a couple of lock/unlock IMO.
> 
>>       if (!immediately) {
>>           aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
>>           qemu_coroutine_yield();
>> @@ -880,9 +883,9 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>>           .options.suspend.tag = g_strdup(tag),
>>       };
>>
>> -    qemu_mutex_lock(&s->lock);
>> -    QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
>> -    qemu_mutex_unlock(&s->lock);
>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>> +        QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
>> +    }
> 
> Same as above.
> 
> Thank you,
> Emanuele
> 


-- 
Best regards,
Vladimir

