Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7B347BC4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:10:09 +0100 (CET)
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP596-0000R2-6v
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lP57p-0008IV-6z; Wed, 24 Mar 2021 11:08:49 -0400
Received: from mail-eopbgr80092.outbound.protection.outlook.com
 ([40.107.8.92]:39708 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lP57l-0003zk-Q6; Wed, 24 Mar 2021 11:08:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vrq/ss+0Vv3ACNQnQ0r2f5FhKAA84zo4uehE9bCtnO+1jnzYfU/xNFkhrJu3kUmYFabfyvpwH+hrKBcwU8aGNi2/LwOkXhVbt9wvWYFKdaWFU6+1iwFTab1GzH2a9vpvbztmv5Ii/Hb14GApLvuAp2Q3FQsqFFT1drMxj20DYfyPjxdYlVOAkrflNQtDSCGuLcDtoGTEL+f1IKEA3MsDj6ouhFkeEX18pVLe3taAhWB6XX6sx9SPFU0JUJJ5UovoaYAIfakzH8zB2Eg8IZwiPsMzzxxsq/hkaeqS/P+vvnfPBueDLkdDY7z0Tb+yL6ZnomHqwilvAux6+FPmo7kg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dbrm6ih4kYkm+Z2ObuMbYUOdF9t5MC1GOSvukAbFgg=;
 b=ViaYYFVdDzrPXu/Ryf1V2uJlI9VETzCZpoDRNjtKxX6uImP1KQt7+xCVwco43W2XwujiBVBmOIAvMJRVwgw9EZAB5PS/RKbGVTBQoYStjXhuB7nt+KpyCAFtiHDGoiVQIs09jv4Nt9Del9aROzuDMPbDNf1nVsRI2sK9IJKmuLIxE8RLtucMWa2Y3wRL79V/Bu05IGJLn+9ylNKIYlNvh1Mu0uv0dokC3IXRdVBbYzeYB17Ic1nLtc2Soq7aCanxcS/UUFxr67925q8qbIvfWojraaex9KVO5Fxv+za7AyQXJZXhJdimROGs1vGm24+GnMlVnytS5BCOwwsJlvDSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dbrm6ih4kYkm+Z2ObuMbYUOdF9t5MC1GOSvukAbFgg=;
 b=a2zVwdPP6uK/oAXQPPrPuHnOixFyE7PpWaAoIB8xyzXKdzFZLvclqGf7ADfu72iS8vZ6/sht0Bc94q8F1DuBZ2W8mInPc1lzoB8ISY32idkyglV442wN9V6UceGAM1cpwwr0G121m3kXQe+vctBSS6UF2iT0ZVQyx4FsEfx2ZqU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3624.eurprd08.prod.outlook.com (2603:10a6:20b:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 15:08:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 15:08:40 +0000
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
 <1a4ca40e-5924-4bef-d8b7-6a6b3eac32f5@virtuozzo.com>
 <w515z1gviul.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0d11e778-e23a-b809-77b8-31ac0c638201@virtuozzo.com>
Date: Wed, 24 Mar 2021 18:08:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <w515z1gviul.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 15:08:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c55ac2b1-c9ac-4714-aaa0-08d8eed6b4e5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3624:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3624A97E3B9961646911ADADC1639@AM6PR08MB3624.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b13o1i7R54kIw/6d95YVGLtpYMBOwALIokCjRo3WN75xmjcyI7I3VS42naZgb7ggv1llqWfDZbN7J+5DqsbdF4jQgvCM53pA3rwIf8QlHQF8HqwXXOANPNxssEXjy28eSDD43S9uS+69MRhPpCYxdgzjFSU2WTZM3RXy03t1HRFuGulXTUDCOwIk6Dos4NRBqgmv+8mMTkZBculNEr5WorczoiytVocsKg3gcrV55rTjU2r7VFWRDAeuQkHSXJTQn5NqvMkou2opezvKfOnyTIou/mIrGTDoDtJ5E7YEJQvXds2YoUN89MOSm77kdYSLMfLi6ggZQE+pcYDhg0qnXGiGH7nLthfKw8JqFE8n8WIshiztxg3KsFRfWDuVcBQCsu69T+COO1W/i3W8LnPEfA2sXc3Qc0fbWNGrUE92gA0wteshNESPIfjOFgQ3JolNDC5TmAN/5pi0k7BzOHG+OR5Gc8AnRiqH/u4f82+umbmoEuUKJuTD/4pMlgvnRG1DLkZah2/A6dCrfz60+bwHJqt0PRLawZ2eEKA38lGMlKyq3afLUpyblmwxDVnKAq1aW0InRXY41/bPJ3hp2QkiHWO5lv6rEVUfP73bVwVBYcBTgrtSCSWFiBRWNlfrawTk7KM4p9ZkNlOnjogFkd/iDwKYyHGTej5vUqzbBz+WvgzQcvUOoFjHnqvMeWUu0qCTidRY9crV6mVA/bJk5JmNUh3ls9TO4tC8HO6ixf3Cr/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39840400004)(396003)(366004)(16526019)(83380400001)(956004)(186003)(6486002)(66476007)(66556008)(66946007)(52116002)(26005)(2616005)(31686004)(36756003)(5660300002)(8676002)(4326008)(54906003)(38100700001)(16576012)(86362001)(31696002)(8936002)(478600001)(2906002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGhxZXBQOXdrUkJyUmx1U0V6V0U2K1ZrS1A1OGY3dThXWE15dFZ1RnlDN2wy?=
 =?utf-8?B?RW5rSlUwajBHMjhpN0w1MlQxOEU0My9oZktzWHk4K0dQZElFT3ZNNDBHa2Z6?=
 =?utf-8?B?RDRCVFFERGk4VHZaaS9pSlZONXBoWUNFR1dJZEM3UXE1RHJEbCszKzNoV0NF?=
 =?utf-8?B?RGN0RHdEV3RubTJ3VXlwditvWlFzdzdUdG0rSkE1MS9Xb3ZMV213aVZ3dkpQ?=
 =?utf-8?B?VTVDZEg3bG42bXc0WW9mUUoxNHVRMkhONXhzRUg0MkVFeVpxbUxFaHNSbE9T?=
 =?utf-8?B?L0VaZHVESG9zYUg1dnRud1U0Qi9GUzRxMU45dUJIWDcvbDNSRUcyNnl0WUs1?=
 =?utf-8?B?M0J3TEt5SXNpOWpKNkVIU2MwcHI3Z3ZGdWh4N3VTOHpxL0tnemNVUW9MSWxx?=
 =?utf-8?B?VVhMUkUrVWt4QnA1LzFKdERwQXl2WXRFQnN4N2UvRElaYnYyYjZqaVJvaXlm?=
 =?utf-8?B?RmdBdUc0cUN6eVlXd055WDZkMmQzV0cxanJLNTM3U0FyU2pKQ21FM0JyUW9V?=
 =?utf-8?B?c2xFVEhwaWtLMC9GeGgwQVlYR09PZE5uSXoxbUszckxvcCt1OUxTZWJ6bHcw?=
 =?utf-8?B?ak5Ed1dLR3Jqbmk1bWszdG80SEMvZjdVS1JTWlJZN0RxNHcvR3FYdUNYOGdr?=
 =?utf-8?B?NFNTZ2tKOGZIbkh4elBheHJrUzd3ZTZVSE0wT3ZOdWJ1WW9hbis5cFo5Njda?=
 =?utf-8?B?TmV1R1J6N0Y5K0I3WVMxc0FleXFxTVdTazdLMDZVNTN3NGl5aVBsdnBlc3pi?=
 =?utf-8?B?TXhmdUZ3MnFkeExzVVEyUUxDZXduaHpFMGxHQUR2ZldNWFUxTVJyM25sSTBI?=
 =?utf-8?B?ZHBsQWFkK1hlNktCd1FXS1lyTy9jdDExUDNrYzcwWmVDYXR3NFBoVzBFRFBC?=
 =?utf-8?B?R1JYUm9FQXRIc0svTStDZWZYcEVOYzk5MktZVDgxWXJzZDExalZXRk5hVFhv?=
 =?utf-8?B?SVVIaGNQeHBFamQ5WkxTVkNyNUtYM04yeC9aeDQ0WUhXMTJvcVg4a3AyTW5m?=
 =?utf-8?B?bHRJdFkyaVcrNE5Dand0NDl6QURKOFhTNDlmRU9aMlpwK1JYakdleXFOUzlZ?=
 =?utf-8?B?dlRkSnE1c1BFL0R4anV0cXNQSGtGRDdMSjdtNGZRWmhBVGZrRmcxN3FMTnlp?=
 =?utf-8?B?dW9weEkrd2pXdXVYazgvYkl2TjRCekExVFdFeU1oOVNyUGZBa1BUV0kzWFlh?=
 =?utf-8?B?anZPbGNaR1VLQ3MyaHVwYTdFSUxrQzJQaUhwWVdkSEs1SDZrNVNGR2ZIUHpN?=
 =?utf-8?B?MDh6OWxqYXp0MXdwWENYdkRjVnovTnpvYnBZckF1aTFTWVUrUzEvQzNISXpZ?=
 =?utf-8?B?MFF0dTBuRzU4bVl5dUp0cUppTE5KSVdRZzNoMmdlUi90cGYzeS9tY3A3MzVL?=
 =?utf-8?B?aHhXSXpmeXlnczVEL2lMbDZFYlltVTJaZm81NmYzNGZHNnI4NlpFQVFUTm9i?=
 =?utf-8?B?YjFDWFBGTTdhaUxRWkxoajZ1bzNzQ1lSMzltU2ZMZXgwK1FuYy9lbG1YVFZH?=
 =?utf-8?B?eGJNUW5Ob0VMS290YWhXaVdtWkREU3h0MEZ4cVByZE0vYVdEMHN3L0t4bVV2?=
 =?utf-8?B?UlAvOE00VFY3QXFVckFMV3hBNzIxMHdkSUNVcnhmUEdBckJ6SVgrdnJaNVN6?=
 =?utf-8?B?UFd6UG82Ti9vWkd2ZUdNb3RVUnY5M2RSQlhCNG43VlFBQTZ1eVp6Y3N2aHYr?=
 =?utf-8?B?RVNuZm8ydVoxZzdFaEVPYi9Kb3NMYWh0aGhDRUdWM2Urb01GaXpsTDZwcFZp?=
 =?utf-8?Q?n4JZC4XiwVte/Oj8Dq2L1ClTDhYIW8NDXrIWtVq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55ac2b1-c9ac-4714-aaa0-08d8eed6b4e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:08:39.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr9WwdLIJpLE3QDc3sctiqvsCuXsRTxR2ay99KNL6WdTUrwJ4NRH9PO4GxeMDA4webJ4uGMx2G6vVJPkhvc4OfkILsABSTeD1D4/MAirl9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3624
Received-SPF: pass client-ip=40.107.8.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

24.03.2021 15:25, Alberto Garcia wrote:
> On Thu 18 Mar 2021 03:25:07 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>>    static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>>>                                   BlockReopenQueue *queue,
>>> -                               Transaction *set_backings_tran, Error **errp);
>>> +                               Transaction *tran, Error **errp);
>>
>> I'd not call it just "tran" to not interfere with transaction
>> actions. Of course, reopen should be finally refactored to work
>> cleanly on Transaction API, but that is not done yet. And here we pass
>> a transaction pointer only to keep children modification.. So, let's
>> make it change_child_tran, or something like this.
> 
> The name change looks good to me.
> 
>>> +        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
>>> +            error_setg(errp, "Making '%s' a %s of '%s' would create a cycle",
>>> +                       str, parse_file ? "file" : "backing file",
>>
>> maybe s/"file"/"file child"/
> 
> Ok.
> 
>>>        default:
>>> -        /* 'backing' does not allow any other data type */
>>> +        /* The options QDict has been flattened, so 'backing' and 'file'
>>> +         * do not allow any other data type here. */
>>
>> checkpatch should complain that you didn't fix style of the comment...
> 
> I actually don't like to use the proposed style for 2-line comments in
> many cases. I think it makes sense for big comment blocks but adds noise
> for shorter comments.
> 
>>> +    } else {
>>> +        /*
>>> +         * Ensure that @bs can really handle backing files, because we are
>>> +         * about to give it one (or swap the existing one)
>>> +         */
>>> +        if (bs->drv->is_filter) {
>>> +            /* Filters always have a file or a backing child */
>>
>> Probably we can assert bs->backing, as otherwise backing option should
>> be unsupported [preexisting, not about this patch]
> 
> Yes, I see that this was added in commit 1d42f48c3a, maybe Max has good
> reasons to keep it this way?
> 
>>>            if (bdrv_is_backing_chain_frozen(overlay_bs,
>>> -                                         child_bs(overlay_bs->backing), errp))
>>> +                                         bdrv_filter_or_cow_bs(overlay_bs),
>>> +                                         errp))
>>>            {
>>>                return -EPERM;
>>>            }
> 
> I just realized that this part is probably not ok if you want to change
> bs->file on a node that is not a filter, because this would check
> bs->backing->frozen and not bs->file->frozen.
> 
>>> +        if (parse_file) {
>>> +            /* Store the old file bs, we'll need to refresh its permissions */
>>> +            reopen_state->old_file_bs = bs->file->bs;
>>> +
>>> +            /* And finally replace the child */
>>> +            bdrv_replace_child(bs->file, new_child_bs, tran);
>>
>> I think that actually, we need also to update inherits_from and do
>> refresh_limits like in bdrv_set_backing_noperm().
> 
> Yes, I think you're right.
> 
>> Probably, bdrv_replace_child should do it. Probably not (there are
>> still a lot of things to refactor in block.c :)..
>>
>> Hm. Also, using blockdev-reopen probably means that we are in a
>> blockdev word, so we should not care about inherits_from here.
> 
> But with blockdev-reopen we do update inherits_from for backing files,
> don't we?

We do.. But as I understand resent Kevin's explanation on my "[PATCH RFC 0/3] block: drop inherits_from", inherits_from exists to support pre-blockdev era..

Anyway, better to support it and don't care, and drop all inherits_from logic at some bright future point.

> 
>> Also, you don't create reopen_state->replace_file_bs, like for
>> backing.. On bdrv_reopen_comnmit replace_backing_bs is used to remove
>> corresponding options.. Shouldn't we do the same with file options?
> 
> I think you're right.
> 
>>> -        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
>>> -        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
>>> +        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
>>
>> Interesting that error-message say about device='', not 'not-found'...
> 
> That's because 'file' refers to a node name.
> 
> Thanks for reviewing,
> 
> Berto
> 


-- 
Best regards,
Vladimir

