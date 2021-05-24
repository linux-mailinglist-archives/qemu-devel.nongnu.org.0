Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D038E8B4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:26:39 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBXS-0000bd-Bh
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBVB-00061W-Ph; Mon, 24 May 2021 10:24:17 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:45830 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBV9-0000Ni-Ik; Mon, 24 May 2021 10:24:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMFFHPpXvAqiea3/iQRdeCl3XIXexmbE1az2+lPi0YCGGLbFU6ayA7CITlhlf6LsOlqqZOWcJR8XbjJg4s9yeIjO49h1P5EwcraM6NBqz7/hBhzWSZ4CBz1D/6GYxeMLvUSTGx52JucNVUm6j2eXe3AemRnJdaaslWc802mfL7pOs6+WEkDK6QKZjMLReY6dR4nRroHGhmH1juNpdncRjLua8dQXy3GfJDwHRHn6MdIoCcVZgo3LjTeyHAmcZs4nu+Um9SxSdswxY47fqPZ8bE1t5P3uRaanvsVpURFD++NDBP9WHJ7eyC3zgOPa5PGPwvzVh2cPJB24QwqmEtRysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIcL/Vq/pmyCs2elGnr2xV9ga5HWq5KJwqIsindePz4=;
 b=OyKbS7Y5BSUidyqs4q+PcahFuTL40oNB+fF8BGgJhpjY2ppPjTUsx2if/mpv7EKXRtrUeGtXH7mTuJkJxdTtQ0CDrm9t2c4gOpDkKDU638xgaLesDR9n8qpJICUJDpfTTxU14glQC1iqq3MC5qg7Sua5IQ8np6OMEX3F6lkDv2uBkT/BV7utLvp9MunrxQH4G8L2JWNvGxGB2VNU9OUdMX9NRRIf7iZ40ayB3YFQvajv13h5J2Ll0hbq/iUqiAJB+gtTmeAh9tnYzFuDJ37AUAjuJ1nKaJ9kzUF0gawFq2uUCcFh2P6Sm78PRWn1FswRaKF7eWtckGSW0AwE6WrCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIcL/Vq/pmyCs2elGnr2xV9ga5HWq5KJwqIsindePz4=;
 b=Md+AWeutCYmHVJbQwvu70ZNLlUA1gnFJucNVYAqihkUQckZSd7zoLm+QYD5mYugu/ze/PVxs3Up29DipHh3gdA/wm1dkfI4qs1jKpxIbtxLW5UdsWA/AWrhalg8XbxTq5la2nidITjA0DaV/aXm5WDFhJsLsYNfsq5LxvJaOOq4=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Mon, 24 May
 2021 14:24:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:24:10 +0000
Subject: Re: [PATCH v2 0/5] block permission updated follow-up
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8067c09b-3437-e70e-ac04-3893af6f1437@virtuozzo.com>
Date: Mon, 24 May 2021 17:24:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR3P189CA0080.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR3P189CA0080.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:24:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4094504b-9c6d-4e20-3e1e-08d91ebf98d9
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909DE12C24B210A875B98A5C1269@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LI9ee81YrwCy1cj1fMeLO70VjK7K/ormgK1NypfhNka6jmNEsYkP3S2aJFbfNsv1XU+ljL0iI6ibTvVB9boxOLheZgBdhBBfI37Hq57zMA8P8a3b5UPFd3vDf7F32yu764VXLFh/TZxqZE9xf3YyUxA5Gf0ymEpI42MvoYK4Rya4AJaJ7gtnzZURX879S8G0bUTHfo2mTzHP2xdcd0sDK4ajp7fyz3jIflafwgV4sPFI291PWPHrOcWka7PJQIajqDyh0Od6SRqWpR93kAuDZECh5oseyJ/CreZf7q9KSr8Smx5qI6JoPPLAMljYmj74AP4YxbzmeGltBhvKa4j+0kiuK3FQrfi9X/JuErx6R+CJXtGy9JgqPLoAtvPDL2X6NYrZevzA6VANEMd8iA4VYs/T4DKGThA/i0j8m/RjFXnGyQT4vuURbM5/oPHtMPV7Ql2/BAWo2OY3AEc1XrCSH242JzsIr9HaEWzB+7IQrMiYP4d3Qtxt9ajbKeGgyOKefnfqFlahRiOF+e1iPrQDN6fWCWvX7nRhgVyXg98qlX2j8A2O9yMGJWc3SEst/V412dv/TSwNAg7JofkUThc78d5nOBH9eRMY0fGzZ0wdZs/YO1v0RjTrCQT/Bf+e4gB2WBYw+i5lJNy7z86e3eMnIPJfcVU5IECNaawhO1Wr9cf/QdiTAerrQX7ELVNCFmaYl5hUscqBQLMF9G6KIfSEeeFJnyZhlXf8nwQEWHgDQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(26005)(6486002)(66476007)(15650500001)(66946007)(36756003)(66556008)(6916009)(2906002)(6666004)(38350700002)(38100700002)(52116002)(4326008)(16526019)(186003)(16576012)(2616005)(316002)(8936002)(5660300002)(4744005)(31686004)(86362001)(31696002)(8676002)(956004)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkZVOTNoYTR0SURUSkFzWjl1cnF4MXZ4aWdJZ1BCeHhEb0N2cC9DQ29IYnJh?=
 =?utf-8?B?S0RqQ2tYQk9XbVJZNXNhZmhqNGo2aDRCeW5SVXNjc3ZZRG9zVnpucUpXL294?=
 =?utf-8?B?Q21BVFlUbFo3QTFrSkFTLzlwamljek94Sng0eGpGVDNTUEtLbmkyT1RsZDNT?=
 =?utf-8?B?Vm5oL1luVWc5eEdlNXhOblFhdWZuWjA2djdUdjNQTUkrYkR1dWpDb1hQa0da?=
 =?utf-8?B?T3ZZbDZUMnF6aDBia0diay92SXU3dk1wcjBMenU5UHV5WmdmemhvRWFuaEhm?=
 =?utf-8?B?cDllQWVVRFErQmZmeHc4dW9EdkhUc3hLTTVlVVo4Si9vOGU2YVRxZUZHRm1N?=
 =?utf-8?B?YzVkWi93K0Q1S1AyZ3lNNlA3ZFA3aTNSbUZrRUgzNU00ckhwRUZOenRlSGtx?=
 =?utf-8?B?clJxRy9DSE9TOEwydnlRbmR4enVCaXVTTVNLOFdlUzZnODVkY051bDRlbURE?=
 =?utf-8?B?SVV5cUJsK3lkbW9YZzYrL0tnUlRkY29zYkpydUlDWDEvQzhJKzcvbGtyazFm?=
 =?utf-8?B?aFQyb3ZnS3NTb2EzdDFiRURFazBGNHU4aklVWWg5ZElNQnJKazRvK1RYYkE0?=
 =?utf-8?B?SGl4bnlOK3lvWVI4WVM5eUMvNlpHVVRrTzZQcWIrdXBHSDhrcUhiQTNaN01G?=
 =?utf-8?B?UjUvUWJkc3JwcmEyeVpTTzlta25ZREF6cWZzV3Y0cno5Ym96WDZqWkN2MjRk?=
 =?utf-8?B?RnF1NjFYTkVpL0NHbHFpaVFNaHF3WlNaTFkycEZSR0hvejlCV1RZaXhNQnpU?=
 =?utf-8?B?V2lkZ29wV05pQm9weXlBcG5jTEVqQlRGbnpXazN5ODgzaGxTWnZzbnN2aUdu?=
 =?utf-8?B?cjBYRlZMOVNZV21PV2FyZTM1NTBhZEtleE1jcDNzUFJUUVhRUEhRTlBMZUpi?=
 =?utf-8?B?bWZ1VzJQU0xaT09DdjhZSVJMWjhnS3FiNWN5Y3ZPUXZxMlBub1lEYnF2NXhQ?=
 =?utf-8?B?NGdwdFMzdTJ0ZzFIaXB5UGV6MkNOdkxlcGQrZGhMNG03UXZWTEtwT1NqeHc3?=
 =?utf-8?B?a3ozR3B1SG05ZlFLVnNyVVFMQlcvZ1B2VWhLNm1XcUdxb1dFYUxRaWxoWnh2?=
 =?utf-8?B?S1pGOGwzVnhIbDdJdlcrUFEyclN5V0s2d0ZLRWZTK1kvL1BLdERGSWNUUHpx?=
 =?utf-8?B?TUl4UERuSHd2RUdhM0NOZk9LUnZOQ0Q2V3VBWllFcGVmV1YvUXdTWUdUZVJo?=
 =?utf-8?B?dTBCYytWRVVmTHk0L0RaNGZXOFFvUmVVSFU0VVFqN05nOHBBTHRyZ1hzbi9G?=
 =?utf-8?B?KzhsMlNGRHhZdVc2UmxUdE9GT0RYWmQ5eUc0U3FoMW11ejdyd2JidkZ3M2t6?=
 =?utf-8?B?T2VVZkxJeFFJSDZybW44OVZDaTBtOXVYOTRTS3pZRGg2NWtMenpmdSt4VHA5?=
 =?utf-8?B?aHBwcmUzTGtza1JDemFta1QzT091QjRPWFBoTiswaEJjaGFNN2F1TWw3Kzl6?=
 =?utf-8?B?TkMwS0RyQ2kvbGJsVCtyV3MvVSszeUJNczM4b3BwcDA2OUtqVjV4V01RblFM?=
 =?utf-8?B?U242OWhnbVRIZjBiTDhqS3ZKZWdOeHZ5Z0p4cUh0dWVXMzNzYSt2YVZBWHBM?=
 =?utf-8?B?c01iVzNiMXlDUFhtcHhMR2V5eUFvdHhwZlBZSVF6WFUwNVhpSmJDRlFIZTdQ?=
 =?utf-8?B?Umk0T05rY05ZZXNxblFyZWprL3BLOE5YSHp6UTdlNDRVQ1l2MkNIOFBYUUkr?=
 =?utf-8?B?Z1BRNVlrNEZBNzZnOEF2bDk0b3R2M2o2cVZrUnVZRFJFZWtabEtRbjZWTStu?=
 =?utf-8?Q?35E2onQCV4XROGJKkBbdg2eiHpKGDH5SxmuJIVE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4094504b-9c6d-4e20-3e1e-08d91ebf98d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:24:10.2671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hv2mO/QudHau+LxHz1pzWMV0JPN9S+2ZJuloMqhPvmQZT9qV2q/dy0E1dPSGMVqXunG33R6uSd3MU2VvlMLeGbw8NNuvKOQIQLQBO5ORWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Ping. Now based on master

04.05.2021 12:45, Vladimir Sementsov-Ogievskiy wrote:
> v2: rebased on Kevin's "[PATCH 0/2] block: Fix Transaction leaks"
> 1: add assertions and drop extra declaration
> 2: add Alberto's r-b
> 3: improve commit message
> 
> Based-on: <20210503110555.24001-1-kwolf@redhat.com>
> 
> Vladimir Sementsov-Ogievskiy (5):
>    block: document child argument of bdrv_attach_child_common()
>    block-backend: improve blk_root_get_parent_desc()
>    block: improve bdrv_child_get_parent_desc()
>    block: simplify bdrv_child_user_desc()
>    block: improve permission conflict error message
> 
>   block.c                               | 61 +++++++++++++++++----------
>   block/block-backend.c                 |  9 ++--
>   tests/qemu-iotests/283.out            |  2 +-
>   tests/qemu-iotests/307.out            |  2 +-
>   tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>   5 files changed, 46 insertions(+), 30 deletions(-)
> 


-- 
Best regards,
Vladimir

