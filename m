Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9553510E8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:34:40 +0200 (CEST)
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsml-0002fP-Ro
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRskv-0001l0-Q4; Thu, 01 Apr 2021 04:32:46 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:27365 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRsks-0002gO-Dy; Thu, 01 Apr 2021 04:32:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJA+GJUEqqcwbx0fVjEgbCxzVidDc2q93hygIB7tHHkeIX4DuE5kbTeI5EG/jSXbSU2ESD//1YGxn7C29/XLrtmO183lhH8VmgmFHreYuJqQXR6NN35RUpuRJnv5zSqjuxzomeafe+Hpfnl+jmwQka/E85Rxr7F/gWe/PwU8N33d915wgbvAW/KtmSsmA8151z+kR1reSjbxIhcUO+18K7IwnzNp/mECEaZY67H8wTCgTPGtdzYbeXzeTFC/fupNfFUfG0VKiZE7lpb8jLh6sW6UdUa4MjR8Zv3M60VU6I0jjcgUi3tikbgD6SsLe9pn/1HeUxl9pHr1xpLCHOnYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp6AOClMRIBgLVMkq1MueCm1Y+1R3Xr4xn3fPY/geBg=;
 b=aLHj9X3vSXWHl5/XDtfgHMYLD9lq8pbebaDZK2hef/A5ZalWzXgg3Xnb5QwVWzVwaDTu5Zk11i4na6wj/XJ6pNmFCi/9AmiwhKO4g0iEvkeG8ypgkbgGH63aMmtUhfAyVhLidGPbd3Pdty8yi0WkZfyhGwNnOBSj0TA0gfBjIO6A1y3G6uuzSw0KJGHWwmzNk6m5em6DePnDvMSLHMSdU0SaGdIc/J99qaiOqLGTHtNa8G9WX7jIujWWsYFpfwyYR8KXjFO2weCRETsU0eO5huyqV+Cr9tsia6FlQLKd26HlnPlPvvJJqj6eBgRdINsHVuq34Dq0AprQ0pXdONQFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp6AOClMRIBgLVMkq1MueCm1Y+1R3Xr4xn3fPY/geBg=;
 b=VoszhqLM8mxXAZO9QmaolbQhwWalQcFFR7E01Ld4Ou4G0elOGqydbi1KPXwkBqZVE/2+nWT8wKGARsXOZc25WaDIGp8I17Wvhaih8gCAaPjj18kR0gwd/3mJGhHonlKAa4Rzjc4KxotjeNXxtBnfyBwfIUpGScFDjLZ5SCXWv6E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2612.eurprd08.prod.outlook.com (2603:10a6:203:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Thu, 1 Apr
 2021 08:32:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 08:32:35 +0000
Subject: Re: [PATCH] iotests: Test mirror-top filter permissions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210331122815.51491-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <263c7339-2ac7-c34a-eb71-67148f075e25@virtuozzo.com>
Date: Thu, 1 Apr 2021 11:32:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210331122815.51491-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::38) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR01CA0133.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Thu, 1 Apr 2021 08:32:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c6292c7-4bed-4c1a-20d3-08d8f4e8b307
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2612:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26127B3D9C0A9212108A870FC17B9@AM5PR0802MB2612.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVG8UwSPHXvBxCp6lsqUOeaXZM1QK33fhmfL2+X2ErU+tlxjucbXL4IDgkuaLWAfRkdg56SzDm/cZBgzup+bp/Bx0z2Etvd3tONqRlSF2vLuINNOQdawvY8hPnW+4puUj8iMNWqItOQCsRn7SG8buYxUrNwRbA1dM7XfVxDhqexY8YJ/QrcjIVrkyQtMfkhWFD+manK5eFhJMWy+fOMtqbJb42fE3t9JR49M1R/bIZp73Iory6JWcNMikhPSBCU90gPCModWccuPRD3rW3SjTL+BfrejVVnQF0YRt+pEi2hflMnKc+HtLGZpX7nRzrj6g1U8mRcd7PWPYLyk/SSMl2XW36SlfB2TMekYzWh8IbizS69KmkCyH5MnA5iOakcQUjkXuLixwhf15kxyoKgDvpkwEFQf/mUQ3qmEecy/AbCMR/1JMKilV2pdtlNyhPzI12EszlvP8+NblxlPvjFNI+QoGHJF1rLvQX4nWeGND8vFW+0/XiXh3/+cdacXGLVuzO+fqi9zi1O0Frk/0MAlFKY8QBIyBRHdfhyM0pahyZQibArHEUb+xLokrbdo11YHYWG7T/b+WGGC2q6+7B9NccpoAa3yqHgQ3YGbQtUgGtMlV91AyPUQNiQjvnVG1otYbMGHV5ZzfIXKh6RqgmzujULSYqmo22cr+alow3G2XLQw0UQEGx8fEpqKga4Nnilzqn3FyK+FL7V9XdM4xCjX6zWi0PlBtmjAojh0S90wP31LrNO6US6eU7zOXSwXG8nb93epMJ8bYsUAm3k8JiOdboipSdu22KcFIccKXxI4vS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(136003)(396003)(366004)(86362001)(186003)(16576012)(36756003)(31686004)(478600001)(5660300002)(31696002)(52116002)(2616005)(66556008)(8936002)(4326008)(66476007)(83380400001)(8676002)(2906002)(26005)(38100700001)(956004)(66946007)(316002)(6486002)(16526019)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjNHVHcvUEZFQXphMmpMMEFtRWZJOEhWbkxGZXNlTzhHQnVvRVJ2cWFHbFZJ?=
 =?utf-8?B?YTRuallLSy9idzBvWGF4OGlEbi9lWFU3cVhIUTBRb3Rqd044WjNZbUhIZXVz?=
 =?utf-8?B?WDBBaDBxNHJDUVRiMG1nSzdPNVFJWkQ2bk9BdW1aYjdQRERRNEVRRVVQY2hO?=
 =?utf-8?B?TnRFcGdjaUptNVdOUXVmcjdsNGNKWndhRERlYzd6d09Bb1VrT20wOXMrb0dI?=
 =?utf-8?B?WGExcThzOUZBNkJUcUJiMGYya1lkUXhyQmw0cVlPVXpCWmkvTWhhUEJpOHNS?=
 =?utf-8?B?N3JtK0RlcFRKZ3dPY1lUaGpuaFNnTnlONzh5QXozZGdPZjVrbWQwMmhxdnVB?=
 =?utf-8?B?SlpSRDZDM2RMd0JEL1VNdHR6cEFUS0Y5Rnl1bDVjK0RDVFBNT0g3cVhrdzh1?=
 =?utf-8?B?ejhkTmptcXNkK3FPQnhtMUtFQnZlL3lvY2x6emZTMHJPSU9EdGtJb0lKdmpn?=
 =?utf-8?B?dGZTdzVpbjJSa08rMFpZNmlUZlRibW5LckZmUEVCZGYrZ2dhRFVOZTlhM3hl?=
 =?utf-8?B?UzU2Yi9wbG1KRUZWYkF6Vk5PYlBENldnYkFnQnlBQ2I1OHJhTGlUWk1MVEJa?=
 =?utf-8?B?Vy8vV0txcFpsRldBRHRYVzV3bUM0N0VGVzRSeUhGTVlLZGJMWFkwNTFyY2RI?=
 =?utf-8?B?L3FZU1lRQWNvRnJFc2UzbDl0MnBPWTBRUDNiY3FLVUJDb1ZFSTREOG1BOG45?=
 =?utf-8?B?RTZMci9mQUFWVmlyMExJbFNkYW1nYVk2VW1NcFJDYklaY2xJQ2R5V2JLaHd0?=
 =?utf-8?B?c3BLNmlOSkZWaXFCYnkxMlhCeGVkWmJzejB0aStFQ096M3J6am1rQjZFdXAx?=
 =?utf-8?B?SnlTQWh1RTlBQmdMSy9iWDF3VmF3ODVld2FDRm1XZzRQWDdRc2p1QWM2WXVZ?=
 =?utf-8?B?M2xyY3dDbWhXUDVBcEFQdFJLVWhIWUEzT0xEeWlDTkxFb3hXU1N2Vm9POW05?=
 =?utf-8?B?cXhkMUtQcU8wQzkvRVU4aHkxZzQ5R3RPMSt1NEJjdVFCbjZPUG03ZUZZY0tW?=
 =?utf-8?B?cENjL2h0c01FYUxJcmJRR29DVGhhVjFDVG9oZWlhcFEvcWp1cVBpcExsR0Nq?=
 =?utf-8?B?QzljT2xNN09BNWVPdnBrOEZDeGtrZzRPL1FaQTkyK3pxaUtHZ0daTlhYZGRr?=
 =?utf-8?B?aFo3czliK21zbDcvUzFxOG9BOGloM2ZHa1ZQYTZGTTdoM1B0SktkOHpVSGhL?=
 =?utf-8?B?R0hxQ1diQzNzRk5BbUVpOWdWY2NXL0ZKZWs5KzhpR1BSN0ZrM0FkSmh3N3B3?=
 =?utf-8?B?N1pKMEhzZlQ2K2tWdUwzTWZiMlJHdU1zdXBrTjNVLzhLK3FrWC96NjBsMHVt?=
 =?utf-8?B?OXhkZ0prZnJORlQ0bWUwWGY0NUZtTU5LUk5FVjVFWHhIVHE2OEZ6QTZ1Vlgz?=
 =?utf-8?B?dnhQZ2ZXRGVPMVovRUt6ak54cmh5ajV5UEVma2d1b1R5aXNYQVNTMEFLdEgr?=
 =?utf-8?B?RE4wZXFJOWhYOWc5QlZjQ1ZYWUJ3ejJZc1VONTRFT0VsSVl3OVl4czRnWjJK?=
 =?utf-8?B?bHlrbU9jWlA4b01JcjdFb3hXaTlhMmVIZHVLQi9NemliTlVFT1JwLzdYOUZ3?=
 =?utf-8?B?RGxUakp1VGRmd0RjT21UdGJzMExMR2Z6Wjd0OW9kZEM1RkhnV3l2TkRsK3Mx?=
 =?utf-8?B?dEIvYVNud3VSalFHNVNOb2dBQS9VcUhvVUkzMVlnZlVndjBEQ0xZRDRzV0JZ?=
 =?utf-8?B?YUdsV01mVVdOZDh5VnZGZWhCOTRiM1FHSlVPa3M5dXlTaHBHWGpvQVZ5RXVE?=
 =?utf-8?Q?wK6QXcbCHxHR3vve51xMgJIsHNU5TBY9DdKQxhR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6292c7-4bed-4c1a-20d3-08d8f4e8b307
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 08:32:35.0773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29DC42o88ovLoDz5Ilo8yaCwVDZBcMIORqNaRFqWtgcBcLs3aizGBeron13lEXDEPRyYkSBRoXZgABJyvAwT3N1ztyuXSwFCsTf2npCzKBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2612
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

31.03.2021 15:28, Max Reitz wrote:
> Add a test accompanying commit 53431b9086b2832ca1aeff0c55e186e9ed79bd11
> ("block/mirror: Fix mirror_top's permissions").
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/tests/mirror-top-perms     | 121 ++++++++++++++++++
>   tests/qemu-iotests/tests/mirror-top-perms.out |   5 +
>   2 files changed, 126 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/mirror-top-perms
>   create mode 100644 tests/qemu-iotests/tests/mirror-top-perms.out
> 
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> new file mode 100755
> index 0000000000..451a0666f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -0,0 +1,121 @@
> +#!/usr/bin/env python3
> +# group: rw
> +#
> +# Test permissions taken by the mirror-top filter
> +#
> +# Copyright (C) 2021 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import os
> +import iotests
> +from iotests import qemu_img
> +
> +# Import qemu after iotests.py has amended sys.path
> +# pylint: disable=wrong-import-order
> +import qemu
> +
> +
> +image_size = 1 * 1024 * 1024
> +source = os.path.join(iotests.test_dir, 'source.img')
> +
> +
> +class TestMirrorTopPerms(iotests.QMPTestCase):
> +    def setUp(self):
> +        assert qemu_img('create', '-f', iotests.imgfmt, source,
> +                        str(image_size)) == 0
> +        self.vm = iotests.VM()
> +        self.vm.add_drive(source)
> +        self.vm.add_blockdev(f'null-co,node-name=null,size={image_size}')
> +        self.vm.launch()
> +
> +        # Will be created by the test function itself
> +        self.vm_b = None
> +
> +    def tearDown(self):
> +        try:
> +            self.vm.shutdown()
> +        except qemu.machine.AbnormalShutdown:
> +            pass
> +
> +        if self.vm_b is not None:
> +            self.vm_b.shutdown()
> +
> +        os.remove(source)
> +
> +    def test_cancel(self):
> +        """
> +        Before commit 53431b9086b28, mirror-top used to not take any
> +        permissions but WRITE and share all permissions.  Because it
> +        is inserted between the source's original parents and the
> +        source, there generally was no parent that would have taken or
> +        unshared any permissions on the source, which means that an
> +        external process could access the image unhindered by locks.
> +        (Unless there was a parent above the protocol node that would
> +        take its own locks, e.g. a format driver.)
> +        This is bad enough, but if the mirror job is then cancelled,
> +        the mirroring VM tries to take back the image, restores the
> +        original permissions taken and unshared, and assumes this must
> +        just work.  But it will not, and so the VM aborts.
> +
> +        Commit 53431b9086b28 made mirror keep the original permissions
> +        and so no other process can "steal" the image.
> +
> +        (Note that you cannot really do the same with the target image
> +        and then completing the job, because the mirror job always
> +        took/unshared the correct permissions on the target.  For
> +        example, it does not share READ_CONSISTENT, which makes it
> +        difficult to let some other qemu process open the image.)
> +        """
> +
> +        result = self.vm.qmp('blockdev-mirror',
> +                             job_id='mirror',
> +                             device='drive0',
> +                             target='null',
> +                             sync='full')
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.vm.event_wait('BLOCK_JOB_READY')
> +
> +        # We want this to fail because the image cannot be locked.
> +        # If it does not fail, continue still and see what happens.

This comment is about vm_b.launch(), not about creating vm object. Probably better to move it down

> +        self.vm_b = iotests.VM(path_suffix='b')
> +        # Must use -blockdev -device so we can use share-rw.
> +        # (And we need share-rw=on because mirror-top was always
> +        # forced to take the WRITE permission so it can write to the
> +        # source image.)
> +        self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
> +        self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
> +        try:
> +            self.vm_b.launch()
> +            print('ERROR: VM B launched successfully, this should not have '
> +                  'happened')

probably iotests.log() is better here.

> +        except qemu.qmp.QMPConnectError:
> +            assert 'Is another process using the image' in self.vm_b.get_log()
> +
> +        result = self.vm.qmp('block-job-cancel',
> +                             device='mirror')
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.vm.event_wait('BLOCK_JOB_COMPLETED')
> +
> +
> +if __name__ == '__main__':
> +    # No metadata format driver supported, because they would for
> +    # example always unshare the WRITE permission.  The raw driver
> +    # just passes through the permissions from the guest device, and
> +    # those are the permissions that we want to test.
> +    iotests.main(supported_fmts=['raw'],
> +                 supported_protocols=['file'])
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms.out b/tests/qemu-iotests/tests/mirror-top-perms.out
> new file mode 100644
> index 0000000000..ae1213e6f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/mirror-top-perms.out
> @@ -0,0 +1,5 @@
> +.
> +----------------------------------------------------------------------
> +Ran 1 tests
> +
> +OK
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

