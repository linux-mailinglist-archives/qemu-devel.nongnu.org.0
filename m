Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4339A0AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:17:13 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomHf-0007jp-KF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomFm-0006fO-JP; Thu, 03 Jun 2021 08:15:14 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:37281 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomFi-0002gb-2Q; Thu, 03 Jun 2021 08:15:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4wHJhRIt39foKsJ1ewIeQeeTshQHCqgX+VG9Xz8MjsaeB7Xxpo5CBm4bscr3LFfEaTTObqT7+9IG4BkJvj4eRR8sPq0csliY6VXfRsce3cROzeunYuE5jWGSMvcb1i5lefXKvgF6qTu5BLWXOwEdKK+6SMBz1sCz9MPXkPhzmwT8uX2q6A4+NBSkc2QyIFIsju2ZURCvAHzhX0+tQyCJ4Q/jx4aPGCvjRPiGw5T2oywhUPhPHpEupmyJ/JLQ1dxacbLq+A/DDaQwpi2nwb+eWWbqFOwr6/sCM637i7XaSg/kmNn+TuLLONaIO8T0QoRaNn4qh5m2LOdD4vu9dPxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r+aOKFelD2eBVMPQSooPdrcG+dbWjCeX7zvHIeA87o=;
 b=cFg+QCrFVmYX6WP110egEog3gm5AZr8O5aqCcIwi/MIwbFV27WfSyjNp66OdIdfCSlKIU1wIgCshnkMe4IKKwHGbb3WruwnyEPu/ThLXUDF7239n5SHGz3tmShbFZN9KxCE9G+4s9rPQcatxayooU+8QDAAVFbXqyz41xs0d8hxaXRE/rVEhJWnp+OrHgrwO/LLw5agwHvAtPR8dYh5ZyWtmhcU1erm2pOrtuhOip9qVrxNMq/nx7rSq8rjmR6Ud8DvnH6EP2XGal4PwJlj20pxaFF/OpjEg3J12OdQD2nEgc54ItEH9adgP3bYbysTsUVL5slH7MUJB2BUvo/ewvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r+aOKFelD2eBVMPQSooPdrcG+dbWjCeX7zvHIeA87o=;
 b=IiM7ssmOLtyHlX5EiuTUnPHXcffqpY9b5LBOzIMMVVOVQADsoJpMuCSBWPAJq1gu6XG3SWrotN36DQR2R9HmjbvhNbjydzh4ymrs7UB0cw6zcZADfUnbot+rANLp7yrEZHVjdklM6GZ3mBAdhp/jCMOSei+xWQ1de6LcDw9srYs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6807.eurprd08.prod.outlook.com (2603:10a6:20b:395::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 12:15:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 12:15:05 +0000
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
 <a266b46d-77b7-b71b-4515-22a02dbf0d04@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fe4ba3d5-5fda-8729-100a-83e0db088304@virtuozzo.com>
Date: Thu, 3 Jun 2021 15:15:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <a266b46d-77b7-b71b-4515-22a02dbf0d04@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: AM0PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:208:55::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 AM0PR04CA0118.eurprd04.prod.outlook.com (2603:10a6:208:55::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Thu, 3 Jun 2021 12:15:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 959e4e6a-a755-48cb-057c-08d92689388c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6807:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6807E7DBE5C0F14DDD98C8D3C13C9@AS8PR08MB6807.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yR5BJKDRrNmKbnyV2qxDsVXUM3kO+Doh74G1VD3qF7NbVKpEpys637LPs/DuOXQR85UYm+5lxIxZYi9tOkiOp4ixzSHE/VCOoQ38PM7PuiYZowJIbtQy0xBXWY40zC7Afd253QWx8zKEpMkrqbmbjz7vxS5N4Cm3w3RY0IF48Joi28Zq7Csz8li/TBheQRJ4nf0yql0MEUp3h2GVyfyunJudVS4PSYuWdLnYJPAlucyzJSSlBzim1EYnqtKbtqSKY4KLujee81YFR5MZs7Zdy/fLiBN2QHcwW/T7Yv/6BjH8lrKhGuHO+Jc7o2ffGTnOxT99KUjo8eKHjF9w3UzrJFbSEfapFFsDdlLSDKiha3GUrzWBoo+kDmCx/EERdCX0pSj1BXP60Y2OhXpj4obBxXF33f3a77byqAJxPV8/aSj+njCJhGXuVdSWKgRTwoJCgHlqAS+ZwFHVyPzdrpcyoKcUORZcQxlY09/GAxap5jElqJv/tU3qCYPMpvgNapZ5v8Onzby0r+D31Umlvk30OBmiN4RU7+XuIU9Tpv7ty6BmEliYX8P3xleoVCQB9hW5YTU3tVg/b96FuPYRrDQZNsLeHdm/cv/A94vJbq4h2hbzoVFJYwImVzeGokRiNOMrA13bI2M3W5jfZaZvU0Qsg+r+A2p4D0zC1iF8i4Fkq5QiM/DkU8X+n39hKQTBjH80mVm5SpGu/XKgcvpstQESo5TsACuIH5XGanmNQKZQXy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(346002)(136003)(366004)(31686004)(66946007)(5660300002)(66556008)(66476007)(316002)(16576012)(956004)(2616005)(4326008)(8936002)(478600001)(8676002)(6486002)(2906002)(186003)(36756003)(38100700002)(38350700002)(86362001)(52116002)(53546011)(16526019)(31696002)(26005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnZmRDZpSXZzaVNaNkpTN2w0cDFkTWQ0YmZMb3pKWFEraU5LRnpiSWhpQjQz?=
 =?utf-8?B?QVpnZ1FJT2lRTHJ4TnVpZ251YWdnS3JSUDFkbGhmQjhZK2h1a2ZyOUJJMmRE?=
 =?utf-8?B?NENGbGh1Y04xZHAyam1nMVFhTXc0a2gyS01MT1NPcERTNXNuOW4ySmpFZGF2?=
 =?utf-8?B?bXVldFd2dE5CUWdYZUVKTC91WUN5azA3dkw4SzRHNHBuL1cycmZvcWZOa0Nh?=
 =?utf-8?B?ZXErcWc0Y00xd0RDSW5razlyb3ZacUYrMmp3T1hmRE56NWQ1S055Uzk5SjRk?=
 =?utf-8?B?cHlOUVJmMEJWdVBDM0d5TGlzNTB5SXpkZU5kOVd2WHJuSCt4aW9uZXpXcjEy?=
 =?utf-8?B?K0hwMVdSQ3VxYlN6bUJuczFDeWRWcG5Ra2JmQXFQeXQ1Z1ovcXYxejcydmV1?=
 =?utf-8?B?Rytxa2l2WFBnMDhnSXM5VVN4dnB0emN6Z3d6b3Vjd2Y2c2NneHQ2UjV5SURz?=
 =?utf-8?B?TldBMDNPMmYxWVExSnNTRHVPQnVEdjNIT09FcjVSKzlyeWhOUGhxeXQrQ3lm?=
 =?utf-8?B?SFVEWlBKcUFVS0xoVzhMVUdERkhYMXlZWjRlcitUR290TWc1bjV6MDFlOWc2?=
 =?utf-8?B?d2pzRXBCbWhrNTJpcjJZNCtrV3JkWEpZTFBUR3I4QlJCbFBmWG1zYldSdHdT?=
 =?utf-8?B?T3ZQcy9iRDN2OTluRWthSWJtZ1llUERFMTlnWXkvN2hDR1VRTENsVEc5TnRk?=
 =?utf-8?B?ZldTQnlyQktSNmF2Uitrc1ZSUnNRVlJQMDNGVFBCcXNnSENhYnczQW5TeW05?=
 =?utf-8?B?Yy9wS1RuMFNyMlgwM2k3R3IybXhaeEIvWFJ3d2R1TkxlTzZ6WW1EeTZPa0My?=
 =?utf-8?B?alplT05XT1RyckdyeVZCYnJYcTluQWo5enIzMzg0ZC9DZ0JyQW1GZFBBYlFy?=
 =?utf-8?B?NG41Rk1uUGgwa0h1M3oxNmloN00wN2E1eFBVdnplSzFzaWoyT01zWndiV2lB?=
 =?utf-8?B?T0xsSTJlbnFyOU1jSjdNcnNBR3FEQUc0Y2E5Q0ltNGpJVUhtM24wUDJpYXBv?=
 =?utf-8?B?YS8zbVRNTW0zZkxHQnNhVW5RcnZ2Ly81SEo2UFU4NGtjYy9lTjRNYXNwcTFv?=
 =?utf-8?B?TnBJMFhQdjVsY1VPemovajhWazRPYWVaaHZtVzdEb1gxVkIxSUt3RkV1bFJh?=
 =?utf-8?B?cSs0NHd6cXorcmd3TFRHU05Fa1ZlcGpTSVBDV3dramtvTWFnOU9mNlVYZmpN?=
 =?utf-8?B?b0xSTUNrTXcydS90SnVTb1lOZHJ5Z1JRd1R6VXl1VDFCQU4yc2t3M2sxVjlN?=
 =?utf-8?B?OWprWDRUYWFWeDM5SnZjckhLK3BUTU9pWFI2Z1lwaFB1R1NNTVZCUjRYOFhv?=
 =?utf-8?B?bS9mVC9UNytvbCt0Ni9lajRUSTRRNWVjVGZ3TGw3M2NubkljMXBSeFZGcUF4?=
 =?utf-8?B?QWJ1VWkwUFo1Q3EwMU9PT3p4Mkk4Q0dYd2xncHU3eXZyWStiSEFsVCtESC9J?=
 =?utf-8?B?MFFLNDZ4eFk5Zkl4M0c1QVBmRWZJazRxZTQvbklMQ2h6VDArZ0tBOHBRZ2xn?=
 =?utf-8?B?Vmd2SXh3UzNOVUwwdzFlYXFxZ1B6ODJVN3FQcCtIODlkRFJTUk82VGtZUXhF?=
 =?utf-8?B?c2l5S2p6aGtsOGlLa1BNOTVqMVVNK1RVb3RaVjZUTHZjeVl2VjE0YkEyMkpE?=
 =?utf-8?B?VTdXanFaYmQvNzFDNHlFK05xOGU4L29OYUFvVTUvVnd4dkFnZER2WG9tcGNz?=
 =?utf-8?B?dlAwdkpsL0Z1aVkwb0gwY3Q4djd4NkZmSUdBL1luSWV6V0VaaWpPcEZKMVBn?=
 =?utf-8?Q?ZdPEO1EgOISiNlDXEsP1mjnsbOv09/KqowGYR1I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959e4e6a-a755-48cb-057c-08d92689388c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 12:15:05.2951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv5LfWZQtrLEzLnOa8zWRh/t2vbnHOkGZcU94x5vPAUDWFI78C+j9L9o4PVs0YYThklb/H0AVkQHNdMhVkKc1x7Dm49JevXGV6l8EaS9ktA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6807
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7,
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

03.06.2021 13:21, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 26/05/2021 20:16, Vladimir Sementsov-Ogievskiy wrote:
>> So, the change:
>>
>>    -makecheck -> --makecheck
>>    -valgrind  -> --valgrind
>>    -nocache   -> --nocache
>>    -misalign  -> --misalign
>>
>> Motivation:
>>
>> 1. Several long options are already have double dash:
>>    --dry-run, --color, --groups, --exclude-groups, --start-from
>>
>> 2. -misalign is used to add --misalign option (two dashes) to qemu-io
>>
>> 3. qemu-io and qemu-nbd has --nocache option (two dashes)
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/check-block.sh         | 2 +-
>>   tests/qemu-iotests/check     | 8 ++++----
>>   tests/qemu-iotests/common.rc | 4 ++--
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>> index f86cb863de..90619454d3 100755
>> --- a/tests/check-block.sh
>> +++ b/tests/check-block.sh
>> @@ -77,7 +77,7 @@ export PYTHONUTF8=1
>>   ret=0
>>   for fmt in $format_list ; do
>> -    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
>> +    ${PYTHON} ./check --makecheck -$fmt $group || ret=1
>>   done
>>   exit $ret
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index 2dd529eb75..3f3962dd75 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -32,11 +32,11 @@ def make_argparser() -> argparse.ArgumentParser:
>>       p.add_argument('-n', '--dry-run', action='store_true',
>>                      help='show me, do not run tests')
>> -    p.add_argument('-makecheck', action='store_true',
>> +    p.add_argument('--makecheck', action='store_true',
>>                      help='pretty print output for make check')
>>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
>> -    p.add_argument('-misalign', action='store_true',
>> +    p.add_argument('--misalign', action='store_true',
>>                      help='misalign memory allocations')
>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>>                      default='auto', help="use terminal colors. The default "
>> @@ -46,7 +46,7 @@ def make_argparser() -> argparse.ArgumentParser:
>>       mg = g_env.add_mutually_exclusive_group()
>>       # We don't set default for cachemode, as we need to distinguish default
>>       # from user input later.
>> -    mg.add_argument('-nocache', dest='cachemode', action='store_const',
>> +    mg.add_argument('--nocache', dest='cachemode', action='store_const',
>>                       const='none', help='set cache mode "none" (O_DIRECT), '
>>                       'sets CACHEMODE environment variable')
>>       mg.add_argument('-c', dest='cachemode',
>> @@ -85,7 +85,7 @@ def make_argparser() -> argparse.ArgumentParser:
>>       g_bash.add_argument('-o', dest='imgopts',
>>                           help='options to pass to qemu-img create/convert, '
>>                           'sets IMGOPTS environment variable')
>> -    g_bash.add_argument('-valgrind', action='store_true',
>> +    g_bash.add_argument('--valgrind', action='store_true',
>>                           help='use valgrind, sets VALGRIND_QEMU environment '
>>                           'variable')
>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>> index cbbf6d7c7f..e2f81cd41b 100644
>> --- a/tests/qemu-iotests/common.rc
>> +++ b/tests/qemu-iotests/common.rc
>> @@ -124,7 +124,7 @@ fi
>>   # Set the variables to the empty string to turn Valgrind off
>>   # for specific processes, e.g.
>> -# $ VALGRIND_QEMU_IO= ./check -qcow2 -valgrind 015
>> +# $ VALGRIND_QEMU_IO= ./check -qcow2 --valgrind 015
>>   : ${VALGRIND_QEMU_VM=$VALGRIND_QEMU}
>>   : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
>> @@ -134,7 +134,7 @@ fi
>>   # The Valgrind own parameters may be set with
>>   # its environment variable VALGRIND_OPTS, e.g.
>> -# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind 015
>> +# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 --valgrind 015
> 
> Ok I see why the short options do not make sense to have double dash, but if we want full consistency why fmt is left with one dash? Like "-qcow2", should we also change that? (that change might be more complex to do)
> 

I was afraid that changing format and protocol options would be more painful, as they are used often. And decided that we still can get more consistency, keeping other options similar..

-- 
Best regards,
Vladimir

