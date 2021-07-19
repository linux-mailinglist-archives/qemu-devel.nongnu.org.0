Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EA3CD562
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:02:08 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SuN-0007Nq-Fn
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5SrK-0005eg-Dh; Mon, 19 Jul 2021 08:58:58 -0400
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:60145 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5SrH-00087N-0i; Mon, 19 Jul 2021 08:58:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4L8+tTOhMnONQ5h/FXXImtsUJ8yJCWM3sxDrJ7a6HY5JyZUxhB2RrgdTgANtjDRVGOcexQCy6Zs9SvZVmvSUcff09sRMY9EErZLq/tsiB5VXPD55jhbkafN1O2MBUUV2qOwQOHtlO19y3zxSLuQF1yMgbo5LAki+AnrSEI5LYikD0hh+VRl/zVFUiPGgxYqEE0BSEZ1yrTxhM3mZNm47McKMmlpwl0km+X9b+bqeBychMkbuK21vKy9Vm6sgyONb9q88T+iFjsCxbzVLRVBU8oOzHVGKc2cZFDZndojo7PcgrkKg2TydUv3qwNqskvkVirez77WGBntRh9IWGUIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1xpxh05GbKS/WPXCYH0c05QegUuskpF3WvP+x5dKiw=;
 b=eHs2pjbUCrJ7GG2Glquqyz7JkoFbIECZXSL8r9E6vEfJyXhqjoyLO48q6ZHlrSHvUwlpICmTCETaQDYl4shlxSIamhbZoGnqSG0bRYZSm14u84mqdjxX52i2T5JDPU2qeJUfUNqWztKsy0qNpHE/BXBtmvvRBjGpM/EqVBwM76tcQatlY/uBGl7WmLqCuIAnyS7bhBzYSvx/aofDhPcBV0asnVj3u4wxUhN0HDtmGWINU6AOet3RsqQt7tmCPWdy920Pl7HWrAiRD4yfI57xSsACourGOn9Pficg3zNYbfM0k0Wy9WVsh6h+TLvsOmHPvf7Y11Eo2Nwgc1hLEozgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1xpxh05GbKS/WPXCYH0c05QegUuskpF3WvP+x5dKiw=;
 b=QfYoB51YqoANyWS7b6LGBrdRFL3RgEqjoC1BnINL9s5uN4gkR41FfQL2CFK3TOpLxU2fbdPmdB6auhJqlczwLXP0il4owKa286SA/Oanig/bdRyA6wZWJYRXlTmF6nWifsvr+I1U03H4iieidftLoAEVORRteHZ7hlfBNfdnXdY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Mon, 19 Jul
 2021 12:58:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 12:58:51 +0000
Subject: Re: [PATCH 02/14] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-3-vsementsov@virtuozzo.com>
 <5e3574ea-2d7a-d159-3882-3e627841f368@redhat.com>
 <34791223-deb6-36ec-1c97-9956da2395e2@virtuozzo.com>
Message-ID: <ac56e6a0-8303-b290-fb63-9ab1f6a0c6ef@virtuozzo.com>
Date: Mon, 19 Jul 2021 15:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <34791223-deb6-36ec-1c97-9956da2395e2@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM9P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Mon, 19 Jul 2021 12:58:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22fccc58-0c6a-4657-a244-08d94ab4f4c7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6008DDCC9AEE372BAB21C0A7C1E19@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhZZw9/mjjClQ1c2KRjyGG5D9ltn77fpSB9/WxETt8KUkbH25BddQRnYy00UXI+3jPXeXXN2du0UUBoGQDXnYnen19yIfzltmCuuJjsj+eqvNROX/JIDEMzjYvihu/alVa8Q5qZMegeJ+4TFpzceYt7o87bxbkjbM83CSCawZ9eAg0ON/N/BMio8XblE0cee0KnAQXs8nDBz7tVNhtjy4GR8kHEMj2EAIvwHiPjKtMTcHzAHS0iSolvh3VzStsgZKROXdbJPcoviKp77PYVyFH/Uxn6gkeoBvCpZCbgWoTDtWblbynTZAnO8IJnwD7k9uN1U5NuNC68ahswBG1k+6OhMhDd8ktBEvhloDZpZnVBhvuyhke8lvu+TOu+CpQvsrNONaAFNa7b0hnlkL+z1gRJ358k8TbTC1QHCYVWLm1TeMK8UtsIvCJZMLRz3l2Nz0/0PRoe7Rsm7TwbxkhlNKjmPw0/kmaupYh1AoJAM4gEXl9n7dCgLov8FW2JxULniwyR1ygaaRgD1eFdf4ldNUO5Wr3xJlhk2A6LsXjioQc/Uvk5mCB0u0Kv5VH9AbAW6pMKaPtbt6YzcqsH5SvYAjX78OpuIRvbVlbmu5/dZUETkYbLJccyK72OeNtZcOp0iP4o+YjBvHAX7tykzKlmrS/NWGxuyNtE+WLLn86h7E4Ri8ds4GhNe+ECZHm1P75Ck+l8R0rcIWyiygmJtuJTbjuebOVZSv/O2azn917JMcExkvMJ3QRVfUhMt1v3o9wNyHG5NJFK3jKSXkX/wdES0UuhKdZj3D5NpyDVoCakEw/Imo3H4BsuFgevGS57OzTny+ogxk8P4ZwzEM1WdiKtMY/f4SylJ+NHXP76/xPXaqqYH824DsQ8Ql5wji9qSDlpD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39830400003)(346002)(396003)(53546011)(66476007)(66556008)(66946007)(2906002)(31696002)(8936002)(966005)(6486002)(956004)(2616005)(4326008)(52116002)(186003)(8676002)(26005)(5660300002)(36756003)(316002)(478600001)(31686004)(38350700002)(38100700002)(86362001)(83380400001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHQxYVorZnl3MisvZ29DbElhdDlWamh1TXNDQkppRGFDdFVxZTNld3ltbEU2?=
 =?utf-8?B?RHRwOFRtTENrcTJ6UGVUSm12NnpRK2d3a2lDakY2VUN1ZERpeDQ0dFJOMEt1?=
 =?utf-8?B?NW9wKzBUSXZVU1FxblUrZnc0RGJSRUFTWHo1eU1RSUVVS1JFTEk0Y3U2c3RR?=
 =?utf-8?B?Q2x4SHdrcUR2SFZ1TldZSkRDQS9NUmc2YjUrR1pqVzVZZEM0ZVI5ZEtRMFdG?=
 =?utf-8?B?SklvZE0vcnc3aWorS2QySnlHcjlUKzJuMmppTmVpdytuVE8wS2QyWisyMTV5?=
 =?utf-8?B?dkZCVzRyTFlGa0RXZi9YeTVLck5DT3BVNXhqQm9mUGJIYmRmSjA0QlgwTGtL?=
 =?utf-8?B?cFZTbE9kcVRhLzJUcktycVFrcEgyY3ErWWVZcExpbmNQSW1LK3pWbElRc3Vs?=
 =?utf-8?B?SHpwSFdXSGIwR0NyQ2NER3lBZlJlTk13aDlxb3dNM0k2am5ZUkYveFp5ckJr?=
 =?utf-8?B?S2dQREF6MGUyRHdYWVlyMndhMGxiajljS3NoeXQ2MnhlMm1uNTRkWWNHUFpv?=
 =?utf-8?B?d29wUllqQjdVdGJlQXNrU0Q1d0N6T0lyNUc1dXFGRk1NdmxyYUdBN0JGWDVk?=
 =?utf-8?B?MXYrQXJtdnJnOUJhVzhObVZwRDlrTGhhRWhTTHNWTjBreTNVOWZDdkxreE1O?=
 =?utf-8?B?NnQ4eHBDRSttV3Z2M3RhN0JtZjFjRE92K3M0N3RMVXdpU0Z3TzZKc0UxT2dK?=
 =?utf-8?B?YnJlUGhrcGtIVlNoZTMrRDQwS0ZTMzV6c2N1cVRqVnhMbnlOZ3U5WEdyZzh6?=
 =?utf-8?B?UkZjVnJjZFNLSlFqaDBWQVlCd2pnM2hhZEZLYUh4MjRmQ0NWU2lIZmhsWmVX?=
 =?utf-8?B?TGQxRU42Sjd2enNSeExzRm1RZXUvOWRNdTZYNzl4eVlCUFZFWm1DOTBSQkQ0?=
 =?utf-8?B?ZXFjSXp5c1Z2VG9NSkhsMDMzUVhNTUtWWHJzNHROWEpuMldwK2hRMlNBVitO?=
 =?utf-8?B?aWJZTmU3NUZJMUNBWDdkZVdrWk0zTWJuSGpYc1c2SDBrcm5YQVNQb1BnMVRK?=
 =?utf-8?B?YmV6c3NNTEVUQWpYUlNrdC8yM3BoK3pUWDYvZnMwUWZNZk4xdWZDMUlYNmxr?=
 =?utf-8?B?WUtvRHkycDM4ZmY4RFBrY3JzdEhzZzMwR2VUdFNDSW54MVppaWtuT25Uc01Q?=
 =?utf-8?B?TFZ2OWN3T21OSEVnNExaOW5CZnVyeGhnUkc0dDIvZjlrQUN5b3ZTSVFZZ3FJ?=
 =?utf-8?B?Wmpvb1V5a3RYZGhOdkYyNG1TSVQ3U3ZOY3BpbnRtMTBhUXV2NDdlVm45c0hu?=
 =?utf-8?B?SFNrcjgxM3RTbHBNNGV5ODJ5SEo2YzZpOVBiWjdzZWZiZVdHNUl6NUQ3MzZD?=
 =?utf-8?B?QTg3Rlo3Mnh6SU5Db2xJdFFvZGxjRWEvZm4vMDFWREJ0N3pJc3dwaExrSjBz?=
 =?utf-8?B?MlgvcGc3R3VBRkFYNnBzRDBZNEF0eUEzaTJodmJkK2x0SzB3NklhYlJ1cE1m?=
 =?utf-8?B?YWlMa3kvSUhOT0hDV3BPc2dTRlpXYk9JQ0YyRzBpMlNqSFp1eDFyZWloYWha?=
 =?utf-8?B?TUd3Yjl2cng3UUJtZGVnbDhWeU13ZzBUQVlZcktISGo1TUxpRC9NZUZhSEZ0?=
 =?utf-8?B?SVkrRk80RGhEeTFKRmJkUVZaTWFFckZKMk83dWdybXFSSDQybDhYOGJSUUQ3?=
 =?utf-8?B?bm9Ic3lrcTQwVm5iUnBpZ1FKaHlUanNuaEpRNTVCMENOZ2ZEdU4zRzZIcW82?=
 =?utf-8?B?bWlpSWlhTm4wVzMyN0pxS3hhYzdObmI5NSs1NWE5dGFVbnEvVWxucnJTZEt3?=
 =?utf-8?Q?fB63tR8Wb7//DSIuvGtfaNP++V1bTdr9Zt7opMr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fccc58-0c6a-4657-a244-08d94ab4f4c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 12:58:51.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0usNYIqz1kx/SUJC4guOiFnFxGaqSb3bWEaKWy9OhDNMwx1qjl0rh0bg3/4ex9RkBOFzmX4XP2QsI94qrHxSI7dDExrE8Z6hQY5nRWcIhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

16.07.2021 13:34, Vladimir Sementsov-Ogievskiy wrote:
> 16.07.2021 13:07, Max Reitz wrote:
>> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>>> Adding support of IMGOPTS (like in bash tests) allows user to pass a
>>> lot of different options. Still, some may require additional logic.
>>>
>>> Now we want compression_type option, so add some smart logic around it:
>>> ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
>>> compatibility mode. As well, ignore compression_type for non-qcow2
>>> formats.
>>>
>>> Note that we may instead add support only to qemu_img_create(), but
>>> that works bad:
>>>
>>> 1. We'll have to update a lot of tests to use qemu_img_create instead
>>>     of qemu_img('create'). (still, we may want do it anyway, but no
>>>     reason to create a dependancy between task of supporting IMGOPTS and
>>>     updating a lot of tests)
>>>
>>> 2. Some tests use qemu_img_pipe('create', ..) - even more work on
>>>     updating
>>
>> I feel compelled to again say that we had a series that did exactly that.  But of course, now that so much time has passed, overhauling it would require quite a bit of work.
>>
>>> 3. Even if we update all tests to go through qemu_img_create, we'll
>>>     need a way to avoid creating new tests using qemu_img*('create') -
>>>     add assertions.. That doesn't seem good.
>>
>> That almost sounds like you remember my series, because:
>>
>> https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00135.html
>>
>> ;)
> 
> :) No, I don't remember it.
> 
>>
>>> So, let's add support of IMGOPTS to most generic
>>> qemu_img_pipe_and_status().
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/iotests.py | 48 ++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 47 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>>> index 0d99dd841f..80f0cb4f42 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -16,6 +16,7 @@
>>>   # along with this program.  If not, see<http://www.gnu.org/licenses/>.
>>>   #
>>> +import argparse
>>>   import atexit
>>>   import bz2
>>>   from collections import OrderedDict
>>> @@ -41,6 +42,19 @@
>>>   from qemu.machine import qtest
>>>   from qemu.qmp import QMPMessage
>>> +
>>> +def optstr2dict(opts: str) -> Dict[str, str]:
>>> +    if not opts:
>>> +        return {}
>>> +
>>> +    return {arr[0]: arr[1] for arr in
>>> +            (opt.split('=', 1) for opt in opts.strip().split(','))}
>>> +
>>> +
>>> +def dict2optstr(opts: Dict[str, str]) -> str:
>>> +    return ','.join(f'{k}={v}' for k, v in opts.items())
>>> +
>>> +
>>>   # Use this logger for logging messages directly from the iotests module
>>>   logger = logging.getLogger('qemu.iotests')
>>>   logger.addHandler(logging.NullHandler())
>>> @@ -57,6 +71,8 @@
>>>   if os.environ.get('QEMU_IMG_OPTIONS'):
>>>       qemu_img_args += os.environ['QEMU_IMG_OPTIONS'].strip().split(' ')
>>> +imgopts = optstr2dict(os.environ.get('IMGOPTS', ''))
>>> +
>>>   qemu_io_args = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
>>>   if os.environ.get('QEMU_IO_OPTIONS'):
>>>       qemu_io_args += os.environ['QEMU_IO_OPTIONS'].strip().split(' ')
>>> @@ -121,11 +137,41 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
>>>                                  {-subp.returncode}: {cmd}\n')
>>>           return (output, subp.returncode)
>>> +def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>>> +    if not args or args[0] != 'create':
>>> +        return list(args)
>>> +    args = args[1:]
>>> +
>>> +    p = argparse.ArgumentParser(allow_abbrev=False)
>>> +    # -o option may be specified several times
>>> +    p.add_argument('-o', action='append', default=[])
>>> +    p.add_argument('-f')
>>> +    parsed, remaining = p.parse_known_args(args)
>>> +
>>> +    opts = optstr2dict(','.join(parsed.o))
>>> +
>>> +    compat = 'compat' in opts and opts['compat'][0] == '0'
>>
>> I suppose `opts['compat'][0] == '0'` is supposed to check for compat=0.10?
>>
>> If so, then why not just check `opts['compat'] == '0.10'` to be clearer?  I don’t think we allow any other compat=0* values, and I have no reason to believe we ever will.
>>
>> Also, I think compat=v2 is valid, too.  (And I think calling this variable “v2” would also make more sense than “compat”.)
> 
> Good for me, will do.
> 
>>
>>> +    for k, v in imgopts.items():
>>> +        if k in opts:
>>> +            continue
>>> +        if k == 'compression_type' and (compat or parsed.f != 'qcow2'):
>>> +            continue
>>> +        opts[k] = v
>>
>> Could also be done with something like
>>
>> imgopts = os.environ.get('IMGOPTS')
> 
> imgopts is a string after it. So you don't need to join it?
> 
>> opts = optstr2dict(','.join(([imgopts] if imgopts else []) + parsed.o))
> 
> Build a string to be than parsed looks strange IMHO..

Oh, but that's exactly what I should do anyway to cover several -o options. Now I see that what you write is correct.

> 
>>
>> if parsed.f != 'qcow2' or (opts.get('compat') in ['v2', '0.10']):
>>      opts.pop('compression_type', None)
>>
>> (Never tested, of course)
>>
>> Because optstr2dict() prioritizes later options over earlier ones. (Which is good, because that’s also qemu-img’s behavior.)
>>
> 
> Ok, I'll think about this all when prepare v2, and we'll see how it goes
> 
>>
>>> +
>>> +    result = ['create']
>>> +    if parsed.f is not None:
>>> +        result += ['-f', parsed.f]
>>
>> Can this even be None?  I hope none of our tests do this.
> 
> I'm afraid they do, as I first wanted to make a default to be imgfmt, but faced tests that rely on default being raw.. May be I'm wrong. Will check it.
> 
>>
>>> +    if opts:
>>> +        result += ['-o', dict2optstr(opts)]
>>> +    result += remaining
>>> +
>>> +    return result
>>> +
>>>   def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
>>>       """
>>>       Run qemu-img and return both its output and its exit code
>>>       """
>>> -    full_args = qemu_img_args + list(args)
>>> +    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
>>>       return qemu_tool_pipe_and_status('qemu-img', full_args)
>>>   def qemu_img(*args: str) -> int:
>>
>> There’s also qemu_img_verbose() which I think should be amended the same way (even if it’s currently never used for 'create').
>>
> 
> Right, thanks. I think better is rewrite qemu_img_verbose to to call qemu_img_pipe_and_status.
> 
> Another thing to do is moving handling luks from qemu_img_create to qemu_img_create_prepare_args, so all these things be in one place.
> 
> 


-- 
Best regards,
Vladimir

