Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13342D7BAD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:57:31 +0100 (CET)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knljX-0002br-0S
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knldF-0006UW-Fq; Fri, 11 Dec 2020 11:51:01 -0500
Received: from mail-db8eur05on2102.outbound.protection.outlook.com
 ([40.107.20.102]:47040 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knld9-0003Rw-Bp; Fri, 11 Dec 2020 11:51:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGBiGcB2YE3btaN1vv0uItdlpMUjE1fpY0cKfvLSh2ibEhaeNSEHVVA6LZL3NCarqUTNgd/G2evMhNHyCR9ZmzEr1YFYDkJr6n6hykFtLaMo1dIUKqiWmx7KobjYwgtTXMcH8le8hSoFehgLkwAM4nvC/SKSONDjCdlnF2Asom4Atl00kwvTS3X6/wPCp477xbYWQqKThV9CjrneoYnnu4dOU1+vt0wA5ixBcNC+JCfrNf1SqoyuIs69Y9WFEXT3nKoJiNHN/EXzQcZ6htTD1PWwqdSCUO6tlbgyHmDIg8xjovslUD10dRR2vZ5Dx2uSZLxGkPeTyUGeFQRkM2IDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uef4UFr2UDESFFpRlhWZWQdS0p9Ic+a+lVR498B5UcQ=;
 b=AUio2RGKO7y0TIvNL3S2cxcqIWiNLa8NLJqC2RuYFyQ88u6Dv8AGsaFmG5E97QcFF/KRrJLySGSphpaDaR0nPotk36/ebTZ1b2fPdcWFRd8Nqx8jJMJmNk0Q+HL1v5r3xRc/8nYZpbwlT2dtFzSmG3CcjnyKh3Wq0dUQGfzrJg4/vjxHlsmD6LG38sJuHEHfMAo+MiyxZqjuSwae+f/6mBxVaPEbaSHNr51lInwP606yWZFVYpcbZ3ymsgk4IxbpVrckjRPdOf3kDzPsncGICKRublYlBZgvRDrSR77AvMi36ImmbiwPPu9gwPA5uQGhjIrEPB6b6YMpIfYlu7okHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uef4UFr2UDESFFpRlhWZWQdS0p9Ic+a+lVR498B5UcQ=;
 b=p7zH5ddXaRJzGCFuNvYHb116yXAWVOQ8EodmoosJ8xgLxDREJSLD6iKsKPhzaCcenz8RYZhyrBniKZzGwkVFMZ49G7X3BiI8jw26lEFtlZAAkTRE+TyA2yNDzuZ19GLbDIZbf6jyFoND1nsdmN0wVzlEAzSzjE/H3t4enqKFzYg=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 16:50:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 16:50:49 +0000
Subject: Re: [PATCH v14 10/13] qapi: block-stream: add "bottom" argument
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-11-vsementsov@virtuozzo.com>
 <79993af7-1993-5af1-d343-04f208b03d73@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9e131589-84b5-761b-3e26-c4e8eb32ec09@virtuozzo.com>
Date: Fri, 11 Dec 2020 19:50:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <79993af7-1993-5af1-d343-04f208b03d73@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR07CA0099.eurprd07.prod.outlook.com
 (2603:10a6:207:6::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:207:6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Fri, 11 Dec 2020 16:50:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995aead4-9b44-4224-4889-08d89df4e9ca
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47881605890BD56EAA1B83C5C1CA0@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxHQEMYzP+mR/KicPf34/QsHKPsuU7sG+Wz8N1T2Sssw+tbxq6tDBNbBK+P5j5RjNqO/LgZb0vsZs++BRflYho5329Xxa6AcmUFdr6+/UV+/jvitfIfe8qoktIZb3Z7cENiCd5jCXov7jtFawciP3oQYi5NklO5MdoD/8HwSn9x6q0k2ZxmY8b5r6XLgStcrinKd3yiYs7rZ6XCynlDhC4dN38tZr+Bq99HmhNptQTIkf56LAP6lrI44kzuAEOJkgqW+5ypUhZJ8x1NNSAvX2VQgAOs65MIhAjJ4Pd3AKVPeAITC2ryQK5yxDkRHzp40TKe1ze8gS5cNAmEAJtcImvXpSpf/veQvCslfLZlAZ5uq+e2OYpw5qtT16OI0m+zxxjRbC5hVXwM3pMenBa+aY+cFTgf6+N7nKd+f4P0ptmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(478600001)(8676002)(31686004)(5660300002)(2906002)(8936002)(66556008)(66476007)(86362001)(31696002)(4326008)(66946007)(52116002)(107886003)(16576012)(36756003)(316002)(2616005)(83380400001)(956004)(6486002)(186003)(16526019)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVc4UHNwbkxaa25weUhKdFZvSG9ZTFcvbVpVaUxET2QyckhNSXFlMG9oSkhJ?=
 =?utf-8?B?RXNtc3VWSkJDRXJjRTdXOVN6Q2dIeXFucFZBNEdBbmloYnAxTEdtN3ErMkR6?=
 =?utf-8?B?WlVCWUxvY2hGZzIxeDc5WVZlSEJPUDZKa0toNXBYeWdHazRxZkRBMjZ1Skhk?=
 =?utf-8?B?WjRscCt2SURmMkRMZ2JvWjVQbXh3WmhtWVgyb0UvQTVKSDJOdlRYdFVkZW5y?=
 =?utf-8?B?YUs4SXhGL0FyWlk5U1pLcXNMbHRMTVF4M3ZEOWJ0MkFiMHFSZ0NxM0NmVTR5?=
 =?utf-8?B?Z2lFN2daaXk2Sk1MaGFYU0xZWklvamZydEo5ODJMdjZQTTdrbzhyQnFRMDhI?=
 =?utf-8?B?NnhDeFdzNDBndllaWUdla3E4NFhDZGFTTTcweW92U3ZudlRuL3pja2dtM3Yw?=
 =?utf-8?B?Y1J5SkR0YkppMFVNdmJyRTQzNXAzZlAwVlo3Si9vVEVhWXJvbWRJM0dXM055?=
 =?utf-8?B?MytLSThZTmwxVlhkb2RYSU1DTDkvOUlncGJSRlRQS2JXVmtHY1JZNnRhRlNJ?=
 =?utf-8?B?S2gxOXhKamovRlNualk2N1A4eFpGMk0zUUQveUhqWWh3OTNhb09NaUNhTEk4?=
 =?utf-8?B?Y2pONDVkeEsyTjF6ck5FWm16REJZT0F3aEdTMGhIZjZKQVcxUTFZZ2pNSFlz?=
 =?utf-8?B?OWZPZENNOXo0VUhQOVo3Ykc5L3lNQXJUeUJZOTNUaHczMkhRRVZLWWpuWXhx?=
 =?utf-8?B?SDZ1NDkwaXowK3JYN1J4K0lVZDA5Q2ZPdEtOODFoVmVUZDF0L1VTVDdSZ0R2?=
 =?utf-8?B?UHl2N3Q5eG9Ua0pYdkxvWTRsWkx2OStlaXJUR09pM2lDZFNTY3JCcDNpcERj?=
 =?utf-8?B?VEFUMWkzbEZ1YlhaR1k2d3NwR1lyWE9NcEFZcENGWEkxQzJ5YWpMSGl1ZHd2?=
 =?utf-8?B?eUxnWWhMSGJabnVacEVjVnBCdjkzQTUyVXBhUUM5aHdjSThzNWVsOFh4ZjJl?=
 =?utf-8?B?d1M0dHJ1OHJMZVA1ZUtUZy93S0F0S0xoMUo2bUNKZDlCZmxJbnk2b3NyUTVW?=
 =?utf-8?B?ZVhvUXh6UHdyTzRLSy9ZcXl2VGVYeFZpWEgwWkgrekRoa2xjOXlUcng5ckhW?=
 =?utf-8?B?aUlHZUpkdTBoc0xDeFA5cFNUbHh0THdYTlJFT2FSYm8wbjFhZTU3b1l5T0xp?=
 =?utf-8?B?S0NLN2FJczFBUlZNYjBIbWgwWlhrVXYyRjAva1lPVnBFUUtlUWlTWmFyWUtt?=
 =?utf-8?B?OXlJZm84YkZZaFMzR1hVb1A1ZU1aa2ZZcUFKSldZRHZQUWVqY094SktaV25S?=
 =?utf-8?B?Rk1jY1l4MXNVVzNBalRkRzV2MlcvSDRmNm9vMnB0aGwvSzNTU2loZWZKS3pN?=
 =?utf-8?Q?UYSBsJJ6RhwyKr7+3imnjdj93kSqNSaNys?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 16:50:49.1629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 995aead4-9b44-4224-4889-08d89df4e9ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM8TkV48reqPdqKPIaEh9Z57F7mqz0nWhaTVgMyo0x5Zppy/WANa+gOt5VY0KU8iO8TdSgg2Y7YRwVDMzwfQHzU7sighyoT5agGONLjhJg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.20.102;
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 19:05, Max Reitz wrote:
> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>> The code already don't freeze base node and we try to make it prepared
>> for the situation when base node is changed during the operation. In
>> other words, block-stream doesn't own base node.
>>
>> Let's introduce a new interface which should replace the current one,
>> which will in better relations with the code. Specifying bottom node
>> instead of base, and requiring it to be non-filter gives us the
>> following benefits:
>>
>>   - drop difference between above_base and base_overlay, which will be
>>     renamed to just bottom, when old interface dropped
>>
>>   - clean way to work with parallel streams/commits on the same backing
>>     chain, which otherwise become a problem when we introduce a filter
>>     for stream job
>>
>>   - cleaner interface. Nobody will surprised the fact that base node may
>>     disappear during block-stream, when there is no word about "base" in
>>     the interface.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json           |  8 +++--
>>   include/block/block_int.h      |  1 +
>>   block/monitor/block-hmp-cmds.c |  3 +-
>>   block/stream.c                 | 50 +++++++++++++++++++---------
>>   blockdev.c                     | 61 ++++++++++++++++++++++++++++------
>>   5 files changed, 94 insertions(+), 29 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 04055ef50c..5d6681a35d 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2522,6 +2522,10 @@
>>   # @base-node: the node name of the backing file.
>>   #             It cannot be set if @base is also set. (Since 2.8)
>>   #
>> +# @bottom: the last node in the chain that should be streamed into
>> +#          top. It cannot be set any of @base, @base-node or @backing-file
> 
> s/set any/set if any/
> 
> But what’s the problem with backing-file?  The fact that specifying backing-file means that stream will look for that filename in the backing chain when the job is done (so if you use @bottom, we generally don’t want to rely on the presence of any nodes below it)?

I just wanted to deprecate 'backing-file' together with base and base-node as a next step. If user wants to set backing file unrelated to current backing-chain, is it correct at all? It's a direct violation of what's going on, and I doubt that other parts of Qemu working with backing-file are prepared for such situation. User can do it by hand later.. Anyway, we'll have three releases deprecation period for people to come and cry that this is a really needed option, so we can support it later on demand.

> 
> (If so, I would have thought that we actually want the user to specify backing-file so we don’t have to look down below @bottom to look for a filename.  Perhaps a @backing-fmt parameter would help.)

If we decide that 'backing-file' is really needed, than yes we should require backing-fmt to be specified together with backing-file when using new "bottom" interface.

> 
> [...]
> 
>> diff --git a/blockdev.c b/blockdev.c
>> index 70900f4f77..e0e19db88b 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
> 
> [...]
> 
>> @@ -2551,8 +2567,33 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
>>           bdrv_refresh_filename(base_bs);
>>       }
>> -    /* Check for op blockers in the whole chain between bs and base */
>> -    for (iter = bs; iter && iter != base_bs;
>> +    if (has_bottom) {
>> +        bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
>> +        if (!bottom_bs) {
>> +            goto out;
>> +        }
>> +        if (!bottom_bs->drv) {
>> +            error_setg(errp, "Node '%s' is not open", bottom);
>> +            goto out;
>> +        }
>> +        if (bottom_bs->drv->is_filter) {
>> +            error_setg(errp, "Node '%s' is filter, use non-filter node"
>> +                       "as 'bottom'", bottom);
> 
> Missing a space between “node” and “as”.  (Also, probably two articles, i.e. “Node '%s' is a filter, use a non-filter node...”.)
> 
> The rest looks good to me, but I’m withholding my R-b because I haven’t understood why using @bottom precludes giving @backing-file.
> 
> Max
> 


-- 
Best regards,
Vladimir

