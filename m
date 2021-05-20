Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3638B068
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:50:10 +0200 (CEST)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljj3x-000350-Fj
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljj1w-0000wL-9p; Thu, 20 May 2021 09:48:04 -0400
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100]:53341 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljj1s-0000UP-Te; Thu, 20 May 2021 09:48:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmUFrRZR7W7ad4LNtSkUrwgkYhGEUGL6QxTq2lQRRrrfev1YTwmpah6YsaLs9bHXqqEVK7PPTiriRuIxT0bbu4PSpFZrRLXSog6ig/gRcOV26wVvMvjYOOgSG7qMJXcykXRlE2Z1PDGz8qXTTM2LpvsLvaHXQj0MS/CF+cqQ6GDO8Cmej7NBUWAIoKTCHmXMMCRNISraleoShvaVy8edOf8pSB3clKyUsERHMULABiu7/XDB0EHfkactrF2nQha0FrMhnVEjxbsVZtq4yu7oBHRLiHUKBX2JrrGFf45h5ThfH2gGvOiVhPCwxSt7pxqAxmQMLrLFUIog/lhdiMKMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQMKaUuG8fcD9+w9K3Q4OFpVM+JaTvBCCRpqo7XOQP8=;
 b=famZWHRB+BvaXW9EMYxs8AW8fecz17rR0IeaTM6qVOcvSD/NpHL1l2LwJlsLOBTP4ik7avebbXhAMIonKO0cYbEeXuPYjlt3g6DiYvDeRvdprGvodTWmTdopg85HY3FDeNgxgJGfLJd8IJ1c37acbzejvps25JYbMpHWvDJ6CwEmMYaJBMenMFloowDVwwRmFxrqAwkK6sWYZy8wc86qMZ8R+yPB9qJIom9TRxcR312EZpbB1Pl5+PrUvZXJjO3ERbems1O1FQMi+jO9yWspLg4bCP0sCzNERIe3ki7gE7ddlOwgqKS26/Q0YFNP4Yyx694qJt4sdzPcxQjJxAv2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQMKaUuG8fcD9+w9K3Q4OFpVM+JaTvBCCRpqo7XOQP8=;
 b=PuB6wdJ0VmVvSofKNAPT2uIlK6TozX0hGsfGdzAH3XZ2Ehd4n3DSVlKApNuRFGoyMFNvVuqvYH4dxz35S2/PZOrSezgiWy6+04xUd0xqEdwMeFgcFuaL3ZFQnedOj5+KT4/IlKxraMg02bXbm3idwvWj5Qn4GTDqdauQtBFevRE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 13:47:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 13:47:53 +0000
Subject: Re: [PATCH v2 0/7] block-copy: protect block-copy internal structures
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <461d6a3f-9eea-1988-e283-7025329c2f33@virtuozzo.com>
Date: Thu, 20 May 2021 16:47:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR3P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR3P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.32 via Frontend Transport; Thu, 20 May 2021 13:47:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 320233b9-ccaf-4c51-e95c-08d91b95dd6b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6808:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68082CBC3F8401B3BF6F75CDC12A9@AS8PR08MB6808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bqw2jL9erVhhRVNPia9TGgKKL9r9lFomNljkELhhW+/yQXrYjD8HnJMiLyDkwnIz/u9GAmkoIfXS+BfrHqIbS2g13yFdVme33aYcCLGEs4XA7gX1Wq/afSaXjkUEMDgM6wmXRFCr6CykpAbE2zye5v2QjBVWV7XKXYA6qLSh1C94YuXY4RLlhDGkyA9sw+VK3C7wBeWtuEu7d/pwlfOOaxy+QIJ14yDQMOxsxDhVJhUglj8zaol05awjfDc5Vau3ZR6hRY4F4FYw3gtgi47ac0hqeLoUJampKk6tFTnbk/NtwENemanvYf1PI7H9tM61zURIh3q/UXjrenFzgauN9kB0gi+aazDkZw6Kx1VljJpr3VC3hIiD972rigYs0OHxbEGl4Q/LbsFD7bCfUT+vbTiQD+WHVnIW80WA+muXns0CcEDyLDu7v/xbyLLegXbJ93ugsMWN4JqZEo7P0c6JLo6ftBQUnWLNfTKuvSPnjPlA65maDJNIrDx8A2nylL3nAVP3NIOTAKP/NTUkPJk9PVvGZpRf+1BRHASb04462wYp2/igu1HTyrjiYEbrhzMtR1CIK8TwvQ6uwElmBdfNsbcbLB/qT5BKQsaZzrSjarVKNjqdaLJb/4ANz4iEyIVVBkxbte6M6/1vTsn6z4fWvghmmBvrSrzE6I42Wujz3nIu+GueUa3OAgI8Ug+m5ynywSplQvCSALmY+sUSW4MOnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39840400004)(376002)(38100700002)(316002)(54906003)(8676002)(38350700002)(16576012)(36756003)(478600001)(956004)(8936002)(2616005)(31686004)(2906002)(4326008)(26005)(6486002)(5660300002)(83380400001)(66556008)(52116002)(16526019)(86362001)(66476007)(186003)(66946007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YjZseEJuazN0b001SUpJMzUvc3ZwYmpRemI4Mzg0ZGNRczdPRFJraU5VYUVq?=
 =?utf-8?B?STdFMU1KQXdWZnowcS80Ly85eGJXemRsU2liNmxzV0g5TURDKzBmMERYZnBU?=
 =?utf-8?B?N2VlOHZqMDRrcCtOUEtxcXhrYmhhODBRblBXZm02eENlOVJkclJFdTlPejBF?=
 =?utf-8?B?RWhvL1lqSCs2cGtRU0NLalhldzJvaXRCRTVFTkxnMjY3QVF2RnVWYi92VExX?=
 =?utf-8?B?NFMxRGdicnJCQ0JyWVBLRS8xM2dhMXlQMUFnWUF5dWVkNUFYSDZneWVRbUpQ?=
 =?utf-8?B?UUZPdFo5NzlHbE1Pc0UwelF0SnZBODl2R3JNZ0JqclIrcTNYbE9mdkREdmtQ?=
 =?utf-8?B?QS92Yy9pUVl1ZkZ3L2xSa1lSVVBLYjNHRjBQNkVacFRjd3hNWE9jemNLQ0JE?=
 =?utf-8?B?d0J3OWNXajRvNlE2K0hnNUVoRE5Vb3Z3eDdzMnRvOW1EY1VXc1NxaEVRRWli?=
 =?utf-8?B?MytCNkRrTWdsUkFvbUZPOTk1NndZUXMvV2F0elk5S0F4b2Q5VGd0eWs2V0x4?=
 =?utf-8?B?N1QvbGYyZm9zc3ZMclBtVHlCdXc5UFEvRW1TTEJmYTRUL3lGQnNHd3hlTWFy?=
 =?utf-8?B?KzVWdGFTWERwbTE0Q0QxVHJxTlJ5QlY0cWRtUlZ6SWpUb1ZQVGcza1BINERp?=
 =?utf-8?B?bURxZjJsemZCY1F1VFJBb2FPcyszM2lGOW1Kb0ZUS1BSWDl1U2RQdnJaQ0Ja?=
 =?utf-8?B?QnQxVS96aWdYQ3dieWxTUWhRZGZ6eldmaFZZMG95Tm03ZldWUmVXZnlkUFpy?=
 =?utf-8?B?bVJzLy8zZkhCVi9iRmcwTzdhTmZKQXZXMjNSNTA3T2hVZzNHRnB1QXhxdE5I?=
 =?utf-8?B?VUpUYXJsbGg3dnNvT0xMUGJOYTNIT0s2ekpmbW05cUoxL3pFbEtwNjlGTE16?=
 =?utf-8?B?bmwwNWVnWXdtU2ZFZUVweEkwdHNqanFhOGhFd1dLN2VNWm02Y01KdWZiUnB2?=
 =?utf-8?B?enUrNm9GanRMa0V0V1pwVFlZMjJVQ080UG4ycGxQbXI3VitJa3orRDdjeWM2?=
 =?utf-8?B?WUM1MUt2QlkzY09VNWt6U213UVBjeU9Yc3RSNkxmN1hOSDR1VGRPbVAxUXpo?=
 =?utf-8?B?SjVoaTQxdlFBcHBvaTFhRGRKYVJqNld5RHBwN1k3NGRZalJBR09SR3luUmdl?=
 =?utf-8?B?K0ZYbHljMlNaRnlXaXVhb3VDdlNhZC9Hc3dCYTJ6RG5RcFhpd1REMTJvTzhR?=
 =?utf-8?B?dDhNeHJZclhUT0RYdUtZWWRmcGpzd3lnVkNWYmtsTTN5S0hpTUZzUlVDdmF1?=
 =?utf-8?B?eDhQUHRiTUJSYU8zQTR2MzBoMHVRbnJIVW92S0l6Zi9TbndqcHRUeFNPNmJ2?=
 =?utf-8?B?djJiVjhTVXJDWm9WWDJkM21FMThQNTFUclBWQzR4NWpER0pEZjY5ZGR4SWds?=
 =?utf-8?B?S1YweVh4eUNySEc4TjFyZjlJZElOL3FlYW96OUxIMmVCTXg2bTMzY2Fia2lx?=
 =?utf-8?B?SG9YZlpiQXMrUlV3b3JGZTdUaTRqVFc3V2ErZlhVaHh0OUV3KytxMGZPYnJh?=
 =?utf-8?B?dWhFMTExSmIyS0QxdzExWnI3eXpUVGcraVlhd0FaSFIydDJXenJSSTJRL0xP?=
 =?utf-8?B?SWV2cktldHh1SGJJWHpXMWFpTzV1MjM2RjFvbGJkUnNVZDZpYyszNC9XVjli?=
 =?utf-8?B?R2Vud0xFVVd5a1p1MjJxaUNMcFFLd0ZieEcwUkhUTlNWMjlaZS9ocGhrMHdo?=
 =?utf-8?B?c01aZVBiZ0g2RFB6dTBDTUJ1aWxEdjlrYWdSNUMrRndJL3UyZEU4NjRGc3BY?=
 =?utf-8?Q?ydRWALfJNrgjfZ8vbgV6fsHnUIYwUu1v2V0Jolc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320233b9-ccaf-4c51-e95c-08d91b95dd6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 13:47:53.3079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzYCMZPblikcccbL868/JGIdX/MK8BrnjZpjttaIqKuxf6ImKBo1Z0LnNinTftDTuxMl/bIYFB1D65txsk7/i9CUQPrdtLNvKHSUVsHTEfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Received-SPF: pass client-ip=40.107.7.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> This serie of patches aims to reduce the usage of the global
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.
> 
> This serie depends on Paolo's coroutine_sleep API and my previous
> serie that brings thread safety to the smaller API used by block-copy,
> like ratelimit, progressmeter abd co-shared-resource.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
> 
> Patch 1 introduces the .method field instead of .use_copy_range
> and .copy_size, so that it can be later used as atomic.
> Patch 2-3 provide comments and refactoring in preparation to
> the locks added in patch 4 on BlockCopyTask, patch 5-6 on
> BlockCopyCallState and 7 BlockCopyState.
> 
> Based-on: <20210517100548.28806-1-pbonzini@redhat.com>
> Based-on: <20210518094058.25952-1-eesposit@redhat.com>

Hi! I failed to apply this all. Could you please export your branch with your patches at some public git repo?

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v1 -> v2:
> * More field categorized as IN/State/OUT in the various struct, better
>    documentation in the structs
> * Fix a couple of places where I missed locks [Vladimir, Paolo]
> 
> 
> Emanuele Giuseppe Esposito (6):
>    block-copy: improve documentation of BlockCopyTask and BlockCopyState
>      types and functions
>    block-copy: move progress_set_remaining in block_copy_task_end
>    block-copy: add a CoMutex to the BlockCopyTask list
>    block-copy: add QemuMutex lock for BlockCopyCallState list
>    block-copy: atomic .cancelled and .finished fields in
>      BlockCopyCallState
>    block-copy: protect BlockCopyState .method fields
> 
> Paolo Bonzini (1):
>    block-copy: streamline choice of copy_range vs. read/write
> 
>   block/block-copy.c | 234 +++++++++++++++++++++++++++++----------------
>   1 file changed, 150 insertions(+), 84 deletions(-)
> 


-- 
Best regards,
Vladimir

