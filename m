Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB249044C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:48:53 +0100 (CET)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Nh4-0006w2-GW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9NeX-0005Vp-WE; Mon, 17 Jan 2022 03:46:14 -0500
Received: from [2a01:111:f400:7e1b::719] (port=28872
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9NeV-0006OI-J0; Mon, 17 Jan 2022 03:46:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxmFEjvffQXH/J77Zc6HCGiN/HPsCXBg3qH4MbIbqv2c0VZynqj3i1Xt1gmTHRJYsO+F5Aq7MTTGxCa8n4CXwQXG31OJVhnZhr/CiCVYa5j3Y3K+YUyNlAXCRLEYlnpB0tZklqo213DDCmu+qdoGzFjZCuNBtSIrYSQJDgsOcbXN6GldCnHA7tRGNQs+/8/yQKA99uqtIyBk5bPSiVVv1BhbxX6dE91uLG6gp2+whj9pdKuNMqmdRrNIUALAKtfBEm4uW8wZy72fAaZH3hdkXdE1vbGEuzGSFyiEaytd92KOKwF3Wy6W5LGFcT+OKOFNCk4gFY++Emzs72Z1AiFQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+jv4hksi2PRShwSq44A5z5aEMTAGMbZcS4i07KFX90=;
 b=nmOp3xeFkN6fqxe9ennQzX2+H5wONyTfMXOrXz9CpOYxKJ/XUqA05PdwALyZ0pDv3t2lJ9wzhfvATrcDhc151x8m3wS+tGQ4uH2JqbCap0qeZ0Mwub98W7jJi+bxnoYIh2GQp7hUVfHLBbXVU6NffiJuTZhwtLSyRYykdNwG0lrjUJ+63GPoQSBT4uPyeHNQhctLoTVHIL1HfWSn1YjyssoG/CXwM3pRWj8xkXj+qkjNz5GBU91kbMfC+hYmBJraY9x/2X105z5moogTtWqbOWVxOwKeH+s5NTH/342jzRFw9fHn8dCVT0DuFkYhswG0LQsxlUc9XETAp5xXmLcLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+jv4hksi2PRShwSq44A5z5aEMTAGMbZcS4i07KFX90=;
 b=FggZOfbEae04IhuFb3nQ1chzuYmdKCDk78J+qzR7f/c2qkqu2vycNxv6UaSncepEd+9b5164MY5pecAMzXldoWQ1UGGdv77xFb0spM1zkMJR0byDpYnDAvnxiqw4c/CKOrCAdmpX6x586b70uzwxJ/6wTn9vvRnYHbi6gUqRfAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 08:46:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 08:46:07 +0000
Message-ID: <72e7f9ea-8e9c-c923-caf9-5a9711376b0e@virtuozzo.com>
Date: Mon, 17 Jan 2022 11:46:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 jsnow@redhat.com, armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-3-vsementsov@virtuozzo.com>
 <YdxdLLNc/Av889nH@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YdxdLLNc/Av889nH@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0354.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8181409-17f6-48d0-782d-08d9d995cd72
X-MS-TrafficTypeDiagnostic: DB9PR08MB7495:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB7495F2EDC022D2B7668D1A51C1579@DB9PR08MB7495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oE3JgKtKFrDZUhwStZxZmFZ3rjjVLtr628xGzL4v3131XIdGnzeLTnUB9my/QBtRYRikiShL0GZ1UFziQNUPxkWxJGQ0PGahLIdhohI22ix0qnooWchVqUMbd+8TzQRDqs1J9Rn52HfNgqV2I4mrEfTBQXoebnqpjWYl8fP0Qut5d27i05w38Ex4PioUz/VBQM9FhyuvfW9CIpOzMPgEEI9bMALJVo5HF0wdcFO1jgft5Ab4Qv+NyFEwx8mEbgqHlbHjjncf767Bi/chMyF+0hy7KBzmfrJCBBCqSdhlP2usClbZOlt9HSNR8XBtd/r9KjwxrkOJdDPMMtWyDlSODnA80+ABTD97FB1w5tH3XQhoXOdx4EOpQj24INtlGBbinFRcYiFcJE4Munu2ebmKSwGrmrunWsTgXXyP5TTBPgA6wSC+4gigRNINN6kjxJIqyMmdKLwE0MUMNYVrHEib7Cg4P5rl5IUIlRDsIKpYmoZpYKNm5Jkl6yMaKNK8NcdFbZNXHou1LZfC3VXaaQ6jD2GiWWcm2NYhAnHjJmpg/0r6ERsexwu09oXJHRLXSYvBK8IFu1g1/rfsN8RfY5k1KjEvOdnDoLtYBz+7jcn0s56mys6if/U0IHvo0UX5tVqfxbW+xKvoHrFsRTCu0/Sz+hkde5UL47KF2lNj/aAfe6wsSLZhL9COGQuWIASej2gGUnZKZYml4fHjiLfzWGx6oi2XXkmuJVJSV2J1Q5oVPI9ZjKGFhiXq3R188XVUROXeNnlRKC4JOZDpcV9a05f5qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(2616005)(2906002)(6486002)(6916009)(6506007)(186003)(66476007)(8676002)(6512007)(36756003)(4326008)(38100700002)(31696002)(5660300002)(66556008)(38350700002)(83380400001)(86362001)(26005)(31686004)(66946007)(316002)(7416002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtOcTg4M1dyTjZRR1o4T3I5UTJROVlJakxTSGllWUo4Sm03T3F0T3FsWDZ0?=
 =?utf-8?B?SkhZTk1hcC9XZU1iUk83MU9HYUZZcGtGaUJsakVUSGoweHVVQWVvSFdSNDkr?=
 =?utf-8?B?aDU3eXo4OUgxN2lHejhOYlVIRlFkNy95MWduQmN1VGg1VFFNdjg3Q3VyNGp1?=
 =?utf-8?B?ZFd2UzJHcVdNYWZxTEpPVEJNeitZK251WUVVRFdaVWVBMnpXNWN6T0cxb3dX?=
 =?utf-8?B?TXFQREJ2aW1NQnZENDY5djlYWXhDb3JJVkFWVzZtcW5rWjVsYkJaNklsRTRz?=
 =?utf-8?B?ZTVKM081VlVObmd4c2RwM2wwK210MjNaZ3ZqYlNyOVNkQ3RCVEpFajM0RHdT?=
 =?utf-8?B?YzM4aTNlMlcxTDNGRXNqdHhUM1BjYmNkL3FhKzZzcGZEUmlNMFUxNjZQZ3VW?=
 =?utf-8?B?WCtaVDFnaTFFVEEvZFp3MjNMaW10TFJpMlNYYTJzbEZoZSt1SWFSeHQ0cjlQ?=
 =?utf-8?B?RS9weHlyUXZkZ1NmcnBWMUREc1ZXLzdYNFl2cEcxNXNhWkI4SEl1VzlweWZD?=
 =?utf-8?B?akVERFFSbTI2TlpWbnhsOG1FOHVDUW9rbmc5dUh2NmlIMTA0MDZ2Yk12N3R0?=
 =?utf-8?B?UVpVeFhFNnJsQTdoQXpIK2p5TmZ2Q3VSd2gyeFNoY0ZKKzZkc3Y5WmNnekhk?=
 =?utf-8?B?dms2ZEplck5oNzBhTGhVMENRVVExTGhPWWVRdVYwZkw1YXB5c2F0YzcrSC9t?=
 =?utf-8?B?YlJRYi9ITWszZkovWEZwUXNhckg2OTdrTVRjdHNScGpvOGtydjJYSmtxQ3gz?=
 =?utf-8?B?NXlna2thT24wbDR3eVZ4Y2tvVTZ4UnQzZDN2ZzJ2TWpBWEpUbmdyYnV5VFNn?=
 =?utf-8?B?T1Y3Vkt2QzR3Rjd4VE1DVHVwdXRoSVhVTVZPTDMzVnQ4L3l0N2NlMXY1SW1E?=
 =?utf-8?B?MWJBYVR6REt2T0ovb0FNNUhnVG5KVGExc3JYdTRLeEVNNDVRalFQanpMMXJo?=
 =?utf-8?B?anRkQ1VyMndQRHdFakYxbXZYczYveTF0RnF4b2FWRGNyaFZoV1plSUlITmo5?=
 =?utf-8?B?aHlqNjFwNUpISWwvdllJSks0b2t5RUJrQ0VNMVVvcDNaL1FzTmdaRTlvZXVG?=
 =?utf-8?B?dE1yRXVqM09kU2I1ZnJPd1RUb1RsWng1Q3pQRGM3QlF6RWpQaDIvVEdRRDZh?=
 =?utf-8?B?SVFqbjJtcVkwVzMybWswSkFNbDFJUzZYY3d6NUYwVWFYcmNwdW9TVkN6U1Ev?=
 =?utf-8?B?WWxxRlhINW1JYUdBTE5YZmpOck9Rd0JCWXFDZzJJbmx6TG1kOVM0bUhSK25i?=
 =?utf-8?B?Q1RDZGFMaVErWWJUM3VKOGhlRzkwbmExc0s0bkxHZnRtQlNlWGgwMGFoV0ZQ?=
 =?utf-8?B?UHdGcHV6ZkdpczVXa2QwTVRyakRxbG9UYU9hL2EwMlhGSk5WakRrWHcxMXpM?=
 =?utf-8?B?MXNsbzlVNFRoNnZwY3NOUDBLdjZ1d2wrYzc0TENhZGFEclBaclFZa201VTJ5?=
 =?utf-8?B?TkI0TGU1WXNyNm5VaXl4eE5iajNRWGtjc0paN3hFVnI0QUpja2FQaktyVWxl?=
 =?utf-8?B?anhjRERLWnR0NE5GTU5uek1DNHY5b3daMnBKL1phTWFxbHh5U3p1bFh1Uktx?=
 =?utf-8?B?Z0pvKzJmWVpEVTNrMmtOSWRiR0M0aWlJb1RSenVYaW1ndVJxaDEydExOaEZJ?=
 =?utf-8?B?cFlhRWlNQ0g5K0NRQ051SXcxRVdSVFJLZDRNNXdDMXFTOGhWZFkza3BtT0tV?=
 =?utf-8?B?NzJ2cnQ0UE9kMXF1bGRJZVJjZy83QlArRkpKTGFhNTdtK2J4YzMrOW44N1Ju?=
 =?utf-8?B?MTJuTUdmbmUrNnlBTitUVDhpd3dyN1ZLOGFsUGtkMHRteXkrQUxuS0tWeXQv?=
 =?utf-8?B?cDZUNEc5WGlubitaUHU2ZXZobEVqcHEreDl0SVdVcUQxdzhIdWtmUm8vWk84?=
 =?utf-8?B?d0VjS1ZyM2VwS2oxUEpKaWhMT2haOU9CQnlsbW5xTS9NbDZCRWF3NjRSTU1r?=
 =?utf-8?B?eklIMDc2R0lsNzZIanViZHJGZGdVYk1WNCtUTEY5b3pyK0NRcWVOU0xSZlZW?=
 =?utf-8?B?bkhKekFGRUw2QlNXZFZmdkFvRXhBNzd2cEJqdkh0U0F0MTlCTHlDTkg3Q0o5?=
 =?utf-8?B?U0VoaHFQcWlRSFN4eUR5ZTMrNkFSTzVZUndzcThoMms3eXJ1TFVRdUdReElm?=
 =?utf-8?B?alJmbDAyOWp6MDJHRmFLZHFXM2RSNmZ2MkovUEJzZkl5Rm1WYlBvdno1R2JS?=
 =?utf-8?B?VEFyNjNhS3V6Q1FmcmdQRCtvTzVzRlAxUDFlc1JEL0xVNW9xdGtWY1p6MUEx?=
 =?utf-8?Q?lYqYB/jFyQyfiul1wy0CEA3Mq8jluWRsFjzzsAridk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8181409-17f6-48d0-782d-08d9d995cd72
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:46:07.3258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3UElRdWdan+/NtoRAJ+j49A7tO901LIDzMX/8HkIIofr6mhbXRPIy2XGW/10/Bm18hwmt2O5EzJW94f4R/3cUDfTXeL69QZjN0RbgvAhSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::719
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::719;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

10.01.2022 19:22, Stefan Hajnoczi wrote:
> On Thu, Dec 23, 2021 at 12:07:54PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> Add possibility to generate trace points for each qmp command.
>>
>> We should generate both trace points and trace-events file, for further
>> trace point code generation.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
>>   1 file changed, 73 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 21001bbd6b..9691c11f96 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
>> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>>   def gen_call(name: str,
>>                arg_type: Optional[QAPISchemaObjectType],
>>                boxed: bool,
>> -             ret_type: Optional[QAPISchemaType]) -> str:
>> +             ret_type: Optional[QAPISchemaType],
>> +             add_trace_points: bool) -> str:
> 
> Please use the term "trace events" instead of "trace points". That's the
> term that docs/devel/tracing.rst uses.
> 
>> @@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
>>                    proto=build_marshal_proto(name))
>>   
>>   
>> +def gen_trace(name: str) -> str:
>> +    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
> 
> This trace event is emitted in 3 different ways:
> 1. For arguments before calling a QMP command.
> 2. For the error message when the QMP command fails.
> 3. For the return value when a QMP command succeeds.
> 
> This makes parsing the trace akward because you get two events in
> succession for a single call and they both have the same name.
> 
> Please generate 2 trace events:
> 1. qmp_enter_<name> <args>
> 2. qmp_exit_<name> <ret> <succeeded>
> 
> (That's similar to how the syscalls Linux kernel trace events work.)
> 
> Scripts processing the trace can easily differentiate between enter
> (args) and exit (return value) events without parsing or keeping state
> to count the second event.
> 

OK, reasonable. This also makes patch 01 not needed.


-- 
Best regards,
Vladimir

