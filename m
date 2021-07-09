Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1E3C1F63
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:36:08 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1k7K-0006yD-3t
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1k5L-00068b-Fn; Fri, 09 Jul 2021 02:34:03 -0400
Received: from mail-eopbgr70138.outbound.protection.outlook.com
 ([40.107.7.138]:7553 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1k5F-0003yy-P8; Fri, 09 Jul 2021 02:34:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQL7heQv5/QwmIlhzuJ5uraDxhDwSIlITmBMcfWy2r7eWOh2QM1zsHjKaJtqppNysm1gNIwsjrrss40WzC8yhvhnUGKk1vI4Ok+dlYQh4Twew+S+bf1yqCBkmAuUMVumqpp36ti34DQBSmo6lQagcRxETMBlFIFun0duqA+x1lcTkst1n6AfyvUeOJjMWUB2HRe9x3zDj52+V1DF51tVzSZx/+Nnn+VVoutIlJTf4JxuWVufZ5z1tq9Wg4qNpzSl4yTULaCPzeCU114ThmH/uwvLPPN2qA33nyZjHPgPUe0C5K+k+ooMmDy59ShtAsVXlWwxwsbUa3z7i3UA3xhuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciVee93x1BInb4Kq54VOxR+TRBpi7kTaBir3Jo1OGcc=;
 b=CPAuswsNNVCdmxiJQk0Py9n8E50fNgi6XjEZdlqxrIET4lFYjWq67HSW6jJopWY4ZSGK/LhMIF8woT0khijXzJlV2HU9sik4kCMWS8L3Tqv4BezpCYlKz4M1qUnVtZugTM1EbfpX6glJNMKrZUmFUEUvWx571ybxTWL79htBz4xSk+1uOFrg41+ufLDxxf9H591/N1m8Xh9yWYwcgnwOdyvtetb+bFO8wdOj6Lesb3l0G5HtLKMuQBnw2p3egOMkihg0cshyi/JBLfTldj6PDmtNgTLL91bji4fKuQXTQkbGrDEDYb82Bsj5NaoSxBwvUhGKGUoWKzVZnXXz2FWYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciVee93x1BInb4Kq54VOxR+TRBpi7kTaBir3Jo1OGcc=;
 b=bJ440/aS1pLt7dSl7kZm9CXh6aQOudi68PQc8umcajYGcG728AMXuVmXzBRoGkxOM/w9Z10VS6HhTJ09XFGS+ww7L232FemkkjKwtgKx0sMIqmCJOFzUgSMX4/YZDSZTT160aFLjRiBaAt3gSwCSHNmH8N3T5hxndIDSkSvrshM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3574.eurprd08.prod.outlook.com (2603:10a6:20b:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 9 Jul
 2021 06:33:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 06:33:53 +0000
Subject: Re: [PATCH 1/2] iotests: Improve and rename test 291 to
 qemu-img-bitmap
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nsoffer@redhat.com, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210708013001.2576991-1-eblake@redhat.com>
 <20210708013001.2576991-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0abfb3e1-7075-39f6-16c9-3690377c2d56@virtuozzo.com>
Date: Fri, 9 Jul 2021 09:33:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708013001.2576991-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:7:16::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR06CA0139.eurprd06.prod.outlook.com (2603:10a6:7:16::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 06:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 428aa016-9c4c-4a28-bd05-08d942a3851a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3574:
X-Microsoft-Antispam-PRVS: <AM6PR08MB357424956BDA9D21A31302BEC1189@AM6PR08MB3574.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blz/VuZyI6ELeCAmfDAF12sP/mxsFb4Bl/3TePscIBUYfD1yKZHicS7dXUSBfABE+YC/UYN21j1icqeewBgsqMSmRWgbZKIJxaR+XUIcFa9CX3v+kJ98a3egHDpvo+qD/6OWAe8pXnfpep9wYBbT3U7LKuakSni5tWyR8CtCUiO7kO7AWOp9DuMPPHu5Isx9p3RpWBAtjKpH5BDcSXF2gDPO/P/+TjK8f4iHBomvpVmfS8iJwRvQKcUii9DwYbUY0ScZmi/2y9p3MzEGtHOVFWASroZCQJP2vYFBQPulfpk9szPqVfdU0x6R++qxmffnWiLGNH5AaFfuYRGWH5HgLwNFnG4tqP9v2LNSRqBs3gVVIZ5wZ2H0Fb+ouXRe5JbsCtRbS46X8zBG/D0ZV4k3vRR8iks604DI3wsYEu2oVuS566y8abRgp0k4CHojeiKX7eXHEkc7MLw5QueTd+Jh1QHIVJxApkHNRuD+Fe/IEPG5t/PewRhdnV8MBVWdFWKrvC/Z1eX5C8V7OSGUH7cKyWmenb+dLMoouVQZJ92w1QUUT/Q5Ae7JU2rR8h80dqHwXWVU/FRdX9XNw+tYJBXs05EDoeF9CAP07TChD173t7h9hMTxcoK42LchfBPUFMchPKaOAlwpBE3gfRfRRdnOM8PoGjUdkbT6pTBzd62+mz94Tfd8bZEjqVOWVid0BK3uY2HZjpWuhiq8rzaOFA5TWsIiveIY7j3NjhbnZq+AGnTp7jX5/eizuSf3Wp8wLpOFH97hD52Zgh0+xUkjpgFxnaXwSNncNd6yCi6/GCcKly8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39830400003)(396003)(2906002)(316002)(186003)(6486002)(16576012)(478600001)(31686004)(8676002)(83380400001)(66946007)(5660300002)(956004)(4326008)(2616005)(86362001)(31696002)(36756003)(66556008)(52116002)(38100700002)(66476007)(8936002)(54906003)(26005)(38350700002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRHcVlDVVIrUHJXbzYxV0V3TDdPcCtJSUZGYzZUZXR1UEhIRm5VZVhHOTlo?=
 =?utf-8?B?Y0t3V2UwZ2dKc2U1Vk84TjhsSEZmQjUwMVNEVVZNUTh2S1BOY2ZuRFdvRHoy?=
 =?utf-8?B?aFpTNUtjT29FWkdHbXhENFVCeGN4Tkk4MXBKbFFNL2JJeG0wMk14VkFrU2dh?=
 =?utf-8?B?SGYrWmdhcE5KWklkbEpycmtPZFMyTjE1bzZWUGhxRk95SW5uOXdvU1F0U2tF?=
 =?utf-8?B?Z2d3citaOUtsb1B2d1d0MXZ3V2hlSDMvWjhPb0xDcjhCOFhFbSs0ZEZvNkd0?=
 =?utf-8?B?NzNCZTVtb1E1NldnUkJLaktSWmNmaVR6NVREck8yNTJBNmMwUWxUUy80RGN2?=
 =?utf-8?B?YmZwOVh3SnVoR2o0a3pzdEJtejFxUGFUTjdPdGs4Nk9ObWRQbXdGTEZocU1j?=
 =?utf-8?B?QjdsNDRiTjg4dDg1U0NTd3REK3BGNllSSzJKWkFNbmdCbXlNaGswNFJjejhh?=
 =?utf-8?B?Z1hnVmhsVUFxbzdvWmsxUDJ5TXg5OUZ1Mlp5UnlrUXhPMFU1TXZ5ejdyK0c2?=
 =?utf-8?B?QWVnTjhDVlQ1dGdjaGJRZjY1anJxNWk5M1VuTXZxd2NyWWRLR1I3cndVMGV0?=
 =?utf-8?B?eG1FKzdyWU5ZQmlvNFdnZHNacHpaWjFUbFZvYm5kRHBVenZMaFBSWjQ5UFlk?=
 =?utf-8?B?cXFjbmczZGErdCtGUnBiTyszY01mQVZvSm5hdDA1dFU1M2lRdTF6N0lSZW1t?=
 =?utf-8?B?andNR3RFMFZ0Szg5S3lVQXo5NmRsQmcrNnRzMUV6cXZ3aDA0Vjd5dUhhSzlC?=
 =?utf-8?B?R05EaUNUcGlIbkltcm5YSDZNV2N1NGIwd29uQkVWTDNGZEpZckJwWWVDOVQ5?=
 =?utf-8?B?OEtWdklCVUxrYkEyV0RiRXIybElqaitmNm9RWkdDNFVTQ0EyN1grTDZoMTBD?=
 =?utf-8?B?L1laMk5PNDkwRW9MVS9Tb1NnZitXVlZSd0VTT2ZEbmY2ZGJwdTRrZHdlRkNl?=
 =?utf-8?B?Q0FpRENTRzhkaWdQQ08wZWdRT0xyZjF1MW01UTdzbkhKOHFPSEd1SnpFTDlX?=
 =?utf-8?B?L1VBQXN1MUVYQ0JISEJDTjl4Ym5ncS9NU1M4NlVxMUdVNjZkMHdQcWRlSWZs?=
 =?utf-8?B?RHZ6dzh0emluNmFKUUdydzhneWl2MzFTTXA0UEN4TkRWYlVFeFUyL1RXWXRE?=
 =?utf-8?B?bytsc0NtL0JyMHhWeEt6bmd1bkdCSUZiV0VlNm5GcmJDT09xbzJwUjBDNENo?=
 =?utf-8?B?TklLQlQ2STlabCt1UWlueUVtTEUzQVp1alNYTytja2JiSlMwMFhxamJrWkhn?=
 =?utf-8?B?UFBERWQ2enVCbko5czBUWnFla1pBeTBycTlaR0NPRy9NL2VDZW9uZEpzZml3?=
 =?utf-8?B?RmhXaW9qd0dwKzFBczNHYWNubjZHakNwUHVqQkphTktkN25CVWV3OVk0RkQv?=
 =?utf-8?B?VUwzWjNjdzhHMElFNWxkSVVCOEZZdWtpaEhnNW80YVllZkFnM0UyV1N4Nng1?=
 =?utf-8?B?dFpiNHJPTUkvV1lFc3VkdlhrdkFzbkZ6azJ1cHJ4MU4rYUlKUFhjdFpRdEJr?=
 =?utf-8?B?S2k1ekRyVERGR3BwQjRqdTFkVCszNkVKUXRGTVNFcndYMHhRcUtLekF5eG0y?=
 =?utf-8?B?c05uZ2pUeGoveUVqZmUyNjlEamdNQk1PYVArQVkzYWtJUnl5L1FKZmNvdzdU?=
 =?utf-8?B?dVVrd0I4Z2pTUDQwQ1lvT3FTTm00Y0d0K0VtUFlJOUZ5YTdlcjExM2pPRE94?=
 =?utf-8?B?RUN6MjNnSE5NRFVkcmZWc01KNWErMHhJU2lkV0hCeGxHNVVIU2lRS0pLZG1N?=
 =?utf-8?Q?vjhKoDxGPUM6Akw/WiIAAhszUo1NFGGscGWwltA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428aa016-9c4c-4a28-bd05-08d942a3851a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:33:53.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9Gd+VTxTdxQfhIdHX17GBpGmCL1tIOJQF7HrVb5TSxURBVQ5Tc1vk4c1T+HpbrP0zBq0tM3pGjnLCW/X+V5Iqss8SzkRReA8j/M/KSdEdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3574
Received-SPF: pass client-ip=40.107.7.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

08.07.2021 04:30, Eric Blake wrote:
> Enhance the test to demonstrate behavior of qemu-img with a qcow2
> image containing an inconsistent bitmap, and rename it now that we
> support useful iotest names.
> 
> While at it, fix a missing newline in the error message thus exposed.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   block/dirty-bitmap.c                          |  2 +-
>   .../{291 => tests/qemu-img-bitmaps}           | 13 +++++++-
>   .../{291.out => tests/qemu-img-bitmaps.out}   | 32 ++++++++++++++++++-
>   3 files changed, 44 insertions(+), 3 deletions(-)
>   rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (92%)
>   rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (82%)
> 
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 68d295d6e3ed..0ef46163e3ea 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -193,7 +193,7 @@ int bdrv_dirty_bitmap_check(const BdrvDirtyBitmap *bitmap, uint32_t flags,
>           error_setg(errp, "Bitmap '%s' is inconsistent and cannot be used",
>                      bitmap->name);
>           error_append_hint(errp, "Try block-dirty-bitmap-remove to delete"
> -                          " this bitmap from disk");
> +                          " this bitmap from disk\n");
>           return -1;
>       }
> 
> diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/tests/qemu-img-bitmaps
> similarity index 92%
> rename from tests/qemu-iotests/291
> rename to tests/qemu-iotests/tests/qemu-img-bitmaps
> index 20efb080a6c0..76cd9e31e850 100755
> --- a/tests/qemu-iotests/291
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -3,7 +3,7 @@
>   #
>   # Test qemu-img bitmap handling
>   #
> -# Copyright (C) 2018-2020 Red Hat, Inc.
> +# Copyright (C) 2018-2021 Red Hat, Inc.
>   #
>   # This program is free software; you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
> @@ -32,6 +32,7 @@ _cleanup()
>   trap "_cleanup; exit \$status" 0 1 2 3 15
> 
>   # get standard environment, filters and checks
> +cd ..
>   . ./common.rc
>   . ./common.filter
>   . ./common.nbd
> @@ -129,6 +130,16 @@ $QEMU_IMG map --output=json --image-opts \
> 
>   nbd_server_stop
> 
> +echo
> +echo "=== Check handling of inconsistent bitmap ==="
> +echo
> +
> +$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
> +$QEMU_IMG bitmap --add "$TEST_IMG" b4
> +$QEMU_IMG bitmap --remove "$TEST_IMG" b1
> +_img_info --format-specific | _filter_irrelevant_img_info
> +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"

Worth then removing remaining inconsistent bitmaps and try again?

I think you should now remove $TEST_IMG.copy in _cleanup

with squashed in

--- a/tests/qemu-iotests/tests/qemu-img-bitmaps
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -27,6 +27,7 @@ status=1 # failure is the default!
  _cleanup()
  {
      _cleanup_test_img
+    _rm_test_img "$TEST_IMG.copy"
      nbd_server_stop
  }
  trap "_cl

Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +
>   # success, all done
>   echo '*** done'
>   rm -f $seq.full
> diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> similarity index 82%
> rename from tests/qemu-iotests/291.out
> rename to tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index 018d6b103f87..17b34eaed30f 100644
> --- a/tests/qemu-iotests/291.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -1,4 +1,4 @@
> -QA output created by 291
> +QA output created by qemu-img-bitmaps
> 
>   === Initial image setup ===
> 
> @@ -115,4 +115,34 @@ Format specific information:
>   [{ "start": 0, "length": 2097152, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
>   { "start": 2097152, "length": 1048576, "depth": 0, "present": false, "zero": false, "data": false},
>   { "start": 3145728, "length": 7340032, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
> +
> +=== Check handling of inconsistent bitmap ===
> +
> +image: TEST_DIR/t.IMGFMT
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +backing file: TEST_DIR/t.IMGFMT.base
> +backing file format: IMGFMT
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +                [0]: in-use
> +                [1]: auto
> +            name: b2
> +            granularity: 65536
> +        [1]:
> +            flags:
> +                [0]: in-use
> +            name: b0
> +            granularity: 65536
> +        [2]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +    corrupt: false
> +qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
> +Try block-dirty-bitmap-remove to delete this bitmap from disk
>   *** done
> 


-- 
Best regards,
Vladimir

