Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E422449255C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:05:56 +0100 (CET)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nFL-00057B-Ol
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9n7s-0003D7-K6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:58:12 -0500
Received: from mail-eopbgr10099.outbound.protection.outlook.com
 ([40.107.1.99]:25254 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9n7p-0004z2-4t
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:58:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlE76wi3wR9OQdAgH3dMQvImjv0C2QN5m1JTRq9JozcbAuwafqeQuAoMToVXQLzNxWCh+5WXI8JuWa9WB2HhoHEkZO6eZ4fwXmCLu8kSrRIVlxdgrKc32w2EuX80INRDLwgaBFwOJ+LDwkw2JalBoeGLaQoeIGJBYA1cyKP92sijw0YBv4gRvWVoZ4dN13YnUp4TUWKgKMGIeOltHCsYRzvy1bcF7LN9Bo6mpNXtftdaE+JyX2nW9JejYYH2/vgn0n+4Rmo9eUNkyff9i8pIS4Gj6DWFu1UJ4TyUm4hK4ZRLw2K424BEcmY/8uk/KPONFPf3rkCZ1nga1Rjc1tWRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bh4/1JHxKlZbIWAFE9NGWzs68sGvmNALCbE2dCb9Jo=;
 b=HGhj2eEa3LXJe/sdZBwsNLgWH/1XNKR4WKv0Ts0UnEihm+oZwviudXdswO9O+wLu17eMWQYzT/fD0HTzVzdysjc0EB47w2qR1eLkFYj18oZsKIs3WEn902NwRreuQ2Db4yu4b+0fVmQjd3BSDp6S+TQFYmDfGzQKPcs2Glet3wmL0pLjuA62gEqxAIemlPdZhloO53IKm9oJ/l36jB7qGhoIfobNREfdUAsf+Yl7Wwmvnr/cXT3UjLT3Ye+Ozt8VJgkWR8LFi7/tzuoi9egThT4fzBm+l3n8fdprsSYc77bbF5xaQQH6Bk/1UR5lMByeYE8MDFuqjrZHiqU+0CBimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bh4/1JHxKlZbIWAFE9NGWzs68sGvmNALCbE2dCb9Jo=;
 b=I9UTZ82dQWTM6doWxLDjDedrQak2jc1OHNQ7FLLMdhix+5gRDMZM1fpLWyqFIA9kdPCgaCpaj5qYVjhGmGw0HWHXQ+fkKKgQ+wJd7LoT6MvSDnGbGNcAbsm1hIpGnYHooP1pswy0YqqGQdHtNB17fekBnHn9qyxvWhuB8qZ+zlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0802MB2599.eurprd08.prod.outlook.com (2603:10a6:4:a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 11:58:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 11:58:03 +0000
Message-ID: <69e04ac6-8bfb-5d66-fa99-fcdf8340935a@virtuozzo.com>
Date: Tue, 18 Jan 2022 14:58:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] scripts/qapi-gen.py: add --add-trace-events option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-3-vsementsov@virtuozzo.com>
 <877daxpcdz.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <877daxpcdz.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4584b0f-fb5f-4e4d-6670-08d9da79c847
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2599:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0802MB25993AC041E18326167BCADAC1589@DB6PR0802MB2599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFAoFScnGPRhJL5wnDqm51XHPL3xWsNMHZgIA75VJawlGKAwoEwhM6MAgqMNCwQ0TmX7d+uTU20/1IPv4PK1SNQhgduDeHh/dtyxemj/5Npv0V/hWF2oxeasL1REXxnfvRTyRo88MDXQ/unpnK36/oKNPTXknRX8NbW8Q61+E6mHxIA2qyAhwfS65U10FlZutKHX5wbN6hPX4Xu8T/XuPfJQqGPD0RxGaHoa3C0n0yQAGQ0zQ9o33auuzmdJh+5rErP8TOaarlOYRKQG7fsuneiA9Be12HWCUEF8HSNk/rXKqDHSzEY4Pg9TTYPxRXBg/YQMk1HD2egmKq+Omtr/HQopZvUerW72+ts28M5qm1tdjcVjPQt/5aiSUIZVR/5tQ9lGGZYVH4iXQ2iqkSvvQNeTcLwUODUd+1xD9RFwvNcNZiwPhDZwMWVEthqUgiRRWmTnCK6zYv7P3r1EK/Qd1uGijYWfdpRDYpDUr0sAFG5lKdIP4Mok7cYxU09OsDtkGvN7p+OM9n0YNnGoQzBe6MHYLpcJgq0ZBTnM2w6iaEZunytTedtOezqk1mjyXBqtNa4+zigXjD876hZQvfQHhyboqOaBiUfoGVaLYH+Z5VgQZGQ4+N0k5xIm8WdL/Pu/zIFyL2FkDV2wdYlKyE01lL9Rklabsyow7VagKR6x4/O4d40ooVJeYvCNGzkYyNTsZVFDBsoywe4jtD7fYs6EJo+YAnrc8hCP1h9xU8jlPzXkI2aXFQE4UA7Lordd2jpiFlLo5jY1OiZAcaJOY2Dzjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(316002)(6486002)(4326008)(6512007)(38100700002)(508600001)(38350700002)(2906002)(83380400001)(30864003)(66476007)(8936002)(66556008)(86362001)(5660300002)(26005)(31696002)(2616005)(186003)(31686004)(6506007)(52116002)(8676002)(66946007)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnRrUWRycXdXWGFPbXJ6S1ZORjd3U1NEZFl2czZWRG81ekk3MHRSaFNTdmdl?=
 =?utf-8?B?RnBJWWRmWVBUWUJLeS8ybFhEMDVJU09rZ0xEVk1GZnlRMzBBUVE5dU9QV3dG?=
 =?utf-8?B?QktzMnRvQ3V1V282aUxkRkdMU1lsdU8xSkh3VUpDNllUMHRuVTgyM0tROUlV?=
 =?utf-8?B?Mlp2MFFZeXN2T3BqQzlHM2ZZbVlPQUxPL0ZwblZMNjNIekJHazNtNHNUOGly?=
 =?utf-8?B?aUU3WWRUS3krZE8yWFhBeDFvdzlyQ3VWMGtQTHNFNEp6eDZMZjRFOW5uLzZX?=
 =?utf-8?B?a3NlTFRWVkcwcTBCenlKQTlJZk9iUUlBRmtvOTNreE90bDRPMWl1MktHSlox?=
 =?utf-8?B?T1NDa045bno5K0VZa21IcmU4OU5MZWNvYW12OE9RLzlpWnpWdG43bUVpU1NC?=
 =?utf-8?B?SWdqdkpZVkk4N2RsSFZwc0lPZWIyRmNtMnhFNGhTQlhLODBZQ2FJaVZPTUZk?=
 =?utf-8?B?YTVqNTdaZ0dnNmMrK2pCbWtHOGJ1TldZYnNwenBwNVpnWFpsNDAwUjVZaGlq?=
 =?utf-8?B?eUxTbldRZWVkQU5nWXJJbXJtY2FrbFllRDFPbWx6ekkzWkZ5M3lyMzZTT1lD?=
 =?utf-8?B?M01wakVsYmkzSlpoK25NRk41T3ZjcUlZbU8xRnh3dGtQWDRnYnhpck0yeXhQ?=
 =?utf-8?B?R092S3AvYjZENlBTMFIybTB5VytmYStLbWVpc3ZsSmU2NUh0WW1Pa3p4ZGxC?=
 =?utf-8?B?ZVVMTlFEbTNDQ1dPT2dyQ0NaWU1FQTEzckVBelBHaEVEMWVFcFdqRlh5bWFD?=
 =?utf-8?B?RXQ5Qi9SN2crQ2hGN3pWNXQraVcwVWszZ1V0Y3RDV3d1bXpXTDlOOGw3d3kx?=
 =?utf-8?B?cnNzNlRhbitMeDFDY00ramhZQmRKdjNaRjZwOHU1bDZvSU05VXV1NDBrbHVh?=
 =?utf-8?B?czlWeUpyclNTK1JxK2JDV0xUNUYxUHFYS3BtTTVuWlg2VGZNY21zOWx0ODEy?=
 =?utf-8?B?QmpONW1MVXpVMVloRFRFYk44blAwS0RFd21lQzkxNVRucjNKRmRFLzVUbkJy?=
 =?utf-8?B?TmUvSkM5NXlZeURLN212Z2JsUW1oSkFIRlhoV3k1YTVDRnlrZ3hUNGlNNzk4?=
 =?utf-8?B?YUVFVHpHWEhXSnkxM3ZsYm1QbFZXNkNqalJ6c2R5TFVTTnVZTVpjakRhSXk1?=
 =?utf-8?B?NVdsNm5UL0ZPZk1WcXZ1cW10ajd0K211ZVF6T2hjT2ljcFIwY3VIbUdKelhj?=
 =?utf-8?B?Vy9HUDBZZ1ZDN2tPcTJYajZuSVRvZ3gwTXVKV2NBRDBhaWIzek5EcHFTdDND?=
 =?utf-8?B?Y3doeTlncFUrMktkbWJzTU5hS25nL2hqdGJxQVlkYVhkSU5ucHArNGRJb1Ev?=
 =?utf-8?B?YkRnMzlvQ2t2b3pZb21LSFd6UFFRQnBSZVVSYkRiK0FGMmg2S2NYUm9TWXgx?=
 =?utf-8?B?dE1SdUVtTjJYNGdybVI3Z0JrenZRc2phbDlWL0ZGS2FJMGVMc2VyUGZBZGQy?=
 =?utf-8?B?T25NRk9rZ0FUT3dYVzRJSC9GbUVTaERIazY1WFV6YytYYTBYbytXVlNCbXVw?=
 =?utf-8?B?RmdYSCs3VjMxdXlGK204U1Bha3dVNnFDbHFBTlJzS2RlakhQWk53Vm1hVUd3?=
 =?utf-8?B?VmdYTE9PekwwNW9nSGFVOEg3amZidUNibnE0QU5xY0JicnNDZlRDRStxUVoz?=
 =?utf-8?B?L1RpWHozSTdRL2pabWRWbmswR0xrbkQ0c1VoSkN3b202Tys2TGw4cGQvRDJK?=
 =?utf-8?B?ZnYvVS9qUC9GMktsNUpKSkFSOVVmYmJYWnVFa3prc1NYUzRXRkJPcGRZNTBI?=
 =?utf-8?B?R2E5dU15WkZTZ2szcEZQSUNwdS9IZkQ5RlNHVDlTZHI1MFpON05LVmJaM2Qz?=
 =?utf-8?B?dGpUM0I3d1lXaEEyd0FNTU1nSytNVW80THp1L3lhRUpWNkt5SCtUSWg2dEZq?=
 =?utf-8?B?NUY3eW9VRERKbUpFTGxPUjZVaDN0c3ZBYTdtWEdFNGMvNW5vdkg3WjFXUWRH?=
 =?utf-8?B?MFFScHZpQTYycFowdG5BZTE1eVhNMkZhN21TTnpyUlZxK1dxSm13TkxYMGFo?=
 =?utf-8?B?RUdZRm1WVFhrQ1o5bkxTWUQ4Ykk0M285dis4L1Q1U2R3NDkrTmtzWmJjcUY3?=
 =?utf-8?B?T21zNmhFRXROVGZRVitpMXM4TTQ1UGJCNmFsbytGMlFsL2lBaFU1QmkxdzU4?=
 =?utf-8?B?NWQrUzBlM1NuVkFDQkRrM0ttMEduR2pxOXdFOFlQODlYMUtONHBzNzAvM3VK?=
 =?utf-8?B?OFhjK0s3cjk0c1lCVUpSQXFYc3BIMTNLb0h3Qm1jamkvZzM3bkkvZjFVaFRj?=
 =?utf-8?Q?zesgzHIpKxwNzhF/lq2ErPIy+9biaQJo3g1OdByxgc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4584b0f-fb5f-4e4d-6670-08d9da79c847
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 11:58:03.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3kdI4E2MURZJVZ2bNcmWV+cIhvoHTi3RaIHwGOxMoTwTTab8Z1QkMzNOkWBy74rLNLNyqF0CGg+lUsXV86mQ8Zo2xBe/tugnBgvLGQk270=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2599
Received-SPF: pass client-ip=40.107.1.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

18.01.2022 13:27, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add and option to generate trace events. We should generate both trace
>> events and trace-events files for further trace events code generation.
> 
> Can you explain why we want trace generation to be optional?

Because I failed make it work for tests and qga.. And seems there no good reason for it: there now trace events for now neither in tests nor in qga.

I've now tried again.

It doesn't work, as I understand, the problem is qga subdir goes after trace subdir, so when we generate trace headers, we didn't yet processed qga subdir.

And I can't just move qga above trace: qga depends on qemutil variable so it should go after it. And if I put 'trace' subdir under qemuutil declaration it doesn't work too (seems because qemuutil depends on trace_ss)..

So, supporting auto-generated trace points for qga qmp commands requires some deeper refactoring.

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/qapi/commands.py | 91 ++++++++++++++++++++++++++++++++++------
>>   scripts/qapi/main.py     | 10 +++--
>>   2 files changed, 85 insertions(+), 16 deletions(-)
>>
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 21001bbd6b..8cd1aa41ce 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
>> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>>   def gen_call(name: str,
>>                arg_type: Optional[QAPISchemaObjectType],
>>                boxed: bool,
>> -             ret_type: Optional[QAPISchemaType]) -> str:
>> +             ret_type: Optional[QAPISchemaType],
>> +             add_trace_events: bool) -> str:
>>       ret = ''
>>   
>>       argstr = ''
>> @@ -71,21 +72,65 @@ def gen_call(name: str,
>>       if ret_type:
>>           lhs = 'retval = '
>>   
>> -    ret = mcgen('''
>> +    name = c_name(name)
>> +    upper = name.upper()
>>   
>> -    %(lhs)sqmp_%(c_name)s(%(args)s&err);
>> -    error_propagate(errp, err);
>> -''',
>> -                c_name=c_name(name), args=argstr, lhs=lhs)
>> -    if ret_type:
>> +    if add_trace_events:
>>           ret += mcgen('''
>> +
>> +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_%(upper)s)) {
>> +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
> 
> Humor me: blank line between declarations and statements, please.
> 
>> +        trace_qmp_enter_%(name)s(req_json->str);
>> +    }
>> +    ''',
>> +                     upper=upper, name=name)
>> +
>> +    ret += mcgen('''
>> +
>> +    %(lhs)sqmp_%(name)s(%(args)s&err);
>> +''',
>> +                name=name, args=argstr, lhs=lhs)
> 
> pycodestyle-3 gripes:
> 
>      scripts/qapi/commands.py:92:17: E128 continuation line under-indented for visual indent
> 
>> +
>> +    ret += mcgen('''
>>       if (err) {
>> +''')
>> +
>> +    if add_trace_events:
>> +        ret += mcgen('''
>> +        trace_qmp_exit_%(name)s(error_get_pretty(err), false);
>> +''',
>> +                     name=name)
>> +
>> +    ret += mcgen('''
>> +        error_propagate(errp, err);
>>           goto out;
>>       }
>> +''')
>> +
>> +    if ret_type:
>> +        ret += mcgen('''
>>   
>>       qmp_marshal_output_%(c_name)s(retval, ret, errp);
>>   ''',
>>                        c_name=ret_type.c_name())
>> +
>> +    if add_trace_events:
>> +        if ret_type:
>> +            ret += mcgen('''
>> +
>> +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_%(upper)s)) {
>> +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
> 
> Humor me: blank line between declarations and statements, please.
> 
>> +        trace_qmp_exit_%(name)s(ret_json->str, true);
>> +    }
>> +    ''',
>> +                     upper=upper, name=name)
> 
> scripts/qapi/commands.py:126:22: E128 continuation line under-indented for visual indent
> 
>> +        else:
>> +            ret += mcgen('''
>> +
>> +    trace_qmp_exit_%(name)s("{}", true);
>> +    ''',
>> +                         name=name)
>> +
>>       return ret
> 
> The generated code changes like this when trace generation is enabled
> (next patch):
> 
>      @@ -52,14 +55,25 @@ void qmp_marshal_query_acpi_ospm_status(
>               goto out;
>           }
> 
>      +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_QUERY_ACPI_OSPM_STATUS)) {
>      +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
>      +        trace_qmp_enter_query_acpi_ospm_status(req_json->str);
>      +    }
>      +
>           retval = qmp_query_acpi_ospm_status(&err);
>           if (err) {
>      +        trace_qmp_exit_query_acpi_ospm_status(error_get_pretty(err), false);
>               error_propagate(errp, err);
>               goto out;
>           }
> 
>           qmp_marshal_output_ACPIOSTInfoList(retval, ret, errp);
> 
>      +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_QUERY_ACPI_OSPM_STATUS)) {
>      +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
>      +        trace_qmp_exit_query_acpi_ospm_status(ret_json->str, true);
>      +    }
>      +
>       out:
>           visit_free(v);
>           v = qapi_dealloc_visitor_new();
> 
> The trace_qmp_enter_query_acpi_ospm_status() and the second
> trace_qmp_exit_query_acpi_ospm_status() is guarded by
> trace_event_get_state_backends(), the first is not.  Intentional?

Yes, I care to avoid json generation when trace event is disabled.

> 
> Have you considered something like
> 
>      @@ -52,14 +55,25 @@ void qmp_marshal_query_acpi_ospm_status(
>               goto out;
>           }
> 
>      +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_QUERY_ACPI_OSPM_STATUS)) {
>      +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
>      +        trace_qmp_enter_query_acpi_ospm_status(req_json->str);
>      +    }
>      +
>           retval = qmp_query_acpi_ospm_status(&err);
>           if (err) {
>               error_propagate(errp, err);
>               goto out;
>           }
> 
>           qmp_marshal_output_ACPIOSTInfoList(retval, ret, errp);
> 
>       out:
>      +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_QUERY_ACPI_OSPM_STATUS)) {
>      +        g_autoptr(GString) result_json
>      +            = qobject_to_json(err ? error_get_pretty(err) : *ret);

Hmm can qobject_to_json() work with simple string passed (returned by error_get_pretty() ?
and it should not be automatically cleared..
And here err object is cleared (propagated to errp)...
But we can move error_propagate() call after trace_qmp_exit_ , and it shoud work

So, it should look like this:

if (trace_event_get_state...) {
   g_autoptr(GString) result_json = NULL;
   const char *result_str;

   if (err) {
     result_str = error_get_pretty(err);
   } else {
     result_json = qobject_to_json(*ret);
     result_str = result_json->str;
   }
  
   trace_qmp_exit_query_acpi_ospm_status(result_str, !err);
}

error_propagate(errp, err);

IMHO, my original variant looks nicer.

>      +
>      +        trace_qmp_exit_query_acpi_ospm_status(ret_json->str, !err);
>      +    }
>      +
>           visit_free(v);
>           v = qapi_dealloc_visitor_new();
> 
>>   
>>   
>> @@ -122,10 +167,17 @@ def gen_marshal_decl(name: str) -> str:
>>                    proto=build_marshal_proto(name))
>>   
>>   
>> +def gen_trace(name: str) -> str:
>> +    name = c_name(name)
>> +    return f"""\
>> +qmp_enter_{name}(const char *json) "%s"\n
>> +qmp_exit_{name}(const char *result, bool succeeded) "%s %d"\n"""
> 
> Why not mcgen()?

Hmm.. Here we don't need any indentation for sure. Do you think we still want mcgen for consistancy and not use f-string?

> 
> The generated FOO.trace-events look like this:
> 
>      $ cat bld-clang/qapi/qapi-commands-control.trace-events
>      qmp_enter_qmp_capabilities(const char *json) "%s"
> 
>      qmp_exit_qmp_capabilities(const char *result, bool succeeded) "%s %d"
>      qmp_enter_query_version(const char *json) "%s"
> 
>      qmp_exit_query_version(const char *result, bool succeeded) "%s %d"
>      qmp_enter_query_commands(const char *json) "%s"
> 
>      qmp_exit_query_commands(const char *result, bool succeeded) "%s %d"
>      qmp_enter_quit(const char *json) "%s"
> 
>      qmp_exit_quit(const char *result, bool succeeded) "%s %d"
> 
> Either drop the blank lines, or put them between the pairs instead of
> within.  I'd do the former.
> 
> We generate lots of empty FOO.trace-events.  I guess that's okay.
> 
>> +
> 
> scripts/qapi/commands.py:176:1: E302 expected 2 blank lines, found 1
> 
>>   def gen_marshal(name: str,
>>                   arg_type: Optional[QAPISchemaObjectType],
>>                   boxed: bool,
>> -                ret_type: Optional[QAPISchemaType]) -> str:
>> +                ret_type: Optional[QAPISchemaType],
>> +                add_trace_events: bool) -> str:
>>       have_args = boxed or (arg_type and not arg_type.is_empty())
>>       if have_args:
>>           assert arg_type is not None
>> @@ -180,7 +232,7 @@ def gen_marshal(name: str,
>>       }
>>   ''')
>>   
>> -    ret += gen_call(name, arg_type, boxed, ret_type)
>> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
>>   
>>       ret += mcgen('''
>>   
>> @@ -238,11 +290,12 @@ def gen_register_command(name: str,
>>   
>>   
>>   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>> -    def __init__(self, prefix: str):
>> +    def __init__(self, prefix: str, add_trace_events: bool):
>>           super().__init__(
>>               prefix, 'qapi-commands',
>>               ' * Schema-defined QAPI/QMP commands', None, __doc__)
>>           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
>> +        self.add_trace_events = add_trace_events
>>   
>>       def _begin_user_module(self, name: str) -> None:
>>           self._visited_ret_types[self._genc] = set()
>> @@ -261,6 +314,15 @@ def _begin_user_module(self, name: str) -> None:
>>   
>>   ''',
>>                                commands=commands, visit=visit))
>> +
>> +        if self.add_trace_events and c_name(commands) != 'qapi_commands':
>> +            self._genc.add(mcgen('''
>> +#include "trace/trace-qapi.h"
>> +#include "qapi/qmp/qjson.h"
>> +#include "trace/trace-%(nm)s_trace_events.h"
>> +''',
>> +                                 nm=c_name(commands)))
> 
> Why c_name(commands), and not just commands?

Because generated files has underscores instead of '-'. Looking at code, I think it's because underscorify() in trace/meson.build when we create group_name variable.

> 
>> +
>>           self._genh.add(mcgen('''
>>   #include "%(types)s.h"
>>   
>> @@ -322,7 +384,9 @@ def visit_command(self,
>>           with ifcontext(ifcond, self._genh, self._genc):
>>               self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
>>               self._genh.add(gen_marshal_decl(name))
>> -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
>> +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
>> +                                       self.add_trace_events))
>> +            self._gent.add(gen_trace(name))
>>           with self._temp_module('./init'):
>>               with ifcontext(ifcond, self._genh, self._genc):
>>                   self._genc.add(gen_register_command(
>> @@ -332,7 +396,8 @@ def visit_command(self,
>>   
>>   def gen_commands(schema: QAPISchema,
>>                    output_dir: str,
>> -                 prefix: str) -> None:
>> -    vis = QAPISchemaGenCommandVisitor(prefix)
>> +                 prefix: str,
>> +                 add_trace_events: bool) -> None:
>> +    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_events)
>>       schema.visit(vis)
>>       vis.write(output_dir)
>> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>> index f2ea6e0ce4..7fab71401c 100644
>> --- a/scripts/qapi/main.py
>> +++ b/scripts/qapi/main.py
>> @@ -32,7 +32,8 @@ def generate(schema_file: str,
>>                output_dir: str,
>>                prefix: str,
>>                unmask: bool = False,
>> -             builtins: bool = False) -> None:
>> +             builtins: bool = False,
>> +             add_trace_events: bool = False) -> None:
>>       """
>>       Generate C code for the given schema into the target directory.
>>   
>> @@ -49,7 +50,7 @@ def generate(schema_file: str,
>>       schema = QAPISchema(schema_file)
>>       gen_types(schema, output_dir, prefix, builtins)
>>       gen_visit(schema, output_dir, prefix, builtins)
>> -    gen_commands(schema, output_dir, prefix)
>> +    gen_commands(schema, output_dir, prefix, add_trace_events)
>>       gen_events(schema, output_dir, prefix)
>>       gen_introspect(schema, output_dir, prefix, unmask)
>>   
>> @@ -74,6 +75,8 @@ def main() -> int:
>>       parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>>                           dest='unmask',
>>                           help="expose non-ABI names in introspection")
>> +    parser.add_argument('--add-trace-events', action='store_true',
>> +                        help="add trace events to qmp marshals")
>>       parser.add_argument('schema', action='store')
>>       args = parser.parse_args()
>>   
>> @@ -88,7 +91,8 @@ def main() -> int:
>>                    output_dir=args.output_dir,
>>                    prefix=args.prefix,
>>                    unmask=args.unmask,
>> -                 builtins=args.builtins)
>> +                 builtins=args.builtins,
>> +                 add_trace_events=args.add_trace_events)
>>       except QAPIError as err:
>>           print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
>>           return 1
> 
> Missing: documentation for the tracing feature in
> docs/devel/qapi-code-gen.rst.  We can talk about the level of detail
> last.
> 
> Also missing is the example update:
> 
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index a3b5473089..feafed79b5 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -1690,8 +1690,8 @@ Example::
>           }
>   
>           retval = qmp_my_command(arg.arg1, &err);
> -        error_propagate(errp, err);
>           if (err) {
> +            error_propagate(errp, err);
>               goto out;
>           }
>   
> 


-- 
Best regards,
Vladimir

