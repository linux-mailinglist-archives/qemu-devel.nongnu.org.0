Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0531A4B6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:48:28 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdUR-000895-SD
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdKi-0007u2-NL
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdKc-00032E-Dl
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613155096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pphjmNVr6ShPhAMOv48PeNSccGT5n9EHOUIS15nUs8w=;
 b=cM75ZX1DUwCb+hcQJ65AokzqsxpZzXYzUj2HMMfvKxrTyH8D8EkgjwzlPaqyUSnvVpmvch
 afUB+gFN7wTMqfKj8DnrbcBYc/b8dj3FdWvj5+e6pvNMd4iGzyaZAiJ0qt3Aq7wD0De9zE
 9tQ6FVdFuKlOGLpJRJLlBCD1qUU6x4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-lIMiHWHiNz-Mtum4AlrR8g-1; Fri, 12 Feb 2021 13:38:14 -0500
X-MC-Unique: lIMiHWHiNz-Mtum4AlrR8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A24E0100CCC0;
 Fri, 12 Feb 2021 18:38:12 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD6360C17;
 Fri, 12 Feb 2021 18:38:11 +0000 (UTC)
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1613150869.git.pkrempa@redhat.com>
 <fc5f27e1fe16cb75e08a248c2d938de3997b9bfb.1613150869.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v3 1/3] migration: dirty-bitmap: Convert alias map inner
 members to BitmapMigrationBitmapAlias
Message-ID: <5dd16c1d-bad1-a445-9dd6-ef2167e0c9ad@redhat.com>
Date: Fri, 12 Feb 2021 12:38:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fc5f27e1fe16cb75e08a248c2d938de3997b9bfb.1613150869.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 11:34 AM, Peter Krempa wrote:

Long subject line; if it's okay with you, I'd prefer to use:

migration: dirty-bitmap: Use struct for alias map inner members

> Currently the alias mapping hash stores just strings of the target
> objects internally. In further patches we'll be adding another member
> which will need to be stored in the map so pass a copy of the whole
> BitmapMigrationBitmapAlias QAPI struct into the map.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  migration/block-dirty-bitmap.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> Note that there's a very long line but there doesn't seem to be a
> sensible point where to break it.

In other words, the patchew warning can be ignored if I can't reformat
the line.

> +++ b/migration/block-dirty-bitmap.c
> @@ -75,6 +75,8 @@
>  #include "qemu/id.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-migration.h"
> +#include "qapi/qapi-visit-migration.h"
> +#include "qapi/clone-visitor.h"
>  #include "trace.h"
> 
>  #define CHUNK_SIZE     (1 << 10)
> @@ -263,8 +265,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>              node_map_to = bmna->node_name;
>          }
> 
> -        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
> -                                            g_free, g_free);
> +        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
> +                                            (GDestroyNotify) qapi_free_BitmapMigrationBitmapAlias);

A possible fix: declare a temporary variable of type GDestroyNotify, so
that assigning the variable uses a shorter line, then use that variable
here.

> @@ -312,7 +312,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
>              }
> 
>              g_hash_table_insert(bitmaps_map,
> -                                g_strdup(bmap_map_from), g_strdup(bmap_map_to));
> +                                g_strdup(bmap_map_from),

This line could be wrapped with the previous, now.

Reviewed-by: Eric Blake <eblake@redhat.com>

If you like, I can squash the following in before queuing.


diff --git i/migration/block-dirty-bitmap.c w/migration/block-dirty-bitmap.c
index 0244f9bb1d91..e1840a96d8ee 100644
--- i/migration/block-dirty-bitmap.c
+++ w/migration/block-dirty-bitmap.c
@@ -226,6 +226,7 @@ static GHashTable *construct_alias_map(const
BitmapMigrationNodeAliasList *bbm,
         AliasMapInnerNode *amin;
         GHashTable *bitmaps_map;
         const char *node_map_from, *node_map_to;
+        GDestroyNotify gdn;

         if (!id_wellformed(bmna->alias)) {
             error_setg(errp, "The node alias '%s' is not well-formed",
@@ -265,8 +266,8 @@ static GHashTable *construct_alias_map(const
BitmapMigrationNodeAliasList *bbm,
             node_map_to = bmna->node_name;
         }

-        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
g_free,
-                                            (GDestroyNotify)
qapi_free_BitmapMigrationBitmapAlias);
+        gdn = (GDestroyNotify) qapi_free_BitmapMigrationBitmapAlias;
+        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
g_free, gdn);

         amin = g_new(AliasMapInnerNode, 1);
         *amin = (AliasMapInnerNode){
@@ -311,8 +312,7 @@ static GHashTable *construct_alias_map(const
BitmapMigrationNodeAliasList *bbm,
                 }
             }

-            g_hash_table_insert(bitmaps_map,
-                                g_strdup(bmap_map_from),
+            g_hash_table_insert(bitmaps_map, g_strdup(bmap_map_from),
                                 QAPI_CLONE(BitmapMigrationBitmapAlias,
bmba));
         }
     }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


