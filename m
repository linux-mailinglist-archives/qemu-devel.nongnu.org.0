Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE62D75BC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:38:23 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhgk-0006XB-HA
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knhbR-0001Ch-KF; Fri, 11 Dec 2020 07:32:53 -0500
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:63392 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knhbN-00030H-5P; Fri, 11 Dec 2020 07:32:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rbbpyqs1JUC0rokI5c0z4s8741ItbhNU/2xDOKJf9zyjAzI8lKAel/Z4wYtVlggH9ZUrEqfE+rwQmOL1rSfcBnKyJEfl+hj+ctLi2rJrr5OxCXbzNNXa5vkbPr04gBRG+56cRaaY7oEY/t4dqzXsVfyCi6G08xJ2C8Sl6ON0V2KdDazZHaKvhAvOaUvRw+yjAUpoVxsAI+LZAv8oraTOkpRrjomuCDM0USnwTjayvqfGQ3tQJTG6n4awAV0b0H9cX4h7rANy/1hSeiwV5lR+XW8xwXoP8ejGQmq/8Yim6bNrw42dgL1cvivedOVcau6Ka635zhHQPdQ2Q9XFKr5KIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLsevU3R9Ei4mn24A4F6/avdk6GjFNMnhAKtbv3MvWs=;
 b=SYohmAnEcBcPyya9+xE1gCDlnPOzeCUftfohOiDmB0+QU7itq6+90DDSENZgI5gNAmsTySJ5mWBCEAqsDAbFX9ewkQj+UAIYpMsTQe2JWocqr9Z0VoSS1yb8bctWtnypCjapioLG8PbQ313jb7tPAvEup50f3cUiCjbiTsXvppNDC62fMtq0v4LbKe7XNfM2BP01t2F3+o577ZOTbl7R6n/TXRnP5x1RrrcDh3FnrMuBT6DLv7p20QqzWM2wv5leGZjt3hae1eiAEINM1OXxIh1mVRDIBTCLxpMtK0qiayEd+6ECoBrjkpbTfG18PU5GbsRDrBmg6e3broLh1mcqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLsevU3R9Ei4mn24A4F6/avdk6GjFNMnhAKtbv3MvWs=;
 b=Uby9s1gAnWbpEEuHBrDFyMnb8vP+JwSgBZlH+yrQ7IG0/6XhE+TQec0PYx/R0sj73bfHwQAuBBTtzTBNbz7vbKP8APlP6khRR/QPnJvfaX7t81UsAKSEihJ4wPwFecPhYU9iti1FS/q0VAg17ztG4OTcXHxiToCq7K3mEamihmk=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 12:32:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 12:32:46 +0000
Subject: Re: [PATCH v14 05/13] qapi: create BlockdevOptionsCor structure for
 COR driver
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-6-vsementsov@virtuozzo.com>
 <e3621773-9000-31e6-5f41-9a7bfd5ccbbe@redhat.com>
 <42e4cd28-e073-b8d6-4853-ddf3a47dec59@virtuozzo.com>
 <e8c8b0a0-f764-7f5a-6adc-9deded872794@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4d2bb969-e358-2f64-4b69-bc6bfbdcb82a@virtuozzo.com>
Date: Fri, 11 Dec 2020 15:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <e8c8b0a0-f764-7f5a-6adc-9deded872794@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 12:32:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 827b250b-622e-4cc4-7f8a-08d89dd0dd29
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59103E8B9BD84391640A9A6FC1CA0@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGHQ0gOLmWgHfWfTo3u67JKOn2SuaykqUHQK+OX3VWTV0BFT0u6vnpHHRRrUjxyjQx/HqX1UcZW2A0ZHgY11RZyH763rCi2plvFIJr9GTAR5vLguCYx1QStt40l44gMOxejhIJnpc5Y3deI66bt9TXw+LQKQqBuzNfVMG42aBYSSwg3pYO6nZfODPTKGzUOipZn9qXw4MJowh5jtaRUD6gsW72ubRpDy/SoqizX9pwxCNgLB+qN88H2j+cH49Rtx2+i8vJuCNEVLjEoylovLFzCq7Bvx39V5shIu9ACw8L8olnRMr9ZFYinUiW6BJFhbWdTatgNggYEtWizdrEbcu75gBqnRW7SteYSFr2GmHMcAxKYcDrtqhHRHOOJMYQdVweYSuH/IOeGQJS0Wx+3FcJodKqgX0P5lMHAf9KEbrZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39840400004)(366004)(396003)(346002)(107886003)(36756003)(66556008)(31696002)(83380400001)(956004)(186003)(31686004)(8676002)(2616005)(86362001)(16576012)(2906002)(4326008)(53546011)(66946007)(8936002)(6486002)(478600001)(26005)(52116002)(5660300002)(66476007)(316002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmZUQzZlTnNzSXc1cDNOTWJVdEFpUGY0cFFrdE00VDhnK1dlaVZqVFlVYWE0?=
 =?utf-8?B?a3NzTll6cGNMU1NtZ1JJTEwramJPTFRMeGxBUmtWRlZid29BdUtXbTNYOTJU?=
 =?utf-8?B?K1BQam5TSW9zeThDSldvMTZCZEdURUtCR25YVUJRKytEUUU4aFVubWlQT2FE?=
 =?utf-8?B?OFZSbjRycXlhT05aRVk3NVY0MlpQeS9RY3UzaE91UlI0WkIwcWNLY2RDVllW?=
 =?utf-8?B?eEZ3MDdkend3REdkNUFyeUdua3UxamVSL1JDRGpld2g5RDM4MTJsOHUwSFll?=
 =?utf-8?B?WVU1QWRXQ0N1eXVpM3dYT3BrVmIwMVpJQVZON2tTbkN0Z003aEFDeEpuU3gx?=
 =?utf-8?B?bDAxVUlqellIelUyVEdYdCttY2NXVnVoME9zZ00xRnJsWlhhRUR2NVBwQnNJ?=
 =?utf-8?B?a2N5Q0h3a3MrekczRUVHank0dDRQOXhOL2ZpdUl3UisvTVpYMTZpWXc0NlZO?=
 =?utf-8?B?MzcxVm1LU2IrUkFzTytxSlgwZUdlN2pPT0ZoaUkyYmQ3bzdtNHE4T000SHV4?=
 =?utf-8?B?QjRQTVU1S3dSUVdFQjE4cHkzczJua3lyQVhXdDUrTWV1bFM2ZTNKSytGTGNX?=
 =?utf-8?B?SlV5Mk5BZmFvTVFJZjd6YUs5MG03TllReW8zT25HZUhUQmZ5blJxa1IzSlBi?=
 =?utf-8?B?OWhoRitRKzRLUGZjdlpEUlhBV2pnQzBhdmlTRldmME03N0E1RGF2T1g0Zk52?=
 =?utf-8?B?SlArdmx0VjR1S25SRzdxTXpra1RsR0tMZ1hsWW5VT3ZEb3RQcnIxRHBVUjZv?=
 =?utf-8?B?cjd6NVpqS1ZCTURVSHZWakIwMEY3ZkFNd0wybFRNZ3h4blQwSmM5TE94UDg1?=
 =?utf-8?B?QjBSQnJsMTFaWnQvYjlSOGZid0tSSHJlZ2pieitOYUdUS3JGeFkvbXJFdFFU?=
 =?utf-8?B?RHR3QjNVMU9VcnBHQXJzanNDNmQ3ekREd0JlSEt1SFFDMW5ZQXZ3aWdlL1B6?=
 =?utf-8?B?Wkl6aDgyRitIcVdXVVdFRnVtZ1ZHZGRaVEwrWUhpY3F4RFkweHI5cDFRZ0Rj?=
 =?utf-8?B?U25RR1dFSkp2SnpUSmllQnJRU0VyMmQ5K05VbHRNNy9XaVhReER4WW14ZldO?=
 =?utf-8?B?eC9IT2g2Qk14b0Z6OGpvVkd0YlZuSGJ2Z0VuV1BrZEk0M3MwK1hBVmVxdGFJ?=
 =?utf-8?B?OHZFL3g1SXNsTWZDMnlJYnYwdW15VnVNYzNBMG9hRm4xWDRPUmlTWjFqbDZY?=
 =?utf-8?B?RTA0Y29zTzQyM0E2a2NUbE5PME9uQXhoaStNajcwaG5XNlIrNlhUZ0czZ1Bt?=
 =?utf-8?B?MjJiNmF2dWFBb0tCb1BONVdrMVZyd3c4TmRPSTBQOXVNUVFOVHZzbXlhemF6?=
 =?utf-8?Q?EcmxuGOEXMj5uDMFMjyqSlYvnMxuTG1SfO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 12:32:46.1620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 827b250b-622e-4cc4-7f8a-08d89dd0dd29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7hr2RY4wMOGreAz387auEtTl1q3MzoFadQddPGn2ZNROKGPIQUHJ/u/RcPEb9k4USPCFg5DNCAMRwPeKsnUqFO2MPzhAUiu+DvSUi6ZELI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 11:54, Max Reitz wrote:
> On 10.12.20 19:30, Vladimir Sementsov-Ogievskiy wrote:
>> 10.12.2020 20:43, Max Reitz wrote:
>>> I don’t like this patch’s subject very much, because I find the implementation of the @bottom option to be more noteworthy than the addition of the QAPI structure.
>>>
>>>
>>> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>>>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>>
>>>> Create the BlockdevOptionsCor structure for COR driver specific options
>>>> splitting it off form the BlockdevOptionsGenericFormat. The only option
>>>> 'bottom' node in the structure denotes an image file that limits the
>>>> COR operations in the backing chain.
>>>> We are going to use the COR-filter for a block-stream job and will pass
>>>> a bottom node name to the COR driver. The bottom node is the first
>>>> non-filter overlay of the base. It was introduced because the base node
>>>> itself may change due to possible concurrent jobs.
>>>>
>>>> Suggested-by: Max Reitz <mreitz@redhat.com>
>>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>>    [vsementsov: fix bdrv_is_allocated_above() usage]
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   qapi/block-core.json | 21 +++++++++++++++-
>>>>   block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
>>>>   2 files changed, 75 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>> index 8ef3df6767..04055ef50c 100644
>>>> --- a/qapi/block-core.json
>>>> +++ b/qapi/block-core.json
>>>> @@ -3942,6 +3942,25 @@
>>>>     'data': { 'throttle-group': 'str',
>>>>               'file' : 'BlockdevRef'
>>>>                } }
>>>> +
>>>> +##
>>>> +# @BlockdevOptionsCor:
>>>> +#
>>>> +# Driver specific block device options for the copy-on-read driver.
>>>> +#
>>>> +# @bottom: the name of a non-filter node (allocation-bearing layer) that limits
>>>> +#          the COR operations in the backing chain (inclusive).
>>>
>>> This seems to me like something’s missing.  Perhaps technically there isn’t, but “limits the COR operations” begs the question (to me) “Limits them in what way?” (to which the answer is: No data below @bottom is copied).
>>>
>>> Could you make it more verbose?  Perhaps something like “The name of a non-filter node (allocation-bearing layer) that limits the COR operations in the backing chain (inclusive), so that no data below this node will be copied by this filter”?
>>
>> Sounds good for me.
>>
>>>
>>>> +#          For the block-stream job, it will be the first non-filter overlay of
>>>> +#          the base node. We do not involve the base node into the COR
>>>> +#          operations because the base may change due to a concurrent
>>>> +#          block-commit job on the same backing chain.
>>>
>>
>> I now see that paragraph conflicts with further introduce of "bottom" for stream job itself. I think it may be safely dropped. It's a wrong place to describe how block-stream works.
>>
>>> I think the default behavior should be mentioned here somewhere, i.e. that no limit is applied, so that data from all backing layers may be copied.
>>
>> agree
>>
>>>
>>>> +#
>>>> +# Since: 5.2
>>>
>>> *6.0
>>>
>>>> +##
>>>> +{ 'struct': 'BlockdevOptionsCor',
>>>> +  'base': 'BlockdevOptionsGenericFormat',
>>>> +  'data': { '*bottom': 'str' } }
>>>> +
>>>>   ##
>>>>   # @BlockdevOptions:
>>>>   #
>>>
>>> [...]
>>>
>>>> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
>>>> index 618c4c4f43..67f61983c0 100644
>>>> --- a/block/copy-on-read.c
>>>> +++ b/block/copy-on-read.c
>>>
>>> [...]
>>>
>>>> @@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
>>>>           ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>>>               bs->file->bs->supported_zero_flags);
>>>> +    if (bottom_node) {
>>>> +        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
>>>> +        if (!bottom_bs) {
>>>> +            error_setg(errp, "Bottom node '%s' not found", bottom_node);
>>>> +            qdict_del(options, "bottom");
>>>> +            return -EINVAL;
>>>> +        }
>>>
>>> Should we verify that bottom_bs is not a filter, as required by the schema?
>>>
>>
>> yes, thanks for the catch!
>>
>>
>> Hmm.. Interesting, we don't freeze the backing chain in cor filter open. And I think we shouldn't. But then, bottom node may disappear. We should handle it without a crash.
>>
>> I suggest:
>>
>> 1. document, that if bottom node disappear from the backing chain of the filter, it continues to work like without any specified "bottom" node
>>
>> 2. do bdrv_ref/bdrv_unref of bottom_bs, to not work with dead pointer
>>
>> 3. check in cor_co_preadv_part() is bottom_bs is still in backing chain or not
> 
> Hm, right.
> 
> Alternatively, we could also freeze the chain until the bottom node and then allow changing the @bottom node through reopen.  Then it would have to be manually unset before the bottom node is allowed to disappear from the chain.
> 
> Would freezing the chain pose a problem?
> 

Hmm. Then we'll just need not freeze it in block-stream, so freezing is done by filter.

It's just more restrictive.. But I can't imagine reasonable cases where user specify bottom node and than remove it. Forcing user to reopen the filter to change the bottom node may be more clean then "just don't care". OK, I think we can freeze the chain in the filter.


-- 
Best regards,
Vladimir

