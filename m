Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F13CB6C1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:34:19 +0200 (CEST)
Received: from localhost ([::1]:36752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4M6k-0006cr-Ko
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4M52-0004VV-JL; Fri, 16 Jul 2021 07:32:32 -0400
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:42382 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4M50-00032Q-4j; Fri, 16 Jul 2021 07:32:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rpy3PQfthse3a7+CJg/bHxpxuU7q4E5tYiTXntilTfrEl9g1XNg+TxjOj53E41S/wooYLi9uAoSAIw8vqKEmuqdHX+cX8249kro6RlzGWuKbGsUgq3pWoRo3Obz4u6ysDn5cJJrfikvQJ6XPyJI3jBkWmrsh9Zgrx2oT1vnNkVYNmKwvQCTOgaA530zEqagiDH4JOBg5t3ankXO2J1fArTDBx+4/e1S6zGBsYOX3hMCQAtDqzsYLBgot6esv1n3rt2m+rRZR/5ObAEGblZiVRIMI3X4QFQbHQjzMt7z6WurenHkeQXJPwE7R40Jt0wT4dHobK8IIjyCfG/NuTD82dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iaa5i/wufQOVqZY1oXzON1CSqLE5FgeChbAIfS4M86I=;
 b=R9UQXSj8cLhDY/7OvSjdphNQN4FUm/Sncvy2pF5CzEgkyeMEQEAMVSSptSwrRvVrDZavv/V3zTAcW7uD7S8uaGa4GnymryJKg80a2imVZqaukpQX1GAe4eOJATiXixnWsDD//46GDlATJLGU5A3h+C4xfXK+Nv02Aty75nAHRZgkMt+2KbyM/Q8YRnRbIuLH68IKqer6Fzn8U+Zn3vB+fmq1fQWq/u+LAEzpd06R/Sp2miuY+IBaJWgoCxyeqh1bJnueZeWjpSxaDctgOeb7oMdq8IdSrdhAy84t5N6NwN3ERL9+3g187VYkdbPQ0zRldMayI/JgIt+/CVmkCsC3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iaa5i/wufQOVqZY1oXzON1CSqLE5FgeChbAIfS4M86I=;
 b=sG4GgndE+0zR7PtGD6vH+7dGwSp5Ng+yYZ1XVn05n3NczE52SgeEjqkzuigDQnC3eKPhv47apwOmYQlnWznP9fSxQxjRxsst8tSPEao3WAGSdE5iPdWp5Qbfaug+i843TU4T0vX7amk4/6o25uePhGiol6dJ0IQFkI4kt72HHXs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 11:32:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 11:32:25 +0000
Subject: Re: [PATCH 05/14] iotests.py: filter compression type out
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-6-vsementsov@virtuozzo.com>
 <9ffe4dc6-f7c1-a788-84f8-03a763df2729@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9cbedf8d-27a1-6a90-b030-98f3a19a3c05@virtuozzo.com>
Date: Fri, 16 Jul 2021 14:32:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9ffe4dc6-f7c1-a788-84f8-03a763df2729@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 11:32:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ceea397-91f4-493e-d074-08d9484d628e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61689749C5BC02CBE8A9682FC1119@AS8PR08MB6168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1xIWkZQDHhwrk8EFCxHyCEqehwzwz4vPeWmA8FbHpQF/EgOSf8Wl3iRdrIgFPbgoRie7XbEoVHjFRWKavyG4CGhIaPrctdYjH0Ut+CaCHmeCLuB1daV/tRPQqC+kg+t07mEluncDzm4RitENQf9SYUxEGsAGHCUJ2o8zKk+D6QQ3ClNvYIRxS3SjGGbZhu8Zl+wBRcnHi6r8rOhMat+6GwHHWHilHbkpTzwEWDOiGaYpGsrdoNSdameC9KHkm4eTnGwwDybyWJh3eLUZ20G3RWiKIEgB/uDltGEHcAZn3BPQuXw+tJkIlOlQribCwf1zQovxBc7sUzmJE15Hc5a1nQqGinINEvZu9YKmUujXV6CVQJxtR4DFTCDT6kn2XKoZJDf4FD9BNu0PRFxUNxt3XvDWILamweSeniD9iEvoLCLZPJYCT1HwO4+5b+lSq1Bph7cDR95G9ZhiZF6s6uDrrs+y95m73EnoOWFPK4ki+vrOOnGjbbwnhCDwIAxH2HPZCJ+i0VxKNAypjEbH9tB2OxUlt33aGnlrdjeAcaTeLF3In/0UGPIE54WCVgz7rOFkWdkW+/t2lwB3kXJvBynaNgs3ncglN6mp1+iOm6+lRBDua3J/AgC/y8HPvRqMigRvxF5F7rQUGR8riRHRG+/wMZk9z/1dhk0gsTuua1wnJKD6daAVVm/55nyA8mPmr9b6QVKlCATh8Fo6J6rIsxQpB8BxBc2OfbGpTk/YfPGcyZaqVs8kbeTU9dLyMRX9v+WHWJC2z72N/aPBwX2vNjLxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(346002)(376002)(396003)(186003)(478600001)(52116002)(2906002)(8676002)(38350700002)(38100700002)(31696002)(8936002)(316002)(4326008)(86362001)(66476007)(66556008)(2616005)(31686004)(16576012)(6486002)(53546011)(956004)(5660300002)(26005)(83380400001)(36756003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTg3Mzc0dTZNd3U0dmRnL1ljUUNEL1U2YVJhOUJ3aWFKbFYxQTRySjl3czVD?=
 =?utf-8?B?LzRYNkVzVFFXWkFldEEzVTBXVHlBVXZNcHZrNE5QUUprSjY3ekRZdy9FOFVy?=
 =?utf-8?B?aFNpa1lodXdPdlpRb3FWVTRyRWJrSEs5Wldqdkt3L0JjdUY4QmtrWExqTjkw?=
 =?utf-8?B?cjhzOTZQQ1NTYkpmN1FwSjlTTExNaFFNdk4yVWd2UUQ2SG9YVU1WTzZwYUkr?=
 =?utf-8?B?bmVZNUpOYjVtVWRTa29FNHpCWHRQOUYzelJMQnVxU0xVNUtXYkJhekp5TjBP?=
 =?utf-8?B?dlZuZURVQ0cvYis3SnRpcGViTmlMOGFVWEdIT2cxMkp4Q1lVb2JvT0tvZExY?=
 =?utf-8?B?TFh5Q2wvMEVCdW1VbWx6WUNKWXo1K0VqYmFTbC9RdWZZM0ZGL2xzSXUzekxI?=
 =?utf-8?B?NW00eDF3d0hMTHZnSGN4ZmQ4QzJqczZsSTBCbmNhQVpRQTd5UlZEcWpXaGw3?=
 =?utf-8?B?cFFOVWZqVUVlSlBDc3crZEUyakh2UWlNbk4xZi9pOXJuYmU4S2M5Ni9mTE9r?=
 =?utf-8?B?ejdEdm85YjRxdnZyR0syRXBnM2E1SHBtVVdRZEJ2bW1uVHkydjV2ZU15dXBl?=
 =?utf-8?B?U0ZzbzcvaEpZd2g4WHU0dEpteFZvVWFjNy9Tb1dLbXBkbnlQWkhSZjI1RVBC?=
 =?utf-8?B?Y1p1V1JZYlhoaEs2ajMzRGJSRHozbFVDaFJBcjUvWlRqd3ZrVFA2cnZ0anVr?=
 =?utf-8?B?cllPN0VVKy9Ib2RoZFdPbzNNK3dtVmlKbEExa2I4WXFuTDlGNkVycWhEWGtZ?=
 =?utf-8?B?N0c5NndtSDRNVDhiZXliSWxKWVllR0tmTVNFS2s3WWY5V2xIRmdpT3lIbnhX?=
 =?utf-8?B?TUhaS2dpV1A2MzNIZ3dxUC9TN0hscnhkZlhkU2RpVHoxSS9mWENTRFEvZGI4?=
 =?utf-8?B?RytXckV5cWROaTRPQ01FektIc2ZsNW00WWxVaTAwSjBEYytlZnArNUUzTzIw?=
 =?utf-8?B?a1JIYit5cjFUUXdLdWJtc3grUmZjYnN1VUFsdzFpMU1WNW16VExaNFlySEVF?=
 =?utf-8?B?T0RUTXdjRW84ZGtQTHc1ZEFaYUlLK3VCWGh0NGtNem9objh6RDJKYkRwUnJp?=
 =?utf-8?B?MGZZcEF5UExaYVZtb3JSMnVqdW11RXJOWHZna3RhWnI0em5GMmhpMEhmd3I4?=
 =?utf-8?B?eGhKNXdiRE1FdjhQS0VTblg5czdDYjZGd1NyUzNtbFVvalJZNXEzVjM4TldZ?=
 =?utf-8?B?c1dzWHp4QkRrek96SER5UTFtMGJiRU5QVHpCUzVhcTVvaUxIUUZ4cmMzQzNB?=
 =?utf-8?B?VWErYkRSeEZrSllSNkcrbFRYTEJJTDNYVTBSYzA5aG1UeGRMK1BJaURDMitQ?=
 =?utf-8?B?clYzb0h6MjdJV2d5YTJHQVd3VVZhRUpscXIxMWNuNkdMV25uYzhtUi9MakZm?=
 =?utf-8?B?Yis2eG5QSlpvMGZ2Wm5XTm9BMnlrN1Z6OGhndmx3TWE3d2lFeDZmR0lsQTlH?=
 =?utf-8?B?cDBsaGpkeWJHbzZEelduY0kzQXVpVUFWVEJ6cTRxWGZmZFRIL25jOVJkQ0tJ?=
 =?utf-8?B?Vzc3TlY5Wis5MzZycHBRb21lOUhkZVlTM2x4cnpTYmFZRGtMbVJMaEhNRytV?=
 =?utf-8?B?ak5hNzE0b2dEUy9TQkVhSkcySlR2dFMvazkrOVhEaktZNGdYQ0xieTlXVjlV?=
 =?utf-8?B?UVpqYmZwdytVZ1M2QnNiSFV4UmV2K1lQcVJJWk9YRlVKRmtrUVBHZ25PS1Ry?=
 =?utf-8?B?WmZmaXM4VWFIUFpjbHlpQWdpV0NxYy8veU1FZVB3MXlmb0MzNkFONmhNWTQy?=
 =?utf-8?Q?SqP8uyKPksU1m7MSfnYZU/yuvdQGd2WP8d3M460?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceea397-91f4-493e-d074-08d9484d628e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 11:32:25.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Gqypohp8SYoLCyUb0EcwhZefZqikTyozyXA49YiykOi4g294X9B+a5206jccjTI1d+HPqBFWpNngyRj23wSU6HjnkNstppqy2bvczQsj6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168
Received-SPF: pass client-ip=40.107.14.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

16.07.2021 14:15, Max Reitz wrote:
> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> We want iotests pass with both the default zlib compression and with
>> IMGOPTS='compression_type=zstd'.
>>
>> Actually the only test that is interested in real compression type in
>> test output is 287 (test for qcow2 compression type) and it's in bash.
>> So for now we can safely filter out compression type in all qcow2
>> tests.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/206.out    | 10 +++---
>>   tests/qemu-iotests/242.out    | 10 +++---
>>   tests/qemu-iotests/255.out    |  8 ++---
>>   tests/qemu-iotests/274.out    | 68 +++++++++++++++++------------------
>>   tests/qemu-iotests/280.out    |  2 +-
>>   tests/qemu-iotests/iotests.py | 13 ++++++-
>>   6 files changed, 61 insertions(+), 50 deletions(-)
> 
> Looks OK, though I wonder if it weren’t better to have a filter that only prints some options and explicitly filters out everything else.

That means larger work and larger audit of what actually each test wants to see in the output..

  (Well, actually, I’d prefer not to have the “Formatting…” line in the reference output at all, because I don’t see the point, but I suppose that can be considered a different problem.)

Hmm. I like the idea of dropping this line, I don't remember any bug that this line helped to catch, but we have to update it every time we add some new option. I can make a separate patch in v2 to just filter it out everywhere.

> 
> [...]
> 
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index 80f0cb4f42..6a8cc1bad7 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -224,9 +224,18 @@ def qemu_img_verbose(*args):
>>                            % (-exitcode, ' '.join(qemu_img_args + list(args))))
>>       return exitcode
>> +def filter_img_create(text: str) -> str:
>> +    return re.sub('(compression_type=)(zlib|zstd)', r'\1COMPRESSION_TYPE',
>> +                  text)
>> +
>>   def qemu_img_pipe(*args: str) -> str:
>>       '''Run qemu-img and return its output'''
>> -    return qemu_img_pipe_and_status(*args)[0]
>> +    output =  qemu_img_pipe_and_status(*args)[0]
> 
> There’s a superfluous space after '='.
> 
>> +
>> +    if args[0] == 'create':
>> +        return filter_img_create(output)
>> +
>> +    return output
> 
> Wouldn’t it make more sense to have this filter be in qemu_img_pipe_and_status()?
> 

Hmm probably someone want to not filter information out, then qemu_img_pipe_and_status() will be a way to get unfiltered output..

But I tend to agree, as in 02 I do generic logic in qemu_img_pipe_and_status(), so until we have a good reason, it's better to keep all generic logic in one place. OK, will move it to qemu_img_pipe_and_status()

> 
>>   def qemu_img_log(*args):
>>       result = qemu_img_pipe(*args)
>> @@ -479,6 +488,8 @@ def filter_img_info(output, filename):
>>                         'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
>>                         line)
>>           line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
>> +        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
>> +                      line)
>>           lines.append(line)
>>       return '\n'.join(lines)
> 


-- 
Best regards,
Vladimir

