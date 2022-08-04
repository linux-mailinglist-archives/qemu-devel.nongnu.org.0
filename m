Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B6589E68
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:11:08 +0200 (CEST)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcV6-0004v5-89
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcQj-00009y-LI
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:06:33 -0400
Received: from mail-he1eur02on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::715]:45028
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcQf-0004fW-P2
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:06:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIuQIBsuHVdQft2ic2jgL/PbqLunGBCmBaJ6RLwPd6KkobqcfjRWJuR151npMv0zvdKFNmLdWlNgXjahcESN8LPsJ55EFM8huOsE+oyhgnrM1BZFl0ymPGZjPayQeV1QwUYsVtpO9xyoHa7LZGLNh/eyXNU7vLzPqhUNJzCD/jwkxxganNuOCAPH1jLi4Bm9tl/IXGGmxUyEhExfuJVKP9v3ibBzaROKO/sPkCOJbTjFKG3Hr9sTm7RxOT0r0uW3Te2K9iX5LsoFy1cSzrwij8TeSMewTJuW149nZ6g90TkqWt3AG8/3plfirfRnzD//XNDPDYzGj23xWomy7TD4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QoJeemvE0wJHZaO04xQcUqGeLK56a88z6ZL3SFWfJc=;
 b=lPQKH7HD39TEHMbht6yZ/ngx8jh95gVQVUiCJtyI4IW2+a0lTnmjU6Vq3vfBP8o7apFmKmy5iq17w6i+qVuT3XemwJPdDs//2yUlqVxV/ypeC57NqFDC1C1TxvLBsCX3cn7H9lrJPgQRNcHrR7bY3+vTiaHObHDcskWQaiKxs3vhYqieTVEJVRYl8+imeKVKcbc+L9uxJk/aBjss+6uav1LnmWqMIuCHq5WPC0xs7GDYYYZlREd7PpIxJ/ikcBlFw8zuwRpDwoEunku6DH7E+WGQaN3up24uthfQqix27NWF3ETGA7Q3YfZs81kQnDzxZW3XbOP/SbJ5JxiBf/cOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QoJeemvE0wJHZaO04xQcUqGeLK56a88z6ZL3SFWfJc=;
 b=dtr2Rx/5g/a+fYbfaCYkXNvv1Moc7k5hyMzrc0Z6bbdLRn9b98MhpV+SSN1aH9RBCzgk8w5VUkzl+Rr1zQrhQC9SK54wdPoInWldo6RC2Vz1SbSn/cixFHjuUjuUH6iE7z0dkO44Tl+7AvwUJeGfPgGGRlpF2Tg1Jf7XNSCqBBzMRR6yHd30fGHW/PCXIb5l0Rd4E/ExPMibdzToVGkVkiuo2VN7X+wD7HNjuJfuACP5/8138Q5PKN2NtIlTPFgAzWnZ9FJ9pF/BpMzKmoRa9xrrHVlrth9fDqAD4TRtXlK2zRaIVTL4moHJnc5fKkz3gxHaMi51SFnZCPGee2uj7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB7046.eurprd08.prod.outlook.com (2603:10a6:20b:346::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 15:01:24 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:01:24 +0000
Message-ID: <ee4ed965-74a2-97af-bb60-91c1f97ab361@virtuozzo.com>
Date: Thu, 4 Aug 2022 17:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Check and repair duplicated clusters in parallels
 images
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c42986-f032-4fea-b0d8-08da762a32e6
X-MS-TrafficTypeDiagnostic: AS8PR08MB7046:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83UiwTd/e1y4t/lUmJMCHaLJuA7Qtmir7reBNJmNO/3k2KuPeWRs7i5HBaavcrUSorpNbp9mkIuRPLQku5/7/+Ax+403Twc/0vO0IPyIYuPqwAc+aSHoOLNT9Lkaec7jJsmYXdutcNayD/ZBUtHe02Pd+YbGOlV9kxLPiVLiRIGxikKTMrZhtl/gFviD2gqAr6dGsOzYm5TQH+pIdMMO87yZBE/RmXr+eDgtlfhcrQSb/Qx4kiv1UtEnaEqvtJcICw3GigGqiNTqVGxAptVXIs8Y/H9gCKsAePLHQpa5Dbc6cPeGhdXuAQkhf+oUC4zWEUZsd23B91+/wMGUcL4x8dYinJyhQJ4Zz4Y8v8mZ7dZYsjwaceNWIcTJ7yMH7wVbtJnlXix/q3qRf8cYLJytIs8n17X9gyzWGhEts+kT5dbL9viWKrBBFm+Z4nd9MKjNA9FL4voas3ugBIsSKEfNONBWOJFjCGabXw1pdP60oT1t0abJCZFEZHyTc+Z8w4FkmTtnDy0RNRN7dsPO00phhh1L7yb5JgQwaENouYZsLUfT0aemfvYVf33bv6WN8j9esOaYvPdXLCW7Pyqa1pdXi3Yg10RCZwo1V1iiht6awRc9O/xg/XRs4BnvMH1PnBuAK7hFPOozydymxacKvspdkXCifKyztrLZjX/YXnMBqymfMUqvRzHgIokHiysreLsda+SB7PxCgm6MLZORuSKLRNwjZpyOiixsCaduW1OrLYAco83IJsmTrJKB6w1hd53gtZyPRh9EUlwoSqoUlYbesV8V+0J96Wdom5FyDY8NS7ZjOPyRYnFRBfnJxGaXvpOKtOk19zxwXVSSoCGaHqWw9ROelvqC+99jaM/yDcULBMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(6512007)(86362001)(31696002)(38100700002)(38350700002)(26005)(8936002)(316002)(2906002)(66946007)(8676002)(5660300002)(2616005)(186003)(83380400001)(478600001)(66556008)(6486002)(41300700001)(6506007)(53546011)(52116002)(66476007)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpCbmRVeUFSamVSK2lSaXA4R1paU0ZJYWdvRUdGUlFrSVNsY0NaYmxRQ09X?=
 =?utf-8?B?Qk1jSDhqdXFEZjBWS0ZTbWVEbmlHRjJoTU9IcEt3bWVXTk1wbVdUdlhlUW8r?=
 =?utf-8?B?SVJtbitEYVNYMUJxZEU1TVdaVkhHOFJiVVNEMDA0VCtlem05ci9IekFYZU5i?=
 =?utf-8?B?UDJ0aEVZb0EyNW1lMHloekNlN3d2Vmh6azZ6bk0zSDBuNVhpR0piZDN3SGFi?=
 =?utf-8?B?UFlmMVJ1bTNHL0pleUhraW9CYmVZOEQ4NVBzLzY1YWZDWnQwbW04c3JOdURy?=
 =?utf-8?B?UFAxZ1dvdmVSaUJVWVgxSVhndzk4MmR2cUpPRjh4bjE4REQvUUxuU0RDRUVI?=
 =?utf-8?B?TVk4ZzNTNkhlb21ieDkrL1BrbktLSVFFT096Wm1yUmYwVE9DZTU5NEljWTBu?=
 =?utf-8?B?WHJKaVpJNVZCNWNyU3pMSUc3Sm5sbnpBOTNrVlc5Vm1TQzM0WWhnUWR5bWow?=
 =?utf-8?B?aEQrcm1RR1IyQlV0clg0MUN2anRTS2VZemFzYjFwVWVnTGtVV0d4R2llNDVi?=
 =?utf-8?B?UlNSRFdydHZpakExQWdXWGs3ZlVsZ1JPdDU5THdqWm8vK1NhMURGM1hKN01a?=
 =?utf-8?B?YWFDbjIyRGI1Q0dlTGRVQ3h2alBEQjJjVm10TFlGaUMxMTU3RHF2WUpaUHc3?=
 =?utf-8?B?UTBHU2x3STNRa1o1Q3I1TzJNTU5LcDc3MWVaMXpkUktKUVR3N3dqZy9wdVBz?=
 =?utf-8?B?anpwUTFhYno0bUR2WjBGOTRwbTdNa2I3SmRiY0pvQ1FCRXhtTkVUVVlEUjA4?=
 =?utf-8?B?NFIzQnVDNTFEZlErQUZwMWVKRmJpZG1IZlFXeWNVeUV3K3VISTlPcUlibC9i?=
 =?utf-8?B?VmxPTEMzWnFDeGtLZlkxNkhwN05wUXBmcTdHKzBQSmhOSEJDVmlVYlAxNFg4?=
 =?utf-8?B?U09CRk4yV3VMN1djdlczSzJDT0I0bDFhby9IcS9DSk5leDQ1VkpyeHdUQnFi?=
 =?utf-8?B?Y09Nd0ZyVFRTdVFQNVRDV3ZOQmZFaTZlYWJZMGhsbC9HTkFCbmRkWmlkOEFL?=
 =?utf-8?B?Ty9xalNNTzNJYW95bURCWDBWUjV2aVJ6aGJHVGR6VXlKaXUzbFlEMUNPSWJE?=
 =?utf-8?B?ZXRqZFdDSUdHZ2FSQk1ld3VyWFN0K21uTkFIQmZleTBkalRvM3BxV1grZ3dC?=
 =?utf-8?B?OTlmMWZSYUprcXNrSjFKN3FlRnV3VEo1V01sNzh1RWZYb2loeDRBUUNCRnFK?=
 =?utf-8?B?S0phSWM1Kyt0WkQ1OHNuVUhyZjMwL3cvTlhJQ2VPRnpEeDFZeDdpc09SbHZ1?=
 =?utf-8?B?dVhqNU1MT21IQ1Z1QVdnVklHWFhtbnN0ODF4dWlxa1RuN3I4a2doYUMrQWhs?=
 =?utf-8?B?VHBGR01Ld0F6dnhIYzZJNVg5SnpZVUFyWkJBYjY0UGQvSjZFTDNDb3ZXMVc5?=
 =?utf-8?B?dGxkak1FSUhFdk43bmxNaE83ZFZBSEE0dE9wZnU0VzhVbU1xQVBQTUR3MVlY?=
 =?utf-8?B?WjAxdTJVeUtyQ0s0S3g4MWM0US9Yck9xOC96SzRzSFo0TndsMUpxaWtyclhS?=
 =?utf-8?B?RVk2eEMxTWJySFpPVnFxaGUyaURoSVlpNU5KZksrSGtFVkZUdDlSK1c4eVdU?=
 =?utf-8?B?VEJVZFBpcVVJK2pjanFQKzBKc1hxdVJDUzFZRWpJb1ora3BPdmRWemFnVUQ3?=
 =?utf-8?B?UUNjQWdvamFIQU5xNXpqMFFxMFhxVXErQVZRWXpldHFhYjhHWnJCMmpSRGNh?=
 =?utf-8?B?YWZrcVVZRkN4MktvZ1BtcmoyQW1wNThURk5XRHRacW5yeVhkZzNlSUR1cG9i?=
 =?utf-8?B?cWxFWHhJcVh3bjRlL05EU0pwRHlCTGNjTEF1QVg4Qkd2bEJtSWNrREVOOXRF?=
 =?utf-8?B?WFh6YTZ6SVExbXVzb01kRE5nVUxaeFB6L3hYQ0pJUnQycWJ0SVlGS1lZSEZI?=
 =?utf-8?B?dkJ5emV1U1R6Z2piZFNza28vb2VTMnNiWXVLbnZoQ2QrOCtvTFdNR0lwbXdR?=
 =?utf-8?B?aWIyR0VPT0h2YVkzMGFiNWwvVlV4ZEtvNHJSU0xvRkZLck5nY29jTXRGUWhn?=
 =?utf-8?B?bHNNOHpQTmFTSVQ4dkQrM2dUcXB4SU1UbDZ3UW5Sa0dDTWN0QUpIU1VLMWdO?=
 =?utf-8?B?akJGcjNzU0c3TE1WdzYxKzBKMjR3VjlmK2FKR21mdmhCVjdFSlVQVzRkMjdi?=
 =?utf-8?Q?4ige1hhzo1CS5ZauKo30Pi3C9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c42986-f032-4fea-b0d8-08da762a32e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:01:24.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnPRDMcHRae4wpd7M2DR/JhZr7gADHwt6ctee5yyjbGf9H1rCvQinEem+mMcGc5Sy5DtgzzLdxiqiBKUULLg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7046
Received-SPF: pass client-ip=2a01:111:f400:fe05::715;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04.08.2022 16:51, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
> Parallels image file can be corrupted this way: two guest memory areas
> refer to the same host memory area (duplicated offsets in BAT).
> qemu-img check copies data from duplicated cluster to the new cluster and
> writes new corresponding offset to BAT instead of duplicated one.
>
> Test 314 uses sample corrupted image parallels-2-duplicated-cluster.bz2.
> Reading from duplicated offset and from original offset returns the same
> data. After repairing changing either of these blocks of data
> does not affect another one.
>
> Alexander Ivanov (3):
>    parallels: Add checking and repairing duplicate offsets in BAT
>    parallels: Let duplicates repairing pass without unwanted messages
>    iotests, parallels: Add a test for duplicated clusters
>
>   block/parallels.c                             | 112 ++++++++++++++++--
>   tests/qemu-iotests/314                        |  88 ++++++++++++++
>   tests/qemu-iotests/314.out                    |  36 ++++++
>   .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
>   4 files changed, 227 insertions(+), 9 deletions(-)
>   create mode 100755 tests/qemu-iotests/314
>   create mode 100644 tests/qemu-iotests/314.out
>   create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
>
the series itself should be marked as v2 indicating that this is based on
the original work of Natalia. Natalia should be in CC list.

Also list of CC persons is too small, pls run

iris ~/src/qemu $ ./scripts/get_maintainer.pl 
0001-parallels-Add-checking-and-repairing-duplicate-offse.patch
Stefan Hajnoczi <stefanha@redhat.com> (supporter:parallels)
"Denis V. Lunev" <den@openvz.org> (supporter:parallels)
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> 
(supporter:parallels)
Kevin Wolf <kwolf@redhat.com> (supporter:Block layer core)
Hanna Reitz <hreitz@redhat.com> (supporter:Block layer core)
qemu-block@nongnu.org (open list:parallels)
qemu-devel@nongnu.org (open list:All patches CC here)
iris ~/src/qemu $

Additionally, you should list of changes from previous version
at least in the main message.

