Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2F44C190
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:50:43 +0100 (CET)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn3q-0005eU-F3
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkmzb-0002Il-Uu; Wed, 10 Nov 2021 07:46:20 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:63622 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkmzY-0002h9-NT; Wed, 10 Nov 2021 07:46:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrzAn4UqHvUoVLbC094/LpNs9Paml42GNqTuu9wKd+kn1f+0dCg1g/3gz2nMB/qX/5cnaTuRc5sk+Oz7Tugqj1SuuqHwvsmNBXWhKDYz9Cgqt6SPFfueSkbZhVKE8vPaAdfimHbNPIUHSvoy6pFsKvIxt3XhNf1val8q6oXQ3JV2oCJcxMSNj9+xTZct9AWA5eb1Hjr/TqP3/ueqwqp9kfZ/ViH/T8b+FU65EgbKJowiBwwC8QdcG5roJHG7qZ3tIr36vLBmTok9v6fm2MIo99bPV1ntORVzrs7odu3tQzxNY633EN61Db5FitiObq4hMFvYaRcI/vjVzkKp2oSCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3CbBXRSgXGFpInIPGQGsLXqp4UsfQ9d6wWf5Avv2YA=;
 b=mLgy5bQIxYtSn3tF6ex6isdyaGVJDc+Pa0kIOwEe/LE1cefFe6eXGdmOiTryvNdpsWJx3eyn4ngzWbQKHJlJHWbT67FdleQsTILFQt0hJYVWCOxw5l3ah+Oox86SgGrBL1O1R3mHCNc4klo2vSbGXagsOiR/UXZqoZDh76SgjscwCWaAcANtZ2FEaXK7z0cwpsoiaXJosYKWTqHyOA+wInHjMsSL3cYtoymO6YfqebuH1beJaqfQt5VmegRRR/VeLzHWnWtQr0qsZ17aHGYARoIvCr3MyXVxxaW3pyYYSt/bPoExgQI7E/9Ipdz3gpVlWVboYRV0O4VRcBjPqZMW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3CbBXRSgXGFpInIPGQGsLXqp4UsfQ9d6wWf5Avv2YA=;
 b=ptF618jaS1D8hOB3zYdzGzLBG5sMOtZvmTauQasH3o53HylqW60T+eDaxbq3BxLRKlcXoC0wQC/2KJGt7fEIkXODDaw97Wj34/l1uLWviUpTNojO7sOIEXMlXVrB1AS1ZnFnsUOsSYCCNCTzIUhFQJryTbc2TLRa/Hflc5Q5SbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 12:46:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:46:14 +0000
Message-ID: <b1d17f2e-ace3-ee0e-ef22-424f03af3d69@virtuozzo.com>
Date: Wed, 10 Nov 2021 15:46:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/7] block: Manipulate children list in .attach/.detach
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104103849.46855-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Wed, 10 Nov 2021 12:46:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dddbe50-a5c5-4d42-1e25-08d9a4481490
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59116127CE751A7B08977A74C1939@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRo/KwJ+dATVclkE/MI13eqjahqq0iFvdtm0l5f03rC3dwXNVaCkWMV265SFocUOBSI7OmIQ1dnQ8/CWkUQ3ba7ExN3m1U84g+q4w3kMQ/GoTwZpp3M6B5jieTP1dqDKc006Dij4dlwjyKfFDQ0yUyd8TbJr8COM1z+HsqZLNRF/fqT+bknSVKU0vQLKxeMqFv8d/+57YtkAtnoHuz3ceRvuyLqYh4IX9VwYPKdbkQaSe8t+DBY3alRc2jcyMMX6KKTY+NSDWrFYlw6HTB6ZJjmAbcsBCowN8AO2cUCF/Qumhkgii+l/YjDqjBmfPN/6F6noSJHlBZ1CwFVMWLBgnWQj+ESfLcD/hU8MuIAhSbJ8WXmsAp16b5V4Zo0lUOCoC9S0XjJHO82pquSK/k8lJ/csr4hZ7Y44MQKRw1hR8L63ol7lI3UupqrP7dCCSJWR+thS7NZGmDnIa6NJgaOAc1hx6ckMNKn68MjPWbiiC4PqSgHiZlLEWElV41qjPl1rRGfLBdEsxCG0uqFCGRhpEyTyiF5hNjkhHkwthE7ZaclSYJNYvgT19YRisV69+GWVSc/7x4xzv4WFUSd1I6JUVJ+6D1Pjg60Qc6Es46ugWeOI5yTVAf+EqpUvlZ3fh6x11yw618Gb5dv/R4nHa9lU5MEVWUrRcIAdOCLw/rsycIBI0LCDarF1Gj7gV9jAyrYJ4iiY8Mivi2iicZ55hyXaVCcPg+ZybT68NmjI/YiUixKddmXmE8SLPG2rXZ9UHvHy9UEIzPxLzbLfgaLPqiJB+b/isEoWhCKAZIpr3zYNtVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(956004)(86362001)(38100700002)(508600001)(66556008)(66476007)(8676002)(6486002)(66946007)(52116002)(31696002)(36756003)(8936002)(316002)(83380400001)(26005)(16576012)(2906002)(4326008)(31686004)(2616005)(5660300002)(186003)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekwydGNZODF0a2RPS1N1U05jMGlJOUFUVTRNNldDNFJEc2FQa2p4YTF4Q2JD?=
 =?utf-8?B?RHJmb2RlMmdTNHVCZjhIbUx6MFB6L2dSVTY1RWJpN1lid0RMamVRQUp2Mlk1?=
 =?utf-8?B?Y0UxZFdCcHJPdDFEZkVHcExPNkNENElqbVBIeWlrL1JmaHVhVHJXK1BaT2VV?=
 =?utf-8?B?R0JhVDRQZmxIS3NIc3I0cnlaSC90emtSZkl4c1FLUVMrZXBjSEJpQmp5cmNY?=
 =?utf-8?B?YTdsRGwxQ1ZUMEhDNnJyQXR3dW4rSHJrL0JKdzA2L0wzckZwZlY2bWdUVjNO?=
 =?utf-8?B?OGFsQ3JTT0FwOUhEOWRmbXZwZEVjY3kvR2RjZ3RFZnRlbFAyNjdXZ2NhOEd0?=
 =?utf-8?B?Smh1QjAyWTBlV2F0aGh4dEJ2dnMrQzcrcm5XaHNpZklZSm1WZ3hiZzQyc1Ur?=
 =?utf-8?B?SG96WjcrMGo5V3pibWdLcTR5M2RaakRZdGlUZXpoNnlwTFpiSm42SVJRNjRy?=
 =?utf-8?B?bUxmQ1BGV2p6NWJEdERqVFJWNElCejRVMjBWL1JJOUhFTHY3VGJYOTFTVkhn?=
 =?utf-8?B?SERaUEVFWXFuSm9jVlEyL0JaTk1zelM0dks2b1BqUU9aZkdmNW9VbnFWYnIw?=
 =?utf-8?B?UjdrUHJWWjFrZmZmUVRrR3RlZFI1a21vVG9jNzdsdTBpU1BoZHhBOFdJNnJY?=
 =?utf-8?B?S1hjRG9reEdEZjZiTGl1TDhWa3dKSlRBQVlnSzRPT1pneU4zU1Y3OFhLVlU2?=
 =?utf-8?B?Qk1HeFNuYmw4ZFVkVHBiYzczVTloM1VYa2JHVm1RT0lBUVRCZms5UTNlVUhq?=
 =?utf-8?B?eTJyTlMwcTdoMWdJNnZrUURBakpxakFvakJHWWxqa0tHL0t6TDNFd29ORSt3?=
 =?utf-8?B?N0ZmNlJVSVV1ZjNsNWNVWU9WN09lczJtTDJJQy8vanhvRkswcUVLQ29rNXh1?=
 =?utf-8?B?a2xCZHhQUTVwcjlmMUY0eHdiL1dDd2k4SEdlODBNRi90N1M3OTlKemhiOU5h?=
 =?utf-8?B?b1FoeitLaE1LM002eW5WMk9MMkhxZk5RYTFlZVJjYWtVbWthaE1aUGtRQ0pH?=
 =?utf-8?B?WDlySko0L1RhRjJydjIrWWs2enRCaEFqRVlLZG5RSXZWVEJ4ZUV2NmVvckVy?=
 =?utf-8?B?MW9qbk5uTUVEcHc1N1FLRzVPYmU0cFJwaXBKRS9SRWk5L0JhNngxWFlDSlB1?=
 =?utf-8?B?amVhbjNLck9DcklJUGxGR0RIS0NLWUxDNStEejNhZklMS1FoMk0vUVdOYWhy?=
 =?utf-8?B?djF3TWZYajRSdXVQT1NzTEtiUHZSbWRsYTdxTTh2cURFOXByNURFcHE0akk2?=
 =?utf-8?B?SzdLL3o1dHZmRWl1MGVPeW1WVG0zbythaVJtNXhiNDBkZmZ2UktvQ3FmM1Bq?=
 =?utf-8?B?OU84T3orZWxMMmxEcjJHaDB1MkdQSUVTRFBQQjZvT29PcTl1T2d0Qmd0NVlU?=
 =?utf-8?B?ZkoydUF5VllDamFuZTgwWTE2QmNFVWRLTjhwWGtJSk9tczNFdFdjMWZXcjdL?=
 =?utf-8?B?RDA3eExBM1RZckdlQ1REMEJZZlFwOFcrRzJnYTNEbFcrNXoxSjY4WU1jUmdS?=
 =?utf-8?B?WGtTWkVUU0thdkpCdXNlSDRNS3NVYjBMaWQ2T2FtOHBGRUhXeEFoUHhmNGtq?=
 =?utf-8?B?cENxcklPc01NbHpaeGhPaUlUeXlWYUN6aE02Y0NOSmJPSTRpY251T2VybUJx?=
 =?utf-8?B?dXhQaHpiZVE4QzJlTi9xTkhRWnBqQTdYT3lHalJGMU9MQ1QxSTBpVWdvMkhY?=
 =?utf-8?B?NnVVRUJSMGUwVGRwZ1VqWW1qZUd2N1QwaDEyQTAyeWxQcnpsMjJERy9rVnJJ?=
 =?utf-8?B?TVJra1hIYjVPZ0EycXRGc2J3LzNpTGUwZFd0b1htSHAyeUg1dHpwV2FIc0Qv?=
 =?utf-8?B?WnphTmJQZzdxNEJlUWJzbmdQVnJaOWFVWjMyKy8xM1l2bmxjQzFoTElzRGRT?=
 =?utf-8?B?SFRUQUxzOVdUcldQUHZVRktoQkM1M0xVT29uczJTOElXekVNcVpGTE5PR201?=
 =?utf-8?B?TDAyYU9EYW1YNUF1VERYWTV0WlhIeHB1T3Q3cmdlamhkZXhhQnRPRWhsNC9j?=
 =?utf-8?B?QjNlR3grQWZvbkdqVDR6b2IwVXVQcUM5OGs1VGZDRzZLbTRuR3lZcWdWanJp?=
 =?utf-8?B?N3R6TDZnRXlQYmVHNnBkdWR0eEFSd2RBK0xuKzNKKzB2RUxlRUtJRVk5clFj?=
 =?utf-8?B?THQvczkySVhJbTRycEJ3SVdDa3h6cnRKZGFJWU85SWF0VTN5dEhwYjFBdDBD?=
 =?utf-8?B?MFhWQkdxVWlHNjdBc0daR1F2blVBVEVxVU5FckFzMlJxajJrREkwNGF0MllH?=
 =?utf-8?Q?PNwqF31Y0QptvYv/cOn6lQcmEX+a54fvZ1zPseJzYY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dddbe50-a5c5-4d42-1e25-08d9a4481490
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:46:14.0141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0GQsY1+Y3lCGZzz/wpNF3Slytva9zE5AK1Q3W8UKaIMDh5Nya+sorEJ0jvNVIUGX/7lokPQm2S0mvQwUNdNpA5fBMcWKnkc+iLrxMU03OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.11.2021 13:38, Hanna Reitz wrote:
> The children list is specific to BDS parents.  We should not modify it
> in the general children modification code, but let BDS parents deal with
> it in their .attach() and .detach() methods.
> 
> This also has the advantage that a BdrvChild is removed from the
> children list before its .bs pointer can become NULL.  BDS parents
> generally assume that their children's .bs pointer is never NULL, so
> this is actually a bug fix.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   block.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 580cb77a70..243ae206b5 100644
> --- a/block.c
> +++ b/block.c
> @@ -1387,6 +1387,8 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>   {
>       BlockDriverState *bs = child->opaque;
>   
> +    QLIST_INSERT_HEAD(&bs->children, child, next);
> +
>       if (child->role & BDRV_CHILD_COW) {
>           bdrv_backing_attach(child);
>       }
> @@ -1403,6 +1405,8 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>       }
>   
>       bdrv_unapply_subtree_drain(child, bs);
> +
> +    QLIST_REMOVE(child, next);
>   }
>   
>   static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
> @@ -2747,7 +2751,7 @@ static void bdrv_child_free(void *opaque)
>   static void bdrv_remove_empty_child(BdrvChild *child)
>   {
>       assert(!child->bs);
> -    QLIST_SAFE_REMOVE(child, next);
> +    assert(!child->next.le_prev); /* not in children list */
>       bdrv_child_free(child);
>   }
>   
> @@ -2913,7 +2917,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>           return ret;
>       }
>   
> -    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);

The following comment become stale. We should remove it too. With comment removed:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

>       /*
>        * child is removed in bdrv_attach_child_common_abort(), so don't care to
>        * abort this change separately.
> @@ -4851,7 +4854,6 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
>       BdrvRemoveFilterOrCowChild *s = opaque;
>       BlockDriverState *parent_bs = s->child->opaque;
>   
> -    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>       if (s->is_backing) {
>           parent_bs->backing = s->child;
>       } else {
> @@ -4906,7 +4908,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>       };
>       tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
>   
> -    QLIST_SAFE_REMOVE(child, next);
>       if (s->is_backing) {
>           bs->backing = NULL;
>       } else {
> 


-- 
Best regards,
Vladimir

