Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D9E43DE69
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:06:56 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2JD-0000F3-4E
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2Gw-0007hG-VX; Thu, 28 Oct 2021 06:04:34 -0400
Received: from mail-eopbgr60096.outbound.protection.outlook.com
 ([40.107.6.96]:62775 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2Gt-0001hz-HZ; Thu, 28 Oct 2021 06:04:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR0ZXjpKTyPIatKvDOWbQCCcOPVrBe/973EE36/D8ug7u8tnY+gRi4TVfIkV6B20bxKsN5QSmq+n+PtUOxR75GGzQCSy6v3o6cNTQi9ohy8kOmetE35apqNnbMPpfmKzgpu+IL7Eh93v+tY1yd9PYgUFFp6B1kgZuJjybmhfohjcK8WGxWKoaBPq/q4jw9ychOoffDV5k634fmuppi6YKzy2QNLQudF2DEl59Yuos0rn5dTHPG1GQW/gw78CxKHDQEhBmrdOMTZyMQuWRmXZWozgyx2eepvKtyxgAYrV8b8SY+O4HQG2EXYaQqpA7m4V8iq+eoDopQuAehMFd1ZtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYOgES8wvynfnkbQfSJsMNuGO4VisM/dpkuIg9HOZ5E=;
 b=Y2M6h8c/QzI7jaxZs7kawMPcS2xPAumeM9qZDNNEh5vIYWbYbBwb0VIweAmm8JdATGRx/aB+b3DqrZrioxRjSAbwgdF2mzflYd0+fKXVd52YgsNTSsk0kYy19Ex7n4xtR/O7oh/HG7c42rJq2vEms6jtchQ+g76MvEWIVDpwWrLNUD2+GJ7DarDmNXdKvUvJER6cqB7H8QOVCXJjxndDfYqtaNVT2GYZ2XosDmgpzHYU/a/UTytUESB38OmrGGZDkt6IPEu9kG6gsA9hs/gEnGVJyhssbHSkugOvCuQg8I9G1sOpX38Snf3qFJiAr8JBZQszZH9+WN+2/BsW+lPkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYOgES8wvynfnkbQfSJsMNuGO4VisM/dpkuIg9HOZ5E=;
 b=F3yDtWRFzevxpdqyCZ+AcPGkVxYsv/flPwQMQSKasqFfTPNyVp8e5z6MeXXPvhv1zpyg1Uz6YAp0uOKVULVmPrCujT14NwL9yciZKbWfK5ICoeqB0W2NBQtOkFuL754YLRwd3COnwmqhZ5pOsa4KA/sJzatN2ZaR8WDtKjF8Tb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 10:04:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:04:26 +0000
Message-ID: <d1f58c9e-f578-7017-282a-26deda1644c4@virtuozzo.com>
Date: Thu, 28 Oct 2021 13:04:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/4] qemu-img: make --block-size optional for compare
 --stat
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, den@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-3-vsementsov@virtuozzo.com>
 <3afe188c-e6de-e956-b068-af6ae1f988da@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <3afe188c-e6de-e956-b068-af6ae1f988da@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0146.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.244) by
 AS8PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:127::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 28 Oct 2021 10:04:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 593c9ed0-e6cf-43b4-e207-08d999fa52cd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3863D2237BADE4BCDE42DB8CC1869@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAN4IAkjUFgiU6zjbDLqQX/8LFDJxkGtAO4tTlJ/JOEfeXDe2PAJYw3P91ZKGLqokq0UOGHM/mAGim+06UUbXecavWRklrW9oybF2HViYz0CmY8CLHHXKBcJrpvgT9IGWko51UBTF2z4EUHn/Kf5fOsZrlBqgi8A2Vt7GkSsrDrMbOaxtq25VypmCy4hAHnsleTacTB5258UFC0IKHgM2OQJ46dQ/1v7U5BZjlmC91uWfmk8ZxrOSaZk2SONJkpTi7DtgZkFo31RnmBlViV9a1rzHnxvdcbOM60fhMs2UZE5Q/qPVNQkfg8FlmTDpaZ2subNT3k9y0APL9eH4e4q282r0fkPxwFjJgt1XDWDQezCG0rjse41U52hJe18rAAYZK6vQNgyL+EVfu1Lm4v6D0+joZkUOgR6jcZo8gJMt/Spn04ewamSltutriO9Efm218u/qWpx+TYfKUb7tbmSWtoeZVSWyfW8UryRlT6GHyUDpv4gRxCkWVo7ag0v7/8u70xcM6JC8k3mtyoCZg4FL5woxAIdmKyfmq7PlOJ6YJEMdR07I2yfEKLzmgjMHjqZPiOfG7oGgUq0LQS8y4HC9gxE6XQSBRTEUYuEObUE7NcEM89r10IDQDZyD5gDpZJG0ffi/NuCTrJv/u7pbot3oFS9hGJ0bi+CybrE32Lw4FCIrWnswzCGf2JB4moCmSzMWf5OxzRj71GigSY8M9ZagHzPmTmBQxb3dFzm6gdQq4K4RyM50Ppu/+jJlmybtCj+Vv/rBCMe/tP8EFx2OidEAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(186003)(53546011)(316002)(2906002)(107886003)(4326008)(8676002)(83380400001)(26005)(8936002)(52116002)(66476007)(66556008)(66946007)(38100700002)(31696002)(2616005)(5660300002)(38350700002)(36756003)(86362001)(31686004)(6486002)(16576012)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0FwU2V2MDB2eitNRUpxcHhrdElpOVN1MDA0bnUydnNkRUFMODlWOWE0clhm?=
 =?utf-8?B?TThwalRPdHNzcVR0OEordHpHUkgrMkxBMVhpYjBCTytJbkU3VytEanByV083?=
 =?utf-8?B?Vkx1WDZNL0xMWjI4cE5rVTdVNVpuY1FqWmJLZlVWZWFLTytuVUtHS2N0WE5v?=
 =?utf-8?B?QkhiZE5USk5SWVlScTdNbW96TWRXMTd3YlZMMjlVMk9kcUZiNXRBcGdaMFJ4?=
 =?utf-8?B?aWs3d014aXVRSkdsM0lDTEQrME45ZW9VbmE2cWdwSlhPNWlTcmpsYWhMWHR1?=
 =?utf-8?B?VHRBN1VlOXVuMDhkMlJ4TUVIbm01bnNMdDB6Y1BTR2FibS9XZ1V2UWFWZ3lZ?=
 =?utf-8?B?dWdpcitxQVJhL3loVnVBUFBCaGdNVW1ObUlwdTh2eHVLYjBFSzVLVG1Ra2Vu?=
 =?utf-8?B?TDlrRzZHWjAwanFRMjZ5QkFvTmZTeUJ1alJTa3BaVlNabDhGYWZzM0ZEbDhj?=
 =?utf-8?B?Wk5DRzN0MnJXQWNDM2o0NUwxRnBvRkp6TFNsUWpnaVpWVXBwT1dWK2lkNVNY?=
 =?utf-8?B?TExyLzFBcjJCTXdhamh6Y3FUMmJRRTNyVDFLZ2FqWk1LQlR4K2pRRkNrZE1E?=
 =?utf-8?B?ZkxlMnJORWc5SkpFcEFpMlZRbktUSFVpb2N0aVFiRlhxdndWMllQWExIanZY?=
 =?utf-8?B?Y0d3aVRmbE0zTmZkWlcyZFdOWjVvZDJyUVVPd2lwOTR1U1R0QjhYbTMxNUFE?=
 =?utf-8?B?VGlnakpaTzZaVktqeUo3bHdweGUwdDBRZFpkVDl4Q3pJeFJSY3djeGdiOEd0?=
 =?utf-8?B?N0g2Y0FZRHI2WExpbEw1S3pud3ZTVzFDR2Z6WHJYWUxFdTduZjN3TCthelZr?=
 =?utf-8?B?b1pnc3dSZTlrWDg1VnJMeUd4SnNPUDg2NG4zeHBsd2lCcVg3dGRac2xsVXRW?=
 =?utf-8?B?YnhwR0VMaVhXcUlZS0llejR5L3UrUWdMUStpOFR2d1RxTk5CVlU2c0o4OVVh?=
 =?utf-8?B?bkVGdTJiY0VTNFk1bCtkQ2NDdjd5OTBhNVArL0R5VXlRazZ1dUltaXMzYnhC?=
 =?utf-8?B?bTVpU0hZVXFsbnVlRjVkb0JCRHlVTHR5ejZKSHlIcHR3MjVUQlpVM3hhZnZp?=
 =?utf-8?B?Q1BPMk1jcmUycVkrbDl1WkZFRVBrRWVpeXhvUDVmako0bGlxVEtoM3hvQ1hS?=
 =?utf-8?B?NkZMMk5DN3ZtOTB6Y0t1ckRhRHA3Wjk3OXlWeUFhS01wT21kTFduZjJCU2RQ?=
 =?utf-8?B?QWV6MVdUNEtDSGRuMmFteHg0MFRRdWRQcGpVUTdkdnVOejBvb1FYWWZnMmlS?=
 =?utf-8?B?aE0vZXpmblZ1NFFMeXhZN2d3VTJuQ2ZrMSs0ZldnSk52ZkJtdi85Q05aZXNt?=
 =?utf-8?B?YVpEays0VkxJV0toNkpUYjVpUjZhTTlSRmJEUkxMbEZYdGlrSk9qc2Voc3I0?=
 =?utf-8?B?cFhnRW9ub2tKYk80K0JiTjNIMS9RQUpzeGZyOVFqNDdEZ2N1aEhacXVtN0lx?=
 =?utf-8?B?Uk5jWHJrQ2VqdHU0VkVqNUdhR2hiZnhvdTFiRHZVaXNJcURSRlJXT1RGOHhp?=
 =?utf-8?B?STBYT1lUMVI4cnhZVTAzTEtBRFFyVGY3QThQaVNlNXBYR3R4T0RsV1FBcUFp?=
 =?utf-8?B?M3dxR1NXWVFuK2F3eUlxcm5halJHaElrQjFXQlB6SUV1ZDhqTTFXSTU5WUIr?=
 =?utf-8?B?c2NjbEVuZHE3NXprNDhTanU2SGFkTnhjeldrbEhlZlhKOFJHK1NtMGNVT0hT?=
 =?utf-8?B?VytQN3VVaWZnUTd2MTNPYXFZd29XcTRnWEpFRGs4Wm50UVRLbDQzSk84QzBh?=
 =?utf-8?B?bkZ3WEVILzM5MHloSHByWkdVUSs1bzNXTjZmQmhhQ09ZWDNJY3ROZFN6TTlI?=
 =?utf-8?B?ZDM2aUNKWmdOYUlhcE42TklaNlo2bDUrTGhZc3NNT3AraHlDYmhsNDJzU3Vz?=
 =?utf-8?B?QWc2ekwrZVNUanVxMlFSTzQwYlFuNzRSaEEwc3ZyVG9WZEgyaXVHUGdZaXdR?=
 =?utf-8?B?VFVDOTZ2SU9UOThBS2tIeHNXalhpeWppZDhHRzBtUFR6UVVhVE1ZVVQ1dlNk?=
 =?utf-8?B?dktnaFVYN25PR2Zwekg1L2Z6M0xOQmp6MGl1TDh4Y1E0ckxvN1JYUHNSQXdw?=
 =?utf-8?B?QUFBWVdaUndXWlgyNVQ5L3N5Rm9nTVFEZnhCeUhqV3k4ejFHaysxRE5KT0Vk?=
 =?utf-8?B?c1JYVEhkWmRBc0FSVHg0TXJpNVd2OVJXS3VZUFNGYldZVG5QWmxOME4xS0RJ?=
 =?utf-8?B?TGdDK1N2SndPMU1OY1Axc1NTeUY3d04vNXJEQnRXYXlBeWJnakZidldIKy9P?=
 =?utf-8?B?OGNKdU1HRWtZY1RQaWd1b2pVa1BBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593c9ed0-e6cf-43b4-e207-08d999fa52cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:04:26.1496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Nbrvu6Ty0m34FXfMbl4SNVTVr09cDh64ATcUDO46G/tnRXKGwGaEbnJpJZitA/DNJ+E4/vWlvBdlpUJtNMn+zjPi5g91RfmpuMEMvWY09Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.6.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.10.2021 11:07, Hanna Reitz wrote:
> On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>> Let's detect block-size automatically if not specified by user:
>>
>>   If both files define cluster-size, use minimum to be more precise.
>>   If both files don't specify cluster-size, use default of 64K
>>   If only one file specify cluster-size, just use it.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/tools/qemu-img.rst |  7 +++-
>>   qemu-img.c              | 71 ++++++++++++++++++++++++++++++++++++-----
>>   qemu-img-cmds.hx        |  4 +--
>>   3 files changed, 71 insertions(+), 11 deletions(-)
> 
> Looks good, just grammar nits and a request for an assertion below.
> 
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index 21164253d4..4b382ca2b0 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -170,6 +170,11 @@ Parameters to compare subcommand:
>>     Block size for comparing with ``--stat``. This doesn't guarantee exact
>>     size of comparing chunks, but that guarantee that data chunks being
>>     compared will never cross aligned block-size boundary.
>> +  When unspecified the following logic is used:
>> +
>> +    - If both files define cluster-size, use minimum to be more precise.
>> +    - If both files don't specify cluster-size, use default of 64K
>> +    - If only one file specify cluster-size, just use it.
> 
> s/specify/specifies/; and perhaps s/it/that/
> 
> [...]
> 
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 79a0589167..61e7f470bb 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -1407,6 +1407,61 @@ static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
>>       }
>>   }
>> +/* Get default value for qemu-img compare --block-size option. */
>> +static int img_compare_block_size(BlockDriverState *bs1,
>> +                                  BlockDriverState *bs2,
>> +                                  bool quiet)
>> +{
>> +    const int default_block_size = 64 * 1024; /* 64K */
>> +
>> +    int ret;
>> +    BlockDriverInfo bdi;
>> +    int cluster_size1, cluster_size2, block_size;
>> +    const char *note = "Note: to alter it, set --block-size option.";
>> +    const char *fname1 = bs1->filename;
>> +    const char *fname2 = bs2->filename;
>> +
>> +    ret = bdrv_get_info(bs1, &bdi);
>> +    if (ret < 0 && ret != -ENOTSUP) {
>> +        error_report("Failed to get info of %s: %s", fname1, strerror(-ret));
>> +        return ret;
>> +    }
>> +    cluster_size1 = ret < 0 ? 0 : bdi.cluster_size;
>> +
>> +    ret = bdrv_get_info(bs2, &bdi);
>> +    if (ret < 0 && ret != -ENOTSUP) {
>> +        error_report("Failed to get info of %s: %s", fname2, strerror(-ret));
>> +        return ret;
>> +    }
>> +    cluster_size2 = ret < 0 ? 0 : bdi.cluster_size;
>> +
> 
> I’d feel better with an `assert(cluster_size1 >= 0 && cluster_size2 >= 0);` here.

Hmm.. But it seems obvious: bdi.cluster_size should not be <0 on success of bdrv_get_info.

> 
>> +    if (cluster_size1 > 0 && cluster_size2 > 0) {
>> +        if (cluster_size1 == cluster_size2) {
>> +            block_size = cluster_size1;
>> +        } else {
>> +            block_size = MIN(cluster_size1, cluster_size2);
>> +            qprintf(quiet, "%s and %s has different cluster sizes: %d and %d "
> 
> s/has/have/
> 
>> +                    "correspondingly. Use minimum as block-size for "
> 
> s/correspondingly/respectively/; s/Use/Using/ (“Use” sounds like an imperative)
> 
>> +                    "accuracy: %d. %s\n",
>> +                    fname1, fname2, cluster_size1,
>> +                    cluster_size2, block_size, note);
>> +        }
>> +    } else if (cluster_size1 == 0 && cluster_size2 == 0) {
>> +        block_size = default_block_size;
>> +        qprintf(quiet, "Neither of %s and %s has explicit cluster size. Use "
> 
> s/has/have an/; s/Use/Using/
> 
>> +                "default of %d bytes. %s\n", fname1, fname2, block_size, note);
>> +    } else {
>> +        block_size = MAX(cluster_size1, cluster_size2);
>> +        qprintf(quiet, "%s has explicit cluster size of %d and %s "
> 
> s/has/has an/
> 
>> +                "doesn't have one. Use %d as block-size. %s\n",
> 
> s/Use/Using/
> 
> Hanna
> 
>> +                cluster_size1 ? fname1 : fname2, block_size,
>> +                cluster_size1 ? fname2 : fname1,
>> +                block_size, note);
>> +    }
>> +
>> +    return block_size;
>> +}
>> +
>>   /*
>>    * Compares two images. Exit codes:
>>    *
> 


-- 
Best regards,
Vladimir

