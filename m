Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1E3C8301
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:37:16 +0200 (CEST)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cGR-0003II-6q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3cF2-0002aN-Le; Wed, 14 Jul 2021 06:35:48 -0400
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:6650 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3cEy-0002mY-TD; Wed, 14 Jul 2021 06:35:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUijH6rVF+Mv0mVM+feGwF5N466QMGbnvGgPF7u1lrdqDTG6s1en0kqwG5nbYEZVGbL1y4LZQRBRGmhkSBprWMScFsTV0NvAeXb7CWMXLzAGNhw/3ebR8WsJ3Nq9KU1F62WIZW+KK7+Sydoi+5bXBKkOAc5hvAoPpZQscdrAjUwbiaSHYV9OFCOLtfLe4J4lUSrcrno/Csij9/A3ygdxNrWzXrA6wdA7coi+KN6r6MsE+eLSKmGaNMSxIPi6CGUaGB2mfx0Si9+UqZFIayfKsBAtgt3AzRdgwQM1/fOyos1A7BFsPhUskQY5Sz3k3KjyjC3ZYdr5zaaOs8kvlIUx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvT7YXFsoTS+Puu0q3MYNqA29mWioDeb6ZZWuY9tmCg=;
 b=E3YvYt499X81CCOPD9SmxROUG/R6epUh7gFrPrqnnnQwJETmGE2Qmzjgqfl/FLj60nQyH7GA51CERy3Ps1xzDUPhgBzu7cpwktWjZzQfZAJuoC7Hemw/ylbour1xYofQCYOHTEP/oxp+aUmcAtVUQXRzFYpyZnRlu0Ed3/anIhBK0EiHJVViCLK1zBpGnKu4EEVSwoQQKgMauHzrHcEWN1QLfb5JdCe4nYAX5iaWhk/VHJOw/yRaXDDUt6e5YHTEKKszUYxa0UD8M8y4dzDDTD6GFVKiha82xeGqIZZ3sVQuTWtura9C3WyhsjTJnX35km8++YBnVqC29dfH378gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvT7YXFsoTS+Puu0q3MYNqA29mWioDeb6ZZWuY9tmCg=;
 b=KpG7rE/DJfgMh2FI0q/jMf/onNBaHwT1M1uI1cKMWTEBqkUUZCRyI2i2DQgzdR5uCW9xwSigga6XXpNAwCa44FBIsD4ummP5ty9h5ebChSJPMYB3N5avs/hLr4uCkRvBOI3HlzHJQWiEEjKPMeEMmZ8T3cQsrCEgUgTEOQ+sGLg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 14 Jul
 2021 10:35:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 10:35:41 +0000
Subject: Re: Host folder sharing via USB issue
To: Programmingkid <programmingkidx@gmail.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU devel list <qemu-devel@nongnu.org>
References: <F120718F-C548-47C7-BAF7-ABFEC1F9E8CD@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <de0b7543-1f4b-7eb4-fc8a-d8643e79b7da@virtuozzo.com>
Date: Wed, 14 Jul 2021 13:35:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <F120718F-C548-47C7-BAF7-ABFEC1F9E8CD@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Wed, 14 Jul 2021 10:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f83a0f5-3c5e-454f-5a42-08d946b32082
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-Microsoft-Antispam-PRVS: <AM6PR08MB44705424DEE53D290113BDB5C1139@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:204;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iqc0oE2zlXdtn7k+QNFu65+oGupEEBnbkKsVEW6PBadvoUysRyuSe9k6cr/p5LBMixFS3++v3w6OrKvb8IXfGoZXYDSHAKx/5D9rJsq/1rIn6v8anX57sIBFirhvZDoN8hlCREIdZwiVSy4/VeR3330amTSoDOXHJGKC6R9HYf4u/r22PuXjdwWLVbYFfiopAJjBWzXttyg4N8GZz2jn5bVgMIWlvFmYhTC8XxZT9Fhq1YZScTOGyOMu5V+b/j0FHscIJOHH5X+Ya5QtrazlmOeKEXWfjd1J5Ng825C6Vx3qd7Ft2BNbM/x7Z21KjMte96t0DE5y3FsbuENqM3zO1b8U1Dr/zoGRKaXdx3s+BMCYd+LRztvCTvKZQSVdoBawDmL8tZxJVUzfANye9YXgY8+m7aH7XxiW/xyflxw1+oz5hBCdGo5O8WGlV+ZtytbEGcSYs76fQpaeU/iTMn2LZElU3J2Mzr/dGgc1sZosLNGiQQopadVRTXU75z+igACrZnB7B4NtwOiYJFE9YUWgFwheLo+v1pcRRQ0YbQ4I46EB/dY05sZF5EqEebSVATxO1TY73VSwmU/RwdQR8BNife7WuRCfaR4sPKaeunw0IGI34efIGZTXdXBYlZXDOzWXKcvb4AvvL32ZzC03hArIO4VVZPlVJGEE2pc7vQKjmj3mL98O91bE+ZK0urASqAj0Hu+mqdXTf8v+kg/GoBTCNKyX51LEJdk/hbJni8zXJ29hwhsaUNYTn56rImsama4ePDsvLp9sC7x9+q3F/kkbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39830400003)(396003)(136003)(26005)(54906003)(186003)(2616005)(5660300002)(83380400001)(956004)(6486002)(316002)(31696002)(16576012)(110136005)(66556008)(8676002)(31686004)(66946007)(38100700002)(38350700002)(66476007)(52116002)(86362001)(8936002)(36756003)(2906002)(478600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENDWklwb0ZVVDRBYVRBV3V6cHF1WVphTVhqejBDbkU1VVZYNTBWS0tOTFN5?=
 =?utf-8?B?b2RNWHJtb2Y4YWZ5L1B3eFNzZ2ROVUJOeTJ0VktBazFlM284RmhLT0kydXo1?=
 =?utf-8?B?YU1tYXJrNWx0WnRocFIwcXFKdkJxV0hvNUZ0akZjT1F2eThEa3hCa2tWL2V3?=
 =?utf-8?B?WDFrczluSE1CVHBGY0R5Y2dEL2ZRMTZnajN3eWdvUWdCNUFIeHF2S1B0cStn?=
 =?utf-8?B?d2hKcS96eDVBV3NBNUY2N0FRYXRlN1ZOVkUxUm9TNU1vdVk0ckdLODhBWFBa?=
 =?utf-8?B?ekMxVDhybTY0ZEpFNG1TRG9TcnpCZ3VMM21XdVB0MzFNUUJreGtqNzZBRitZ?=
 =?utf-8?B?VjIxSlJvV0dGQmJ3eXZtWWlWM25FTDZWT3Q0cHJhd3Nna1pNaXFjREo4LzF5?=
 =?utf-8?B?Y1pRYkVXL1JTSFE3RFk3ekRpOHp2cytqbEVIZU00Q0x3S2JBazlLOVVKa0kz?=
 =?utf-8?B?eWtwR2ZKSlJNdUNTSkczSXA0SzNuUnZ6MnlZSjNOWG9qaXQ0MWhoeHVQOFNS?=
 =?utf-8?B?bHYway9zOXd6WVBQVndDYU1KRDJEMFBzVVdzcmtsZHliaUJ2OGZQRk1tdGJH?=
 =?utf-8?B?QklWYzhJT1JPcHBDQWdaalN4VGY2Yy9MeklpaWkrZndxT2VWcTVUZWVHcW9j?=
 =?utf-8?B?alpXamNremhrZUc4TVhZdkhYMmh2OUV5cGZqMzBZM0dNNHNOOUNaTGZEYzhQ?=
 =?utf-8?B?MmhVWiszd2dtTGd2TnlDRjRjMWR3cVhGVGdtT1BkM2l5c0htNXBtZ2FDaU5Z?=
 =?utf-8?B?ekRmcUFWTzdmWDFaUnhEUGVqMzh4RGxSd3RteU1MeDcrU1grb3IySWdSd04r?=
 =?utf-8?B?OUNyc0M3RDIzWkxCbE82S0VWOVRMaUF2bzdYeFRzUUJkNHRLY3QvZlgxT0dx?=
 =?utf-8?B?K1pwSjJJMExsNm1sNnpQT0d4bldRZnQ1Y1hJeHIxaW8wRkRRbGtHLzMyZEVO?=
 =?utf-8?B?VlB6M1dxY1lvRlJqNWVzWHpOdnhWWVQ3NmlIWVE5T2FkYWFtYUZ3OTVYYThu?=
 =?utf-8?B?VnNSY09BNWZENER3cU1xTDNXc0RkamRtNkxPd3RLMUFabjNPOE80WUhqWXQ4?=
 =?utf-8?B?MGVSb2NzaHdibUV2Rm9sdFllT0hzUUo5d0FaTW9LOC9jeHFtTW45YmNzNGFS?=
 =?utf-8?B?cVhzZ29BY1YrbkxqYzFZNzdwYjdtNWJWYU5KMzdRYTN1cmlWSU5ubVowYlg3?=
 =?utf-8?B?a1BiTGQ4VjlPTys5NWgxanF3R2NXS3hiU2VKWFZETmFmenhJQTYrbmVFdVF5?=
 =?utf-8?B?Z3Q2Z1VDK3Z4dTlONzVWQ3h5WDhyTzc5cXFGRCtiUktwZC9BSnV4NzNoQ0hJ?=
 =?utf-8?B?clN3Q2FRZzF4eG9iOUdCa1dpUkQ2T3hzS0tocjZxQUpHbTQ2Ykg5bFl1RDFY?=
 =?utf-8?B?NUp4dkRzeGFpYldDbjVpVTVZM3owck1acEN4QjFQVng5dUdHWEdyRURKWDY0?=
 =?utf-8?B?cmswaStDZWlCdXE0bGZ2MlNTekluc2E0akdUOGdWZ3RRb1lvcVZ1aHRENkQ1?=
 =?utf-8?B?cnM5eUZSS1BVVFAwNzJWeTh0a2xNK1VTL1dqL1RGblZ3d0RkeWF4Z3R5RXJQ?=
 =?utf-8?B?U3hGb0p3ZFNaeHc4S1pXRDhwVFBxWVVzeDJTLzJXejdIemNFc0gvSEtYOFFk?=
 =?utf-8?B?VE1nZW93cittL3BmeTN2UlByQkJEdmN1dlo4NWRPMU1SUHdmdEtlOU5wNFNw?=
 =?utf-8?B?dWg2MTBJalVlUmtTQ0xSaUZqTTR6SHVXYWZreERyY3NFNnZHOGdRMVJab05B?=
 =?utf-8?Q?7BIiTkIY/yao7kYv5D+br5UD6rRlgFPK54tdM2P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f83a0f5-3c5e-454f-5a42-08d946b32082
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 10:35:40.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLgpOp/E/r50uKkg1GRfKZn3c1eNWHgP4B7GCiiJ+bQPsL+oRpj9gBVDnoqPZ5viUkns0IchVBYEmQG5CrYdyYcCApBdAmAEYtrrNHuvsEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
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

14.07.2021 00:04, Programmingkid wrote:
> Hi I have noticed that host folder sharing via USB has recently stopped working. After doing some git bisecting I found this as the patch that seems to be the issue:
> 
> 25f78d9e2de528473d52acfcf7acdfb64e3453d4 is the first bad commit
> commit 25f78d9e2de528473d52acfcf7acdfb64e3453d4
> Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Date:   Thu Jun 10 15:05:34 2021 +0300
> 
>      block: move supports_backing check to bdrv_set_file_or_backing_noperm()
>      
>      Move supports_backing check of bdrv_reopen_parse_backing to called
>      (through bdrv_set_backing_noperm()) bdrv_set_file_or_backing_noperm()
>      function. The check applies to general case, so it's appropriate for
>      bdrv_set_file_or_backing_noperm().
>      
>      We have to declare backing support for two test drivers, otherwise new
>      check fails.
>      
>      Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>      Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
>      Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
>   block.c                          | 29 +++++++++++++++--------------
>   tests/unit/test-bdrv-drain.c     |  1 +
>   tests/unit/test-bdrv-graph-mod.c |  1 +
>   3 files changed, 17 insertions(+), 14 deletions(-)
> 
> To reproduce this issue run this command:
> qemu-system-i386 -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path to host folder>",id=fat16,format=raw,if=none
> 
> Results:
> Unexpected error in bdrv_set_file_or_backing_noperm() at ../block.c:3159:
> qemu-system-i386: -drive file=fat:rw:fat-type=16:<host folder path>,id=fat16,format=raw,if=none: Driver 'vvfat' of node '#block057' does not support backing files
> Abort trap: 6
> 
> Expected results:
> QEMU start running normally.
> 
> Please let me know if you need more information.
> 
> Thank you.
> 

Hi!

Look at bt:

#0  0x00007fd34f6939d5 in raise () at /lib64/libc.so.6
#1  0x00007fd34f67c8a4 in abort () at /lib64/libc.so.6
#2  0x000055e446d967aa in error_handle_fatal (errp=0x55e447652680 <error_abort>, err=0x55e448d17a20) at ../util/error.c:40
#3  0x000055e446d968da in error_setv
     (errp=0x55e447652680 <error_abort>, src=0x55e446f8755b "../block.c", line=3158, func=0x55e446f89c20 <__func__.64> "bdrv_set_file_or_backing_noperm", err_class=ERROR_CLASS_GENERIC_ERROR, fmt=0x55e446f88458 "Driver '%s' of node '%s' does not support backing files", ap=0x7ffc31aba090, suffix=0x0) at ../util/error.c:73
#4  0x000055e446d96ab8 in error_setg_internal
     (errp=0x55e447652680 <error_abort>, src=0x55e446f8755b "../block.c", line=3158, func=0x55e446f89c20 <__func__.64> "bdrv_set_file_or_backing_noperm", fmt=0x55e446f88458 "Driver '%s' of node '%s' does not support backing files") at ../util/error.c:97
#5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm (parent_bs=0x55e448ceebe0, child_bs=0x55e448d21e40, is_backing=true, tran=0x55e448d16c20, errp=0x55e447652680 <error_abort>) at ../block.c:3158
#6  0x000055e446c41377 in bdrv_set_backing_noperm (bs=0x55e448ceebe0, backing_hd=0x55e448d21e40, tran=0x55e448d16c20, errp=0x55e447652680 <error_abort>) at ../block.c:3218
#7  0x000055e446c413ae in bdrv_set_backing_hd (bs=0x55e448ceebe0, backing_hd=0x55e448d21e40, errp=0x55e447652680 <error_abort>) at ../block.c:3227
#8  0x000055e446c1bd37 in enable_write_target (bs=0x55e448ceebe0, errp=0x7ffc31aba360) at ../block/vvfat.c:3191
#9  0x000055e446c16fe8 in vvfat_open (bs=0x55e448ceebe0, options=0x55e448cf4330, flags=155650, errp=0x7ffc31aba360) at ../block/vvfat.c:1236
#10 0x000055e446c3df37 in bdrv_open_driver (bs=0x55e448ceebe0, drv=0x55e4475e9760 <bdrv_vvfat>, node_name=0x0, options=0x55e448cf4330, open_flags=155650, errp=0x7ffc31aba470) at ../block.c:1550
#11 0x000055e446c3e8ee in bdrv_open_common (bs=0x55e448ceebe0, file=0x0, options=0x55e448cf4330, errp=0x7ffc31aba470) at ../block.c:1827
#12 0x000055e446c427b6 in bdrv_open_inherit
     (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448cf4330, flags=40962, parent=0x55e448ce75a0, child_class=0x55e4475099c0 <child_of_bds>, child_role=19, errp=0x7ffc31aba670)
     at ../block.c:3747
#13 0x000055e446c419f5 in bdrv_open_child_bs
     (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", options=0x55e448cec9f0, bdref_key=0x55e446f884d0 "file", parent=0x55e448ce75a0, child_class=0x55e4475099c0 <child_of_bds>, child_role=19, allow_none=true, errp=0x7ffc31aba670) at ../block.c:3387
#14 0x000055e446c42568 in bdrv_open_inherit
     (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448cec9f0, flags=8194, parent=0x0, child_class=0x0, child_role=0, errp=0x55e447652688 <error_fatal>) at ../block.c:3694
#15 0x000055e446c42cf6 in bdrv_open (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448ce4f00, flags=0, errp=0x55e447652688 <error_fatal>) at ../block.c:3840
#16 0x000055e446c5fcaf in blk_new_open (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448ce4f00, flags=0, errp=0x55e447652688 <error_fatal>) at ../block/block-backend.c:435
#17 0x000055e446beca1d in blockdev_init (file=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", bs_opts=0x55e448ce4f00, errp=0x55e447652688 <error_fatal>) at ../blockdev.c:609
#18 0x000055e446bed900 in drive_new (all_opts=0x55e448ac4850, block_default_type=IF_IDE, errp=0x55e447652688 <error_fatal>) at ../blockdev.c:993
#19 0x000055e446abd69e in drive_init_func (opaque=0x55e448bd4d40, opts=0x55e448ac4850, errp=0x55e447652688 <error_fatal>) at ../softmmu/vl.c:613
#20 0x000055e446da26d9 in qemu_opts_foreach (list=0x55e4475e8960 <qemu_drive_opts>, func=0x55e446abd66a <drive_init_func>, opaque=0x55e448bd4d40, errp=0x55e447652688 <error_fatal>) at ../util/qemu-option.c:1137
#21 0x000055e446abd8e7 in configure_blockdev (bdo_queue=0x55e44757a2a0 <bdo_queue>, machine_class=0x55e448bd4c90, snapshot=0) at ../softmmu/vl.c:672
#22 0x000055e446ac1b75 in qemu_create_early_backends () at ../softmmu/vl.c:1925
#23 0x000055e446ac5c1f in qemu_init (argc=6, argv=0x7ffc31abae58, envp=0x7ffc31abae90) at ../softmmu/vl.c:3636
#24 0x000055e4466b3c71 in main (argc=6, argv=0x7ffc31abae58, envp=0x7ffc31abae90) at ../softmmu/main.c:49
(gdb) fr 5
#5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm (parent_bs=0x55e448ceebe0, child_bs=0x55e448d21e40, is_backing=true, tran=0x55e448d16c20, errp=0x55e447652680 <error_abort>) at ../block.c:3158
3158            error_setg(errp, "Driver '%s' of node '%s' does not support backing "


(gdb) fr 7
#7  0x000055e446c413ae in bdrv_set_backing_hd (bs=0x55e448ceebe0, backing_hd=0x55e448d21e40, errp=0x55e447652680 <error_abort>) at ../block.c:3227
3227        ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
(gdb) p bs->drv
$1 = (BlockDriver *) 0x55e4475e9760 <bdrv_vvfat>


Hmm. Really vvfat doesn't seem to support backing files. But it does create a node with vvfat_write_target driver and set it as backing of itself (of vvfat node I mean).. And I don't see, where is this backing used.


Looking at git history, I see commit a8a4d15c1c34d of 2017, which describes that this fake backing file doesn't work anyway.

So, if just remove this backing file, bug doesn't reproduce. But I think better fix is to deprecate vvfat (recommend use virtio-fs instead for sharing) and drop it after deprecation period.



Use it with no guarantee:) :

diff --git a/block/vvfat.c b/block/vvfat.c
index ae9d387da7..34bf1e3a86 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3098,26 +3098,6 @@ static int coroutine_fn vvfat_co_block_status(BlockDriverState *bs,
      return BDRV_BLOCK_DATA;
  }
  
-static int coroutine_fn
-write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
-{
-    int ret;
-
-    BDRVVVFATState* s = *((BDRVVVFATState**) bs->opaque);
-    qemu_co_mutex_lock(&s->lock);
-    ret = try_commit(s);
-    qemu_co_mutex_unlock(&s->lock);
-
-    return ret;
-}
-
-static BlockDriver vvfat_write_target = {
-    .format_name        = "vvfat_write_target",
-    .instance_size      = sizeof(void*),
-    .bdrv_co_pwritev    = write_target_commit,
-};
-
  static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
                                 int *child_flags, QDict *child_options,
                                 int parent_flags, QDict *parent_options)
@@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
  {
      BDRVVVFATState *s = bs->opaque;
      BlockDriver *bdrv_qcow = NULL;
-    BlockDriverState *backing;
      QemuOpts *opts = NULL;
      int ret;
      int size = sector2cluster(s, s->sector_count);
@@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
      unlink(s->qcow_filename);
  #endif
  
-    backing = bdrv_new_open_driver(&vvfat_write_target, NULL, BDRV_O_ALLOW_RDWR,
-                                   &error_abort);
-    *(void**) backing->opaque = s;
-
-    bdrv_set_backing_hd(s->bs, backing, &error_abort);
-    bdrv_unref(backing);
-
      return 0;
  
  err:
@@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState *bs, BdrvChild *c,
                               uint64_t perm, uint64_t shared,
                               uint64_t *nperm, uint64_t *nshared)
  {
-    if (role & BDRV_CHILD_DATA) {
-        /* This is a private node, nobody should try to attach to it */
-        *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
-        *nshared = BLK_PERM_WRITE_UNCHANGED;
-    } else {
-        assert(role & BDRV_CHILD_COW);
-        /* The backing file is there so 'commit' can use it. vvfat doesn't
-         * access it in any way. */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-    }
+    assert(role & BDRV_CHILD_DATA);
+    /* This is a private node, nobody should try to attach to it */
+    *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    *nshared = BLK_PERM_WRITE_UNCHANGED;
  }
  
  static void vvfat_close(BlockDriverState *bs)





-- 
Best regards,
Vladimir

