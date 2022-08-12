Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55685912DF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:21:41 +0200 (CEST)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWTi-0003zt-Am
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMW4o-0006r5-P5; Fri, 12 Aug 2022 10:55:54 -0400
Received: from mail-vi1eur05on2134.outbound.protection.outlook.com
 ([40.107.21.134]:6624 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMW4l-0002ER-HA; Fri, 12 Aug 2022 10:55:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abyukPjDqvaIgDHC5Uy00z9crPiKJfBt5uCKsVZexnIBOkWZQZY4KgoCZu4YNSbrDcvAREXblWGRN4pCmeIaieHxEnCbx2JIYV0K4LXKQhh27TI32LM+Mwv3lSgk+A2bkEkM4LTZfkc8V/aqirbkHU1RkOGbADmypk7FIKt5HPywqbZJUNEIocP9Ka2s5amgo7hXl1oya5sFb8ccJZ9LOyViZVSeQY3ZJd2OgbqAbjCfTFSdENny1ZLHmx6RoVLOxR9zSFWwz0/KC8G0qbe1VxAQFfnOmgcA/dA9LqQ6NNeYSfHCHZTtD0JsVNP7DPFtCFT+9RpUEHJ75a01p07aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT8VonSz1Hz9TdRHXoJxR145h1l9sq0OcB3yPdd6Tms=;
 b=Ml5+/QAsoa4F+p+PlSy5NYA5DX2c4IpHy7qg9cRbjYaI+khXRu/GPwIkJqNDnQIuo8OLWcZt1tyqpoh2vNSeTW+UuEMU0ckcpbuVrcKwfMaKLEtGsmY6OWOsCbFWJZUGg9R6U9yAbOeX2v/0k31WsRKvirb57ydN8NLYjvoF3Hb9cKVOQ0jrsn0ep1248fBuvdEQZrq8i2Fa2w/lPIxZY66RmTNsSl7k55KkbotPhoS7uIEVfsF/J1NsqIxUugjfKvEaYb+MIkeRc/1aMg6rjtJUGEyd8F+F7kI9gYwiFYlaJjvWveuw/2x3sbyHQspZOIROt2j8+rYjomHhGcSgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT8VonSz1Hz9TdRHXoJxR145h1l9sq0OcB3yPdd6Tms=;
 b=l7OQbWSA8FIFZrHWzIdCoPx4kSFSvOvo15S4F+4MlKyUOyhBGQ8E0OglMgNVXyGa1GGB9uRPE4f1lQ2vDP4XbJOTIbPxp/lp4iYGDNsyJc14ldU+Rq99CopnSSpyIwojIfFVu+reqG8dy5HrbcMtCtOATZMeCl7N3NPNM9KNI2XrQmOXOFab/+OhsyWE2/OI1JOAy/BW+GI7lW7k5XPMvAVm7HU0380IwuKtgV90q6x9OcCZIzr5W1h/PFXF90FPiljrw9lYWGIrVXnRpvlVApB7CFUeAUuSRvDZQBD5pkFKuWml3BI50e+rsSfDTuktOB+0iZ4dGj7OPD+R/tjZfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VE1PR08MB5053.eurprd08.prod.outlook.com (2603:10a6:803:10e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 14:55:47 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:55:47 +0000
Message-ID: <39799895-142f-fbb1-d3b8-d9e1e51a0f06@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/8] parallels: Refactor the code of images checks and
 fix a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::27) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c5fae1-84a3-4eab-34c4-08da7c72bd79
X-MS-TrafficTypeDiagnostic: VE1PR08MB5053:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/F8ojL20LQnpbjS3sQL7IPX+H31Tsmguesg1MHbHOCxibFPPZZwhfHhsioIYlBRWpHKw8rKI43YxzmSQp1oUQRER6hHZ89s/oP/8UOFjYLAVEyO0zwjFtPePG0/xL/NiWVrwkDFukS6Gg52uUIEQl5mondCr+wcd7Vfj0davCjpaon37djclPyQu/IfstaIIWBQz3aweb4fQixQKneXNtwtzaJN14fkQEHAGc9iLqKneRJP5UCHZZZSvZZKxGlW9Jll3pQL6sehOrfusVLOIW/PTPcZ8Dy4/5zIGadFTIJXPmwPDI5n89smSDs4LbEhglMcYOpkLPYcbIXQyc8yKDZK13SxoccnHXHFNLsuNJCmUNVmhg4hDpF6/gjq8vX6p7uwhhwyQC1gvLfqfNrpMFAPPrGUdClcf9ZyqAR7ApAiga6hwL1ULpiYu0gSEnHSCIzFNNdFSnS3vEfH4Q6SUWDcNPICsyDXS8cHOkYWQh0B9/FzNOEOVIR53Md8TwycGec6rddtT+AnhO3ncxrYd2UP3agywc8k43d/zifEPXdEz83/JMBEQQWgiCNaI41xkB1W97ILg/GiYXS2rjxHgL9qFX09nTZfedPGZbe9Ds1NyniBLk56rXCNcHHlH2uwwLJOraN/quuuXPpWrktsu7/kcgNTXgoKW5GCJQL+fmKMzLD9/MG40TmRPh9aV2abWAhmaum8nndV+0ERmhpc3CAKO2Uv8ihULU20CTBwSe8Yaz3zdDl7Zds7AfYuYVcs/LawY3MKrIJUvc8/7KRCv279KDMe4Ah5BwJJHCXL6mYyx3THuFTva3oxgmd/6slmmT2kY5/chTqL8EFLhn4RZyx2WhTV86tth3KPS6Qt4tQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(2906002)(52116002)(36756003)(6512007)(186003)(31686004)(53546011)(26005)(83380400001)(41300700001)(2616005)(38100700002)(38350700002)(5660300002)(8936002)(478600001)(6506007)(4326008)(6486002)(86362001)(66476007)(316002)(66946007)(8676002)(31696002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDNFRXdIZEl3V0c4RmpHNFJqQjhVVHRpNXFFd1JFM1NpRjVsNndoSWwzMXNi?=
 =?utf-8?B?OUdvUlBvcXNMRFJZZDlTMWVwVkJrOEFXQyszV3liV1pzdjVHZmZPME1GbHpz?=
 =?utf-8?B?MEdKZlZEbU1qYmN6MHlaWFZBbGgvY292WU9uSytXSlZUK2ErQWpHWkxOeGpn?=
 =?utf-8?B?dmVsZXhjVDlLZmE3eHRVSDlCMDdwUXd6bTdUbDdrbWdBUzVUVi9MazZjQmpK?=
 =?utf-8?B?Mmh5alhKa2tGQW5SeC9MZ3k5WHJXVXJOT1dSUzdKb0Q3ais0UlJFUzhlcWhr?=
 =?utf-8?B?QUZSWTgxczlOcDIzWldXUnNkRndTSFVBTUo4cGMwcVdpRGM3TmJFNzVZYk1p?=
 =?utf-8?B?V2hWS2Z2RnhrZGNNM0pETlpVTkswNDd0NFE1N0JLSGh4MWdDMEFjZDRCN3U3?=
 =?utf-8?B?eStrbmYrbDY5NXUwYkVVWVJzWnhWbDNSVlpseVBNNXN1QkVHTWlrK1A5SGlT?=
 =?utf-8?B?eXUxQkVzRFdVNU5pWi8ySzZ0WHVSdkhQbktnTDM3ZXJnLzBFZWZNVDNTMXZS?=
 =?utf-8?B?dmdjTU1xaVVCWDBsT05PVitLN1VmaXhjNVZVeFVPeTVBdFFuMUJnSFBCNkhp?=
 =?utf-8?B?eVc3TWRXZEpKVEMzRDR1VTFvYkJXQ3hIeXZnZUorRGduT1FGeU5PMEVqMkQz?=
 =?utf-8?B?cXRicUlmQ1J2QnljRlpWd2p4MlREckNYN3ZBTGNOZnowMmtDcmd6WW9RclBH?=
 =?utf-8?B?Vkd4MGNZMTBTRWk3SGVUa25ZV2htckFZb3ZUbnhTcE1teDRHUlZFTzJ4VHVI?=
 =?utf-8?B?Qm0zTHg0UE5mS20rMzdiZVNMTVBabTc4UVpXQklJMlBXdjd3RVBnUU53ZmZK?=
 =?utf-8?B?eG1OY2FYR2V4bER1OEFuMzJ6UlQyZFBkd25rVUlTQnVVWklWZnBlTjhZNTZw?=
 =?utf-8?B?eDI2ZjNzWlU2UldIWmdvUktia0JFTGZhc2NrUWh5aFU1dWI3SzlpdmY4QVNO?=
 =?utf-8?B?RzFTNERzbzVYcTUxdXpWVVdwN3dZZUNvcHpWc0duaDQvbU1EWElvWkV3MnR6?=
 =?utf-8?B?NDBMa3EyeXVGd0pJWnIzT3I5VVVCMzQ5c3Y0eXBHV3dFUWk2SXdPemNYVUVR?=
 =?utf-8?B?Yk5DWDhMSm53ZWFrOXFkMG15bTNaVWJ1NlFQMStIKzZrZlEwcmtybkxCdHNm?=
 =?utf-8?B?N1o0SlR5dXlabzc3ZlpBUGpEd3JiVVVJYWxvS1I0WG41bHpqQ0JsdWhTZlZO?=
 =?utf-8?B?MTRTeUdpeFdJU3VCVnVFK1k2aFFvVTgzeFVadlVwRGNHUGh3NnBxVnFxam0x?=
 =?utf-8?B?QnVBaVE5MXFZMk92a2x5VlFtWENHV29Ibjd1ckpXYlB4SS9rL2RYbjZadWIx?=
 =?utf-8?B?ZVNpQ2dXcTc5M1VDYy9ONmU4N0Y1UmJ6Ni9UbUVsMEtDbmtlKzQ0N0o2QlZS?=
 =?utf-8?B?NWdaQlhnbFVJVXRoc0lDZlJWakZPT3ZmWTBTYUpWRTdzZXFqZTBJY1dBcUU0?=
 =?utf-8?B?SmVjemZwY2F6K1ZxMk1Sd2o5RWgvUFkvWGhyRkk2Z2NaUGl4cmU4RmQxNWRT?=
 =?utf-8?B?WVp4ejFERTBjUXNxVXVGbjkxTnd0MW9YZDUwTW9xOVNWV0IxeVRHNEFJTGl5?=
 =?utf-8?B?WFhpTVZQbHFJY3pmbkh3SEZrUXdveFNqMC9hWStURVVySk0xR0VQNWNGeThH?=
 =?utf-8?B?MHFwR0xOYmxOWm5tV2tMV2k2ckhwUXdLUjVwdlpidU1jYlRLTjBkMXRHSEFq?=
 =?utf-8?B?YTc1T2d1YTNSMjd3VE9nMUdheUx4SENlQlk2TW41QVdoODVrUlY0Wlp0NWJy?=
 =?utf-8?B?NTNLdW13c1VYKzZvYzZLV2hkSkRmQmNUNTEwNkhSbUs2TjlaK283MWtTa3Vl?=
 =?utf-8?B?anNlYTROWTJFemhkWlAxUTdaMTBsSGxMNTZDQ3Q0bk9keUgxWWF0OXNzYmt4?=
 =?utf-8?B?ZFNjcDJ0M3BocEVxbTlvSjgrL1ljcU1jcnd6TXpYV3F5UGd0WnUwNm5qUHFN?=
 =?utf-8?B?N0YxS05tRm5GQ3B2K2xZV0gvTjVLSlJRVkYzZ1lGRmJkK0YwTnJsbXNVY2No?=
 =?utf-8?B?d0NsdUhsR2dvQkt3MGthczZUa3U1Y1pHcnVVUEFkaWg3SDVLOFBTSWdpWDV0?=
 =?utf-8?B?eWJzMHY3MGVtM1hNUG9BYlZOUWRidmlwcXFZcDBNaFJuZTdMSHE5YVdJemo2?=
 =?utf-8?Q?IpgERV4hObIWnNOIlNZYZ1qeK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c5fae1-84a3-4eab-34c4-08da7c72bd79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:55:47.4549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRiP8kJBIQU28q0t97/pGPP/SlPLk0JZCBcWUryfYCCMrPTQ+9Kw/xLtmkTqoQMrXvzP1QjjmtA21exeeSa0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5053
Received-SPF: pass client-ip=40.107.21.134; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 11.08.2022 17:00, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for more clean code.
>
> Alexander Ivanov (8):
>    parallels: Out of image offset in BAT leads to image inflation
>    parallels: Move BAT entry setting to a separate function
>    parallels: Replace bdrv_co_pwrite_sync by bdrv_co_flush for BAT
>      flushing
>    parallels: Move check of unclean image to a separate function
>    parallels: Move check of cluster outside image to a separate function
>    parallels: Move check of leaks to a separate function
>    parallels: Move statistic collection to a separate function
>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>
>   block/parallels.c | 188 ++++++++++++++++++++++++++++++++--------------
>   1 file changed, 132 insertions(+), 56 deletions(-)
>
I believe that this series is ready to go once commit
messages will be improved.

Den

