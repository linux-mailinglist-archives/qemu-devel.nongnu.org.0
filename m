Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8733C033
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:43:31 +0100 (CET)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpNS-0006b5-71
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLpKY-0005RD-5a; Mon, 15 Mar 2021 11:40:31 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com
 ([40.107.22.116]:28257 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLpKQ-0006QF-7d; Mon, 15 Mar 2021 11:40:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li1sTVcLtP4AnOLicmoHZIzkfgXqB2Pk38oWR8vJuuhp4LO5Rxibt/xM98G9z4tVJg7L4s/diX2YaydlJgyQd1Qz058A+OvfL+fwA28eHR4ywlcHHT/oyCaHaRedky8xpE3Ubb6VlEmvGwvB1RkVVIxSyU3BG8/Tv4PcfQS5d1tFStorFZzfyuphjOAJBdaJUdcz7uR5T/6hJqps55FIDAZyvqpkcCexPBW1QV/vLRl0UhS0Ka4owR0QBac69wEElA11r6pTZMuV9QwWiN/mRJJ7Gj1dZkC9qJxv6IfsTfQFfRVL7qpTWmWPQHEPtwcebytQiRNkpo8vI+qWLKTDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4LMO//1lCiiEHE7BNy5Yrx3JgAIV1abB+aa1KhyFaw=;
 b=BCaJiHuq2bOnsVB6tEsPuo4vxkfUoWQ1RQWJe9lZolwyX3BLWI3QiV0maMpFeZtmgeGX4wvTKRAqY+4n29S2pmVvLnpBcX5ulh5hl4zYscjJd+36qkf7rlYaOJxpvCzDy81uUK7pq/I8SwftkN5vq/rrZuSkbtC36iT9vTjSaeJGudYBRr2if8yc8O6vjUd74e7mgFsL1aFVUfDiZL78p/P+1tgPQ1NwLIwrRWldPaMASJ8bYlplFXAz9s6qJCAjocFsd7j1ccoo6HdMBWYZpRFBN/LXZ5g5qOizzlbe5eBXJfYDLKTNw0F1cjN2qPUAimsiF0wN08sdOfeIM4YVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4LMO//1lCiiEHE7BNy5Yrx3JgAIV1abB+aa1KhyFaw=;
 b=mn6cdk5xaeiGVahVS+NFuiJITuljxoIXXqa5uKMbTtDf97p+z1sOxpLmsmMKM9/ZJrQyDbN36tVNZmGl7L4CGIIvBGy7x4l6sHoQFDTM77x8RzNUsa01DEp16kQXH/vZI5oNgNHRBkcueP0rOmnZMD3nEchyRFYT8t61y8TM8Tk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4785.eurprd08.prod.outlook.com (2603:10a6:20b:d2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:40:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 15:40:15 +0000
Subject: Re: [PATCH 1/7] block/nbd: avoid touching freed connect_thread
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-2-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b551f5f1-fc80-db3c-57a8-627195048bf4@virtuozzo.com>
Date: Mon, 15 Mar 2021 18:40:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-2-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0135.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0135.eurprd02.prod.outlook.com (2603:10a6:20b:28c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 15:40:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5846d8b1-c88e-4caa-caa0-08d8e7c8a0ae
X-MS-TrafficTypeDiagnostic: AM6PR08MB4785:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4785F3A03A223EC97DE84A8BC16C9@AM6PR08MB4785.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shtI9x7QXqkosay1RN2ybyBSRJKcYUeeWdvUaXnNsA1jyQVA2eVRHV1y7z8nH2dnIewTu4OAt/DmU172EMJJx6IwO+NlVz5o1Bd1kW+1utlJmvpNScmwbSdhuXljPi6pO/s+Utt05fPWg2s55/d6qTYyJKDaDHq8xvNtBrySF45SP/eUNLH6folDihKHb+4umbRKCsF7R7toeaoX3w9PNrcdH5AP+3QXqPmY9YfdolNONfVPIEHA40M26htmK5w1ChVC1WJ8IB7rBiyEFePXw4SLAolmsAAN2qaseznm1sHDMbJ5efrKw5he+bzNaQEKB7iZTsdEG1qJto0C9To7j5xHDnwwa9pQoBKdR6GU6kjDbp1Dt9uN3jhfqaovTCtwaV1Mh9FRG/c+qZDL6leptE7p1dyYYWj/2TUtXc+B15w71BK85ImGaAvBImM2U6bVTpnVqLcNp4WrWwhKz4dvWB5mLNSenpQfxltXAiIRkMPAj6CoWzHKOQ8lS8pLVRb8apVGWoFfBePGGpUn7oZiiNMmBaCiqabTdoNewZ2gE/x9uomQekT+CnDziWdAqdO3b3GCffIjaAvWyAsdRCHy8j3ELbXbwpocKJffkMVuJnU3DvydkajV/iQC+KI+xazbHpdvZjnWnchYJrrMJS218g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(36756003)(52116002)(4326008)(83380400001)(2906002)(2616005)(956004)(5660300002)(66946007)(86362001)(6486002)(31696002)(66476007)(16526019)(186003)(66556008)(8936002)(478600001)(26005)(54906003)(31686004)(8676002)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TG9XV2F6NW4zalN4d0xtU1dUV3NmaGU4WEZZMDFaOWF6MXBZRXNyZEhpYWFt?=
 =?utf-8?B?Sll5Z21MNm1hZVl2a0MwZHJ6OElWQmg2YzJGeFJ3ZW81ZUcya1FtZzNTbXVD?=
 =?utf-8?B?aHl4dFl3MTBmVit2NWwwMEcvYmRxU0I4YUh6RXJPYUVyRCtsc2lzaDh2VWlk?=
 =?utf-8?B?TUxVUE1aS0QxNWErSXp1bUJzZ2xwS1JGUTdjVVNBaktUVlBZdHhrZUFBNGlS?=
 =?utf-8?B?ckdpRlVYVitzbWViUnFpWXB4Mlh3MHlPZFVGSTI3d0xnSEQxRU9vaksvTG1m?=
 =?utf-8?B?Yk5Fa1A2eDhkSTIzYnJob1RaN0g1Q2t0bkJMV29udnkvUjczV0hPdE0zK3Mx?=
 =?utf-8?B?c2hNbEQ1VlRPbjQ1dkl4NHphRUNNWWRBY2k3V1VKSXRNbm5HeUpUQWxoV0F3?=
 =?utf-8?B?MlNoZzlXTlZkMXpZRWJWN1dWM2NhWUVqTERoVG5XVnp0SE4yNHg2ZlZtTEhO?=
 =?utf-8?B?Mzh3Z0VDUGNiRDgyZXdvOGFSV1hidVVkd3Q1aU1TeXdEOERYQW4xRFpRVlFB?=
 =?utf-8?B?eVRsZVd1dXdoVlBFYVdQeE8zMno4RDdNcDB3TGc2clpXeUphckhDNGJGY2ZB?=
 =?utf-8?B?ZGJWV2FvRUJiZ3JJWnNCd0NrcVdLbHh3YXFyUENCaUZIbmVzZkJaS2xldWNw?=
 =?utf-8?B?T1dhSFFVSHExSVV2M1ZXcUtkZUFKbUR3VEdRZlQ0WmdpaEh6NmNyOVBVdFdZ?=
 =?utf-8?B?T3dpMFBHd3R5NStEYi9OU0NyWjhHRit6ZHlkUmFMSmNZVFZPVkR0WGMreW9O?=
 =?utf-8?B?dEd5dFd6VzE2cXBtTC9WWFJpcEJIdFNkUDBRdFYzWkVsRjZ1cWZqS1pzbXph?=
 =?utf-8?B?ZHJuSmtBOUVYbWxLWnBUK05tS1ZKNzdSNExUcGkwZ2dwK3hrQ3JBMEh0Skl5?=
 =?utf-8?B?aTBlWGd2Q2QraHhSV0ZPMUZzM3FvblAxNnBiNkpmaEpScnRjanMzdGl5YXJ5?=
 =?utf-8?B?bTQ1T1FBK1B6R2dGc21IeFQ3SFplMFJnZ3MzT0hlQ0pDbUkzbnhHR2pabi9I?=
 =?utf-8?B?c1VIV2xYTlhrYytKS3Z4RXF4VEdOVWlKWVVaRmRadU1TcFYyN2pwKzdiUDRx?=
 =?utf-8?B?QkY1cWhrZ2ZNLzY5WmpEZUFOdnNBTnFQSForRkZXbmtoaFdnMzIrRS8zUGxI?=
 =?utf-8?B?RFcxdXNGYTVXdGNQQlBieFZFQ21kdXBmRGFXSTVsMm05TG1EemxVRHR5OHFo?=
 =?utf-8?B?aU5HQTdPUDR6NnJxY2h5eWUwWEduWEJHbjhMcThneDlqcjB5Qm55QVhyNStB?=
 =?utf-8?B?QVAxQkNBNWZKd1ZDRHFPUCt6VUNwUGZQRlFWblBDT2lRS3pTSzR0SmVoNkZB?=
 =?utf-8?B?cks2R3dFQjRDMFp5OGtZTEFvQnhtVjJPZUkvQ1NTTFdzbm5hQ1lMNnd1WEhv?=
 =?utf-8?B?VWd3N1ozYk1wbSt1Y2VWbmo4R1l6Wk1hZEdjSGZzbTlhU2dvanNHeGVsWm1F?=
 =?utf-8?B?Sm5PTngxRXp5U053NDZzVzJhd1dvZWw0d1VubmpzUUJaWnBVNGNtMFoxK3E2?=
 =?utf-8?B?SmlpQk1UY3IvZkltRWFGVU4wK3JoUU9lZFlrUGVHeGV3azlTOW01RHh2djgy?=
 =?utf-8?B?Zm00MFZucmpOcTJKL1dJdGQ5SExIQ1RHZWdKT2x6NDBVckU4OFFObjdlZXBJ?=
 =?utf-8?B?eFV5VFF5TFR4U0FoR29pck9WU0NjRHhybnRiWkZHdTNCNEdxc0EvdmFHdmVr?=
 =?utf-8?B?VnFyaDZzQ3hmRjIyVjZKV1JibjJkTWp4VlpEWFA2RWp1dGRIUlhRT0ErOTY2?=
 =?utf-8?Q?/O5/zpDjQpMIp1RLKQrHffRekVi+S5VSQWyeVwb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5846d8b1-c88e-4caa-caa0-08d8e7c8a0ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:40:15.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTEqdg8DDBfeoybiopTYY9fNds2eu7oMIAWsWg8Sq6Nyo7eZNwNIF/8hOSiy68JWTe/6fK6WJYzbthlUJ1X8Yy8oY/I+RqFd/Jkg/AZcrik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4785
Received-SPF: pass client-ip=40.107.22.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

15.03.2021 09:06, Roman Kagan wrote:
> When the NBD connection is being torn down, the connection thread gets
> canceled and "detached", meaning it is about to get freed.
> 
> If this happens while the connection coroutine yielded waiting for the
> connection thread to complete, when it resumes it may access the
> invalidated connection thread data.
> 
> To prevent this, revalidate the ->connect_thread pointer in
> nbd_co_establish_connection_cancel before using after the the yield.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Seems possible. Do you have a reproducer? Would be great to make an iotest.

> ---
>   block/nbd.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index c26dc5a54f..447d176b76 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -486,6 +486,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>       s->wait_connect = true;
>       qemu_coroutine_yield();
>   
> +    /*
> +     * If nbd_co_establish_connection_cancel had a chance to run it may have
> +     * invalidated ->connect_thread.
> +     */
> +    thr = s->connect_thread;
> +    if (!thr) {
> +        return -ECONNABORTED;
> +    }
> +
>       qemu_mutex_lock(&thr->mutex);
>   
>       switch (thr->state) {
> 

Patch looks a bit like s->connect_thread may become something other than NULL during the yield.. But it can't actually. Maybe it will be possible with further patches?

Anyway, make sense to me:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

