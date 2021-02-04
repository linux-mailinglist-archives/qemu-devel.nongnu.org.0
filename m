Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE930F2BF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:56:27 +0100 (CET)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dFK-0007zU-9N
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7dDj-0007S1-2R; Thu, 04 Feb 2021 06:54:47 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:46977 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7dDf-0002c1-JY; Thu, 04 Feb 2021 06:54:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuAoXu5QmnYaIiTQeZuaXaHQAq1QPGEXB/+8uqAhewGzi5/OklhGFmENbrIWGbxoVsnHsh/pUCUte3qx6T9Elrx8uSMAfpJhTzE+yJcII0Ash8o1nZcfpnjOfGVjISKQ5Hvz4FVlHlRbWActWCFwf5+fNTNzUR8AecM0k4BsxGUsSC9T+kiPtBWJIJm7OlqdRxUm6eYM5VOIrSfVn7JREwfNv7ADzuwtgkjYazlML4NgIo36b4T+G4UUI9P5yd6deqylhroq8Bvvundq/tQrqhM3BhrDYif12T13csa24xuN6vPESlCSE4md2tgikxxLlY1BPMOQlAvY4Gt3O1dq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RraBYIfLgoze7G1FJWh7Byq95Y9+Y/zjpdk6xSnhe4o=;
 b=e6qIEYgaOFhIMgNu2x+nF8K63WnjssqcpRxCEU5iy+sCo9M+Bbby+i7F2y1pDdhey9A2hWc1ahbihnO96st/Y3klL8pggkCcCg3fD/JWzPXR9E7DVzA/HecO/OUzMMiTU7NXLWpCOr1BoKPHoPydLWgrmC9b032SEYo/6jq12KtZSmc0kAf7aWfgmYb9zmGol3GxpPkP+nM51Crglr/8jR6VEQ+5pNTKjeShCe/I62qo66bXV0ip93JRTi+Yz+YPGlB/l7C0S9e4ugE1elHLWYdOC0gYBDo+042pEj30EhNr4+G50EnLbUuS/TEI14Ti38VMeoqZfhVFS93q7hv+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RraBYIfLgoze7G1FJWh7Byq95Y9+Y/zjpdk6xSnhe4o=;
 b=VRKuGcnGWAEJQv9xwt6S8WQNSaWKKmhdYrCPty+/wudIaeLfbSozl97EPV5bkbyVxUt07jOBhaYYQxhj6FANGxGU1dhG9tUTKPxkSko9+5xOcyN9XpccbbbU5ndq4N96Yp/T1x//zt+Sd2pLjQr4iGg0TbEUnGZiy83TZDud89I=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 11:54:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 11:54:37 +0000
Subject: Re: [PATCH v2 23/36] block: adapt bdrv_append() for inserting filters
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-24-vsementsov@virtuozzo.com>
 <20210203213346.GJ5507@merkur.fritz.box>
 <a68bc8ae-3cc5-5f9b-e3c0-6e39b23edc87@virtuozzo.com>
 <20210204090547.GC6496@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <552d21a6-770c-2bb1-a9b6-9e351b4d9e42@virtuozzo.com>
Date: Thu, 4 Feb 2021 14:54:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204090547.GC6496@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM4PR0302CA0020.eurprd03.prod.outlook.com
 (2603:10a6:205:2::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 11:54:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe0f221-dfba-46e3-a6d8-08d8c903a5ca
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47248C2F6B16C7E7D53E1D58C1B39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1nsklsIOh80Hz8kqVDJIk26yg+U1IBI2CsTGSuSDEyzc4zcZgt+epGPaGDlAYm3dUGLRGpntvQ/47YX3thaGD25fuBaAk8C40hOwAq/ToesrtzssRdQ6/OkE81DmolPZ4BKeQk6jtv8H+B1b3RT8g8FrlFnLqMKLvw8M9yHKSfQ+/JItQwyOBgj/CgqNOQN+GmwI3jVoKZY74IbpNWdbBdoWEYayDtClQx/3i8VupKsuPywO7G9r/DUbCeWZPxYancKzMPQTtOovvGJjaCr++2jnqwqoHBNXIjOQSJtT/WDreZPAEtkZ9QFso8UFUXMwRS5toz2/nMENpoi4I/oaCKkl224iTc6sUeCsoONPeUoGj3GG7miiDWAXZt5lzBoALvJZ6rfXaG3jt9RxnTR5RCWzgK4GyuOkyL+lUAwhG7kHcFBY5oFjk7vToSQgZ5/iq9zL4tjp1izXTLvMDLiN3xS8UMFYrBHcrB7DEtcGgDynF3QlW1x1KCqBEWfvxvt9zkS4vJzSOhxt+9IWZGG4zJUJ4DnbgbDmM1j0Hi2R8s8CnqZkB6uOjT/v6LUIwoNv4usYiZsKNwvMGKB+f+rO4obiNRnF8fa8Rj8F2d4enfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(366004)(346002)(956004)(66476007)(6486002)(31686004)(6916009)(2616005)(66946007)(66556008)(4326008)(31696002)(26005)(316002)(52116002)(86362001)(478600001)(5660300002)(8676002)(83380400001)(186003)(16526019)(16576012)(107886003)(36756003)(8936002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlRIaDhYNHE0Y0VZTXN0NlNRNlhBY0FnVXNFazRBM2hpVzVkMFo3Z0lMQlZN?=
 =?utf-8?B?VGF4RXgzZytyTWVwc1dBZHZlQTNYeFFuREZKWlJROE9XcHhna21UZmc5Wkl4?=
 =?utf-8?B?ZVJMa29yc3g3dTdUVVFRS0tFMUJJVFI5clJtRkhEdlVSZUVzQjhQdUxrNWNl?=
 =?utf-8?B?Mkw0cklPQjZjekxHcVJ6Q2tuYkFVa3lQb1BaMXplQVdxZmlIZ0ZsS2prVVIr?=
 =?utf-8?B?TkJ0RWR3Z2w1RUh1cFpTbTE3UkdBbktzTmVqZ0tqT3dnaVVjSzFHVkV3RkY0?=
 =?utf-8?B?Q0pvWUhYUW02T004L25tRURuNWxDMG9aSVIwdVU0RXpLUDRwak9VSXZFaC9X?=
 =?utf-8?B?U1p4Q3h2a2FwVmRWQy9Yc01jaGFmVlR2UktDUW5mSWVjVUhzSjBzbkJtQ1g5?=
 =?utf-8?B?ak9nSk9MRkR3MVQyVTlxR2l3b3djZEhnMEc5OWJyQnVBZUFGaVBWZWV6Qkpv?=
 =?utf-8?B?Y0ozSjFJZzRSeHhneFNrTVoxa2dFdDBKQTJTOG5aZGU1aFgzUVZRMnU0ZjM1?=
 =?utf-8?B?NFVUaHZ5QkF4Skk2UGNKeWJlQ3VIR01QQzJob2d2d3pSQ01LNllXTXJlWTdU?=
 =?utf-8?B?VG01eEZFYjlvZkU0T3M5RVE3YTFGNGgzZ0pEay9VV3RySVgza0JWVG5ITEp2?=
 =?utf-8?B?RWxtUXdqdXBPM3MybHJEWmVvNjhyQlFXbVFINml6OHdET3UvR1B5LzlPMVNU?=
 =?utf-8?B?RzA3QzN3eGZkMjdSSVVxR01JRENVSDEwRlZPeFhjNERjSnR0WWI5U2RBL0Rr?=
 =?utf-8?B?TUV5b0VUUFN6aGt5MHJwQXR5R2VZUmlQSG9lcjBzZ0s3M1NDdlU5N0cydGtQ?=
 =?utf-8?B?YXd3L1U0bEQ3K0QvZ3ZIbDBWVG44ZFNhN0tWeXQ4Y0JHQnpSZ0hOVFQxTzhM?=
 =?utf-8?B?NmlVOWFrRFFJak40QS9hZXFoU0M5RXYvM0VHZk9VWFZuSkVpbEEvNUppMXIv?=
 =?utf-8?B?L0VnOGVzU1g4MWxJdWI2blNSa2VibnhPZm81Q2Y0TE96aUd5UUtoc0Z6cWpI?=
 =?utf-8?B?dFN2TEd5WDFxSnFqNXAyUVhSMW9GRWNLM0d3SHZCdktOcGtTaU9KSGI3aUdJ?=
 =?utf-8?B?c0ZKTHA5VVo0cVJQOUg4MWI5Z2haOEdVbEs2UDh4MkdBSEk2bm4zQmtLMGlj?=
 =?utf-8?B?dHpwRXN4dHlMQmFRY1FRcFVYOWgxUWxUZGkxUlB6SHZXVDBVcnJoNTJlSFE0?=
 =?utf-8?B?Z255c3VqSW55ZVJLSHd2UGszbFRhUDhIdkRQa0lUK0liN3E3S0w0SmwwTGpF?=
 =?utf-8?B?YXA0eC9yL09kUzdNNXRtYjg5RmcySGk2b2J1OXA3Yk91b2xXRnZWWVFYckRE?=
 =?utf-8?B?b0RyeTlwajZKRmFMSmpXYTJ3dzN6WEVZVGlBTE4venptOWwvN0pVaE9LOThP?=
 =?utf-8?B?MlVoNHo2d0VrZXFZclYxRFBSQ2I3b0ljR0pMWTQ3WFBKU0NuRG5TRXlrMTBZ?=
 =?utf-8?Q?BnOEpYnp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe0f221-dfba-46e3-a6d8-08d8c903a5ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 11:54:37.8861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJA7PeIfu0DoovehQQD1ZJwI2gtu+rENxF3DkocBb2itIdwnsIkqX3uJMQHskft4z9qchf3sFqVL8YOlZ+NrTtt2GnYgnrukkaid+18iy3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

04.02.2021 12:05, Kevin Wolf wrote:
> Am 04.02.2021 um 09:30 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 04.02.2021 00:33, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>    int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>>>                    Error **errp)
>>>>    {
>>>> -    Error *local_err = NULL;
>>>> +    int ret;
>>>> +    GSList *tran = NULL;
>>>> -    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
>>>> -    if (local_err) {
>>>> -        error_propagate(errp, local_err);
>>>> -        return -EPERM;
>>>> +    assert(!bs_new->backing);
>>>> +
>>>> +    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>>>> +                                   &child_of_bds, bdrv_backing_role(bs_new),
>>>> +                                   &bs_new->backing, &tran, errp);
>>>> +    if (ret < 0) {
>>>> +        goto out;
>>>>        }
>>>
>>> I don't think changing bs->backing without bdrv_set_backing_hd() is
>>> correct at the moment. We lose a few things:
>>>
>>> 1. The bdrv_is_backing_chain_frozen() check
>>> 2. Updating backing_hd->inherits_from if necessary
>>> 3. bdrv_refresh_limits()
>>>
>>> If I'm not missing anything, all of these are needed in the context of
>>> bdrv_append().
>>
>> I decided that bdrv_append() is only for appending new nodes, so
>> frozen and inherts_from checks are not needed. And I've added
>> assert(!bs_new->backing)...
>>
>> Checking this now:
>>
>> - appending filters is obvious
>> - bdrv_append_temp_snapshot() creates new qcow2 node based on tmp
>>    file, don't see any backing initialization (and it would be rather
>>    strange)
> 
> Yes, the internal uses are obviously unproblematic for the frozen check.
> 
>> - external_snapshot_prepare() do check if
>>    (bdrv_cow_child(state->new_bs)) {  error-out }
> 
> Ok, the only thing bdrv_set_backing_hd() can and must check is whether
> the link to the old backing file was frozen, and we know that we don't
> have an old backing file. Makes sense.
> 
> Same thing for inherits_from, we only do this if the the new backing
> file (i.e. the old active layer for bdrv_append) was already in the
> backing chain of the new node.
> 
>> So everything is OK. I should describe it in commit message and add a
>> comment to bdrv_append.
> 
> What about bdrv_refresh_limits()? The node gains a new backing file, so
> I think the limits could change.
> 
> Ideally, bdrv_child_cb_attach/detach() would take care of this, but at
> the moment they don't.
> 

when answering I thought that it is called at the end of a function. But I both forget to write it in the answer and was wrong :) As it's actually bdrv_refresh_perms().  I'll add call of bdrv_refresh_limits()


-- 
Best regards,
Vladimir

