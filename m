Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71516318F6A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:06:50 +0100 (CET)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEUS-0002cd-GW
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAESQ-0000qe-Nk; Thu, 11 Feb 2021 11:04:42 -0500
Received: from mail-eopbgr00127.outbound.protection.outlook.com
 ([40.107.0.127]:23363 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAESN-0005fp-44; Thu, 11 Feb 2021 11:04:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhRam/c8E44U0iSOYyOBUcJ3Oig6D6clHUAeVj9uQVOTVo/kfU+R/GejCNCA8C4wgFm5r7wPj/1IQREKVVIsiLcvuj42uwX1QNJx86L3rawopculBghkh75jkIx5Xr7dvtAdcEeMs7zESg9R63q/ykHKG7rP6kDq+i/yXm8dOJWMdqtPZucnZEOqM00yBbi52gLHu5QwzT1H02k/m/SOwFFVoqdFUE12HXPFpCg3VBzXGaYx2EfdmsVlNTOoUIPk8B2MOeCA4bTJSQQgbxoksKsCASzSDCIKOhVXoXvIyP6cNbUOms+WQkw+KaEkI56DunDTqE4Srtf8QA6iqq/Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILLeo43sc19woDiIq0Zve1OdRNl5aH21BBmvmDDz+Ts=;
 b=JE1GOLGk8XNrGU0BfLG9C475ODk2hJ6Fr9ecstuqSAaIx/7bbF6Dr/qJxVO8BEEgiB8+hRfsTx43VU/RklB5dYjvky2t1Z7atQ44bNfAXrqPmeeukUeC3Um8nTb4Dnch99V7vJQqK2+STWfk17Ni/KD43/1HSptG802MCG7SBOGH5vzuvfBsI6AYx4LTVK1Umgfn8JWjQ9pWT0dklAXtZx/k+Xd3VChY5Wvg7I7aHGSBzVO4ebrRSpnnYuF5gAXIxSFwm/XYq5MNv+m00ysLyWSth495jhO6kLjxMq4amgaWnB2UMtsqE/hiCrqgbTLqU/Gx7NV5MuzGahYmIiO0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILLeo43sc19woDiIq0Zve1OdRNl5aH21BBmvmDDz+Ts=;
 b=h0K8RBE7Z6k3PxuKCGiSx5SuNahwWE+Z0wDnL/wobLiO0a9V9cmQbw3HfbVP3A4iFQpyn4ZqAYy1D1s7TXaodoldX5K6WOR9JMUgmTwpF6aSEPAibnTg8eZQqwMzAWN5HcQ6YfxIU7HGNbl/CuzXpX1RJgb7EvuIqIpEDcLgOOI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 16:04:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 16:04:32 +0000
Subject: Re: [PATCH v2 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistance
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
References: <cover.1612953419.git.pkrempa@redhat.com>
 <e7bdfa1463cbcfc5a9458d98625f8b3dbe55a3b1.1612953419.git.pkrempa@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d46d6ad9-e24d-bdf2-7f05-eeebe804dd07@virtuozzo.com>
Date: Thu, 11 Feb 2021 19:04:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <e7bdfa1463cbcfc5a9458d98625f8b3dbe55a3b1.1612953419.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:208:122::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:208:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 16:04:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65627a4-d2ad-4ec6-aaf4-08d8cea6b82e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-Microsoft-Antispam-PRVS: <AM6PR08MB484956A146C3E4C2C3C53E68C18C9@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zs7UGd8PzqjzaDLXXvR8iL7Qls9CzBjhoKgsDxplKuu4/7IgP/QdrQ4UnRVY+W9gRC32MAJa9iLVn+S6d0lK1tTp842DPLiApY8XZ6EnnHfekMNwb7E+Z2xEgsH5hv/aV3w96I2boRdHncpCDIUNz5O+Uzu5h0EC54MHZrqoGMSCY+NfLvR2g6qw+X3kkE2aurYDQ6hQumRCZw2JVKxWL97VFuUwFBWNIk5Q1qDaADlfCoTmfnUB4Z7+3297Jone0H4z9/XELjZQZ0dVCee4FvGF9KvnSuRsq7wyuytP0Z3DdZhb/J9I7Up8jPAPSAJE4QlJ4390IoeCEwrPZ3OlhDjVoOUlAcHlp2KXK/WWmXnbO9d+20zR+HdTU3Y0wRH1/XvkqkAyFOFoGbR8oNBPl5j/j850QOOCB8fPz/T2yLfnagLaFp3sx42MRuq/kLgwCHcCFzUJpRsIahFCOvTlhgt3m/L57ONT6nPSCxYBxTMNS7Oo+tY0AkMbUGgeUN/mC6KcYftX4A32DIpWJKI6Uw9m5WmT8Gc5eWKM/UOwE6gt5fy64OfxU1wfLjecg1ZPiZJMMYPMKx47m+yeMWP9pgown8xBtaoaIt32lxVP1Gv0bVmGsohmhtGm11J5oBVE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39830400003)(2906002)(8676002)(31686004)(4326008)(66476007)(54906003)(66556008)(83380400001)(16526019)(31696002)(956004)(2616005)(86362001)(52116002)(478600001)(5660300002)(26005)(6486002)(16576012)(316002)(8936002)(66946007)(186003)(36756003)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1VOVGFMVVdkaEUyamU0SHBrZm5PRkJHMlh3QjU0OHRCZXJnU2xkWGpMNWlr?=
 =?utf-8?B?cE9WbWxQbVNsRDRwMWI4eEhuUy8vUitJdlJPTzNDTG1VdEZGbmlVRjdoNFEx?=
 =?utf-8?B?UjZkM0VoeTVXUlFrZVVNU2g2L3ZPUDJzSFlqWXZsRmxPeFZ0djNnWHFzanpp?=
 =?utf-8?B?U2RtQy84bTNlMmYyQlQxTzBVRzhQSHpHblVkellQRDQvM3RVNklFY21aQkVT?=
 =?utf-8?B?QUhQZThKTzE4eFAwZFhlVyt0M2tsRlpEaEFBTVRjaEt5bnV6bWxBc2FNKzVV?=
 =?utf-8?B?dGxib0xoRlBvNkZsSWhYMHlYYkVtYmMvL0ZCdVhpSEx2OHVTcUFPMmh6R0Vq?=
 =?utf-8?B?aFdaNFVyb2tsTnNWVnRZbkhYYnk1UVZUSVpCZ3lORVdtUm5tcDJjeHAvUDA5?=
 =?utf-8?B?NS82NkJzWnd2U1dnOHZteDZKSUFROTFwVFZUay85QXNnVEdLak1MZzc0U2JW?=
 =?utf-8?B?VkRSZFV4QWFqcStBdSs5d3RBUzdGNEdYaHNpUFZYWGdzejBRTGM0am9GMWF3?=
 =?utf-8?B?ajZoNE8xU2VkdEQ3OGo5QVBENHVKM2VWN1pFZXJCUDNVVGVvazJzOWxkTmNr?=
 =?utf-8?B?UHg0emtBWFZKRVl5YUJWTnViK2QxWDZZeEhvYUh5MVFiQnE4Mjhzd3FNcWI3?=
 =?utf-8?B?Z3dySWFmRExISlhFYXhLLzkvNFQvdTFPRkZWcEFveVVJRHlkd01QVmxCbHpi?=
 =?utf-8?B?TXIrYk9sZkVzRnkzSWlZa2hRT2NLNUo5MHV0T0NOMkEzM09ZdXc5MTJocUxp?=
 =?utf-8?B?bmQ2U3BCZ0VXT0V5bU96L2FpbGtzNTBxMWhuNG52Ty9FdkRxVjlYWS8zYlh5?=
 =?utf-8?B?dG9rUGRacUhCSjlpNXpxSkNrVFBvamdFZGNFOG1FbVFSQzFRTXY3TWRabU1q?=
 =?utf-8?B?NVhQaXlpZk1BOGJpdkh2V3hJVEhGeVg4RVJCRGlYQTRGdjFzNWcvTENFREky?=
 =?utf-8?B?aVBMYncxKzFMRGphQzY0SzdxS2RJUFBjcjIzSjhXZmtkT2kyb1pJYXdHTUhQ?=
 =?utf-8?B?RjJOd3ZqemlSN1hQekhEU1p1eTZRYWVWakRZVDU3bHdjOTlabFdWeGV6SHll?=
 =?utf-8?B?YVM0cDdKcHdzVnMrYld4SDMvcktWc3dYSHlWc1V2OW4yWGZJQTRaUWVFOXJQ?=
 =?utf-8?B?OERYbkQ2aWNhNkllRGpCVVZwMWdLMGtQUVdnWVRYdTdtc3dQbTcwYnJZQWFj?=
 =?utf-8?B?dld5R29nOE5QK2l1VHZDM3pHd3VPbkFRZU9qejV1VTAwVHEySkJXeUEwb2xI?=
 =?utf-8?B?cWtMWXBNZUVBaWhBUGNuZEVFSmYwWjBVSTMrMHRuOWQ0NFl0UURFdWZscDhP?=
 =?utf-8?B?TjN2QVVrcjJRdXhQS05FTnpLUUhuejViaFA3MmZES0xPTzJtT2lRMVJPdFNm?=
 =?utf-8?B?L2RJK1d3MG5YUU5uaXpFV0huUW5ObXVHRGNMNk5QYW8rSXI5VFozZWMrYVJM?=
 =?utf-8?B?aGJNcWNJZ0FlWS8waVR0bkVXTkpmdTVwM05ONTYyOXJtTVlWRXdOWUs4TXRH?=
 =?utf-8?B?d1kzL1F0SEFrQnJXTTVnVlpxdXNteDdMcmtRY2NnaEhVbThYTCtmRlkwamtU?=
 =?utf-8?B?TmV2T1oxbjFCSU4wekhYRHVGZjQybUhKOTlDZ1NxWHlpaTIzdEZHQTZ1VmZC?=
 =?utf-8?B?ekJZSTczRURWU3Z0YkM4NjNEaklmOG8zcFNMNUNwYmxuNjNsUVFwVkMwdUxn?=
 =?utf-8?B?SG41RTJpaWp5TUdaL0FnenhmL1MrUTBISzd6cDErd1A4V210WjMwUzRCWGYr?=
 =?utf-8?Q?5QsbRB7ezcvJYn/GkxdobMuSLFwUPgMa8BFEEsB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65627a4-d2ad-4ec6-aaf4-08d8cea6b82e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:04:32.6737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTMWGY3givzj4qcwoMnf90CPQ+kfz1wsdS6d9Bw+fb69UOMyRCS3oM/j+PM2DADq+xkPfsz81yC31Q569eti9+badSoqFdMNvbj3T78posU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.0.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
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

10.02.2021 19:53, Peter Krempa wrote:
> Bitmap's source persistance is transported over the migration stream and
> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating
> into a squashed image) but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This patch adds a 'transform' property to the alias map which allows to
> override the persistance of migrated bitmaps both on the source and
> destination sides.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
> 
> v2:
>   - grammar fixes (Eric)
>   - added 'transform' object to group other possible transformations (Vladimir)
>   - transformation can also be used on source (Vladimir)
>   - put bmap_inner directly into DBMLoadState for deduplication  (Vladimir)
> 
>   migration/block-dirty-bitmap.c | 38 +++++++++++++++++++++++++++-------
>   qapi/migration.json            | 20 +++++++++++++++++-
>   2 files changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index 0169f672df..a05bf74073 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -138,6 +138,13 @@ typedef struct LoadBitmapState {
>       bool enabled;
>   } LoadBitmapState;
> 
> +typedef struct AliasMapInnerBitmap {
> +    char *string;
> +
> +    /* 'transform' properties borrowed from QAPI */
> +    BitmapMigrationBitmapAliasTransform *transform;
> +} AliasMapInnerBitmap;
> +
>   /* State of the dirty bitmap migration (DBM) during load process */
>   typedef struct DBMLoadState {
>       uint32_t flags;
> @@ -148,6 +155,7 @@ typedef struct DBMLoadState {
>       BdrvDirtyBitmap *bitmap;
> 
>       bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
> +    AliasMapInnerBitmap *bmap_inner;
> 
>       /*
>        * cancelled
> @@ -169,10 +177,6 @@ typedef struct DBMState {
> 
>   static DBMState dbm_state;
> 
> -typedef struct AliasMapInnerBitmap {
> -    char *string;
> -} AliasMapInnerBitmap;
> -
>   static void free_alias_map_inner_bitmap(void *amin_ptr)
>   {
>       AliasMapInnerBitmap *amin = amin_ptr;
> @@ -330,6 +334,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
> 
>               bmap_inner = g_new0(AliasMapInnerBitmap, 1);
>               bmap_inner->string = g_strdup(bmap_map_to);
> +            bmap_inner->transform = bmba->transform;

We rely on the fact that bmba->transform will not be freed.. Is it correct, can migration parameters change at some unexpected moment?
Anyway it's strange that we copy string, but just add reference to transform structure.

Looks like we need QAPI_CLONE() here. And we can clone the whole bmba, then we can drop AliasMapInnerBitmap structure at all (hmm and if go this way, this should be done in a previous patch).

Other than that the logic and new QAPI interface looks OK for me.

Also, we need a test-case for new feature in tests/qemu-iotests/300

> 
>               g_hash_table_insert(bitmaps_map,
>                                   g_strdup(bmap_map_from), bmap_inner);
> @@ -547,6 +552,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
>       }
> 
>       FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
> +        BitmapMigrationBitmapAliasTransform *bitmap_transform = NULL;
>           bitmap_name = bdrv_dirty_bitmap_name(bitmap);
>           if (!bitmap_name) {
>               continue;
> @@ -567,6 +573,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
>               }
> 
>               bitmap_alias = bmap_inner->string;
> +            bitmap_transform = bmap_inner->transform;
>           } else {
>               if (strlen(bitmap_name) > UINT8_MAX) {
>                   error_report("Cannot migrate bitmap '%s' on node '%s': "
> @@ -592,8 +599,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
>           if (bdrv_dirty_bitmap_enabled(bitmap)) {
>               dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_ENABLED;
>           }
> -        if (bdrv_dirty_bitmap_get_persistence(bitmap)) {
> -            dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +        if (bitmap_transform &&
> +            bitmap_transform->has_persistent) {
> +            if (bitmap_transform->persistent) {
> +                dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +            }
> +        } else {
> +            if (bdrv_dirty_bitmap_get_persistence(bitmap)) {
> +                dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +            }
>           }
> 
>           QSIMPLEQ_INSERT_TAIL(&s->dbms_list, dbms, entry);
> @@ -801,6 +815,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
>       uint32_t granularity = qemu_get_be32(f);
>       uint8_t flags = qemu_get_byte(f);
>       LoadBitmapState *b;
> +    bool persistent;
> 
>       if (s->cancelled) {
>           return 0;
> @@ -825,7 +840,15 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
>           return -EINVAL;
>       }
> 
> -    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
> +    if (s->bmap_inner &&
> +        s->bmap_inner->transform &&
> +        s->bmap_inner->transform->has_persistent) {
> +        persistent = s->bmap_inner->transform->persistent;
> +    } else {
> +        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +    }
> +
> +    if (persistent) {
>           bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
>       }
> 
> @@ -1109,6 +1132,7 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
>               }
> 
>               bitmap_name = bmap_inner->string;
> +            s->bmap_inner = bmap_inner;
>           }
> 
>           if (!s->cancelled) {
> diff --git a/qapi/migration.json b/qapi/migration.json
> index ce14d78071..338135320a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -536,6 +536,20 @@
>     'data': [ 'none', 'zlib',
>               { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
> +##
> +# @BitmapMigrationBitmapAliasTransform:
> +#
> +# @persistent: If present, the bitmap will be turned persistent
> +#              or transient depending on this parameter.
> +#              (since 6.0)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'BitmapMigrationBitmapAliasTransform',
> +  'data': {
> +      '*persistent': 'bool'
> +  } }
> +
>   ##
>   # @BitmapMigrationBitmapAlias:
>   #
> @@ -544,12 +558,16 @@
>   # @alias: An alias name for migration (for example the bitmap name on
>   #         the opposite site).
>   #
> +# @transform: Allows to modify properties of the migrated bitmap.
> +#             (since 6.0)
> +#
>   # Since: 5.2
>   ##
>   { 'struct': 'BitmapMigrationBitmapAlias',
>     'data': {
>         'name': 'str',
> -      'alias': 'str'
> +      'alias': 'str',
> +      '*transform': 'BitmapMigrationBitmapAliasTransform'
>     } }
> 
>   ##
> 


-- 
Best regards,
Vladimir

