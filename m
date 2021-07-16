Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA3A3CB632
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:38:59 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LFC-000629-RR
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4LBV-0001X7-PM; Fri, 16 Jul 2021 06:35:09 -0400
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:4674 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4LBR-0005ko-UP; Fri, 16 Jul 2021 06:35:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aP+QlCkjJeqz8dggyE+5mvKtb9MYJfu09yR2kzBPHvgYRJztgcRn+1ZVFhOt73X4Ra2hbyB7BHTLx3IvRc0GM3GiQOwPzqdQ1YXqbX7bipLAWsH71fzdSWyPZ0PIdkKHoOfrtz3mWp+pDBmDYGMufZn9mm5LjB+ns4xeNYQ0tAsJwioU94DYnHj5WXpdLsqnG6hhCV1OlwdQa6NYI/BgeIvI123v0VL4MQBacOSITQTym0Hgxk2WhTpZeqEKdDi3dqcefWvvWrP1KJswV3Y379OUCz+S9GiJ2UtDFgWDqPXccz/MF34uo9HuSnwloebOt9UZall1U/U1j1384hgNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2qQhQJurh8eTUtwLjgMgcwIpG5gTfjcYF9/voPk4/s=;
 b=W38PROxwussDRTPS7RL89KdKpyxUYq0wiG255XJDiDwcUlvcDodo2FpgU2+XMJU+GkuAlUFKYG54YtzM4IRowUoBC7FotFZ8uTugvrr37IjsJDvLFjfUOsBfhlxuWrjEWyfJmEti/+R+FtSHh4vo23JqjnQV6c+Ldoo+zYbULFwS8hd7lE5XqYEtN9e3hRq7BHJROm+zNRilfvoNQ6pdZt1WOZ6Mrl3B3wt3ADXSMluKqdNSDFKYNI43ADBPzGW48LkGTD3oCLDgJ/r0h5aL31oQJJgGnKv8hxBy+/w1kNHUTMhasAsPFLFvsVXrHqsvoa9ZyNjd6LHBQ1qUHKBE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2qQhQJurh8eTUtwLjgMgcwIpG5gTfjcYF9/voPk4/s=;
 b=k7Zx1nkuCxQOzLf1hSpBjV8d3WbwNTa0VrGj+lVBP8+1Gy4Fs1UELeMYvSqnDMDCyamhgAp9i8v1mIlUholM4N9sZIyUl9qVNp3cXl3R5Kpdak95XUN/tmEisofRnlV1Cula5ImQFx00YMYAv+jz/CD7IOkjQ3T58TNvysLumLI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6055.eurprd08.prod.outlook.com (2603:10a6:20b:293::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 10:35:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 10:35:01 +0000
Subject: Re: [PATCH 02/14] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-3-vsementsov@virtuozzo.com>
 <5e3574ea-2d7a-d159-3882-3e627841f368@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <34791223-deb6-36ec-1c97-9956da2395e2@virtuozzo.com>
Date: Fri, 16 Jul 2021 13:34:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5e3574ea-2d7a-d159-3882-3e627841f368@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR3P193CA0056.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Fri, 16 Jul 2021 10:35:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 663d44c1-74c1-4691-4326-08d948455d98
X-MS-TrafficTypeDiagnostic: AS8PR08MB6055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6055935453AEB35095A244E1C1119@AS8PR08MB6055.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Uw3fYYbuWHY/U4YwGyx4sTR33qb9uNpxotvQIxoGMfbFOASufOU0JSVY15ZLJ8wcWkYtycNaXjBD9Es30/IbEx98OH8QujuNz/460tu03xid5251aH+QgvN4U+LUBd3aGLNkDeHjVgp+t04qFGAlPRJe+cUpL28ZJpA8c1qE0YzrVd3t2W5dkSFj8UZBrWE+Pqwfax6LRKaR1HNp1Yn5jTAIRvLfpmrCKRN65hanS1zBpVuB/ETCwNIQhaJuYognUaIqa7F0SHcHaTecSXuPz1rD3HrWxsYZd7ZFoJB3+INyDgStMDy8/cJ6B/INjLi6P7JuQX1PjAAcZHP/Y4wg7gi+7nBa7FPg8+H0P7h8FJ39Jl85zo0S2D2/t8D49lfTsjUjfiIGpYQ9mEJY8ynLCAoAN84ElCWxSj/QrdQLnwUWKeYTji/XFFvmVaTIMgU30fKxxrsXCSZ3oUN5P51Ru6d+bB+nBDpElOAbf+czDG9fttcJyeWqWqNww61gUloUatTv4r4lq1OA+fE58d9wWhMK1osLCpqaKGUysZn4sV50weGnPyj9hs9ycGnnwJ+YWLWEC4W8DveqcvIeboM0kQOqVNSXgcBpbW3CJUDXEZXT274zrisH/PO1n3vDiRPLmoxT4D5opjfv8Wg1wdReBziGJvEn+EpCBg/qvwuAc5gaGIfpl/OxRMKog41D9EI25AbJjqsIg25HKiBqEqLpoSjsqC4NlH8bUTvmw1IVEFCu84xQI3Q6j2Cood9vEtj85NZ73l3DssK7LfxX53Gf0/OrjdENI8ixHQoJPYD90inyH7bmVSCvMvAhGLP8MYW506xR4vSsgpWa5QLvVoC1HZLwQFPRP30AjbcxD1/eeRXCthPYvOqQ8Hm+3REV/FC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39830400003)(966005)(31686004)(36756003)(478600001)(186003)(83380400001)(956004)(2906002)(4326008)(5660300002)(2616005)(52116002)(31696002)(66556008)(66946007)(86362001)(66476007)(316002)(8936002)(38100700002)(53546011)(16576012)(6486002)(38350700002)(8676002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0FiYWNJK0JCNlpJbkhFaVhiT21tL0VwL0JKZkxqU0h6WjdBYzBFa2tQWDJ3?=
 =?utf-8?B?RjJLSjV5SEE2ZStNemNEL1d3MU11dGo0M0NOQVRJZGczU2p6cVVKK2pYMUFD?=
 =?utf-8?B?N0lieFBVOGJmY3Y1cFVJSWxVcGlORXhEa1NNZUZmNzNsTjllZVJza0lOVFhU?=
 =?utf-8?B?R211MEN4RlFwOVJQMCtCUGp0MkFYSloxMnN2RnpmUTdNVFptdFlZM3ozT0dM?=
 =?utf-8?B?TkhhemtndWZpOUNDc3N3VnBKNjRHNmF4SFpVQ24zWThIWWZ5U3FVYnlvV3RT?=
 =?utf-8?B?RndYNWJFM2JhNnRtK3FBalMvWkJWZlovSitWclhEaCt2VXI4eHpWUE1LZzhl?=
 =?utf-8?B?V0VmR2xpM2NLK2NnMXB5NjFQRGJFNHphQWpqbFl1TEpHVXZaUzNNdzFRV1Mr?=
 =?utf-8?B?ZW5YbHEycFovZ3pnczZxNUR2cGRDVDNMSEN6d2NMbXFOWFZvZ3QzenBqUGE3?=
 =?utf-8?B?Q3JEMCt0cy8wMG9ncG02YnVIVUtXeTBvamhHd0cyUk94STArUUE4SE9vSjJ2?=
 =?utf-8?B?NVFsVGc5OEpmcG8rRFpaaXF6TVc1aDlIMU5IMHNySENDZlorbWtLUzA2REph?=
 =?utf-8?B?L0Nvbm81SmJQeVA1WUZSTlNFN0FIUkkyMFJSSFpwWCtzOTR4Z0YxUENjMnhL?=
 =?utf-8?B?T0ZKa21TUDFUaitBWU9DWGY2NFRDcjVSbTZuU0tmN1VOSGhISTE4b3o2YXpQ?=
 =?utf-8?B?bVBUd0VOY3JQY3NZMEN3NUQvUVJGaHI2UGR3YW1PcHc2SUIyNHpkdks1Tmpq?=
 =?utf-8?B?L2lOWXpmallabVFobkFTb2FjVFJLU1hpMnZqRHFQRy9HeGFXRllaanl4OGFS?=
 =?utf-8?B?bTdRckNOT0g5MFVTeGtvMmRuUjRLVGhWcmVDWkZINlIzcjdGaGNIb0Uyd1Z4?=
 =?utf-8?B?bDNWY1JXb0xQY2gvdW5pNFZEbndhWk5rd2xaU0RaYnBFUVRhbXRyd0JWaGJt?=
 =?utf-8?B?bmVVZGFHVDkxZklvb3ErQWhLMnI1STN5Vk5tQ2sxM1hLSDVIdkcrVm9KRGpH?=
 =?utf-8?B?aW5sUi9FUitWc2pHZllhakJCc2xhdE44NngwdkgvakZqL3FBYjd0aU9vd05o?=
 =?utf-8?B?YnlsdCs4S2s1bUFUcXcwQm9TYXBLYWg4cC9rd2RuTmdmTzRudFNXNE9NbFky?=
 =?utf-8?B?WS9CT20zdzRoblFHYjBsazNQZEhpekcwRGZvQUNGL3VOWmQ1QkhoWktpR09W?=
 =?utf-8?B?czNtZTIwV3N0UE9JK1BUcGorTXExODRMdFl4RzVKelBPcCtpcE9oNThubEl4?=
 =?utf-8?B?RmNISWhwNSt3QTZZTVpGZnF5V1QydjFjT3R1R2VRS041MHFTb0NBeFdsRDFw?=
 =?utf-8?B?K1YwSjVLNmRQWFRHY0h1S2J1VW1lWEpSd2Y3MjJseWJvVWwwUWZIQkJYa1FD?=
 =?utf-8?B?WkpnK1ZmeGtWUlB1VWxONmVXNlVHcDJDZ2lRaGFnaWY5SWIvZ2R0ZkYva0Nj?=
 =?utf-8?B?R044MCtTU0RqZlF0SWJWekRNbU16a1F6UDRUb0ZZc05Pb3JtR09qZG4zQVpu?=
 =?utf-8?B?UlJvbjg1NnlENFVGUEEwQkNoQU84d0tyL2ltSEhjaHVZKzRZbFNQNWxPV1RI?=
 =?utf-8?B?L2NRT3FvKzUzcHJCeHlvZ2t0T3JNZ3V3NjJuNTI2M2xvU2U4T1hLdGV5Z1pR?=
 =?utf-8?B?THRRNEYzQ3ZNKzNOSk1RdFExNzJqYWo4YnA3SlFIMHpwbzV6WEVGWDNzRXMr?=
 =?utf-8?B?a0xtVXAwVHBTMEwyd0ZKcVd3dVlxSFd4SUxnaGJBUHRkRkVzOWdVYlRTLzg4?=
 =?utf-8?Q?agb01yiBjzXq9a1ASq6S6MUm/9R1JU/7neTeTWE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663d44c1-74c1-4691-4326-08d948455d98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 10:35:01.1312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gmYjiqN/zY2LPMtsru30A07fSnnkdjMGu6131MJMoqRxyrQG2j0Vy66NImZaC4K9GXb/48xLNytRRqXwvV468CFV4FbexxKtEGzUlTPnB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6055
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

16.07.2021 13:07, Max Reitz wrote:
> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> Adding support of IMGOPTS (like in bash tests) allows user to pass a
>> lot of different options. Still, some may require additional logic.
>>
>> Now we want compression_type option, so add some smart logic around it:
>> ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
>> compatibility mode. As well, ignore compression_type for non-qcow2
>> formats.
>>
>> Note that we may instead add support only to qemu_img_create(), but
>> that works bad:
>>
>> 1. We'll have to update a lot of tests to use qemu_img_create instead
>>     of qemu_img('create'). (still, we may want do it anyway, but no
>>     reason to create a dependancy between task of supporting IMGOPTS and
>>     updating a lot of tests)
>>
>> 2. Some tests use qemu_img_pipe('create', ..) - even more work on
>>     updating
> 
> I feel compelled to again say that we had a series that did exactly that.  But of course, now that so much time has passed, overhauling it would require quite a bit of work.
> 
>> 3. Even if we update all tests to go through qemu_img_create, we'll
>>     need a way to avoid creating new tests using qemu_img*('create') -
>>     add assertions.. That doesn't seem good.
> 
> That almost sounds like you remember my series, because:
> 
> https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00135.html
> 
> ;)

:) No, I don't remember it.

> 
>> So, let's add support of IMGOPTS to most generic
>> qemu_img_pipe_and_status().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 48 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index 0d99dd841f..80f0cb4f42 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -16,6 +16,7 @@
>>   # along with this program.  If not, see<http://www.gnu.org/licenses/>.
>>   #
>> +import argparse
>>   import atexit
>>   import bz2
>>   from collections import OrderedDict
>> @@ -41,6 +42,19 @@
>>   from qemu.machine import qtest
>>   from qemu.qmp import QMPMessage
>> +
>> +def optstr2dict(opts: str) -> Dict[str, str]:
>> +    if not opts:
>> +        return {}
>> +
>> +    return {arr[0]: arr[1] for arr in
>> +            (opt.split('=', 1) for opt in opts.strip().split(','))}
>> +
>> +
>> +def dict2optstr(opts: Dict[str, str]) -> str:
>> +    return ','.join(f'{k}={v}' for k, v in opts.items())
>> +
>> +
>>   # Use this logger for logging messages directly from the iotests module
>>   logger = logging.getLogger('qemu.iotests')
>>   logger.addHandler(logging.NullHandler())
>> @@ -57,6 +71,8 @@
>>   if os.environ.get('QEMU_IMG_OPTIONS'):
>>       qemu_img_args += os.environ['QEMU_IMG_OPTIONS'].strip().split(' ')
>> +imgopts = optstr2dict(os.environ.get('IMGOPTS', ''))
>> +
>>   qemu_io_args = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
>>   if os.environ.get('QEMU_IO_OPTIONS'):
>>       qemu_io_args += os.environ['QEMU_IO_OPTIONS'].strip().split(' ')
>> @@ -121,11 +137,41 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
>>                                  {-subp.returncode}: {cmd}\n')
>>           return (output, subp.returncode)
>> +def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>> +    if not args or args[0] != 'create':
>> +        return list(args)
>> +    args = args[1:]
>> +
>> +    p = argparse.ArgumentParser(allow_abbrev=False)
>> +    # -o option may be specified several times
>> +    p.add_argument('-o', action='append', default=[])
>> +    p.add_argument('-f')
>> +    parsed, remaining = p.parse_known_args(args)
>> +
>> +    opts = optstr2dict(','.join(parsed.o))
>> +
>> +    compat = 'compat' in opts and opts['compat'][0] == '0'
> 
> I suppose `opts['compat'][0] == '0'` is supposed to check for compat=0.10?
> 
> If so, then why not just check `opts['compat'] == '0.10'` to be clearer?  I don’t think we allow any other compat=0* values, and I have no reason to believe we ever will.
> 
> Also, I think compat=v2 is valid, too.  (And I think calling this variable “v2” would also make more sense than “compat”.)

Good for me, will do.

> 
>> +    for k, v in imgopts.items():
>> +        if k in opts:
>> +            continue
>> +        if k == 'compression_type' and (compat or parsed.f != 'qcow2'):
>> +            continue
>> +        opts[k] = v
> 
> Could also be done with something like
> 
> imgopts = os.environ.get('IMGOPTS')

imgopts is a string after it. So you don't need to join it?

> opts = optstr2dict(','.join(([imgopts] if imgopts else []) + parsed.o))

Build a string to be than parsed looks strange IMHO..

> 
> if parsed.f != 'qcow2' or (opts.get('compat') in ['v2', '0.10']):
>      opts.pop('compression_type', None)
> 
> (Never tested, of course)
> 
> Because optstr2dict() prioritizes later options over earlier ones. (Which is good, because that’s also qemu-img’s behavior.)
> 

Ok, I'll think about this all when prepare v2, and we'll see how it goes

> 
>> +
>> +    result = ['create']
>> +    if parsed.f is not None:
>> +        result += ['-f', parsed.f]
> 
> Can this even be None?  I hope none of our tests do this.

I'm afraid they do, as I first wanted to make a default to be imgfmt, but faced tests that rely on default being raw.. May be I'm wrong. Will check it.

> 
>> +    if opts:
>> +        result += ['-o', dict2optstr(opts)]
>> +    result += remaining
>> +
>> +    return result
>> +
>>   def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
>>       """
>>       Run qemu-img and return both its output and its exit code
>>       """
>> -    full_args = qemu_img_args + list(args)
>> +    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
>>       return qemu_tool_pipe_and_status('qemu-img', full_args)
>>   def qemu_img(*args: str) -> int:
> 
> There’s also qemu_img_verbose() which I think should be amended the same way (even if it’s currently never used for 'create').
> 

Right, thanks. I think better is rewrite qemu_img_verbose to to call qemu_img_pipe_and_status.

Another thing to do is moving handling luks from qemu_img_create to qemu_img_create_prepare_args, so all these things be in one place.


-- 
Best regards,
Vladimir

