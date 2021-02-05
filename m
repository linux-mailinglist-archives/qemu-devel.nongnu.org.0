Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E03310629
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:02:28 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7w4R-0000cP-0a
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7w3J-00005a-1E; Fri, 05 Feb 2021 03:01:17 -0500
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:25280 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7w3E-00055O-62; Fri, 05 Feb 2021 03:01:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8N5Ib45bKixh7K3AtcyaZdFuJaXGhmVvzLpKDNCa5aKeTHGAjEa6sGhm5z8bOmWsF5Fw0SmBAQRHKyy1YJKKmy66C0WB0Kazdivhu2rE27tnDJiQqcboQuy/8DC6xYclMdkwkM5KvO7Gh1zgRqWkM5KafDctQloZ1y6blo1RPwpMyGelBxBJtuteiz9XnsD7DLwgV5s6uCJy0pvqdUgj2+ut0G9h7eLR1FRfaUSSbuZJVjXAMP3HJkN1zDDuvfDlT9EozMQkIukaNVCSsVd2lZ+dZVBRz7hXKiQjameNuY3XGmCrWm/pOgrdfKJtAefZsUBGN2JAlJ5tSqRwg92FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqWwzW1vhYMKDuSR8NMgJ176gkCvKKbVnYlGmsWSFw8=;
 b=AGNmRk38HODc1TaZapXls4x46S0hgc6TfWQiCneM7qNI8+768flKUtlsmXYA6xgJpykwjmwDC8SV12lz5cKqqE2zKCKXxhcWNPEmqjx4Tx/d8mp+pbEkKj4Ep/+rDISkqpor5p6tjNeZFakAQgwBD63w7erfwEun5L7BOvXlxiEO5uxvW2CKtM6nso7H+n+Vhu96vmPEq0KyR0Fa4EF2DqwzOOGXKmKs1njaijtDW0sb3FUQxZQObnIysH7Hp1Ur/YJJIKKrgOF/CKVSHbfFU5Z5vphRJHa21m5vwHDQ/KCuIsJNLyP+1QUVmOlB3dwgM1Df/SaWkI5ktkAKgMuzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqWwzW1vhYMKDuSR8NMgJ176gkCvKKbVnYlGmsWSFw8=;
 b=kjQDEZKkXAunrDkguh6uhJGuVp7BZpja0vOxDafWg44SgwDt/pjzPjVp0IAmmmsxyBMpMa7tJfMH/+fVAZr3cazyLMtK/tyFniPEVPOXVp4+Hdc9pYj063aMout+7L49voqqUPmZn8u7vK5buTMxHpERjz5XwU3VxL4ymdh6UpU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 08:01:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 08:01:07 +0000
Subject: Re: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <cover.1612356810.git.pkrempa@redhat.com>
 <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f6347d66-1cdb-7c96-2230-35f4a48b42be@virtuozzo.com>
Date: Fri, 5 Feb 2021 11:01:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR10CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 08:01:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 184328a5-2434-4f59-7797-08d8c9ac316d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32216AD590EFE8FB5CEA2F48C1B29@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfDahTgutC8cEVkobr7IwAPD5kz+ajaOElh79InNjjywGhUjvVTxuMa3agnVeGiY8EwZjJEcUfSu+9DqIZ0I4i/Rw7mdobA/PRrMGfMkGM3TgLJOttxKsQZTXE6IEAFhegvuCF9xKeAoabtNmybUvDGNnozgebwSWmZKXQEinn0AehxXcXbdy3cw1s9lIR+/Fas8RtFKb41pRB3JikB7UPQzajbSv4z1HfJ14U1wkCdituO1j6wOpgI+rDTgFeK5VpQ0o2VeIKrNbHPoqF5AMbhSETS0wvu8cjS4MmTK7w157GlMdYTwKRYP9uK1vemb0Mg4+7L4ZQOp4MoQb4oTwvEAaS4y93vms2l9tvOr4Z7p/vXn9hmlUNwp3NSF4drCXGN3QrRGRUlBqBFDqJnxpskeuUkBjlwfqUzcKycxrD6ABxKMruqT4h4kjFZ36zm83sNyThok/1pZGZClH7ZfVgIXephbX7xwT7kYE3brom+JPP6SwoMzZlCKdohKGFLV4EvSKoBiGr+5f0p0fgM2gAWxKOvO6nlBb14b+D5qZdJoiBuMJRk65mE+qikAJ8c8/9x/zhGF6V9iKfAZGgkm+Wj02vFiUT/kFVzQGqBq6UISbkv6CaZcKmBT71sihlAB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(36756003)(956004)(2616005)(16526019)(186003)(8936002)(83380400001)(4326008)(86362001)(8676002)(66556008)(66946007)(31696002)(66476007)(5660300002)(31686004)(26005)(54906003)(16576012)(52116002)(316002)(478600001)(2906002)(6486002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3pNSWZPbEZUK3IyVzNtOFZ0RnIrMHM3UXhmSGp4QUxjbE10bDBwZU14eVR3?=
 =?utf-8?B?V3dXeXBVbGd6MUxWNzgzOW9xWFhNNm1XSjR4SWRjMTFDNzJYMXpvYUQxeG1x?=
 =?utf-8?B?anVXemJTM0NMbUtxTDBmcm4wbGhQWXBUbmJIakFlVTB6cDRlOTFTZHV0MGxG?=
 =?utf-8?B?STR2aXRNMmNaVDlkT1FBZnhOUHFZdEVYQlgvaFdxdy9ocmo5aEFTYjdaakNF?=
 =?utf-8?B?NUl0eHkvTlhGZjZ0QjQ2RkUvcmJnbEhCTk9MUEdHa2NZdXEvV3hneEg0cmRr?=
 =?utf-8?B?NFZRSTRHblZUaVZxM3RRSCtaMW92TVh6Si9nVlltQWVONER4cXE1dk00WDN3?=
 =?utf-8?B?V25HSWt5aXUwY3licVNPS2ZSVTVwU2hMUXFmUGRFd3JzdEVReTVNdzB2Q1Jj?=
 =?utf-8?B?SWp6VG43K1UrS3l6WFJzYzR6ZWZYZGFKa2lUZDdCbWlYV05MRVp0RTlLOGlo?=
 =?utf-8?B?SUc0Vm9zVE5UNlhXMyt4QjdaUDVZbjVPOHBIT3dlRXU1QjRRanBHK3JKcDlj?=
 =?utf-8?B?MFJ3S1UyQU5xbzVHRForb0x1a0p5WTlvYUx2VGpaRzNrOENpdndraFFpY2tX?=
 =?utf-8?B?ZkFpYkJ3MmZ2cCtORUlnSDFURWFiMUZacmZkaGtxRjgzdndIZkpVSkJoODh2?=
 =?utf-8?B?T2d4RlJNWkN6S1JYc01HQkxWalJXNkRuRFgvS29Pc2FiZUtOTC9MRVkweEtL?=
 =?utf-8?B?L2ZWUkRmUWxQL3NWem1vM0R3UDAzaXhycS9HWFN5eThTV2xYNDltZ3RIOFhw?=
 =?utf-8?B?SXNGZnAwcEozMzNybFhob2psUXROMFVvQVl2MXYzdkh4L2tlKzRmMlk4ajhr?=
 =?utf-8?B?WXZnblVYOXNUWERPelI5OWRKcHJJbXpOK0phQVVMZkVSMnFML0FQVU4vS0c0?=
 =?utf-8?B?QkZDaU5LOS9JWjZtQVZaZXJoK3RkS3VSM0p4dWQwUkZzczgzcTRuTXVMbklx?=
 =?utf-8?B?eTlxWVZjaGk3b1FKdXZmRTlFL0NDbHBLVjQzTTBoMU52RUlYRzI4N0xMZE5X?=
 =?utf-8?B?V2ZFWm5Hc3FLNlBPWmdsdzhIaXlxTmgvbnk2UU1tcjNSQWRrTHVreURXaE5L?=
 =?utf-8?B?aHFlTStVbjBXWnZGZkwvend2NkRDczh1a1laQjM0MUprZVBwUmc0V0dTKzdS?=
 =?utf-8?B?THJQUm0yajhKT200SG9hQ3JQUGY3ZjhhRktobFYwTUN5bzBNYXB1UlcvTHVF?=
 =?utf-8?B?RjU5eG5LcnVIdGszWTgxcU96RWhBWGhFbEkwbGJ0UGxveGFhT1phcVRFaTRk?=
 =?utf-8?B?SlNlTm5UeW1WQ2RIYWVDOU8ySSt5bnVTVGxBamEyL1FFOFFtL24yMFI0cGVn?=
 =?utf-8?B?Sm5CaDVSOHl5RnlYQitYbW1vZlprTmRlUVVYM0ZQanlraklnOWNqNDZERWo3?=
 =?utf-8?B?YnYwUG1hMFZzV2RUcG5OenVQTnBPcWM0dkJXcUlURjAyaXAxaWtPNjFQVHFr?=
 =?utf-8?B?M200UXE5YWZrQnVlMC9zdjQzZnZkTGlnVG1mcUJFNzdPNTJEdmp3ZmlQb24x?=
 =?utf-8?B?aWt4Z240aGdvcVhqK3RyQ1pWWnNJNjBBeUc0VmRQMGV3TFdXTEFnVkJzb2pr?=
 =?utf-8?B?ZTRPcVJrZngxSTU0UGVtS2VWRTVPM253YVpxQXpTOGpiaDRHUC9IWTMvbXBv?=
 =?utf-8?B?UGY4Tm14ZUdzSVlwaVdQbGxYbHlZUnRqVjFQKytmLzNYTFMxUWN4RytCUkZE?=
 =?utf-8?B?VExnNG1raTU4cmMveGZDUmxhdThxSnk1VTJUeUIwbU9Ua2tRakN1SjB6Rm9r?=
 =?utf-8?Q?C2O0g0hhBStE54Hh7Mqled0H6RLKqNXYWpqywd8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184328a5-2434-4f59-7797-08d8c9ac316d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:01:07.5124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOrJCEw7SklJuwM8EhIaRqFVsnHUF3cRwwXFJCB3Rq1AX39NKloLplXrY3sqFc4S7FncF9X924BfPZr42aeivFho9nZlANKt9PmFA9KKrO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.21.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

03.02.2021 16:00, Peter Krempa wrote:
> Bitmap's source persistence is transported over the migration stream and
> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating
> into a squashed image) but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This adds 'dest-persistent' optional property to
> 'BitmapMigrationBitmapAlias' which when present overrides the bitmap
> presence state from the source.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>   migration/block-dirty-bitmap.c | 30 +++++++++++++++++++++++++++++-
>   qapi/migration.json            |  7 ++++++-
>   2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index b0403dd00c..1876c94c45 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -149,6 +149,9 @@ typedef struct DBMLoadState {
> 
>       bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
> 
> +    bool has_dest_persistent;
> +    bool dest_persistent;
> +
>       /*
>        * cancelled
>        * Incoming migration is cancelled for some reason. That means that we
> @@ -171,6 +174,10 @@ static DBMState dbm_state;
> 
>   typedef struct AliasMapInnerBitmap {
>       char *string;
> +
> +    /* for destination's properties setting bitmap state */
> +    bool has_dest_persistent;
> +    bool dest_persistent;
>   } AliasMapInnerBitmap;
> 
>   static void free_alias_map_inner_bitmap(void *amin_ptr)
> @@ -289,6 +296,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>           for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
>               const BitmapMigrationBitmapAlias *bmba = bmbal->value;
>               const char *bmap_map_from, *bmap_map_to;
> +            bool bmap_has_dest_persistent = false;
> +            bool bmap_dest_persistent = false;
>               AliasMapInnerBitmap *bmap_inner;
> 
>               if (strlen(bmba->alias) > UINT8_MAX) {
> @@ -317,6 +326,9 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>                   bmap_map_from = bmba->alias;
>                   bmap_map_to = bmba->name;
> 
> +                bmap_has_dest_persistent = bmba->has_dest_persistent;
> +                bmap_dest_persistent = bmba->dest_persistent;
> +
>                   if (g_hash_table_contains(bitmaps_map, bmba->alias)) {
>                       error_setg(errp, "The bitmap alias '%s'/'%s' is used twice",
>                                  bmna->alias, bmba->alias);
> @@ -326,6 +338,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
> 
>               bmap_inner = g_new0(AliasMapInnerBitmap, 1);
>               bmap_inner->string = g_strdup(bmap_map_to);
> +            bmap_inner->has_dest_persistent = bmap_has_dest_persistent;
> +            bmap_inner->dest_persistent = bmap_dest_persistent;
> 
>               g_hash_table_insert(bitmaps_map,
>                                   g_strdup(bmap_map_from), bmap_inner);
> @@ -798,6 +812,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
>       uint32_t granularity = qemu_get_be32(f);
>       uint8_t flags = qemu_get_byte(f);
>       LoadBitmapState *b;
> +    bool persistent;
> 
>       if (s->cancelled) {
>           return 0;
> @@ -822,7 +837,13 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
>           return -EINVAL;
>       }
> 
> -    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
> +    if (s->has_dest_persistent) {
> +        persistent = s->dest_persistent;
> +    } else {
> +        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +    }
> +
> +    if (persistent) {
>           bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
>       }
> 
> @@ -1087,6 +1108,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
> 
>       if (s->flags & DIRTY_BITMAP_MIG_FLAG_BITMAP_NAME) {
>           const char *bitmap_name;
> +        bool bitmap_has_dest_persistent = false;
> +        bool bitmap_dest_persistent = false;
> 
>           if (!qemu_get_counted_string(f, s->bitmap_alias)) {
>               error_report("Unable to read bitmap alias string");
> @@ -1107,12 +1130,17 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
>               }
> 
>               bitmap_name = bmap_inner->string;
> +            bitmap_has_dest_persistent = bmap_inner->has_dest_persistent;
> +            bitmap_dest_persistent = bmap_inner->dest_persistent;
>           }
> 
>           if (!s->cancelled) {
>               g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name));
>               s->bitmap = bdrv_find_dirty_bitmap(s->bs, s->bitmap_name);
> 
> +            s->has_dest_persistent = bitmap_has_dest_persistent;
> +            s->dest_persistent = bitmap_dest_persistent;
> +
>               /*
>                * bitmap may be NULL here, it wouldn't be an error if it is the
>                * first occurrence of the bitmap
> diff --git a/qapi/migration.json b/qapi/migration.json
> index d1d9632c2a..32e64dbce6 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -533,12 +533,17 @@
>   # @alias: An alias name for migration (for example the bitmap name on
>   #         the opposite site).
>   #
> +# @dest-persistent: If populated set the bitmap will be turned persistent
> +#                   or transient depending on this parameter.
> +#                   (since 6.0)
> +#

Thinking of future: will we want modify other bitmap properties "in-flight"? enabled? maybe granularity? Then we'll add additional dest-* properties. Not bad, but probably better to make it nested, like

transform: { persistent: bool }

So, than we'll can add other properties:

transform: { *persistent: bool, *enable: bool, *granularity: bool }

Also, in code I see you just ignore dest-persistent if it is set on source. I think we should either error-out, or support it. Why not to allow setup property change on source alias-mapping? (and that's why I suggest "transform" which a bit more generic for using both on source and target)


Also, I don't like duplication of AliasMapInnerBitmap in DBMLoadState. Could we instead just add a pointer to bmap_inner, like this:

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 1876c94c45..93ae76734e 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -138,6 +138,14 @@ typedef struct LoadBitmapState {
      bool enabled;
  } LoadBitmapState;
  
+typedef struct AliasMapInnerBitmap {
+    char *string;
+
+    /* for destination's properties setting bitmap state */
+    bool has_dest_persistent;
+    bool dest_persistent;
+} AliasMapInnerBitmap;
+
  /* State of the dirty bitmap migration (DBM) during load process */
  typedef struct DBMLoadState {
      uint32_t flags;
@@ -149,8 +157,7 @@ typedef struct DBMLoadState {
  
      bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
  
-    bool has_dest_persistent;
-    bool dest_persistent;
+    AliasMapInnerBitmap *bmap_inner;
  
      /*
       * cancelled
@@ -172,14 +179,6 @@ typedef struct DBMState {
  
  static DBMState dbm_state;
  
-typedef struct AliasMapInnerBitmap {
-    char *string;
-
-    /* for destination's properties setting bitmap state */
-    bool has_dest_persistent;
-    bool dest_persistent;
-} AliasMapInnerBitmap;
-
  static void free_alias_map_inner_bitmap(void *amin_ptr)
  {
      AliasMapInnerBitmap *amin = amin_ptr;
@@ -837,8 +836,8 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
          return -EINVAL;
      }
  
-    if (s->has_dest_persistent) {
-        persistent = s->dest_persistent;
+    if (s->bmap_inner && s->bmap_inner->has_dest_persistent) {
+        persistent = s->bmap_inner->dest_persistent;
      } else {
          persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
      }
@@ -1108,8 +1107,6 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
  
      if (s->flags & DIRTY_BITMAP_MIG_FLAG_BITMAP_NAME) {
          const char *bitmap_name;
-        bool bitmap_has_dest_persistent = false;
-        bool bitmap_dest_persistent = false;
  
          if (!qemu_get_counted_string(f, s->bitmap_alias)) {
              error_report("Unable to read bitmap alias string");
@@ -1130,17 +1127,13 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
              }
  
              bitmap_name = bmap_inner->string;
-            bitmap_has_dest_persistent = bmap_inner->has_dest_persistent;
-            bitmap_dest_persistent = bmap_inner->dest_persistent;
+            s->bmap_inner = bmap_inner;
          }
  
          if (!s->cancelled) {
              g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name));
              s->bitmap = bdrv_find_dirty_bitmap(s->bs, s->bitmap_name);
  
-            s->has_dest_persistent = bitmap_has_dest_persistent;
-            s->dest_persistent = bitmap_dest_persistent;
-
              /*
               * bitmap may be NULL here, it wouldn't be an error if it is the
               * first occurrence of the bitmap


-- 
Best regards,
Vladimir

