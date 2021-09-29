Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467941CA23
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:31:04 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcU3-0008EF-H2
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVcRb-0005pf-Nb; Wed, 29 Sep 2021 12:28:31 -0400
Received: from mail-eopbgr80138.outbound.protection.outlook.com
 ([40.107.8.138]:50756 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVcRY-0002Nc-EZ; Wed, 29 Sep 2021 12:28:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeMQcdD4EEWcQDRMMndzPLlt9mTpveA04TMScLY3sll8HItzbsV7aHNVOHiFw3hkeenzJJYpQwqR8B81m9fn6fDqO7DlV4vUYU9PcnKgmkomD3zl4kFxr/MGX68dzDVxUviVgl2NVXj+FpA9Zk62GK++/gJQoDetgpA0tc2eRaKEYh3A92X9dzZzH3MacdSGfJVr49kkbqct67SjdzKisd6+5yGAEwrvkbiuCa6u7p1oZBfXVd1Kb15N6Sb9uzy5LjqWzn4RIpwYZtHIZHBlYogZ52QKiNGcLHpjGJzquXN0Z9ma5z0HZmHUqLKOrAwBtOoYNqYx9+hSbXM9aXEixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u4ZfL/eyFwnEJR9MlU7qHHLyn5o3lEC4OF639J15LXw=;
 b=Vr+7aYEG9OSAheXCCf2gFVsErXuqQIB6fenx4q9xCYX4aivAnPcusrRqAP5/EEjO870khAC2qG2aXHe9VZA0suDxEL+jmZPp4Cai86upSmvlvCpAOxi5rtxfgfj7537750/R4tLjsXPGLGBHFNGB3REQ3MgGvuiPhGt+HXjwFUaRDGgnVkJLo9yaK3ZzBKh0v/mpsMBlstcHRFjJtjZELfRxDaNZsseQGXFs1dj3LThnocfxJ25zgOMy7X9ISLZJ00U0dDdghrllHCb60QQ8FzXrx150yMZVhXnPJnDuqGCwkGxu+aM8CAAOfBXazFp2tpSIdT5+VFkLwxv/jOOVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ZfL/eyFwnEJR9MlU7qHHLyn5o3lEC4OF639J15LXw=;
 b=rlrOsV6DAYvYAYdwDfj3A7Tu1ptvX3x26CbiNxWbOME/607g9WjV3dODIjzSr3M0nDrBZySSVZgr7jqisnsccXb5q5iwLNLJGQACh0ElicTYDkVa0jy3xTRy0YAmH/7t4nZcQMXhuQpf6l8kxEZNf6JG0wTrgenAC5t3fRktAKE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 16:28:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 16:28:23 +0000
Subject: Re: [PATCH 3/4] qemu-img: add --shallow option for qemu-img compare
 --stat
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, den@openvz.org
References: <20210929133427.44923-1-vsementsov@virtuozzo.com>
 <20210929133427.44923-4-vsementsov@virtuozzo.com>
 <CAMRbyyt4fmsUni0ZxaUTG-FKYgUQeK2N+p1Le9j9tWUOBLuQiA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4b487f2a-947e-0c14-e7cb-992835dcdb27@virtuozzo.com>
Date: Wed, 29 Sep 2021 19:28:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAMRbyyt4fmsUni0ZxaUTG-FKYgUQeK2N+p1Le9j9tWUOBLuQiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0007.eurprd07.prod.outlook.com
 (2603:10a6:203:51::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.13] (185.215.60.227) by
 AM5PR0701CA0007.eurprd07.prod.outlook.com (2603:10a6:203:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Wed, 29 Sep 2021 16:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e66130a-f566-4cb9-cbda-08d98366282b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB478842228A381D2A6DF94978C1A99@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mE70djcdc2zOD0mTbSi3KJLw1dAHjI9jVGKDdoJvjtkdAXNylgaosjGwX3ULyMrE0tnI52ozR621EVY4DH2tiYkUbDZJp1kGwaCMHenw6+3TS7KtATYxv+/DULghmiZUzspB1MDE3gI703T4pmR2Ayzvlg6BT+yxW2Bw24p7k8s6tYQBsiZyHtmCYg4IRHCdQFiHRYQYWdN523y+/K906fzg7fKL/GoAM63pHUHswvzkOmRMFS/uCGwRQkAyYcDCI9e3sCTmG+hWilc3gBiycYdEw10anG5Cv1aZeALqMGWHFDvJCZxuOejew8EXK6QVa6qGME+gUtKF427KuEyuZvH9Rt7F12JtBE34kkklURtrmB07hqHdmyI4g0hiF3x1EDbtgwYM6rYrj3L89jb0IbliSQulib/w7bGiY8LiwR+N5fihdmrG6HNbsmbgZZzziRuWtdfvYs5N/FBmbPR2+CIhOi69FodKTLfMnQfPDyoIDhnzqp6V+nuOEykWp/xszUrDeGEwB5o5GfjwZ/n/N1UxlNVXqd78L/jD29qiffcUMJi9q1+mF13mqdHhmAXHHj4FjfwZI9jN6csQmGMmA3+NTcLrbWiXcMfSgeFx7puvnifrWbdfIrnZHU37/A+XCB5M60q6cf6LDbd8u2DzYCmNmcRtHxKgtt6JTEFaldCUqbAUKAthPb/iwFSuN9WKSzp1lx0b9gJlvZFveKFwQ5TXcfMyoVtYdeBy5mXToXPBegCDE6XFpKblH+0m6IqvxoLo1tuuO5jemCQiCAs0OpCDP3oBeyWcuHVUPC4cRo49jF4jwKrLlJT1lkPyQS5DzgpcPYt1GTbQr3ISvAbN91HGww/WR0UZBvaX2q+OCpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(52116002)(508600001)(86362001)(5660300002)(31686004)(26005)(66556008)(66476007)(66946007)(16576012)(6916009)(4326008)(316002)(186003)(54906003)(6486002)(966005)(31696002)(36756003)(8676002)(2906002)(8936002)(38350700002)(83380400001)(2616005)(956004)(38100700002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3pKZDUwTndQRDExa3R2aGtPTGlONnUxNG45UTZmQzI5cUFuSXZETk1vUUQ4?=
 =?utf-8?B?SjhxYXl6WnY5ZnRVaWlFS0x4V2xGYk8rVWprUzZPOTVtQlpGcmQ5NnlILzFP?=
 =?utf-8?B?eU9kdWdUbnlGbjVDREI0cUFxL2t0aVpITUl0NndGZGtzV2tud1c5MGg0aUVL?=
 =?utf-8?B?cGR6R1M5OE9xUVlQOGFWaEpyUXFuQXBmMnVsa0o3TE9yeTJXVzk5MzQwcFcx?=
 =?utf-8?B?SUN6Yk84NE0vWHM3c3krbzhKQTlOcDcyM1ErR0pxSUNnN004Z2x1bkFnWWpv?=
 =?utf-8?B?T29PSEduam5GZUlIN0ZlZ0NnKzVqeTdkS2pwV3NHQ3NpclZJTU1wQjFXVGl1?=
 =?utf-8?B?N2owdlpkYkladXdXazZTc0tXRDRyamp2NEN0WWRBK2FlY21EY1pGUTFjUEdn?=
 =?utf-8?B?QWJMT2dCOExQV1NGeHFrQWNneldiWWM2WENXU2RraWhmY1JpMkRrZmVDN0pV?=
 =?utf-8?B?VnRuSWVaVzREVWRtK0RtbTVKTU5odVJPREJvMnBtQ1NYY2ljcDlGWS9NeGlv?=
 =?utf-8?B?WUpEdU1OMFRzeDNCK0plQWp1UUZxZy9BdEI2WVRScEorUGNaWlZzQTY2Q05l?=
 =?utf-8?B?R0hjK3hDelZmeU5DeTVsS3hwVGtvdkhGbkJSZXBoRWJ6T253Q3FvTEU5Uktw?=
 =?utf-8?B?SEpmcTJ1UW44QW1ONmlqU0NZT2d3Uk1EZ010S21PK0tYS1VINndNOGxJc3RN?=
 =?utf-8?B?NHBXVkgxcmRlRFJVbC9jTUw1K2VONFNydVM5SG96VWRFa2s1bU4rMGtkNnNj?=
 =?utf-8?B?NmxIaUdzSWl6c1FMamJXeFl4cnNUM21nb2NERDdkNDJWNkdJYk43dStTRHN3?=
 =?utf-8?B?UzNsbVdHNVRyWDl0N2I2OWtMdFVCcW5mN2JyM2VLRVF5K1RkNW5qbEpWRm9r?=
 =?utf-8?B?VGdDMEJ1RzBQNjEwZWxHaVoxNVlCQklOdzlxNG9qYUh6cTU2bEhyNHdHZWxU?=
 =?utf-8?B?WTBqZ3dDWCswQnZiZTk5ODhzc2xhVkZwZDJBbzRna1RTSENIcjk4a0F6Q2lX?=
 =?utf-8?B?c3YrUE92Qmk4b0JlZVA3VWFuTi9Eb3FvbXFjcXk0OXRzS2hCMG40V1Z3U1hB?=
 =?utf-8?B?L082QUJ2OURCVG9Ea2V1Z0h0UjVSU1VvaEpITHB6UFFNenVnaGxFNnduREZv?=
 =?utf-8?B?amlPQ0tEcWovK0RoMmV4Z0ZmS0dTZ2xxUGJ0OEtvY3hVb2lrQ2dQL2JQTmF3?=
 =?utf-8?B?cWFaYzhJYVdvZ1NDY3NiczIyVWtFbVp5SG4xYWk1Z0NXeDhyRHpsYlMvTEV4?=
 =?utf-8?B?YnZhMlFjMUp3aUU1cjVqZGwxSFlrM3NQaE44Snk3eWIyaG5jbVNJdnZheTJH?=
 =?utf-8?B?Z2JOTVM1WldkMEdNS0tBdjZNOVlYNGFpVWhrbnBtZTMxdmxWZXpwOVB2S0pr?=
 =?utf-8?B?R1h5d0Q1cHRwa1dpdWMrTDNBRXhnVlpyWmRGYlJ5Z0FCdE9YOVJiekovNnBB?=
 =?utf-8?B?a0E1eHl6bHEvZHZ1OG5EdXBkcnVQVkZaRHRxQWx3cHNNK2wySEJDTGtwZmNL?=
 =?utf-8?B?ZGNlVERVbmFNUEs3YWpoa2w0NTBEVFVycmpGbFhydDVlN0VyV2UzWFY5RWlz?=
 =?utf-8?B?YUZwTmhKOTZXYmdnQlV2c3RGM1J6bmNQRFRyQUxkRy83bSt6b2RNZHFVZmM1?=
 =?utf-8?B?aThnTDNkbDNBeTZJNmFLenNORnA3cE1KQjc2Y1NmNVlJV2xFTXVIZlVyRElh?=
 =?utf-8?B?NDEzWUZxTVNsT0RuNmxjSlNlekhSQTc4RllGMGVQZ3NiRFY3TTBIaEJ0MTYy?=
 =?utf-8?Q?CNkkMgTLeNEJ8sU+tUTzmqVjqHQZjQWcA+zBTdh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e66130a-f566-4cb9-cbda-08d98366282b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 16:28:23.6086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fK2l0DAhuXtLHoIlQ9mFRefpqNZ3qo2sMcdxiz4B7stBkIVrCwriQ3WXVvBExzeGb4R0iDUC04OP4+aA5SKwBtq3SrL/lfMkCtvSJGU+9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.8.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_NONE=-0.0001,
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

29.09.2021 19:00, Nir Soffer wrote:
> On Wed, Sep 29, 2021 at 4:37 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> Allow compare only top images of backing chains. That's useful for
>> comparing two increments from the same chain of incremental backups.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/tools/qemu-img.rst |  8 +++++++-
>>   qemu-img.c              | 14 ++++++++++++--
>>   qemu-img-cmds.hx        |  4 ++--
>>   3 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index 4b382ca2b0..c8ae96be6a 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -176,6 +176,12 @@ Parameters to compare subcommand:
>>       - If both files don't specify cluster-size, use default of 64K
>>       - If only one file specify cluster-size, just use it.
>>
>> +.. option:: --shallow
> 
> We use the same term in oVirt when we upload/download one layer from a chain.
> 
>> +  Only allowed with ``--stat``. This option prevents opening and comparing
>> +  any backing files. This is useful to compare incremental images from
>> +  the chain of incremental backups.
> 
> This is useful also without --stat. Our current workaround in oVirt is
> to use unsafe
> rebase to disconnect the top image from the base image so we can compare
> source and destination image after backup.
> 
> Here is an example of test code that could use --shallow (regardless of --stat):
> https://github.com/oVirt/ovirt-imageio/blob/master/daemon/test/backup_test.py#L114
> 
> Do you have any reason to limit --shallow to --stats?


Hmm. I wrongly thought that without --stat qemu-img compare will fail on first mismatch, which will occur soon, as we don't have backing images and it's just superfluous.

But actually, qemu-img will not compare "unallocated" areas.

Ok, I agree, in v2 I'll allow --shallow without --stat.


Another question to discuss: we already have "-u" option in qemu-img create and qemu-img rebase to not open backing files. And 'u' means 'unsafe'.
I don't think that "unsafe" term is good for qemu-img compare --stat, that's why I decided to call it differently: "shallow".
Still for qemu-img compare (without --stat) "unsafe" term make sense.


So, it probably better to follow common notation, and call the option "-u".


> 
>> +
>>   Parameters to convert subcommand:
>>
>>   .. program:: qemu-img-convert
>> @@ -395,7 +401,7 @@ Command description:
>>
>>     The rate limit for the commit process is specified by ``-r``.
>>
>> -.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
>> +.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
>>
>>     Check if two images have the same content. You can compare images with
>>     different format or settings.
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 61e7f470bb..e8ae412c38 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -85,6 +85,7 @@ enum {
>>       OPTION_SKIP_BROKEN = 277,
>>       OPTION_STAT = 277,
>>       OPTION_BLOCK_SIZE = 278,
>> +    OPTION_SHALLOW = 279,
>>   };
>>
>>   typedef enum OutputFormat {
>> @@ -1482,7 +1483,7 @@ static int img_compare(int argc, char **argv)
>>       int64_t block_end;
>>       int ret = 0; /* return value - 0 Ident, 1 Different, >1 Error */
>>       bool progress = false, quiet = false, strict = false;
>> -    int flags;
>> +    int flags = 0;
>>       bool writethrough;
>>       int64_t total_size;
>>       int64_t offset = 0;
>> @@ -1504,6 +1505,7 @@ static int img_compare(int argc, char **argv)
>>               {"force-share", no_argument, 0, 'U'},
>>               {"stat", no_argument, 0, OPTION_STAT},
>>               {"block-size", required_argument, 0, OPTION_BLOCK_SIZE},
>> +            {"shallow", no_argument, 0, OPTION_SHALLOW},
>>               {0, 0, 0, 0}
>>           };
>>           c = getopt_long(argc, argv, ":hf:F:T:pqsU",
>> @@ -1569,6 +1571,9 @@ static int img_compare(int argc, char **argv)
>>                   exit(EXIT_SUCCESS);
>>               }
>>               break;
>> +        case OPTION_SHALLOW:
>> +            flags |= BDRV_O_NO_BACKING;
>> +            break;
>>           }
>>       }
>>
>> @@ -1590,10 +1595,15 @@ static int img_compare(int argc, char **argv)
>>           goto out;
>>       }
>>
>> +    if (!do_stat && (flags & BDRV_O_NO_BACKING)) {
>> +        error_report("--shallow can be used only together with --stat");
>> +        ret = 1;
>> +        goto out;
>> +    }
>> +
>>       /* Initialize before goto out */
>>       qemu_progress_init(progress, 2.0);
>>
>> -    flags = 0;
>>       ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
>>       if (ret < 0) {
>>           error_report("Invalid source cache option: %s", cache);
>> diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
>> index 96a193eea8..a295bc6860 100644
>> --- a/qemu-img-cmds.hx
>> +++ b/qemu-img-cmds.hx
>> @@ -40,9 +40,9 @@ SRST
>>   ERST
>>
>>   DEF("compare", img_compare,
>> -    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] filename1 filename2")
>> +    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] filename1 filename2")
>>   SRST
>> -.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
>> +.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
>>   ERST
>>
>>   DEF("convert", img_convert,
>> --
>> 2.29.2
>>
> 
> Looks good as is, we can remove the limit later without breaking users.
> 
> Nir
> 


-- 
Best regards,
Vladimir

