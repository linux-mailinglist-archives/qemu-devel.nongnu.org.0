Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E25949DEC9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:10:32 +0100 (CET)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1jb-0000yc-Fr
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:10:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Nu-0005UI-BQ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:48:06 -0500
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:1120 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Ns-0001w6-3p
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:48:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl3F1HMwiCt6V4YYITlQyX9CCE19AX3LDvJ3ylcbWGOrRmQ/Qhyqa24eU1sZLlONJPFZVuaYfmBBrWD5g4rJ+mzljlWKUfimtonKqtmDk0JFv3T4bb3pVeZ57akfLGmiTka8r9JraUVYFTC6dqIUJAS/mwSXt9E/QZbnwcZFh60lIx0YglnK59XABzQepGet6FbbZ/EiAPLY6LFWq+z7BDlMzoNDHUdL0V5HzGjC9h8g+50lyZXpc+NNCJ2RTMvH0xyBJC5IGXh7Nx9b5DR14vGNOSXQ8qPI+RQrj6Rq8mgU9AIs/ObN9Ecb92MXhfpBXrQTiz0UfrUst6x57lJgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+hgQKQ1L2JEEI+I4zuVmNJpCUwykayExP2CrPpvxW4=;
 b=Zdm7FbLwnMnuxdYC68VO/7q4cnvWnIOBjCasBX6aPlayQ0NbrGQXQWdaURZHIZTF4TiR4xOl2rweND/zu3uEEjCnldJFKv4z+EkYQIaAH4QWglMs4ukfXD46kfBGPZoquE57fYhMr3rb4oqIw1plofTMC59X+4h4DIpSZotR+U+npng9Zx1w3CU6vBihYa2eKkreg2c8+k8V8R0GKnvx46L+PC4neUOoIs3OmPsyqOyk/3R96OGQ6O5RqW9a+938lcYs/e1gR4V/vWwTvDqg9dsG/mfik87rHKgQGutJmOIEcZ2oA4pQzQ+sj9z2lvMOo6zEW31aEGKH4eodcjTD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+hgQKQ1L2JEEI+I4zuVmNJpCUwykayExP2CrPpvxW4=;
 b=BNMBxuCFiYFbR2brFBHIVfWodzevD2NOIPzldDdA1jCDdxCm3drMbwf1YnfGNWglMu5D9ETRWspVuWhCCVd3BJLiCf7jWCjaP8jJA5qbEbbWaxhD/aEugAIlin1ErGjhekzjUDQN5PCkMwhYSx1fVGNMPluJ6wH9L7CzLiUBVTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3564.eurprd08.prod.outlook.com (2603:10a6:10:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 09:27:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:27:01 +0000
Message-ID: <d8ad6e17-043a-93e7-803a-bc982a460819@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:26:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-7-vsementsov@virtuozzo.com>
 <878rv1wu3f.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <878rv1wu3f.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b70f3bf3-7758-4338-1966-08d9e1772c99
X-MS-TrafficTypeDiagnostic: DB7PR08MB3564:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB35647B71464264429891517CC1219@DB7PR08MB3564.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gruty3X0e8zLkgRuSIbojqGnnxpVxV9k5aZGiMwSjXpGCv/FGCNBheJNKl/4F1r+f4oH+WuPJ0gQRZhy7L2cgbpxy4wpqtqSUundVmn4T4KUs/e1SSlnrAsE/Zp5e7Q1WbXaEmaI7MpMXCB0SjI3ExP7GahGtllVey9iC2IyYEnyrvBvJXdFP+a+F2RrM4TQjhr8OOJIgEIyXVeT4o9c5iGqtos8zfwlXanyH56stt7dbeaZS/1Q78nsOwpUBDXle9e+uKTnhf7nnoRoFh6tgOcNYWsj76vtjYa+0OVu/7vIEeCXjxKJA+xVXPBoZGNp3Y8ao0t+KsDGTBpOmBoT97woaEXxjFZyUup9HLepjBj/7PeFfNfuxe64vTRcq/LnLJQigyd1Zaj0iBjGdfk+SfXRF4WwstsqJ89AhdLoTSfO8Q3p95EkQJ07MsqdPIAQhj1AQw0SQLoY3ccDIurEjlJ8l/f4vchASHcheYpUi4dtbfwGbId5yKwV5OzUxtDCe2bsAJL1B4zzv2vZx029AlV7akhPihWZamR4z1r84n7EdN9hHMn4efOYdO46BcEslk+uwnQ9Y0QVwpo5pa+z/d+jJlCVohy1t3UP+aKS83w6nINJiCgRzmrSgdDMozrNFPZgjxnX9U3Oxl71ScQDF2EQTNHDCQBL/8HJ2K4dseFZKM5dgYs9onNm1JmK1ar1oJoOo00/z50gnn+JX49SWdQ8xUQ2+0LvyixZ0MR8GJ98ktZZ4AZ7agcE7SZo3wonzA8jUYfELE65h0xBGyxxGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(52116002)(6506007)(8676002)(66946007)(31686004)(186003)(4326008)(26005)(508600001)(5660300002)(66476007)(6666004)(36756003)(86362001)(31696002)(66556008)(6916009)(6486002)(6512007)(38100700002)(316002)(2616005)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHcvdWFSLzBlODluMzI4a1F2NlhrdXNMd0NVYTJDQVBySFhNeE5sUzl4OVR0?=
 =?utf-8?B?cUxNOG5qTy9STnlnbW9jUWJ0SHdEVVN1NXlSRHh1TjFUZCtXK3FhR3VhL012?=
 =?utf-8?B?MHM3ZUh0RGpXRVdoYk10YUVwd3F5UjNqN0tZSTdHSDAzalBIQitnbk5zUlVC?=
 =?utf-8?B?YWxFNlhOTC9XYkpCa1U1TS91VzRzZFRaZGVVeUUzZ3BRdFFoR0FjNTlxTGdV?=
 =?utf-8?B?M2IzSWJCclJ0ZmIwUGFOdlJyUXVqUlRCeklUU3p5Q3FtMHBiZGtQNHdmNFlo?=
 =?utf-8?B?N0NKVC9TcXM1NG9lNHlIbDJwYWF6Um90SE1NbWtFdDl2WUludXhCeHhVcjdp?=
 =?utf-8?B?R09SeEY5a0FKL0RacGV5bXR1Njcyd3J5S2lzZ0VEaVpuNXZBQ0VhNWFrb1NF?=
 =?utf-8?B?VnlZM3RpeTJtb2Y2QTJLaTRHSTJtUy9NdUsyT0tReFJkamRybUpxUDUvMlNy?=
 =?utf-8?B?R1VlNmxrQk13ZTV3RUxRYW5JaUV6UnYrVSswMUxqckxnU0VZUENRUHI5eFU4?=
 =?utf-8?B?L2tYY3NnVVVQYTJ4cWwyYTZiSXE5Y21NUEU0eE10UURubWVxYmg2S2NZdUc3?=
 =?utf-8?B?Vlg2RHJpTEJKcERRUnFmZ3cwck1wVlE0YUpuellQMHJicDVNeTRmVUErMmtv?=
 =?utf-8?B?SzgzWFU4N2NNaFY0NzlJS3lRQkdoTWM3V0pKVnR5NmRVVm9KQ3pIQVpWS2lN?=
 =?utf-8?B?eXVnbXVjcWNaclBqSVVEb3BlSEg2TlQwQjJzVW9JVEJmMW8ybjBNUVNmaGZI?=
 =?utf-8?B?L1I0NlZLc3BKZUNzTlpEcXQ0K3Z6Z09BZXNXMDJpcHlBUC96OUJFNi85amxu?=
 =?utf-8?B?NCsrKzZKaVRkTXZLOFVzSndEeGhDRGF1WGpJTk5UdmkvOEdEaTkwdHVXdWxD?=
 =?utf-8?B?WngzYzFsa2U5bzMvMjdPSE1GL0h1SEhJYkZoRWRJV2I5d0dzQWF3Zjd4VnZv?=
 =?utf-8?B?UEF1YXVLdEdUMmRwcWw5eDdGdCtCc1R0YjdTQUs3Qk9TVWhFanVsdTNlNFZS?=
 =?utf-8?B?QlJBWGswMUJYS3NOZWRKbFl2VmQyTnVCbHVUYk80SnBWZjg5VlZhVUxQWTZ0?=
 =?utf-8?B?TjArS051MkQzNSt4OWt1ZVhtYXpvM0ZHK1lQVkFRa1dOVHNYcjRPZC94U25o?=
 =?utf-8?B?YXQrVkxmNGl2c3djNWcwUlhkV3VKWVpqcnN5VVZFSGhYaEUybTA5TjROVk5S?=
 =?utf-8?B?ZVBxdi85SVdWaHY0czZkbmNIeUZDYlY0STliN25Qd0pFS2dGcml2RnhHcVV3?=
 =?utf-8?B?NlZJUUhnRytrS1pBdUNUc2lUUnczaGxUSi91NGhadkI3a2xqdUNvcUJJTUNh?=
 =?utf-8?B?dWpuUWthNlJzOUt5MUZwcHhDNUlkNTlPamU3UWx5VDdxZ1h5NmhzTEE5bFRw?=
 =?utf-8?B?UVRhQlluenhXV0N5emY5WStTRWV0SHFBRG1vSVR2QnNpZnROQ0ZrR2FNdDJH?=
 =?utf-8?B?NGZQaEl6VDRFOUtuOWVQbWZXMDdkdXp1Mi9Bd1VseC9Gd2xXb1hNbmVyMWFo?=
 =?utf-8?B?U3JMMnlta2RuWjhTeS9sRCtQYlFhUTQ4a3V2MUJCclV0cktENERyTWhXTEJQ?=
 =?utf-8?B?VkJCTTNTeVJCaVJXOE5yNUpwVCs2Y1M4TXVYckpOUGo3bG5MM1VCVTM5VlJD?=
 =?utf-8?B?L2dpT0svbG9tSlVscUJCSUwyOGtDeTFDRHN6QmtFRlBKOGFHbFloS0lRdVR3?=
 =?utf-8?B?NVpLYkU0RjFxMjFXQmFpTXlLT0FQOCtDZ2pkYVRLZlYrbXpnU0JmNjI1RURt?=
 =?utf-8?B?T08vOC84bTVYQ0s1dWpUTUlIQlhDS3cwSjBkaDZyazBiaUl1alFxRVhxWEJC?=
 =?utf-8?B?Z0QxdkVLTnVBWSthU0s1K0FmNFpUM0pwOEl4emhDMEtaYnRzVUh4ZTVoOU5u?=
 =?utf-8?B?cnV0a1RXRFk5VkpqK0hCOXZzaUJHTmhKZDUyelVZZWEzZGVpZWUvQU1WNE9t?=
 =?utf-8?B?bnhYTUliWFdMaW1qWHBtRm1mcHhONW16RmxJT0h0VWF5b004NzhWbVp4L3RL?=
 =?utf-8?B?OFl5eFFSVm5KNTVYc0VZN0lhY1VybVcwa010K0c5dUpZK0JKRU8yNjkrclR5?=
 =?utf-8?B?VVFXQkRmZFpnVU9WdEpEMEhONExqbURWcnRtWHl4YWJqdXhyS2hSbU0wazNi?=
 =?utf-8?B?Z2ZQUmxRWGNBQVlEcjdXaHFlcGFydGd1UzVoSktGa1Nkb0orQ3ZreDVCUnhY?=
 =?utf-8?B?NExRbDNIcmgveU9FSkNjVU05NHJaQ0xkTVBBYXk5U1BFUi80NndkTHNQbEVL?=
 =?utf-8?Q?K68zLM4t/rWzDA1qNRL/kvzfpJOqth+JO4xNhsdxYA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70f3bf3-7758-4338-1966-08d9e1772c99
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:27:01.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOPkq9w+pP+i+8VVVHT4synxKW5RqhqDDHEdsaDtlSn7tobsZXfiuyX+5ei70SwdWBt2q+83kS6dkpC23Ge/ciZzTP+OjerezLZqOjTCinY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

27.01.2022 09:50, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Making trace generation work for tests/ and qga/ would involve some
>> Meson hackery to ensure we generate the trace-events files before
>> trace-tool uses them. Since we don't actually support tracing there
>> anyway, we bypass that problem.
>>
>> Let's add corresponding comments.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qga/meson.build   | 7 +++++++
>>   tests/meson.build | 7 +++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/qga/meson.build b/qga/meson.build
>> index cfb1fbc085..724d5a667b 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -15,6 +15,13 @@ qga_qapi_outputs = [
>>     'qga-qapi-visit.h',
>>   ]
>>   
>> +# Problem: to generate trace events, we'd have to add the .trace-events
>> +# file to qapi_trace_events like we do in qapi/meson.build.  Since
>> +# qapi_trace_events is used by trace/meson.build, we'd have to move
>> +# subdir('qga') above subdir('trace') in the top-level meson.build.
>> +# Can't, because it would break the dependency of qga on qemuutil (which
>> +# depends on trace_ss).  Not worth solving now; simply suppress trace
>> +# event generation instead.
>>   qga_qapi_files = custom_target('QGA QAPI files',
>>                                  output: qga_qapi_outputs,
>>                                  input: 'qapi-schema.json',
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 3f3882748a..af8f5b1746 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -31,6 +31,13 @@ test_qapi_outputs = [
>>     'test-qapi-visit.h',
>>   ]
>>   
>> +# Problem: to generate trace events, we'd have to add the .trace-events
>> +# file to qapi_trace_events like we do in qapi/meson.build.  Since
>> +# qapi_trace_events is used by trace/meson.build, we'd have to move
>> +# subdir('qga') above subdir('trace') in the top-level meson.build.
> 
> Shouldn't this be subdir('tests')?

Oops right.

> 
>> +# Can't, because it would break the dependency of qga on qemuutil (which
>> +# depends on trace_ss).  Not worth solving now; simply suppress trace
>> +# event generation instead.
>>   test_qapi_files = custom_target('Test QAPI files',
>>                                   output: test_qapi_outputs,
>>                                   input: files('qapi-schema/qapi-schema-test.json',
> 


-- 
Best regards,
Vladimir

