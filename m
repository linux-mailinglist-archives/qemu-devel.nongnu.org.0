Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E9380DF1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:16:19 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaU6-00005N-0j
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lha7q-0003tn-9c; Fri, 14 May 2021 11:53:18 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:16992 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lha7m-0008WI-0V; Fri, 14 May 2021 11:53:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dqtc96nDg665dhu1JOpB+iwtecsf4R77JD4PdUgUqYR05azE00PmSFvs9ac9Xc7bzJRnr7fB3xDX8RARPZXP3U5ThquZMX0Mf3xD5N7sse1EhNAYK/sdehqoRb2eNWhZhAotuLesWyrYHGtkS/uFOXvuOqVCLKuVBvPCnap+pjLGUgNZIfbThyAFFJ2Fo5IYby02uLybtg1HhtL0pteus/76GWTiC2OBMgVyRP8/fY2eUeluS6jbmYSAHjHsh0Xi7IeM0CDld/9rtP1bb9mjmSv7t7WiXs7lJT4pocCdpMJyBWLRno/qgXCDBvl733S8amvB9zY1E02FS907Vtd6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXyRfb12hpUnGnY5H7Rka0gt/qV04dugWp2KUIWenHA=;
 b=iCHM8okpfnP9Qo3jT2mzM/wL2P1+Z4lJNiMQK+DdgymdEr+iYzpUec30KrJyuEhZzPqvrOujM44wj2gtm9Z6+k7Aw2KKN/jm3bs5fKeqtww0AEdeSO1Xx2O0eIoQ98wMzL9twoStwBmZy6lfDCggE5WXEqaQsilL+hAXfMSDyrfvTmdYnRtEduf4QgicGQlUYGEUI8zBkcvg3PsmYRi5a4v8eidbSyMiTyuLjUXNqnl+m5VfIHIv6+gUznkMMke9WaIJKBjjfSWD6cfK2pJgAbD1r4BSYGEWqEesK0WoqysZf9srKyVuCsBej26n0D2BC90fXD0Fl520QS94jrk87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXyRfb12hpUnGnY5H7Rka0gt/qV04dugWp2KUIWenHA=;
 b=YKnnpJn3fY5NPs6BZE6IWauhrffy2+kxOeTwldN3dtFnKbVJHYxi4gI6z50L4ywNAqT65C5VNB/NCu1DVSEy3UZbRPaD+lKdh/eKp3Ri7wee07oBCzDJ35IE6b1UBWYMECAmSFq3lnYbRcqMHPx5WCyyPjbLVn3wDA1da6ZaooY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 15:53:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 15:53:10 +0000
Subject: Re: [PATCH v4 0/6] Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b2420fae-1ce5-ee5b-792a-ede183280ec7@virtuozzo.com>
Date: Fri, 14 May 2021 18:53:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <cover.1616000692.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: PR3P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 PR3P193CA0056.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 15:53:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7898d7e9-d51d-4629-ba26-08d916f05f81
X-MS-TrafficTypeDiagnostic: AM6PR08MB3766:
X-Microsoft-Antispam-PRVS: <AM6PR08MB376641BA96609F685B4C4500C1509@AM6PR08MB3766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqyqlyR8VaLFr9zSyu7akuHQZXqhRaiS+CbHOkmpSARRgQUpP3mpTnu2SGeG1uVKEPZwiN4NVYgoXSt6BhO61/QVPcrJ/GybYjGpFOxGNwohK6F7BpDPAL/TrlgkWcc548S8jjEz82pf7106GwBxJO7ejn3uR/xhm4LywsjSj0xAP1ELDkcgkxq7N4ZJoXlrBhDcXZ04IVQq1bIYTioXl0iL9FUfh4S4GOfQjgPbrw02MnSmbl0/w0ie0l5FgH0NsCdKWr5ZpwMBbc5xpI9gg5TO7smSuWSIHxx8FyQPQ+o8uwQKjxlGvnrwndDBfwwsRCuFu7iY5e52giJmu0MGQgkKx30Jut+mpbOBYb0mbCCliQsqwOjpMdlQe8w9dvfsxi+2rJEiAHo73Eza3YnzHtYsE6QIRvSDy5N/MalqybHn9x5fV/qjEEtk51V1nSsaUqImddiHp4lW0RF1KuObtCfFp801+E69gQb+zhFQq0PMd4CWk+3t/Hs5pa3nLsONm0I2Old0SFNNL6LCU7fGPwJ8U+HDDxtN7FEotNKHQ7q/nYIVJX7qkUTtf/NwONJr4u7ibdL7Jh3uf7iDAAlrF1kMfV4inZUVHuwtVQif0fX9eGvCzHvBBL/+vxDx9XwE7PJrKZ5+iJ5A9YKrilThXw0LYV5ooYIrV+jl6CY6pMU/nLvSNRphChwlHwdmPl4/XfS/90g4ATRQ5zGOlGRAmN3uZYv2nkhVsDirfufk6doDelcJquqc1v/bq9in+pM8ZmC6r2MG5U1rksmj6pK0Dr4x8D1BKJI0c9O7okL7CCxGbH6P8ARRBKz+/3VnbEun3FC6tzQQg4tASCXTJXVM7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39840400004)(346002)(366004)(396003)(66946007)(38100700002)(38350700002)(31686004)(86362001)(66556008)(6486002)(186003)(4326008)(31696002)(66476007)(36756003)(2906002)(956004)(8936002)(16576012)(2616005)(966005)(5660300002)(52116002)(8676002)(54906003)(83380400001)(478600001)(26005)(16526019)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bW92WmZtTGJheEVKclNQdHJqUjMrdmdDYUZRWEJEc3dvYk1nS3BTYUJVdkkr?=
 =?utf-8?B?TDF6a2NFbzA3WFVnZTN4d0JhOGp2QTBxYVpES3NJU201WnFoTk5NRzFJTERW?=
 =?utf-8?B?UGZYKzE4V2tNaGNudldVd21PaEh4YWtRcHBMQ0N2aElpcmRwamUzaFN3UTJB?=
 =?utf-8?B?TkhISm51U3RxUVRLa1VyN2o0RVN1eVAybWgwcVlYUWp1a1pJOU5QQUk2bWlC?=
 =?utf-8?B?dmZyWmFHU2t5K2YvQVdNQWhrSzIwRW9SUXlIb0VpRUNlUzlhakFRYzhwM3RB?=
 =?utf-8?B?akg2SkFxZDFlNlYwMndxS2FFbjJvS2c1R1Q2MUpPeGZQTUY5YkxXL0VUUlBw?=
 =?utf-8?B?SXh1am1tbUNNUzBiVFJHQ1BxZVR4MUhXc3VBRjBuZDdINmlZZGFHUitJcGpw?=
 =?utf-8?B?OHRzbEhFQVBxQzlzbXF2UTYzRU5aMUlHcWUrV05DL0N0V1hmbFY0dStwQWti?=
 =?utf-8?B?dFJ2Y3B4bkVsNHc3TWUvQ0JEOE0xRGlDOXFCN2xENUlaREdCVFpOaVFacTdP?=
 =?utf-8?B?RUlkZEcyV0JhT3ZhYVhYREJXWGxwdTVwTDFRbktlc2d0VDZtZWJncmJlc3dG?=
 =?utf-8?B?NVQyc0RhQzhzQVllOHdDcVFCbTJlSTN0K0pCVThpYzBZanZxL0w0aWxBVEhK?=
 =?utf-8?B?Q0JnWFZVQzdGNGEvV2VWckN3WkVtNmZmWWFSY2E2TXFBSWxHcUk2MEgrQUF3?=
 =?utf-8?B?ZzZFZzBYZHl6VzEvUWJ5UnozbURXL3N3M0VIR0VRODNkSGpuMXZ1eGVMNjNI?=
 =?utf-8?B?ZFBveDFTbXVjalM1TlNUTmovTGtWRTMwOVlsN0E5U2hDTmVhTHFoZDYxbTEw?=
 =?utf-8?B?d2hQZTAxZUVDekZaODVPMHYzS1l2R0JJQVpzVFg0RUpxenpvb2oxVHZQa0M5?=
 =?utf-8?B?OTJ5Q2VyYUlGa09KeDhIQmRUaFFCT3JQYWtDQXZzRkNTL2RQRVEzYWJlNGxS?=
 =?utf-8?B?dThhTWl1S25LYWwydk9QQ0t6S3hIV0N3Zm81MzN3MmhJeldvTXlEQVYwK0c3?=
 =?utf-8?B?eXZYOWZ0NURhQlV0bzIwUVA2RGc1ZzBKQTg4RDdLaFJMNkhqQndobVlqRW9V?=
 =?utf-8?B?RkM1bnhqTEk0Rjg0SXMrRE0yT3JDeXlBZmZ5ZXdISGJtM1c1Q0Rza3U0WDdV?=
 =?utf-8?B?Y1BQOWliUndRS1B1QmI0cUUxcDkxWC8xV2tjNzlMUmIvYnBJdCtjak5tVzR5?=
 =?utf-8?B?ZnA5b2FnMFh2S2ZuaHQ0NFEwQjFCY0lSWGx6cmFNdExVUXEzRE0vU2RFZUdt?=
 =?utf-8?B?aEFJQXNIYnBiQkVIekxodkR4TzRmcHY3ZHBENnhNZ1JxQVlJRVJacjNFTmJF?=
 =?utf-8?B?V0VXclhkTTRORjliOCthR1BwNjEwTUJEelpXd0JMTFdMR2E5YXc2VUNWeW1D?=
 =?utf-8?B?NXdpOW12TVZrNnJMOXl6NFp1YVpTZTN5eHhKVHdHWUh4R28weGE3aVp1ZmFs?=
 =?utf-8?B?RDZYYkxrNTltN2hsN29NWlZGbUNwNnE0L251NUIvT2p5MXpmOCtBcUxNWUFH?=
 =?utf-8?B?SThpRml2L3N0cmxPWFMrclFiV2drYVhpMVZwb09yU2kvSDhYYkMxbmt4VnBi?=
 =?utf-8?B?d2w3SVplMUVBTGxjbjRsazNJR1p3QzZyblBPWGVRRGJjUHV5TzdXMHlPSkxt?=
 =?utf-8?B?a1RtOG0xdTlaOUdGNEhCRkhhUXNyT0xQdmdrVUsyQXlkNk9TaC83VWVhK2px?=
 =?utf-8?B?OS92bitteHlycjlYS09vaHJYR1VjRWR6MlEzNlFGZ0kxTS92ZDlROXRUMVJ6?=
 =?utf-8?Q?WkpJi/d7MWzu/dBlsmLdflhQs5vjoA9gGj04j+V?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7898d7e9-d51d-4629-ba26-08d916f05f81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:53:10.1020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnYigS/CrLDMmx4xhVlUIk22edo9A5bSK1+3EMBa5fg9VyoTDQ3TnV7LMzRBulriw+WvqRjGWujaOaS3dPWIZfUdsXGtxRupxKGeJGsUbWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Hi Alberto!

What are your plans for v5? I'm now finishing a new series which makes backup-top filter public, and I want to base it on your series (otherwise I can't add a test).

17.03.2021 20:15, Alberto Garcia wrote:
> Based-on: <20210317143529.615584-1-vsementsov@virtuozzo.com>
> 
> Hello,
> 
> this is the same as v3, but rebased on top of Vladimir's "block:
> update graph permissions update v3", which you can get here:
> 
> git: https://src.openvz.org/scm/~vsementsov/qemu.git
> tag: up-block-topologic-perm-v3
> 
> Tip: you may find it easier to review patch 4 if you use 'git diff -w'
> since a big part of the changes that you see in
> qmp_x_blockdev_reopen() are just indentation changes.
> 
> Berto
> 
> v4:
> - Rebase on top of version 3 of Vladimir's branch
> v3: https://lists.gnu.org/archive/html/qemu-block/2021-03/msg00553.html
> v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
> v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> 
> Output of git backport-diff against v3:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/6:[----] [--] 'block: Add bdrv_reopen_queue_free()'
> 002/6:[0018] [FC] 'block: Allow changing bs->file on reopen'
> 003/6:[----] [--] 'iotests: Test replacing files with x-blockdev-reopen'
> 004/6:[0071] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
> 005/6:[----] [--] 'iotests: Test reopening multiple devices at the same time'
> 006/6:[----] [-C] 'block: Make blockdev-reopen stable API'
> 
> Alberto Garcia (6):
>    block: Add bdrv_reopen_queue_free()
>    block: Allow changing bs->file on reopen
>    iotests: Test replacing files with x-blockdev-reopen
>    block: Support multiple reopening with x-blockdev-reopen
>    iotests: Test reopening multiple devices at the same time
>    block: Make blockdev-reopen stable API
> 
>   qapi/block-core.json       |  24 ++---
>   include/block/block.h      |   2 +
>   block.c                    | 135 ++++++++++++++++----------
>   blockdev.c                 |  78 +++++++++------
>   tests/qemu-iotests/155     |   9 +-
>   tests/qemu-iotests/165     |   4 +-
>   tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
>   tests/qemu-iotests/245.out |  11 ++-
>   tests/qemu-iotests/248     |   4 +-
>   tests/qemu-iotests/248.out |   2 +-
>   tests/qemu-iotests/296     |  11 ++-
>   tests/qemu-iotests/298     |   4 +-
>   12 files changed, 351 insertions(+), 123 deletions(-)
> 


-- 
Best regards,
Vladimir

