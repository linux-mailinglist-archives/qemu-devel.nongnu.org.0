Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC4589EB3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:31:01 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcoO-0007Gw-IW
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcmT-0005YB-Cl
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:29:01 -0400
Received: from mail-am6eur05on2139.outbound.protection.outlook.com
 ([40.107.22.139]:30625 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcmO-00080W-Aj
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:28:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDtf+TEiV710xeFY0y6Acq1Q2kbUNLL9natoF6H2tQgnsg30pswReZu5bTQdLoFwrnUMHyeM3DsKwiKI4JFfC1sIaE3DxFRavpU3JOMuKWYBA3Ke+FdJ5oqRyrjQHMr1Irg+DLKIYP89KR9TZxyHwqsp5Q2Hea2N9kdQxUtqWe1dyfo2lh3CVvcl35+c6n3LbNuAR2VRJVwYyY+hQy1w1SFdr7BlIq8YZJqtrAECLKR+VdhIUPtuyCS/dc69n7jyprMbCgBwmLvLedqS2uMXnvONc//EjOfF+9nTWcSN7bWhyeuCgZc+gLn4F887PBYtooi4U8sL0SR94pQxXm3f0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F65u/cXUThfHMcQt+OqV2hOqWjPmCUdelLoUuUljPLI=;
 b=LDGadMiGqb+ANqLzo4+IpWqR9v5EffhT+L0RIf1h2CMvR//z2QrZJpZoRt2AtH2pAI+D7EW94L9ULJcAjA9fCu9eB0eytwX7is5hKQLGffAQEvEshuclou4aWYVKaFlPkL8CxlTng9D2f/LS9/e9ctn/ecvzUjcISJhyRVPx+iZyCxmkIeyqfZklw+tSf7FJhuPZGnKO6TfwKJsU0ochKGTIUX+klObTl31CNGZSlapZeCsbCuxc00F/+QxLlsYd131ISxSEYlp70mqi9TbSibZ7VFROU6Ylr4c8zufBxwFv7E8f/iRMhThvYRBKiFBo5V/4xpkKD9DjjafGq2tGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F65u/cXUThfHMcQt+OqV2hOqWjPmCUdelLoUuUljPLI=;
 b=EuMeXbbzIosjoh89oNmvSCgkbRLOwkIUK+XVwvtHN8LQ62AuvSIUJaROyBsf4uVtUuadwduV8lnWA/VppeclRCt6xQDgyCVICZkoNJsjZ0lRGbnkKhUcE4snYllFe5LejYHWYdr0kjmlE/s58vj49SRqhID6ZOIxz18UFTDsjs9edjhE269A25A4ML4/NrxeuPd7y1Hgm7hXicuE+xhWhD++6nOjo6y45hD6jEiUeitcx33ILXYFtEQFcPs90BjDVMYD+iSrHTbQgD/fPyi9dW+VpqTHG7MBB1e2UemJmvUXgT/QTMDpgmgSwjEqOL2tgzvPyARvzatCNk7kobXExg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB7PR08MB3756.eurprd08.prod.outlook.com (2603:10a6:10:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.13; Thu, 4 Aug
 2022 15:28:51 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:28:51 +0000
Message-ID: <092311df-ea6c-2e44-6600-3e1f45420e54@virtuozzo.com>
Date: Thu, 4 Aug 2022 17:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] iotests, parallels: Add a test for duplicated clusters
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
 <20220804145200.564072-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220804145200.564072-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0060.eurprd09.prod.outlook.com
 (2603:10a6:802:1::49) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f80d002-ea63-4d00-a61c-08da762e08e5
X-MS-TrafficTypeDiagnostic: DB7PR08MB3756:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecMBr97oOwKB8Z8xNL3oqD1FlIIJEtwpw16LnIIUUq3Dq+uNlbic9f3BpElv8I8Ll71O6t+ajuZeItcEoqe1KoOgl1vc9uM6n3GCLfmUe5gQVkMVBm08Fty8NdbJLwyHhFVuikBUu3fj3xs2I9bQwSZgHIsrITMI+UtLosvXX/H6FsYLq+0v/cyqBvMNh82dQeY3VzXdo5oOYIIWi1pakULFiu6qrMtmrjDKypEmHHBKI0a0ZrIS6pFxddUHUfD+XVNj2nmIdZpXZ6cIGi6mPVmIY0Fe92PTSPxkzwOehSI/Qcl6uQ3pSAkdkt3pdltqrIILVBTnah8DN8q3c2wQEkYJMI3p4fxitvCtthqyzsx5ZE0LGiMUjvS52EO8Fn0h37pN0zwZBUp80K1Dq8yjAzmGTHde3LxC09Ms8V3+NCNL533CPZpoLKVVxV/lWt9tkEZarpZ3btn7DNJWvPQYFoIxiGNoPCCQlWbMsfZxF8I+FthhFWSnUFXpIlgHw9hy8rLPBuaqft5IRXBzGoGWfmXCV1OekbpHdFtvll6gmJK2Kbxuq5v98kW7HoNoQVRbdLC5BloqkUlkH+V5EFc6iUnz84RU2RgOsso2ueoBWgge7maM4+5Y7+Rd+Vh9L5PLDkWjMy1i5j0/yMUivtqPyOgZ0K0M8nPOOLz3gldxOMYHTvZO4uufEqVkWH0nXdTufb+6cfgPeGJjIeUb0p06WvhJxeQzrSL9sCCNRn840pQS9lgPCmP37mvPiHApHmtlfE8Lr/rkY92VIg+F2VAgnwweg2cXd+mb4nonj6SbnYM0YNQy8L3e1TDTJL1x4G95vgMNM4GCkm3HJPDpp2CcTtiQ9RI85JHZW92jTsIm42tJA1iiNdQqScLU6ldNMr5cZ3gvYIxe1TvH4hbskFiKf88zYVQMrf3O56sgTppD6wY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(38350700002)(38100700002)(6486002)(6506007)(26005)(52116002)(6512007)(478600001)(66476007)(53546011)(66556008)(41300700001)(86362001)(31696002)(2906002)(5660300002)(8676002)(36756003)(8936002)(83380400001)(31686004)(316002)(2616005)(186003)(66946007)(2004002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?Q?6TGiqdqbLBwA1GyUCB/rJWNzA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f80d002-ea63-4d00-a61c-08da762e08e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:28:51.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsYqzDtg+5T47278G6qX4GX5qRd7yKWJXXy9fkwjli1nNfmsQ2q7vG8z1YeglrOF0bZYoHlQWCuTQ7u/Lf6JJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3756
Received-SPF: pass client-ip=40.107.22.139; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 04.08.2022 16:52, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
> Check if original and duplicated offsets refer to the same cluster.
> Repair the image and check that writing to a referred cluster
> doesn't affects another referred cluster.
>
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   tests/qemu-iotests/314                        |  88 ++++++++++++++++++
>   tests/qemu-iotests/314.out                    |  36 +++++++
>   .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
>   3 files changed, 124 insertions(+)
>   create mode 100755 tests/qemu-iotests/314
>   create mode 100644 tests/qemu-iotests/314.out
>   create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
>
> diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
> new file mode 100755
> index 0000000000..fdf47f86d4
> --- /dev/null
> +++ b/tests/qemu-iotests/314
> @@ -0,0 +1,88 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick
> +#
> +# Test qemu-img check on duplicated clusters
for parallels format

> +#
> +# Copyright (C) 2009 Red Hat, Inc.
Copyright (c) 2022 Virtuozzo International GmbH


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
> +# creator
> +owner=natalia.kuzmina@openvz.org
should be either you or me as a maintener, not Natalia

I believe that we should create a place-holder for more upcoming repair 
tests,
we will add more and more. They are better to cover more and more cases.

> +
> +seq=`basename $0`
> +echo "QA output created by $seq"
> +
> +status=1    # failure is the default!
> +
> +_cleanup()
> +{
> +    _cleanup_test_img
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +. ./common.rc
> +. ./common.filter
> +. ./common.pattern
> +
> +_supported_fmt parallels
> +_supported_proto file
> +_supported_os Linux
> +
> +echo
> +echo "using sample corrupted image"
> +echo
> +_use_sample_img parallels-2-duplicated-cluster.bz2
> +
> +CLUSTER_SIZE=65536
> +
> +#read one cluster from original offset
> +$QEMU_IO -c "read -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read from duplicated offset (data must be the same as on original offset)
> +$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#change data from original offset
> +$QEMU_IO -c "write -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read from duplicated offset (data must be the same as on original offset)
> +$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +echo
> +echo "check and repair the image"
> +echo
> +_check_test_img -r all
> +echo
> +
> +#read one cluster from original offset
> +$QEMU_IO -c "read -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read copied data from new offset
> +$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#change data from original offset
> +$QEMU_IO -c "write -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read from new offset (fail, now this data was left unchanged)
> +$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +
> +echo
> +echo
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=0
> diff --git a/tests/qemu-iotests/314.out b/tests/qemu-iotests/314.out
> new file mode 100644
> index 0000000000..c36022c407
> --- /dev/null
> +++ b/tests/qemu-iotests/314.out
> @@ -0,0 +1,36 @@
> +QA output created by 314
> +
> +using sample corrupted image
> +
> +read 65536/65536 bytes at offset 0
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 65536/65536 bytes at offset 262144
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +wrote 65536/65536 bytes at offset 0
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 65536/65536 bytes at offset 262144
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +check and repair the image
> +
> +Repairing BAT offset in entry 4 duplicates offset in entry 0
> +The following inconsistencies were found and repaired:
> +
> +    0 leaked clusters
> +    1 corruptions
> +
> +Double checking the fixed image now...
> +No errors were found on the image.
> +
> +read 65536/65536 bytes at offset 0
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 65536/65536 bytes at offset 262144
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +wrote 65536/65536 bytes at offset 0
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +Pattern verification failed at offset 262144, 65536 bytes
> +read 65536/65536 bytes at offset 262144
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +
> +*** done
> diff --git a/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2 b/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee8f0149b5ecffc4fdc5e2c0cf45b731610378af
> GIT binary patch
> literal 148
> zcmZ>Y%CIzaj8qGboOfsS0tPO%`U`(O5*Pv)I2hO&I2yDPt~od`068263_Exd7-leV
> zwiz(^Ft8k0sa3TsBZG0}Vv}35zt?O%VET5A+3Q2o4%bdpm~pLC^&`WR2CW6$VGH;&
> vm{u|@;OhXBE0|U>d|v){U)AOQJ)h70iu-<&;S?CYW~db}a<vGU0CEKYoE$uo
>
> literal 0
> HcmV?d00001
>

