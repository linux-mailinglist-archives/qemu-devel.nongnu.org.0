Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890982F7DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:11:11 +0100 (CET)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pok-0003LU-Fo
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0PBQ-0006SI-9p; Fri, 15 Jan 2021 08:30:34 -0500
Received: from mail-eopbgr40139.outbound.protection.outlook.com
 ([40.107.4.139]:10573 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0PBK-0006dr-DX; Fri, 15 Jan 2021 08:30:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx1SLRrUX1h8dcnfYhrQcDKSbYl0StgfkXwLxqw0ZQq+3WRfEHPyTCe6kLRxhONvJHyrSWWbHq2mVrzKPsbIC5+uguE4ZsspqER+PBRgcADjMZZlDKQqzpwxxPvPSI4F309/SDm55U8VP7UzbKEJjZjolZnlHHGn2qgvMXA7lYm/c7uk3UCTnGv4xGWo0+khrj5E+2wtAC9092bnDyzDCwKxlj3mMggcuCfGcBd4+VJwS4Z1ccp3D6IZE7G6DbQCVRF5/TEfTaFpSh5AzS///RobMvRtA17CQeydR6w+cbtLW3Wxq3O8hZK7AXwilNbKcmJjhBHS5J18vjbTgjr0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIGk5Inr6EzuNBhGCK6tThJ2kf5uf2sMdjtAGwxJgww=;
 b=I2C9jIKp47bRDtTeIMadky+DTiFSKYlv9T030kkZLRyYdOHMVJy0KP8MbtlPwlo3KitbKbya0nyjyvatiGF80N7zudl6+cY+N9IyC28KmU1Jyzfki4MOW3RTb8qa9QgGmvn0rcRCTNmSc+UuOcg4OTtZot8nHT+YA+ChFzZTi0kygxdPX+/B+3U5HfTZnkfehT5pBmanUnGzQRlq0hUVvJ+ACd7EbxhIGbckrwXGXn8J5ziy7bm+o0vJGy9kX799GC68TZR8Y+9DtzWDL1Jhzo4q7fdkVt0wPIZpcmEcgKDC90QevWeivZBupNxxoF8H3jyDfnDUm5rm9Lm3w6e6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIGk5Inr6EzuNBhGCK6tThJ2kf5uf2sMdjtAGwxJgww=;
 b=nBdJ48DpBAGCnS3pxY1DHqW49cLjc15Nj1ZL3qE2p1LPsxkjDuc7z+pHGJEjPi/nGVDhxrU4ZI68ghLCPk7+HJW3hIV+ESTLGYr39m/6IGAt28JWyHDifM0B1vqpRBCkW8ofsU4CcMvZJ5G7j8stLeuPo25L6fIKkJj8qEYpAKM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2609.eurprd08.prod.outlook.com (2603:10a6:203:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 13:30:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 13:30:21 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
 <20210115132019.GD5429@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
Date: Fri, 15 Jan 2021 16:30:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210115132019.GD5429@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM3PR05CA0100.eurprd05.prod.outlook.com
 (2603:10a6:207:1::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM3PR05CA0100.eurprd05.prod.outlook.com (2603:10a6:207:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 15 Jan 2021 13:30:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deff7208-e4c4-41b9-2a0a-08d8b959b50b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2609:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2609B996660F7425B38E1B40C1A70@AM5PR0802MB2609.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaaM9wC3OuwWUspD3XKHNcyWlkl4HkPwQrShEpZLn9MY7cNrAEmOJ8uMhzP10tQXUSxm/f9EgbbymrbF73Icm5Hhos17amtmbgwmtVB/4fuX5akcuBNo4R+QBpezqtJ96hGpeLPbEwlZWQnilTsxqy6Leqt8ybf7TxV+V5uN9/FRagwSvWgHQIktex2lgoxU7ZIIKppHp6kXyWXYx8cOKlkn6UeRZQ2w0wG+mofOITBsP6Y5cZHWDjeOsUd08CrdJaYjs3q3wG9o4hv45xhLsM+KolAJcT3ZkaFFpPp5pjNzPSTurMT61FuViCXjvofQKkEPEqqfGZMKEBUUqsXvhWGSyOp96VaPjsJ2u1LFlT0cHPovdMbUFNJmGfRQO7d5YRxb93hAvuc9alJZC2Zq9MXnEmv2SKjCkBAXqhIEXCz9EF+vNxos7ON3lgrmgI4jDGelU1aPttTf0YjisUC4XcDSN1tiU8ghUhv6SC96Kmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(366004)(136003)(346002)(31696002)(66476007)(66946007)(478600001)(316002)(66556008)(4326008)(52116002)(956004)(86362001)(31686004)(16576012)(2616005)(2906002)(6916009)(26005)(8936002)(5660300002)(186003)(16526019)(8676002)(36756003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzNYK2VZYzd0czhJT0pWVFRmQlppSzFvZ1NUUXRLOUNlOS9Ka1p6bXIxL2Jt?=
 =?utf-8?B?WW1IZzJFVG0wYlQ4R0QyU2hEMzB2T3Z1MnVJNHpEN0g3MGJSSFpFcmErMHVp?=
 =?utf-8?B?eVBFZzNpYkZDMXpKVlQxQ1JINDd5OW84VVBFcC9PRzVoNFpKS3diK3p5VEhQ?=
 =?utf-8?B?MXR6ZG8ra0dpdGF4M1JLbDhJbzNMWXhSQlhzZUpyOVBGVWNNTlZTNXJwMnBi?=
 =?utf-8?B?SFQ4QnpnekkzV01MRE5BSFYrdWRQb0laL2xOa2liZWNEQUhIM3Nzc290VG4z?=
 =?utf-8?B?SjQwcFlPZmxOUFhTN1FJeWxYMXNUVUIvZVFQRHpmY21ja0hxSTN6Y1UvU2hm?=
 =?utf-8?B?czY2RXI2dlRhODlDVS9NMlNrZEx3YnducmRFdm1aZ2tWNmJsTS96K3dQYlRK?=
 =?utf-8?B?MElRaHpQcHVXUDhzcXFlUnJvaUdlTkp3UDR2Z0haTTBQUFRNOVFXWTMyT3hL?=
 =?utf-8?B?R0RPVGpvOFRGTFdSNUdwazAwdTNmbW5TS25JNmo2QU50SWZIQ0ZhNXUzSVJN?=
 =?utf-8?B?S0psRkkzb09zOW5OUDgrY1V1cThVZHN0a2JPOC9LTDNQT0w1eHoxNlpMeHJo?=
 =?utf-8?B?dDNseVR1ZmlYaFAwbzQ3UC9RV0JzMjhmRXJyRWwvbEFKQ3dCMWNELzBYVGJD?=
 =?utf-8?B?cVRSOEVWOXdneFZoZEo1YnVxaS9CM3YxUXRGbkQwdis1NUZmVWw0NU5VZ3Ar?=
 =?utf-8?B?UjJ4SnhzdzhhN0RKVm0yZFJma1RPb1h4Ymg3ZXFzZ2F0OVRRckp2czZsdVBT?=
 =?utf-8?B?Rk55Q1BRSVdBZmM3QnF0UGs3OTJiMHVpZ3luRk5WN3dEeHFJMWZxYlNzUTFw?=
 =?utf-8?B?dm9YWG1YZ2wycnFiUkhLVnNmTmJDVFlsQnROekkyQk41dmYwWlIzVGJzQ2l3?=
 =?utf-8?B?aHZ0UlI4SnBiV0ZFVEZqc2VKT21Lbi9NOXZJWXgvWmd4L0lGbUcyanBFcWt2?=
 =?utf-8?B?Y3lNV05WaGtiTEZSUFVKTGkzOGpiekY5YXlzSEZnaFl3QzluNWx0dGsrcStD?=
 =?utf-8?B?L1FIVlhwVURDSVFDTTB2akFoblcvQ1l3Y2xUcXcrUUJBRmVoL2tabXZ1YmpY?=
 =?utf-8?B?WTZiRlF1U2RwQTQvVWZKeWxxTktIVjFDZGRpOCttYVJoUFoyZFFuNjlrb1pk?=
 =?utf-8?B?b01LbXpUNVUzNVBpMFhJZzEvQ0QrWXpZMjJiNmlUcnJ6YVA4Vy85dE0rM0d0?=
 =?utf-8?B?eUl2RUV4WURwK0hWUTY5K1grMUVweEtKcXY1S1ZQRmx5VG45QU1nbzgvSE5C?=
 =?utf-8?B?ZXYva2MrMWg2c3hOY2I1ZEQrV0pjNEk1eS9ET3R1elZCNGhEc2JqZUR1UUJw?=
 =?utf-8?Q?MJRONHlPHNkd1kB+tCGbI6Zohi48R98P9C?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deff7208-e4c4-41b9-2a0a-08d8b959b50b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:30:21.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JToc8dthSeMqDEWcx7wZYWXeiEJJhAp/+mySncIoyMLd2rH7qf4h95ui/lqBMBPHHcHlhuOX26jEjyrDsB5cupBu0s8BPJA66bPYx3YXWm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2609
Received-SPF: pass client-ip=40.107.4.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 16:20, Kevin Wolf wrote:
> Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 15.01.2021 15:45, Kevin Wolf wrote:
>>> Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 15.01.2021 14:18, Kevin Wolf wrote:
>>>>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> Add TestEnv class, which will handle test environment in a new python
>>>>>> iotests running framework.
>>>>>>
>>>>>> Difference with current ./check interface:
>>>>>> - -v (verbose) option dropped, as it is unused
>>>>>>
>>>>>> - -xdiff option is dropped, until somebody complains that it is needed
>>>>>> - same for -n option
>>>>>>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>> ---
>>>>>>     tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 328 insertions(+)
>>>>>>     create mode 100755 tests/qemu-iotests/testenv.py
>>>>>>
>>
>> [..]
>>
>>>>>> +    def init_binaries(self):
>>>>>> +        """Init binary path variables:
>>>>>> +             PYTHON (for bash tests)
>>>>>> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>>>>>> +             SOCKET_SCM_HELPER
>>>>>> +        """
>>>>>> +        self.python = '/usr/bin/python3 -B'
>>>>>
>>>>> This doesn't look right, we need to respect the Python binary set in
>>>>> configure (which I think we get from common.env)
>>>>
>>>> Oh, I missed the change. Then I should just drop this self.python.
>>>
>>> Do we still get the value from elsewhere or do we need to manually parse
>>> common.env?
>>
>> Hmm.. Good question. We have either parse common.env, and still create self.python variable.
>>
>> Or drop it, and include common.env directly to bash tests. For this we'll need to export
>>
>> BUILD_IOTESTS, and do
>>   . $BUILD_IOTESTS/common.env
>>
>> in common.rc..
> 
> check uses it, too, for running Python test cases.
> 

But new check (written in python) doesn't.. Should I keep bash check, which will have only one line to call check.py with help of PYTHON?


-- 
Best regards,
Vladimir

