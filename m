Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D517B31FA7B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:19:44 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6dD-00053r-Ue
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lD6aH-0003Vc-DZ; Fri, 19 Feb 2021 09:16:41 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:7265 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lD6aD-0007UC-LU; Fri, 19 Feb 2021 09:16:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kky/K7yRwQ/n25s5eNp2zyfqUuhLTWHiFjJxA8rXQvZXlTzd+meAMJN20G3eedS4c46VKJ3bYhB0MmNd3D5p9SPqxUbOLBXQdvy7i3pdicfJnxzPlRGwO5Mcj3ovzxrDrjikLtRAXJRaTmi90WdBb6k/PWpHvlaOPthZ0SryB4K0dEtO4wYlJLg8mtoSNkWlKIWR64ltKxfBoopPs8mBBITK9wJwdUEa7pHV+0RZFtA7tPEn9rT44UA4QEV0F1BBtTezhEyp7j1S8LTiv5saJKzmP8bpekm6eKoT7Km/Yjgy8IoDEmBIBv4fDlSYXcHs94MAegg8RC/YDvHFEnLecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnpfHGU5JNAVzY/NqFjGMOqX65Ln6N8cRLBF4OQbrcg=;
 b=FgWVNfi3mCzsB/XdIUJRjwVzl4eOxJT3O+RnPHzWwk73BVM4pdlwmTZYxvu93lBvjbvglQw3BtdcYstqDYy/bEc6kh8uCPUbPVHT4BYZrWN+szdYKk0ceMZdaHKkl3N+55jAg3PrASyyCfNWr5molkEPK9CRP1DNUyceWFUMGc1SExknj/a+fjFYgxDkz4dcF4sLaYtcPs7t6COmBjQwM0C4kV27LyzAZdhAfBsgj0UGp0v/RwFIt9Fl7GUcS/XnEFBGLuIc2j5fSMU7wf1d/mTP6ydFza3Bsr/DicDKqx8mwlP4HjrOP6RkZYXG+AtW3QaDlWr4qlcDyRmd7M0yqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnpfHGU5JNAVzY/NqFjGMOqX65Ln6N8cRLBF4OQbrcg=;
 b=ZYN7QEgai2Bo0p3c66RdTBX72KwcoRT2Uje5sdbJjEz0hKC0L8xPmoETPzzUmkhGG8Z96L7plxuZN1McFvtlhtQd1pWwSQd4RjkxATyJoYDBL+uoPcf9BqsTnBeIysguxpwMPB46gZqa+RLYARDT6rMy4ddjdkuxQ4Opktw1T84=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2449.eurprd08.prod.outlook.com (2603:10a6:203:9c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Fri, 19 Feb
 2021 14:16:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Fri, 19 Feb 2021
 14:16:33 +0000
Subject: Re: [PATCH 5/5] iotests: add parallels-read-bitmap test
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-6-vsementsov@virtuozzo.com>
 <af03ac45-7536-6c1c-2b3d-98412733b157@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <90933c08-cdf2-1b0f-7241-c6712fc23040@virtuozzo.com>
Date: Fri, 19 Feb 2021 17:16:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <af03ac45-7536-6c1c-2b3d-98412733b157@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.229]
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.229) by
 FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.9 via Frontend Transport; Fri, 19 Feb 2021 14:16:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76644de-bb05-4f3f-cf49-08d8d4e0f590
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2449:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB244934B5426D4B92E4D1BAACC1849@AM5PR0802MB2449.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E54cREIGbDGsA13nEqGCfxiihUX+QdU7c13kR5SYSPLEU2YZz0gCa+btzC9Fr3dTYSVgrdGIL7bx+BobZD9e8hW0Ik3hD/Aow3cUHKrhVu4oJVK04Gp+pqJuRgRucWADCNATKdvYKCks40clDvZ/hHd2vwWKNx4Fd4UAFM+Op8NMMWxEphHcabo3MkGqCOSrB4nySZyaTIHqQzF96lvp4E9DUem6jUn+EruLBDMDFzRVZ2ExVoVvHqGogxACwmt1u+uvJgFnWXz/kq3iW1wisMi7RYbYFkHED0FEDOuXH35TWJR+Bhm1Jgk/MX6R/rblAzI9oHF96Rd4ZKrdDos0OCqcb35WS4dLGRgSMDxkF8HnlYC4wyfLz/lPFdKBaswwJ/KVe7Tyr9YO+dLoxeTvcIf4LatVgJC19Iizasijngus1LRuZd07kGtlRlENm7OZUGIOz29Wa48ZVo6KHBe599MM20m6qRWaXlK05OGAqNuwBqJF8c9MbsQokidWbbXYYq5ByHnhFzJTWKj0F5Tvwcd7+PYowWM4uUVc1TPxl4fBPWWCTG+DCfHkv5BnbIVWerw0I++HB4Mv07zg5RplqC8P+mhgIthdMuqkB5YqjLw6wHqlGe9egSVKVXux8b4gBs6+oE9D0gAbx6HYj4rHdcAln1+ZDoDgYJlOQ8zCzcJnDy0DHMxhsTZedNUZ3dIeqiSAE6mrdNhCXdaDTiTcdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39840400004)(366004)(4326008)(8936002)(5660300002)(52116002)(956004)(83380400001)(316002)(2616005)(6486002)(53546011)(16526019)(186003)(31686004)(66946007)(66476007)(2906002)(26005)(8676002)(86362001)(478600001)(16576012)(31696002)(36756003)(66556008)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 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/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76644de-bb05-4f3f-cf49-08d8d4e0f590
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 14:16:33.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdnNR4OsyL0MxijQPDuMcfZ+ODYgOLFvYTwABELIXCSGgeyhSpLZxW2Yp3Mjt+hUDQAsZE0MBjyzB0N9KbddVwfeYvsK8eVgbIyCWtN3IsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2449
Received-SPF: pass client-ip=40.107.21.137;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.02.2021 14:56, Denis V. Lunev wrote:
> On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Test support for reading bitmap from parallels image format.
>> parallels-with-bitmap.bz2 is generated on Virtuozzo by
>> parallels-with-bitmap.sh
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
>>   .../sample_images/parallels-with-bitmap.sh    |  33 ++++++++++
>>   .../qemu-iotests/tests/parallels-read-bitmap  |  57 ++++++++++++++++++
>>   .../tests/parallels-read-bitmap.out           |   6 ++
>>   4 files changed, 96 insertions(+)
>>   create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
>>   create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
>>   create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
>>   create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out
>>
>> diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2 b/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..54892fd4d01bf743d395bd4f3d896494146ab5a9
>> GIT binary patch
>> literal 203
>> zcmV;+05tzXT4*^jL0KkKS@=;0bpT+Hf7|^?Km<xfFyKQJ7=Y^F-%vt;00~Ysa6|-=
>> zk&7Szk`SoS002EkfMftPG<ipnsiCK}K_sNmm}me3FiZr%Oaf_u5F8kD;mB_~cxD-r
>> z5P$(X{&Tq5C`<xK02D?NNdN+t$~z$m00O|zFh^ynq*yaCtkn+NZzWom<#OEoF`?zb
>> zv(i3x^K~wt!aLPcRBP+PckUsIh6*LgjYSh0`}#7hMC9NR5D)+W0d&8Mxgwk>NPH-R
>> Fx`3oHQ9u9y
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
>> new file mode 100755
>> index 0000000000..e4a1d71277
>> --- /dev/null
>> +++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
>> @@ -0,0 +1,33 @@
> do we need Copyright notice here?

Will add

> I am unsure that this script is to be
> acceptable in QEMU repo. Anyway, it looks fine :)

Yes, it requires some proprietary tools, not available for most of developers..
On the other hand, I should document somehow, how did I create the image
(at least for future me). I can do it in a commit message, but I think better
is just add a script, it will not hurt.

> 
> 
>> +#!/bin/bash
>> +
>> +CT=parallels-with-bitmap-ct
>> +DIR=$PWD/parallels-with-bitmap-dir
>> +IMG=$DIR/root.hds
>> +XML=$DIR/DiskDescriptor.xml
>> +TARGET=parallels-with-bitmap.bz2
>> +
>> +rm -rf $DIR
>> +
>> +prlctl create $CT --vmtype ct
>> +prlctl set $CT --device-add hdd --image $DIR --recreate --size 2G
>> +
>> +# cleanup the image
>> +qemu-img create -f parallels $IMG 64G
>> +
>> +# create bitmap
>> +prlctl backup $CT
>> +
>> +prlctl set $CT --device-del hdd1
>> +prlctl destroy $CT
>> +
>> +dev=$(ploop mount $XML | sed -n 's/^Adding delta dev=\(\/dev\/ploop[0-9]\+\).*/\1/p')
>> +dd if=/dev/zero of=$dev bs=64K seek=5 count=2 oflag=direct
>> +dd if=/dev/zero of=$dev bs=64K seek=30 count=1 oflag=direct
>> +dd if=/dev/zero of=$dev bs=64K seek=10 count=3 oflag=direct
>> +ploop umount $XML  # bitmap name will be in the output
>> +
>> +bzip2 -z $IMG
>> +
>> +mv $IMG.bz2 $TARGET
>> +
>> +rm -rf $DIR
>> diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap b/tests/qemu-iotests/tests/parallels-read-bitmap
>> new file mode 100755
>> index 0000000000..b50b79f509
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/parallels-read-bitmap
>> @@ -0,0 +1,57 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Test parallels load bitmap
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
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import json
>> +import iotests
>> +from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path
>> +
>> +iotests.script_initialize(supported_fmts=['parallels'])
>> +
>> +nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
>> +disk = iotests.file_path('disk')
>> +bitmap = 'e4f2eed0-37fe-4539-b50b-85d2e7fd235f'
>> +nbd_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}' \
>> +        f',x-dirty-bitmap=qemu:dirty-bitmap:{bitmap}'
>> +
>> +
>> +iotests.unarchive_sample_image('parallels-with-bitmap', disk)
>> +
>> +iotests.unarchive_sample_image('parallels-with-bitmap', '/work/mega')
> no-no-no, '/work/mega' is absolutely no way
> 

Oops)

> 
>> +
>> +
>> +with qemu_nbd_popen('--read-only', f'--socket={nbd_sock}',
>> +                    f'--bitmap={bitmap}', '-f', iotests.imgfmt, disk):
>> +    out = qemu_img_pipe('map', '--output=json', '--image-opts', nbd_opts)
>> +    chunks = json.loads(out)
>> +    cluster = 64 * 1024
>> +
>> +    log('dirty clusters (cluster size is 64K):')
>> +    for c in chunks:
>> +        assert c['start'] % cluster == 0
>> +        assert c['length'] % cluster == 0
>> +        if c['data']:
>> +            continue
>> +
>> +        a = c['start'] // cluster
>> +        b = (c['start'] + c['length']) // cluster
>> +        if b - a > 1:
>> +            log(f'{a}-{b-1}')
>> +        else:
>> +            log(a)
>> diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap.out b/tests/qemu-iotests/tests/parallels-read-bitmap.out
>> new file mode 100644
>> index 0000000000..e8f6bc9e96
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/parallels-read-bitmap.out
>> @@ -0,0 +1,6 @@
>> +Start NBD server
>> +dirty clusters (cluster size is 64K):
>> +5-6
>> +10-12
>> +30
>> +Kill NBD server
> 


-- 
Best regards,
Vladimir

