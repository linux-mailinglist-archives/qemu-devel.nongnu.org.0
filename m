Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9C31F8B7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:59:52 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Rr-0001cq-OO
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lD4Or-0007De-Cy; Fri, 19 Feb 2021 06:56:45 -0500
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:59108 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lD4On-0007Uu-EI; Fri, 19 Feb 2021 06:56:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul1SoObDEYjMxkBZ09pWYkvtgWQ49ZUVPsgbqPvbrnQx7f3N+YCDhmzraSjnSPen1sY7rCIgd44pt6wWFp7VMR4cfPixZiP80gSO0eOUZDNtx7IMpD56N6T4+FdPZ2cKoeAzyM/Hb8JycgPAa/xGP7LUkN5S5EQqFMNfV8jBOakxl25OIFA+Jjstcp4QRMbBihRxzFs232Oyg9lbKqjiTCRod4xfFBVPg9FWb4Ht6wIIzjpSIyDAQ5MjIdVHdAV944EQ9PnSNgkPSRTdkEAe9UtVh0YvHhFXE94cbzvTy8hBQJCEDpj2XOqEQ1M7zCvxIYh4xmuDZ4LiZ+Qk1Ct8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaskJ1AMrWKpe24uaRwjg33I78Q2wTIhv0MxsSOXQU=;
 b=j33zpN1VypDyLmKRICiInifyfYTrUHIkmd2Z9qxRipFdjlw+7/bIt4AjHEL1jkdk4y/sE4HEfhDqMfH0Ep9uFDFLUrbTuOu6HpuUoOb+0g1PPzZeXYGw5dBFAFmah/X2J+8WUtxjONBhsaGCKum2jPPYFxzUlIQ4rO2n/QyzqFS47BbtXPIZg4/0SL8W1csGv1BOFYatxLsFmXjUV+xwr2obe8XiKqPpE7o++9x+Isow21Ai9eyYRQIYP3AnTkhPJQZN2gjsx9nAHtYofSPLDOH1+0JmIjpXTNk0ghMBuFObYidfY9M1iet8ZfQeJYNanfYgbSoExJEwh+15ugtjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaskJ1AMrWKpe24uaRwjg33I78Q2wTIhv0MxsSOXQU=;
 b=bDBnbiljFzyv4nthbojhpR/nZZsBE/Ii4RgeoAci6PpYk7R8/9UfA/479xfzHW0MS5lIXvFabgWrlxa9M1eQVRmkGZgmzjYbhUEWS8zg39OWxMhuCd2iLFsoOf1JXVtAbQKIWyDULtHbjXfFqXfY1CO8omYgs1VWM8e2cceZarE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 19 Feb
 2021 11:56:37 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3846.041; Fri, 19 Feb 2021
 11:56:37 +0000
Subject: Re: [PATCH 5/5] iotests: add parallels-read-bitmap test
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-6-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <af03ac45-7536-6c1c-2b3d-98412733b157@openvz.org>
Date: Fri, 19 Feb 2021 14:56:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210216164527.37745-6-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM4PR0302CA0020.eurprd03.prod.outlook.com
 (2603:10a6:205:2::33) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Fri, 19 Feb 2021 11:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a82b5e47-b256-4a84-f12c-08d8d4cd6939
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB599060E10AEB077A66726BC3B6849@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94PyqIzYsex83Ei3bBemaODi1fPIPpNnnILnUQHqeN7OaHbL28m/yU0gL+npz2jhf8zETQUcNia8qDlx1Oa5JfTI/RqJp33G2x69/Ba6nGOyuj0y00QhfglwNKSwPOibipQJotzYmXriWaeKWlBo//BIBxP3iWlanNOl69wJYFnUq9k9dROKjZkvC7cE/ChfWUEKZVSE0xyvM1Fv1HmDnH/n/r6LTQ1MGjLaJtk2kyNz19JL/QB2Qz5pa0vK3Rw/DgsQFfIlfT0DZ6LWlp4CPnF7Ky6hCiKbpiwiGkyYCFYA8f0r8AGVNv+tOGBGmz2sCJNbB/SpWmLnqhjuamXke5Z2emFoYSrS21SwAN5nM6yfDmV0OTjI3wYCE2UEm8wg2k1OcqFUizHRieYmRB/9o2lLgAB9eTdBxqtCig8k3/9PicGotvLdc8OijPJ67TM1g2Z3VCKvRaZSFgEVf1gk7Vl2y2R/s2DggEYIWmicZkyo9d8oNrYjxLBbuwzg/xU5ZGziHbLIS6kKXWVu1bWOzg4zepHKwsF0bOapCWzQ7eOl08XxTs1fThohuAyYjsl7/1r0gqNsQ00LAM6kmYtpBqWK9Bcm5KLDkYjzS0xWmYw2Fv983/2W9UaJxMK19lNX/YJWeOtPKrUnn/ZuqVJ6qJV3yHhRYEDSQHymtX9RIFXf3+cT2fxquN/taJvd3RLP3JHH2q5K/IuFrtyYaPfl0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(366004)(4326008)(16526019)(36756003)(2906002)(186003)(52116002)(2616005)(8936002)(66556008)(316002)(5660300002)(83380400001)(16576012)(53546011)(42882007)(83170400001)(66476007)(6486002)(26005)(66946007)(31696002)(956004)(478600001)(31686004)(8676002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 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
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: a82b5e47-b256-4a84-f12c-08d8d4cd6939
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 11:56:37.3303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CLU20YszyHqU5JrkYu5t/wJ11DalUyqbNfR2MCWPjL+74MkKhx/tdDsOit1nxSAfIj9feBNwkGVZQALfFfcTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.0.91; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
> Test support for reading bitmap from parallels image format.
> parallels-with-bitmap.bz2 is generated on Virtuozzo by
> parallels-with-bitmap.sh
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
>  .../sample_images/parallels-with-bitmap.sh    |  33 ++++++++++
>  .../qemu-iotests/tests/parallels-read-bitmap  |  57 ++++++++++++++++++
>  .../tests/parallels-read-bitmap.out           |   6 ++
>  4 files changed, 96 insertions(+)
>  create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
>  create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
>  create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
>  create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out
>
> diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2 b/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
> new file mode 100644
> index 0000000000000000000000000000000000000000..54892fd4d01bf743d395bd4f3d896494146ab5a9
> GIT binary patch
> literal 203
> zcmV;+05tzXT4*^jL0KkKS@=;0bpT+Hf7|^?Km<xfFyKQJ7=Y^F-%vt;00~Ysa6|-=
> zk&7Szk`SoS002EkfMftPG<ipnsiCK}K_sNmm}me3FiZr%Oaf_u5F8kD;mB_~cxD-r
> z5P$(X{&Tq5C`<xK02D?NNdN+t$~z$m00O|zFh^ynq*yaCtkn+NZzWom<#OEoF`?zb
> zv(i3x^K~wt!aLPcRBP+PckUsIh6*LgjYSh0`}#7hMC9NR5D)+W0d&8Mxgwk>NPH-R
> Fx`3oHQ9u9y
>
> literal 0
> HcmV?d00001
>
> diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
> new file mode 100755
> index 0000000000..e4a1d71277
> --- /dev/null
> +++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
> @@ -0,0 +1,33 @@
do we need Copyright notice here? I am unsure that this script is to be
acceptable in QEMU repo. Anyway, it looks fine :)


> +#!/bin/bash
> +
> +CT=parallels-with-bitmap-ct
> +DIR=$PWD/parallels-with-bitmap-dir
> +IMG=$DIR/root.hds
> +XML=$DIR/DiskDescriptor.xml
> +TARGET=parallels-with-bitmap.bz2
> +
> +rm -rf $DIR
> +
> +prlctl create $CT --vmtype ct
> +prlctl set $CT --device-add hdd --image $DIR --recreate --size 2G
> +
> +# cleanup the image
> +qemu-img create -f parallels $IMG 64G
> +
> +# create bitmap
> +prlctl backup $CT
> +
> +prlctl set $CT --device-del hdd1
> +prlctl destroy $CT
> +
> +dev=$(ploop mount $XML | sed -n 's/^Adding delta dev=\(\/dev\/ploop[0-9]\+\).*/\1/p')
> +dd if=/dev/zero of=$dev bs=64K seek=5 count=2 oflag=direct
> +dd if=/dev/zero of=$dev bs=64K seek=30 count=1 oflag=direct
> +dd if=/dev/zero of=$dev bs=64K seek=10 count=3 oflag=direct
> +ploop umount $XML  # bitmap name will be in the output
> +
> +bzip2 -z $IMG
> +
> +mv $IMG.bz2 $TARGET
> +
> +rm -rf $DIR
> diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap b/tests/qemu-iotests/tests/parallels-read-bitmap
> new file mode 100755
> index 0000000000..b50b79f509
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/parallels-read-bitmap
> @@ -0,0 +1,57 @@
> +#!/usr/bin/env python3
> +#
> +# Test parallels load bitmap
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
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
> +import json
> +import iotests
> +from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path
> +
> +iotests.script_initialize(supported_fmts=['parallels'])
> +
> +nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
> +disk = iotests.file_path('disk')
> +bitmap = 'e4f2eed0-37fe-4539-b50b-85d2e7fd235f'
> +nbd_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}' \
> +        f',x-dirty-bitmap=qemu:dirty-bitmap:{bitmap}'
> +
> +
> +iotests.unarchive_sample_image('parallels-with-bitmap', disk)
> +
> +iotests.unarchive_sample_image('parallels-with-bitmap', '/work/mega')
no-no-no, '/work/mega' is absolutely no way


> +
> +
> +with qemu_nbd_popen('--read-only', f'--socket={nbd_sock}',
> +                    f'--bitmap={bitmap}', '-f', iotests.imgfmt, disk):
> +    out = qemu_img_pipe('map', '--output=json', '--image-opts', nbd_opts)
> +    chunks = json.loads(out)
> +    cluster = 64 * 1024
> +
> +    log('dirty clusters (cluster size is 64K):')
> +    for c in chunks:
> +        assert c['start'] % cluster == 0
> +        assert c['length'] % cluster == 0
> +        if c['data']:
> +            continue
> +
> +        a = c['start'] // cluster
> +        b = (c['start'] + c['length']) // cluster
> +        if b - a > 1:
> +            log(f'{a}-{b-1}')
> +        else:
> +            log(a)
> diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap.out b/tests/qemu-iotests/tests/parallels-read-bitmap.out
> new file mode 100644
> index 0000000000..e8f6bc9e96
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/parallels-read-bitmap.out
> @@ -0,0 +1,6 @@
> +Start NBD server
> +dirty clusters (cluster size is 64K):
> +5-6
> +10-12
> +30
> +Kill NBD server


