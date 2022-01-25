Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53E49B29A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:20 +0100 (CET)
Received: from localhost ([::1]:52094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJfU-0004Dx-14
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCJc5-0001E1-78
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:03:49 -0500
Received: from mail-eopbgr00094.outbound.protection.outlook.com
 ([40.107.0.94]:54267 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCJbr-00048A-4z
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:03:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=War2WdKfVxLii7UAUsSpmAnQTEJX8ru+8JsTp8uvbkbwIqCQfabqX6+5ts7uItg1Xhk3ARzuvOEN+H52Z42FZ7RieDhblJ5OECHt6fhCHaSSGPrGHZbGIHkOQWMSv1Zgl7lW9Nltl8uusBWDSBQc7lXw566elb4cIZsPHtYgz+6qo+oY7aKDioMmBm9LjqW/cDTXO7RKem2KTvkr52fYbBxPVu2087u90vN+5o5nShdppxvnsj1GiKGMetDeGa4joKi20n+vNUAZO0phwkoyMsS1sc/ZRxOfSYL6QpL1S3dCdifqSyxqaZaJhJf4qahduKl8B04GJbhRup8F0ygBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG8iaZOOfNfbZfP2L3SMQoXYvwVxOLTfW43mKMaS9Sc=;
 b=jspx36G68xLnwEwDen0qODB+ZGscwEKCM32ZMRSfKzZH0FUPlKO0wObCA9lZRjPzVkTBXusVOcugdZl6kcAtqjf9zop5WfSkQSZkaZcHRtXrB8nGNFyb4CmzczcNAwquzHt6XSTmeCq3D64fpTalwn62DUYjEG8YDw7/1ZqPw7lGbBqGtnEfswcXHxM9rfw3rHxKg5ue7iEQUV/whotxNW+Tx/Lsq+qyqfKzJGw8D2Xxis2RE4hiQ+TZrbckO/66+DtNhfOAeTjLbAg9GNFsl+AuJGJz05I+ZNMXjbviK/WtXdlUlNspZqTyPIZRHeWY1AXzwT409k4mD76SoTvinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG8iaZOOfNfbZfP2L3SMQoXYvwVxOLTfW43mKMaS9Sc=;
 b=j0aH8JpFHBGcg6W00TpR0pksSlR8OII5ZCIoCT8y4HJx6CZWE1s/qy6f8A6wYU8NsYeNFtYFl9Y1sFxC0U6O6WdVHygXHrE5cvntv5G2cIsukmef6Bseeym43C+OU3V56m2wi9bfzl/GPPD+QsmrUHeAJoydHJ0Ow8xx17vlN1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4927.eurprd08.prod.outlook.com (2603:10a6:802:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 11:03:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 11:03:30 +0000
Message-ID: <fd9a18be-1add-89c2-3da3-fa72c5419d44@virtuozzo.com>
Date: Tue, 25 Jan 2022 14:03:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/3] meson: generate trace events for qmp commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-4-vsementsov@virtuozzo.com>
 <87ilu82jtk.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87ilu82jtk.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3bec912-8a18-4b11-bf16-08d9dff251de
X-MS-TrafficTypeDiagnostic: VE1PR08MB4927:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB49276F9D84D692C04F8C3454C15F9@VE1PR08MB4927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEQkcU9lD31dnGXRFABnKUhxAGiI3QbParSkwcA3ASVWJTKD0bIFQ6hTMSQUHZgstXiT14GHC2TkjpZaM/ddrIfx9TFyu809yIvdwRa84Oir0osLNAcVKao/oZHVRDMFsN0lz9dS0ZELyFONzUEiEFhilLjkW+yOcp/jc+iFpzTCTKMrTFQ37d0iOblX6tGPUokwd8GxebRxApeTmy0StmMEf4dArgPR3MaZlsL4Myrf8LdNQhSB1qu1YHRGdgdQFZ0He3BUD18dbY3ipQlSqGCheE6y33vMOIUot3kTmrwNHTDa3WnQhMF2Zgn3sUQiLFlImKvJbLpGHIxF30EBXkspFO6f57ZxbhxBOyjymbywJ+ug8ng9diRI1igyJQoUyaA44uZZuT7mUDkw1qctgHnZs5FeKUE4sHgtJUESVwjR5O/SF3GdvtEK1WLnyuDYYhzfVre7zWQLwh0VEeICZ0rVuOafz62eSDYS+9sMT46YgntPJzlzSItjCs/N0x/bkOvA3+sZSf+ZSJqMpOh5Kz2JCt8xfSFdGw2pEdwZvzomMN1palig5IBLpyjzyXrLNAFXfkcG9yRRfadJvHZU/knkXyGxa2nt22EWGW3eg8F3u1WgXwgeJrOuGVBEpJzOZHmWNMi+cvkxxoLVhJ/IJo+2x+vutWutXlfS98Xt2bTuphtxKCyGPQuod2kh4ID2jGNFN9tRnChJNr3ULAxhWHaAXFENqX2LIZQrfy9X4UsuaKKMQUtjBB+o++sFxCTbKhrdb+iEd5lGzjofPmIuUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(38100700002)(2616005)(38350700002)(508600001)(83380400001)(66476007)(8936002)(6512007)(36756003)(86362001)(6916009)(8676002)(4326008)(31696002)(6506007)(52116002)(2906002)(31686004)(186003)(316002)(66946007)(5660300002)(6666004)(26005)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWFNYUNHRVhEaHpsaS9FOG5sODY0bUlDTUQ5UmVBMEJBU3hzN0Y5ZTNEemRU?=
 =?utf-8?B?T1phMzEwNmlDVnBKS040VjFOcnN1eTIveWplM0xQMlZ0Yk9VN0xKYVZ0cHJ1?=
 =?utf-8?B?SFdxYW5NWGE5VGpLaU10YUsraldvQktTREZFVzIxYlRmUkU4dVdxV1VHNVFY?=
 =?utf-8?B?TEZGOGFUTzFWS1hhZVJHSVoxTURmQzl3c1dYUWNEOTJPdWNGWXdkWGFJRlNT?=
 =?utf-8?B?N1BWK2o5OXR5Y1lzSjI4VHVwbUtscGtoQmV5b1ZJbEhrelZlTWJGbEc3bFBk?=
 =?utf-8?B?WnIrdkFFaCtSd041alRuVFNQQS9qSTQrd3JScDVEQ0FKRUVhdVVyK3BieExY?=
 =?utf-8?B?Sy9YNkI2Rk1FSlRwWnlaOW1XMVM2N01FUjY4NDArSThBWUlHaWlaUHVJTlFG?=
 =?utf-8?B?Yk81TGtiblRUd1JhSE9BVUlBNzNSWlMrYnpoZkNNNDUvNEtHSUEwRnVIZm0v?=
 =?utf-8?B?TDRwZ2NzM1lXRTBuU2UvenNSUWRxeUFCUHl2RW43dWs0MkFMa2NaUEVCTTRr?=
 =?utf-8?B?ZWVYbUEzcEFrRGR2a2dwcU4wNERFMTN6UDRrckM3dVAvSUdwdEE3MzQzbENl?=
 =?utf-8?B?R2NUVGpVSktaK3ZPSVJzR3hWQ3Q1aWR1RkJmbWR2TmFCSkhWdXprVVlxVmVX?=
 =?utf-8?B?R1Fqcnhtd2tLU3pja1RMTG8raWhGWWJqaUxlcUptWE1wOVJ5NDE0QTRnTnY4?=
 =?utf-8?B?ZStndXlZaTNhVHJFR2hwWUZ2T21sbmJOR0FqYU9YNGJEbFF4Z1AxT2Judit1?=
 =?utf-8?B?NHNMNGY2Q2tQTHp3NGRiU3ZiZ1Jlclh5Q3dmbFpJYU00U09qSzFoYVIwYXJk?=
 =?utf-8?B?MDVpQWxTdUVXb2lBWUp4QW9SUmNBQjVHMVhTVW55ajJjQms3RjhMaVp6L202?=
 =?utf-8?B?MnZRVkE0L09tR0Jqd0RMSjZzcytsMHd5cFVUWlBRbXN5UW15QmFoNXo5TUFz?=
 =?utf-8?B?M0RPTWNGTFVhQnJCY1NUTU94dXhSMWVMR0xhNjYvbXVKalEyNEQxRHFRMWlX?=
 =?utf-8?B?UGRlaUE3VFd4MUxFcWlVY2RIQWNaV29ZN1pha3BLZlR2VHZZa2p6MG5LUmNt?=
 =?utf-8?B?dll5c1RudGJuT3hrMWhUTEtuUGkza3Vnb1JpWVh2MzFXSis3Q0htOG85VHg5?=
 =?utf-8?B?R1p5ZStxOEVZV2JCaFcrb21NUVJLZVNJamZNclAzcDY3aDROUUtvUk85RWYz?=
 =?utf-8?B?ZndXZnEwVWRqa0R0S1JlNGRRaGpTbzFuTGJNMC9YTkNqcnpKc280TzQvc1k3?=
 =?utf-8?B?dHh3RWZuSTBMNGZxOTg3a3RJcGhYVHR5cTh0UXA1VTYxcmpYTEx5TGt4UWRq?=
 =?utf-8?B?cUZaNVBQVXVwODc2NThmOXBzc2pqcFRMeFl4NUR5WTNZekwvcjZvWWU3RWgw?=
 =?utf-8?B?bWlFTnJtbjdCTkVNNGE0cG1YUHBrdWxCbW43azNJRVJiZ1JIM2FrcFo0M0JE?=
 =?utf-8?B?VEhTdmxPdW9UeXFQNUNrVytLenVzak9uTkloVFdvV2xpdkxCOUswZHhqOXJC?=
 =?utf-8?B?N2M4NnR2aTFHS1dZbnVyNjhaSWRSbTF5SUN0MHJHYnJzSWM1TElGWUlqSVJV?=
 =?utf-8?B?QWJtZEluZFFLRVJFcUFwZTJJSlR2VjFWTzZqSnB3SlpUbGkxUnpOenRIVG5W?=
 =?utf-8?B?NDd2WTRTN3BsOG9CMk1rRjVDUmJxYW9Zbks2SitVbzJwNU5ZZDE4Mlptb000?=
 =?utf-8?B?UnBRM0RySVNMUUgzUTJ3YjZaTGo5ZWpPWlU5L2QwK0xBcXFMOWlPNmZmcGFn?=
 =?utf-8?B?MStvRmsyYWFUQi9iOFUrblJ2dWRKQiswT1RDdjRNc3NtVWhWZVV3ekw4Zjdn?=
 =?utf-8?B?NElON08waVpaY3RBNFFWUWVTKzVOSW5WNFFSVzBVV1VJcjlJYnNIeXpyNlNt?=
 =?utf-8?B?MGFFL1BhUmFOeS91NHNsZVNBNVZWUEdRanVOb0ZmeXcrYXRxbWdXR2tqMVpl?=
 =?utf-8?B?S2pNeFBmSENNb28xQ0c0ekk2VS9qd05EWnZGSUlvWkpLYktaNTM5TU9RUFhy?=
 =?utf-8?B?RmxYR21pWXEvT1FYQXRkZXI5UjErNm9DckR4ZVo4b2thVCtLVi9UaWtjcXE2?=
 =?utf-8?B?aVVIa252cVVKempPOTc4SkZlNm81aFI3dENkMlhUWEo0emdneGNNT3dOcnFV?=
 =?utf-8?B?OFdNVE9PUlEzbUU4YzE0OE9xSGI3bnVZU2ZwMWNVVXliUTYvUUZNN09pUVVj?=
 =?utf-8?B?clVZK1BPeWFFWG1HeWs1RHhUVkxBekpMVHBUdXlUd1drRXhvZEd6eWJuaVVO?=
 =?utf-8?Q?vlS8YuGvNaY2SoQgylCJq+TlHxLqy5iRjwneekxl7g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bec912-8a18-4b11-bf16-08d9dff251de
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 11:03:30.0923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+V0rqRU1Fy0OY60M6KwT3hP9cIzO2I6Oz1gg882m/rOFpFM04ACjdyxO71fWEMvnhPJqMHrssV9KOMf5mrFZ6kJVh1hojm6rPlAY5yncwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4927
Received-SPF: pass client-ip=40.107.0.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

25.01.2022 13:25, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 1. Add --no-trace-events to suppress trace events generation in some
>>     cases, and make trace events be generated by default.
>> 2. Add corresponding .trace-events files as outputs in qapi_files
>>     custom target
>> 3. Define global qapi_trace_events list of .trace-events file targets,
>>     to fill in trace/qapi.build and to use in trace/meson.build
>> 4. In trace/meson.build use the new array as an additional source of
>>     .trace_events files to be processed
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++--
> 
> The doc update isn't mentioned in the commit message.
> 
>>   meson.build                  |  3 +++
>>   qapi/meson.build             |  7 +++++++
>>   qga/meson.build              | 11 ++++++++++-
>>   scripts/qapi/main.py         | 10 +++++++---
>>   tests/meson.build            | 11 ++++++++++-
>>   trace/meson.build            | 11 ++++++++---
>>   7 files changed, 66 insertions(+), 10 deletions(-)
> 
> This commit consists of a small QAPI code generator change, build system
> work to put it to use, and QAPI documentation update for the series'
> feature.
> 
> I'd reshuffle as follows:
> 
> * Squash the main.py change into the previous commit.
> 
> * Split off the doc update into its own commit.
> 
> This way, build system experts can provide an R-by in good conscience
> without reviewing the doc update, and vice versa.
> 

But I think this way build will fail on previous commit. Or we should still keep trace-generation disabled in previous commit, and enable it only together with meson changes.

-- 
Best regards,
Vladimir

