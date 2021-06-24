Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7623B2B2C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:16:38 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLTR-0002Ax-0t
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwLSF-00011v-KV; Thu, 24 Jun 2021 05:15:23 -0400
Received: from mail-eopbgr40134.outbound.protection.outlook.com
 ([40.107.4.134]:22749 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwLSC-0003UR-H8; Thu, 24 Jun 2021 05:15:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+siyk7HQaOtPns1nOFkqoyBkd6S0zuttpZBMD3/e+XVH1KeX4xmY4yCXcF7aiqjhhH/a0pyHgwbf8WRt38kc+GwIG2d9uNjU7FxdtrydzfrpGqtFR7Bsta3a3YG4DsyA7e8VBP45pD/TWEtk6sZVUayH8qeyn5DrxclB3VjkMfZwPFcxnddYcS2XDHdoRQgWQaoZA/Oz4YUba1GuIAbzNKbPxRwVNGiO1m37Tk08XxAjilIBD8ZLnZEak80EuZFa0YknoDUatkt58v6a7DEgmRi7d1Fkye3Ogqlobpd8+6Nrjk6eL0y3m6LZLdjUZn/k6ZEkNqLNl9w2IVqC4B1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaiEXMMI/mdAq6ZafsrY6BCr+QkR8faa+ufah6VQ2p8=;
 b=G+JYQHOyYIF4tYnmYNZnA5GwLEYLNI9IqxdlIdzzumfHuy6cvNRM/RMPlK2nBogKLFXacjOdffuLlPsJQIhHSlbtvZipjpujulXGP2S7Ta7ljSqFia9+L4ZLJnyE/3ATa6J4txdwwl4Gn7BLhzhER2h1TZz8wJFO6867Uvb2nGWrzheqP/sFUYCFsELdGUdfn7S0TUkyK+iWmdOSpdgtbzantQiX9PHai+oJl7nUgyTDzqw1BXv2kW4LntiXUlLYdb1QqMxNesz648fIZ30+F4nm1fKpLcxUZXyY67E9hPrPumvdW6uRRN31IGZCBnL4gNOR7eqenl06PvD2lescKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaiEXMMI/mdAq6ZafsrY6BCr+QkR8faa+ufah6VQ2p8=;
 b=uePHgBkxxPnCcpagAHTnmPSImO6virfZtKFJa4BoWwBzX5cEHSST9ucf0TQx78NF9rqIRkI175uOElIeJcu91hIBTyY1kvIY/jHI3PU/r5DlHHzlJVCzTu3BNg6nb5RgEd34+R362UPjNgcTt367ZUPxskHhUwIMKvihmehK3X4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3287.eurprd08.prod.outlook.com (2603:10a6:209:41::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 09:15:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 09:15:16 +0000
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
Date: Thu, 24 Jun 2021 12:15:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210623150143.188184-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Thu, 24 Jun 2021 09:15:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3d20c0e-a921-47c5-083f-08d936f094a6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-Microsoft-Antispam-PRVS: <AM6PR08MB328753422829DD0F08733238C1079@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiBGEXkBkzGZJSFP2u905n7jSxd7ZPvj5YHQj9GlY/TeJlmNBaC5GtKhX/p4R+lMCMQjaQb9ZambCxtagYa0dxJ8yAA1i1PE1242tMm7BheYCpI1wbQDn6TkE2Zy63mPd/dbxzn0FbQZ+fFkkWUn+VkZwuk6wt9rg5/06sjga5XBeKrPFR6jM+0XbCaoJuEnKE59G5EwHbJkR7WsSkC6AY05CaLiDuwQxxVwNg4q49uzS3Hc/UBt5pgK6EoNShynYjt/vURQci1rmSSJil9kRlu5XodfHOC/EvyQhRSI4c+9QWUBj6cH4nJIymIdQrDjEPmOA/tPQf7wh17lrr4HraXa+vuZalqycNpi7DCuHx5YFQewMn8iGGjnAnbvEc0uGQLCXaTXynEBtnseqZSEHlwqud6kvkfl1P74M6LLodjAK/MJg0YtthU+ONBi/iukcqKC620f5bk/EKk9RKbkn89wHsJ1TEva0kkLFBPK/N0g/xIeGEjdANerqJnkvxdbDb7jTDzkyTvgSvl0xv78BoJIRPmOABCvm/QE1nfvuPifM4F6yTwVlkHv7gOYaQO91IgrCb+FiRgPFhIbj140k0oG7Tt4tzqH1MVpkTHHU081b2M5LDJUx43PeMt/Zj+Wp7yLHR24rqGAbC4x809GIVaCLs4QKqf9/qVelY4sWZ2LBtze0l9mVB8xpeEu+DcvQZa+1SX5GtYV6ZhE6zDiGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39840400004)(8936002)(8676002)(16576012)(316002)(6486002)(36756003)(38100700002)(478600001)(38350700002)(186003)(4326008)(16526019)(26005)(54906003)(52116002)(5660300002)(2906002)(31696002)(83380400001)(86362001)(66946007)(31686004)(956004)(2616005)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjkyQnVhTjVxV0kyN3BMQ2lBN0ZVekswVTQwaHNUNDdQbXRyQ1lZYzRHL01G?=
 =?utf-8?B?UktWQ1lPOFVFU0N2SUtjUmh0SVNjL2Q5ZGI0NmhxR0Qxc0xpVW1jeEJvWHBH?=
 =?utf-8?B?UytsenZIZUxBS2kxcGZnTTVVaDhMeU5XZkUzZk5SQ0JUVXliOHl5ZzJMdUhq?=
 =?utf-8?B?QjFwTWk4TDRDUng3b3orU0JuVTUrNE1YenZrTWdEL0JValcreTBoTGdkWjFZ?=
 =?utf-8?B?NEdhL1pqaGNQM01obFVmQXFtMjZtaVF6UTcxT2FPNW1Scm5MKzN3WCs3d1RU?=
 =?utf-8?B?OWRLQkYwUm1NQkVWZE9zVk5IRGFKU0JmdVFXYjNOanYrZXlnSHhFTTdaQWpz?=
 =?utf-8?B?alBtcHVkL0MrRnNNdXFKS2lIYVExN3A2TnB6VkZSVkhTRDl3TzZvaGpLb1k1?=
 =?utf-8?B?dFp2UnZLd2ZLdjArRUZqVVR6WEJTaFNLdjJtY1NNeTVibzd2SGdmUEJ0TlVK?=
 =?utf-8?B?L2NNcm5jTDFMR01MWFpSd3AyVXgwd3ZlTjlyMCtuQlZEdzExOG0yOGJjZFNm?=
 =?utf-8?B?Tk5IMXdPNHpCM1NndHJLcWVIcHcvUGppVEJYQWswdFFxYk0xM3gxTEFITGZu?=
 =?utf-8?B?R0N6V096dkN0eDNOV09pR0NidDJWaTJOcU8xRkhNcmp3djFpMzhjYUZnd2RL?=
 =?utf-8?B?TVk0cHBwV3pwL1g3bDR1QXRuSkQ2SFNFQUpqYVVxRXpXTU1DTDFYMnl1ejlW?=
 =?utf-8?B?NUw3NW1tQllLN2kyZ3V2cHN6REVNeEprOHhkZzJzcU1SUDlIT2tTTGdqVnFF?=
 =?utf-8?B?TmQwNGY0ZFVaMjhWM1g0cjVzQWtBZUhibFRzYkM5bkFkam94ZDd0U0tReDRW?=
 =?utf-8?B?U0VEb3dCT3VPNm1mOGNMSHY5YU1nUWdCT0xJaXB1T0hUa2RPWGxkbzJlYmU0?=
 =?utf-8?B?QTRYbDJaV3NibmFRbGpzYVhCR3Z3R0VCaVpDOWVOYU5SYmU4SlZXMGZwdkE5?=
 =?utf-8?B?U05qWWUzQTZSTy9HSk02UVN3Rk8yY01IdW5KMHk2VFo1c1dzTVdXMzk3TXhF?=
 =?utf-8?B?d21GU2Rlb3g2OGZtYk9RSnFYQlBMRkppam5iYndmeHFyRGhSSm4xWWwwOWsw?=
 =?utf-8?B?U1NMMkNTbU9BQ1RGTmltV2RGRVBkSmdZNHFCdGZ2azVuWHU0Q3pOdW0xWUhY?=
 =?utf-8?B?RnhZbzc2NnUrUGxXa3FNcVhFcFIwT3BUS3Z0SDRVb3NlRlVMZFg3NFF3MUQr?=
 =?utf-8?B?bDkwRko4Tk5aZ3lBdVRxVUkya1MyNWJhQzR1RkZVSElNNWw1V3h0TitoSkpM?=
 =?utf-8?B?a2xNMDE4WGZnaThyU2o5aDNrMzhUZDBGLzZ1NUZtdW0wclhQeG1Jb2pzeTZQ?=
 =?utf-8?B?WCtxUTFiUjhHdWlkS2J5am5GQW5sUnNwbU04YnF1VjEzMCtGbU1MMmYrK05j?=
 =?utf-8?B?SmFTMGw1emQ1WTFiNDgxeGRmeGNKSGxKQ0tLazc3Kytpd2RQbWJiZXVva1h5?=
 =?utf-8?B?blo3MGtTbkczTWdXKy9wMWhhcjdhK1docEhUanVhdzNVZVc2ZTV5WjBGajNY?=
 =?utf-8?B?cllFd2FVVkxJdldaaEtsbjBYTUJoSEJ4Y2h2anJpZ003Sm9jNHorek5MVTB6?=
 =?utf-8?B?TC91OXJCdTFuM0VpbG1qRjl3YWNoY0VxVS9qa2swTnhhQm1HNW0yMkc5c3hC?=
 =?utf-8?B?Um9Idkszb1pNV21UcUMzRGNpZ3dvcFhCdmlaWURxbGYza0xLeUFzU0crRkVt?=
 =?utf-8?B?aVJTbmdxZENmVkM5cmR6UWxQalZCSjR2OS9wZXNTYkdrMXhNMkJ6MGVGNjhS?=
 =?utf-8?Q?6AI77eCY5TsbDkCj+U8QHFccWPtr6qWd6N2A+yp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d20c0e-a921-47c5-083f-08d936f094a6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 09:15:16.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8N8Ki5qDKHv/lqmlscpChp0O81ZlcfkBRvDMfwRaI4ei0PN7MBvVQjQFWwQ+p0E9zwu3kKQLKxejg7UtIzPy2Fs+r/Mto6QE9LsCvUHJ9zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Received-SPF: pass client-ip=40.107.4.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

23.06.2021 18:01, Max Reitz wrote:
> .bdrv_co_block_status() implementations are free to return a *pnum that
> exceeds @bytes, because bdrv_co_block_status() in block/io.c will clamp
> *pnum as necessary.
> 
> On the other hand, if drivers' implementations return values for *pnum
> that are as large as possible, our recently introduced block-status
> cache will become more effective.
> 
> So, make a note in block_int.h that @bytes is no upper limit for *pnum.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   include/block/block_int.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index fcb599dd1c..f85b96ed99 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -347,6 +347,11 @@ struct BlockDriver {
>        * clamped to bdrv_getlength() and aligned to request_alignment,
>        * as well as non-NULL pnum, map, and file; in turn, the driver
>        * must return an error or set pnum to an aligned non-zero value.
> +     *
> +     * Note that @bytes is just a hint on how big of a region the
> +     * caller wants to inspect.  It is not a limit on *pnum.
> +     * Implementations are free to return larger values of *pnum if
> +     * doing so does not incur a performance penalty.

Worth mention that the cache will benefit of it?

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

>        */
>       int coroutine_fn (*bdrv_co_block_status)(BlockDriverState *bs,
>           bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
> 


-- 
Best regards,
Vladimir

