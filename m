Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD62FA730
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:14:31 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Y6n-0007rW-6d
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1XtU-0003Rn-Vz; Mon, 18 Jan 2021 12:00:45 -0500
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:43009 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1XtI-00074i-1N; Mon, 18 Jan 2021 12:00:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/L9QkHU1717bwHzelw/juzK3McGRTUyiJzbIvpPovBoSEL39FIncvkVOH9cdxGpmFyY2xPLp1w5+hlDEC+wAA0EqZzGyxOeLNBfdBBGz287uBUNKJZCpFNHUnrwgOLo6gNgUjbHQDGB7B/yzpFc5qdNaZtaCG7y0lOJqOjyU79U6pv6ooJMgigzGl/hGNoL/lx4JuA692DjoiCV+C51u2U94eNEKZ3399oixFXTwpFhyu3XA5KbKu0nblnmYk6DbLySqmQoxJ7/mTOJwPLlMey6QGOQbwRLafzlm3W5sxRfUYLimJSKveFJySQYE573P9/N/Aw2x0XFG63Jh6AZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGBWR8p6DIEPjI9UjAbSd45X4q/Ue1gCwyiMuL9Todc=;
 b=bMLd0njmlUsBHPoZPsz5gfBA7y+0AD7TKb2gd20Z0uNcXYTBXLNJeHAZReZU65Kt2mZV8enUKQCBlCzQsiWfdSn8ZbHN4DNRKkXRxCdaqqcHsMsJqPbuHbbpvzRbA4UfIB0OfnM5YaqBVNdkMWSjscMV2rOB4tH/fyBQ0XCfEsAw/H/2gFRPeDIyGlyDnbpuRrXwWEeVtLxUh+YJznLLoOBCEf2VHmv+JUBJdqcrM8PPuHrrZ36WC4UrU8EJBnF63O5FDE/NpBSs1dgvA5kyXYHNyV7qv1hP+4Cs79JmaX7cUrsgV31f5F8sBYgkDYsWXJpGO2xsQFB32QaQ/zkNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGBWR8p6DIEPjI9UjAbSd45X4q/Ue1gCwyiMuL9Todc=;
 b=dqL2NH+CnfxxkU9CBfm+U3cjT0wZoEbQ2lVhOeUCMRRbc5MFZ4qajbIRsChK0g3PX+lfX9ZlA4D2qGHcAymA+vB3PFakD53Ll/uD3gjt9W+dQcUV0RICSrI+YtI5d8oKuhVZliyU3delR0qi7J3CG/5An2MKCImfJ5rmOruSuF8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 17:00:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:00:27 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
 <20210115132019.GD5429@merkur.fritz.box>
 <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
 <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
 <20210118095939.GA11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ff7e7cce-36b3-074c-7cc9-43d7d2d3439e@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:00:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118095939.GA11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: AM0PR02CA0100.eurprd02.prod.outlook.com
 (2603:10a6:208:154::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 AM0PR02CA0100.eurprd02.prod.outlook.com (2603:10a6:208:154::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Mon, 18 Jan 2021 17:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9670740-c3f9-47c6-bfd4-08d8bbd28dfe
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6071044FCCDA68E74DB9134FC1A40@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5F07OUVmDRmDfLlE+eAhT0ZMyO9OYWphcoPCKR4kESXvnmWosRKTJ5jhxjbWhYpfAhNyAXe7OoObBudaUEExkJEN9fNJbjP6aMy5GRj+mAeGH2XlB2S/6qrF/9g4qxv1YE1wmNCR/WBLDhCeacLjMjNgiKH0aQsYdPXeaFkXpygeS6vqgAqNRtpayWl0ys7Qi5I+vzOzduqvMkz/7yHVvnVEEAnkdfA+1OV11FV3SJ4fM7DRFKdySG26CjDGje6DT77l9odUoGppkkxfGUdc9iW8RLwtNwPGi1vqcd8Zm9REd86VTK4b7AwdtcK5a1tVTdLqpsc+uVlVq15Dt9wF/4qyQTn357W7QudtDvIi6wFT3kyxVvBcmDv5/qbIeOYYK/8A2yi3R3U7GPlo8gQXvqvZqCXvatrVM9RWj0T7iz6zN8Sv6GpNVKOmHyw2glL54exWaSq5NvG5rOpJfcvbhOfmNZGlE4KpH4fQzEl12gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(136003)(346002)(366004)(26005)(6486002)(8936002)(66946007)(2906002)(66556008)(8676002)(31686004)(478600001)(86362001)(5660300002)(16526019)(66476007)(6916009)(186003)(956004)(52116002)(16576012)(36756003)(2616005)(31696002)(316002)(83380400001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmpYR3dQQWFXVmFrRmNVa2ZsN2RmTlUrcGFuNXAyeitDdUFhVWxQamhMUTFk?=
 =?utf-8?B?ZzFRZUlqcTBLQ2hDU1lYWXRYWnZtZW5wMHJtcWI0SHhubWZNb2ZCSmxEajcy?=
 =?utf-8?B?SGJPNnVJREFLZnVxNVBtb2dLS1BocnZUejFva1E1KzJxU0J4UThEZ2xhYlVy?=
 =?utf-8?B?ZC94T0tnMS9DcmplS0FteE9WTUhKY2xGcGpMUEZPZG1WL1hJY1JYK0lxTzJL?=
 =?utf-8?B?SUU5dWkzcnVKUWMvZHBKOXNVTnVyVEdDS2hPWnFQeTdGdVV3UTJOUjl2QjVl?=
 =?utf-8?B?cUJra09SU3ZZOUQwKzFHRk16ZUw1WXd2Z0ZkOE5wQVRFNGRiMm5oZU9ON25m?=
 =?utf-8?B?TmcxZlMvNjZaSGhJQjZnVjJQYXorQkk4cGdzYlF6OTRKRlMwUWU5NUhFNDl3?=
 =?utf-8?B?WWFlWHBHWXRoZmdsbW9TSjZDRjNySVZucEZGUUw1TnRsemE2YkkxL1IybklW?=
 =?utf-8?B?OWRSZXRVcTZYWmVUWmNFMWZrMXVheTNmcmk3OUVkSk1WWVJScVVycDJjcXdm?=
 =?utf-8?B?N1FzS01uSVY0UXZOS2lJYUNDdkMvZU9XbjdUa004M0tWRDh4VmlaTzJxVGtE?=
 =?utf-8?B?aHpnd09ZUCtpVzM4KzZJakpzdnJWUjF3QUwvTW9HUlAvK0tTOEZCQjBhL0dN?=
 =?utf-8?B?Rm44RGFDUldDYU1NV01OWUhkT0V0YndzZzVRUkNCUHVwYW4wd0xKL0ZuZTNh?=
 =?utf-8?B?ZzlmNGJqQVNDUUhIcmdDTUx0REZoQ0hsbm1OMG13MEQ0QUJXZm5nRlk2VnRK?=
 =?utf-8?B?Y01hNlRkbW1pc21nekxiaDQxWW83NTBCVDdxemZQWjFtdmxObHlsb0Q5ZVNi?=
 =?utf-8?B?Nk1VbjQwM1piQmZrL095YlNNTTA0Y3RqYmNkU0NQMVJ3VzZyYlRqRWtnSWp1?=
 =?utf-8?B?Z0srbWtBcTQ0eWFxZzk3Yi9vaXdqbXNVNldCOXcwdHJjd2wzRjB5SnpmL2k5?=
 =?utf-8?B?L0tZUzMvNXU3M2lGM0M5eGtUbG1CdmUwRUgvOFVOdDRUL3psTElvemluRDNn?=
 =?utf-8?B?T1g5U09ldmFtckFPNGovWUVTdUtMUDBGYTNQL0VQL3hjdUJvNVY2QmZ3aHd2?=
 =?utf-8?B?WW5sTGlNWWEwUUs0ZENtblVZTnU1RTBOMjMxSUMrcU5IMWc1SmlZcXFuMWhH?=
 =?utf-8?B?d2k2dk9UNkRuOFN6S2lBaEI5Wkl3VTJvSnhyUncwVG0zbjhYN2plNk9TV3Q2?=
 =?utf-8?B?VTRSMmlXSHBXNHR3S3JFWTFSdnlQTHhxTkpPaGJ4MHNJQ0c5M1RlampzdVBn?=
 =?utf-8?B?UFZIemJWYjQyVWlkMklKVWRNUi9qZGJYRXNMdXhPKzUzOUd6OG9YWllvcXE3?=
 =?utf-8?Q?+PuY0r2bIkg3wVU4aTi7HYvnlP02y4mWLZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9670740-c3f9-47c6-bfd4-08d8bbd28dfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:00:27.7109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mERcyvWhBAizkLe3vBuYe9ZUKZnXyAII/6c9F7wsSut1XnyOgrb6osF11g8ov3EFSp63wtu0u1ikIO/uDWuPFHV7IPeVpqYFBOwmkkQEClU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.4.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7,
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

18.01.2021 12:59, Kevin Wolf wrote:
> Am 16.01.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 15.01.2021 16:30, Vladimir Sementsov-Ogievskiy wrote:
>>> 15.01.2021 16:20, Kevin Wolf wrote:
>>>> Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>> 15.01.2021 15:45, Kevin Wolf wrote:
>>>>>> Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>> 15.01.2021 14:18, Kevin Wolf wrote:
>>>>>>>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>>>> Add TestEnv class, which will handle test environment in a new python
>>>>>>>>> iotests running framework.
>>>>>>>>>
>>>>>>>>> Difference with current ./check interface:
>>>>>>>>> - -v (verbose) option dropped, as it is unused
>>>>>>>>>
>>>>>>>>> - -xdiff option is dropped, until somebody complains that it is needed
>>>>>>>>> - same for -n option
>>>>>>>>>
>>>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>>>> ---
>>>>>>>>> Â Â Â  tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>>>>>>>> Â Â Â  1 file changed, 328 insertions(+)
>>>>>>>>> Â Â Â  create mode 100755 tests/qemu-iotests/testenv.py
>>>>>>>>>
>>>>>
>>>>> [..]
>>>>>
>>>>>>>>> +Â Â Â  def init_binaries(self):
>>>>>>>>> +Â Â Â Â Â Â Â  """Init binary path variables:
>>>>>>>>> +Â Â Â Â Â Â Â Â Â Â Â Â  PYTHON (for bash tests)
>>>>>>>>> +Â Â Â Â Â Â Â Â Â Â Â Â  QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>>>>>>>>> +Â Â Â Â Â Â Â Â Â Â Â Â  SOCKET_SCM_HELPER
>>>>>>>>> +Â Â Â Â Â Â Â  """
>>>>>>>>> +Â Â Â Â Â Â Â  self.python = '/usr/bin/python3 -B'
>>>>>>>>
>>>>>>>> This doesn't look right, we need to respect the Python binary set in
>>>>>>>> configure (which I think we get from common.env)
>>>>>>>
>>>>>>> Oh, I missed the change. Then I should just drop this self.python.
>>>>>>
>>>>>> Do we still get the value from elsewhere or do we need to manually parse
>>>>>> common.env?
>>>>>
>>>>> Hmm.. Good question. We have either parse common.env, and still create self.python variable.
>>>>>
>>>>> Or drop it, and include common.env directly to bash tests. For this we'll need to export
>>>>>
>>>>> BUILD_IOTESTS, and do
>>>>> Â  . $BUILD_IOTESTS/common.env
>>>>>
>>>>> in common.rc..
>>>>
>>>> check uses it, too, for running Python test cases.
>>>>
>>>
>>> But new check (written in python) doesn't.. Should I keep bash check, which will have only one line to call check.py with help of PYTHON?
>>>
>>>
>>
>> Or finally, may be just drop it? Can we just use system python for
>> tests, now when we are already in a python3 world?
> 
> You can only assume the Python 3 (or more specifically 3.6+) world if
> you are using the Python interpreter that was passed to configure. This
> will commonly be the same thing as the first python3 in PATH, but it
> doesn't have to be.
> 
> So your solution of just using the same interpreter as for check might
> be okay as long as we make sure that 'make check' calls check with the
> configured Python interpreter instead of relying on the shebang line.
> 

I've sent v7 with exactly this thing: use same interpreter as for check and adjust check-block.sh which is called from make check


-- 
Best regards,
Vladimir

