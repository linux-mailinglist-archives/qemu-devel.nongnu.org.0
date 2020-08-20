Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0024AC8D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 03:18:53 +0200 (CEST)
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8ZEC-0005SZ-JV
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 21:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8ZDE-0004wc-S4
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 21:17:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59539
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8ZDB-0000rX-SD
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 21:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597886269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XH1IReQjdNkvPwaBkhQNHJksVV/Br90uUBVvpUD4kwI=;
 b=AY2aecKRKJxe7Kz9etWLZ/d/xwxXa7HdNUE3UZFddNwt3Z0o7178I68yBPsQBmFxG94mjn
 cuwcvO9x9rURvYBrTYI2/+GVpnw9I3nBGWcFVXwjgku9qbCgsQncZCwXdxj98CPek8yMQL
 mxfw41Mu1BPxoGepjFAd0ueF4KnQTgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-IubC1JZrM4mpkgGo8NJ3bQ-1; Wed, 19 Aug 2020 21:17:45 -0400
X-MC-Unique: IubC1JZrM4mpkgGo8NJ3bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7005BD6383;
 Thu, 20 Aug 2020 01:17:44 +0000 (UTC)
Received: from [10.3.112.136] (ovpn-112-136.phx2.redhat.com [10.3.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD2E8600DD;
 Thu, 20 Aug 2020 01:17:43 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] migration: Add block-bitmap-mapping parameter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200818133240.195840-1-mreitz@redhat.com>
 <20200818133240.195840-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1c7e187c-fef5-9515-2b4a-f8a32e763ce8@redhat.com>
Date: Wed, 19 Aug 2020 20:17:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818133240.195840-2-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:32 AM, Max Reitz wrote:
> This migration parameter allows mapping block node names and bitmap
> names to aliases for the purpose of block dirty bitmap migration.
> 
> This way, management tools can use different node and bitmap names on
> the source and destination and pass the mapping of how bitmaps are to be
> transferred to qemu (on the source, the destination, or even both with
> arbitrary aliases in the migration stream).
> 
> While touching this code, fix a bug where bitmap names longer than 255
> bytes would fail an assertion in qemu_put_counted_string().
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

> +##
> +# @BitmapMigrationNodeAlias:
> +#
> +# Maps a block node name and the bitmaps it has to aliases for dirty
> +# bitmap migration.
> +#
> +# @node-name: A block node name.
> +#
> +# @alias: An alias block node name for migration (for example the
> +#         node name on the opposite site).
> +#
> +# @bitmaps: Mappings for the bitmaps on this node.
> +#
> +# Since: 5.2
> +##
> +{ 'struct': 'BitmapMigrationNodeAlias',
> +  'data': {
> +      'node-name': 'str',
> +      'alias': 'str',
> +      'bitmaps': [ 'BitmapMigrationBitmapAlias' ]
> +  } }

Possible change: should 'alias' be optional (if absent, it defaults to 
'node-name')?  But that can be done on top, if we like it.


> +static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
> +                                       bool name_to_alias,
> +                                       Error **errp)
> +{
> +    GHashTable *alias_map;
> +    size_t max_node_name_len =
> +        sizeof(((BlockDriverState *)NULL)->node_name) - 1;

Looks a bit nicer as = sizeof_field(BlockDriverState, node_name) - 1.

> +
> +    alias_map = g_hash_table_new_full(g_str_hash, g_str_equal,
> +                                      g_free, free_alias_map_inner_node);
> +
> +    for (; bbm; bbm = bbm->next) {
> +        const BitmapMigrationNodeAlias *bmna = bbm->value;
> +        const BitmapMigrationBitmapAliasList *bmbal;
> +        AliasMapInnerNode *amin;
> +        GHashTable *bitmaps_map;
> +        const char *node_map_from, *node_map_to;
> +
> +        if (!id_wellformed(bmna->alias)) {
> +            error_setg(errp, "The node alias '%s' is not well-formed",
> +                       bmna->alias);
> +            goto fail;
> +        }
> +
> +        if (strlen(bmna->alias) > 255) {

Magic number.  UINT8_MAX seems better (since the limit really is due to 
our migration format limiting to one byte).

...
> +        g_hash_table_insert(alias_map, g_strdup(node_map_from), amin);
> +
> +        for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
> +            const BitmapMigrationBitmapAlias *bmba = bmbal->value;
> +            const char *bmap_map_from, *bmap_map_to;
> +
> +            if (strlen(bmba->alias) > 255) {

and again

> +                error_setg(errp,
> +                           "The bitmap alias '%s' is longer than 255 bytes",
> +                           bmba->alias);
> +                goto fail;
> +            }

Thanks for adding in the length checking since last revision!


> @@ -326,12 +538,29 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
>               return -1;
>           }
>   
> +        if (bitmap_aliases) {
> +            bitmap_alias = g_hash_table_lookup(bitmap_aliases, bitmap_name);
> +            if (!bitmap_alias) {
> +                /* Skip bitmaps with no alias */
> +                continue;
> +            }
> +        } else {
> +            if (strlen(bitmap_name) > 255) {
> +                error_report("Cannot migrate bitmap '%s' on node '%s': "
> +                             "Name is longer than 255 bytes",
> +                             bitmap_name, bs_name);
> +                return -1;

Another one.


Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to make those touchups, and put this on my bitmaps queue for a 
pull request as soon as Paolo's meson stuff stabilizes.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


