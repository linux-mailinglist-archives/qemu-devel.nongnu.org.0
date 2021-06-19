Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2A3AD9B1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:54:56 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYcp-0007Lj-6N
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYbY-0006Vt-5n; Sat, 19 Jun 2021 06:53:36 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:56770 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYbS-0003g6-5y; Sat, 19 Jun 2021 06:53:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfzDvL7y8pqwkOucLlxS3bxoltznFFWGAdx0ZDPQuccrktmA5IGGBwY+c6HGXD4SfUnGcEE1LNKTJ5qqB8ZduP4KmAI9ff1aPWzyXE+EDVINuYhQSCAHml64lTaq+9t0MOOBZfr/4sBcadaHzkTFPiarS+NNIFvcMkfOtYckauT2MQpu150cfWXtxDGSvlG+EaF395cWGpmagtuq59EGdkdWYA/9mnrQt5AS+LLriDIPOptbHLceRZ7ZI2GHazmK/5WYkjiMxAx4ZIN5OJiGvR1gO1wcJ1CzObhBZK+yhx4XhVQFNipKs6GU99KT35HlP/jSeauoZW/VbtYoAq834w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrL8hGqGftD7lDkN+4OrYXUNvryysl1klYOmOE1LKSk=;
 b=VzIY0e5AB/3UPJxANixcA/zyI48ZLN/9yegtEOKlPHNVbXN21jCAVpEeYlb+9j3+AKDE3zLWNyjjRqE5oZsOXMBkH8ehEfUxDI7zQ4dDFf6C0rWmuYFYp9iexGiLufHnvn8sntpFJ0GFua5k49+kGjrLRJyA1lsgu79erHWvfawvAQcYqeo065NjBBTUxA8ayaFqPU9yRxqMmflRT1+lFUhxqd93TQY7VC+2o1istJwf4PfPox4AGZDOTsYJBZMk6Ix3whb8hzFkO9VYwPJNDW+BOFWnjdP0UlBwnRp8/96CCOURuft/KaJ9gT06iqF8S9o5ug7aPlH2vdlYAAW5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrL8hGqGftD7lDkN+4OrYXUNvryysl1klYOmOE1LKSk=;
 b=qpU77VCg4w7eySEmpxDeCYdRP+5b8E/V3WnvACuerfUVDrCI/14ScczJ/FMdy0GcX7xvWGtM6QrdUuyleUhL3LhJClBwvjGv9IBIFFCc7x3VireyH+RSaw0RlqqMPrOrE8lFCjcLSZleEl4DYaSip1p8GwBui7gaSEqnGruezpQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Sat, 19 Jun
 2021 10:53:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 10:53:26 +0000
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
Date: Sat, 19 Jun 2021 13:53:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR09CA0053.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR09CA0053.eurprd09.prod.outlook.com (2603:10a6:7:3c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 10:53:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3f89f8c-964a-4909-4bcd-08d93310773a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3894CCFCF349AC871073B750C10C9@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qeSfYeIYN7T+wiHxTJ/6PXp/VyMT9nOlHVaTuQ9O54YreyuHdhUVZyfBNjb3UCsgyt98Jp+TD5HMAfjF21Zp379uYNwUqKReYTJxgDHHiDjbzUxUaEOujsVpWU6g6vcj2Tgs3WBvHHFLPOFqebqXhT4enpD/kKykbwIPm0B1qsX571TL9sqQoYRrkzHSt5suxcAV8+2woFAHnJCI7OnCJTJIyG1avB1oMrRGCUR25JupOgzZez+4hb2yvIlmNc5HCxHeBMZhzc7mS4ATesiTEZfzsNk6k/XDN9hmvPJhpMKeswn6/s0Ydy4RHUolc6UFkbNlCk7MJuo9bmzVAHrVcLihyiM6FsLxiEHgc6jVwSXXcnOaC0e+0C95VH4kGS2Nl7aeik7FF93QVCrUmwQCfqqNorrHbPrpILk+lLTvOez3HVdj2ZazLaBkjIAvvMaVA+irYd9nS0P9oeGRoylb01ZVoOng9j5WYoc/ilhLI2o2ksm3LyNYULonIWJscad8c2NQe3ZMU+XOeEOqOhwdkeQ/O2y64/6YWj0nGvdjlcfMZabERfy+OfWi0JPrX/ZQPMGsN3IsYRnOU4wIg5a4blnmqOoOaFVmdDhfaiO/ruNlRdLOXjrE21xutMMlTFEhNrnIyTe/d9jiuapTW32qEzqp0sw0CKdgmP7081Qrf7GSe5Yx6LFPUF+FH7ETKnJiOdVAdlJgMBEJ65YWP1k4ErFwF5rpvq+Y/wDXS0BIkCWj/vncB9vRTeCe9tDC09Us
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(396003)(376002)(346002)(186003)(8936002)(38100700002)(956004)(2616005)(16526019)(316002)(38350700002)(36756003)(26005)(86362001)(66946007)(8676002)(16576012)(478600001)(52116002)(31686004)(5660300002)(6486002)(4326008)(2906002)(66556008)(66476007)(31696002)(83380400001)(2304002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzUra0dyZ0lpbklxT1gwUGgyTmREWTl5YzhyNlVLNHFIeU9uRnJoODJWN0Zt?=
 =?utf-8?B?czdRRmgxWDVXL0U2V1dLZHZ4c1N5MU1TUU4rUlhxazgxRlBRUWFReTZ3TmZa?=
 =?utf-8?B?Q2RHYmJKSkppWHV3ajhyMGdTTWVoTU5xdE9xVDhaYVlzZXdyNDhJb1lFT2hY?=
 =?utf-8?B?dzlTOUVrVmY2NHBnNGxoamNaSGgvOTBtSHlSRG80YmxJRnFxc0tRbjIya2U0?=
 =?utf-8?B?bGFJU2VKOTdrWkt5TFgxSUY3aU9LRXdMWWtsM2lyVUhzcWJxWTAvZWZvT09N?=
 =?utf-8?B?azBOVXRCVXBCS1lnVHo3ajNXS3UxblBlckVDd0RETm16NHNGWFpOcUF1S0Mr?=
 =?utf-8?B?NHpyOE5aNkp0dUZ2WGxzZm9TOHhKcXlvOTZQVGNFQm5vZDRSSmRRd2dtV3ZJ?=
 =?utf-8?B?QWc1R3ZHaFFHRkwrTW9CSSswSnZ1OVNsZlVDUkRoeDY0R0IyQ3R6WnNZV2pK?=
 =?utf-8?B?L2ZpRUY5YnV4VXNnOXpnUWVBSGF1aVZLRGN4dmZ5a0tmRi9DRGxjdmJHbXpo?=
 =?utf-8?B?YXZ1QlhpMVhIRE1oRGVuNWNYMTQ2cmhTbUo3OVN1M0I5V2ErV3pFSkdkZVBq?=
 =?utf-8?B?bjg1dUk5TTl0RW9vbWFEemNvRmtFRUIrTHMxVFJ5Qi9PdVB1ZDhhR0I4Q1da?=
 =?utf-8?B?dmFySTBNMk41dll1WlJhd1J4dU8xL0NJbnJpMithYkxCY1p5cjdqbzdvN2dS?=
 =?utf-8?B?R2VsK0dnSUJ3bmNrTkU4U2lPNmI1bldMTE9Wd3JISHVPVHRKb2JrNTIva3Rt?=
 =?utf-8?B?azFXV0tyWGo2ZkhhZ01qQXlKUm1veTh1SXVIdXBqRFBLZnRITDV3VFIwYmxM?=
 =?utf-8?B?Y3YwQUR1YVBvRlVGL212enh6SzlYeHBTQkxXRUVLNi9tcktGQlBsUHh4ZHZt?=
 =?utf-8?B?NHA0aXU4d3JaR3hiZWhLaW1rcDZpTFRUajExL2M3RzZ0N3VWU3dpcFFKSVZk?=
 =?utf-8?B?cUkvTlMrQWF6WjB4ckxHbU8yczErNC9pWWpBMTkrTzRYQytKZ3NFbVBEbktj?=
 =?utf-8?B?U0xLd0c2TTVYNEFtbllLVGtNTkQ0V3dnaVVId3MyTmZvL2ZYT1ZqQ1BFOGMx?=
 =?utf-8?B?Mmh6aEg0YkdlYWxtTVQ0NmN3V3pBT2ZGUlJNeEphMk9VaXVRNnZRYy8zNmlv?=
 =?utf-8?B?MDZGZGJnUmdVWHRyQXlEZzFBZk1ib21sNWZNOEtudkltUnV3RXBJUDB5YnpZ?=
 =?utf-8?B?YXhFd0c5NHA5YXZHdE54U2VKdWxiQWU5NVlrYU5FRlRwdjF0U1RWOURxemVZ?=
 =?utf-8?B?Z2Q1RlRaMFlURmJFbTA2OGQreERQRHRRN2RoTmhJS1I3MWdYQzRZeTZjYk8r?=
 =?utf-8?B?RGNhUm9aMmlrYjdTY0Z1K0gvN1Q1LzZLdDFxcmxzekl2NmFyZWlRa3I0MVVv?=
 =?utf-8?B?eHNwVzNiUFZXQVhNRnRoUE11SzByd1QvMC9ZaCtnQXZyOWpOY25RMnNiTVlo?=
 =?utf-8?B?ZjkzOXJONTBkZDc2WnU0YUlrSWxMYWl1ZTRSTUwvTHh4UU1ERmgwWEI1RXZ2?=
 =?utf-8?B?LzVnVVFxVlZ1QjZzU2wvK2pKY2wvTy94V0hiWGp2ZXFUUEc5QmRpV1RMQ2dw?=
 =?utf-8?B?Vzd4UEQ2N2ZaN0dTczY3Uk5yWGVuT1k4ZDRndDV0dUJOZHI2YnhIMExHU2JE?=
 =?utf-8?B?ZGEzQk9EL0ZyQnVENzg1bGZVRmVYR2xyaUt2TzVZQzNTeHZiWUZzOG1oa2RT?=
 =?utf-8?B?Z0tVRVNvelFoWjlWem5uVXA1UEVRc1FyeHRDbWZwZWFRVHVmbW9vYnhBVUlE?=
 =?utf-8?Q?Tp7fZVunC+Vpt8NH3Z3TWZhJwOj+f1KLA31l/4P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f89f8c-964a-4909-4bcd-08d93310773a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 10:53:26.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nho4XkzrRLYXbIEEQj6Bov+oCUkTkJRb1AOr15wVI8SydV0UovGb9lxz3iP0acrbxk72rgHkGWg+kLxMGNUIBPIH37iCVM4SM5+odku3QUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.06.2021 18:52, Max Reitz wrote:
> bdrv_co_block_status() does it for us, we do not need to do it here.
> 
> The advantage of not capping *pnum is that bdrv_co_block_status() can
> cache larger data regions than requested by its caller.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/nbd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 616f9ae6c4..930bd234de 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -1702,7 +1702,7 @@ static int coroutine_fn nbd_client_co_block_status(
>           .type = NBD_CMD_BLOCK_STATUS,
>           .from = offset,
>           .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
> -                   MIN(bytes, s->info.size - offset)),
> +                   s->info.size - offset),
>           .flags = NBD_CMD_FLAG_REQ_ONE,
>       };
>   
> 

Hmm..

I don't that this change is correct. In contrast with file-posix you don't get extra information for free, you just make a larger request. This means that server will have to do more work.

(look at blockstatus_to_extents, it calls bdrv_block_status_above in a loop).

For example, assume that nbd export is a qcow2 image with all clusters allocated. With this change, nbd server will loop through the whole qcow2 image, load all L2 tables to return big allocated extent.

So, only server can decide, could it add some extra free information to request or not. But unfortunately NBD_CMD_FLAG_REQ_ONE doesn't allow it.

-- 
Best regards,
Vladimir

