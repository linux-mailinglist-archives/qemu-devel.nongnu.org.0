Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1F379F77
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:01:45 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLSi-0002UX-Am
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgLQD-0000t0-3W; Tue, 11 May 2021 01:59:09 -0400
Received: from mail-eopbgr130113.outbound.protection.outlook.com
 ([40.107.13.113]:45571 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgLQA-0005Iy-0m; Tue, 11 May 2021 01:59:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0/SJUtm7A1xTe4LDfwN/cd0PI/OB9bumFKB1PinoqkAp1Rq/oo6WxKMOAOTRPk8YvVHVjQ9L8hIzNolbeaiv6EVOEq9X6sp/pbtf/u58sRuT2aKKdJBe/AGUXgi3pj6riiw4BWwN6yEBPEbPhveSuMEt23N9ZZdfr4LTu5pbtSBeVopG3miYWTxGpszAM+Z4MAUph/IQxT5cFUYoIv/PntOalrQbpKXJoxDM58cavlNFg32HtioIEy+m6p/W129Mh2Hgyq1NPA2N3BQ0woG/Q+L38YUuqS81N+iL2X0lXfb00fbEphvq2Q3F5UWFEkhVsG6hEY5pAsPyJiIaMx06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrzoCi1oSVov5O8B8RZmqY8LnGTinAxoaxAGRZEs2zs=;
 b=OLRae9E/5rAKDYqcUwCdkq+6EfjzV33PPuFXIlBAPuRWkxbpSK0EEg9zz7U5DKI8Qq3NwiNMMco24PG26B3UGBsSc8v+QQRQKXlXvgc7XtE4C3Rehi2U3Wsaur0sTmZcCSK0pMXhZLfIJFtctfrzKewhuB8tiS8xAi8u0XHGao9GIHX++bSvmfKS5Sno8ivt9ntOfcriMiClXwo4jypbMMoKIQwff5ceB3f0OF1FuL1Exnj6pMtEI+BTBgwUHz4onA3Yh9UvCk40flMHl5+9EbI+Bvph3CGVw6ExaEYD7yfT8yBpVIhT0ekUpuYH4AXp/d569yNOd5TtEYCFYKE6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrzoCi1oSVov5O8B8RZmqY8LnGTinAxoaxAGRZEs2zs=;
 b=GtlME8ow3ndMBRX6phMB3NArKvzdgKfnjsTxQLMu4GcdvY+S63fE85YxKBpklnjRmXGeMQx62hqgZVBCIhW87EBH1iol1MAEAYYI2MS5cw9TR9F5sPuymI2gFjlusseh2lGtIH6LoKdwu2HoH31RbUyRpHZb5EVYIA5A8vBFtHc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 05:59:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 05:59:02 +0000
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e54ddd00-b0c0-a998-60fc-ab491c23b5f7@virtuozzo.com>
Date: Tue, 11 May 2021 08:59:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 05:59:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5b6610-123f-4b62-89e3-08d91441e037
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB69488D0B72F7FEB0FD6C63D3C1539@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vPEcm4S0KynyKP1KBOCSLkVK2yPHZWRcmUBxR+hmTa7cZuRqL1b5B8yoG17kerZW1xQ69MnXICwzzZa2JvDOc8bcJxsVjzlfxQBGtyQI1LF4DPfd2aMpSw3i11cDXKqqw9r55LS1HaOJY+gCMsBvQhNwISLKByLvifz7q1iL7t5HAampeBxpo81u2+eiTjn45WJUXeKCcFQTqEGM61hzxsHJVFosKcVS4ip7E4RXwzG1OrAYt7EAmXBShl0xQaiij7ZHoSEenU3IK5VSCdQ+1dNqUDEE7kzCO8+ngZFvcT2gnsFWeV9wLkoa4o2FLIq6vBBOlrOCo/pRR6BhfBODOg/cs6jGu5fAykTIlJFjWU49cIqcF2FCwSMAStEj4BA7iwOZroRc/AmYysSoXkrazCxMZvgoJEoMpAN7q4m8T7lfkq4fMFUQIKw5Ti9iNAOQ6i5adXEhumnJ+osq5W7Q8WX617+4VN8dXFP+7tHpeD/o4W9VQrxTL7AMjD4DgrCiHOgzZSUDL+rB0MbjVF8WNLkjFMqE1wyx0UI/oNU93hzf6Dqb6qYC3j3LoeZYDT+V95uHKaJ34VJJcTPPBbY6Hfye/JoE8zjau3f48ihDEpI8f+fcI3kIW18Ml0v5v/kRakBcIfN5a+xZBm64vCIkCwbHLLn9/fdbVidMvaR5CimRYhvcXrAokJOBoGnhlmwNlgcIyDgEMItlorqlEZsoxm5o8xrMPoA8RPx9FheXT8V5YU4QcaVGQQP5//A/Kxfr69STsnkJ/ZzGBAvJOhnr6yqbx0llXTV04UxoWOBITEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39830400003)(136003)(8936002)(5660300002)(86362001)(478600001)(31686004)(83380400001)(316002)(31696002)(8676002)(16576012)(66556008)(66946007)(66476007)(4326008)(38100700002)(52116002)(6486002)(2616005)(956004)(186003)(16526019)(36756003)(2906002)(6916009)(966005)(26005)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWRJUy9HZUl2QXRPUjk1dmdCcXFRZVRBOTZBeVNJZ2ZHaHc5ZC95OHBibkxM?=
 =?utf-8?B?S29OR2s0QlZPRlhTS0d0ckl1QUljdWJ6RnV0TEpGRGtyalZMSTBKcGFDTDRp?=
 =?utf-8?B?ZVZUQmpOZ3pGTE1aNjZtL2N2SVBWZEVsbVhrc0lkWVFPdE5RZUtRb29wUkVJ?=
 =?utf-8?B?WDBBeDJjRWF6S2Zzb01MUlY4QUQwSTRwdFFBZEczeVBIUWJVY21Yck9DcGtz?=
 =?utf-8?B?dFZOK01yT002RUQxTzRka0gySUR2aDVOSjd2cHl4T042RHk0aWdNd0MzSS9k?=
 =?utf-8?B?QlZrMGJoSjRUZHAyRk1OdU5LUVJrZXV3Vk9UbHJaRERVblFJYUFUeHdRQmlD?=
 =?utf-8?B?UHRuUFR6SnhiakgwS3p4MzFXNytmanZ6SVF4V09NQUFiR1JvQlplWEh4TGdB?=
 =?utf-8?B?SHBxTUxRYWp2eGFWWGRjQnBrS0JHS2poY2tHdlJNVUxxUlJKRjZXWDlORmJo?=
 =?utf-8?B?UnpvUm5QWDFkaXJxMVZEeUVGVXBmaG9wK0E2TE9JVjRtUnhzKzkzOVNrcWdB?=
 =?utf-8?B?NXhHczVHaUN3b0FoYjE0ZnV1cE5aN1pMNGlZaWZsN211bGN4R0lEYllZODhz?=
 =?utf-8?B?ZE03YlYzQmtQamZ2N0d2N3ZyYjFRdVExOVVKT2ljdHRHSDdoRFNXNEZNOU44?=
 =?utf-8?B?TndwRk4zd09ETmVPK1FBQ0ZqbmI4NENmQTJQT3RUd244djBmNzhTS0NsSEdG?=
 =?utf-8?B?eDczSEdMcExIYVhFZDN2aHYyTGEwYzdaM0JVZTBtSUtMQk1PY1Z3bG9CTHFF?=
 =?utf-8?B?cUpRN3ZCNmI2WmFzVkovQkQyWFZRV290MFpiUm8wN1J2d2VOV2lITWx6cStv?=
 =?utf-8?B?bWY5ajJOaytzc2cwdXNBMHROT1NHb0QzZU1TclZpSjBnZm54NENoREU0U2t0?=
 =?utf-8?B?RHNYeEttMHp3dzl0RUE2ZU9HVUx2OTlEdzgxZjZDdnJsVDlxaWVMU25MSDRk?=
 =?utf-8?B?WkNUU1FRaWpTbzhNWlpvc3dvYVpZbVVrYzVRMEs5ZzZxcFFiSjkwMTFFZXZ5?=
 =?utf-8?B?bVRsZXFPVmNZc1F5UFFaT0w5dWJZOXpBZitSbjA3KyswVHRPYW9na2FvQWkr?=
 =?utf-8?B?bll4MTVnVUQxRlFqSTZnTkpDOUtGZzJaMGxGWDNtWk1jL21HY0dadTFiKzBi?=
 =?utf-8?B?Smc5UWtXamJiRmlMcWJSNXFxUnh5cnd5VXNMZDE2MERobWdCY3pHYlR2STR4?=
 =?utf-8?B?b29aSHlPcDhoby9kNWF6WThEOG9aM3hMNjF2MmNNcFcydzB6UnMrc2M1WEk5?=
 =?utf-8?B?ZHNMQXVtTHRLTjlwejdlLzBLOXc3UmIvdkg4Qzg3YlIxSlN5UHlNMnJGalU5?=
 =?utf-8?B?MGozeElDempjYVlYQ0NHR0gxTkZSUHdUUGRYK2wrdUw5c0EyejRwSGpYK1VJ?=
 =?utf-8?B?NnVaRi9JemZsM3Z1bFZIbzlaazVWNi9ZUEFHZkcwSi9XZ3RoWnpWaXRoZHhh?=
 =?utf-8?B?Sm9WU1JqZEk5YVNtWEMxWWovVTNkeTlhYjkvMUhTZ00rTUIvbXNpanZKOHpM?=
 =?utf-8?B?c3RGZlNoQXNmUnJqNlh2N2NQNFdCdnR5bmRpRlA0OGxkN01vcWtFemVQOWRw?=
 =?utf-8?B?Wk5mUHg3L0ZyYUVNem1oWG5JWXQ3b1IvYUY1RzFhZ2VjUkt6SlQ1clpZdmF4?=
 =?utf-8?B?aFIvSHhrWTEvRHpwSzEySm53MnNFeE5SRU9QdEIzVHhGWE42cFZCNklBZUNr?=
 =?utf-8?B?aDcwVTZBV3hxdmFOMUdsTjVUY0VSUGlWL0dkcWZiZDRDWVhHU1FWRUg3Y1Z3?=
 =?utf-8?Q?Ve95wqwgTwWU+PeQ8XxyBKmE3XsL/3k7aGxsI2X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5b6610-123f-4b62-89e3-08d91441e037
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 05:59:01.9968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q+dF9166ehrMRYjqoh4LIwewMg2z1Elx60P4e93q/ZxXQmt4OcyYiVEL+y4YTsLR5pIgKsysmZ0meXcA/WrPaLirch+JAZSw73TnavUnKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=40.107.13.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

Hi!

Kindly ping, or what's wrong with it?

04.05.2021 12:01, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
> 
>    Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04
> 
> for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:
> 
>    MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)
> 
> ----------------------------------------------------------------
> scripts/simplebench improvements for 2021-05-04
> 
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (9):
>        simplebench: bench_one(): add slow_limit argument
>        simplebench: bench_one(): support count=1
>        simplebench/bench-backup: add --compressed option
>        simplebench/bench-backup: add target-cache argument
>        simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
>        simplebench/bench-backup: support qcow2 source files
>        simplebench/bench-backup: add --count and --no-initial-run
>        simplebench/bench-backup: add --drop-caches argument
>        MAINTAINERS: update Benchmark util: add git tree
> 
>   MAINTAINERS                            |  1 +
>   scripts/simplebench/bench-backup.py    | 95 ++++++++++++++++++++++++++++------
>   scripts/simplebench/bench_block_job.py | 42 +++++++++++++--
>   scripts/simplebench/simplebench.py     | 28 +++++++++-
>   4 files changed, 144 insertions(+), 22 deletions(-)
> 


-- 
Best regards,
Vladimir

