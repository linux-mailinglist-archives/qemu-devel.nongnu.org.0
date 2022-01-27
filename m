Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1B49DE77
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:52:31 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1SA-0006rZ-FV
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Hj-0003Vb-6n
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:43 -0500
Received: from mail-eopbgr140122.outbound.protection.outlook.com
 ([40.107.14.122]:56137 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Hh-00019h-Cx
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1RKk9Vv6pa1DkDoDSe1nS12bN0iaGzgBbOJeryaojzS4xB0visoUemxrsk2RRiJV/P0erbMmL7prF4AzdbH0cCP/carov4xoZhSkTfFttU2QuWKOHPXIwpFVmNbzglws6cYT0y7HqpvmaeWww4HIY8Hha6qQB5Ti51iOuCWCN84aCnhnUNROYcjhJdt+eTfYxB/vi7FouGrncfp2j6ZusPPPITLNgZcI8eN0y7OagGftPy9m8YmIXXxHAy3MkbSBcZxnVwsdz+WBOIoox3/zCQ4bL9KXU/BnPknFGy2xVP1M11cZ3OwLqRk0sRn9PzmUoFuRSjVGhkkIg9OZusfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU8kHV17V+kWE6eardiATKt1cJ1B4ZPbtwTYzZwYvI4=;
 b=P8TsUCF5OjBBsECBLJB25co1o4xoz+kpc7/ZRF8U4JeUxSmqYrCfe0SEBET1dAkUBCfZo9PctL+cfZwiY65CBfSYdNL9RCWvdF3MB9EhaCuYz1wErvi6ZNsMb4spI12dDwWUDdHpnWxfrXiC/3jmeJnccqSA9SddhRIqHdIxSmq9VAHO+p1q6MEe2TjUhXFIlOE1u35oGBB/VUYTGOfgEJEe5Vd+a2Flvwt3BgTXNlxTofybvpTU6jShHvHt0cKjhlAQOuOhy9jDN2CHQ6eEf7859VCyVUw5MDmRwiPdKwYyVJRBCz/MPTcVWy7fDCfjUXbLpVCVCW3J+l8ilKWY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU8kHV17V+kWE6eardiATKt1cJ1B4ZPbtwTYzZwYvI4=;
 b=NxXUs93zAVMwurULI1vuMQnM/Q3W7X8L47A4WlYC7sXvvYr6gwwSmLffi9mnCcFAU3g3FBvCUbPmBhXZmMYsWiodd1UJ+WkJVIbB3F9I/FdPoEUj0XWFxURb7AyM212XIS80YaLQWhnGUJzPwbdPghKQsxvyual3B8gxGqXqaK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 09:41:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:41:37 +0000
Message-ID: <eb640ff2-c493-10f6-397b-7640bed5f646@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:41:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 0/7] trace qmp commands
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <YfJV/MRD/eEIP7S8@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YfJV/MRD/eEIP7S8@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:205::47)
 To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31209098-15d0-467c-edf5-08d9e17936d1
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB6783128FAB8380BE0E7854CAC1219@PAXPR08MB6783.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opuM3ZJT8k3DLbHgYCpD+KXT9iYk1BAwaUGe6/UxIPplmIP+PqFPJElWOiJjBKRLx6mHteVAVqh0vPh9wXkiRs1poZgxv3URRkSOTxlPEPCHFYJvotCWP4g9Yk+3wsAUfh4EQlzyBbrqbFwvqbQoVLrA9tYtKihbJLVzPYIyozp9/BqXy4/a9Vo9lZrhru3dNEJorm3GNQRKNQGpe7ROo0cwqwkdFLbcGtYcBI/yetI8GcU2YMrokZmd7ORO3VMx2idpp8FF13HoQNmb6IFbZ/HIN3rMfVI9A9PVxmjGj+zD5QyI7fcJi3swHlABTtNsV3XSXG2rqxGrM4q+EIjtAfNpDzQ/KmpPLG2O/UtGqP6LsyFu1YGYVbkOEc8CsGie728s5HSE1FvNtneOLOLdV4rktvCGXN/A8XtFiBFmkBCwJoy1xaQ1ogmLrevziTuWQEYWBdbSvW5Jw88RAR1urEm+Dtbb2D/UhhC3AgS9Nm6NtkoUeYu/6Dsd+tNW35vyLBaQtdT1L7ZFBvdPX4ZYZb+Rb21jFXSzv1anGzyDzKdojMw5iFTdQJu+Af5j7vnEQUCN/zog6ETBks3MSA0TwFMaCbpUhqw6Mqf9OB6vIm7C/Sezwn65gC5VUzIVAxavHUpre5ZHe6PZqPl/Rm6oP/TjanN5BX3I9jl+sx4n9vUPRCGpV4SqLkrD0G1YHqGQo0oMyPIowmRWYhOmWVc6Pd4seg26i6+GudiS82meOZ7wi7fREuQMyCiKav/4JWiZv8ptyXDQCOwzfCjW8YTj2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(186003)(508600001)(36756003)(38350700002)(5660300002)(316002)(6506007)(2616005)(66556008)(52116002)(8676002)(8936002)(6916009)(6512007)(86362001)(83380400001)(2906002)(31696002)(38100700002)(26005)(31686004)(66476007)(4326008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0pUYS9EaXBQa25udUdxN2R3SjNVR2xoMkhkdXk4czcyL3c2YnRqT0dRSC9q?=
 =?utf-8?B?bjJzMTMxWURNWmxGODF0R2VSVEpYL0VEejQ4amgydUJHY3k1K0ljeEFpL05D?=
 =?utf-8?B?eGk0ck56UHRUSTB4b2Z3emJMYU1HVFVCQkRuLzI5R2hNczZtUU1Cbm1qM3VE?=
 =?utf-8?B?R2Jwa2dUaFRNVjZvYmZsK0tOOVpuTm0zYjVVOFVFVHJKN3ZwRTl0bGxQWFRF?=
 =?utf-8?B?MlBxSU5RalFXMTBqcVF6QVd0ZnJ1UFU0MmllWkRTWSt3OGxoM25UVnQ4WDVR?=
 =?utf-8?B?MWI4NENMeGxNYTFnb3BpLzBsK0x4YmtPSHFxeTkzQk9YVXpKeHhoVHNYYVVM?=
 =?utf-8?B?R2lRMjlHREtUYWxwUmlUendaQzV0OU83OFZUZjNhQ2FQdnc5NnM4ZnZXZWxM?=
 =?utf-8?B?WmFDR1pxektMcEhrUWhtWmlGQ2xQdzNPMEYrN2RZUnRoSUdOUXVXZjN6NC9o?=
 =?utf-8?B?b0NhQ1JEbGozcEc2Ymk0TFluRWU3dkpRS2x0dlo3VXlKMjN4VEprUEdRanJ5?=
 =?utf-8?B?SEFBWEhTRzNqUi9DaXVJVlllTSsxazZiaUM2N0Vod0tZMmFKTmNjUHdQd0RD?=
 =?utf-8?B?WFpjZkp1akkzeVRobkxQanRyajZwcjZGNmd6NDdnR2s0YkI0UFlMVXB2RzVY?=
 =?utf-8?B?SUdBZFJnQjA4TkZ6cTY4VWJndG9ZYno1S2lESjVwWEJqYm9XbVd0SExmVjBs?=
 =?utf-8?B?YXFsSDRjSkxQMEZsRElxZ2N0NFU3ekRJUXpPWUFtcC9qM2U4SEV1b0FkdHVJ?=
 =?utf-8?B?aUZWb3o5Q1h0UjFjSk1tQ3FEV2tkcVlQdXkzWktDQVB2RWlMQVo4anNrMERR?=
 =?utf-8?B?elYzQWJsZUFQL1hUWlJReFVJVEIrb2lPdktDZGZmUmM4c0dWWDIzMnpNY095?=
 =?utf-8?B?dThYZHpxODdNUk95MXNuMDJQdE5qL09GQVBJRGdrV3hvMEZPZ2xPb21KYUIy?=
 =?utf-8?B?RmRJWkphQnpoNkhIbmh0ZUpoUDIxdGJLek1BWC96MjB4OEpZOWZ0cFhWRTlU?=
 =?utf-8?B?SlZmV0RFcEJFaWpGTDZtOGhWSno1dG56UHA3eEJoNnBkQnJWTk8yZjJpY0VF?=
 =?utf-8?B?d0hUMXdRd1haWVVsaFZMVk5rSi9VUk9JbUdXdklsSkNCU1cwK2lZb1dWcGd5?=
 =?utf-8?B?bGVnTUM0Z250NmpGZXMxcmp3UE53TjlmU0hQK0Iwbi9CRjdkeGwwbEg2MXdZ?=
 =?utf-8?B?Nnd2L2RGdjhZdnBnQjc3L1JueFdDVW4wcEYrdSs3T2xXdmVhYnVyZ21xU3pp?=
 =?utf-8?B?MEl1bWZNKzdsajRJZnppTk0rRzVnZUh4RlhQV0VnZjBQZzlyNll6N2NhWm5p?=
 =?utf-8?B?T3dhS1hQUStxMFUwQWlrYWljZXFQRTBjY3YyeXpyOUJSRzMySlh4cnZja29m?=
 =?utf-8?B?OTJNU1VwVTFzT1FkTFJEd0xRTTBwenUxNzExUElnbjI5QmI4ODN0UFI4WTlw?=
 =?utf-8?B?N2kveWFpejFiQnllTHBVQTF6TUZQOTRQV3B6Z3hRVUVHTm9YTWR4eXh0b0gv?=
 =?utf-8?B?WWpESU9oc0NqS242eU5oWEZXWnNtelBUazdEcjNDVlpiMUIzR2g0bmRBalBn?=
 =?utf-8?B?Q1EvU01wUlM5NjJrQUJidGtrT2VKc3ZhYk5sNmNXQzdwenZWMGZUVFNZNCtJ?=
 =?utf-8?B?TFNrM0VmWGQvNjIyRWhKTDV3aVJ4QVlHeTFZdWhmOUlTN0ZMdGVySTJSQUEz?=
 =?utf-8?B?Q2JhdXpvRmZaVE1OTTJSMEJVcmc5d2FPNmd4aDRlV3l2YmEwTlRuK1FaVWNo?=
 =?utf-8?B?UTYrTTlIUjBkWUkyMU1lU0taQndjcHdWWU0wenZNSVgwbGVWZHpVYVdCdGM3?=
 =?utf-8?B?SXpKcGYyby9lL21Cam00ZmhSdXlaWXZUTDVQZTN5WkFxRTBqR3JPVXhja2Vx?=
 =?utf-8?B?VDl4YndBbVdYTkoyNlRrK2ZLbmFQZ2hheTIwZk9xcjBmS01sV1AvSmVFQlNV?=
 =?utf-8?B?djgrM0ZQSnpJY043eUIwSloxV3VCRGxGdW5wMVZRazlaSG1rd1ZMZjB3c2VB?=
 =?utf-8?B?QmhpTkVMYmZpY3V5L2NtcmhxeEJQU1FMcG9nZWlocEN2Z0tNUkUrVXhzeWt3?=
 =?utf-8?B?bDVEKzRwcFpDMUVRR2FhZTNZZmJuL1FMSEM5M0lJTVVQbkJWcEl0RmFJM1Y2?=
 =?utf-8?B?eVdsVktxOXVjWXF1U3pUVnk3ZzhPZnhOWm1TaDExS3ZYbDJDc0Z4UEFGdzJP?=
 =?utf-8?B?d2xUQkp4KzM3TGZFb25zN05TNnB2eU1oQ09yTnFMTG5ubmpZVWdYai9wUk5q?=
 =?utf-8?Q?jqY0lv+gpNGvGNDs2d1pA5DCPduVpd5hWQLUbt8sUw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31209098-15d0-467c-edf5-08d9e17936d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:41:37.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdZKwiCHgzFCAtCr44mA8JNB379QE5ULI9GU0zw1OOX/owbkxwaW8xIY6fGW30NQSzZuFFbWzh5/i0TpnaWBypYo1kjRv8IiCeSNn8yzMlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.14.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

27.01.2022 11:21, Stefan Hajnoczi wrote:
> On Wed, Jan 26, 2022 at 05:11:23PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> This series aims to add trace points for each qmp command with help of
>> qapi code generator.
>>
>> v6:
>> 01-04,07: add Stefan's r-b
>> 01: - subject changed
>>      - rename:
>>         gen_trace_events --> gen_tracing
>>         _gen_trace_events --> _gen_tracing
>>         _gent() --> _gen_trace_events()
>>      - a bit more compact code for gent initializing
>> 03: - rename:
>>         gen_trace_events --> gen_tracing
>>         _gen_trace_events --> _gen_tracing
>> 04: fix --add-trace-events -> --gen-trace in commit message
>> 05: - drop extra two sentences
>>      - reword
>>      - add example .trace-events file
>> 06: reword
>> 07: rename option to --suppress-tracing
>>
>> Vladimir Sementsov-Ogievskiy (7):
>>    qapi/gen: Add FOO.trace-events output module
>>    qapi/commands: refactor error handling code
>>    qapi/commands: Optionally generate trace for QMP commands
>>    meson: generate trace events for qmp commands
>>    docs/qapi-code-gen: update to cover trace events code generation
>>    meson: document, why we don't generate trace events for tests/ and
>>      qga/
>>    qapi: generate trace events by default
>>
>>   docs/devel/qapi-code-gen.rst |  25 ++++++++-
>>   meson.build                  |   3 ++
>>   qapi/meson.build             |   7 +++
>>   qga/meson.build              |  10 +++-
>>   scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
>>   scripts/qapi/gen.py          |  31 +++++++++--
>>   scripts/qapi/main.py         |  14 +++--
>>   tests/meson.build            |  10 +++-
>>   trace/meson.build            |  11 ++--
>>   9 files changed, 185 insertions(+), 27 deletions(-)
>>
>> -- 
>> 2.31.1
>>
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

