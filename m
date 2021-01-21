Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41272FF182
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:13:44 +0100 (CET)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dWh-0007Ng-OX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dMt-00075I-RB; Thu, 21 Jan 2021 12:03:40 -0500
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:58720 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dMo-0000FB-KY; Thu, 21 Jan 2021 12:03:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBuw9PIgq9zpFqwpRV3DALw1XfmEDX+Zd50TUqrDZzWx6SafQEVM+ISeB3t5hSX8F5cBefbj2W+qH9NCztKkLXamCVprm2CoBgrkkVb5u0FtcEEDzONBOEHNai+OufUC5EomN5xndwMmiqzNidHQOYgMTf1WbQtJV/6f4Q8WYgakj3MXH/LQ5P9GiaPjMPhpf/JNTd8JAvhd9V7qp5YAeb3mMG7IeaqfAX3lXTGcrxPbpbgEeRqi+GqdDl+uPQFYMh1MLlATvFq+YBV57xAQXsdfxFGE1v7vjjamBITBtSTCU0I38WPoWJnM0e55aUYeAUz0PdWU/QznkomNFVEwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmZEssE08apQBmhgTntClfeAOux/hjHzNyuJ9r6kmTI=;
 b=BxyWiDog1bXgAJC2foOp3wtwvIU3K7PY+HO8Wu197fhsOAZ2fShfoqfPLqO4E7Pc6n4BPnCrS3ssIyJfnL2i4oZ3gY9XwrtujpT9aNX7UOdRh5e+/yAlO3PscFEEIewXPBXXDA9my8ATk2Mbzwwm59RWJLL3G0Na6jpg9ZoR9ZNCWRSIEw9JG3xq34LCrCyPXIrS2Oe6vuxwddgR2xZ0Va7RIxIq8GDBQ3QWzrRQ99MZfNtsN1jddPGtzNMa1JRx9GInngZCa+c4zwDjwRAT+z96F+xl9YAN/iBbnQ26sncMk9ImdZhJen1+QQHZca232CGjAmAwVKKitGulrHgPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmZEssE08apQBmhgTntClfeAOux/hjHzNyuJ9r6kmTI=;
 b=mKqzz1iYF/ZaemELDFi2mnKgoniWbJ2dcyajJUH3vIuzgK6SUcLb5auRL2dmhbYQ09DGcChtxMSqpurkaEMWmqv8XgmzxqrladTi5F/HwQUhr97bq2XeePS7FGNuhmdr/fUVzZhFl0DXZsziAtRk9zuSnYdslKtUHtbTzEdVrG4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6039.eurprd08.prod.outlook.com (2603:10a6:20b:23c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 17:03:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 17:03:25 +0000
Subject: Re: [PATCH v7 08/11] iotests: add testenv.py
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-9-vsementsov@virtuozzo.com>
 <8088599e-fb3f-5296-6ced-12b09c911af2@redhat.com>
Message-ID: <456a0d63-40ad-50cb-7a8c-16f19107ad68@virtuozzo.com>
Date: Thu, 21 Jan 2021 20:03:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8088599e-fb3f-5296-6ced-12b09c911af2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0180.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0180.eurprd02.prod.outlook.com (2603:10a6:20b:28e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 21 Jan 2021 17:03:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 128a2ea6-10aa-425c-5bec-08d8be2e7786
X-MS-TrafficTypeDiagnostic: AS8PR08MB6039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6039E7BF373E1D01887D6537C1A10@AS8PR08MB6039.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rgcNCjT+l43LcNDwzhD7vcg9QU3ZtdKHxuvzEJdKIE/rHGbxvR4WpIbkqxDhD5NK1IjQJa348xtA8osmJDcvRouVaSbqoMgZ1ZUDzgX/0x1pwtQM37WKobvchw3ZP+nQO9QoRYlhbz1bnskTgU4jWKCB3XrF2u+QUJQv5GneXICcFLaCdyeLNxUsAVih7Ahe3SOtxcHrIky/McqimO/bZ7Zy097jlt5CncCtJUF3XBYwVF9AwqEp7PVfqCxVdaf8YXPQ85zplU6O/DdoJS+ip3lgpviLzgqRHWrzw6thXU+wt9QHbnajoY/9HH1hfozmvl7oLkPB9M97nXUi1S2kyd6i3jikqZvaFxE3NTl7cqc+EadQsWQC1GcVy4/MmSbcot2LUxl/8YezOdAoGoh0qDL9lF2k71tY0I0wuzrBIu2M7nc2tYTg+mTIwdUn/SYuZz13Bms8pbU6rRKZjvUme6EBqfIW/4tTo19mChhlvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(396003)(136003)(366004)(36756003)(8676002)(66476007)(26005)(478600001)(316002)(16526019)(8936002)(956004)(2616005)(16576012)(186003)(53546011)(31686004)(2906002)(31696002)(66946007)(86362001)(6486002)(4326008)(5660300002)(66556008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkdHQzhuSUdPQjM5cFE1SVUwSzJXT1FqbWgva1RQNHhWUGE1THJ4N0o2MXFK?=
 =?utf-8?B?dFRjUW1lM2RrNTMvMm4zeXp2YjRuSzdQK29qbVdwU0UxU05lcVNXT0RuOFFL?=
 =?utf-8?B?cHhZRWtZTVZhTFBKQzQ2VmlsTlVPQWx6TFJIS3RpNC9zcnBIak4zUDhXMFBn?=
 =?utf-8?B?UllzN2t2bEFOSTY3b2pvN012UnFVckNpR1dTaktRNEw4L25RS1NWNjFHWXZu?=
 =?utf-8?B?WlRQa1RaT0I4U3A5TmZpTE84dGxYQy8wQmFoREtMemZpSnM5Q0lDbVNUaTRr?=
 =?utf-8?B?UDlFSkJObjVVZ3ZuSWc4U0xLUGl3ZHNrOFdZVjd5SEZZZm1wKy9BUURtWkRJ?=
 =?utf-8?B?TmpnU01ucTU0OGNlcUZUM05jWXlmdmszYkJOZWVrbm5kL2MycnJSbGdaZ016?=
 =?utf-8?B?aEZKd3ppa1huRm1XMXdwL3RmellnVm5jbjJkK01oSFQzTkpwaDM3M2lXbjFx?=
 =?utf-8?B?VzR4RElUdkZRSHNSNzM2NUhpOHliWkNhL0NwOGdaWCtpQXdwVUZLWG1nVVhP?=
 =?utf-8?B?S3pqa0lTelREK0hyQlpldWUvYmFHU04vMWp0Z212blVTUS9yck12dkZhaFpJ?=
 =?utf-8?B?QUUxMDkwQzN2R0V2RmtLZGZYemR0OXFDS2FYclE1aEErU1JUY2tiRXhKNWZ0?=
 =?utf-8?B?cThpcVR6S2RPdWgvRFhlaUdWSTFqOXVXQlpDRUwvbDBCQnBEQld6TDdLVlBx?=
 =?utf-8?B?cGcyQ2xLSWN5NzNJRUhXblh3VVlXWFlETk91YWdTRHd3YUx3N01kc0svQmVL?=
 =?utf-8?B?dWYwV3Z3RUJwSTBzVmxRRWdGK2tHRWFyTVF1bHlBTnJyZnBLWnphOTRLeWpX?=
 =?utf-8?B?T2Z6c3AwQzF0Mkl5RjBldm1nQ0U4dGxTOXQrRU9CNlZiNkg2TkZ3TzczQjVR?=
 =?utf-8?B?czl5NUtBbGhSRTlncllXWS90NkJ3LzNkN2VGN0pZMHNKVmFnUUVjZC81cmR4?=
 =?utf-8?B?ZUZleFlQcGtKdHZPY0RybUlDUlZlWDA4b1hIR0twWVBkeUlvV21ScTlvWHNp?=
 =?utf-8?B?UlZ1VE1lZW01TzErZ3JtTUZWWHBsWm9nd0EvMGdxVnZhU2Z6bXY4ZDRjd01y?=
 =?utf-8?B?Wi9qeXNWVHRtUEx3VXhvS0tWb3hSOXNock5mYUNROWViMHBqendkUnNhT21j?=
 =?utf-8?B?YVBnbklkb2xyR0pzWDM0Mzh1THQvdlZLUWk2ZkpyQUJOOStWbHpPMFZGaDdJ?=
 =?utf-8?B?UUJKQysvZjZaLzBWcU85ZDZtVlVHWGZmN3RUWklCdzFJUytybzNGaFpxTWdO?=
 =?utf-8?B?dFBOdTE5QU1FMmdqcEFrTHNJZDNhYzcyeGxwSElDbjNDekRyVFhqbVp0VGRj?=
 =?utf-8?Q?jlZadUt5Oqzv2bzGQcVd7O5KrtJDalr03r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128a2ea6-10aa-425c-5bec-08d8be2e7786
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:03:25.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZ2A74FUar0Wmf8ccebGAnt6D+VYO/ImUrXLu+l2wo6/88zOEQplEPiO5Yp3sh6IT7eAgfcuyoWlAN96zf4xm1czHXa2Cl59Kcw4h43SNis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6039
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From: vsementsov--- via <qemu-devel@nongnu.org>

21.01.2021 19:48, Eric Blake wrote:
> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Add TestEnv class, which will handle test environment in a new python
>> iotests running framework.
>>
>> Difference with current ./check interface:
>> - -v (verbose) option dropped, as it is unused
>>
>> - -xdiff option is dropped, until somebody complains that it is needed
>> - same for -n option
>> - same for looking for binaries in $build_iotests directory.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/testenv.py | 255 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 255 insertions(+)
>>   create mode 100644 tests/qemu-iotests/testenv.py
>>
>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>> new file mode 100644
>> index 0000000000..0fe5076088
>> --- /dev/null
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -0,0 +1,255 @@
>> +# TestEnv class to manage test environment variables.
> 
> Should this have permissions 755 and a #! python line?

I understood that keeping cmdline interface inside these three classes doesn't help but only makes things more difficult. So it's the change of v7: the whole cmdline interface is now in check script, and these three .py files just defines normal classes. So, I dropped __main__ things as well together with executable permissions.

> 
>> +def get_default_machine(qemu_prog: str) -> str:
>> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
>> +                          text=True, stdout=subprocess.PIPE).stdout
>> +
>> +    machines = outp.split('\n')
>> +    default_machine = next(m for m in machines if m.endswith(' (default)'))
>> +    default_machine = default_machine.split(' ', 1)[0]
>> +
>> +    alias_suf = ' (alias of {})'.format(default_machine)
>> +    alias = next((m for m in machines if m.endswith(alias_suf)), None)
>> +    if alias is not None:
>> +        default_machine = alias.split(' ', 1)[0]
>> +
>> +    return default_machine
> 
> I have no idea if this is the most efficient and idiomatic way for
> python to extract the default machine out of the output list, but it
> seems to work.
> 
>> +
>> +
>> +class TestEnv(AbstractContextManager['TestEnv']):
> 
> 
>> +        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
>> +                                                   'qemu-storage-daemon'))
>> +
>> +        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
>> +                  self.qemu_prog, self.qsd_prog]:
>> +            if not os.path.exists(b):
>> +                sys.exit('Not such file: ' + b)
> 
> No such file
> 
> 
>> +        if self.imgfmt == 'vmkd':
> 
> vmdk (which means we need to test that './check -vmdk' still works...)
> 
> I can see a rough correspondence to the existing shell code in ./check,
> and with the entire series applied, things still work (other than vmdk,
> which should work with the typo fix).  I'm not comfortable enough to
> offer my full review of the python code, but I can give:
> 
> Tested-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

