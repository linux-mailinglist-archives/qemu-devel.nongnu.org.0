Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3C49B1B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:30:26 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJ5l-0000Ry-8z
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCIvw-0004A5-M0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:20:16 -0500
Received: from mail-eopbgr130137.outbound.protection.outlook.com
 ([40.107.13.137]:33710 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCIvt-0003vc-ON
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:20:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd12xl/bLZ1/Jeya/0A1h+OJvNdk2EfTC1QXfzI3RMNaO0jHLn9/vmMf1zv7lvL+56QyRTvNjAFuy7vJmJJWxqQei1BCJXbYTMXj1OMpYKdn3pS3xRhD0CIChK4zbDty6v3lhRUGKBoGAr0FsLoIn5XOUDVwTOtlSVj9X90F+sNcx+SKgcbjwze8mJcpZg0VdVyl9XXTt0/FKM7GPtR23GRIomn3CVRwMOMWMAoOwxUFaAy1Dz2bNE+ZfE546b1UoxADavNlx3+Mrz42og9otw7wumRR7hVeJ6zVtekQLvtGQmAGw5HqCLcYHOT/43sJMbPbJEON3VkeQLc7cZmmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f8BmZVMzv00oU1kMmT8Tj84xNbPwJIrAat4yTeiH8s=;
 b=Bk+oEKvl5vFvuBXdWSDcl76Hu4G+2LVMWHU3keJGgHpUnSX4CDgFDIEl99D1IYUWUPBWDG9+sSz2rSAIwEZOudz1p2o8Rc9HAKTl2S+NMJ6+rkBLdo26TO33gtHi8KSQxHpv7JYUZQDXCP6/PQh/oRbaME5KaL/C6zpxFfwgZTTDGaBnnIcFH9Db2w/XSP7NOygRSeyU507aSPAuRmRQdRM8lr/ut4yE6SC4Xu7ZQppj2toIF+A7RfThFUMvu1vUiykMyXI8IgcsBnuSebc6jLbGui7c9Y4ZuXP5cVnRSvfA/oZglgVUSJylC+2xAKJq4mklNTwZ6Ogg+cOt/wDJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f8BmZVMzv00oU1kMmT8Tj84xNbPwJIrAat4yTeiH8s=;
 b=uGMzSlxMDaDbKBG7kM9T/g8SSdHDxjBHH504eSEHLwbBEYZVil5kFRt0S4IjOrVNDXwmCGGRsyBaT1fNvWksUfPc50wV56x3D+kg27KeRD/CdXiklzh73+SKxCxe7tJC+P74fet+/pElhPXAu4ZkAvl78/mwRPm/wfgfBHZjtgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3999.eurprd08.prod.outlook.com (2603:10a6:803:ea::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 10:20:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 10:20:08 +0000
Message-ID: <03bca2e7-4b5f-b706-7292-f9233efb8e22@virtuozzo.com>
Date: Tue, 25 Jan 2022 13:20:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/3] scripts/qapi/commands: gen_commands(): add
 add_trace_events arg
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-3-vsementsov@virtuozzo.com>
 <877dao3zgb.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <877dao3zgb.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0284d9d6-7139-4a8c-affe-08d9dfec430b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3999:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3999219C17D57FAC4C9DEE7BC15F9@VI1PR08MB3999.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wosnpLINeZs9GmZF8rDV5x+VPOTPLkAHM0QncIZY/VOx/97bGuntnjEtJ63YPPea567Eg++ad7X/hafAEp9qXip7CtbVxTcHR+z/NNYoObMyPfel/iQLi8IAR/U84CNJdYCcCvCrUYli5TfqQsRn8hAQxjmMeiyF5bNq4NjDhxmPCvLOISFYkuydk3ocqik8M/8OHZhS1FZ2fN4K+x6RwSFfFq1mlLYta1jgxtKc9OjOJzhmlsDh7h2HpNgvtETMjZg+RunB70QWcK84nzmyo5iZZPoeLW99/YVoYrSD7OGf0bmjdx3dsksb6drg6S06UJ3BPuU6qg9a3ztea9IqgzzcecVpGS+oI44XV52C1Ip7og2hM/69cq7w+8gCqVeTXOVDhLHfCU8DsAfqruP51WO1FruJ5lZcKdLDW1dgw/rf1ydbi2jJEmijma0Q7NJpYmQZvxXHi7xC++i1I28gbIb/RLvg72TwRiwFhi96r69C8IOqBMuHAwton+lAd2rMuvYb/lzVTNmO6VQTQnhHC67pUiTOa9alRPeo15T3nRwnKSCmGEXEKQDsRQ/JYcJqJa7A9l6UoCliYR/W1idks+7RXvDf8AVxBBgc/WT2UI1qLLa+3r7F+cY93mffE6r79WULQCToZ0cB/YgxF+gXdAwudOhf8lRUWNel7rr9epXZSco7NUmIlD0qGbheJG4/RX+rK2dNsNHZXXWfOF4eMBzhdcfgEqz+gmhlZy+FsJUVvC+K7mzU9R9a77gN8NPLh78JG4QX370nPw4CqKDXLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(66476007)(4326008)(2906002)(508600001)(66556008)(6512007)(5660300002)(6486002)(6916009)(66946007)(52116002)(2616005)(6666004)(8676002)(36756003)(83380400001)(38100700002)(38350700002)(86362001)(316002)(31686004)(186003)(31696002)(8936002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVVjUm9Fc3RTUE03Q0lxY1hnZWRjVnQyQUdPalR6NGNFRlI1MnBsbmJVWFNM?=
 =?utf-8?B?Slc1M1VZZGd3QTBKNCswaFFBTnQ0V2MvVHMxS0JFWHg3czJVSnFtNzlqZVFT?=
 =?utf-8?B?aFV5OXJhRkNTMi9YdW4zT0FOR0tGQ0xmcFp0T3lxMmhSMDhmVExIdW5QZGsy?=
 =?utf-8?B?S1Q3bWpTYVJybnJkVFFjRkJ2VTdUNjgwMitIQUlLS1JwSE5RQ0hOOWJzQ0ZB?=
 =?utf-8?B?Nm5TOWVDUmh2cGUxRXgvTTBjRWR2YnRFcTJmYURUcVh3aEc2RjQwUjdzUUp1?=
 =?utf-8?B?Z3lqVkpUN3hWa1JKUllSb0tUWnhoM3A4SE0xWXBvZkl5dFc5eHRybXBIaEdP?=
 =?utf-8?B?QVNNRHhpcXJyTHhvdWlxWVFnYnBoc01lNWgvZlpaZ1QxMzlMbm4rczhxOTZl?=
 =?utf-8?B?cVppTDFEQnZTdzVPb1dFSk04V3BJREd6ZGVEdy95cXQ4NWU0WGRBSGZ6NHkx?=
 =?utf-8?B?dWNyNkcvM0U1aDhnSXJPWTB0UWs2bWR2ZXkrcDVjUGFPS2NrMkV2REdUZkNa?=
 =?utf-8?B?QldlcmptRmhpL3VqMitRUFQ1RW1CNnNENW1oRklHM0VTbXZ4VXVacW50UUpo?=
 =?utf-8?B?TVE3TXFHVTRZS0ZTWFJYWThTY0xNeGpZM1Q0VVVzeHNmKzRSWGY4Yk5EUVZp?=
 =?utf-8?B?eGhqOG05ZXVlZXBRczRPNHdla3VuU0lKQ1orUExHaWJ6TU5nZHMzRC9ZaE1p?=
 =?utf-8?B?ekxiQmVkcCt2R1UvcjVzOGY2UHpCb0ZNR2dJdGdvdWlTWG1zL2t4cXRJQThU?=
 =?utf-8?B?by9LOWZ3a0xqbS9SRkRiU2xNVjJUZExudUtza2w2Wk1IeXFGZUZkVFh4RzZn?=
 =?utf-8?B?bElLSUZBdTJNS01QaC9EajJybitjZVpwTXErQXhGQ0IvMm94MnJMUUFycXZP?=
 =?utf-8?B?bENYMmMrSHdYWS9iWERUa0NBalhUR21maDA4QmFHRCt3Vk1FSG51MVBZbzha?=
 =?utf-8?B?UlgvRjROWmZ3bjlmSHdxbm9nRXc0QU5MeUNzZ1lUSVUzYmRMK2ZySHFlSzR5?=
 =?utf-8?B?eHZwTEtJTmgwbm5CLzVPazBsd05PeVpQNFBsNzJZcThmZ3lxUnllWWxYMGxX?=
 =?utf-8?B?VWd5RVcyc09jeGF3dzRiY1B3SXptcWpTOVpSQkZaQ1g1YzNwbkZJdXlUSXZs?=
 =?utf-8?B?Ky93RWtGRTZuL2ZLNlRjc3kzSXI4YVlpUDFuTkZIUG9XbVBnN2tCT1NtdzB2?=
 =?utf-8?B?M1VpL1N1ZXBtb0RaZlRZaDhTN2haTCtuckR3QWs0OVlXM0paNFFJVEVSRFBj?=
 =?utf-8?B?NW1JajZDQlZHcHZnSkcxT1NmNHhRc003Um5sM0JKTXM5UFZmRTJTY3p6aWtZ?=
 =?utf-8?B?bmxhV3BJblpIc25scXdpNmJMSHR2MkZmK2plL2hvY201M1hPQjdRcXpiaUk4?=
 =?utf-8?B?ZlFIeXorMU1WV3FXRkN5MnhzdlZUems0NUxxa1JzZVpsSTNGWTFReWdRMlRu?=
 =?utf-8?B?dTRPRkZJN2grbU9pS2NKcTlzMlowdmJNZGIwZThFUnRZSWQ0bm5ZRUFhZ0lF?=
 =?utf-8?B?U1M0OWZZR0x6cEhNck1VYVZ0RnlHR1Y2S1c2bmVqaU5sbEtUcmluUzRWS0sx?=
 =?utf-8?B?NEdua2tJMFRWdCtRK0xJQ05TY3oxMHNSdDNJQkNRaFhaTEl4L05YbXVIYWJh?=
 =?utf-8?B?ME9hSUpMbHB3T0NUVGpJajViR09SQ0JDRVdWTVJmOGRBNXYyaU9OWXBsMnJK?=
 =?utf-8?B?U0xtTGl1UUZReEFkUVRtQldGd1E1STVnUERVZmJmVi93TDJHNEUrWkpUNTk0?=
 =?utf-8?B?ZGFQdUI1WVYwSlMzN1V0MVhVUlBvOHk5VlFsTG9tM2VxWjkwaFg1L1N6YWNu?=
 =?utf-8?B?YlRqQXNVWVNVK25lYlRhd2RvUk9WMjJlQ3VYK0VPT3R6MHhkbUdUTkd6akx3?=
 =?utf-8?B?eFJ2OGRpZnQwQm1JWHBMUUlHaVQ5ei82dlpwSk9Dalg2clQxa3BQQ0U2V0cv?=
 =?utf-8?B?Q3ltK3loL1RuY1poMHBLekF2aVFCMEF0dHh1NlhDNWdiT1hxemhnR0dMUlhi?=
 =?utf-8?B?WmF5MzAycWFhdHVseC9NWkt4eldtVW54bkpuQnQ1Vk1CTi9VZmM5VEluc2JD?=
 =?utf-8?B?UlNUMTV0SVVpZjdHQi8zdE12MkdVSWtubXFJdTl4THJXRTh4aldHcy9nd2Yw?=
 =?utf-8?B?b3J6M3VKZ24vTlUyUDAvUW5yQUdITFVrWmcwQ3Y4Ym5WMVMzREppaEZYcUx5?=
 =?utf-8?B?WUpJNGtoMWU2OHQvSTVKb1oxblphNEx0Z013Um9PWmErT1F5Y0hDUC9VS1ZT?=
 =?utf-8?Q?GK9cYvLlxzC6P0mb7jeZO2B2gzL2EPLyK2tNjTOqMo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0284d9d6-7139-4a8c-affe-08d9dfec430b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:20:08.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZtVO3Po3tArR099odAI1D81GucusA9ym1s8VX5MPbUbHwE6tObVCLMUsG7J3QAey1/EtPDDTlr43qxnjsoJhsN5QyRnxe7scliWuWvMBFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3999
Received-SPF: pass client-ip=40.107.13.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

25.01.2022 13:02, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> We are going to generate trace events for qmp commands. We should
>> generate both trace_*() function calls and trace-events files listing
>> events for trace generator.
>>
>> Now implement that possibility in gen_commands() function.
>>
>> The functionality will be used in the following commit, and now comment
>> in _begin_user_module() about c_name() is a bit premature.
> 
> Neglects to explain why it needs to be optional.
> 
> Suggest
> 
>    qapi/commands: Optionally generate trace for QMP commands
> 
>    Add trace generation disabled.  The next commit will enable it for
>    qapi/, but not for qga/ and tests/.  Making it work for the latter two
>    would involve some Meson hackery to ensure we generate the
>    trace-events files before trace-tool uses them.  Since we don't
>    actually support tracing there, we'll bypass that problem.
> 

Thanks, sounds good.

>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/qapi/commands.py | 101 +++++++++++++++++++++++++++++++++------
>>   scripts/qapi/main.py     |   2 +-
>>   2 files changed, 88 insertions(+), 15 deletions(-)
>>
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 21001bbd6b..166bf5dcbc 100644
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
>> @@ -71,21 +72,67 @@ def gen_call(name: str,
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
>> +
>> +        trace_qmp_enter_%(name)s(req_json->str);
>> +    }
>> +    ''',
>> +                     upper=upper, name=name)
>> +
>> +    ret += mcgen('''
>> +
>> +    %(lhs)sqmp_%(name)s(%(args)s&err);
>> +''',
>> +                 name=name, args=argstr, lhs=lhs)
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
> 
> Before the patch, we generate
> 
>      error_propagate(errp, err);
> 
> and if there's any code between here and out:
> 
>      if (err) {
>          goto out;
>      }
> 
> After the patch, we always generate
> 
>      if (err) {
>          error_propagate(errp, err);
>          goto out;
>      }
> 
> But with trace generation enabled (next patch), it changes to
> 
>      if (err) {
>          trace_qmp_exit_FOO(error_get_pretty(err), false);
>          error_propagate(errp, err);
>          goto out;
>      }
> 
>      trace_qmp_exit_FOO("{}", true);
> 
> Okay.
> 
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
>> +
>> +        trace_qmp_exit_%(name)s(ret_json->str, true);
>> +    }
>> +    ''',
>> +                         upper=upper, name=name)
>> +        else:
>> +            ret += mcgen('''
>> +
>> +    trace_qmp_exit_%(name)s("{}", true);
>> +    ''',
>> +                         name=name)
>> +
>>       return ret
>>   
>>   
>> @@ -122,10 +169,19 @@ def gen_marshal_decl(name: str) -> str:
>>                    proto=build_marshal_proto(name))
>>   
>>   
>> +def gen_trace(name: str) -> str:
>> +    return mcgen('''
>> +qmp_enter_%(name)s(const char *json) "%%s"
>> +qmp_exit_%(name)s(const char *result, bool succeeded) "%%s %%d"
>> +''',
>> +                 name=c_name(name))
>> +
>> +
>>   def gen_marshal(name: str,
>>                   arg_type: Optional[QAPISchemaObjectType],
>>                   boxed: bool,
>> -                ret_type: Optional[QAPISchemaType]) -> str:
>> +                ret_type: Optional[QAPISchemaType],
>> +                add_trace_events: bool) -> str:
>>       have_args = boxed or (arg_type and not arg_type.is_empty())
>>       if have_args:
>>           assert arg_type is not None
>> @@ -180,7 +236,7 @@ def gen_marshal(name: str,
>>       }
>>   ''')
>>   
>> -    ret += gen_call(name, arg_type, boxed, ret_type)
>> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
>>   
>>       ret += mcgen('''
>>   
>> @@ -238,11 +294,13 @@ def gen_register_command(name: str,
>>   
>>   
>>   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>> -    def __init__(self, prefix: str):
>> +    def __init__(self, prefix: str, add_trace_events: bool):
>>           super().__init__(
>>               prefix, 'qapi-commands',
>> -            ' * Schema-defined QAPI/QMP commands', None, __doc__)
>> +            ' * Schema-defined QAPI/QMP commands', None, __doc__,
>> +            add_trace_events=add_trace_events)
>>           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
>> +        self.add_trace_events = add_trace_events
>>   
>>       def _begin_user_module(self, name: str) -> None:
>>           self._visited_ret_types[self._genc] = set()
>> @@ -261,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
>>   
>>   ''',
>>                                commands=commands, visit=visit))
>> +
>> +        if self.add_trace_events and commands != 'qapi-commands':
>> +            self._genc.add(mcgen('''
>> +#include "trace/trace-qapi.h"
>> +#include "qapi/qmp/qjson.h"
>> +#include "trace/trace-%(nm)s_trace_events.h"
>> +''',
>> +                                 nm=c_name(commands, protect=False)))
>> +            # We use c_name(commands, protect=False) to turn '-' into '_', to
>> +            # match .underscorify() in trace/meson.build
>> +
>>           self._genh.add(mcgen('''
>>   #include "%(types)s.h"
>>   
>> @@ -322,7 +391,10 @@ def visit_command(self,
>>           with ifcontext(ifcond, self._genh, self._genc):
>>               self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
>>               self._genh.add(gen_marshal_decl(name))
>> -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
>> +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
>> +                                       self.add_trace_events))
>> +            if self.add_trace_events:
>> +                self._gent.add(gen_trace(name))
>>           with self._temp_module('./init'):
>>               with ifcontext(ifcond, self._genh, self._genc):
>>                   self._genc.add(gen_register_command(
>> @@ -332,7 +404,8 @@ def visit_command(self,
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
>> index f2ea6e0ce4..2e61409f04 100644
>> --- a/scripts/qapi/main.py
>> +++ b/scripts/qapi/main.py
>> @@ -49,7 +49,7 @@ def generate(schema_file: str,
>>       schema = QAPISchema(schema_file)
>>       gen_types(schema, output_dir, prefix, builtins)
>>       gen_visit(schema, output_dir, prefix, builtins)
>> -    gen_commands(schema, output_dir, prefix)
>> +    gen_commands(schema, output_dir, prefix, False)
>>       gen_events(schema, output_dir, prefix)
>>       gen_introspect(schema, output_dir, prefix, unmask)
> 
> Missing:
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

Ah right. I fix doc in the next commit, but you are right, the behavior for disabled trace events is modified already in this commit.

-- 
Best regards,
Vladimir

