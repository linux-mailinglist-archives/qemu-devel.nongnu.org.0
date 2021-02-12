Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BF31A1DB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:40:30 +0100 (CET)
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaYW-0005ha-EQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAaUO-0002fE-Jq
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAaUM-0001N4-QD
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613144169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lTdfyUnAqLYlpSIFUf2V9GdTE4tPK42jSySpA2djqI=;
 b=jVRFO/ZLyUN64SmQHuKgKGIyPcBNH27/88sIa30+03ACusm/P029oGDRR3cwIjEI1z/Q1o
 4MfAVEyrXKeGM8oNRtlls5GVdNTjxHdWLoXjbkhjwFs/JUU/W5trZoR8eANas7Lb5pGH8H
 QO8QzKLGZDZyjTX8WA78fAylQlZJIv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ERA4krDYMAytYSiomy2TSw-1; Fri, 12 Feb 2021 10:36:04 -0500
X-MC-Unique: ERA4krDYMAytYSiomy2TSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA97107ACE4;
 Fri, 12 Feb 2021 15:36:03 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B0810016F5;
 Fri, 12 Feb 2021 15:36:03 +0000 (UTC)
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1612953419.git.pkrempa@redhat.com>
 <e7bdfa1463cbcfc5a9458d98625f8b3dbe55a3b1.1612953419.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistance
Message-ID: <31c6da9d-221a-81f1-3f2d-8da3c8cd096c@redhat.com>
Date: Fri, 12 Feb 2021 09:36:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e7bdfa1463cbcfc5a9458d98625f8b3dbe55a3b1.1612953419.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 10:53 AM, Peter Krempa wrote:
> Bitmap's source persistance is transported over the migration stream and

persistence

> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating
> into a squashed image) but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This patch adds a 'transform' property to the alias map which allows to
> override the persistance of migrated bitmaps both on the source and

persistence

> destination sides.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
> 
> v2:
>  - grammar fixes (Eric)
>  - added 'transform' object to group other possible transformations (Vladimir)
>  - transformation can also be used on source (Vladimir)
>  - put bmap_inner directly into DBMLoadState for deduplication  (Vladimir)

In addition to Vladimir's suggestion to use QAPI_CLONE() and an iotest
addition,

> 
>  migration/block-dirty-bitmap.c | 38 +++++++++++++++++++++++++++-------
>  qapi/migration.json            | 20 +++++++++++++++++-
>  2 files changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index 0169f672df..a05bf74073 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -138,6 +138,13 @@ typedef struct LoadBitmapState {
>      bool enabled;
>  } LoadBitmapState;
> 
> +typedef struct AliasMapInnerBitmap {
> +    char *string;
> +
> +    /* 'transform' properties borrowed from QAPI */
> +    BitmapMigrationBitmapAliasTransform *transform;
> +} AliasMapInnerBitmap;
> +

You moved this typedef up...

>  /* State of the dirty bitmap migration (DBM) during load process */
>  typedef struct DBMLoadState {
>      uint32_t flags;
> @@ -148,6 +155,7 @@ typedef struct DBMLoadState {
>      BdrvDirtyBitmap *bitmap;
> 
>      bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
> +    AliasMapInnerBitmap *bmap_inner;
> 
>      /*
>       * cancelled
> @@ -169,10 +177,6 @@ typedef struct DBMState {
> 
>  static DBMState dbm_state;
> 
> -typedef struct AliasMapInnerBitmap {
> -    char *string;
> -} AliasMapInnerBitmap;
> -

...from here, although it was just added here in patch 1.  Why not just
declare it up there in the first place in patch 1 to minimize the churn?


> +++ b/qapi/migration.json
> @@ -536,6 +536,20 @@
>    'data': [ 'none', 'zlib',
>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
> +##
> +# @BitmapMigrationBitmapAliasTransform:
> +#
> +# @persistent: If present, the bitmap will be turned persistent

s/turned/made/ sounds a little nicer, although what you have wasn't wrong.

> +#              or transient depending on this parameter.
> +#              (since 6.0)

You don't need a '(since 6.0)' tag on the member, since...

> +#
> +# Since: 6.0

...the entire struct was introduced at the same time.

> +##
> +{ 'struct': 'BitmapMigrationBitmapAliasTransform',
> +  'data': {
> +      '*persistent': 'bool'
> +  } }
> +
>  ##
>  # @BitmapMigrationBitmapAlias:
>  #
> @@ -544,12 +558,16 @@
>  # @alias: An alias name for migration (for example the bitmap name on
>  #         the opposite site).
>  #
> +# @transform: Allows to modify properties of the migrated bitmap.
> +#             (since 6.0)
> +#

whereas this member tag is correct.

>  # Since: 5.2
>  ##
>  { 'struct': 'BitmapMigrationBitmapAlias',
>    'data': {
>        'name': 'str',
> -      'alias': 'str'
> +      'alias': 'str',
> +      '*transform': 'BitmapMigrationBitmapAliasTransform'
>    } }
> 
>  ##
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


