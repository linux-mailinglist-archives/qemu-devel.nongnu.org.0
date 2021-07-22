Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469D3D234D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:24:30 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xkb-0005XK-G9
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6XjE-00042x-Ac; Thu, 22 Jul 2021 08:23:04 -0400
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:18603 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6XjB-0005Y0-Ib; Thu, 22 Jul 2021 08:23:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSMF+l2tgyO1jhec7bYaqtCG41KI9cGSvcCyp7YnENV2ygCAIB/R5cU3UUpATdf2/UgrLGcMbiyQ9+qmkfRoXtAgut2Mo8MrYfft4mcOajAnLDzUp4R5J/9ryoTqlJeFt9ghTMBrB92c64v8koPY3ovi/iJnv9lC5872vK/WX7JbmBuM7jHfun65y2QFxYAO9Bwq0pcUXk8prJKaXuwHkQ6U2XNsnOOyAhWGzSjv6uyLBsyxwQ0ML9YcfkAetbPKEpZBkQ1YmWsIOoTZRRMJNYzu16cvNLfo9NMRBoZpFGITNDaxiAR+gC20p2OD6pwH74vID/aQvQF3Bv82En1/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ0TJgfIGfhjp7lzKD3dqgMjfPxCeO0mymeKfd1T7qs=;
 b=XBYj4kNJsQF78f/p3w8HE88A4I2tA5Qj6yAL/0lxyT8YB7h9Hcmwrx6+LSZWbG8haq0XjkR1sD4ojXj6EvYQ3IipbbMY5a9KlxM7YLNLlR2EIqC9MPSaPWhBr4SCDQtIKC93Ff6o7NXRHZ0qSSe0N6EhdcubmIDtD7x5NxlEyNInbzSRQJSlyUIAK/jxeEQLq2WHofZ6C7n86jO/Qr2Ssc2c8cb9tdHZkYDXZJQvC1r7olSIZQVLQ/nZwEan2A6BVinpy52OJLIlmRG9dJ5kKUBayw3NnYorJncFnb1/FSwiVYMHM4urMunFGabIHoYe06OKKmJfDmMzg+VSDjjzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ0TJgfIGfhjp7lzKD3dqgMjfPxCeO0mymeKfd1T7qs=;
 b=IjY2DtrdkOcqf4uc6TBeoAup9oQWC+FLS6LvodP1orZa1vxe5L/6uFkibV7Vobszyd34YVsoNcjBGsYQma4bGLQOKC6igFMBPTA9bENFkDHZxuoXuy3UNRxd8a0sfvf5RZ37EsheaZBu7qJTYJoQngbIdGDmlnaBsrcmJ1E5Xy0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 12:22:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 12:22:57 +0000
Subject: Re: [PATCH for-6.1?] iotest: Further enhance qemu-img-bitmaps
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210721204616.652155-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9a491820-706b-e902-fac4-ae1f8365b5ec@virtuozzo.com>
Date: Thu, 22 Jul 2021 15:22:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210721204616.652155-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0110.eurprd05.prod.outlook.com
 (2603:10a6:207:2::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM3PR05CA0110.eurprd05.prod.outlook.com (2603:10a6:207:2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 12:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d2cfb78-03df-4ff2-5370-08d94d0b707c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4215614ED10F5EDE7D1A841BC1E49@AM6PR08MB4215.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRT5aez64kJrgjvc8jsTnjbMyep3j6kCceS0mwOEzMQxIYTYDZ5H6QTRFRLtg1+aznKLRNCmUWnEJEyeaAIMKa4zd5qSxLPdanaZXz1QNg3oEI3SPH0wfHyE3rmbPk83SU389UMBJbTjjsyee2+TNRyoRvG/z1xCEyE5O7UlKg38qpZYWfz8u9w6FZWriII4u74W3KMfw3tA9qDfGd0A2wrLb8/+2XpGjufpyJRkSARh4bndZ21bXpsBT9P4jhSJFxSPxEGYH6Qu+KgrGVrDn1ONEvh/3OQyLtFdIO73ZgXZ7o5FnWgzhEoG6rOW7/CzZnSd/qF3XM2jvfwVqkdvgtg053SlVbZdTzfMQGlDNq3PJvol/awxhs6RH6kJPFKMnqjQbydf7AuJ783G3rs1zz8Zqg1HEK9U8DqLaGmm/zU1rzzw6pkyVs5N0HGcLvHtYs9LwfpKgc6xYMqKgidnBz1lsnZTPgHHfS5996f60nklTPTBcmH6grQCV4KWsIkpWOSw1KfI7eX2isRS5shQLvoeC8Cv5pm7fs2Ugq8WM8yKf/X5cgEg3UOLF4fdNI/sNBl+dCnU/odncithWMNL3U2ZXUDn5VQaeG+pGnBoN5PmcwDpMOpzlZrqmofqGHuwAqmxPl7l0LgJO68/q0QMJtx/FgKc0HWbEbV/LmqpZekr8qbf6hziWMzbuYq7b1Gr0WR2cj4p468UO6BTEbIiHLxBImnHzD4H2bwVFTgCb4Xhqh5veCE5BDyPWV7DmP+m5/AzvkEnDY09rUxa+p/Yqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39830400003)(4326008)(2906002)(956004)(316002)(478600001)(36756003)(8936002)(2616005)(86362001)(5660300002)(31696002)(16576012)(66946007)(66556008)(8676002)(6486002)(31686004)(38100700002)(26005)(186003)(52116002)(83380400001)(66476007)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnBLNTg1czRSYlRTYTZLcmxwZXhKVVVvSlBHNDZ1bDg5elc4Q2F4WmhjQnZn?=
 =?utf-8?B?Y284VkdjZjVZV2pNSUdpeXFkRGdXeDU5M2NYcEpwS1ljUVY2VmpqeTlOM0k2?=
 =?utf-8?B?MTQyM2cvQzRFeWFjL2hnTSsxbTBML2MyT2UrNFRITzBNbzNNT1R3Z3l6Vklt?=
 =?utf-8?B?MSt5Tzcyc3JISjg2M1A0K25rQ1dQWjNCQllBcy9nQkUvdXp4czNWNTRlM2NP?=
 =?utf-8?B?LzNVWFZtSEtEeFAwcU91dDNMdHVpaW1kcW0weXFjZFh0aHduTzZCYzBkdDVO?=
 =?utf-8?B?Zy8vbGRadENCN0NxNkZCU1FXRkxYSjk4elBTTE9lUS9RMVJmZTRMd29uNmt4?=
 =?utf-8?B?Z0phbGE4RFQ0MXZ4a1RwY0ZpR1VvYzNyZ0hJVVEwSk5QbXNlQnlReDkrS1d1?=
 =?utf-8?B?MHZ3TG4xOUFCRGhDbjNIOTNOdnpENHhBMHlyb1ozOHdoQjVyS1Z1aThKcDYx?=
 =?utf-8?B?S1VpTlk2a1BsYTY4REo2amdsTk5aZjhsTGtrNGowTnBvQ202VGc1UXRYaDJy?=
 =?utf-8?B?bEZPYXdMQUdvUXJBRE0zTzFKVjU5MkVSVys2WVJhZ1I4Z1ZlcHh6YlRiRHdN?=
 =?utf-8?B?NnBiWGc1cFNUUlFINTFrdTBIUU9NVytYZU5lQXdZMVBoVFhmbXcwckg5VHRn?=
 =?utf-8?B?MzBKbWFNQUFMZlhlRGtCb0V0SjZtSG5kcnNZMW44SmxqTG9NY3R4M21UNkZl?=
 =?utf-8?B?a0FlWUdYcGxmNlhvdWpSK1VRaGFsUXdlVkV6d2dhNllCQ09saWNZQlZIYUJt?=
 =?utf-8?B?TEVXSFhWNU1DeElvM0NCcUNMMHJIMm9VYlVod3BZQ2UzbDN2NkZ6azg3SUhq?=
 =?utf-8?B?K29QKzhJMFk0bis3US9oK2NWZWMzdG5OWFBPSGZQdTdSdzNxZTNrb1lPdGJN?=
 =?utf-8?B?dFBObTFvanRkWW9TYWxLcE5mM0FoUElqUEIzckVDRDhNSU5ieFVSOTlhWWFB?=
 =?utf-8?B?YVNlMWNNazFGQVhnbnF3MTJDOGNSeVJ6c1pPd1FDT2xRbERWWHNFSzRYU2dO?=
 =?utf-8?B?TFJRaFcvekMzM2FHdVhONDNMcWdycDdzM3lsS0NXNTlraVUxclJqN2FvOUNZ?=
 =?utf-8?B?eHRSVGsxRjFEYUtjRkxFZDk2a3BuTXFSVzFFUmpia0lRODZ1anEweGdNSTQ3?=
 =?utf-8?B?cUE3TE1XQXAybmNUNXBzOEtBOE9KL2NZMVdoZkVMVlRKYWlLNERtY3Awc3Bz?=
 =?utf-8?B?c2JxRStLWDl3T3FoVjEyTTNHYTZOQUVBalZMNkx4UUZhTUxlZFJmNjAxYyty?=
 =?utf-8?B?cVBPTEdnR1dTYWM1QWMrbVJTSHRsbEJ3endUT05rUVR2ZE5iZ3BBSU5uRjNJ?=
 =?utf-8?B?SGtoUkcwelNET0Z0VHc4dGVDR2syZElvaVRFMWg1L0VDT1RuSzBGcHJkbmt2?=
 =?utf-8?B?RUIrMWlxL09KakNlVlZWakdLcHJPTUtweS93ZC9SMWFNSXVEL1RhMjEvUzZm?=
 =?utf-8?B?d2hSVWVrdWpTd1FneGFxYkNSaVNYbXh5SW54Sk1UOU5IRnh3VVY0VWlvN2dD?=
 =?utf-8?B?OTNCeFFCcEZ4U3YwY1JENFRmUXN3NktQbXdPQW16K1FqdzBFUmczVmJHbmtq?=
 =?utf-8?B?Tk1MNkp6SGszWVRpNXJEcjFQcGwzLzd4Nk1pajhGc1hhTnpoeEkxakkrdEtv?=
 =?utf-8?B?dDN4cHRoRENMUlUybCt4VmtRcWg3cTBnQ0JJbm1IejgxNzdLaGErT1NWMHhu?=
 =?utf-8?B?eitEWUpLVU1zRnFScDFsUW1oMVMrWUNqR2o3amlzRHJuazFDbmRmdTlhM0lu?=
 =?utf-8?Q?Tp5cb7flEMhc88Ur/Am7v2aL5XkfKSXJA97/OOJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2cfb78-03df-4ff2-5370-08d94d0b707c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 12:22:57.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5dMQ6iemzaNysnkkn57MaNC0rWBH59HoKOAlYaDcWbTh03NmF2yz8iBFDVlViAWELFyAW5kTpMPppenSwLlQ39LO8BzXharV0gt735/knE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215
Received-SPF: pass client-ip=40.107.21.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

21.07.2021 23:46, Eric Blake wrote:
> Add a regression test to make sure we detect attempts to use 'qemu-img
> bitmap' to modify an in-use local file.
> 
> Suggested-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Sadly, this missed my bitmaps pull request today.  If there's any
> reason to respin that pull request, I'm inclined to add this in, as it
> just touches the iotests; otherwise, if it slips to 6.2 it's not too
> bad.
> 
>   tests/qemu-iotests/tests/qemu-img-bitmaps     | 6 ++++++
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 7a3fe8c3d37a..3b6fade11735 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -129,6 +129,12 @@ $QEMU_IMG map --output=json --image-opts \
>   $QEMU_IMG map --output=json --image-opts \
>       "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map
> 
> +echo
> +echo "=== bitmap command fails to modify image already in use ==="
> +echo
> +
> +$QEMU_IMG bitmap --add "$TEST_IMG" b4 2>&1 | _filter_testdir
> +
>   nbd_server_stop
> 
>   echo
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index e851f0320ecb..c6e12dd700aa 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -116,6 +116,11 @@ Format specific information:
>   { "start": 2097152, "length": 1048576, "depth": 0, "present": false, "zero": false, "data": false},
>   { "start": 3145728, "length": 7340032, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
> 
> +=== bitmap command fails to modify image already in use ===
> +
> +qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
> +Is another process using the image [TEST_DIR/t.qcow2]?
> +
>   === Check handling of inconsistent bitmap ===
> 
>   image: TEST_DIR/t.IMGFMT
> 


I'm not against, but why you decided to add such a test? Lock should work for any operation, what's the reason to check bitmaps separately? Or it was broken recently?

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

