Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7962D7650
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:12:04 +0100 (CET)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniDL-0001VS-PW
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kniCC-0000t3-Jo; Fri, 11 Dec 2020 08:10:52 -0500
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:39776 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kniC9-0008Pf-0K; Fri, 11 Dec 2020 08:10:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia6Nvf3bGsK4AhWAW908IBZixwcHSWMaIsza6xlFWZdtuFjy3DYOW2gv28dwY+L6+A+dKYqBGwFIu7RPxqjfQXARxyzp89L0uzxHoJ+sRqfxzC51kzKE5Jd7+BCmTtbQ87e4sOs3DNMrr/UAx96CP9Q7/J2Kc7rd0og1G0fUdGfBHY3mlYK3SOKIAF+mHIlyofCa0yAUlF2XUTNWy8/PLam27rk5zWJ4EFUI7e+1KHplO9kJUAEVkAk9j/v5a9vkkVtqMxFFK6LPSKvUChKfL1Q/P0wPrlwwyoV1H9WY7ddZnOtFdWGpshpv9q7bMtXtWSnCGznrf5VQheB81eR9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbTrnXymEkV/jgs00ycc8dXSCBdDzCOc+BkT6YYqf0s=;
 b=Wuw6I91bho6yDdxbgltz/p+VlO+jSDhqqUjXJ9j1WMd3oqIGdB3qs2HuFTwRZft30yCqkqWGHosmag9jWcpkoFgp2J620cyszgW3AvH4JURTmPYfn2Arle/ek0WaDLrdijxzb5pzEBmtz+y25dz1GUTtTmxLRwQWR4BsUahSOhexNdAV/P9b2XNO5PlhexRd0LD3b4SPTtlqkLfKEcXmFidmWPQMQixky1TLuASFhUMTKd1AVxDuBSmUYlO+RT9tXVrigDD76n3fUlBNB3yidxbXlXtUblm0fna4X8k2Xgih8Iyv5HYEO7nILN0ciZGrkwQnjm0UoeHp0Uo509qfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbTrnXymEkV/jgs00ycc8dXSCBdDzCOc+BkT6YYqf0s=;
 b=Fb8gg1o3Ouf5Vq+VG0vRID8F0X3e3GsNB6iCCCBfte/bS5XX5V5LKPW/yzaElDxCEDnaukiPM4AIA5zaKcDO5v8AdNBCONk7FN5HonmXohByTmHtnDTtQaKG6AIDS02ivPFztm/1PD9gaYM66q9ZUCCqIwmFVpQx3inX7zfutg0=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 13:10:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 13:10:44 +0000
Subject: Re: [PATCH v14 06/13] iotests: add #310 to test bottom node in COR
 driver
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-7-vsementsov@virtuozzo.com>
 <4849feaa-631c-0b23-6a65-d48b367961d0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <31cc63f1-1e55-22fd-edff-2a815f690f11@virtuozzo.com>
Date: Fri, 11 Dec 2020 16:10:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <4849feaa-631c-0b23-6a65-d48b367961d0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 13:10:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1683086a-19a7-4a69-bb78-08d89dd62b0e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6165FACB33BC9F4E61D16477C1CA0@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RBwVXlRIlDavKzCX6ChRKIw2ZcjLGaA8wZIvRwQ/yAHuTGSiNMQKDt9uMKyzBNQRy1y/oQOCtfPEh7G0XRTOo1oW3Bnl/53VonhbnpXkwZLyKzx5sA07S/1QxWYhckQrqPdur0ZTPTGqeq1SYIiH7Q9AgK4rvixxjcoOtu+hAci0w0D9KdXW6whNkSB4e8WlOsFiBKYWRWOnMWUpcfRUJbbJgwh+C2F2N0zKJFehP6SD+cbE38AQt1NHKQrCmtZNWbE0J6LVHa5cGYQZt5/vj673n4MKWvVZY7b/bwhMneB/OBBY677inLwZ11uTa39wL6vIsGRin76KN5noXSkF/GOjYGWX+iDWCrl9aukAwSZcpqoec/tsFuvd3y80nOeqcy/8q+SZXwCd3UtiM+bXmqoFotzqfqsz2XsIE0YpN25R8Ht/A5jXOJP2EoMaChIP4LJeeefdhg+Jqw2t5VO/nHeBkkziPZZErIG2rqQQvok6GxViMRmkyjEk4CecjuYKUNxwH2v8tp5Is1xQyhRog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(346002)(136003)(396003)(86362001)(8936002)(52116002)(5660300002)(66476007)(66946007)(83380400001)(16526019)(66556008)(26005)(2616005)(6486002)(31696002)(16576012)(31686004)(107886003)(956004)(316002)(36756003)(4326008)(8676002)(2906002)(53546011)(186003)(478600001)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkxNODdiUXducERiZ0craHlKbWxxVHpVckVpUHl6YlhIa21ERHJUT2xLVkZ2?=
 =?utf-8?B?ZHNCbEFtSElKRHVkOGVxWSszVWFoemJnQXlsS0xBTmk1YzBWUXBlTWV2SkNS?=
 =?utf-8?B?cFM5NVZ0bEg5aFMrMjZMaDFKVG8xRDBnYzk4ZUNqeWJmbWY0L3lycGl4bm00?=
 =?utf-8?B?SGcxZGhEaVJlcjMrMjlOR1ZEU2pWY3NKbHBXb0dKR1Y4bkZhSklGSVRyTnhE?=
 =?utf-8?B?R09KaWtIZ2orQktaYTlQVUpwSTkxZXJVOUZqT2FaUUp4NVREZU1PQjlDN0t4?=
 =?utf-8?B?dTZWTUlsbFcyZDBHb1V5K3pTU2Mra3JtbGZ2MHBCNXIyS2tHWFh4RVRxK042?=
 =?utf-8?B?OUczY0c3UllwdG1xckl6c3NIQXhzZWtTTlB4Nks3S3RtK3lUdXVZRytDT0Zx?=
 =?utf-8?B?ODVJcmJmNlk2cGJRaEY2dWVmZitIdUkwSEpZaVRNU2VaNnRTQUQwQkNuNHRW?=
 =?utf-8?B?aU1rRkpkdFpmZnFwN0VEWHV6RHIvdWlWUVNvOGdlMHBBOUpzZnJzU2Z3WDE3?=
 =?utf-8?B?bDZsWTF1ZUlhNnBxdXJrRlVrNTAyR0VLK1ZMVXNaeUdzUXVleHR1OTZPVncy?=
 =?utf-8?B?ZDRvTjJrbjJmc2E2aDNMNlorcVdxVDg0aVNZaGNsR0x4R0NQWGNXU3NDQVFU?=
 =?utf-8?B?dDNLQVdwNGxEaFFORVJWUnlNb1lFdmFob1hHc2I1Q1ZIa2swRTd0WWp6Z3oy?=
 =?utf-8?B?ckxHTk9QVXRZMDBDLzc2R1dqa1JLbUZ2UFpIZVZWSlA0VGdCYU55blJ6aUNO?=
 =?utf-8?B?U1JpWmpaUWJCNDBPRFhqYUxYdVdGditPOU1ad25WSEJWWlRaRzg3L2Y1TUly?=
 =?utf-8?B?aGtnZkNsSy91RU1jRW9sV2FLV1prVFdveENvSVhNdG9rZklaT1NvcXBZM2JC?=
 =?utf-8?B?UERFUzdyVjJ6dmcyOWkzOWVpMVVHTmF1ZURzOU5lNzU0dGlEbWFIb0JHR1Y1?=
 =?utf-8?B?WmpEV2FXelRWM1JNeTdvSGs1OVZDK1lmUmpIdVlxZkVLTmExVjhpNnNUVzl2?=
 =?utf-8?B?eWMvTkN2RE8zeVQrUGFqbnZQM3dMaWFwTS9yUElpOGlyL09vQ1l6ay83azUx?=
 =?utf-8?B?RWhzbElmdFhKcTdCMEtMR0tpaDhwQXhyWlgzR056OU5ud3AxN3QzaHErY0VR?=
 =?utf-8?B?OGtxUzVpOVI3c0JxWEtWN3NjUXVleW5HYW9XNFJzcFNncGlFMHZub3JaSm1G?=
 =?utf-8?B?d21EWUlxYlAxTGkvSzN0TTMrNlJabHdEQ3l2aDE5WXEvbGZBanJXdlc0M0tt?=
 =?utf-8?B?YWNEMjNVeS9ubWVHeVo1WjZnRzhKcUF3N3VlSWNpd3BHK3FuUGVPaW1tQThN?=
 =?utf-8?Q?SajEhFJpH1s6/ra2ahWYShiPjkkXwPcZ5e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:10:44.3036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1683086a-19a7-4a69-bb78-08d89dd62b0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQVHPU6jAN2F6FZC/AecwB+L/CrfCyPYLyKe/fYL9W9dQp98b2GAPLgX9u8gG+GBtPueSl78lt302gtwcjJgEyCuJZWrOj4RWi3++2ewf00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 15:49, Max Reitz wrote:
> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> The test case #310 is similar to #216 by Max Reitz. The difference is
>> that the test #310 involves a bottom node to the COR filter driver.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/310     | 114 +++++++++++++++++++++++++++++++++++++
>>   tests/qemu-iotests/310.out |  15 +++++
>>   tests/qemu-iotests/group   |   1 +
>>   3 files changed, 130 insertions(+)
>>   create mode 100755 tests/qemu-iotests/310
>>   create mode 100644 tests/qemu-iotests/310.out
>>
>> diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
>> new file mode 100755
>> index 0000000000..c8b34cd887
>> --- /dev/null
>> +++ b/tests/qemu-iotests/310
>> @@ -0,0 +1,114 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copy-on-read tests using a COR filter with a bottom node
>> +#
>> +# Copyright (C) 2018 Red Hat, Inc.
>> +# Copyright (c) 2020 Virtuozzo International GmbH
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
>> +from iotests import log, qemu_img, qemu_io_silent
>> +
>> +# Need backing file support
>> +iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'],
>> +                          supported_platforms=['linux'])
>> +
>> +log('')
>> +log('=== Copy-on-read across nodes ===')
>> +log('')
>> +
>> +# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
>> +# The difference is that this test case involves a bottom node to the
>> +# COR filter driver.
>> +
>> +with iotests.FilePath('base.img') as base_img_path, \
>> +     iotests.FilePath('mid.img') as mid_img_path, \
>> +     iotests.FilePath('top.img') as top_img_path, \
>> +     iotests.VM() as vm:
>> +
>> +    log('--- Setting up images ---')
>> +    log('')
>> +
>> +    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
>> +    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
>> +    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
>> +    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
>> +                    '-F', iotests.imgfmt, mid_img_path) == 0
>> +    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
>> +    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
>> +    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
>> +                    '-F', iotests.imgfmt, top_img_path) == 0
>> +    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
>> +
>> +#      0 1 2 3 4
>> +# top    2
>> +# mid      3   3
>> +# base 1     1
>> +
>> +    log('Done')
>> +
>> +    log('')
>> +    log('--- Doing COR ---')
>> +    log('')
>> +
>> +    vm.launch()
>> +
>> +    log(vm.qmp('blockdev-add',
>> +               node_name='node0',
>> +               driver='copy-on-read',
>> +               bottom='node2',
>> +               file={
>> +                   'driver': iotests.imgfmt,
>> +                   'file': {
>> +                       'driver': 'file',
>> +                       'filename': top_img_path
>> +                   },
>> +                   'backing': {
>> +                       'node-name': 'node2',
>> +                       'driver': iotests.imgfmt,
>> +                       'file': {
>> +                           'driver': 'file',
>> +                           'filename': mid_img_path
>> +                       },
>> +                       'backing': {
>> +                           'driver': iotests.imgfmt,
>> +                           'file': {
>> +                               'driver': 'file',
>> +                               'filename': base_img_path
>> +                           }
>> +                       },
>> +                   }
>> +               }))
>> +
>> +    # Trigger COR
>> +    log(vm.qmp('human-monitor-command',
>> +               command_line='qemu-io node0 "read 0 5M"'))
>> +
>> +    vm.shutdown()
>> +
>> +    log('')
>> +    log('--- Checking COR result ---')
>> +    log('')
>> +
>> +    assert qemu_io_silent(base_img_path, '-c', 'discard 0 4M') == 0
>> +    assert qemu_io_silent(mid_img_path, '-c', 'discard 0M 5M') == 0
> 
> The data discard leaves behind is undefined, so this may not result in zeroes.  (In fact, the test does fail for me with vmdk, qed, and qcow.)  'write -z' would work better, although perhaps you intentionally chose discard to just drop the data from the backing images.
> 
> In that case, you could also recreate the middle image, so it’s empty then – the only problem with that is that it’ll break VMDK because it stores this reference to its backing image, and if the backing image is changed, you’ll get EINVAL when falling back to it...
> 
> (The same goes for overwriting any data in the backing image, though, be it with discard, write -z, or write -P 0.  So I suppose VMDK just won’t work with this test.)
> 

I think the goal is just to be sure the following reads read from the top and check exactly that COR works.

So we can just use 'write -z'.. Or, we can changed the backing file of top_img to nothing instead. Can qemu-img do it?

> 
>> +    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 0 1M') == 0
>> +    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
>> +    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 2M 1M') == 0
>> +    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 3M 1M') == 0
>> +    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 4M 1M') == 0
>> +
>> +    log('Done')
> 


-- 
Best regards,
Vladimir

