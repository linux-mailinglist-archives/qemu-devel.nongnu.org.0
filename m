Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A439837389F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:36:08 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEsx-00077j-CP
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEps-0005mj-0C; Wed, 05 May 2021 06:32:56 -0400
Received: from mail-eopbgr60113.outbound.protection.outlook.com
 ([40.107.6.113]:54951 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEpo-0005Dd-OI; Wed, 05 May 2021 06:32:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjzcIzkhy+5jIdUVKNg3L1c+61Y0UVT/OvOBKI1rJM7EF7Fnwv3WiuI+RUBgYeE6KbhXy3WPraYTDl/Ldf1rex1vB+PA9B/INeWlb1QdRmt+BXwMhtXD7hEfxpGbWpwp3MWCxPgbAwZ08izDHvkWU+Ub8dlxE1WbdUEZCL1hiPeQNjfkeHHQCuvCfTYj36gRiC2udWSZGWnb29F6uGQp4zIVv8xjy00Jn0TTkklJ4cTCcwxvYqW7JfCNLPiHe7Ay4V7KVOUPBI9EeUUZkjd44i0kit8UUDkXFLeI7BV9l0azYe63HrLoOHNq1USmDJTNWnulb6scnJmUSRAHx7mROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esHlDOK6siW35n03cAned0OI4cN3uQkv7ghsejYwt6I=;
 b=ciLpQaYZFUvB5EgjpWURHGHjs2U6U8bWhB8lN9XgzO5z24imUcVbbmDqCWQTb4D9LjTtuPbVcxIFr+L4L9Ny7Vvw7Ugp2CZNQL3mfpqR64byanApOQVvWEVB/UewkGBlv6M+Mui3pgyhq0bk6NO08zFAe23wRlT9kieNGZPUr0GPP634oRnQRgjn4DS2ClKY2z2ZPEAetvVkT6/1fvcNVabENbtJg62LSwD/ny9AqiJh0IniwI1uPnfiJGr6GMYYtwxszMievmz2FuzNQHeX/rSgJ9nM62gDG36jr9qb2oKDcgS41YPS8P3if28vXOUCGRgF/XsUcw56gGm3N92G3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esHlDOK6siW35n03cAned0OI4cN3uQkv7ghsejYwt6I=;
 b=BIYOlK3cgAh6KTDvYfkMEplJdtk5BN0Rl2FOQPuHTzTZyPjwdoj2mTI59N+iyd/IlyIne6d+Rb0/QKnqXgxFttRXgGINcwDSTdoaWglCBHWCU8v3mEKXzCpkQVTLxYgS1cgmQg+6twCKD2gIVIzkAGptz5hgvvuCkV4NIcifO4A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3223.eurprd08.prod.outlook.com (2603:10a6:209:4d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Wed, 5 May
 2021 10:32:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 10:32:49 +0000
Subject: Re: Prevent compiler warning on block.c
To: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-block@nongnu.org
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
 <892d3ff4-a510-2f57-b8b5-69ff8387d2ad@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a4b44723-9199-9cad-9c85-c289c266fa39@virtuozzo.com>
Date: Wed, 5 May 2021 13:32:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <892d3ff4-a510-2f57-b8b5-69ff8387d2ad@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 5 May 2021 10:32:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a894c1d2-0372-4503-691f-08d90fb12142
X-MS-TrafficTypeDiagnostic: AM6PR08MB3223:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32236CC19FA2CE2DAC9143EBC1599@AM6PR08MB3223.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MKtIG+brjPyM7gzDELzspFEVjrDvGYoBJXaVAry8HEIZ22w59prBgCpVs947+i+y3m4Q71WTh3cwNF+5WFj5DID8IZa72e9HkQtqw1qZoW7pscOqSO76f/e0JR8lz6X73mtOr1z9LLMR6X0q6ar2qYeGIGEYzBylO8qw4WfRiXSmhtK98VubrzWwiTDfDMOt3N1rjudfUFkxq8nTePrY1lwYcL95K8Toueu5O4SYVCDSY6tdROBKtqLvk93Mw/0kdz+oWkfg//MDBTbvo56L1Z5lQSojR+YI1iBO8IoPnaDch9jCqUscnzK8WBauaYhBEUzio5aejBE6iDj7/wIqMFJSfkqRuEK9cmpbLmrrqrydgNraSuPJhL8V6UkbPPlJ+b2QzxUZ8eVQOiFZTpX4KN2P4djiR70LbFGtmiXI0guc3PpOCT7VsHYlTb0nh2kgUqXCadb4Nn3BIGJYx4ZIdUzbI/EksHk5KXAaqxAvAUMEQswE6eVUt3cnolL0Q6CWkifOpV6AaBnjMxMxRPu2ZUuinogOMuRXHVlZu7mh5pcKrGZTm3YGEGVmNnsUyAEQqUxdDjbeEw2dhbIY/HPz3DzcLRYwaBu6ymMF/71yg5/n+vPBGQzTC6M0jy2DekIpH4yaEpRApR2SnGvqGaRQ/je1uI4+OjDLQMmEsAM2QKefZqLkJoKeauJW0PEnDOR7gspx2Z9tCceT01/YcRAN4PdH6kD20sMbSwecKoK738=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(39850400004)(136003)(31686004)(53546011)(83380400001)(316002)(2906002)(2616005)(38350700002)(16576012)(4326008)(956004)(36756003)(5660300002)(8676002)(38100700002)(26005)(6486002)(8936002)(52116002)(16526019)(66556008)(478600001)(66476007)(66946007)(186003)(86362001)(31696002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkFQVUdpYzlRQnVMMFB3cGZzSUs1TUg2dWVoVGthT3JGYlBrSG4rRlE0ck0z?=
 =?utf-8?B?VUxNWiszanE2cXdxN2RNN0I4K1A2aWptRlY2c0NLVGlwR2laYUZZYXJUbW9H?=
 =?utf-8?B?cXI4aUx3dnNGVkI4UllQbXh2R2NxNVZOWW5MWTZrSWZ6NC9MS1hvdnlIVkkx?=
 =?utf-8?B?TXd5NG1CUHNnNldLZ1VRelhTL2k1Q3hkdWF1U29VQU93SzE2WWVjY1hXOFN4?=
 =?utf-8?B?Tldpc0pDY3k5SnpMUjdZY1FsZ2hGaEkwYmF5VjhoeXFpOVc5NlNqVDZSVVNS?=
 =?utf-8?B?OG0yYlhkWjBrbWVvbExCYjJWRy94Nzc0d2RpWUVBZ2hvUXNQaUU5QUFuVmIw?=
 =?utf-8?B?QjV5cGlKSHRrTS9rd2pmR3RvSjJWby9ubndyd2c4TkpVcnRicEUvZHZ2Zko1?=
 =?utf-8?B?U0NoQjg5UEtLY29VejFhek5TQml3RVdYVzJnSENNNjBEYW9vZmtYWnd0Mm1Q?=
 =?utf-8?B?bHV6WnpIUUluQTdaV1l4Q2ppeGhXdi9aVWNNNWtlS0EwTTZRUTQzTTkyMXBS?=
 =?utf-8?B?K3FLVnU4WEpjNWR4S1ZQS2E3UDhlaWN5ODd6akloandIVGFOdExaTTIzanRX?=
 =?utf-8?B?Y0NwV04vTitJY0RjTThveUZycU4rVXkyZUE1c0F1WmxvOUx2VFJTVTdjUzdK?=
 =?utf-8?B?anNhcDRLUVFhRTNzWGh1UzRzQUxRYVR2U0xvWmVibko1L0g5ZG9yV3dLUlA0?=
 =?utf-8?B?dkJ6ZVNBY0dndG9md2pPOGhaNnRmcndjN25qMW1oNFJiU0FtM0xlV0dSUDhi?=
 =?utf-8?B?dGJSZjZVTU1LZVZ6bXIycUo4OTVKN0licG54L1krWCs3VzdMOE1xTk9YOFQ4?=
 =?utf-8?B?ckRLUHZWc3hVaERyS0F2WVhUNlBQejZIN3FwR0Vzc2xQb2tacVgvRmJQQWFu?=
 =?utf-8?B?WmE4UmxjSURuMmUwVEVQeHROSWpsWkdkTklJcUpsc09SMk5FZ3FOanIwMzAw?=
 =?utf-8?B?QVVNd2ZmOW5yb3Bob3pWOWY1VXhEOEVrUytmVjMrYVExMU1DMDllYkVxcGl5?=
 =?utf-8?B?b0hLemxQWklwOVpJVCtlSWxuVGtqb3lIN3RVZ0xldHhMU3hrK2ZHc2g4Vm9H?=
 =?utf-8?B?QUpacGRvVFA1OXEwSHRRNWpIclVSa3JLMEdlMFd3bGRUSW5PQzlTN2s1VUt4?=
 =?utf-8?B?d0lLZ0RHQzNleVBaUUZVTjlRUVY2VTNaYUFaU3dQd3ZOS0xRZ2lyRkltREc2?=
 =?utf-8?B?ZW5EaGxFcWZxVzExWkF2bTBWUGtNdHFZNUZCR0ZOSDVUTTExdkFwVXp2ZWFs?=
 =?utf-8?B?bG93YjdraXhGK3lodHFHNkpaZy9WOFgybzZaRUVxbEdDRWRHV3RiSldXWDg1?=
 =?utf-8?B?eWx3MVpscjc4Wm02Wk02dmZKZkg4Rm5JN0pvMFVVQ0VFMzZEdXRFUGdQcW5M?=
 =?utf-8?B?YUlJejJzTStUanVhdEJGTFVGTjFLa2RJZm9HbTRJckxoOXFGZXR0WC8zbm5v?=
 =?utf-8?B?ZVU1d2hFUWRaQVdCRkdrRS9NaWMvd1luc1UrSjFiQXpwVFZhdTNtZVhpeTFK?=
 =?utf-8?B?M1VpbWcxayt3dmFuMUVlRE42RE9BSENJakJvSERGMEdUTkNqbUg0blQ2Y3Q2?=
 =?utf-8?B?eEdaVzdFWTNzZVN3MTFTRUdyNEhjaDhMQVF5dHZiaFRMbkh5TFprbnNuNUV1?=
 =?utf-8?B?V1dEbmpOSC9sbTAwN0JPWk85Tk03QklBVjlIYzdrQXNvV0FQMVJwVjdUUnY0?=
 =?utf-8?B?T29oZzE3QnNiY3hjajBYWEVOd0daNWNuTi9vVXI4NFJZcm11ME55TXhTNmNT?=
 =?utf-8?Q?AMNMLh0c1acybHQFUarqP1j/7MnQPbiCgTK18OC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a894c1d2-0372-4503-691f-08d90fb12142
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 10:32:49.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OJ44YkSxJWVB+kAW/YVz40M0gGEzyZpyeEctZG8/w1MOVf0P9m0jg0M97o55KyGXKcUTVETJMb3O7rI6MQXU+c1SNZe6LjD2KPdoLVszAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223
Received-SPF: pass client-ip=40.107.6.113;
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

05.05.2021 13:03, Paolo Bonzini wrote:
> On 05/05/21 10:05, Vladimir Sementsov-Ogievskiy wrote:
>>> diff --git a/block.c b/block.c
>>> index 874c22c43e..3ca27bd2d9 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -4851,7 +4851,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>>>       Transaction *tran = tran_new();
>>>       g_autoptr(GHashTable) found = NULL;
>>>       g_autoptr(GSList) refresh_list = NULL;
>>> -    BlockDriverState *to_cow_parent;
>>> +    BlockDriverState *to_cow_parent = NULL;
>>
>> May be
>>
>> +    BlockDriverState *to_cow_parent = NULL; /* Silence compiler warning */
> 
> 
> We can also do something like this where the only caller with
> to_detach==true takes care of passing the right CoW-parent, and the
> for loop goes away completely if I'm not mistaken:
> 
> diff --git a/block.c b/block.c
> index ae1a7e25aa..3f6fa8475c 100644
> --- a/block.c
> +++ b/block.c
> @@ -4839,31 +4839,19 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
>   * With auto_skip=false the error is returned if from has a parent which should
>   * not be updated.
>   *
> - * With @detach_subchain=true @to must be in a backing chain of @from. In this
> - * case backing link of the cow-parent of @to is removed.
> + * With @to_detach is not #NULL its link to @to is removed.
>   */
> static int bdrv_replace_node_common(BlockDriverState *from,
>                                      BlockDriverState *to,
> -                                    bool auto_skip, bool detach_subchain,
> +                                    bool auto_skip, BlockDriverState *to_detach,
>                                      Error **errp)
> {
>      Transaction *tran = tran_new();
>      g_autoptr(GHashTable) found = NULL;
>      g_autoptr(GSList) refresh_list = NULL;
> -    BlockDriverState *to_cow_parent;
> +    BlockDriverState *to_detach;
>      int ret;
> 
> -    if (detach_subchain) {
> -        assert(bdrv_chain_contains(from, to));
> -        assert(from != to);
> -        for (to_cow_parent = from;
> -             bdrv_filter_or_cow_bs(to_cow_parent) != to;
> -             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
> -        {
> -            ;
> -        }
> -    }
> -
>      /* Make sure that @from doesn't go away until we have successfully attached
>       * all of its parents to @to. */
>      bdrv_ref(from);
> @@ -4883,8 +4871,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>          goto out;
>      }
> 
> -    if (detach_subchain) {
> -        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
> +    if (to_detach) {
> +        bdrv_remove_filter_or_cow_child(to_detach, tran);
>      }
> 
>      found = g_hash_table_new(NULL, NULL);
> @@ -4911,13 +4899,21 @@ out:
> int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>                        Error **errp)
> {
> -    return bdrv_replace_node_common(from, to, true, false, errp);
> +    return bdrv_replace_node_common(from, to, true, NULL, errp);
> }
> 
> int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
> {
> -    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
> -                                    errp);
> +    BlockDriverState *to = bdrv_filter_or_cow_bs(bs);
> +
> +    assert(bdrv_chain_contains(bs, to));
> +    assert(bs != to);
> +    return bdrv_replace_node_common(bs, to, true, bs, errp);
> }
> 
> /*
> @@ -5262,7 +5262,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
>       * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
>       * That's a FIXME.
>       */

I'd prefer first fix this FIXME. Then, one more caller with detach_subchain=true will appear, and we'll see, how to refactor the interface in the best way. Otherwise we'll just have to refactor it twice.


> -    bdrv_replace_node_common(top, base, false, false, &local_err);
> +    bdrv_replace_node_common(top, base, false, NULL, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
>          goto exit;
> 
> Even nicer would be to move the bdrv_remove_filter_or_cow_child() call to
> bdrv_drop_filter, and pass in a Transaction to bdrv_replace_node_common, but
> I'm not sure if bdrv_replace_node_noperm and bdrv_remove_filter_or_cow_child
> can commute.
> 


-- 
Best regards,
Vladimir

