Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2454CA2E3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:11:34 +0100 (CET)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMtJ-0002Pn-1D
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPMpd-0007qs-0T; Wed, 02 Mar 2022 06:07:48 -0500
Received: from [2a01:111:f400:fe0e::719] (port=64130
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPMpY-0001cq-HG; Wed, 02 Mar 2022 06:07:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpfJz6ZHj8jQMly/qebJi6fYJJrVz9ilB4NXOGZ+WSCjAIRJ+s/9fRL05FQv4WPEfsox2ad5RWx4P2EgovxAyR/uk+dDOP4ZGbaU5DW9Xxo1ZlrX8H8HxRzGwuf7KmbDjwpohlEnMVtJu2Ay9NpBf0rYjWAweRw6W431iJOAWUQcMMCb8TcSM0KyqP7yjseVQLRmhoLpOR3VdH9kSdLnZ48OKLVimwis5pp5rvGZTC0lXQ9YUnaN0bt+MTqMtLYOdswbpuEnXflGbRjqbmtDqzCkG7Smd5Es38Gfb994amUhvOVxGdXoDmNPrhA6NTtAYd/IbpxpbDG6pIkJwN41Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=684yxOg3iM7dtorg+8qIZGoIR8Dr9Dnuu1FV084+1Xc=;
 b=iIfFfB8r1fQ3iRAcA+FSteVx/bb5scGeGrN/q8GuSCOIguRICIPJ3blRrxwfRkglmL35cLq/L+ROkoIXCfT2vwuoXsjm2pjOYL0tQzzf3i70ky2jCYbqJhx1dlxtJrc+lrEQx9LUtNmPkC9THtMlGj6ETtUiBEp3eG8vVoL74VmLvdM9708SmOg8cMxzNH9+eoREo0kLtwvgYrHxlfjeX2syLScpYfBrFLk4Aztnb4rTx1DJE6RCurKXBeL6NBt7BWOYkOrvCvh/vfDTmWScu01l9hKdb5HW+8a2Jzu8HJeMdr9vG5dwgtJvzN1gQ2V9/KCpzSaXZDhr6KSpfQ5n1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=684yxOg3iM7dtorg+8qIZGoIR8Dr9Dnuu1FV084+1Xc=;
 b=HLoMw1UxjBvWUG3CeM3tPmyukwwTo890l2sT9j4Qfw0yOkf11QTW2pXkAZmfbrC9Vg56+t+T5mgm6CkXPfRAbxhhdgN1yFTtPocp1nhP4Tn9reDuCGvrYxFYvoUTiZWlbnT+V9vYG0HMRNuyTerjkvQ5rgRrE7b8nvUxbFYQrIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6784.eurprd08.prod.outlook.com (2603:10a6:102:139::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 2 Mar
 2022 11:07:35 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 11:07:35 +0000
Message-ID: <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
Date: Wed, 2 Mar 2022 14:07:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220301142113.163174-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0010.eurprd03.prod.outlook.com
 (2603:10a6:206:14::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f990b814-df45-4a2d-ce52-08d9fc3cd9ba
X-MS-TrafficTypeDiagnostic: PAXPR08MB6784:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB67843C3FBB260442F7AD0F09C1039@PAXPR08MB6784.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k991Ec21YJJ5C6czOkWwyIgukzXhbKUfS9l2mqbJOcwYYWZOeM3QHMrYG3gwQLCKcPRUCHFIWrTjpiZBt0aAHeo6QSFVipW9CCovlX4wvmS0+i6nTfvaDeaheXSDkFNm5RZsUNGJAITff0W0NPftnUtX/DoHFDXnFu+Wnv1r/K64kYSM4V9Mz8RUR7551P7ck1l+H5MD89diXpQUI4ZpLv5WU38O5XK768UK9OXyY5Q7nsShqIfp3oTwKS5cTmABzDHHwnvYn2pVgppOh6STmqVvtKFz7s5akEIQ0w94EhsjHC/9wNNMcjJdKzFal+f+KAHImu9N6TMXSR+9qLKswEKwd4YKSA+irCxL4V2/V02CmgGQBGjSiMVCYHjGocnyA7SDzkzWfldWDtMRkPkmWI3+vuPG8mq5pj22gBd5JG2F/R5/KcP62H5d2s0gLTsfCw0jyHz7vOS6BcoqPHOljDi94XTUlNgeikC+aXfyp7fEGqRrjfUJYMowwo+Jm/PekqkFORPSXHv6iJlf1NhLfU7a1Vxu+sm7fazDuP0MReUoRzAjhCUEsf8fbfRHvIVf6xTxd7KbjEiiSXXTAQTOnW9zaamyaEbX+JmDfjcCsB43OWtcF/AhHJmx9zpZf6WmS49v1EgNU/6Z5cSIJ/2AtOWsCfQPwl/qbY7WHLNOmjD6JgjLskXG1m/rO4kbQOB3rE/luyO0i4GObIIEMte4SIrar1GY0oeuPyI0QfPFjtiU6bNMFqWqXK1B+wSIDIfcy1qa2mll68+yc23mYLemrMwYxBq6U543EFvmYSipCjYBcOrUyuXl7N7/3hymsqgGDlGH0/9Lz4qPFP+RB47Q3qEKXjYnk+M8xgpMMLCmz+lrrtdTpNAdSQrCxEuKCgjM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(2906002)(6506007)(6666004)(54906003)(8936002)(31686004)(6486002)(26005)(2616005)(36756003)(966005)(31696002)(4326008)(66946007)(66556008)(52116002)(38100700002)(86362001)(38350700002)(6512007)(8676002)(316002)(508600001)(186003)(66476007)(206463001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3FydUJvcTNFNHlMUU15N1VtY3V1L0tqMVpFR3VRZTNidXcxTDBXSmgwbHRO?=
 =?utf-8?B?ZlVBTEozT2Q5VWoyYjBiWEhPd1V5UVd1K1VoWFZEd1p4Rkp0b09uTS8yYXI5?=
 =?utf-8?B?WTVCOU1BL3dDYTZWQ2p5Nk1tL29rNUxWNFQyRVZFSWpFckp1N2NpbldNMU81?=
 =?utf-8?B?c0RUMiswZDdmQ09GVnN5SXFpVFdBczhjd2xyVjBIb0s1UWl5dElrTkF5eFU4?=
 =?utf-8?B?ZkJIL29xRDlXaS8rUFNBTi9GM2ppWmpXSVpNVWI3ak83WmhHbmFwdXpVU2lR?=
 =?utf-8?B?VFpqTHFzSkZFM0x1M1N5RE16dVlHeTBhUjF0ak9vL2pNUFZtRTNZQW91enhS?=
 =?utf-8?B?bTgrWVpteGl3Qks5N0pDT3BOVVI0V1l1MzBqcnF0THhSS2tmMjlROGxNSVBK?=
 =?utf-8?B?Y1BxVHFGQkM4bkVRdGVBSVhRTTR1b2xid1Bqczc3eXZnaVlTc3RZcmZSS0s2?=
 =?utf-8?B?MjRwSWlLdU1CYzBxUG5YaHF5cEY1bEl1Z1hnNG9lbnZkMmF4NGtIcThsbWlD?=
 =?utf-8?B?bFU0U0hNQ2I5QUFkVFprazVMeHpVcE5WTmV2bkIyOHdVU01FcFVSNTI4S0J3?=
 =?utf-8?B?RWJ4dlJkTXNqS0ZjMlJnVTB0QVQ3bURmOTgxemt4cFRRT01tdEUrNG1wTlRG?=
 =?utf-8?B?elhUQkRXTG5zaWhtcUt4a1pMK0dseDJxMGtDNEQ1SVJ5a1VaeHVwbEZiYTVK?=
 =?utf-8?B?UE45SjNFaFRkVXdYSVkvekVFdmNwSk5xR2YzbHYwNWJaZmc2dElLamNVVGpu?=
 =?utf-8?B?L2xvZE14by9SaVRmY01RWm1TVDM5OCtUWE1pMHJUU1AvUXk0b3h6V2Y5RFNk?=
 =?utf-8?B?c3J3Y05JOVF6dHMyT1J0eTU3aUVpZXJvSTBOWWRyaGhqSGdpR1JQSG0vSldq?=
 =?utf-8?B?cWVjK0M1M1lXWDZSZFh5L2wwamVYWFdHZGZITUM2ajdGbUVWUWI3b0tEM2V0?=
 =?utf-8?B?M2dpTGVWa250V2lPMi9SQzhBV1ZJa2w2SFFlUkRHNzhvZFNxY2k2WDcyUXR5?=
 =?utf-8?B?QnZXbThvN2Q4UzdaRHlWcG4vRHpMSlI5aUpBWlJ4eHQwTVdGUUZBc05qTUFk?=
 =?utf-8?B?U1BkaHNLNUZRS0dod01LLzRWKy9yc2pLZVJsZSt0b25mVnkzNmF3dTIzTy85?=
 =?utf-8?B?UndwamlsMmtJR3RHMTBsQ2QrcHNPU0syRk45Zm5FODZaNG1scGw0NmhQR1JM?=
 =?utf-8?B?TUdzUHFzT21KV0t0THllZGZzZEhBbHlGZU51bkwxSXNSVTVJR1VvZTRCUGNx?=
 =?utf-8?B?Nm1mdWJzWU9YODZTQU9LT0cxNTc0d2lzTWgrVVZQQXJHSVlac2FOTFN4UU9G?=
 =?utf-8?B?SUNuWFkwd2xUMnNUUFpVUG8vMHNLT2VBRjBHSUhQVE9OaXE1TzBtT1F6Q1N5?=
 =?utf-8?B?ZWlPVWRvSVVXVGlCQmZHM3l4em92YUwwZldndkRWT01sRzZVTStmbU5Jd2x2?=
 =?utf-8?B?TWdBRUNEMjdvOHd1dXRFVVNWZTJUQ0RSSVJBdWx4bmE0OXJqaEV3U0NJRlpl?=
 =?utf-8?B?RS9LdmFWVTNTdGsrR2xBM29rQ1d2WW9IZ0VFeE8wbnFCa3dMUGJrblFvdDJ5?=
 =?utf-8?B?bGlVRExFYnIrMGtackpuZVZGRFVNSzFTamtZQWUwaS9XaEk0cWtrMEwyK1V3?=
 =?utf-8?B?c0I4V24vZVJ5MXVvRFpINDUxR1VsWEM2T2F5Q0ZlZ1FvRWM5dWhWMG5NQjBW?=
 =?utf-8?B?OVUzTURhMXlhOXBpZUNWcngwdjdyUk1qOE9YMHBKcnpBQjlqY2xOYmJHVDVB?=
 =?utf-8?B?bjMvVjhzdHRHWFdMaWVNOHFlTGNDWXBUTmF1VVlkMktHMWNPYlplV09oeDRy?=
 =?utf-8?B?dWc1U3JNQ3k2amVmOC9FV2hCVWhlalgxT05keXM4bkVVd1N1OXF3cEJEd1hp?=
 =?utf-8?B?a09NRXdpbEhFbnVuUFdxOVVnZTJsalY4VGFBL0tZTmtBSTZURkJKM1JTcHFo?=
 =?utf-8?B?andUODZKK2hCK1lrcXZNSUJ5NnlqUTErd1hTTisxY1hEU3ZHcXVaNjdTbVVX?=
 =?utf-8?B?Q1o4VXVHR1QvTkFVcDBMajk1ME1FZFJRWWxQbUJVbWRGWENpZ2Q3Q2pmTUIv?=
 =?utf-8?B?cjl4MFRpck1lVzhlRUhrMCtMTmdSSWVYZ3JrdTc3YWJGQnVaWmo1TzNmZktF?=
 =?utf-8?B?S2dRSG5xYTZFVjM5K1VjUDV1WHdrOTJuZXpPR3hnZ3Q1RXo5eDVsc0V4LzRL?=
 =?utf-8?B?Q3kyZEtOTGEzNmtzd29WcEVYbE1IbVhIQWxCYmk2d1NWSVNwZFpFRk5aL29m?=
 =?utf-8?B?OVJOU3UvZFhCUU9DRUtBcE5CVHJ3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f990b814-df45-4a2d-ce52-08d9fc3cd9ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 11:07:35.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byQ82ZkATApR2/4EoLZDJhefUZCsfoxxbAf5iUBJ63znFuG3DO2NCHxI2z+A1FqyD9yAR6QfDM3QPmna4miRSivqzESyvuSZY6yBcuTy9AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6784
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::719
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::719;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

01.03.2022 17:21, Emanuele Giuseppe Esposito wrote:
> This serie tries to provide a proof of concept and a clear explanation
> on why we need to use drains (and more precisely subtree_drains)
> to replace the aiocontext lock, especially to protect BlockDriverState
> ->children and ->parent lists.
> 
> Just a small recap on the key concepts:
> * We split block layer APIs in "global state" (GS), "I/O", and
> "global state or I/O".
>    GS are running in the main loop, under BQL, and are the only
>    one allowed to modify the BlockDriverState graph.
> 
>    I/O APIs are thread safe and can run in any thread
> 
>    "global state or I/O" are essentially all APIs that use
>    BDRV_POLL_WHILE. This is because there can be only 2 threads
>    that can use BDRV_POLL_WHILE: main loop and the iothread that
>    runs the aiocontext.
> 
> * Drains allow the caller (either main loop or iothread running
> the context) to wait all in_flights requests and operations
> of a BDS: normal drains target a given node and is parents, while
> subtree ones also include the subgraph of the node. Siblings are
> not affected by any of these two kind of drains.
> After bdrv_drained_begin, no more request is allowed to come
> from the affected nodes. Therefore the only actor left working
> on a drained part of the graph should be the main loop.
> 
> What do we intend to do
> -----------------------
> We want to remove the AioContext lock. It is not 100% clear on how
> many things we are protecting with it, and why.
> As a starter, we want to protect BlockDriverState ->parents and
> ->children lists, since they are read by main loop and I/O but
> only written by main loop under BQL. The function that modifies
> these lists is bdrv_replace_child_common().
> 
> How do we want to do it
> -----------------------
> We individuated as ideal subtitute of AioContext lock
> the subtree_drain API. The reason is simple: draining prevents the iothread to read or write the nodes, so once the main loop finishes

I'm not sure it's ideal. Unfortunately I'm not really good in all that BQL, AioContext locks and drains. So, I can't give good advice. But here are my doubts:

Draining is very restrictive measure: even if drained section is very short, at least on bdrv_drained_begin() we have to wait for all current requests, and don't start new ones. That slows down the guest. In the same time there are operations that don't require to stop guest IO requests. For example manipulation with dirty bitmaps - qmp commands block-dirty-bitmap-add block-dirty-bitmap-remove. Or different query requests..

I see only two real cases, where we do need drain:

1. When we need a consistent "point-in-time". For example, when we start backup in transaction with some dirty-bitmap manipulation commands.

2. When we need to modify block-graph: if we are going to break relation A -> B, there must not be any in-flight request that want to use this relation.

All other operations, for which we want some kind of lock (like AioContext lock or something) we actually don't want to stop guest IO.


Next, I have a problem in mind, that in past lead to a lot of iotest 30 failures. Next there were different fixes and improvements, but the core problem (as far as I understand) is still here: nothing protects us when we are in some graph modification process (for example block-job finalization) do yield, switch to other coroutine and enter another graph modification process (for example, another block-job finaliztion)..
(for details look at my old "[PATCH RFC 0/5] Fix accidental crash in iotest 30"  https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05290.html , where I suggested to add a global graph_modify_mutex CoMutex, to be held during graph-modifying process that may yield)..
Does your proposal solve this problem?


> executing bdrv_drained_begin() on the interested graph, we are sure that
> the iothread is not going to look or even interfere with that part of the graph.
> We are also sure that the only two actors that can look at a specific
> BlockDriverState in any given context are the main loop and the
> iothread running the AioContext (ensured by "global state or IO" logic).
> 
> Why use _subtree_ instead of normal drain
> -----------------------------------------
> A simple drain "blocks" a given node and all its parents.
> But it doesn't touch the child.
> This means that if we use a simple drain, a child can always
> keep processing requests, and eventually end up calling itself
> bdrv_drained_begin, ending up reading the parents node while the main loop
> is modifying them. Therefore a subtree drain is necessary.

I'm not sure I understand.. Could you give a more concrete example of what may happen if we use simple drain?
Who will call bdrv_drained_begin() you say about? Some IO path in parallel thread? Do we really have an IO path that calls bdrv_drained_begin()?

> 
> Possible scenarios
> -------------------
> Keeping in mind that we can only have an iothread and the main loop
> draining on a certain node, we could have:
> 
> main loop successfully drains and then iothread tries to drain:
>    impossible scenario, as iothread is already stopped once main
>    successfully drains.
> 
> iothread successfully drains and then main loop drains:
>    should not be a problem, as:
>    1) the iothread should be already "blocked" by its own drain
>    2) main loop would still wait for it to completely block
>    There is the issue of mirror overriding such scenario to avoid
>    having deadlocks, but that is handled in the next section.
> 
> main loop and iothread try to drain together:
>    As above, this case doens't really matter. As long as
>    bdrv_drained_begin invariant is respected, the main loop will
>    continue only once the iothread is "blocked" on that part of the graph.
> 
> A note on iothread draining
> ---------------------------
> Theoretically draining from an iothread should not be possible,
> as the iothread would be scheduling a bh in the main loop waiting
> for itself to stop, even though it is not yet stopped since it is waiting for the bh.
> 
> This is what would happen in the tests in patch 5 if .drained_poll
> was not implemented.
> 
> Therefore, one solution is to use .drained_poll callback in BlockJobDriver.
> This callback overrides the default job poll() behavior, and
> allows the polling condition to stop waiting for the job.
> It is actually used only in mirror.
> This however breaks bdrv_drained_begin invariant, because the
> iothread is not really blocked on that node but continues running.
> In order to fix this, patch 4 allows the polling condition to be
> used only by the iothread, and not the main loop too, preventing
> the drain to return before the iothread is effectively stopped.
> This is also shown in the tests in patch 5. If the fix in patch
> 4 is removed, then the main loop drain will return earlier and
> allow the iothread to run and drain together.
> 
> The other patches in this serie are cherry-picked from the various
> series I already sent, and are included here just to allow
> subtree_drained_begin/end_unlocked implementation.
> 
> Emanuele Giuseppe Esposito (5):
>    aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>    introduce BDRV_POLL_WHILE_UNLOCKED
>    block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>    child_job_drained_poll: override polling condition only when in home
>      thread
>    test-bdrv-drain: ensure draining from main loop stops iothreads
> 
>   block/io.c                   |  48 ++++++--
>   blockjob.c                   |   3 +-
>   include/block/aio-wait.h     |  15 ++-
>   include/block/block.h        |   7 ++
>   tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>   5 files changed, 274 insertions(+), 17 deletions(-)
> 


-- 
Best regards,
Vladimir

