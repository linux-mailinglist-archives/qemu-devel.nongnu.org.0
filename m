Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0B4BC8B9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:40:03 +0100 (CET)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPxy-0000zw-AE
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLPte-0008Pv-Pe; Sat, 19 Feb 2022 08:35:38 -0500
Received: from [2a01:111:f400:fe05::725] (port=61153
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLPsk-0007df-G9; Sat, 19 Feb 2022 08:35:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnkbrTzl/MggfHxwB6iK+1isd/yHGMjxD80uoWcF40/OahHZDxnBf/QI2ReXs3GFzYzzEq3B3NSjsnmnPTAZoNOqh/nPapq3Kb4P3mj8rMXD54YygiMb1ezZsjGVNkq+y+GeeIE9/BBOXNCqJaqp6jkvtYY/VCI6fijpoeriQTSNrKvexwlZFMGO5kcnRWTcjAE841QAKIGPtI3s8bw0NOTaKN7AGryMLCAv7JScWa2zG8nmG3h79Vu6Zw4SvWL3LK39GfVDLBtmeawLEbstfkz9+JF2JyfdBR/N9XafU7+68QurzzuqAG+a1aIL5cIqHO9jQFivYdZeLF+ENMvUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKjcAct6uE69ejHoXz8XnIBiwS+dGstjyxRvrs+wQuE=;
 b=HmANVJDMVRkrPMCkbVFbncA1RUIwn5QcZE8B33fQcWpPkSeovnBp3Tl/2ki+8I3ZfiIPibOFklSUNuvASYYAYMIJY0eazAEaQsmmeTlnRdWLbqDxaZ46olm8k9DVZoEe5NXQp99L1Z5fQo/oFXByFszbjHmBAo91U86wjvvSo01mszzBRHOCaoD0TOfnbZMrl90TJThlVqJ18IUhw+SxIopdqMJq68V9CPFHrTnwcCRkHRuWRMnR6EMSOkl04YTcTBDF3LTfCDCnGXrC+zEcFaKWmChi5oR8rIZNw50JRGXZGYoC0bNI6qc659ekn81DpleAkfd/IujD87L669Of2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKjcAct6uE69ejHoXz8XnIBiwS+dGstjyxRvrs+wQuE=;
 b=KR9c7CfNJsuAAaRuim/YyGUgpOFcqmyunuosfDoeyhyfmH0JxPzKuexZDqhjp0Oa9aDZR5n8xGE/UjiKNKmLkqDqsO1YUS+ICoPDaw+9QK1LsJaUH5jlfi4Ks3K6TbHG+j1oSyL0iUvgiLGLUC9hlac1lMTPeq/LuiLJPpitCyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Sat, 19 Feb
 2022 11:04:40 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47%4]) with mapi id 15.20.4995.024; Sat, 19 Feb 2022
 11:04:40 +0000
Content-Type: multipart/alternative;
 boundary="------------qEV3Nu5SRM3Hjis0eDomHaPy"
Message-ID: <fe21dd14-1387-87e4-73e5-5d7945a3103b@virtuozzo.com>
Date: Sat, 19 Feb 2022 14:04:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] block: simplify handling of try to merge different
 sized bitmaps
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-5-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20220215175310.68058-5-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AM6P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::21) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aee20ac-2f1e-4701-8767-08d9f3979ffa
X-MS-TrafficTypeDiagnostic: AS8PR08MB6135:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB6135E14850830AC542C43C4386389@AS8PR08MB6135.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFkbzUJf8A4fAjS7pvl5Ab0LVi6nWVCb5D26k0KZfisqY9sO/EgS9QVFtG/5ZdmSqZ3V2iybsBF1fMmU527+ovBPr3CFbbRYmv5Sxt7H9KWOMz3o3Xh9hmAAzhtAT+1ZjNaF/AU0p9TjM0nkwwwc/1XoFfKVb0wXJ9//4xgVv83CLbJ+F0bnI09UDNjDVDN81OgLjW/qqpbrdaRDCM+wG7Zra5gu0cMOJHiCo0nq8QfCG/zfF4IhIgUD+oHLC34iGqfhCrw8/S+p6vrMiYzqVQ0lypLg8Nl2dz2WdpJ+ZT9dOEY1K21FOYe0kRCbDRKZ0ZG4S/7jn1K5TTkvdnWidURvKBGLjpJqS8RZyd3SetOrJdhMo2UZNIR8TNXUN3rdfb/lsqbzIEf3M57tvFS4n9QChEjKZ4oYgc69NpwWmuRPzWtDucgKzmurivGVNwAkEBZ+MRu1VeFaHD/7cYzWpWI8tvKv6JnDAMjkWaxeO1doUbXimRPZzmdOunoXjjRCaZP8EropifjBM9ltHxxyran3SazqQzGjuGxZqzdr67mPUJGMx0WsR4VZ2vWPXYTRh5jImg+3tEPIrnbA4MvqenwrIdBjkjCjHpQf8ce1iaDtTgDEJO+zFGiyXE23B5L+xk9z/wu63wva5/ZA2RKEc1SjGC5yUkh1745Kvav8wKBc0kQhPiwem1MjzSL1DQT7ngM/yZL9nnrx2RXnTpbymYB/GhWJy9W0G9WVY6Q7hfFhJAW8CVR+/DgazJpj0Ie5wU3X0iERarGpFVareBEdng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(31696002)(38100700002)(38350700002)(8676002)(4326008)(66946007)(66476007)(66556008)(316002)(8936002)(30864003)(5660300002)(2906002)(186003)(26005)(83380400001)(2616005)(6486002)(508600001)(6512007)(53546011)(6666004)(6506007)(52116002)(33964004)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2xGMUVKejhUZDdzM1Z1cDZEOHhtM1dsOVhwd0pQMy80VEVHRXhrZzNpNlZO?=
 =?utf-8?B?Nlk4THNtOFhUd3hCR0ZtekprTHE4Z1JGLzFCMWlSTmhxY21yZERBVUZ0SzIy?=
 =?utf-8?B?azEyR3V4YTBGQTdpbDQ2TktYS2Z0VWlwQnE1R2x6QjN3TG8wTWpmRWJQa0Fz?=
 =?utf-8?B?TVQ2eTVSNmV3czFWUVA3YnR3NkgvV2JHVENvdlhsM0l1Q2x4elE0NHBjZ3Za?=
 =?utf-8?B?dmdqZldnNEUvajZBelZTZW5uaFU2NFBWTkIvUjRGNjZXa2VSb1Z1c3FGODF0?=
 =?utf-8?B?amFVUWNucXBPSmJteGJnSzlFVEV6cnNqeGZrY0ZhQnpwRW1XSllhTmdFS1hG?=
 =?utf-8?B?YVphN0RTdlMyTm1TREF3WkErRXdSb1ArY0FuMURaeHBMQXBNS0RsMXoxeG44?=
 =?utf-8?B?Z2UwYTkwektmbUt0b25sbWRncTFLL0oxWDNRVnJQNWZIVm82N2tzbG9TS0NK?=
 =?utf-8?B?anZEV2FYSkRBL28zVVcyZVZRQWZvcm0vbUxsM1NNZHhCUkJsYm9ydzE5RkdX?=
 =?utf-8?B?Q25UVVFHak5tWUNvcitiTTJUdkYrNUVTU3R1OWZmZlY5MTdyVzZvaHdNZFU5?=
 =?utf-8?B?RnRyK3JqV2JHaHZqMWtydlRNa0ZSU1ppbHowNXRVVE94YUVSdUZhTGlpdW9P?=
 =?utf-8?B?L3B4MjV0a2R3cTFjQ0pnYUt0TUJxNTdVQTRzY0g0OC9scWExc0lOYW56R2Vr?=
 =?utf-8?B?YnN0RWltN3dqcE04SXludnNyekd3enljdTd6d3BWQzRBQU5lUmJ1M0Z3L3lk?=
 =?utf-8?B?QXFFRjg3N1RlZU5KUVJabXhwb0pWWm5oTmlrUENXQXFYM2FtZVJvM3ZnT3NK?=
 =?utf-8?B?a2NpdjQ0TjZsNnNiaDNEb1ZRWVZQYlB0b1MxdmFjWnBLemd6a3NFdHFldEpJ?=
 =?utf-8?B?VGxPNGZyeHllNE5WTjBXZE1xTFAzZGdjcWlyVCs0R0hmalVoamFlYWkvQk9l?=
 =?utf-8?B?SitZM0pETG9wR2w3VjUvZlFvb1MyYStyTzZnbXlzU3plMlN3MzhVSlM0Q2Va?=
 =?utf-8?B?dFNCSjh5dGt3YUREWkxmWmtLNGtOQmRuV0FmbmdyYU1mMVZ5dzM0alQ0Ymtu?=
 =?utf-8?B?SmtGNjRZNXhxREpUdUw1TS9DU2lueEdVOStxM0JlczBRc1JPaEdKdEJScU9Q?=
 =?utf-8?B?aUJIY2QrTnJKWnJDMGc0MGxCUGd2N2hvUmgvT1lJYVlYUGFoRUw5ME05QXND?=
 =?utf-8?B?eFdERDNIN0VJcHU1NERPTnp6K1VoSWlwK3Q5YSttVVZxeVpnRW9vUnVoZVVF?=
 =?utf-8?B?a01aWFhta010aGxtTDZvQmM3RmF6TnJuZWs0MDVpbmVGeHZmU1poQ0UyR04z?=
 =?utf-8?B?WjZyeHpCbjhieUFobmF0M1Bxd0gvWncvWXFQRVJlSHlWdGlZOHM1TVdyUFlv?=
 =?utf-8?B?TnYzNS9iWHZVU3FBcWpXcWJmdUlXb1llUVBTK2g1OVpIWmlWSzZHOE9xMzZ6?=
 =?utf-8?B?OCtaZjlXQ3V3MmwwUDZ5WldvWWxHZzViYUJyOGZnQk8rU3dXb1NyWG5IVnlG?=
 =?utf-8?B?Z08zUE5DdFZvQ3pwZlFNQzVva1N1M3d1WElNZEV5b2RVai8yVHIzRUUxM1ZJ?=
 =?utf-8?B?a0J4dStjT3h6bjJPUHJ4Z3J4RDBlVEZ3NFhCZC81S3F3MWI3Mk9jdzF5YkNv?=
 =?utf-8?B?S1pXdmd4VXRBS2xhbUgraFRTN1I3UW1QZVRtem1EdTh5QW9wWGFhOXc5RFdF?=
 =?utf-8?B?ZEdXSGVpY2hZcmY1cHdQNDRnZ0duRERoNGdhc014Y0FwOVJtVU9nSGI3bHAy?=
 =?utf-8?B?SHdUcWNHUXpIWjQ3QUNwdTdpYnZ0Zzl4Z01RQlpvQVd1NUNaTmFtTGtUWWQw?=
 =?utf-8?B?MTZpNHBaSjZQYkRBYUhQcnFLSVE5Z2htaFVkcUhuVXo4aHNydkZGU2xzbzRC?=
 =?utf-8?B?QkdWN2lINnJFbEtZcHBWcFZpazNBTXBHSVRYaXVrbC9XWWhWcFFYK1NXMXJi?=
 =?utf-8?B?cGlYZXU5YzNjZ1FaQWsraUdnRDZhNGVjTklkSWQrbThaRXFQQ1pMTjg0TVZ5?=
 =?utf-8?B?WlFQYUY2TllMMkRydVZkVVVPbzFnWDZZYThsTnZ4YWpjL2FtMkRUMU84Q3JJ?=
 =?utf-8?B?TkVkY0hOR3FNVm5HdVpxR3llWnRZT2s3di9XbFk5ZzVyVUNYbzRSVm9aRFFI?=
 =?utf-8?B?NFpDWG1OanVZL1hVZWQ5UVhqYWtIZHRFRHd0ckx2QWxSSEpDMjEzbHMxUnNr?=
 =?utf-8?B?SFZabXdwNmJUWmE4dTNJUE9NVHVwdXUwQVRyaW0xaVZQNU5ndlZwcVRHeFY2?=
 =?utf-8?B?aVZWWFZaSjZ4czJyRlRyTnhvMXFnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aee20ac-2f1e-4701-8767-08d9f3979ffa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 11:04:40.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gw4Anc5g8Fc1EVp4YdQ0N9FH8hXQSjD2LR2jnr+k0+8pikglOCD56d+roU+/jI0bnCsHV5dE9iBz4s8wlCJeFWripBnbuxQjlogzS2UfhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe05::725
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe05::725;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--------------qEV3Nu5SRM3Hjis0eDomHaPy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:

> We have too much logic to simply check that bitmaps are of the same
> size. Let's just define that hbitmap_merge() and
> bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
> same size, this simplifies things.
>
> Let's look through the callers:
>
> For backup_init_bcs_bitmap() we already assert that merge can't fail.
>
> In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
> that can't happen: successor always has same size as its parent, drop
> this logic.
>
> In bdrv_merge_dirty_bitmap() we already has assertion and separate
> check. Make the check explicit and improve error message.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h |  2 +-
>   include/qemu/hbitmap.h    | 15 ++-------------
>   block/backup.c            |  6 ++----
>   block/dirty-bitmap.c      | 25 ++++++++++---------------
>   util/hbitmap.c            | 25 +++++++------------------
>   5 files changed, 22 insertions(+), 51 deletions(-)
>
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 27008cfb22..cc40b6363d 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -1382,7 +1382,7 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
>   
>   void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
>   void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup);
> -bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
> +void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>                                         const BdrvDirtyBitmap *src,
>                                         HBitmap **backup, bool lock);
>   
> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
> index 5e71b6d6f7..4dc1c6ad14 100644
> --- a/include/qemu/hbitmap.h
> +++ b/include/qemu/hbitmap.h
> @@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
>    *
>    * Store result of merging @a and @b into @result.
>    * @result is allowed to be equal to @a or @b.
> - *
> - * Return true if the merge was successful,
> - *        false if it was not attempted.
> + * All bitmaps must have same size.
>    */
> -bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
> -
> -/**
> - * hbitmap_can_merge:
> - *
> - * hbitmap_can_merge(a, b) && hbitmap_can_merge(a, result) is sufficient and
> - * necessary for hbitmap_merge will not fail.
> - *
> - */
> -bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
> +void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
>   
>   /**
>    * hbitmap_empty:
> diff --git a/block/backup.c b/block/backup.c
> index 21d5983779..fb3d4b0e13 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -228,15 +228,13 @@ out:
>   
>   static void backup_init_bcs_bitmap(BackupBlockJob *job)
>   {
> -    bool ret;
>       uint64_t estimate;
>       BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
>   
>       if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
>           bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
> -        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
> -                                               NULL, true);
> -        assert(ret);
> +        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap, NULL,
> +                                         true);
>       } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
>           /*
>            * We can't hog the coroutine to initialize this thoroughly.
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index d16b96ee62..9d803fcda3 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
>           return NULL;
>       }
>   
> -    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
> -        error_setg(errp, "Merging of parent and successor bitmap failed");
> -        return NULL;
> -    }
> +    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
>   
>       parent->disabled = successor->disabled;
>       parent->busy = false;
> @@ -899,13 +896,14 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>           goto out;
>       }
>   
> -    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
> -        error_setg(errp, "Bitmaps are incompatible and can't be merged");
> +    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
> +        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
> +                   PRId64 ", source size is %" PRId64 ") and can't be merged",
> +                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
>           goto out;
>       }
>   
> -    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
> -    assert(ret);
> +    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
>   
>   out:
>       bdrv_dirty_bitmaps_unlock(dest->bs);
> @@ -919,18 +917,17 @@ out:
>   /**
>    * bdrv_dirty_bitmap_merge_internal: merge src into dest.
>    * Does NOT check bitmap permissions; not suitable for use as public API.
> + * @dest, @src and @backup (if not NULL) must have same size.
>    *
>    * @backup: If provided, make a copy of dest here prior to merge.
>    * @lock: If true, lock and unlock bitmaps on the way in/out.
>    * returns true if the merge succeeded; false if unattempted.
>    */

There is no return value after this change.

> -bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
> +void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>                                         const BdrvDirtyBitmap *src,
>                                         HBitmap **backup,
>                                         bool lock)
>   {
> -    bool ret;
> -
>       assert(!bdrv_dirty_bitmap_readonly(dest));
>       assert(!bdrv_dirty_bitmap_inconsistent(dest));
>       assert(!bdrv_dirty_bitmap_inconsistent(src));
> @@ -945,9 +942,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>       if (backup) {
>           *backup = dest->bitmap;
>           dest->bitmap = hbitmap_alloc(dest->size, hbitmap_granularity(*backup));
> -        ret = hbitmap_merge(*backup, src->bitmap, dest->bitmap);
> +        hbitmap_merge(*backup, src->bitmap, dest->bitmap);
>       } else {
> -        ret = hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
> +        hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
>       }
>   
>       if (lock) {
> @@ -956,6 +953,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>               bdrv_dirty_bitmaps_unlock(src->bs);
>           }
>       }
> -
> -    return ret;
>   }
> diff --git a/util/hbitmap.c b/util/hbitmap.c
> index 305b894a63..d0aaf205ed 100644
> --- a/util/hbitmap.c
> +++ b/util/hbitmap.c
> @@ -840,11 +840,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
>       }
>   }
>   
> -bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
> -{
> -    return (a->orig_size == b->orig_size);
> -}
> -
>   /**
>    * hbitmap_sparse_merge: performs dst = dst | src
>    * works with differing granularities.
> @@ -868,28 +863,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
>    * Given HBitmaps A and B, let R := A (BITOR) B.
>    * Bitmaps A and B will not be modified,
>    *     except when bitmap R is an alias of A or B.
> - *
> - * @return true if the merge was successful,
> - *         false if it was not attempted.
> + * Bitmaps must have same size.
>    */
> -bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
> +void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>   {
>       int i;
>       uint64_t j;
>   
> -    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
> -        return false;
> -    }
> -    assert(hbitmap_can_merge(b, result));
> +    assert(a->orig_size == result->orig_size);
> +    assert(b->orig_size == result->orig_size);
>   

When hbitmap_merge() is called it is impossible to know if 'a' and 'b' have
the same orig_size. Of course there is workaround as it is shown using
bdrv_dirty_bitmap_size. However one function for checking looks to me better
than workaround. May be I missed the idea so I don't insist on it moreover.

>       if ((!hbitmap_count(a) && result == b) ||
>           (!hbitmap_count(b) && result == a)) {
> -        return true;
> +        return;
>       }
>   
>       if (!hbitmap_count(a) && !hbitmap_count(b)) {
>           hbitmap_reset_all(result);
> -        return true;
> +        return;
>       }
>   
>       if (a->granularity != b->granularity) {
> @@ -902,7 +893,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>           if (b != result) {
>               hbitmap_sparse_merge(result, b);
>           }
> -        return true;
> +        return;
>       }
>   
>       /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
> @@ -918,8 +909,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>   
>       /* Recompute the dirty count */
>       result->count = hb_count_between(result, 0, result->size - 1);
> -
> -    return true;
>   }
>   
>   char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)

With changed description:
Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------qEV3Nu5SRM3Hjis0eDomHaPy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20220215175310.68058-5-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">We have too much logic to simply check that bitmaps are of the same
size. Let's just define that hbitmap_merge() and
bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
same size, this simplifies things.

Let's look through the callers:

For backup_init_bcs_bitmap() we already assert that merge can't fail.

In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
that can't happen: successor always has same size as its parent, drop
this logic.

In bdrv_merge_dirty_bitmap() we already has assertion and separate
check. Make the check explicit and improve error message.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
---
 include/block/block_int.h |  2 +-
 include/qemu/hbitmap.h    | 15 ++-------------
 block/backup.c            |  6 ++----
 block/dirty-bitmap.c      | 25 ++++++++++---------------
 util/hbitmap.c            | 25 +++++++------------------
 5 files changed, 22 insertions(+), 51 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..cc40b6363d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1382,7 +1382,7 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
 void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup);
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup, bool lock);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..4dc1c6ad14 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
  *
  * Store result of merging @a and @b into @result.
  * @result is allowed to be equal to @a or @b.
- *
- * Return true if the merge was successful,
- *        false if it was not attempted.
+ * All bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
-
-/**
- * hbitmap_can_merge:
- *
- * hbitmap_can_merge(a, b) &amp;&amp; hbitmap_can_merge(a, result) is sufficient and
- * necessary for hbitmap_merge will not fail.
- *
- */
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
 
 /**
  * hbitmap_empty:
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..fb3d4b0e13 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -228,15 +228,13 @@ out:
 
 static void backup_init_bcs_bitmap(BackupBlockJob *job)
 {
-    bool ret;
     uint64_t estimate;
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job-&gt;bcs);
 
     if (job-&gt;sync_mode == MIRROR_SYNC_MODE_BITMAP) {
         bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
-        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job-&gt;sync_bitmap,
-                                               NULL, true);
-        assert(ret);
+        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job-&gt;sync_bitmap, NULL,
+                                         true);
     } else if (job-&gt;sync_mode == MIRROR_SYNC_MODE_TOP) {
         /*
          * We can't hog the coroutine to initialize this thoroughly.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index d16b96ee62..9d803fcda3 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
         return NULL;
     }
 
-    if (!hbitmap_merge(parent-&gt;bitmap, successor-&gt;bitmap, parent-&gt;bitmap)) {
-        error_setg(errp, &quot;Merging of parent and successor bitmap failed&quot;);
-        return NULL;
-    }
+    hbitmap_merge(parent-&gt;bitmap, successor-&gt;bitmap, parent-&gt;bitmap);
 
     parent-&gt;disabled = successor-&gt;disabled;
     parent-&gt;busy = false;
@@ -899,13 +896,14 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
         goto out;
     }
 
-    if (!hbitmap_can_merge(dest-&gt;bitmap, src-&gt;bitmap)) {
-        error_setg(errp, &quot;Bitmaps are incompatible and can't be merged&quot;);
+    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
+        error_setg(errp, &quot;Bitmaps are of different sizes (destination size is %&quot;
+                   PRId64 &quot;, source size is %&quot; PRId64 &quot;) and can't be merged&quot;,
+                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
         goto out;
     }
 
-    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
-    assert(ret);
+    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
 
 out:
     bdrv_dirty_bitmaps_unlock(dest-&gt;bs);
@@ -919,18 +917,17 @@ out:
 /**
  * bdrv_dirty_bitmap_merge_internal: merge src into dest.
  * Does NOT check bitmap permissions; not suitable for use as public API.
+ * @dest, @src and @backup (if not NULL) must have same size.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  * @lock: If true, lock and unlock bitmaps on the way in/out.
  * returns true if the merge succeeded; false if unattempted.
  */</pre>
    </blockquote>
    <pre>
There is no return value after this change.

</pre>
    <blockquote type="cite" cite="mid:20220215175310.68058-5-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup,
                                       bool lock)
 {
-    bool ret;
-
     assert(!bdrv_dirty_bitmap_readonly(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(src));
@@ -945,9 +942,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
     if (backup) {
         *backup = dest-&gt;bitmap;
         dest-&gt;bitmap = hbitmap_alloc(dest-&gt;size, hbitmap_granularity(*backup));
-        ret = hbitmap_merge(*backup, src-&gt;bitmap, dest-&gt;bitmap);
+        hbitmap_merge(*backup, src-&gt;bitmap, dest-&gt;bitmap);
     } else {
-        ret = hbitmap_merge(dest-&gt;bitmap, src-&gt;bitmap, dest-&gt;bitmap);
+        hbitmap_merge(dest-&gt;bitmap, src-&gt;bitmap, dest-&gt;bitmap);
     }
 
     if (lock) {
@@ -956,6 +953,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
             bdrv_dirty_bitmaps_unlock(src-&gt;bs);
         }
     }
-
-    return ret;
 }
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..d0aaf205ed 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -840,11 +840,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     }
 }
 
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
-{
-    return (a-&gt;orig_size == b-&gt;orig_size);
-}
-
 /**
  * hbitmap_sparse_merge: performs dst = dst | src
  * works with differing granularities.
@@ -868,28 +863,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
  * Given HBitmaps A and B, let R := A (BITOR) B.
  * Bitmaps A and B will not be modified,
  *     except when bitmap R is an alias of A or B.
- *
- * @return true if the merge was successful,
- *         false if it was not attempted.
+ * Bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 {
     int i;
     uint64_t j;
 
-    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
-        return false;
-    }
-    assert(hbitmap_can_merge(b, result));
+    assert(a-&gt;orig_size == result-&gt;orig_size);
+    assert(b-&gt;orig_size == result-&gt;orig_size);
 </pre>
    </blockquote>
    <pre>
When hbitmap_merge() is called it is impossible to know if 'a' and 'b' have
the same orig_size. Of course there is workaround as it is shown using 
bdrv_dirty_bitmap_size. However one function for checking looks to me better
than workaround. May be I missed the idea so I don't insist on it moreover.

</pre>
    <blockquote type="cite" cite="mid:20220215175310.68058-5-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">
     if ((!hbitmap_count(a) &amp;&amp; result == b) ||
         (!hbitmap_count(b) &amp;&amp; result == a)) {
-        return true;
+        return;
     }
 
     if (!hbitmap_count(a) &amp;&amp; !hbitmap_count(b)) {
         hbitmap_reset_all(result);
-        return true;
+        return;
     }
 
     if (a-&gt;granularity != b-&gt;granularity) {
@@ -902,7 +893,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
         if (b != result) {
             hbitmap_sparse_merge(result, b);
         }
-        return true;
+        return;
     }
 
     /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
@@ -918,8 +909,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 
     /* Recompute the dirty count */
     result-&gt;count = hb_count_between(result, 0, result-&gt;size - 1);
-
-    return true;
 }
 
 char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)
</pre>
    </blockquote>
    <pre>
With changed description: 
Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------qEV3Nu5SRM3Hjis0eDomHaPy--

