Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15D44EB1E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 17:12:23 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlZA6-0003JL-J3
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 11:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlZ8Q-0001gR-EF; Fri, 12 Nov 2021 11:10:38 -0500
Received: from mail-am6eur05on2126.outbound.protection.outlook.com
 ([40.107.22.126]:22180 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlZ8N-0006su-Gx; Fri, 12 Nov 2021 11:10:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFOmeeacrSVzN0o4wyf1dkBBocdH2Z1DAKoT/C0BTFkn60U0D1FB1Mk9JBjCz9SNP91UNlmLIxv0h9qOgrztVFBRkhtx+lioSFw59UItNL+s0XI3I9NxMJpldTsNCwrkDWeOxbbNImrvitSEXRe8tQOh0YYr0naPDMv4WfJQ3wNUBFG1u474A8hHHvTufQF674LrtDpN4+g0SLc1J33U4QXx5osd+eaj7mEvP/tN9c+7G4EVOS5R+LFCQrgh8TykftkbqkyZBIHLRY2KeQxwQuPvYE5IH6GycXIvzOJqMMmxEyoeESl2infSLgq64pNiL8gzeS4oGEslhi35qGeF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5+ptbaVNWW/UTMtXeMi7S3a+IxRpqhXrZkH3j53aZ4=;
 b=ZlAZsLv0dI23OtubqSXVHAT4k86xfn+NZnlyJectvmpSyEZb0nXBk1Dvbsctf3LSqkZMS1o3gYKNKzMu40cxVca74TPqFxy6hx+4vLjDDZJv5En8blobaaWQsZ/WcSCJVjVN5tt4tcB4NxkRNGqGhfB1qKV4/8lgifUUzeB8v0iqMy2vlmCCIEOXEsCae5PwOhTLiPw+oQ9JNQMv+NQNYK+86vpd33EUhRGrOiaq/NQgzM+dzW4YqAfsNsh9XTqn85PMCwZS2fTn5yiDTiLxVns5RWCLKa00olDGnOq9XuPeYwD/CXTE2OqguQxpc3rqvXs9N+p9EyOPDXBssXspWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5+ptbaVNWW/UTMtXeMi7S3a+IxRpqhXrZkH3j53aZ4=;
 b=ZPGMxRcwihqXLqF5XLEn6/aQQMEQtkruTY4mpdAvRPOIJEid8qLXMiygCRasC1hIHswCH44ZCO8SeyFdff7xQo6b4dSFutRIn0MxjQc+mJJ8UcWc+DwG7EHPBR6f3zp0YW7ld+Pm/iWN6coG3SDE1RT4/tJVMyi7mw4y4bCpFjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 16:10:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 16:10:31 +0000
Message-ID: <c631468b-2e2d-f5d9-6afb-6868ce00d2f9@virtuozzo.com>
Date: Fri, 12 Nov 2021 19:10:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 09/10] block: Let replace_child_noperm free children
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-10-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-10-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0054.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AS9PR0301CA0054.eurprd03.prod.outlook.com (2603:10a6:20b:469::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Fri, 12 Nov 2021 16:10:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa502a12-ed32-4950-3bcf-08d9a5f6f354
X-MS-TrafficTypeDiagnostic: AS8PR08MB7011:
X-Microsoft-Antispam-PRVS: <AS8PR08MB701144E51781A794323BF641C1959@AS8PR08MB7011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WShiQBw4WgOS6a0vCNpm9UxqTKdcJ1HV01d3F8AJ2PJcNStq/Gh4GxVtEMeu/YT6xv0GKz8LqppAOyOLXpdyjCHDIPg/bDmU3mHERt2uja+PgG3OLGjv1Kvlok1sV28pDj2Urhr514QR2KNtYKdS/rB8tcwYvlJK9tPX16TZNEsvEN5qlseRkQSShQKJg6wBDPmgF2wiGRuaERwtTd85i9jbyVCDvBtENGbGRyVSjbfaeZ7s16dNecKZRuKNVf11nvbCEreaA1lkltjAGeI/XdfhsmieJIymEMGq+ld1w4484Sa+y0/wu4Un7NuOaW+DkWpjucFJiH/K4ysEIhjdjy3/EHlkt9hFxKNVmiaKmcKd3tmTBhj0VgHy7/GYUQDC6rg4IjC1mdARJVOPYYHjdvd6Zym1e7B52gyh7HPaWJ8NKUqnXRZd5ngZxKnTo7R5Tyo+ydo1jj27sEA+V4aQWYTFkgLTcRAo09ypCry6P3raLDDMWrF9PhtfSJbYnmuCD/RShPvHw8rbGHcGs83XAEcmwFjOVi0wJrcUIXiH4VvdrxVYNqYmvIlreO5EaAi5tEgOHinDAtzl2UpSS4qeOKZ8CNQZeMcEV1hA5yRiR36BEN6MG6L+gO2tWpRJNoesMM0pFwF7upzCvZ4nuaty3VeSxdZEJziBAtE8KqPwwyoQkCzohKzjPvnCytoAdrI1F7edstlqEQd1LrKzbcL5VcZ/3ESOHUJTfLGM/m/fm/Ri/r2I24om5zLDa1m3/4v1N6audUTAM6yenkk4iyx8+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(83380400001)(8676002)(2616005)(36756003)(66476007)(66946007)(86362001)(31686004)(508600001)(26005)(186003)(2906002)(316002)(16576012)(66556008)(8936002)(31696002)(6486002)(5660300002)(4326008)(38100700002)(52116002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNQUnBOTlhTTWhkVVI0Q3QyTE5SWDRVYTduUjBoNG02aks5WndkUGxtc3BG?=
 =?utf-8?B?SXFmZGlmRVdPcnJsYUlCQTVrd1NqNHprVHErdWJIMGlIaFVLWkRtcjhTbGNH?=
 =?utf-8?B?anNTSnNST1lhUWtJS2ZHdFYrdTRlc0pWR3h3bkk0VVFaRXI0ZGhRSGNBV2lt?=
 =?utf-8?B?TFk5d2JJZTJ6TWU1NGtoSjdUY0lmTnVpVHQ1MTNUd1czZFBCSzMzS3JEbXNr?=
 =?utf-8?B?R0pnaEhEZ2FNQVBqRGxDQUdnSjVocC9jMFBheVRVeHY2dDU4aUM3d0dsY05n?=
 =?utf-8?B?NWYzdjNzcXRrRVBta0VYbUVxQUxhTXAwSE40UVZLcVVZbzNISVpaQ0RNMnht?=
 =?utf-8?B?VmhkVzdSRHlwWmdtbG5KVWIvRUZsRFUrUHNnMHhRTlBmMjJjc1JnM2dUSVM0?=
 =?utf-8?B?VGNGT1JIRTBRaEJCMTNPTXFTTUs2Q1ZEbHFZakNURkNrc3JWU05VUkpxb2Nm?=
 =?utf-8?B?bkpRVnJmZUpOZEpzN2RYOWlKRHgxRVlJNWc4WWZyOVJGVmdleVVtZ0hSNFpv?=
 =?utf-8?B?bHN1TE50akUwcTVZOFhOYU1BZTFpajF5aGVuN2tKQjE0VnZmZTYwZ2JaemM1?=
 =?utf-8?B?ZEllRWxtdm9YdnFFUHpWN2lWT0RjeVNhK0hQcHlqaWhJOXVSd1dRZ1dyWWxW?=
 =?utf-8?B?Z0h5eUpyc2E4ejhoNjFTaHVsYWRpS0svcU92eGtXcThDdzNMMWpKZWlMS1VZ?=
 =?utf-8?B?QXE0YmllTlEwZXpOdXlyOUp4RjBaaXVrY2NWNmxKaytOenhKdVlQdTdTYkVT?=
 =?utf-8?B?a1RTaVp5dDNQV2wrcTFOdXRBZjVYNGhXenlGM2prYjNkVk1FU205OVNMRWht?=
 =?utf-8?B?ZmJsQm5BUGdCamNDbG9EQjlqTFdLNHp2dExmUDhKQVdyUCs5UThLcTBZTExx?=
 =?utf-8?B?QkhrVVMwcVRWcUxjY3IrV2swOGZRaFlqUmxlVnBqOGt5OFUwdDBYQ3plTTJS?=
 =?utf-8?B?MVduZTl2OW1QMnNwQ1FnaStrNEpwdjRRMTBGN2txMDZJaFpMRzE2bkduZ2E1?=
 =?utf-8?B?aXdHLzdJRG42Z0JPUi9jQjFuSExHT1dOeUg0R3BDbEdFWE1IbG9pOTB1SUEx?=
 =?utf-8?B?eTdraFZwM3FCS2ZnVlo2SzQrZHZoWlNxdk1ocDJpZjVKcmNFK0tvaEh6Wkwy?=
 =?utf-8?B?bWhxRUFBVzQ5RzlaU3lwa3V3eXdjeEd5RGlOWThxOWlVcUp0Vk54VkxZTWlG?=
 =?utf-8?B?cDU4aENHdFJvMXFIN0xta015UUhuTlVZeHp5dmFJclMwaDZ0SE5Ja2J5SU4y?=
 =?utf-8?B?S2k2STF5QzlIODdIandRUzNROVBEcW43UUIvTWk4TUp0OUtmVnlGVDRuV3B3?=
 =?utf-8?B?eDJ3eTltOUxwSWhEYUVoUnBmZXlveFZiejRCYm9pTUhWTitXK3FFTzg5TEg4?=
 =?utf-8?B?YVg0VlVLYjNOREJWL1VhRndWdTZzbzZ3YmplaENQVWdtK0htaEljWUFYSS9S?=
 =?utf-8?B?Ums0TndpQmJMTEV4UHltUE5nWU9yWHp5OWdISTU1VGJoOU85T2VoY3pBRFVQ?=
 =?utf-8?B?SGJKN0VUVFZjWVhCZTJMdWRLRmJ5eDlLMUlUZ0o1V3RzdDlNYkxsWWxqU3li?=
 =?utf-8?B?L1F6Nks3cXJ5ZDBzVDVObFdlbnJXeTlpcmdaalhSb1d2RG1BVE4zRDNqQXla?=
 =?utf-8?B?SkFjZFpxbFVHQi9IblpheVhHUW52dnYxTi9jbnBGZmtYNTQ2Y05YbndjM3BZ?=
 =?utf-8?B?eTkweWZkSE90eDc4VC9kamJpOW5GODB6OW0vbUhYeDYyNytKSnZpYVBEaHFw?=
 =?utf-8?B?TVAyNkRORWM5aVREQmJraUZyMDNPaFpYRkUxLzI1ek5Hd29HZWh5TXNHek05?=
 =?utf-8?B?WWNNc2xaYWZsTDRXRzUrQWdRdG5zUm0wK2dkWml6d0hTTWdiN2hndnlKNUpQ?=
 =?utf-8?B?NlFSNE1iRko0WG9hUjM4NGhxQ3BUK3l2ZjZuUWxkREpPZEs5amkveWFWS01S?=
 =?utf-8?B?VDY4dm05TnJmeEhIT3g2Q3pOWHd0Q3ZpbGZRS2YwOWppa0kvVGIzd0xwaUxw?=
 =?utf-8?B?K1cxcmhHdGNVc1pETjhVcE5aTmMvd2hjRTRPVktzM1kyMFVyRlZ3V1V6Z1JT?=
 =?utf-8?B?VjloZEZ3OGFyaERjc0NJSndpN21oejlBQzRrS3NnMTNXSmNERnFMTlpVZk43?=
 =?utf-8?B?c0djMnkrZW5HbHpjbjZqTTZTUWF0ZExFSGdVazU2SUtKZzRGNTFYeVBGY1Bl?=
 =?utf-8?B?eit2cVYwQ0NQdlRNY2EwT1pQQ2JmUDFoaEZ0a1JyOXcxMFdxV0FmRFpUWHBl?=
 =?utf-8?Q?V2xwWDO0orYbrptZ4khJQV4m+p/G304KTFQR3elrrA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa502a12-ed32-4950-3bcf-08d9a5f6f354
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 16:10:31.4329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyDimrpLV3A4beDnPCtaDPC9cydVoGBG1a6Jid8yRKY6VYvVE8SPuXposCIJFNdc7eFbqY6fk2ukoLkLUdF3SpoBP1lR3W27cooa7+XXwic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7011
Received-SPF: pass client-ip=40.107.22.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

11.11.2021 15:08, Hanna Reitz wrote:
> In most of the block layer, especially when traversing down from other
> BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
> it becomes NULL, it is expected that the corresponding BdrvChild pointer
> also becomes NULL and the BdrvChild object is freed.
> 
> Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
> pointer to NULL, it should also immediately set the corresponding
> BdrvChild pointer (like bs->file or bs->backing) to NULL.
> 
> In that context, it also makes sense for this function to free the
> child.  Sometimes we cannot do so, though, because it is called in a
> transactional context where the caller might still want to reinstate the
> child in the abort branch (and free it only on commit), so this behavior
> has to remain optional.
> 
> In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
> that the BdrvChild passed to bdrv_replace_child_tran() must have had a
> non-NULL .bs pointer initially.  Make a note of that and assert it.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   block.c | 102 +++++++++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 79 insertions(+), 23 deletions(-)
> 
> diff --git a/block.c b/block.c
> index a40027161c..0ac5b163d2 100644
> --- a/block.c
> +++ b/block.c
> @@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>                                      BlockDriverState *child);
>   
> +static void bdrv_child_free(BdrvChild *child);
>   static void bdrv_replace_child_noperm(BdrvChild **child,
> -                                      BlockDriverState *new_bs);
> +                                      BlockDriverState *new_bs,
> +                                      bool free_empty_child);
>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>                                                 BdrvChild *child,
>                                                 Transaction *tran);
> @@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
>       BdrvChild *child;
>       BdrvChild **childp;
>       BlockDriverState *old_bs;
> +    bool free_empty_child;
>   } BdrvReplaceChildState;
>   
>   static void bdrv_replace_child_commit(void *opaque)
>   {
>       BdrvReplaceChildState *s = opaque;
>   
> +    if (s->free_empty_child && !s->child->bs) {
> +        bdrv_child_free(s->child);
> +    }
>       bdrv_unref(s->old_bs);
>   }
>   
> @@ -2278,22 +2284,26 @@ static void bdrv_replace_child_abort(void *opaque)
>        *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
>        *     will not modify s->child.  From that perspective, it does not matter
>        *     whether we pass s->childp or &s->child.
> -     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
> -     *     pointer anyway (though it will in the future), so at this point it
> -     *     absolutely does not matter whether we pass s->childp or &s->child.)
>        * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
>        *     it here.
>        * (3) If new_bs is NULL, *s->childp will have been NULLed by
>        *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
>        *     must not pass a NULL *s->childp here.
> -     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
> -     *     have NULLed *s->childp, so this does not apply yet.  It will in the
> -     *     future.)

What I don't like about this patch is that it does two different things: zeroing the pointer and clearing the object. And if we look at the latter in separate, it seems that it's not needed:

Look: bdrv_replace_child_tran(): new parameter is set to true in two places, in both of them we are sure (and do assertion and comment) that new bs is not NULL and nothing will be freed.

Similarly, bdrv_replace_child_noperm() is called with true in two places where we sure that new bs is not NULL.

and only one place where new parameter set to true really do something:

> @@ -2960,8 +3013,7 @@ static void bdrv_detach_child(BdrvChild **childp)
>   {
>       BlockDriverState *old_bs = (*childp)->bs;
>   
> -    bdrv_replace_child_noperm(childp, NULL);
> -    bdrv_child_free(*childp);
> +    bdrv_replace_child_noperm(childp, NULL, true);
>   
>       if (old_bs) {
>           /*

And it doesn't worth the whole complexity of new parameters for two functions.

In this place we can simply do something like

BdrvChild *child = *childp;

bdrv_replace_child_noperm(childp, NULL);

bdrv_child_free(child);


I understand the idea: it seems good and intuitive to do zeroing the pointer and clearing the object in one shot. But this patch itself shows that we just can't do it in 90% of cases. So, I think better is not do it and live with only "zeroing the pointer" part of this patch.





Another idea that come to my mind while reviewing this series: did you consider zeroing bs->file / bs->backing in .detach, like you do with bs->children list at start of the series?  We can argue the same way that file and backing pointers are property of parent, and they should be zeroed in .detach, where element is removed from bs->children.




-- 
Best regards,
Vladimir

