Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41C34D120
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 15:30:32 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQryR-0002wP-3U
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 09:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQrvE-0006ki-Q1; Mon, 29 Mar 2021 09:27:13 -0400
Received: from mail-eopbgr150104.outbound.protection.outlook.com
 ([40.107.15.104]:38823 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQrvA-00036E-PP; Mon, 29 Mar 2021 09:27:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHK/Eo5QsH9fN7Ewpb67EZCsShVCAYzCzCJWzM0yfhM3IWdzM2rKrz9kLEvD0g7LvBt7PACH9BJVBV3n4VUMgcv8MgoufRYDfA5Gjqk+DSwGez8QyQYFoblR0aGxB2xdmBLcHEYSlCaxQC9TPZjhSTo2ZHe+JOrlPnNq2TUJF9WpyjYgAXTeK9uVEzWaylDUxV04TkZW784YBKT0OXTIfRz+8A425ioS5WT18FXC9mxI7ZKJLtMRhIzeZusgTvNpsVxB2ptY/RJL1HJkYoSLR/jHyO+EB/O1hhC9TSMz9LtwzCEytEZqgVZ77EdPLjizepyy5tWTcveYZgFAInkjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3KTRA0fTqLHRN/iCQI6QLfaPhqF8PyK/c1gVgz8gko=;
 b=KzCtYuG6l6o5V5J1sYJ4SLtHlpQJEExRzeILKqEIFrqS20q7aICnErRrskhqu8F9cGWKW0Medh9sMa2PPqFXJjgnaNsVopQNNfXI5jSjp171XLh753bEXJUjx67mXB098h2XYsvVvZO3r6SI8QdhY1i7aLXdxGY/NFfXyuraVY+n6WQpKm89S97l9M5snxN6CNJOT3/JcAQeifIrvVxaXgva8ngPvE4JxEf56RjSSF9F8IbmznoqSZ+crMn1VOoJxRxlSDN6SV0ySfNgXtqdMVScejBEtzhI8vq9NZiMPqnsOp+yx2R4r4GxWrVs3zHHe7QWXkmLY/YYSpfesxvSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3KTRA0fTqLHRN/iCQI6QLfaPhqF8PyK/c1gVgz8gko=;
 b=Vrtw0awzK9/IbH/ton4WwLZFWwN2gZvoMypw/gjLMr8jCkP/F0ucdOtsJClKHKSpERclsNPFSIcx29Q2bWw/Qk8HvJBkGbq8IAnoZ3H3xA4vLazjoe40kfgI1FKNGIQInROBDx5vlaQdYKn9556qizRDONjyU2T53HzYIkbpZQk=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com (2603:10a6:10:fa::16)
 by DB6PR0801MB1670.eurprd08.prod.outlook.com (2603:10a6:4:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 13:27:01 +0000
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::f127:7f1e:e776:42c8]) by DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::f127:7f1e:e776:42c8%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 13:27:01 +0000
Subject: Re: [PATCH] iotests: add test for removing persistent bitmap from
 backing file
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@virtuozzo.com
References: <20210317160207.626468-1-vsementsov@virtuozzo.com>
 <50162cf1-a4b3-4aec-9f29-7edafc83bd9b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dbdc0cd0-978e-3a1d-7080-81a5b2457632@virtuozzo.com>
Date: Mon, 29 Mar 2021 16:26:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <50162cf1-a4b3-4aec-9f29-7edafc83bd9b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM9P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::20) To DB8PR08MB5499.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM9P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 13:27:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c087b50-8c50-4d19-5dc6-08d8f2b65603
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB167068D24C78975C5A00C4A2C17E9@DB6PR0801MB1670.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RA5T57QlhtYFAmXeGglTmWTQOgrVn5qNAKorOFMsR6iN9bbNEqSTGokLPEWIQQ3gQPVz+FWsyRxlc2ztXkx2Kx3CubaL5Cgq6zbnToDQ532eEZNzuEX4FQ/rjl9zzqL0bZgUsljFN/badFTbYyLCMPToA0RMluAC5W68y+pNUBs57HgmWKmNWcKBFH304od8oF0Ksm2vhNHV1TYrAgsTJ3WrIsse9LZZTEx41XV48IKlaMKWIx7gKwzJpFuVZrqcrfdVnC7ZKLFmki9jijsSB9R6IBH/S1OwJhIhiVmEUMb5l8R9kBYgd7RU9dKsLTDGgjAEKdAPbGa8sJuT0/hsxY6NoPtSIQCKntdFwpMHYE2pu8NnVuwGXOFBShbzlW8v+B7qo07zicp0Po4XtNp/F1F9oxolyXVPXMVRX15YrF216pTpjEMb1mITzVbtQ+RiGyGZksLNVFhKthCKTBHJcDnWwFTRa5Lp0QMI57B2Nd3icmX8C3JBluRBZtRYb2Yye0CmJi1iwSYkTfYWIdoJwcfv+J2OiQyUdwvaktJDSg3au20I/OW381LPEk4/SpLfwS0QKjqeJXBOYAcUv/IXfMjJOT4wVBq+K3uTILxM4NOR2TnKeI5jMATfWdzq7dC0LvF9A5iv+50qbcR7ag+fBqyM54uPjj6uoQ/4Hhi7m68bKDE5VVTLqAB8AcLQK69Vz2s7u+088eCH50jKE2x4Vq+1PyMt+ZIG7BkSAN4UCPHxwcTFTb1TQPZxrYqB3IM7unF9HMqyF+aXhxoPc+JifpOhsk+NjFL94tzBgloKw/IzjTQlaJ09fugtcnQPzYTeXfTud/b0F6m+Oznt3ZliMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR08MB5499.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(366004)(396003)(136003)(86362001)(66476007)(66946007)(6486002)(4326008)(66556008)(31696002)(186003)(53546011)(52116002)(38100700001)(478600001)(316002)(5660300002)(16526019)(83380400001)(16576012)(2616005)(36756003)(31686004)(2906002)(8676002)(107886003)(956004)(8936002)(26005)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDg2dGx2WW0yZFNIWllxajBsYXlsc2xnWVR5U3E2ZHViUWR5bzF1L3pEWVFh?=
 =?utf-8?B?RXIwb0Vqa3o0eGlxR0FtNEFsUi8yaUtoV0JDQy95dFJhN3NGcW5BTGZ0UjRu?=
 =?utf-8?B?SWRQUUJ1VTZ1bGIwckRyQndzMXhkU1ZkTUIySS9Ta0dzWVF2OTExMjlaMG5U?=
 =?utf-8?B?d0FGLzYwV21pam43YWNaWnE0VE8yTGlMU1Ara0t2WDlURHpPTGpQdFdTcUpK?=
 =?utf-8?B?cGEybVhtUW9lWkZLTnNlaVplY0EyeWs1cFg1Q3VxMUo1R1VoVytDS2dBa2FQ?=
 =?utf-8?B?bFJxL3Vuejkwd3pYTmRsNGQ0b2ZxNUc3emJ4bkJQclhDWVlZRlBxM1BSR0Zk?=
 =?utf-8?B?WVBnTHh0TlBPUUVLa2Q3VzRTRzh3T0lsTVhXc1lEWVFhdmNrdjNhZE1nTlFj?=
 =?utf-8?B?TEU3OENQMG9vQnd4SFVvQy9ybHJWWE05K1VrdU9xdWVuM1pLcFZub0dLbVFa?=
 =?utf-8?B?djZyNDlQU2VDZkhYQm5KTC9IK2RUQUNlOVA4MFFjSEFaVmlDbHREYzRhQVFT?=
 =?utf-8?B?dHhyNVhrK2h6YVNmVEpSby9lN3d1NnJ2YS81SEhnYjgza2cweGUwOW9mYkda?=
 =?utf-8?B?TzJZdUdqSXdhdk9Zd0pFd29Vb2tTNnE2OEVyR1ZGZCsyTFFqdEpkWkZwT2J5?=
 =?utf-8?B?VEhNbmJ3VnVjU1pzdlRWTHB4bWQ3WC9IWFhRZVJ3blE3QWszamJzRWtRSjJ4?=
 =?utf-8?B?NGg4OVhLVjF3dnl6NXlrVi9YZjZOU0N2OXI3VllUUGlQN1lVRGs2U21NcHlC?=
 =?utf-8?B?WnlyY3hzRzNEd2xCUU9ZVDBiRTFDdWRTQ1JCV0pvNTVSK3hieXhVTkFiekRX?=
 =?utf-8?B?TlFLdVBJUXFpUVpBNVFLSE9lMnpaQ2wxRFloMG1wNHRHVmJ5ci9EZ242YW1k?=
 =?utf-8?B?bFN4SHpsK2svSUxNdGVZMzY3UzJtQmsybWhkaTdYenZicHQ4V25zRnE3eWFB?=
 =?utf-8?B?U2Juc3lRUU5SUmRjRXBPU0NYQm5FUXVPaDZXZElweWlxQkdXc3lQMy8wRG41?=
 =?utf-8?B?cDlNNDNwUDJXNzhYNVlNWUEzVjFhdnJnbUZNeHVDU3h4b0FKd0x5Q0lYUnZX?=
 =?utf-8?B?S0NCUEdyTGJDUDhRU3g5TEFSakRtWFJQTmZ4dWdHZW9pNVFHNDVoVnNQaUZm?=
 =?utf-8?B?YldhTjN6UzZoeE9rUXkybTJVeW0vcmgydHpkM3E1YTV4YUphU0QvdXZhSmY2?=
 =?utf-8?B?YjNjRytJSDE3U3pIclBzVmQzWmhKUi9GU2RIbkwyTG5Ta1p6azFZZ3kvNnhO?=
 =?utf-8?B?ZmsxU0lySzNRLzB6UUN3UWQrRnNEU3A3bU5xRWVoQ1pPOXVSK2Q3ZWVacVB6?=
 =?utf-8?B?ZWZmeUV6ZVpaWFBmbTdzbXV5OTI4YXpXbmRJZldKdkRpUE5CZytGY2RLY1p6?=
 =?utf-8?B?bUt6OURBUHhsSWg0MEF2cWRLWXFiMUl4Tjc0TUpoYndpWVBwdXd4NzNxRVRG?=
 =?utf-8?B?V0RndXhXcTk0ZWJ4OHQ2dE5zT0ZUTWxad3Nlemc3bEEwWjdxTkxVcm1IUkFs?=
 =?utf-8?B?RlVTWVlTTzZ1bW5TYTFlTloreEhkdE1hVVVKVk01anR4ZVFEZEJpbjdZVTlT?=
 =?utf-8?B?bGtLRHFSc2RkczUrWHVNY2IvUUx6azgvdzh2NEwycWt3QXFjV0RyLzRsN3Vu?=
 =?utf-8?B?L2h4Q0IvSWI3U2Z1ais4WXgrazlFTjJBMENhZ0hOQWlIMlJZdnBSZW1neTRn?=
 =?utf-8?B?N01KdVRVZ25vRmJwejlZVkJaOG1aQmhudEYrR1dhU005VXZsWmRQdzQzclRZ?=
 =?utf-8?Q?+PKkCZIsIk6QTxYDal0pQ85mwDLhjV/6DF4i6Wp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c087b50-8c50-4d19-5dc6-08d8f2b65603
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5499.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 13:27:01.5359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41+jJWwcKmIoCMEw8FLLqWufZxA5sU72ygUX/urau+a/h2s7qoJkBu21N4LduqDK77qX1oMC8WJkn/p8lG4sicc8UsHrTQryqk3XzHb61OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1670
Received-SPF: pass client-ip=40.107.15.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.03.2021 15:56, Max Reitz wrote:
> On 17.03.21 17:02, Vladimir Sementsov-Ogievskiy wrote:
>> Just demonstrate one of x-blockdev-reopen usecases. We can't simply
>> remove persistent bitmap from RO node (for example from backing file),
>> as we need to remove it from the image too. So, we should reopen the
>> node first.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   .../tests/remove-bitmap-from-backing          | 68 +++++++++++++++++++
>>   .../tests/remove-bitmap-from-backing.out      |  6 ++
>>   2 files changed, 74 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
>>   create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out
>>
>> diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
>> new file mode 100755
>> index 0000000000..121860d035
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
>> @@ -0,0 +1,68 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Test removing persistent bitmap from backing
>> +#
>> +# Copyright (c) 2021 Virtuozzo International GmbH.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import iotests
>> +from iotests import log, qemu_img_create
>> +
>> +iotests.script_initialize(supported_fmts=['qcow2'])
>> +
>> +top, base = iotests.file_path('top', 'base')
>> +size = '1M'
>> +
>> +qemu_img_create('-f', iotests.imgfmt, base, size)
>> +qemu_img_create('-f', iotests.imgfmt, '-b', base, top, size)
> 
> I think qemu-img create nowadays complains when you use -b without -F. Also, I’d prefer an assert around this (i.e. assert qemu_img_create() == 0).
> 
>> +
>> +iotests.qemu_img('bitmap', '--add', base ,'bitmap0')
> 
> s/ ,/, /
> 
> Which makes me notice that 297 doesn’t yet check tests/.  I’ll send a patch.
> 
> Also, again, an assert == 0 might be nice.
> 
> And then I wonder why you import qemu_img_create from iotests, but not qemu_img and qemu_img_pipe.

Hmm, at least qemu_img is used only once. On the other hand, it's probably better to import them all, readability would become better.

> 
>> +# Just assert that our method of checking bitmaps in the image works.
>> +assert 'bitmaps' in iotests.qemu_img_pipe('info', base)
>> +
>> +vm = iotests.VM().add_drive(top, 'backing.node-name=base')
>> +vm.launch()
>> +
>> +log('Trying to remove persistent bitmap from r-o base node, should fail:')
>> +vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
>> +
>> +new_base_opts = {
>> +    'node-name': 'base',
>> +    'driver': 'qcow2',
>> +    'file': {
>> +        'driver': 'file',
>> +        'filename':  base
>> +    },
>> +    'read-only': False
>> +}
>> +
>> +# Don't want to bother with filtering qmp_log for reopen command
>> +result = vm.qmp('x-blockdev-reopen', **new_base_opts)
>> +if result != {'return': {}}:
>> +    log('Failed to reopen: ' + str(result))
>> +
>> +log('Remove persistent bitmap from base node reopened to RW:')
>> +vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
>> +
>> +new_base_opts['read-only'] = True
>> +result = vm.qmp('x-blockdev-reopen', **new_base_opts)
>> +if result != {'return': {}}:
>> +    log('Failed to reopen: ' + str(result))
>> +
>> +vm.shutdown()
>> +
>> +if 'bitmaps' in iotests.qemu_img_pipe('info', base):
>> +    "Hmm, bitmap is still in the base image. That's wrong"
> 
> With 297 covering tests/, it complains about this “pointless string statement”.  Shouldn’t this be something like
> 
> log('ERROR: Bitmap is still in the base image')

Oops yes:)

> 
> ?
> 
> Apart from that more syntax-y stuff, the test looks good to me.
> 

Thanks, I'll resend.

Side notes:

Actually I had to implement a downstream-only argument for block-dirty-bitmap-remove command, that allows to temporary reopen the node, because:

1. in Rhel7 based downstream, we don't have x-blockdev-reopen at all
2. in Rhel8 based downstream, we are still in pre-blockdev era, and x-blockdev-reopen doesn't work as expected (it doesn't want to work with generated node-names)

And I have a request of doing it in a qmp transaction.. It's very nice to do complicated bitmap manipulations in transactions, because management code (libvirt) becomes a lot simpler..
Probably I should publish my patch.

On the one hand, it seems that, I should not: upstream way is using blockdev-reopen.

Still, transaction support seems simpler to implement for temporary reopening to RW than for the whole blockdev-reopen.. Or may be not? blockdev-reopen is already transaction-backed, may be we could support qmp transactions. Anyway, my "update permissions update" series should be merged first..

Also, working with this all by hand, I found it not-comfortable to specify all blockdev-options to just reopen to RW.. May be for libvirt it's not a problem if it tracks all options in the own node graph model.


-- 
Best regards,
Vladimir

