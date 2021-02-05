Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52731059F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:13:12 +0100 (CET)
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vIl-0004sO-Qa
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7vAN-0005RQ-M2; Fri, 05 Feb 2021 02:04:31 -0500
Received: from mail-db8eur05on2100.outbound.protection.outlook.com
 ([40.107.20.100]:31616 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7vAJ-0004ZK-9C; Fri, 05 Feb 2021 02:04:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMdWcLdFLPEvc72/Kfyp14ZiJTNI78FF6TeHnS8JdmoFxLJ9yCDxlU2Vgi1X0Eg9+UwFfVc0USY7UubNhFbqPkOIsQnR/bC/Mx+vdy3hc5lD9gc3FDd7PEYwEz5xRvcfaL7UZ8XXQBYFG3QW36ZBNtQJNVdwSBPzO/ZjG9CKjZRujeyHBPkl79QFLInleZo77p3cWl4m5ebSdx3eXKga/lCJ9qcj/epVW8c8crmPAHQRU0y+dbqOEUgQuvcuQr6U2G/22Oyc4RsdVhy3zzAmRs6Ip0Ipjaa2Cm9l9D2upYvyheYZ224xSZYzoPkLqzD1hLtf6y56R245lsNKCaAJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iooVtIfHfbSc21pj5KHdiVQ3NIIq1iafMNc6cI2XFI=;
 b=bJEafNAHuA+HgfcR5XJlzn0AYzHbytYVd2P8qTzH7vCFHHgSmEUZnO6xMelpaG3eaCDYH7jIP0Ln/kQgli1sdRIB7uJUVsc1gLWqMS09wY/PSLit7wYK1hfyxCH08RxxzAnERQmpGPXS4jdgZqPjyTDzq3YWrY3yBq3tN7p+P8fvlHvKEb4WVBZaDCcQXiEJDDuhu/SifocAU4NktfqUIQG6a3wqGQrwLdfKsxIP0Fbmm++ZV/D99KluvdVciFy1jhP3oxI0L7/OPkFUWfJsDWpl+swtsoVT3lqLS1KfuxNhgPZaWu8DRq8sDG8kEwww81z88kAI/Gx9B5M+4OYk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iooVtIfHfbSc21pj5KHdiVQ3NIIq1iafMNc6cI2XFI=;
 b=qSrTbSzndOKzolaOdR7Srrfvq/BbG7uLOm4tXMbi9yKH+qZoqE6C1bIeTQwC0VMWqIyv6Tetf2teIgEyt7JXGDWIL7o0Q3IlDNQwng9vCThkYbQgCa4DTJWfGCRmbKvydJe96LrdgXFW9RHs0f1KlW17OprnUlDJoaufktFsxmE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3543.eurprd08.prod.outlook.com (2603:10a6:20b:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 5 Feb
 2021 07:04:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 07:04:22 +0000
Subject: Re: [PATCH 1/2] migration: dirty-bitmap: Convert alias map inner
 members to a struct
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <cover.1612356810.git.pkrempa@redhat.com>
 <8e40a7337e3b9a0a4f11ee3b0e2f3ae4c76f2dbd.1612356810.git.pkrempa@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0e79af25-dcfe-8084-dfb1-af11c022b649@virtuozzo.com>
Date: Fri, 5 Feb 2021 10:04:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <8e40a7337e3b9a0a4f11ee3b0e2f3ae4c76f2dbd.1612356810.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 07:04:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31a0cbf1-e9b1-488a-a60d-08d8c9a443f2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3543:
X-Microsoft-Antispam-PRVS: <AM6PR08MB35431FE3D8384310B891FA95C1B29@AM6PR08MB3543.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2nMPcTl1NVV3XeU9Hfak2QUFSIGoDUR08dSJJjdQas1XXg4xhMTuVlWx2X+oWQQqOL00eXGsuruFCXIlxI/w3TNLCgqW0ZdmEkJGzKLF14bMZ5aw+iFSLgqJvJGbXk6H72M5A6vZMg7Ju6o+R4BLXyR8SJntENE7qjZCu+povxbD3kx5B02FZ6g03gdK9q4FEwzTnlrQ6e1pPdGNvXhyEDpn7m3esWlb3kWB+G2MA6THem1+WrcJvEVVvMuQlX9dELdI/ZGhGucpw6sEAtH7fvV96DmRE5a2hOlv+2Kr9oyBayjowryqN82kLHtEls9LoDxneqeIcvTacPecxqQ6Xsfl9nv9Gh+1bjdyXds4tLDA2O4KxM3xse/lziJLWeLOMilETMrGPPkr+q4omTTjGmGIF0Zeuz5fAXxPXMGQaX8KuB6RoaRj9RGob0SIO+sTnPgnxZMSaFGXHIbvFyAvKhtq+Jxo5AKoYqN9gzeWW+PKJc+XXx+XoCkxv1b5oFCnEA1naw3ag0+fOSB1lGdKuC+xlqEwDIuhHdrcP+1YY1jfMS5rDybWmw1zS1esP0RdIizfOzBD6Am8B7ERxhd8sWv6sX64w1jb6CMVd98CNv+6hb2nw+VKTwi9kcTRhcL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39840400004)(54906003)(956004)(16576012)(2616005)(316002)(36756003)(83380400001)(26005)(4326008)(52116002)(8936002)(16526019)(86362001)(31696002)(31686004)(66946007)(66556008)(5660300002)(186003)(8676002)(478600001)(6486002)(2906002)(66476007)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WVJvWUQzOXFDbVpBRVNEbVhEQmhab3VQTHNzbFNXMVpMTFo1NVlqdk9SdlhN?=
 =?utf-8?B?RnVEWCtHN2UwNnZHY3c3c1V1TWhjOGg4cDUycSswcVEzenBuK2lranhzRjJW?=
 =?utf-8?B?bkdwSFkvTy9FVXlSTDBSNitBdnBGaEVuek5CZVFZTytoQWJSak0xbk9UaEZW?=
 =?utf-8?B?L2VOaW9xcC92WGpQcTZQUEFOWUZMTmdQL202MlVDMmplc3BHNUlubU9jWVhu?=
 =?utf-8?B?L2pNRWczN3RPanp4SzVNSEhuQk96a2trRE4zSXhWRk9tOVhoWlpLdUwvT3Y1?=
 =?utf-8?B?UmlvTWZlRWd1Qy9WSUVIUlB1SlFpOGpDZGRMOWRlOTV6MDNUK0ZxVnhSWW5h?=
 =?utf-8?B?MmlmVGdaMmxhbDlYY3VxSVhMQWZZUW1TejgxUGtNbnlGTEo4VzJFL1p4NlFx?=
 =?utf-8?B?aFoyNnBUd1Z4K2Vja05IU1hWV0lGUTBGK3FneTREWWJVKzUxOUZGZDRHUFhl?=
 =?utf-8?B?Z0tBcDdOdGxVbE5YSUIvQldVeUwrQ1ByLzRBU0xUREhKWWhjUGF3akRUbWFp?=
 =?utf-8?B?Yy85YTl3M3libnJRaXhQelJnUXB4Ym5GV1d1dVh2eVRUQW9WMVRUb2dSNXhX?=
 =?utf-8?B?MHFGMjJDVmJwM1BsU3FoY2dBdnlIdVNPZDZ1SWxTL21wUmF6NUFpb3FyTlM5?=
 =?utf-8?B?ZCtDNFBhZWlOKzdXVTAzVEhzakpJOTVMOFVyYkpnNUJ3ck16K2lkVGNoYzlU?=
 =?utf-8?B?aldpcnJ6aGVQa3o1S1ZmVVhqT0RaVDhiNWUxbXZRQ0NYeXNtNXk0MEdYQUVW?=
 =?utf-8?B?ZG41WXFkVVRRcTZuRHE4ZXJkQWk4ZXlXWDVaZjQxQXRjZVdDY2dwVzZOUHI1?=
 =?utf-8?B?Sk0rQ2NDa1l2N1FFZkdsK2l0VlR4b0ZLSDF3d1V4VzRsWVBBVXZRZVpVanJq?=
 =?utf-8?B?WjA2ZWxqNTY5SHpjNVF3c2JsdVEvMkxEdWdtbElxWENod1o2MnA1Wm5wOG43?=
 =?utf-8?B?RnY5UVgzZ215dnRoWEZLOEoycDF3djV4Y3UvaXd0WUJxWW1aN3FraE5zUGZi?=
 =?utf-8?B?QkZRQlN6SEt4ejdtVGdWTXZka0RYR1VmSThKdHlWUGQrbFVGZzhiMVV4aWZ0?=
 =?utf-8?B?R3l1c1NiUE1RS2d3a1hLS3Y4akUzcjdXREN3NGQ3S0h2dmJ2R3o1dlk2Wnh6?=
 =?utf-8?B?VnlHd0VvZlNYaWpCSWpkcGo5dHczNkg0SEFDVXFTNWFUcUxjODU3WGRpTDdG?=
 =?utf-8?B?bUxIQkcwY3NmNkxGK21RTkw0bUZSZjNGOWlEbDVNODgxZmFQQiszSWtnZE14?=
 =?utf-8?B?VjNKbnlVaUtZN01jQ2FxOUViZzIxOXVjTU8zUTh3MXF1eWo2QzR1T1NKTUw2?=
 =?utf-8?B?V25UaTFraDNrSVpBOGFUWkRkaFhBWldVTkl3NGx4dnNIZjNTOHAyZzBVb05a?=
 =?utf-8?B?MWVTQWRNRTBiMzU5RG5kelN3RGdNcSs5MCt1emUrUEFyZzJpbXRPb2U0bnhT?=
 =?utf-8?B?THZGYnoyaldTS0h4b3FyeDNmZjY4eHByTzNJNVFuQmpiZm9aVlZKWmo2OXQy?=
 =?utf-8?B?dlRoNFprOUpwSkNPRk1pbkQ3UDlPSWdHU0x1bHFYQnhHTkg0VlF5L0t0ZElh?=
 =?utf-8?B?bkNsdWF1Vkw4Q2V4TUJQYkxiUzJVZDBCd21XSjR5ajcwckZ2NDB6VFNaQm01?=
 =?utf-8?B?UTNaeW1pTHlUUjlxNzhzNkoyK0hCUS9lSVNIaHVzSksxTTB3TlBxUVZOeWVJ?=
 =?utf-8?B?V3VyTElNVC9XUm04S1JReGpSQlVLalVjLzNjMm96T3BrODFIVU1YOG5SN3hB?=
 =?utf-8?Q?+qgpTkVtcck41P4kSw9OH0CSYh7Byfynf29AYJA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a0cbf1-e9b1-488a-a60d-08d8c9a443f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:04:22.7796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfTdZqZEIjCi3SzEgQviMBC7WNHdEyP7VsrzEiooUVAI1bW2vEE8yCVLP56r3QYLmbyZQiA6a6v0s5hUGpZK4mBeqYTHfbnlaUZnYS6aVUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3543
Received-SPF: pass client-ip=40.107.20.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

03.02.2021 15:59, Peter Krempa wrote:
> Currently the alias mapping hash stores just strings of the target
> objects internally. In further patches we'll be adding another member
> which will need to be stored in the map so convert the members to a
> struct.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>   migration/block-dirty-bitmap.c | 37 ++++++++++++++++++++++++++++------
>   1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index c61d382be8..b0403dd00c 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -169,6 +169,18 @@ typedef struct DBMState {
> 
>   static DBMState dbm_state;
> 
> +typedef struct AliasMapInnerBitmap {
> +    char *string;
> +} AliasMapInnerBitmap;
> +
> +static void free_alias_map_inner_bitmap(void *amin_ptr)
> +{
> +    AliasMapInnerBitmap *amin = amin_ptr;
> +
> +    g_free(amin->string);
> +    g_free(amin);
> +}
> +
>   /* For hash tables that map node/bitmap names to aliases */
>   typedef struct AliasMapInnerNode {
>       char *string;
> @@ -264,7 +276,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>           }
> 
>           bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
> -                                            g_free, g_free);
> +                                            g_free, free_alias_map_inner_bitmap);

over-80 line

> 
>           amin = g_new(AliasMapInnerNode, 1);
>           *amin = (AliasMapInnerNode){
> @@ -277,6 +289,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>           for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
>               const BitmapMigrationBitmapAlias *bmba = bmbal->value;
>               const char *bmap_map_from, *bmap_map_to;
> +            AliasMapInnerBitmap *bmap_inner;
> 
>               if (strlen(bmba->alias) > UINT8_MAX) {
>                   error_setg(errp,
> @@ -311,8 +324,11 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>                   }
>               }
> 
> +            bmap_inner = g_new0(AliasMapInnerBitmap, 1);
> +            bmap_inner->string = g_strdup(bmap_map_to);
> +
>               g_hash_table_insert(bitmaps_map,
> -                                g_strdup(bmap_map_from), g_strdup(bmap_map_to));
> +                                g_strdup(bmap_map_from), bmap_inner);
>           }
>       }
> 
> @@ -538,11 +554,16 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
>           }
> 
>           if (bitmap_aliases) {
> -            bitmap_alias = g_hash_table_lookup(bitmap_aliases, bitmap_name);
> -            if (!bitmap_alias) {
> +            AliasMapInnerBitmap *bmap_inner;
> +
> +            bmap_inner = g_hash_table_lookup(bitmap_aliases, bitmap_name);
> +

I'd drop this line, you are not consistent on it with next hunk anyway)

> +            if (!bmap_inner) {
>                   /* Skip bitmaps with no alias */
>                   continue;
>               }
> +
> +            bitmap_alias = bmap_inner->string;
>           } else {
>               if (strlen(bitmap_name) > UINT8_MAX) {
>                   error_report("Cannot migrate bitmap '%s' on node '%s': "
> @@ -1074,14 +1095,18 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
> 
>           bitmap_name = s->bitmap_alias;
>           if (!s->cancelled && bitmap_alias_map) {
> -            bitmap_name = g_hash_table_lookup(bitmap_alias_map,
> +            AliasMapInnerBitmap *bmap_inner;
> +
> +            bmap_inner = g_hash_table_lookup(bitmap_alias_map,
>                                                 s->bitmap_alias);

indentation

> -            if (!bitmap_name) {
> +            if (!bmap_inner) {
>                   error_report("Error: Unknown bitmap alias '%s' on node "
>                                "'%s' (alias '%s')", s->bitmap_alias,
>                                s->bs->node_name, s->node_alias);
>                   cancel_incoming_locked(s);
>               }
> +
> +            bitmap_name = bmap_inner->string;
>           }
> 
>           if (!s->cancelled) {
> 

Looks OK for me (I'm OK with Eric's suggestion too):
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

suggest style cleanup:

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index b0403dd00c..577e32bf75 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -275,8 +275,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
              node_map_to = bmna->node_name;
          }
  
-        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
-                                            g_free, free_alias_map_inner_bitmap);
+        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            free_alias_map_inner_bitmap);
  
          amin = g_new(AliasMapInnerNode, 1);
          *amin = (AliasMapInnerNode){
@@ -557,7 +557,6 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
              AliasMapInnerBitmap *bmap_inner;
  
              bmap_inner = g_hash_table_lookup(bitmap_aliases, bitmap_name);
-
              if (!bmap_inner) {
                  /* Skip bitmaps with no alias */
                  continue;
@@ -1097,8 +1096,7 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
          if (!s->cancelled && bitmap_alias_map) {
              AliasMapInnerBitmap *bmap_inner;
  
-            bmap_inner = g_hash_table_lookup(bitmap_alias_map,
-                                              s->bitmap_alias);
+            bmap_inner = g_hash_table_lookup(bitmap_alias_map, s->bitmap_alias);
              if (!bmap_inner) {
                  error_report("Error: Unknown bitmap alias '%s' on node "
                               "'%s' (alias '%s')", s->bitmap_alias,



-- 
Best regards,
Vladimir

