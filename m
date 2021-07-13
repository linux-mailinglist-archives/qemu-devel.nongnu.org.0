Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492643C6D66
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:29:18 +0200 (CEST)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ej6-0006ns-V6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Ehp-0005tM-11; Tue, 13 Jul 2021 05:27:57 -0400
Received: from mail-eopbgr50122.outbound.protection.outlook.com
 ([40.107.5.122]:39446 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Ehm-0007Pg-De; Tue, 13 Jul 2021 05:27:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyUQtvImOZyu5/FKOJh9lxDLFhykIKEAJ4oOVRCYt6I9rRV4z0DS3iRWV5pajeANpItoqEML1GUF4evrDppZYoNQUpr28rBRlYEuoWAHeu7MwweN0ORB9tZ79bpQCzG2g4is02qjL2MahQMMoR1tv95s1hstWcPaDAIksoPRgLsvmZGwJPH7aWNCNur6YEsLx7NUdRKcutAv+JLfHSuZD5V+0k4XNVuoSccGALbIlCTsIsg8ZWYIPdr5N0bQdERzJTo9DZRQUKfAAfw0gUbgxNYe3Gg1vni+IZt0sIChuwW2Rn4/ryPNBTfRxysdyH+/Ou4KpeXKNJkYoUc1Re+oFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OKYbHFI/CR8F2nEHD/unpalqkdypawnW85hEhR9HdM=;
 b=AXwVkRQ6reIJDkTqtvGQe4b/kUPrhXEP3MYNny+wXVsctvIjASFVgTKHBOp9CZuXXTV+7XYHRLFHJM9nxc0gROVrYuq4yu5Yv+cO70pJTecjfGFu436EgB3SP78DkWyQ4zu0cMWopiRf5EoM0LaYogzZyv9FpVodq0MosZEjgOtWcM6N0KEwzqQH++IK2TWi1aSJuOt46Argdej8miGa+RhsVQbpAp5X8KFoDK74vk2sU13rWl5Ix13SJNCi5lrQY8vbEJk7fVOC13vrn1WZh57BxX9VXFqC8/x99BTJfyeAZk7lLxy9Hh2ley8k0sYK70QVkjlsX9pj0ygr2bkRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OKYbHFI/CR8F2nEHD/unpalqkdypawnW85hEhR9HdM=;
 b=Vzx7qK4s8AtAAGg+nfNe8v3OaYXKpEiPe2jGcpmJY/X66D1Dh+x1/iWJots96pAPmAExREtAESwFGUTIvj1acMBp6MJqWQLTKUK8o632uRoS1eajcEzZOwZw4v/viiId1S291NoHBNE5prIFXQWLtISpKtR6XsfOpzktewIzs9g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Tue, 13 Jul
 2021 09:27:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:27:50 +0000
Subject: Re: [PATCH 01/11] nbd/server: Remove unused variable
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-2-richard.henderson@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bdb476db-6e95-b90e-f218-85612009a7aa@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:27:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712215535.1471256-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0402CA0033.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1PR0402CA0033.eurprd04.prod.outlook.com (2603:10a6:7:7c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22 via Frontend Transport; Tue, 13 Jul 2021 09:27:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42fdbdef-d4ae-4e07-3c89-08d945e07c04
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088C997F885F6C711A8E923C1149@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uP3oFMnMQobLi8D3oy8cpW+55LMkfxWdQXzP6U7ILAPK0q3oMBeuqsCYtgee+agQ8IZTBX/rN3nU+BU7BkE42x0msOH3/xHIrKx5eJQkB9X0JmWfYC5k86Mrzl4y3aNY49Epy+X/sY3YR+3/tJIQ+wVLVvMAKXqTFUi2oEU84YrFSAxCRVoQvq3erGOmLyHwKJPmVm2XBZhO8VVQ+kaA0kkKQKqUk8/vgaK0QQjsvayLs2oFgGfyu/xIs81IAFkKr6vO777TkylUdHXfInmG6LDV0SfykpsaeZgWq4FJMii0GoL5joSI3LT0jVPaCVhe2Zx++QC79aAsa/sEsrPg9b3tfWJdctyT9Jr3pgSCqA0cnuso8LekzzvztFjmIXZ/wNW5/uTIXTxMtyOASMU/Kv7r9EsabWGZoqqW4Bw2S0D6IWKeQ0cZOK8IHe2OQkzvI90rdNijdNSWOOaM+47tadR5qjLdIPw7Jj/lDc/FI2xRnIUc+FbNW5HGJZtx0qJMGTg2ChRcGFabXfVlHcpwcdHQhPo19zClSbPTQsJeqPjACSYsha3SWMt1LenYZIFiQug19OEnsnjzz8+M2ZFJygXLaO2yZ7t/pt8OW9NK1837DdYZP33SrgmQcrSKwmxV48Vy647eIJcn3CybE1030S6uH7Ui+43EohIm8Alnnum20T9D+QbKm5X5Nza3jGZJ81EfVhAzshyjJa7CljBteTJqXdmFx9R3JcNrY8yVhSMWnq5+jD0WL66HhtEo028/+slv7pJg/iZ37WaozTa6KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(366004)(346002)(36756003)(2906002)(83380400001)(2616005)(66556008)(478600001)(8676002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(66476007)(5660300002)(66946007)(956004)(31696002)(26005)(52116002)(186003)(31686004)(86362001)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M054U1VBZVBuWHBBc21oNElJb0Q3VUxpMlJYdHFHcEd6am9GS2d5TVBPOHhQ?=
 =?utf-8?B?bTYzUytVOHBFY3dwNlZDQ01rcUdTdWQ1Tjk5TEI2WkUyUmVzeFR5cGR6b20x?=
 =?utf-8?B?VFd0QmlDMitvUEJGbW5FVHJ3b1F1cVY1QzZsTlBCeEFMN1FCWTNGa2lzcUZI?=
 =?utf-8?B?Ti9aekYxNXBRVE1MWktjbUZ2cHRocTQrYi96S3p0ZlhDdlhscDdaQlJ4elFY?=
 =?utf-8?B?U0E5V3Ixd2FuZ0w4STQvLy9iMUs5M2UrZmx5QVdkQ0l2YjdJdjhxemlQUERY?=
 =?utf-8?B?b01keTc3OENwdjdPYUlrN2JvWWs1eXoxZmJ3UkhhUkMxOEhCSTUxd1RKMFBE?=
 =?utf-8?B?Z0U1amlIaTdZd2w4V1llREdiVXJhelpkaG5VVS9XUlFybEtBZTBlRytCdXp3?=
 =?utf-8?B?b3NEc3VMc0hxajBzQmNwUnRTZkZwdlk5RERqN2Z5WGxNVU5VM05CZU1lNUdY?=
 =?utf-8?B?bktZMDFYR0NicGpxNng5MzJncmtDT3lmN0NUNjNGckZ3YUJVeTdlZWxUS0pI?=
 =?utf-8?B?RlAwaWw2RUJwUFFpT1JjUTRlSUdaUDl1VjRVb1dWeWF3TjFRRXNVVmtkOWFQ?=
 =?utf-8?B?Y1NGS1BreTNMNmhYc1JvUGVEZWVidWRjdFVWOTlQUEdvMVdORmRaV1Rwcjl0?=
 =?utf-8?B?Z1dNcG4zZ1FKVDVVdVRmV1JGSXZmeG5LWENyTTdTa0lCd1NRMFlWTXhuS0lJ?=
 =?utf-8?B?K3ZDOU5BQ2VRZTc5OGZ0QWZ1Q3VCRUJhdlJnR2tjaldlSFRMRXluaFV3a0hI?=
 =?utf-8?B?ejNCOFlWYStDS0V3eTEvZVF5K3RCRzBUL3k0OWlIVWF0WmtaNHFGM2F1S0F4?=
 =?utf-8?B?RGlsZHRyMDVPVFkzR2YvVzJWbmJNVGhTazNUSHZEQnNWY05kdGhxdWpsM2tu?=
 =?utf-8?B?RVdZZmpXMmVqMkhiWjhHUThRUnB4TlI4eDNZakpRSTJOUWFlaUphbW5EMGhS?=
 =?utf-8?B?WXg0QVdxM25tSFlrWTFFOFI3cTJKMWFlbHpPU3RxbGxRYndLeFNoNmNFeCtG?=
 =?utf-8?B?NmZ6NW53WGlObEtReEZra2REelRGN1J1L3hiQi80RnB4YUFMbWFCVExVY2JT?=
 =?utf-8?B?N2FjbC81K05PcmNERHRqcDN4QWhhUlNpaERlZTM3V2JwTEh0TlVKR2hCeFBi?=
 =?utf-8?B?anMzbGZjNGY1ZlFOMnk4WnQ1NmRaQzFBT3UrQkI5dlREUGVCeFFwWU5zVVk3?=
 =?utf-8?B?QmRtYlV0MEN1amJaZDA3ay9LRFJqS2w1ckpnNGdmUFIzYnRNYit0NEkxR2lm?=
 =?utf-8?B?U2FIbllEVkdCWi9yT0hsT204dUMyY2ZCTTh2V05ramNFaGoya3VtdVhTYi8v?=
 =?utf-8?B?eklDRnVBb29MeERBSmVSREhiVlNJbEorY2E1Mnd2NGd6Rm9TaFFsUkZaYm9L?=
 =?utf-8?B?MUJuc3g0ZEgvQW56TVJ5dGYveDhwR3lHeU9HcjljV3Q5a0pSYTRjSTE2SFc1?=
 =?utf-8?B?cFNack1ISVd2MVoweGdqRXdrVXAxVUVkVlFncXZuYmppOUxJaC80TW9ESVRQ?=
 =?utf-8?B?QkV5NkJBTFhuTnNuVjc1Yis0eXB6amZneG9yb2NNNmJnUXZUdU90NHZCeXQ0?=
 =?utf-8?B?cjJFWnRuVzlUSCtaUlhRZXNnMGd5YmJmZU9uS0E3bnJWWFRmM1NVTGJ0eFky?=
 =?utf-8?B?VW03Q2V3M0kxRWIvRjluaWozUjJoRzJVbmtQaU10d2JldVZXWVpvOXZmd0Nw?=
 =?utf-8?B?VnhZVzAzQ2ptSVAzemlRU24yR2RNT3AzbVZOZHppalVQUWV3N2pzR3RpVGtY?=
 =?utf-8?Q?Jv8zoCTJaPzyR5SQ8oNS5zNEPhDSKzs0+IdUdIG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fdbdef-d4ae-4e07-3c89-08d945e07c04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:27:50.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBeuZTCgbK2Z4RliOwfXJwiw7giO2vyilrjdZZ2/VqctF14P7+Y1Mssaqzj2we4Iczvu1AYlifGcPHu5Nb975M1db+BHKyxvmgNfEkzg7jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.5.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.07.2021 00:55, Richard Henderson wrote:
>  From clang-13:
> nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
>      [-Werror,-Wunused-but-set-variable]
> 
> Cc: qemu-block@nongnu.org
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   nbd/server.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index b60ebc3ab6..721349ec00 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -973,7 +973,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
>   {
>       int ret;
>       g_autofree char *export_name = NULL;
> -    g_autofree bool *bitmaps = NULL;
>       NBDExportMetaContexts local_meta = {0};
>       uint32_t nb_queries;
>       size_t i;
> @@ -1007,9 +1006,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
>                               "export '%s' not present", sane_name);
>       }
>       meta->bitmaps = g_new0(bool, meta->exp->nr_export_bitmaps);
> -    if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
> -        bitmaps = meta->bitmaps;
> -    }
>   
>       ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), false, errp);
>       if (ret <= 0) {
> 


Hm. I'm afraid, this way meta->bitmaps will be leaked in NBD_OPT_LIST_META_CONTEXT case.

Actually, "bitmaps" _is_ used, in cleanup handler, setup by g_autofree. So it's a false positive.


-- 
Best regards,
Vladimir

