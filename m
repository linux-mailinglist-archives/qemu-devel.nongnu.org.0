Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6AF339231
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:49:16 +0100 (CET)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKk2N-0006ja-UM
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKjsr-0000uv-0M; Fri, 12 Mar 2021 10:39:25 -0500
Received: from mail-eopbgr60125.outbound.protection.outlook.com
 ([40.107.6.125]:29349 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKjsl-0006BC-BS; Fri, 12 Mar 2021 10:39:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvCIzh9zxgId9J6qz2F8AXB34kwnVzyuQxlHswo5fK73KS77DIDBhjG+oyVYQxxWK6xa5TOKvOsVCWksy78jK2lHSkotuLU6MtLApByMvvlIi6HDK3VCD8HWRSyafXJWd+cglBf3FnDShfNdWz4AOSekHzMNQMSjhe6yhInhND/xnsgkPoJBmTgc3NkNNRZM6zPCE4lYjmt+93p6WrqbPfRwXKDQy8j+FOtN/FHD5SB1+7nkxtPfYA6vYaHuYK4cdnGF+Jerh7ISxOVzwcYA0/5CLfD6QtIcuzX+YMgw/FT5WrvW6PO6TXQmL0NgwAQX48eQIaNfS/KBTLSOy4RZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSt2IOuGeaZzySlLNfoYhDUtFYPEENXIdNJHgd2DyWI=;
 b=MSFMj8os/dLc9BqUDiZbFhk6LkuRMd7H58ePUfLpihAAzC/pME3a6/g3Au31Zmqwsktwap3DhAx+9c1FtEyFuyJgatrbp8a8NymasEFxUw5nzvvJuCyCxL7Isr7ecdd3HeHBnZo3ea6EySI/h98vQ9svNKqRuR7f7HwRu5Yk4qDlcwLy+hypgggXl0DGs9FHi9/jtnwBlRlo3jW+NZecUH5GRIoHFup04R6LZZ8kjC46kSErxkrDED168nYtDySQX60i0OGIZn3OUBmVQCLcdOoCND6emU2T31i2p7A5FbJR8rZad3DuEGqW6B4RAL664y3wzOZbvB5VnkHr6VWjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSt2IOuGeaZzySlLNfoYhDUtFYPEENXIdNJHgd2DyWI=;
 b=B1QEFaJS8kr+Mtye2dy8bgSVWVOEA+X9IfgRKWAPyK5gAkfhqjEBcDQPdiJogU+oXstH+SQfgSSfCkrB/khste6RKg+A08ppbABiZ+FAiqmRA0QcwyrJocwwtyylsDNvU97rYq1qFzmwWxjRkavG+x57fi7Hqt8mtnsW871amOc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Fri, 12 Mar
 2021 15:39:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 15:39:16 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
 <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
 <3035e3f2-ea1b-550a-0d3d-52aaa18d7bc9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fe615f6b-7415-1dcb-e17d-c18043e10301@virtuozzo.com>
Date: Fri, 12 Mar 2021 18:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3035e3f2-ea1b-550a-0d3d-52aaa18d7bc9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:208:14::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 15:39:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1ede5d-7ca5-442d-9255-08d8e56cfe42
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418D19DB9D8700FB0C43D41C16F9@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBf8RGK1azO6YsbYljIaz1hPl3ImToDhicKqW/2c2GaZcVfWvzGbzSlaE/cTf13u2OiSx2dCWCJ1C3YCI381cMUnUl8hTPTH2SzYX7hWhvblykeLiaptDYF5kCGiVi1VRAEXPDagK9HYL9A6M+urdc0PcPVyGwaBsBnONF0SOFLQxA/CcIta5AloGUfJjeJO7DG3ZKHxB5f7cu6w+rVzUGDyOiUSUzDJae4C/sfw+dVtyCH2A4d7hviBrx1xO+3pbU7k73fq3AgkSscHeh0YOFsBRO/D1BcwmJWWdwTP5LXgQ58lMDbiClXte5DIAI/v1aiGI8VcL6gKnz0yilcM5YWuVBswEctwh9aGhDry77a3gEwskmg6dtXseaiUr5AFRoNTMon/E/Gi0EiBPmPsn95FWc4TB2S+qRY4U52Lu0UwhIW1CewX6R3r7+Clhp0Cp4HoGMlbzLMOtbJg44zhTAEsPG72lmSNB2SVivzAlKJ/zrbVnobu5iaHYA2ZGvthskR4cj1cKvaBBt2piQbwt3gWmiw0J0eyG8fM1yZbI02xw/ThqrTPl7LjXFXyiipygVLVjzZ8Z4/D+ON78OC0RGmeigiHGe+kDTY41k2bQX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39840400004)(346002)(136003)(26005)(31686004)(83380400001)(31696002)(316002)(8936002)(2906002)(19627235002)(16576012)(36756003)(956004)(52116002)(186003)(478600001)(4326008)(6486002)(2616005)(86362001)(16526019)(8676002)(66946007)(5660300002)(66476007)(66556008)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjdjeFdKYm9yUUprREVubEcvY05MVjIwaWd5a1pQc1pPdXR6R3pvdm9oN3hw?=
 =?utf-8?B?WC9qUWpCbXYwTHduY2RvN3BLWlVSTDJNY1FNcmJYOEtYSTF6RWx3UWROZVpj?=
 =?utf-8?B?VnpORWYzbXVscU5uWkY4bFVaek9YVHZtQVo0aTNWbTBnWXg2d3hyNFlhWmRl?=
 =?utf-8?B?OS95MEhtUEQzZmdYbS9iVVdUSVRYc1ErUjVqdm1vVWFNS0Zmejl3ZWNmMkFu?=
 =?utf-8?B?amtpc2pXVUZkVWFsYzBKSG5nY2w2YTluWEZtcGVVbXYxbXVGc2JJWHJoVFN5?=
 =?utf-8?B?RE1ZZzNhU0N6NG54UndDdVpwTlROV0NrMVFGdDAwNE1ERFVJZGRYQm94aHd5?=
 =?utf-8?B?WXdMVk5aUm5GclQ1Y0tWYjV4MVZNbEV1RFlIbG0zRXNmdlJsWDg0bXN1bVRk?=
 =?utf-8?B?OFFPWVF0TUIyR0xxY2pkZzZsc0VTY2h2S1doajZ2azdYVXIrT1hOc05KdlNv?=
 =?utf-8?B?dnFyY1VwN0VSaUplcmcxWEpDdWthWUVOWHNnNGcvOTJhaHZrTGJicys3ZDBu?=
 =?utf-8?B?WEhsUThQSXJYMXU1Nmp5Yk1tcU9Vc0hPTjJIbFpiZGkyNXJsc1FWNTRTMUlD?=
 =?utf-8?B?b1JwaHQ1amJaNi9IRXlRcFlEUDRXNXdtYnU5dEdWNHNqVnV4THJ5ZTZ3R0Vv?=
 =?utf-8?B?emhDWm5jRXMrK295VXhnQjlXVGlnZGlWRmNsTmhKU1dyU1dJZks0RWk0Z0U3?=
 =?utf-8?B?QmtieVhvOFhuMTU2K2twV0tvRmR4K1JNeU9RWW1TT0ZwK3kyNVZDMWI5S0F6?=
 =?utf-8?B?TnVQSFB3T1dQd2NwMDVQNXZUZFpqaEQrV3hWeldteTI2Qy9QV0JzNTJZS2ZZ?=
 =?utf-8?B?VktoNTVsYUtnaDN2MEgvMUg4ZDdtRWJOVGNOdGVsdWtyVGoxb3RzdEJnekFo?=
 =?utf-8?B?MEQ3Rk9WL3M3ZGVvUFVReGljeEV6eVlQYWdxdHVKVkJ5WjNVZC9nWE8rSXN4?=
 =?utf-8?B?dW9tNW0rdEhOZjVuZzFnNWpWTDNjUlYzMGNCSlJKZ3kxWHpMcWdmblhwVjhZ?=
 =?utf-8?B?Vm9rNFl0OHdJTkxhTEhZeDlaWVdkaGZIb3d0d0FXc2creTJmc3V4UEdXcUwy?=
 =?utf-8?B?VDIvUk5CUll2SHRVK2U1RS9uK09tZDNzVG1pSlFFdHN6emt1Z1grOUF4SldC?=
 =?utf-8?B?RXdlVFNnd252V2lyYnd3eG8rbzl6bzFXeEVVa1VtTlE3MldEZ3dobHhXVml2?=
 =?utf-8?B?c05iU3JqR29mN1dyU2NCYml5ZzlzUDlIcGlNNEFvQ2dVZ3VvQlNGcGJmMTFZ?=
 =?utf-8?B?UmRHUWRFaHpzOSsvbzBDRHlKRmFNbU5wSURCR3U2R0pDYTl4SlA0UWpheXZJ?=
 =?utf-8?B?SHdYUUpGamk5dU5QNGg5dHZabit1NjgvVVpzdmhWOXlDNXVuK2hqSG5MNVp3?=
 =?utf-8?B?bFdTdDlFbWJEMTd3V01ra2xETkthckdUSk9xRkY0UU1PMFpRTlROMGl1bTNR?=
 =?utf-8?B?Y0xDYnJqdlM0MGdWODdNQjJPTkRZODNLTTJxOW40aEFNanVad1VkNEtHRzJ0?=
 =?utf-8?B?VVAwdFErZzJrbG5LTlVmbUlXc3RobUo3ZlhwcHBzMDdUMzd4a2ZBMlhRekJK?=
 =?utf-8?B?czlJQllhUEhXYSttVDhNd1RUMVRXZUtTMElRYTlwdHJPd1BKVldqVGtHQW1v?=
 =?utf-8?B?ZklneDFLT01XT3ZBNyt1dWZnSmlHRWlydXpzVWFXSFZNSXNTdnBhSE5HdXhu?=
 =?utf-8?B?cUtUM2ptaU0xeDY2VkxSVFBSbHNkdTluZzhBSzJKSDZpS2wwVUpkY2NyQ2g3?=
 =?utf-8?Q?fB3hBTbds+3DoCZcj2DMbsdDarzHbGm+MN6HJuO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1ede5d-7ca5-442d-9255-08d8e56cfe42
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 15:39:15.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfG+Dn8LOEc4LUY6bU1NY00BeYUQQih4T/HlcnqRBT0XtiQ289WOPn3Y7LqPUeSkJTibuVhAU403WuvGXjGzbk360fsb672Duz/CX3nQEzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

12.03.2021 17:58, Max Reitz wrote:
> On 12.03.21 13:32, Vladimir Sementsov-Ogievskiy wrote:
>> 12.03.2021 14:17, Max Reitz wrote:
>>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>>> 11.03.2021 22:58, Max Reitz wrote:
>>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>>> becomes 0) and reused during data write. In this case data write may
>>
>> [..]
>>
>>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>>>           if (refcount == 0) {
>>>>>>               void *table;
>>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>>> +
>>>>>> +            if (infl) {
>>>>>> +                infl->refcount_zero = true;
>>>>>> +                infl->type = type;
>>>>>> +                continue;
>>>>>> +            }
>>>>>
>>>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>>>
>>>> Don't follow.
>>>>
>>>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
>>>
>>> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.
>>
>> Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.
>>
>> On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt
>>
>>>
>>> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).
>>
>> Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.
>>
>> And about s->set_refcount(): it only update a refcount itself, and don't free anything.
> 
> That is what freeing is, though.  I consider something to be free when allocation functions will allocate it.  The allocation functions look at the refcount, so once a cluster’s refcount is 0, it is free.

And with this patch I try to update allocation function to look also at inflight-write-counters. If I missed something its a bug in the patch.

> 
> If that isn’t what freeing is, nothing in update_refcount() frees anything (when looking at how data clusters are handled).  Passing the discard through to the protocol layer isn’t “freeing”, because it’s independent of qcow2.
> 
> Now, your patch adds an additional check to the allocation functions (whether there are ongoing writes on the cluster), so it’s indeed possible that a cluster can have a refcount of 0 but still won’t be used by allocation functions.
> 
> But that means you’ve just changed the definition of what a free cluster is.  In fact, that means that nothing in update_refcount() can free a cluster that has active writes to it, because now a cluster is only free if there are no such writes.  It follows that you needn’t change update_refcount() to prevent clusters with such writes from being freed, because with this new definition of what a free cluster is, it’s impossible for update_refcount() to free them.

But as I noted somewhere else, update_refcount should not discard the host cluster in parallel with inflight write. It's not completely wrong, but it's inefficient.

> 
> (Yes, you’re right that it would be nice to postpone the protocol-level discard still, but not doing so wouldn’t be a catastrophe – which shows that it has little to do with actually freeing something, as far as qcow2 is concerned.
> 
> If it’s just about postponing the discard, we can do exactly that: Let update_refcount() skip discarding for clusters that are still in use, and then let update_inflight_write_cnt() only do that discard instead of invoking all of qcow2_update_cluster_refcount().)

Agree, yes.

> 
> Alternatively, we could also not change the definition of what a free cluster is, which means we wouldn’t need to change the allocation functions, but instead postpone the refcount update that update_refcount() does.  That would mean we’d actually need to really drop the refcount in update_inflight_write_cnt() instead of doing a -0.
> 

Hmm, that should work too. Do you think it is better? With first approach meaning of zero refcount is changed (it's not a free cluster now, keep in mind inflight-write-cnt too). So we should update functions interested in zero refcount. With second approach refcount=1 changes the meaning (it my be actually referenced by inflight-write-cnt object, not by some qcow2 metadata object).. Shouldn't we update some functions that are interested in refcount=1? Intuitively it seems safe enough. Nothing dangerous is in refcount=1 for cluster which is actually unused at all.


-- 
Best regards,
Vladimir

