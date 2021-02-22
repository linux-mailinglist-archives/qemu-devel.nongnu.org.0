Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB4322171
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:33:43 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIpq-0008BN-3C
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEInT-0007XF-3g; Mon, 22 Feb 2021 16:31:15 -0500
Received: from mail-eopbgr140093.outbound.protection.outlook.com
 ([40.107.14.93]:55521 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEInI-0001Q5-LF; Mon, 22 Feb 2021 16:31:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui7SURkl8mBrU2gSBCmmzusK+VEPHOFof0F3tpg1qLbrEpPRRxvS1tAp70ylLLfsD59i4+pP1xFfuwPZi6wJhXEhu6A3+h3c1xmp/IyTZ/gXP1IsTaf35/SVEYLpUNDpoPZzkzn1qSxzdmqnXV6YLIcf+HWKK9shwtQhzIc61ceJuQN+XeDPBodngK1TpgyGtsr4A6EcAPW3qZss6XCXMEXkVHu/1/xa5K1OyUem6Eq4hf8bTIFpqAaiIHKWclWNeNnnlsssJEuC7quWT+YEUnBhXvQzTJ1hX4ODoY3hSY7m34d3R8mlke2NI9U+bWZiZGKUHXh0fXZURnOZlGhx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rWiKUAtCjJWN30GIZrP6OFTGQimtB54b4N5S4vulOI=;
 b=N/TnUKgaDBDZVWLpPTqHAhbf3DA621uWuKB/6Ws2dcuZNxlCVRa18u9pzsfiBMNXo4o6/yiWhRNdcySzu1stIvii88abOBT+kMbIpNMtQC0i7v83Vkt23BBgYVuITVCtiAil2O/FP+OIfLUWp59FI6SfxWChDAHTffv//3h6/Ttugih6i5qH+T6lkKDvn1Tmq+arL2oH59zaMhywft59fw+ZwhYph5Q3JG8NIUkc8yccUPynoibd6cu5r+DfwAZd3emdG0Tdx2jC8cNGEqTKNorYskrcyqYlONwYD5I6/YUJmVFQTE7Nskpx8q0u2lBp6NKv7t+s7wtRGes1dBbNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rWiKUAtCjJWN30GIZrP6OFTGQimtB54b4N5S4vulOI=;
 b=r5ol0yXqRJxtnZb0s8LbgQBzmiWkOXYep17KpcvBrTYu8+aWcoIxZSokmByoTKhWPnD1hrqRL0GSzvCdtaC7Q1eUHE96Df0vZMS+bhqTwuwqNY0aONRxhAHbZc9s+2tOiQPUa/H/eBWM87tAJ6voV7hQNm64Y89u32BLBqO6Txg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 21:30:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 21:30:55 +0000
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: What prevents discarding a cluster during rewrite?
Message-ID: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
Date: Tue, 23 Feb 2021 00:30:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.196]
X-ClientProxiedBy: AM3PR05CA0103.eurprd05.prod.outlook.com
 (2603:10a6:207:1::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.196) by
 AM3PR05CA0103.eurprd05.prod.outlook.com (2603:10a6:207:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 21:30:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3409d13e-fab8-42a6-4936-08d8d77922ca
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362139BDA5C102E9322B6C04C1819@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3Lzt59emPC6NLKFgeDdU/p+noMYN/UNC/awrSt9jVDl6eRTTDF1NR51jwdJkhlN5LFOxkP1ojhx3uslo0w9IcWv2kpUc8ZeQJpHBVcYGgXndHkL7i3XGFXE4OW53qbV3/iMGalBbwshccrOC/qV6hT8Ks9CblmKChHNwn+c2Z3qsdPRG8fpw0GSnMslOVF+avsTlrrNlTxv77hHSE4FKyR8PN8r+vM8bANaJ5jkmVtmTPrFWyEZ0g0I56HxJKN3IgebTV8Swbr0M7Cdnd2yFXWekfg7KlAdcAbkR3GeGhWcG3kxGKxN8KeWQvNxMQF17DMaexatR7PGg0qeF5m+3DpFaYE7/FTtyojWOLWNTFzqutLNvT50VEPA9Q0zjp67JQ12D050is8nFBrNWktPFfNjmthHCyizkBU/FtHuoOc5KB/rIaLJqejWbG/fRAX0X2lpqHXL7d6K6w8e6ScHaP7ouBtSOTa+pGbOTzkmsZs0s8sW0fzanPw6PbXOemMvYLr/RB3Pl9d1U4rFdao/stUkUtR7VwsnMlLkwHPj4MsyATOkJG0I9w6cZesj3xk6Mny90DyY5+K8cJmWky10DQVhXe4H5V8MuiAgSQYLyJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(396003)(376002)(956004)(86362001)(5660300002)(2616005)(26005)(31696002)(2906002)(16526019)(478600001)(66946007)(66476007)(8936002)(54906003)(316002)(52116002)(4326008)(186003)(6916009)(8676002)(31686004)(16576012)(6486002)(36756003)(83380400001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1MvaUhnQXpYckpkWVJVV21hMEk3MTNQaFNTNG5SMEFBT1BMVWJEak55YzlG?=
 =?utf-8?B?Vit4NnNSaUtzSENsMUtZWkdic1JyK3AwUzFtNnpTR2FyMGVnbTdLakI3aXFs?=
 =?utf-8?B?REdjMlUwL25FM091RlMycmxQUDZSNm9BVEFJdFpaOG01TU5sZHk2bUEyTzc4?=
 =?utf-8?B?Qkh3azAvVHp6eWNHL3lYNWNtTVdUalE0RmF1cndSS3BxOGdLMmlTQ09OajlS?=
 =?utf-8?B?T2dBc0FwbVY5WElvR09DRU90a0h3UHZManNxNFVGNnZwMmJOL2prN1lWTGM2?=
 =?utf-8?B?WGdyejJCZ2UzTkZLZE04cE1QMGJITWFyUHFkQ041ZjZGekhrNGNpbkMydyt3?=
 =?utf-8?B?MHNMT1NFWGpyV1R0bWkveEhZaVdORkV6bno1T29GQzlsTWVRdFYvUW4xYXBQ?=
 =?utf-8?B?VmRYQzQ2RkIvOU4vN3lDT09UTkF5NEw3bVVvN1h0MlpYbXE3N2tMcEFsaXo5?=
 =?utf-8?B?MHNOUFhtb01RSjFveFdvcHAvNjZiWURVU3Zuaml0a2VqbzhsNjBaK3lJY1pM?=
 =?utf-8?B?TG8wL2hxOWp2TjVZQzYvZ3V5ZlZYVnE1QkdIV21MSFdPVG1BNDFVRmVBK0ti?=
 =?utf-8?B?NEJ3UmMyeUFGOUZFM3pqRXlIeng0UkxjczhITTZSdzJtKzZTN0s1akdTelFY?=
 =?utf-8?B?QURtYlZTVXQ1SW0vQmdYWkRGTi96MklDcVN6RGIwK2lkNXZvQUc5eUx6b3F5?=
 =?utf-8?B?ams4TlFoZGpMMm5hMzUzWnFRU01vSi9iekJVbWFOdXFUV1puNmNSM3QvZDFQ?=
 =?utf-8?B?MXBRNWJZWWw4bkU4RSt6c3FlRjVjKzU4a016ZVR6dWlJSkhZUkpDVldtalhq?=
 =?utf-8?B?aW5FRTBGcHdNNG1hMHhxNlJaT2xyUU9KaVdjYmd0ZmZXdnByckhLZk5Rbjk2?=
 =?utf-8?B?eWJ0ci9WdVRYdDBqcFh0VUNXRCtXT2xPd1liaGpmd3ovU3ZFUC9kc3gySTFs?=
 =?utf-8?B?RnpJZGhadlkyK0F2bGVISUE4TTFTVDM3S21GUmpIZUxZcFl2UFc4M1lGSGJF?=
 =?utf-8?B?dXBLWHZBZWZPRlJLSlgrRXJjR3Q4T2dlbm52d2h2V0Z1OGxVenVTWU42WGhV?=
 =?utf-8?B?OC9BUWZzS2hIQ2hnTjZCRENQRFl5Qk9ySnYranFVcE9nS2IrU0FlWTJzaFZS?=
 =?utf-8?B?c2lHdnd1RVhvd3FrbnYyNXA2TUJkZzRjNTRnNSt1UFRMSjRzU2w0TnhuVDhP?=
 =?utf-8?B?MmRTZ21aK1IxN2tweUtpVjJkdU5Bem9KNlF1bEFUMU1NSlFrMis0V0xMMjlT?=
 =?utf-8?B?cDRxYlE3WnhVZ1U5MmFxeUpSYS94SnMwMmx1L2dVMVlERW5tbC80YnV3WEJH?=
 =?utf-8?B?bVUzbWFkUURRci9MdjhRVFp6NENxY2hXZncvQkNTWUhKdEU2b3FUL3hpcngy?=
 =?utf-8?B?TnF3UkNlQnhXRHhhR3NrUkpsSzUzdnRsUjU0UHE3aDMwYkpUYWhNOEx4R2h4?=
 =?utf-8?B?bXlPWEE2UXBVNWZnZDdqdkFod1oram5NZmxkSXMzL2lNMm55N3FNT0d1NUdz?=
 =?utf-8?B?Wjg1UUIzYjhLN2dRRTBGeUkwbktmdkx4eXRUY3dhb1pEcGNNRHRtMVc3bzJV?=
 =?utf-8?B?ajhrVTV2dEZaN0FqTGZQVU9TSHU0ckk2dnpxQzE3OFdweGRZNExmWHBZMS8y?=
 =?utf-8?B?bytocHRKbzNyR2R6MWFlMmVDTnRaWEh5Wk1GNGdjQ1dFQlh4UUxhaFhqeWpk?=
 =?utf-8?B?VVJsWGFrRmZzdmlLZDVXSElNL1VsWFhZOXhrTDZiLzVub0xOSFBBMml4Z2dY?=
 =?utf-8?Q?NL9Kw/+KoAWZ2bYxw8X1G16WMf/oIeviUUWM30y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3409d13e-fab8-42a6-4936-08d8d77922ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 21:30:55.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKDvT5gu+3Kj5m4YgnHVfhxND6rrhSmv71A+3MkTd+K7FNqRJgPMjuw59WeiDIzwZIcTxOKYTCaeVXTGTUrJLND2GwXxmpy3ij7Eqy5zNig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.14.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi all!

Thinking of how to prevent dereferencing to zero (and discard) of host cluster during flush of compressed cache (which I'm working on now), I have a question.. What prevents it for normal writes?

A simple interactive qemu-io session on master branch:

./qemu-img create -f qcow2 x 1M

[root@kvm build]# ./qemu-io blkdebug::x


do initial write:

qemu-io> write -P 1 0 64K
wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.12 sec (556.453 KiB/sec and 8.6946 ops/sec)


rewrite, and break before write (assume long write by fs or hardware for some reason)

qemu-io> break write_aio A
qemu-io> aio_write -P 2 0 64K
blkdebug: Suspended request 'A'


OK, we stopped before write. Everything is already allocated on initial write, mutex now resumed.. And suddenly we do discard:

qemu-io> discard 0 64K
discard 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (146.034 MiB/sec and 2336.5414 ops/sec)


Now, start another write, to another place.. But it will allocate same host cluster!!!

qemu-io> write -P 3 128K 64K
wrote 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.08 sec (787.122 KiB/sec and 12.2988 ops/sec)

Check it:

qemu-io> read -P 3 128K 64K
read 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.00 sec (188.238 MiB/sec and 3011.8033 ops/sec)


resume our old write:

qemu-io> resume A
blkdebug: Resuming request 'A'
qemu-io> wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 0:05:07.10 (213.400382 bytes/sec and 0.0033 ops/sec)


of course it doesn't influence first cluster, as it is discarded:

qemu-io> read -P 2 0 64K
Pattern verification failed at offset 0, 65536 bytes
read 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (726.246 MiB/sec and 11619.9352 ops/sec)
qemu-io> read -P 0 0 64K
read 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (632.348 MiB/sec and 10117.5661 ops/sec)


But in 3rd cluster data is corrupted now:

qemu-io> read -P 3 128K 64K
Pattern verification failed at offset 131072, 65536 bytes
read 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.00 sec (163.922 MiB/sec and 2622.7444 ops/sec)
qemu-io> read -P 2 128K 64K
read 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.00 sec (257.058 MiB/sec and 4112.9245 ops/sec


So, that's a classical use-after-free... For user it looks like racy write/discard to one cluster may corrupt another cluster... It may be even worse, if use-after-free corrupts metadata.

Note, that initial write is significant, as when we do allocate cluster we write L2 entry after data write (as I understand), so the race doesn't happen. But, if consider compressed writes, they allocate everything before write.. Let's check:

[root@kvm build]# ./qemu-img create -f qcow2 x 1M; ./qemu-io blkdebug::x
Formatting 'x', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 lazy_refcounts=off refcount_bits=16
qemu-io> break write_compressed A
qemu-io> aio_write -c -P 1 0 64K
qemu-io> compressed: 327680 79
blkdebug: Suspended request 'A'

qemu-io> discard 0 64K
discarded: 327680
discard 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.01 sec (7.102 MiB/sec and 113.6297 ops/sec)
qemu-io> write -P 3 128K 64K
normal cluster alloc: 327680
wrote 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.06 sec (1.005 MiB/sec and 16.0774 ops/sec)
qemu-io> resume A
blkdebug: Resuming request 'A'
qemu-io> wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 0:00:15.90 (4.026 KiB/sec and 0.0629 ops/sec)

qemu-io> read -P 3 128K 64K
Pattern verification failed at offset 131072, 65536 bytes
read 65536/65536 bytes at offset 131072
64 KiB, 1 ops; 00.00 sec (237.791 MiB/sec and 3804.6539 ops/sec)


(strange, but seems it didn't fail several times for me.. But now it fails several times... Anyway, it's all not good).


-- 
Best regards,
Vladimir

