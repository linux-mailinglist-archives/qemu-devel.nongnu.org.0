Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A093C2546
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:51:19 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1quU-0002M9-NX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1qsR-0000hj-80; Fri, 09 Jul 2021 09:49:11 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:54529 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1qsN-0002wz-MC; Fri, 09 Jul 2021 09:49:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGYf1w74dyAmdVR0ueYHhGWIDMrt/QlD0mKJj9c8EVesBLXGQNacfJ7+6yRk4qQXtOHp5P+8kRerRx69pQD0EcCfsjq6xpcVwdfaob5DFexrjswbgNkYGWoB51RFaLfVZYgtlB+wG15v9XdV0ZqTaO0FjZk9HNI/S2y97yWYosXZMdwYgP4S1bqcotqJzAsG/Xe6pgCmhplMQGuMXsDMG8N1OMFGrvvBd+Yzb9l6D8dNwJAQgVH4sUYBhTNyH6Uv7V90kfY9XOYYSw0OJ2kf4GkBhVeueueBYmj1N7SSQ9aPc0umndoUfgoY9sO+iii8eQn1rk6Qa7mdhvFX2udvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf36GQrN51lUhELctJ3tpOAl9DTc3OvzSkyfS7xYS3I=;
 b=oc8vIkM+b353nEySRl3TL7S4jL8Z9jEXgW50upIe7NeFwir+C1YsrAeA7v/4gS9yYLpfojcY4NQUgm3NUb1LT5jpjX9A13hAA8a2PPHW/Iyad9gNwOktDc7M+tMWV+xw7R2JoenuXlrPnFeCS+9fOcdlbYf/jv7reWl3gpUQEmH1HNFE29lftsRqgiixGFnSFB92ajK/hUbJvQIQTxB9Ivhv/VjFv435e+XsPb93wUL5gg+rT8WrL0vKnQTrzhMwQGZrOgc8CqfpsIdmTlR8LOf9YcBtHdTXePEiprqkN8U1wMM/mSC/mOKodJ3cQ0042dkBUofbPG2JLIyuxs03+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf36GQrN51lUhELctJ3tpOAl9DTc3OvzSkyfS7xYS3I=;
 b=B+4LEEkOAa8Q9uAztDjDTXhP9zoHOrKmZFvbeHw2Z2+KUvosW3T62D3/Wo60UE8osbXou6BxbfAzUXLUCEN4ZfFIMycTP90nuAcWhCypZ+WNKwVcCtrceD+D1L5e1zlkyheElYdxujHHwPBUZjihMogUPpkF1iyHqVmzfk2w7ng=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 13:49:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 13:49:02 +0000
Subject: Re: [PATCH 1/2] iotests: Improve and rename test 291 to
 qemu-img-bitmap
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, nsoffer@redhat.com, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210708013001.2576991-1-eblake@redhat.com>
 <20210708013001.2576991-2-eblake@redhat.com>
 <0abfb3e1-7075-39f6-16c9-3690377c2d56@virtuozzo.com>
 <20210709131650.atmnvid6376msxpz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <37cad204-ccb7-454e-b91c-83be04c38167@virtuozzo.com>
Date: Fri, 9 Jul 2021 16:49:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709131650.atmnvid6376msxpz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 13:49:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5876581-f951-4a1f-e2b1-08d942e04fa5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384B153FAD9E42F46725ACEC1189@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2s7hyu/jbq5WdOze/DpUn/44ADozVeWTxsTEFJE+LFWJv1DcF4An7nCA8cBBC7Vriy295fcV10yyfZqiYim9Y2u1Rnr4Ke4BK62JxzIoxU2urqXbm8bAVAzvEKXTd1zFKdUg55Bi1TGgleWkaIPVdpjQfc/x87i3xQYcpKQiIHQRWVbBczwjMyt9lvXRVhnpKv1YBkLNX32M8ji9ETEKB7mSAp0MFHQA4sMP02BSoOl/BOfojuL31hx+KH4Pzpfogk01c3m9KJONeKrx9MF2z/gRiziyuqvMXG4ujLfIY04Ky/TRSAWzomUN9j3yuUsqsD93o20StAoDOs9j9y9EQMUbPJcLrAdA1NB2rwuZqgICsIOzaxcwMGR/pk0uDrvkJTliRU9lXVwi1oxXPoCC922GYDLoH+BiNlcil9w1rPO4GJpyqVt9L4VbBc4fGly5vIoCi7RZ4ZZVMmJpkmlHVplaXC2js46dcR1HS3J7iUZbH+lg+7EVR16UpsthBg6wtVlFLUPi9hGvMdwajmEBAfeG8ztgR3cod/bjPMVPfdPhqka+d55CRQfxMh9V8p2dHtzKYBI0/77GEpy1sjQRNlWDCNgEoKXUymiHF1TVlmkUeK78AqvPhHQ13VdAMBx/WfINnL9t/LQNnHy/fDrHVGpmfTq5a6D4fFOKZxPZQ7kvemdsQ+Yn8QMFto+SmeojG4eNxRp/nk3rR28Q+w3eHJumP0i/ieTPOFG0xNiHjF/QZYx0KZKT7MRq5/M52hzXRHncNmM5gPFxwsxdWnOgng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39830400003)(366004)(396003)(66946007)(956004)(54906003)(186003)(31686004)(2616005)(83380400001)(2906002)(38350700002)(38100700002)(478600001)(5660300002)(4326008)(66556008)(66476007)(8936002)(26005)(8676002)(86362001)(16576012)(316002)(52116002)(6486002)(31696002)(6916009)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlA2bUxBMjZFNDlMVnRlRW5hQ3Npa2V1aU51dGV2bVlEdlJpRC83RHl3WEFE?=
 =?utf-8?B?Q1NvcDNkcjY0cmNhS2d2anUrbUlwRTVjNnRjVlZSUm1YL3VKbWtmZFk2TUUy?=
 =?utf-8?B?c2JlL01nRzJTdEJHLzE0R3pUMTNTbUhBMmpYZTZsT0wxQ2dPbWhoOW9GWHJY?=
 =?utf-8?B?YTJKU1ZjMHN6czYvSThPRmlpL2djVUNvcTFqZ3hPbzNKeUUvd3hreFJXdlZL?=
 =?utf-8?B?Yllwd21ucytGTm00d0tXNFI1Nm1zeE03QW1MZFpVa3ZVSFc4NWN3aTgyVlRU?=
 =?utf-8?B?Q01oSDhYbGN6TUt5aHZnU0xoeTBkR0lQRGJ3N09aYjZZbkVNU1M1aHJzdWVn?=
 =?utf-8?B?SHZHMkVaUFAwVGhWc01jNitVVXBZT3RxSDBzT0VyTG0xUk9UZEZ0bUV6ZkxM?=
 =?utf-8?B?V2ZZQllEdCsrd2tCVjA4SDlhR3F0ZmlzOVlyZmFmeUZIZGNYemhhMVB4Z2pS?=
 =?utf-8?B?Sm5iQ2hWRXlwbktSWTZFSSsya0lHVmlVMG1VSlF3TU4zV2VNbmFLMlRua0hx?=
 =?utf-8?B?UUFCblFSY1BPZWJzbU53MzBvOVJZZHpyVGJPVmFNVGhnOFNxejdveDRtRWZV?=
 =?utf-8?B?bmpnVjN5VHhNRmNORGtacGt4RCt5T1E0WkFmbTJGTjBpNW1RTHhweG9xMElV?=
 =?utf-8?B?UmNlM0VTZ0tua21DMXR5ZTJNaDRTQzdGVlVyOW5BTVc2YVFUSEZUQzMzYUZQ?=
 =?utf-8?B?VGR4eVd5ZXRqZHo2M2syZ2trWC9PVGQ3ZnRKUmxhOXdTT1RnMmRiOUpOZU1x?=
 =?utf-8?B?YVZraXFmcVVDYVZXN2dzVWMreXZqYXBEb3BxaHlvc2xXYWE1c1I0a2VZSFJD?=
 =?utf-8?B?Wml4dzlsZXNXbmVRbFJFS2E5K05FKzY1TGRGSWJkZEFiWGkxTFJMNXRhMExs?=
 =?utf-8?B?dmJ5dnMxbW1tSmlWNVNuR0lxWlJvTEE0ajhYelFDRmJwM0EyWXE3Q1V4djl2?=
 =?utf-8?B?U0FJMUVRdVNGS2pvTVlKb2NPZ3FiSVM1WXlGempGYUxGVmgrZVJ4RWN3ZnVW?=
 =?utf-8?B?NWIxRDQ4bEpyQXppNTI1VytLTldqY1g5OXY4b1JMV3llWlh6dmRaRCt4RUF2?=
 =?utf-8?B?V3JuTTg1VXFpN1dqeEErempNMzBBNEFGMjZ0MWlvNytiOWEzMkc0QVZWanho?=
 =?utf-8?B?cFlTYUtCL2QzV3l1QWpoZjVxMUhERlNMdmd6S3hzQTIrM0Vqa3dKR0QrSU1M?=
 =?utf-8?B?bnRreDVlbW1hS2E5bDNuTExiTkNpaTBsYzNaWTczdFVaVFNPaFgzWVNPclY4?=
 =?utf-8?B?Yk5xdFcwWDRHaWdNcTY4d3g1KzNKcVZidXd5OE5iZjR4WFN2YTdoandqdGpE?=
 =?utf-8?B?M2xMUjZWeHVLZis4U0JuNENyWmtMMTFTaG1hcFk5a21NQWMraDRtWHM2Nnlt?=
 =?utf-8?B?UHBwTzlXZUlsNUg1Qm54Y29DSGN6VE0vVVdKdVA0OGVXSTlaZm1IM3B3VzRa?=
 =?utf-8?B?VE5oZWkyUFpwekx2M0ErVWI5Qm05ejVOTGpPRktpQkxReFAwbTNDRHVlTzFT?=
 =?utf-8?B?Lyt0cFMrTjBSSjhEREJnWGJha292NDBrbnlFYjkvQVpKdzVmUFYvUXdnZE1q?=
 =?utf-8?B?ZEFHT1hCQUtOaGd6RTIyUTZMZlg0NGFqanpQUEdHdnhkUTRKMjh3VlJrWUJ1?=
 =?utf-8?B?bnJsZllJWGdmZlhzaEEyR0Q0L3Q3SjA5TUtsVTdmdW5PSnBnRGhYWEJ6d2JP?=
 =?utf-8?B?dmhOVzhrN1ZnSkxJK0d2Y0JOYzB4b0UrNGxERzZsZDNjSlFYV2s4eWZXZkVF?=
 =?utf-8?Q?QpiiY7dmx9TkgJB00H05bhH4lMJAwCnysyGYnE2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5876581-f951-4a1f-e2b1-08d942e04fa5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 13:49:02.7836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj+gm2kPCnSsWFhKMYsZUs+QQ0eGdB5CNZ2oLIK28DcM0mVzowpA85SEzE8b3RRSqAlHJoDJRliiLR8xxwqH3MqXhicUI0XIBKfJ01omkQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

09.07.2021 16:16, Eric Blake wrote:
> On Fri, Jul 09, 2021 at 09:33:50AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> 
>>> +echo
>>> +echo "=== Check handling of inconsistent bitmap ==="
>>> +echo
>>> +
>>> +$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
>>> +$QEMU_IMG bitmap --add "$TEST_IMG" b4
>>> +$QEMU_IMG bitmap --remove "$TEST_IMG" b1
>>> +_img_info --format-specific | _filter_irrelevant_img_info
>>> +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
>>
>> Worth then removing remaining inconsistent bitmaps and try again?
>>
>> I think you should now remove $TEST_IMG.copy in _cleanup
> 
> $TEST_IMG.copy isn't created on failure (or if it is, that in itself
> is a problem we should be avoiding),

Seems that's the case:
./build/qemu-img create -f qcow2 x 1M
./build/qemu-img bitmap --add x b1
./build/qemu-io x
qemu-io> abort
Aborted (core dumped)
  ./build/qemu-img info x
image: x
file format: qcow2
virtual size: 1 MiB (1048576 bytes)
disk size: 204 KiB
cluster_size: 65536
Format specific information:
     compat: 1.1
     compression type: zlib
     lazy refcounts: false
     bitmaps:
         [0]:
             flags:
                 [0]: in-use
                 [1]: auto
             name: b1
             granularity: 65536
     refcount bits: 16
     corrupt: false
     extended l2: false


ls y
ls: cannot access 'y': No such file or directory
./build/qemu-img convert --bitmaps -O qcow2 x y
qemu-img: Failed to populate bitmap b1: Bitmap 'b1' is inconsistent and cannot be used
Try block-dirty-bitmap-remove to delete this bitmap from disk[root@kvm master]#
# ls y
y
./build/qemu-img info y
image: y
file format: qcow2
virtual size: 1 MiB (1048576 bytes)
disk size: 204 KiB
cluster_size: 65536
Format specific information:
     compat: 1.1
     compression type: zlib
     lazy refcounts: false
     bitmaps:
         [0]:
             flags:
             name: b1
             granularity: 65536
     refcount bits: 16
     corrupt: false
     extended l2: false


WOW! It even contains the bitmap not marked in-use. That's a real bug.

> so as written, there was nothing
> that should have needed cleaning up until patch 2.  But your idea
> (here and in patch 2) of demonstrating manual cleanup for recovery (in
> addition to the goal of patch 2 of skipping broken bitmaps in the
> first place) is reasonable, so I'll incorporate that into v2.
> 


-- 
Best regards,
Vladimir

