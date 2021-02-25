Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A93250E7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:53:14 +0100 (CET)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFH4r-0002EP-6b
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFH2r-0001be-1l; Thu, 25 Feb 2021 08:51:09 -0500
Received: from mail-am6eur05on2137.outbound.protection.outlook.com
 ([40.107.22.137]:1569 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFH2n-0003JZ-JW; Thu, 25 Feb 2021 08:51:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmn2Fv3yUAoojTQqWnhdnn0MCDS5N/RirIoXVTPREjmfq7Ar5Y0b3zlQbVBWZlpyxC6bYRGbZ2aOLl6djZYGuanSElgGkEeBB/eeEdAO2ibtJx9c2Q5jQkJo+Vsm2yMYNG4TSKmSRk/DaeB9n2xi9uRq4R2h95kMPoCcCmuKFpfNY7Q8U4QG/HpupxPXeV/21jardRgi4DYt564jLwurz98nDNgbeeWwM10PPMFcZwJZSAvsGmJMREo6yI4w1H3sSKpQksPbrdviIwhuzBomr+JmFA/e7sCJMmujagr7Xo96d/PQYadx/49Qio6rQEFLIYk+dPsEnJzq9wwbcCAgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66vUQUnCezvDZiw+4u7BMAJ6Ase4W9L0uPx3QuX110Y=;
 b=kkZU8cbpGnQbDGKzzzZLiNdRa84EtyWoDF/bcOW9RY1LKnvrvbnw/GgwJAv4D0nQckpswgWGzpyS7sPQl38vtabo+PfCrUKxjlofoc3gBEkscF6ZKemExWYa+xKS3B6M81SXVEJ5k2XXTV7aqJJJNMj/0PiieLhj7HMxec65OwgYhbRoRXtRV47Di5Br9Y6jIMJqJIoHyOW8Qsl6mZvRDv/BsEaZ34w4irmxPRgo7CCq4uVWHx5qZTz4Ca/N3hbmqj5/RuvA831ackkbg9btbbr0NpEockXme92LjCsgo1Z/9WOIIM9hZP+S+E4SL3aHPiBasJWxoxrT3O33cuHYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66vUQUnCezvDZiw+4u7BMAJ6Ase4W9L0uPx3QuX110Y=;
 b=WAzZLY+3lAuRRqe4Kxha8ypc5+ilobfhb+8zAHEOFJiQdOIp9VmQYOo4Xv0zVPl0djoELn0nQtkXYnrcfxD3aGyrFj2Ka4vH9itj3eZ/NsFGu3gvwOLhBtsxc1SDlcbwCuOMdcBerBJnYSAgPzgkt0/IyBNy/xgZSpilB775YMo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Thu, 25 Feb
 2021 13:51:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 13:51:02 +0000
Subject: Re: [PATCH 1/5] iotests: Update 241 to expose backing layer
 fragmentation
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
Date: Thu, 25 Feb 2021 16:50:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210218201528.127099-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR1001CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR1001CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 13:51:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7877dd9-96a6-4dc9-ba63-08d8d9946361
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551B1FD9B74BCA32827C11EC19E9@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ln+ek/a6uijzISnPdrYQN77iG1yc+8hZVPP1pwTwTilJ04GrrQ87fL1Y5YHA0+jJtFxUbeXlcpupk0B56L5pQK8/6t7gY+hBZLB9mfVMQvPPMJu/uMI4wNNu2s5HUddV25wgjVxBHudNAfGbq7NeWUsseoKzhVxr95iY7qwQ3U52vpy8i9rHnMf/Tzxz2p87TRhnuPkfRN9JCAx1+LSTAidchkUnG/yy18XaoPRBDxJADM24+BY9/CY3pv0teqTSe94l8cOdIDIPw6339dfHqdwFdN6FASkqY+gBJgKS7wDkesHZRuiASzZdveZTsgjWxHrcdzlEd6N7nGqtDom/aHlLk6zeBjq9F7q8kLOJaDZJ8q0+7IalaiS0MUtZtAXhgeYehJ35s5oFgO82MNvQmCd37/F2AUXAtxr6iAbKM54REvv5pWb1AyUP6Jyx6DGcoNoMaUsCBm9ajCgOb9ekBQG3Aw8c0z2LtWNVf2IngZ8sevRzZGYtgjED4yUaMs3PoKI7UqYCV5nFYedAxRxtdhQVzGN4waBv32hOUjeXq7EhpEPQVULqtwiv5D58t1/HUF7abKNyxU6Go0KSrjvnKexBgNjUftcGYtj8xLSXmpgqDtWAHhKbok4zOixjXiuV4rvZS3WkHgMgfM3rM5La/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39840400004)(136003)(8676002)(6666004)(8936002)(52116002)(36756003)(15650500001)(2616005)(16526019)(66476007)(478600001)(26005)(66946007)(956004)(186003)(86362001)(316002)(5660300002)(4326008)(54906003)(6486002)(31686004)(2906002)(66556008)(83380400001)(31696002)(16576012)(21314003)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUR5bEVObHc1cnR6aEpndWhXTDM4RWV2Q2FMYUZoeFVpdEVMSVN0UUJ4cDdT?=
 =?utf-8?B?RlczZUJlK2owTjFpY3N1T2VXNGNiMFJjdmwyTHN0elVQY0EzRHN5TjFKU1Y0?=
 =?utf-8?B?cXVCVDU2eXJJQ0xGVEs3YkNKaDdycS9uTnk4QUhNSUpndkpFTXJEeHVVKzRW?=
 =?utf-8?B?S0NLUlBIc25OeWduUDIxeFJ2TVZ0ejM3SnRQMyt1Y1lHb0dQVFBsVWtKV3pE?=
 =?utf-8?B?KzZXa0xYL1lrWFJURXB2UDNCbUR5TGNXZ1RKSmIwZ2UwaENqRXhhd0JWellz?=
 =?utf-8?B?SURaMk13clRhOWhvQmxvTnhJNHcreFc2Q2F2Uk1YRFRsZGtrNURiamw3clFk?=
 =?utf-8?B?djFkaVZjbjErNTRNZ0lXT050cHEyUFkrblJwL2ZMRm9XVnVLbndJSVRPYVhw?=
 =?utf-8?B?OGxBcy9PZlVyU2NYTFlMLzl5K0RLTERkQUczVURwMHlXejRRczFnL0t6ZWxM?=
 =?utf-8?B?SVdhTlBLTWoyV1JTSmRFdWF6OGZkNHJxc1QxS2pRVEZHb0dLSFJ6MnAwUE1P?=
 =?utf-8?B?QlFxL0ptUXZxdkN4bmZpNXVLelRjRkxVU2g1cW9zZkExWlRXRkVQT3Z0dTEz?=
 =?utf-8?B?MnZlWTV2eHNQMTR6ZmZ0WFVrVlJweEFvTE1UMmhFaDlhSFczVWRSWThxYTZM?=
 =?utf-8?B?dUdBKzZIZGNzaElMcFA0L0pjd0Z3KzNhVzg5M1hkWTl1SXhXVlM3VzFrZk1t?=
 =?utf-8?B?NDRyenRycW51eWUwVFdOOWY3ZGhWTE55Z3ZzeWozWWVocHJ3Q3FsRWMrZUln?=
 =?utf-8?B?eHdLSUhyUisrU0RRbHp2VGJqNlNhRmdQaXJhL1Qzb2o5dlNuMU1jNXhRYSty?=
 =?utf-8?B?NmZSQ2NGbDZGYWxrT0hGQndKVDBUL2RkRmFkT091SkYrRFc4VTlXMW5kcFhj?=
 =?utf-8?B?NHMxOHZwSzYzYnh5aHkxZFk4dlNYbUhBdGhvWmNqelI1dVJMQ0FBNVpxSDE3?=
 =?utf-8?B?QUZYcHpWVjVMMHBuU2NOWjExRG4yZDc1QjVpLzgrWTNrTWdGeWVvWXVmZ2I1?=
 =?utf-8?B?SUhaQjYrbEJGUytSdVpIdUg5emphQlVZZkZYNGoramNOU1p2MmRGZW9SRFRS?=
 =?utf-8?B?dGZ6c3RnNWxWWDlrZGkwREVDb0d4T3grWHAxV3cvRlVEVVMwV3NoNWRXcndy?=
 =?utf-8?B?OHV0VVZ4YkdDWFdHMFhuMkRJb3ZrN1N3djZNR2l6UEhxMktTV0NGcW80V1hO?=
 =?utf-8?B?UXVkYUlNVnViZnJaNEhSNzdUREZ3K0RsUm1GQ2VWMW1PYlJyZkVXdWJBd3lz?=
 =?utf-8?B?ZHU3Q01hYWlBTWJoWGZmN2VHMEFhQml1ei96ZjVoZCtKcUdOYkcvd0cveEdn?=
 =?utf-8?B?K0lhYjJpemEyZjlnMGc4NDgzaVZqSnphVjRocTR6bDF2aWJUTm1BNkZ1N01Z?=
 =?utf-8?B?Wnc0c1B4NnJkQ3JrRjdLQ3dMN1RhYXE0NUlmcnNSWEZYVkkzM1p0bjBBVUlH?=
 =?utf-8?B?dU9qYTRCS1BxSVFyRmUxZGkraVFjSEduT3FtWUdBTkQvamZCa0tXNS8rWHhG?=
 =?utf-8?B?cUIvbXBpclJ2em92S0M5bkdKemhsRjI0eGpaTVI3N0tiMmRwdWtncVpvd01P?=
 =?utf-8?B?KzBlSExIellUenpXd1Y1NkF2dml0cWlXOUlhOXBEb0p2YmZhcjFHYkxWeUtM?=
 =?utf-8?B?aCtIdXVoRXFUaWlFcjBLOUpzNXR4SGRBeTF2TTFJb0NUanlBeDMrMlU1eWNx?=
 =?utf-8?B?STRJWDFIYWNkREhrQU9Nb1FqT0VLN1BHUFFYK1N5Z0dUSU5TNG1TdmNxUUla?=
 =?utf-8?Q?Uk9JZJX+o6s2tN/6cRwH1OXg5M0eqJ8chtMI0xo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7877dd9-96a6-4dc9-ba63-08d8d9946361
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 13:51:02.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj45c95ZiptI6igt4erbEk9u29e+g98Ze8h1dPPP/3PXQG4glaKHjQmpAd4JnEqYJMbubWAeE1pUGWTlbuVB7lCuMnuDksSFIHM+1E74bSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.22.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.02.2021 23:15, Eric Blake wrote:
> Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
> NBD server still sends unaligned fragments when an active layer with
> large advertised minimum block size is backed by another layer with a
> smaller block size. Expand the test to actually cover these scenario,
> by using two different approaches: qcow2 encryption (which forces
> 512-byte alignment) with an unaligned raw backing file, and blkdebug
> with a 4k alignment.
> 
> The encryption test passes with the desired results, but only because
> the client side works around the server's non-compliance; if you
> repeat the test manually with tracing turned on, you will see the
> server sending a status for 1000 bytes of data then 1048 bytes of
> hole, which is not aligned. But reverting commit 737d3f5244 shows that
> it is indeed the client working around the bug in the server.
> 
> Meanwhile, the blkdebug test gives incorrect results: remember, when
> using x-dirty-bitmap with qemu-img map as a way to sniff alternative
> metadata contexts, the meanings of "data" and "zero" are determined by

How I'm tired of this abuse:) It seems that total amount of comments
about it in code and commit messages worth creating more intuitive
interface.. Don't you have an idea in mind?

> that context.  Our client workaround is assuming that the fragmented
> replies can be merged according to base:allocation rules, but those
> rules do not work for other contexts (merging dirty and clean bitmap
> should produce dirty; merging allocated and unallocated should produce
> allocated; see the FIXME for more about the decoded values we expect).

You could instead keep the test output correct (without FIXME marks) but
add the test to "disabled" group and drop it from the group when fixed.

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/241     | 60 ++++++++++++++++++++++++++++++++++----
>   tests/qemu-iotests/241.out | 21 +++++++++++++
>   2 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
> index c962c8b6075d..5217af82dc65 100755
> --- a/tests/qemu-iotests/241
> +++ b/tests/qemu-iotests/241
> @@ -3,7 +3,7 @@
>   #
>   # Test qemu-nbd vs. unaligned images
>   #
> -# Copyright (C) 2018-2019 Red Hat, Inc.
> +# Copyright (C) 2018-2021 Red Hat, Inc.
>   #
>   # This program is free software; you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
> @@ -27,7 +27,7 @@ status=1 # failure is the default!
>   _cleanup()
>   {
>       _cleanup_test_img
> -    rm -f "$TEST_DIR/server.log"
> +    rm -f "$TEST_DIR/server.log" "$TEST_IMG_FILE.mid" "$TEST_IMG_FILE.qcow2"
>       nbd_server_stop
>   }
>   trap "_cleanup; exit \$status" 0 1 2 3 15
> @@ -37,7 +37,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>   . ./common.filter
>   . ./common.nbd
> 
> -_supported_fmt raw
> +_supported_fmt raw # although the test also requires use of qcow2
>   _supported_proto nbd
>   _supported_os Linux
>   _require_command QEMU_NBD
> @@ -89,11 +89,61 @@ $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
>   $QEMU_IO -c map "$TEST_IMG"
>   nbd_server_stop
> 
> -# Not tested yet: we also want to ensure that qemu as NBD client does
> +echo
> +echo "=== Encrypted qcow2 file backed by unaligned raw image ==="
> +echo
> +
> +# Enabling encryption in qcow2 forces 512-alignment
> +SECRET=secret,id=sec0,data=12345
> +$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE" -F raw --object "$SECRET" \
> +  -o encrypt.format=luks,encrypt.key-secret=sec0,encrypt.iter-time=10 \
> +  "$TEST_IMG_FILE.qcow2" 2k | _filter_img_create
> +nbd_server_start_unix_socket --object "$SECRET" --image-opts \
> +  driver=qcow2,file.filename="$TEST_IMG_FILE.qcow2",encrypt.key-secret=sec0
> +
> +$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
> +$QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
> +$QEMU_IO -c map "$TEST_IMG"
> +nbd_server_stop
> +
> +echo
> +echo "=== Use blkdebug for larger alignment than backing layer ==="
> +echo
> +
> +$QEMU_IMG create -f qcow2 -o cluster_size=1024 \
> +  "$TEST_IMG_FILE" 2k | _filter_img_create
> +$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE" -F qcow2 -o cluster_size=512 \
> +  "$TEST_IMG_FILE.mid" | _filter_img_create
> +$QEMU_IMG bitmap --add -g 512 --enable "$TEST_IMG_FILE.mid" b0
> +$QEMU_IO -f qcow2 -c 'w 512 512' "$TEST_IMG_FILE.mid" | _filter_qemu_io
> +$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE.mid" -F qcow2 \
> +  "$TEST_IMG_FILE.qcow2" 4k | _filter_img_create
> +FILE=image.file.filename="$TEST_IMG_FILE.qcow2"
> +nbd_server_start_unix_socket -B b0 -A --image-opts \
> +  driver=blkdebug,align=4096,image.driver=qcow2,image.file.driver=file,"$FILE"
> +
> +TEST_IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
> +$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
> +# FIXME: this should report a single 4k block of "data":false which translates
> +# to the dirty bitmap being set for at least part of the region; "data":true
> +# is wrong unless the entire 4k is clean.
> +$QEMU_IMG map --output=json --image-opts \
> +	  "$TEST_IMG",x-dirty-bitmap=qemu:dirty-bitmap:b0 | _filter_qemu_img_map
> +
> +# FIXME: this should report a single 4k block of "zero":true,"data":true,
> +# meaning allocated from the backing chain.  Using "zero":false,"data":false
> +# (allocated in active layer) or "zero":false,"data":true (entire region
> +# unallocated) is wrong.
> +$QEMU_IMG map --output=json --image-opts \
> +  "$TEST_IMG",x-dirty-bitmap=qemu:allocation-depth | _filter_qemu_img_map
> +nbd_server_stop
> +
> +# Not tested here: we also want to ensure that qemu as NBD client does
>   # not access beyond the end of a server's advertised unaligned size:
>   #  nbdkit -U - memory size=513 --run 'qemu-io -f raw -c "r 512 512" $nbd'
>   # However, since qemu as server always rounds up to a sector alignment,
> -# we would have to use nbdkit to provoke the current client failures.
> +# we would have to use nbdkit to demonstrate this scenario (see
> +# commit 9cf638508c for more information).
> 
>   # success, all done
>   echo '*** done'
> diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
> index 75f9f465e522..67aaeed34f50 100644
> --- a/tests/qemu-iotests/241.out
> +++ b/tests/qemu-iotests/241.out
> @@ -25,4 +25,25 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
>   [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
>   { "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
>   1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
> +
> +=== Encrypted qcow2 file backed by unaligned raw image ===
> +
> +Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=2048 backing_file=TEST_DIR/t.IMGFMT backing_fmt=IMGFMT
> +  size:  2048
> +  min block: 512
> +[{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> +{ "start": 1024, "length": 1024, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
> +2 KiB (0x800) bytes     allocated at offset 0 bytes (0x0)
> +
> +=== Use blkdebug for larger alignment than backing layer ===
> +
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=qcow2 size=2048
> +Formatting 'TEST_DIR/t.IMGFMT.mid', fmt=qcow2 size=2048 backing_file=TEST_DIR/t.IMGFMT backing_fmt=qcow2
> +wrote 512/512 bytes at offset 512
> +512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=4096 backing_file=TEST_DIR/t.IMGFMT.mid backing_fmt=qcow2
> +  size:  4096
> +  min block: 4096
> +[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
> +[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
>   *** done
> 


-- 
Best regards,
Vladimir

