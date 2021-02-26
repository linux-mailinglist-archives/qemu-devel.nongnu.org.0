Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD0325F42
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:41:51 +0100 (CET)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYh2-0005Wd-Eh
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lFYeb-0004aw-Qh; Fri, 26 Feb 2021 03:39:19 -0500
Received: from mail-eopbgr60104.outbound.protection.outlook.com
 ([40.107.6.104]:50557 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lFYeT-000698-0M; Fri, 26 Feb 2021 03:39:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eypkbN6tZJV/NvaSxAF6uDwqRdgmmUrFRtpXikhrmA62awhpqxKQOVHQmmUafUlpUHD4m/t0o7QEa480p8C8GPZJROkLDcT+TX1W2+e2+ptdIf2fwHcLBvmxXsAfkCmpDzFc2Au3mYlrF7h4cF+v/oT3DCaIpxV7WEarjAiprg5UrIRTuSw6FwjwGtThQ3EQILBzgv0A1UaliLsJQNPlgQngl+oLYhqmK2GU8F63HDUWIDU73LqBrlnetg2Hu8o+aasK03qeS6uaghNPZVBm3VgcxVqW009pHfd41J4Po0RSEa13iMhWSVihvw5/YnUGXqCUDrx1a7ObKTZ9JFSfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpZ0aUfRyobZbz+8qRTCWui2zZcF7Y+w5Rn/9w2LtD0=;
 b=EsmuIdOjY/29ZXirHfyvqdoWii+iCsT93Aibykr9iKj8jRnXoayYCbFb0ryVWXgSo1F48EGKBOfZIkwNUCIRcgP/dcde2P412lfkM+21JOG11EbutJGGjEbVGaZ6JI8VqGKhoGuQsL2z47oNmWT1uB4UDWGRzJVv2Wiwd7zfMFFJOyFPxPPbR8iSYcF4Hza3Vt1PmsrWuLVvQtzboj/b61WlEa4dS4GnmEBxlM29J2QbJOcF+9sD4UTuDufLzduGmvRdFgJHIIWXHGMofQuqRUcCtO2+L9zc/VDrDH3+ulmnOAdwBmx7Jt9OcWqryjsUzkYGzu04gCy1YZNweRWLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpZ0aUfRyobZbz+8qRTCWui2zZcF7Y+w5Rn/9w2LtD0=;
 b=HbKIk0lsc/5P04U0tJP5lx0bSF9x9wkI1WynFTnJvR+FNYrPlPdt/Agmh8fQSEiQQAixmlgpO8Ilcph+qUp31A4melBcSajbHv91Cba/ZhqD8BA5HjqkQj11pSr+mamGwus+IB/3nnALtQUXBtVZtP8VL9lmgLH5uKRKL38VuP0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM5PR0801MB1842.eurprd08.prod.outlook.com (2603:10a6:203:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 08:39:04 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Fri, 26 Feb 2021
 08:39:04 +0000
Subject: Re: [PATCH v2 6/6] iotests: add parallels-read-bitmap test
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-7-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <e4315be5-28b7-b99a-06d7-85dea13289bb@openvz.org>
Date: Fri, 26 Feb 2021 11:39:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224104707.88430-7-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::18) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM0PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:208:3e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.21 via Frontend Transport; Fri, 26 Feb 2021 08:39:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acdbd380-ea4a-46f0-2c80-08d8da31f8f1
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1842BD881B6A3E8EFA499322B69D9@AM5PR0801MB1842.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KiWpQM2xtHhGZX1UMDEdp2byK/4pWZ1VL5plnI1Gr1JkULXDgMxd09EqcbvnmWmC15e2l1KswxDpbZ2/unzAK7dBLFPzG32bTlORsTvJOVsPfOZws8W4VOIihMJD64AWJ+4mg9Un0vv0FIKWgzZTzExlM45PXK9t5dCUEZloXPT15W5MwQCdY0pSEx8scXDQvZHTbriY3AOGrel/Gbg2szhxP4JyOh50L0WnjNmcpJuGiJiWCuoXwRJ35ZpiFIGpUx/zUqkzzXe2uD0LE3Mun/S7MQ1GvL9C7HRuXKugaznFhMQpA3ZkGmwy1gg1RBVggfjgUhYC996Qu8vbMPxf/ih9rUZNfCTl/kyghhpl8Om3Ass+o0BSf5/rXV4tEvT8fqn65qbHr9WcAOvbD5JqazVHY9eQW7KRdbrX8Gxs66JmDXlK8efhna/Zo/Acv7JTvqcpuR3bf19wJudVYdQocHIRy/jNGklbs+3M2zO8VbDEFTKq3M62eJKkEf40+wGSIgChTTmQZbajx22YVP4zR2+5Jy2gL/tevSdx4Xpi2eWgT6MZJAquarxOIDhBHjbmM5x1OsIk5Itb0vWpw8v52pVKeRelr9GKC77tEscTHFsNt1uICSFBcSWGaaBPPUquvx/F2Z8sLRPIk8RjNnfz6jvtBMi/iW2MkHJ2gveEUmclc0vskrAGow2eWX1J1SO/z3UEcCXKXCvXw55VCpP/zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(186003)(52116002)(8936002)(42882007)(31696002)(16526019)(53546011)(31686004)(66476007)(6486002)(26005)(5660300002)(66556008)(66946007)(2906002)(316002)(36756003)(83170400001)(16576012)(2616005)(956004)(478600001)(8676002)(4326008)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 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
 =?utf-8?Q?gU3J7Y1V/etIl7JmMfpv0JSGetgYarsayuSJqCV?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: acdbd380-ea4a-46f0-2c80-08d8da31f8f1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 08:39:04.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BWhOT1mpupew2mloRo37+zluIzdYXxO0cPg3WR0lF3IxLbiRvcFZxOruSs7acu2T6J0w/NtEJWObm0ExSXOgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1842
Received-SPF: pass client-ip=40.107.6.104; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> Test support for reading bitmap from parallels image format.
> parallels-with-bitmap.bz2 is generated on Virtuozzo by
> parallels-with-bitmap.sh
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
>  .../sample_images/parallels-with-bitmap.sh    |  51 ++++++++++++++++
>  .../qemu-iotests/tests/parallels-read-bitmap  |  55 ++++++++++++++++++
>  .../tests/parallels-read-bitmap.out           |   6 ++
>  4 files changed, 112 insertions(+)
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
> index 0000000000..30615aa6bd
> --- /dev/null
> +++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
> @@ -0,0 +1,51 @@
> +#!/bin/bash
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
> index 0000000000..af6b9c5db3
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/parallels-read-bitmap
> @@ -0,0 +1,55 @@
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
Reviewed-by: Denis V. Lunev <den@openvz.org>

