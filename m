Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A247E749
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 18:53:59 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0SHu-0003IS-Pw
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 12:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0SFc-0000TD-JC; Thu, 23 Dec 2021 12:51:36 -0500
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:47360 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0SFa-0005LJ-NV; Thu, 23 Dec 2021 12:51:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df3e85psnHXRtS1CGqVE1RrII1UqnyyQVJAfqiicC9L/nvQTvmxO1mf3PD9/bHcxMKmm878EaIFpFYe+FsYA9V+kdpHBgCVus4Rfi/0n1TY7h+xGDYkwIDRgUtusJhBclZ/aDHnzZ/vuQ4+lk7of+8P6ZbFSOKnjN20MtkIYIiRub0wRvjIesRnhiLWLopy3dyAt6rfaduzxozTXodMMtmAEKZExtAtSaFIQOFFWoqK4MSOYPYW+EzYcOBTRztN6DsrsYxQJEptriRwa+6Z/sAKFisrVAVzbrbvxbmibXGwFnvthcKAaQONauzGj+/XDUj3tbKnYgiNJACKLj1KNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/VytNmCyh2PlQ1ogbmgxuDV/3SM9DyjBDt1HO0mGMM=;
 b=C6YGdfO829bHYUL+LHxV+PXLNIJc+wzgqpLHA1XY9VqMm7tIna4DQl9NvwcKh1zDxPcpOCFyCsEOnT4HGCRhuFmsad+DS68lauNkZU5ICOzja3mhk8grTIQVOg2vuwslH/RhwVE5VOJNKhdPDZTMSC4vR4e0Uw2D6yzcXnZajfXLPG7zXvhcPjDO8alLa5H2JicdFdMyIRlAUBo83shZIXFOkbSRw1XlztfEdBOqN+gtgaQ4AcU2QZEnDuMRDO9GfrL/9sSr0TzBBFkOGySjtx8ozpPxY2ptfOy6mZ/tAqnBGXnqlM/wry6+GfM82YM3UIH9uyyprVd1+JtqJhGvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/VytNmCyh2PlQ1ogbmgxuDV/3SM9DyjBDt1HO0mGMM=;
 b=MdlldS1KzAd0hx7HaRZN7B+o/1qMwJTp+GWtvQtskRa4/jBDbhBVX74MLgEOIQOg2EGEsE9muATcIGoj9GtVNG7oLrMjBbDG/tHIcR30p352nCIAX59LwxnWtZ38YnyqddYc6A7lQJz5j9Yz7QIsxFsARjawH5Gdr4Dp89OW/to=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Thu, 23 Dec
 2021 17:51:31 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%5]) with mapi id 15.20.4801.020; Thu, 23 Dec 2021
 17:51:31 +0000
Message-ID: <3176d47b-1f4d-b662-1779-7c55f7a7dfa0@virtuozzo.com>
Date: Thu, 23 Dec 2021 20:51:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] iotests/MRCE: Write data to source
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211223165308.103793-1-hreitz@redhat.com>
 <ec50682f-a421-797c-a436-085f00ccda35@virtuozzo.com>
In-Reply-To: <ec50682f-a421-797c-a436-085f00ccda35@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 640d0ccc-7a97-4dab-906d-08d9c63cda80
X-MS-TrafficTypeDiagnostic: AS8PR08MB6741:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB67415055C6952649D08C878AC17E9@AS8PR08MB6741.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VniZGK1xjmBQC5LIVez8Jpl83UPMMbZjLobtjAHbV1xQTMzd9z40Qu4ZFegGma9fV9cadPjVhZgejlSOLMM7oAGVrJJrs/pnxvGIwxS9a25EZdKMCjnbO915NTiQmGwGarmhJv3NshNxPxh7xyg0BIEYIBgJBhCqBIxsl7pc5NMuRQYu2u0KJeO4OoFFhyR6BMG4d/esy+ZH5RS3574TK2YzL9fD1Hfwr8/llHAxc0B3P6L9xEDrEcXmojl97Thgmi7EDtrtkSox/+Pm1XkICaErX8c+ffY7LI60/akWW1fA/8SyAKyK11IP4CaZlPsZtw8MurszkZGLhLanZZYeKaTvykYfz9MILXTERsfZqwH6dnxlybfjzt7U3UGH9SQzbL6HTeYC6N+QP6xbBSTSyd5BEsW1khTux+wimFjqiBlSVI1NNoNVN+fLFveYZwDIK9RrCtvMSzh9At1VcwkRvqtGiBeCLq3aH0GjqQn2dOLXLL8nc8PCmChCN/VSDcCCxjoQZQXA44i0WTUOMDvbWx8KTOrsxABFkoCwVXF6Y0EQSAF09r4ehxojyJf21Uu8l050fA4O0lx6q7prSU10sy26j9/tFmQjS2P5+jYnwcAF6g0mI3dV6IUqQhR7vtpnw0G+8Ese14IufOUiyuGUK7kNzWmzpcPYT/mzwPPiuRgGFZooS1O9/5tHTa3uI47vI02i6l7P/Dnpb+P6+iTXz+oRgx3fWDemCxNCuz1mXHr7NlUcB+GyNQop7MGZlUOz5OprJw23n+xg6GqVqCiLgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(2906002)(6486002)(6512007)(31686004)(508600001)(38350700002)(36756003)(66556008)(38100700002)(86362001)(6506007)(2616005)(4326008)(31696002)(52116002)(5660300002)(8676002)(66946007)(8936002)(558084003)(26005)(316002)(66476007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVIMHUyaUZGZ2ZiR3VRS1ZwRmg4Qm83UlZTREtYVFB2TzFBZzY0aldsbDd5?=
 =?utf-8?B?NWZMNm95bjlLYkRWS0U4eGVVNWI2UEh4aVQvdWE3bWgvZlg4MGtJYzYvY1VH?=
 =?utf-8?B?LzllUkNWY0xsNkE0SHExZWNwcFkyY2s5NXVLakMwV2NvNjE4aFdTNnRvU25O?=
 =?utf-8?B?RUxIOWtOSTl3SXo5VVpES1NlUHZpV1pKRHVjbWlxSjFBT0IySnZjeEVyWk9M?=
 =?utf-8?B?Ylk2QWNtcnhSVjBkRWJSWnBMWVhiUEtEWm1ERXZmdzhOVTJ6UmQvdTQ3TTFT?=
 =?utf-8?B?NnZ3OUJ6ODZlRkR6eStTSWlhbWk3eGN1UG1iQnRyV1FFRUVhR3c5NERhdlNq?=
 =?utf-8?B?K2FTL1Nwb3lHNzJZN0hja1daSWN0eEorUjNpRmxvRFFmNWFTUG53ZTVHaXV5?=
 =?utf-8?B?WEZjZldHV28xcUpJb2t4dFBCck12ZTkxaGRLQWVTRzFFQ0VMYXgrK0hMMGEr?=
 =?utf-8?B?Ujd4b3VwTkdlcVZhcjJ1UHI0UWhrRmhlOHdvN0lQK21SZ0dlaVhqQVVOdHA4?=
 =?utf-8?B?a0tUV1dQditxcVA5UTVyRUVCcFlBZDBkMmYrejU4WG9jZ0tHNjhhcmVhRkNj?=
 =?utf-8?B?Q043RDZwc0hEMTRuc1d3TTRNT0U5bE1haE10VnhsNFJqNWJwYzhxL2Y0MVhh?=
 =?utf-8?B?RlhnYWRCSGRWeS9KQU5WTHltZmJ0QzF5TFhXeGttUEllOEhKS25xalhNOEtz?=
 =?utf-8?B?Ylc3S1dnWlliRWQySnZOWHM5aUNrZHExd0FjSEZGeWlJYjF2RHU0ejh6L1I0?=
 =?utf-8?B?czljV2NOdGhPWkNLL3JuUEY5UTJ6d2wxdFFRZWRtVkREcVQyczZnZEdwY1lw?=
 =?utf-8?B?TkE2dHlwZkhUY3JUNTJzRnlzMkxGMjdaQ1pFOTRBcUNVYi8zT3VaUkwxRzRR?=
 =?utf-8?B?cTRMbFo4MW1jbjZDb0dyU1FvdmhoRmE1RkFVYUFidFhKR1VQZEpJWGNaVW5D?=
 =?utf-8?B?cGhObDhFVGFqTkJxYmM1bUQ4enl5dUpZVVRUTGh0RTlwaXdoamlUNTkwUG9u?=
 =?utf-8?B?bEl6UEI2ak1NMmc0Y2kwandTUUgwd0szNEF0U1d6VnpEeDBRWEhrd2xnd0hW?=
 =?utf-8?B?TkV0QnZiS3pOTGxDRFJsRGFVVlgrSTB0U3dQeDlFR0xndXJ2Q21zb3Z2cUpD?=
 =?utf-8?B?Znl3Tm1tRExQNTFRd0Z1MDFpNVpFRE5SamtLM1pLRkRBTGFZOHk2NCt2K1Aw?=
 =?utf-8?B?cjVxL2dneHYyeDhkSkp1a3dCUDEyYlNSWmZRNDJTQW5COFhPRE9CMndnV1RG?=
 =?utf-8?B?d0RMYjlQS0ZEZk80SENUbTA2L2VET1RmOHI1aS95K1phUFdjaGJTcDNzMzdL?=
 =?utf-8?B?Tmd1TFo2dURwVDFHbkZyQ093d1lDU29waURhOHJXUG5aN09kQlhPdlFDUGs0?=
 =?utf-8?B?b21TTXN6M2NtM0IvVUhIQzR2akZDM3NtcGJSTzNMZzZyTkUzcWFjM215ZWQ3?=
 =?utf-8?B?L0JkbG9aVm1MRDkxbnF1cFNkcFppc1NsSE5IbVFEVWlad2RIeDRZWnlNbS9F?=
 =?utf-8?B?bERmYTdUR1MvZFk5TUdQY0pDWTlVUFQ3RnppekdaVzF3ajdnWnJvMzczZUpr?=
 =?utf-8?B?c0hQOFU0dWxxNXNJSXBDY2xaOXlHWUZMTEswc3ExZk9QazNFU0JCSTlSdXBu?=
 =?utf-8?B?dEs5MjJIaUJ1MUt0UlQybHZ2d1ZyeFB5M01wcTdGdGtvNHA4bGJMUnJpUjVw?=
 =?utf-8?B?bW9GL1JVZSswSy8vd1k5b1FJaVVrdjJNdDB0OHd0WGx1TFVSaXlQQ2g5K1Zq?=
 =?utf-8?B?M29JRTRRTUVLclRZTHJnRVZzbmM4R2ZHRkloRk0rNzVLcGRKUEZCczFDdmlk?=
 =?utf-8?B?S2Nkcjl6MEUwRXJKN2RTZHNZNWZ0SnlMNDJBYzZmVkFBZkdCVlI0UHV3SE4r?=
 =?utf-8?B?TzZhcHZVUjRCWC81Y3ExTWZZTHovekhtRWJKVCs4T0VJeWNwakNHS1BPMEdi?=
 =?utf-8?B?T3RLMzI0dWRaRmw4RXJOcFJsU2QyVWlpMGtKTThTWG5jeUxoblUrMDZHYlFy?=
 =?utf-8?B?d0JvVFNUOS9pM280T1liRmpyMFhiTlU2cW9KVXJRK1hlNkN3VkVvRDQzOGNG?=
 =?utf-8?B?WjJvMllFYXQ1a3ZPOENRTzR6aFFSaEIxMG1PV2F1NDZjd2o4eDFCZEtkYWc1?=
 =?utf-8?B?eVdHWDkzWTJUV1JjY0pPWnNhSnY3NnRnK3VwNTgvWlBBWU9pakh3MDZaYkV2?=
 =?utf-8?B?WVhaZ2o2RVNmYVFDeXRIdC85bHpPT1kvS0VvQU1yTkpwdzNhaXZ0NFB0Z0J0?=
 =?utf-8?Q?Tkd59V15aV33g4cXjHJ3o/r4TkQRCzgGzofpm8Xze4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640d0ccc-7a97-4dab-906d-08d9c63cda80
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:51:31.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34cg17+66+t5/zSsr0nugrYZIyjlyhvxkIxxXDtrdJaP45CoNmY4UAMYXsaOWmCCqgq8R0Vg8MegTj+9iV4PJINasHdkyERcgtZc6GWp7QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6741
Received-SPF: pass client-ip=40.107.21.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

23.12.2021 20:50, Vladimir Sementsov-Ogievskiy wrote:
> 
> Hmm, relying on flush requests sequence doesn't seem reliable..
> Maybe, it's better to insert blockdev-add filter after JOB_READY? blockdev-reopen should work now for "file" link changing.

s/blockdev-add/blkdebug/ :)

-- 
Best regards,
Vladimir

