Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9F37262B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:05:12 +0200 (CEST)
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp7I-0005EL-0g
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldov4-0000pq-C3; Tue, 04 May 2021 02:52:34 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com
 ([40.107.0.109]:13308 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldouw-0002YJ-LF; Tue, 04 May 2021 02:52:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYw/PKAGtRs4nniOMILj+8BVZikQtywF0T1A5CPgOLFfQf2R1ePphTirMYzPrJ1p9nZD8J2As0zbVvVOdJ9DEGPy+1ANzUunmLopZ2C6Qt9wbqjKTwANFcfPz0eMDuQxHsGW2+76FOS5qCoNutZk+S4BFB/DUM5B045KppSIM0prv5FlSHv33k103JfRsPn4PhVrEk01Na39LWsiW4ommSLCNjcEyzCGKPN6snyRS2X8AE4d0ZqEyrLRu+3nGvagOICAtnt4KGvhOUYvlhqSZaaaipCEy+PdznbP9BD/bu1ZPtn3jSQ/EE+z7REcwAv9TxvGckhj/gbx49zH5kvdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnjHNiPZLnn0fSWd9fwiOy4CSmZaLVdj90C/kDABbU=;
 b=ju0VZ9B4vsxmb8pW4DYmxH9/qKojDhRtyiSknH/9qDgPUHc35mgqXXKDS60pUJgDWPl1bz5VIE2JEy6qqnsq8QwmGcde+kYjZ0ki0RrLXxTzqkC4QWndO2U4eqo9Ibok7VU09V0tFKHvNup72ciQQhqnMlNBtMJBLodJkaXNNdvcwN5nV8TAuCh7kEA2o4sloU3UpzFunzoVqULUtiosfDgSMZRTKZtubmLzj3T/C6tAITfO+nClp4vQCT9c36X47H9qw8l6BGx0Low/2g5f/IJeYgCSWQw79kIP2z5TfsZ1aMwqmsduu3FvgU02fQ3R71xAdkrglFemWaLTVfCWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnjHNiPZLnn0fSWd9fwiOy4CSmZaLVdj90C/kDABbU=;
 b=u2bQ8iMINv+kaVaWWk2+k7/xQz/U3TwcHSvKT150Nf4xgtU0CtUSqXYPDiIn9ZSMEhIPy3Q6QnPriaXCGio5r3QI8U8nK+RWcHe2qWK5gOhc3b4w604q1z3l3FeJoUvQ0GU1hmxxyrSZlZZ4V7lQc4U4yltt+W2xd1qHtL6U8jY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Tue, 4 May
 2021 06:52:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:52:23 +0000
Subject: Re: [PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-3-kwolf@redhat.com>
 <ca5be7fe-9468-fce0-6f23-4d1c4c8ad1fb@virtuozzo.com>
 <YI/vgNBevsswQXe+@merkur.fritz.box>
 <72a09cc7-383a-0818-7edc-dae75979a264@virtuozzo.com>
 <YJAJoLY8P2u3+hrx@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dda1d6ff-3936-409d-2cbb-60d22626721b@virtuozzo.com>
Date: Tue, 4 May 2021 09:52:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YJAJoLY8P2u3+hrx@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM0PR06CA0130.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM0PR06CA0130.eurprd06.prod.outlook.com (2603:10a6:208:ab::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 4 May 2021 06:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78135484-a00a-45d8-891c-08d90ec92bc7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4852FB8C9D89A8953C5DA809C15A9@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFOJh3Sh3LRX1v26SkAUgtXyfD6rmum1fVP2Qb1o92Qgx19a3qjHNdSdUBictRsMHFrTl+qcP0Cuk5U3DnNSfJRdcDMo38KVL24YmBGdgH1hj3KLCH1Y1RcSHj4eeyzs9e9qPnAS7lvPrndYOsLkHyEPM1TbbfOgCTa3jnPYlyPmSp60yPZtyI5aG+YGb9CVwcbiz0Z5M5366Tve/Ag8GMTKw65VK1QFduihyOu1Ojf3+9pjnXLtJvKbQoB2Pgvdk5D72AAvVpAMNSiU8TA8IlDL/m5Xow3TghM0dOvkBy+ZO9VOarkm62aG8WXnzeqZMOnFjNAlSKTFcW2MPLyxX6PtT+2LTbOapZ+UmtPaQCL17lf0Df19dzNZgCU51pJmJvocDFpwvJ3CQBjKuxGHGtczybY6aWBuWoj7JNlFMpyYx7AllUoATnDYQ63x406m/aD3lYEg4JK63kuQApoUOrraADtJIcNgBGrURf01P3WOrkkCsoE19ZwcwCcIaLJqE4uokPgd2w1QB7KIObfdDPJJiFmg130NRveotCYlHprbF2A/Dn1jEQSkxoTGPMYEfGEXCZKzsliVhkAV7Od/GnCrZYBpYW8oS5FEdph4kNqbFMZGWouzZQXInmYjAWe6uLiWZddwKb0a01FCRJOe3r3i5Fwymd7FxHzvQyVzwJxW3j+nP5pTX+2+UvMs7OwqIXekrRG8vqZ/JMn0aCs1xfEllTUQKMNSOmTEs4mMRnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39840400004)(52116002)(316002)(2906002)(36756003)(5660300002)(8936002)(31686004)(2616005)(16576012)(186003)(38100700002)(66476007)(956004)(8676002)(86362001)(38350700002)(83380400001)(26005)(66556008)(478600001)(6486002)(16526019)(66946007)(6916009)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWNhK1kwUktSUnM0UHF0ZFA2bWsrcFpHVlVMZHhxMktlemFJMlY5OUlnVFUr?=
 =?utf-8?B?Mm9NZVltQUt1WWVSUVFlVXN2ajRuMGFuWHNoNjg3WXZIQTVZM0doQ0t2cHZk?=
 =?utf-8?B?ZUUyTkpPMVVkcUxpZ2gyZ3lJTHFJaGF3Rm13K2lVQjB6cnFZVWwwYWtXYjA5?=
 =?utf-8?B?aFJKby85czUyUnlVN3pwWXRlb201dERuQW42ZEJpeWJNazJsdmJiSTNXSnFB?=
 =?utf-8?B?ZUpLOWw3Uk9zYlRkdnd1OWUyWXdQekdnODI5TjNNcmpUV2FJNW5JU1labGVy?=
 =?utf-8?B?R2xsY2c3a3NYNUJrL2RudmdyMTQyNHlraXJWSHVXMHpERlhqN09oSXdkbnA2?=
 =?utf-8?B?b3d6c3UyZmRGdEswQ3FiZkZVWmhXdDVRS1NBWFdoUU81bkxFclQ0T1RIa2lr?=
 =?utf-8?B?QVB2L3Avam11aUplMW9FYWNYT1VpakMxdnJqTWFJNlVHUHoxQi9kNFcramVa?=
 =?utf-8?B?TThpeGUyQjlMWW5ldTV4ZHp1aTdwanBzRzJ5dnBaSDRoWUt6L3F1UVIvRGFu?=
 =?utf-8?B?ZzJydFZnMWZCZndiSElWdG5pdlVVcVUxTlBRVVlIUHlGcU52Y3VmWUlmTEEw?=
 =?utf-8?B?ZlRVYklHTUJxNXY4Sjl6SUVXT0wwcHN2TXRnbVp1eU5JZ3ZRajFsTlBwbWdo?=
 =?utf-8?B?Zi85VUFEQzVwU2xwdkQxcFI1cHhZc0t1UklhdXRHc1dJTWpERWF3ejNpZmU4?=
 =?utf-8?B?MzdSTjBnZHRBMlZEUzZIYkY1MEE1TnhtNmNFYjlhTUhGOUJ2dlBLMHIzTlE5?=
 =?utf-8?B?aDlyeWd0MDlRYjhmZE5kQkFjMUVqZ2xxY1Z2UEdBTEQ2UHRxT0kyQ2lnc2RF?=
 =?utf-8?B?Y2paZjE3cmhMQk1nRXR4RVYrTUEvZk5OeUdGc3VtK3VJaGF0R2xuVWxZN0xK?=
 =?utf-8?B?YkZhWTZlVzZoRU5PcmNJT20vdTViV1lBWXBpZVFOYTVSUXBreGZ6SXdEVGVT?=
 =?utf-8?B?TS9OYXRxNUJDQ0hZeVU5dll5UHh3RkJ2d3U1TVdaazVFOThTZXVMMVd1Mm5q?=
 =?utf-8?B?dU41Tmg1d0drNEMxNWNyOW9zVkJ4MmE0UWNRaWJXRlM5bDlnRGpJNmZUSnM3?=
 =?utf-8?B?bnNMM3lpUWJ1TzdHSTNxcGcyMklQZGFwemF6RlROTUdDZWtjaFdVbjFDdFJv?=
 =?utf-8?B?dmZFS0gzTXhJK0xXMm9ZU1BqWXBneElhSUlRWlloSzE3bFhESkNwS3lWNWxL?=
 =?utf-8?B?Z1NoN2lDNFlxdncvcjZJVE56dHM3RS9IMzJ5ZDZuUUpNYUF0ditHL0RqVExl?=
 =?utf-8?B?TVJSaWFTRXR4bUtYclJXOVJ5Vjg3NlJPajlQL1VGQm5oajgraU93RHJoeFF3?=
 =?utf-8?B?R0FlbXNVNEwvYXVkRnBtYmJCOEUrTG5HcjhOMEZFYThKakxLZEFQYmFYV3JJ?=
 =?utf-8?B?eHJhNk5NR2RYVk5HS3UzUXM3b0Q3RTVSY1VUQS9BaEhFb2ZmWEFRb2Jwa0R6?=
 =?utf-8?B?cUZIM3RsQ1BXK3pTQmg2cEwyclNsam9lTy9VS0l5SW5CUEZFclBweDlSY3M2?=
 =?utf-8?B?TjRlcWIvODRBYTdXVVNkVTVTRkRaMytDMVpmb21uM3doa2UzR01QekFtY0hT?=
 =?utf-8?B?UFhUcTdKZkZQRDdQUzk5Ti9rZXNWNU43cmZScmRzUXZ5eG1GZVQ5LzFpcGlj?=
 =?utf-8?B?OXUvZlJvRVVSdW9tUm9PQlVJNDdiUEg0NXEyUUhpUUtWb085c2UvZFJmRTAy?=
 =?utf-8?B?MGdWdUhyRXdIb250cmtQYk5nK1UzMnV2TFNMNzh3cVFSMkxRRk1qdlFiTlk5?=
 =?utf-8?Q?CZ0LnmDbjgWpqPB7/SxEnECnnvg9fo7bU0AjOyu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78135484-a00a-45d8-891c-08d90ec92bc7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:52:23.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuDZIT5rOvNmvj4bcJWpC4iQ6wMPH07Lb5jOBdSrkv3zPbS2YMzon/wed0RXQBRpuX5Uw5Vkg7LXDOluWxWf6tFccb24oEXM4mMytSwKqrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.0.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

03.05.2021 17:33, Kevin Wolf wrote:
> Am 03.05.2021 um 15:09 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 03.05.2021 15:41, Kevin Wolf wrote:
>>> Am 03.05.2021 um 13:40 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 03.05.2021 14:05, Kevin Wolf wrote:
>>>>> Like other error paths, this one needs to call tran_finalize() and clean
>>>>> up the BlockReopenQueue, too.
>>>>
>>>> We don't need the "abort" loop on that path. And clean-up of
>>>> BlockReopenQueue is at "cleanup:" label.
>>>
>>> The cleanup of the BlockReopenQueue itself is there, but not of all
>>> fields in it. Specifically, these lines are needed:
>>>
>>>       qobject_unref(bs_entry->state.explicit_options);
>>>       qobject_unref(bs_entry->state.options);
>>>
>>> The references are taken in bdrv_reopen_queue_child() and either used in
>>> commit or released on abort. Doing nothing with them leaks them.
>>
>> Oops. Somehow I decided they are set in _prepare.
>>
>>>
>>>> So I'd prefer Peter's suggestion (my "[PATCH 2/6] block:
>>>> bdrv_reopen_multiple(): fix leak of tran object")
>>>
>>> I don't like it because I think every call that doesn't end in a commit,
>>> should jump to the abort label to make sure that everything that remains
>>> unused because of this is correctly cleaned up.
>>>
>>
>>
>> agree now..
>>
>> Still, don't we miss these two qobject_unref() calls on success path?
> 
> No, they are put to use in bdrv_reopen_commit():
> 
>      qobject_unref(bs->explicit_options);
>      qobject_unref(bs->options);
> 
>      bs->explicit_options   = reopen_state->explicit_options;
>      bs->options            = reopen_state->options;
> 
> Kevin
> 

OK then. I should have checked myself :\

-- 
Best regards,
Vladimir

