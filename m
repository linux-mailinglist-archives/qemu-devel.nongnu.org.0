Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A349B0C6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:59:24 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIbi-00074K-7z
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCITY-0006tu-8H
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:50:56 -0500
Received: from mail-eopbgr150129.outbound.protection.outlook.com
 ([40.107.15.129]:28147 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCITV-0007wq-0t
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:50:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpGpu6DDLYFUj7LyEjF5eUn0tPkqaeqGW4NlsnmuWZLBV7mcre601TgircJQH1lcTvAEapfzufGXSCrrUjPndcYp8dYNk6r+8uA6Gam4b2o1OCmdbasLA4P+x2u4Dx+f0OHrPlJ1Gqo9zstpobsNowhbVnDJZBAk3e44o0l0yM6E2LLr8SwnW4MQpg9HX2VJBOm6h+9PpWnaq4Bt32kGv6piBnlhCTcmIKkPzDVMMDMWmpq6i643jNbcTgWlSKrWXjco6MZINDdEy4awC6yVswnGsvOXrYZioz1tKDf/aBNiBipNAXkDbpu/UfkMEKLfrOkS6XHZQ6NIzCw67r25YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbKKDBl5H0O8mOGtKOBevOAmVEg+fC42vbS5mfq9TdA=;
 b=IdB8n5MfJiubCt6Q6Olx5foA3RwYUORhaUcRLsDy9uo1Q5qQcOFbDdk4krvQW390ry8uPpP8KZWyLgUNvJgyvFcgHn9z6V36PeGZjiWsrA7E4nh6DwWRUWxyKBv2hi1ncG6hsmobSCq4pdhL3Yy3PH9CnSRZ0pAECUKW6SKMNkQG5NmhHml/mu9k6F9zNFPMHBNgSXiKpNAQn6pBOSWguT2ejECquNCHrEDaDRCV/mC+iYWS5uCKErjPzo6P2byYGozV3HPp++CU82D1k69t3M6t9UWqo0yORz6O9whmTpXw/FePehvj8s2onfQsNp+DCrFyGunKsMMHW1dQeyjlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbKKDBl5H0O8mOGtKOBevOAmVEg+fC42vbS5mfq9TdA=;
 b=cPIREbpnSNpT15/m42JZ3QAz4J7o2gGSwwMuphp8JjjqmS6zsmJ4V0ef7p5UYkH3EiXCdwdDXisc6nmupi2FQagCHokcNGjl2k0Gy2pitwQyg9sLp+xpRJstf9+yU4kh6MDvK7IaQrsIMdCX/k6jLlT259QK8NPrMMcGKwY7bsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB2056.eurprd08.prod.outlook.com (2603:10a6:4:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 09:50:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 09:50:42 +0000
Message-ID: <9c585037-ded9-6a0c-9b4a-8f5b5cfdfa64@virtuozzo.com>
Date: Tue, 25 Jan 2022 12:50:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 1/3] scripts/qapi/gen.py: add FOO.trace-events output
 module
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-2-vsementsov@virtuozzo.com>
 <87sftc420m.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87sftc420m.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7421108-9c83-42df-25b1-08d9dfe82652
X-MS-TrafficTypeDiagnostic: DB6PR0801MB2056:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB20561DE0374EAE29DCEDA895C15F9@DB6PR0801MB2056.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wU10iOtguNqRehPocltr4PFBFlQiBQl5yhos2h28y1kbG3bWkr5xYuNXuAAp9ezfEdPgerlgSqZPEZzQ16+4ffe746GoaNrJ6lMEmKw0rqJHFzH9UzZU/SCUtfm++c5gxRHEyB+jFVDQIHRyNk3vKK+kaecOC9JdiSKYcLbeV5LRaN08Boc655H6j5+gldVnc7LNzfqttkU9wNcha9zeyyxps5H1W2Pdq2P4Zzbk5tymaA7Kn5ezChPKyUURjOFBfF9NLofP4JqZEwi//jHlycrSjSHXUxm1ocb5lVXfttVuPdVYSEpUVh3VsBDVLPUq6iNClJnXroRj6nHkndx7WUApchUo2iv0NvuU56l8ALh5PB4uWuZeMRCIGylS334mB6+h8DRBpxI0WIeodDF64RisxDe3yVlZwGGuwCAc8kOuQa08IjGkUswkLd6bjf11kOEIQeW9oTvmer52L3b4KVQKWzhH0NXawsTUfuerV4p+1IxUOsEOq3zrIjFNRYCfwgZFxY9rI9RlzSzZbIyd36NOvXDt7+ppH7ph1WvdLAL66lp6dnz3Mc756Iup68BxHc6kGZUzD5UNDuLIiNE/4SYiiK/tZwZF4DpPANpBpROWdUDGSqB7WXPEussrEoPyy3A6BD0hE0rhrv5CDXAsY8zz7lvkzIVUwX/DGq1GhghFDc/eIobHYpVpnWDz0u0NGKbZDQOl6A3gl+q5xVRmHvWjcp2tiwGCoVKVGDW5nK8HFtY9v5TwETg9vZhJnQFICgerHAAoIIPDHFkzQfYdNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(38350700002)(26005)(508600001)(2906002)(6486002)(6512007)(6506007)(6666004)(2616005)(66476007)(52116002)(6916009)(186003)(66946007)(83380400001)(31696002)(8676002)(86362001)(4326008)(316002)(38100700002)(36756003)(5660300002)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UStVa1RENlltTkxDM2tpemZFS3A0MGlNODAvMHk2WVltUWdxSkFmU2k5SUN1?=
 =?utf-8?B?T0FBYnY3akVNR2VjWnZhSVIxeXZoYUZLWk8rY3ZJRU9PTnE2RjBCRzB5cXRw?=
 =?utf-8?B?NVBjMFlQL2EyaURFeUhoeWdkcDV1RHE1UkRZMWVwL0dYRGdnRDVaa0RITG5m?=
 =?utf-8?B?ZE1waEZlc0svdXE2YUhZdUtQVC9NQU96RU1yazFuRWVxeVFyaERucUN2bGcy?=
 =?utf-8?B?Q2ZGK3YrZ3lQOWJ1SnpOdFlEQm41bGJUM3pMZGlvMlRpZzM5ZXRSUUw1ci82?=
 =?utf-8?B?U251SmQxZHM2WEVVc0hoTlgxTVM0L0l5NVdVTW8zZlFVdE91Sk9QMW8xNVpV?=
 =?utf-8?B?N0NhSUFzTEhCRmtPMGppVnpFQ01nTXJBM0lrOXFtSnpkUkZNbHQwYWI3N0F1?=
 =?utf-8?B?d1U5endiUHV4MlVUU1BIbzQ0eE5LTWpNWjNMM3FJOS9YWnB5SW02NDNHeEls?=
 =?utf-8?B?VFJBeFlrVEhNcDV0K1hzMm9iek1EcU02R0hYcHZOMVBxOXMyVVloNXA5ODdU?=
 =?utf-8?B?Wmg1djY0ZVFHQlg3M2I5VUZ0N0RaQVphMnUxSVgwRzZzWDZXWjRhS1d5bnVz?=
 =?utf-8?B?YzZqZmdjcUY3eHh1dDVpNzNFL1lYOThBZHpGMWI0ZUh3L2tiRmZNSnZKT3NE?=
 =?utf-8?B?TnpmZncxYUdvZnR3TFJSeFN5dGNKVzI0emNyV2NzcXI5U2xjc1BuTk1Yb1pt?=
 =?utf-8?B?M01UTkpkcE5aOFpTNTVKaGxkMXV0YnB4VHlIVm9ubjN4cVJrNTBwMSswQzFw?=
 =?utf-8?B?cW1ReTRjTHh1WXRnUXVDYlZHcld4MHNtMUJ1NHV2d3VZRS96eS92SzQrK3Nz?=
 =?utf-8?B?MDRiWUZRY0JySTQyZ0dEMnJwRFNmN0tiWDlXcVR0VHVnNzBZVzNjS0plYXZm?=
 =?utf-8?B?SDE5THlEbGRua00weWZIdzRwdzFGWDdJbTVPRTRSRW1MOUl5Q01sY1VnWllB?=
 =?utf-8?B?ZjJRRnNrdE9SdVgrRUI4WFdKeDNxOEhpTytHQ01jcFl2YnZpemtUZFlpVnJU?=
 =?utf-8?B?OCtpU2dwUTdqT3pLMTJWWU9IWlBwUC9UcUxRMm1FdGZDdDZRY1d1N0x5anoz?=
 =?utf-8?B?RGdiVEdyNUFmVlFFOUZURmNzR2dvZm52RzYyc2lXWHQ4dXJiQk9ScnM0L0R6?=
 =?utf-8?B?NHZiWmZFMGlPa0tsV2ErVUY4NElVNHByUHdmaUt2UVRVVEVxOVlmaERCZHdV?=
 =?utf-8?B?c3kyTXpObml4Nk5XSWV5Ylh0anhTMUxha0xxalV5OGw5MkFHMmtaeExRZ1hO?=
 =?utf-8?B?TDNJcEljYXVHVS9kZ0ZqcS82RktHOWxlQ3doOVI3NHBzR1BhQ1o4V29JUXhR?=
 =?utf-8?B?RlVsWmpNZUlUU1MwSGRhVXdNWXJKcGY5MURtUlBuU0JvZlFmMXhVQ1NBMVY3?=
 =?utf-8?B?WkNpV0p4V0VYR3pwdWhNNW5tUDlid2UxSWVZT0hEWXRtemVlQnd3QU5yeGIx?=
 =?utf-8?B?bWczQmx4UE4zZXlISjBBKzNheHUrUlorYnpsK1RoU3B6MXJSd2NYV2dVWkN6?=
 =?utf-8?B?a1MyK3RLeGJoUmpOVXJCNWxpQitXNVFDRFVCeTZkczRJR09zd25lMndoVnBK?=
 =?utf-8?B?UXBteGRGWERHM1VIY25sS2xuSTJtV1h5Y3FKWTYzRzlEQkVDTWVsVjZvOFpx?=
 =?utf-8?B?MHcrQVB5bFo1RzZkNkEvdW42QUgyU1JtUmZ2WVJqa1JEbjNWNHo0cDRZclAv?=
 =?utf-8?B?OS9wYjFzRW1SbVdERkVsbmU4blhoRnBuT2d5U0lNRklUcVBtakljcTZlNXI4?=
 =?utf-8?B?TUZ1blNZVUtXeUlJVzhZNG82OERxandGbzRDU0orU0FIOFlHTHRaU0wvWmdl?=
 =?utf-8?B?N3NXM1VKeEsxdDA3d3dvVUF1VDQxVW45bjZhOVZlMmJCTjU0WGZZOVNaZnJ1?=
 =?utf-8?B?d2t3M1JiTTg0b1Q1aXZnSUNzbnAvVkpZRDFnVWtKdWFPTDJ0YW84RkJpRHlY?=
 =?utf-8?B?dUZISUNyc0NUakxtK1ZGb1gyemRqaW0yWlNnbHBvNzRLekY1Vk9wOHBzY3pt?=
 =?utf-8?B?Y3JQZGlObml1TVNPOFZ5NE5jWXpKSDNwOUZpQnZxQ0xtbDU4dmVYN3ZSRnFy?=
 =?utf-8?B?KzVKZTY0K1NnL09VUEJmU3grZWo4WWpQbEphOEl2L04zRWtzaUxjM0hhZEFt?=
 =?utf-8?B?enp0UFlkRmloYzhXbThZZ0xuSk1oMnJJUElZcng4dk9VU2hha2F3dkxvVXFY?=
 =?utf-8?B?Rmowc3ZkUjk5TnNPK0NCL2t5UUhldVYrdHIxaVUyaE4wR0t1enJXN1BpTEY0?=
 =?utf-8?B?SnRIUldtSzExdlZreXNZamdyOVhBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7421108-9c83-42df-25b1-08d9dfe82652
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 09:50:42.0325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oSlsgV6rTnhVGrbwW68P9NfurVcau26EjvQiFFJ9YYXOqg8l5c4V3WAP7I5yGMGnoYtHUNy3DyyjHPD+4ZV3X3sU0+m5k/h+bITLy7I9TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2056
Received-SPF: pass client-ip=40.107.15.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

25.01.2022 12:07, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> We are going to generate trace events for qmp commands. We should
> 
> QMP
> 
>> generate both trace_*() function calls and trace-events files listing
>> events for trace generator.
>>
>> So, add an output module FOO.trace-events for each FOO schema module.
>>
>> Still, we'll need these .trace-events files only for
>> QAPISchemaGenCommandVisitor successor of QAPISchemaModularCVisitor.
>> So, make this possibility optional, to avoid generating extra empty
>> files for all other successors of QAPISchemaModularCVisitor.
> 
> Suggest to make this slightly less technical for easier reading:
> 
>    Since we're going to add trace events only to command marshallers,
>    make the trace-events output optional, so we don't generate so many
>    useless empty files.

Sounds good

> 
>> We can't simply add the new feature directly to
>> QAPISchemaGenCommandVisitor: this means we'll have to reimplement
>> a kind of ._module / .write() functionality of parent class in the
>> successor, which seems worse than extending base class functionality.
> 
> Do you mean something like
> 
>    The alternative would be adding the the new feature directly to
>    QAPISchemaGenCommandVisitor, but then we'd have to reimplement the
>    ._module / .write() functionality of its parent class
>    QAPISchemaModularCVisitor, which seems worse than extending the parent
>    class.
> 
> ?

Yes.

> 
> If yes: I'm not sure about "worse". 

Hmm. *shrug* ) I'm new to this code, that's why it seems unobvious to me, and that's why I'm afraid of deeper refactoring)

> But keeping it in the parent class
> feels right to me anyway, as trace events could be useful in other child
> classes, too.

If it is OK, we can simply drop this paragraph.

> 
>> Currently nobody set add_trace_events to True, so new functionality is
>> formally disabled. It will be enabled for QAPISchemaGenCommandVisitor
> 
> Drop "formally".
> 
>> in further commit.
> 
> "in a further commit", or "in the next commit".
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
>>   1 file changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 995a97d2b8..def52f021e 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -192,6 +192,11 @@ def _bottom(self) -> str:
>>           return guardend(self.fname)
>>   
>>   
>> +class QAPIGenTrace(QAPIGen):
>> +    def _top(self):
>> +        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
>> +
>> +
>>   @contextmanager
>>   def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
>>       """
>> @@ -244,15 +249,18 @@ def __init__(self,
>>                    what: str,
>>                    user_blurb: str,
>>                    builtin_blurb: Optional[str],
>> -                 pydoc: str):
>> +                 pydoc: str,
>> +                 add_trace_events: bool = False):
> 
> I'd prefer naming this gen_trace_events.  Happy to tweak this in my tree.
> 
>>           self._prefix = prefix
>>           self._what = what
>>           self._user_blurb = user_blurb
>>           self._builtin_blurb = builtin_blurb
>>           self._pydoc = pydoc
>>           self._current_module: Optional[str] = None
>> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
>> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
>> +                                      Optional[QAPIGenTrace]]] = {}
>>           self._main_module: Optional[str] = None
>> +        self.add_trace_events = add_trace_events
> 
> By convention, names of private attributes start with a single _.
> 
>>   
>>       @property
>>       def _genc(self) -> QAPIGenC:
>> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>>           assert self._current_module is not None
>>           return self._module[self._current_module][1]
>>   
>> +    @property
>> +    def _gent(self) -> QAPIGenTrace:
>> +        assert self.add_trace_events
>> +        assert self._current_module is not None
>> +        gent = self._module[self._current_module][2]
>> +        assert gent is not None
>> +        return gent
>> +
>>       @staticmethod
>>       def _module_dirname(name: str) -> str:
>>           if QAPISchemaModule.is_user_module(name):
>> @@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
>>           basename = self._module_filename(self._what, name)
>>           genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>>           genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
>> -        self._module[name] = (genc, genh)
>> +        if self.add_trace_events:
>> +            gent = QAPIGenTrace(basename + '.trace-events')
>> +        else:
>> +            gent = None
>> +
>> +        self._module[name] = (genc, genh, gent)
>>           self._current_module = name
>>   
>>       @contextmanager
>> @@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
>>           self._current_module = old_module
>>   
>>       def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>> -        for name, (genc, genh) in self._module.items():
>> +        for name, (genc, genh, gent) in self._module.items():
>>               if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>>                   continue
>>               genc.write(output_dir)
>>               genh.write(output_dir)
>> +            if gent is not None:
>> +                gent.write(output_dir)
>>   
>>       def _begin_builtin_module(self) -> None:
>>           pass
> 
> I wonder whether we really need a new __init__() parameter.  Could we
> have ._gent() create the module on demand?  This is *not* a demand.
> 

My first attempt to drop extra empty generated .trace-events files was to teach QAPIGenTrace() not to generate file when it is empty. But in this case some empty .trace-events for commands are not generated, and "include" line fails to compile. And at time when include line is generated, I don't know will corresponding .trace-events be empty or not. So I decided to make a new parameter for __init__()

-- 
Best regards,
Vladimir

