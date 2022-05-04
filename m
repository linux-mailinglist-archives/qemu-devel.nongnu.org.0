Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC37519A18
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:41:26 +0200 (CEST)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAZY-0002xr-53
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmAUu-0000qe-Bf
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmAUp-0001xp-Au
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651653389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nebev3lmKWif61iSR/PTMae1U2KbaimYrAgt7HGMII=;
 b=C7LNk9HpJ3REtzDwQweOc0oC2YB8CPcr7hsZhRVsf1sQBb3ajcycchX+WSXnk6NMn+iGGn
 k3bNLcshnH+kpXjZcSCoIuaJSjRpAe8AAPuNXfRlBCcA+5M9aDd78Xueecd+o/ogd86+zy
 ulSoiTNUP7Yl6DzHZ/KkrSdNNj+EZbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-XxiDTrSZPAOmG4SGiYeP3w-1; Wed, 04 May 2022 04:36:24 -0400
X-MC-Unique: XxiDTrSZPAOmG4SGiYeP3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F0991C06EC4;
 Wed,  4 May 2022 08:36:24 +0000 (UTC)
Received: from redhat.com (dhcp-192-180.str.redhat.com [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71D89432717;
 Wed,  4 May 2022 08:36:23 +0000 (UTC)
Date: Wed, 4 May 2022 10:36:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/4] block: Add protocol-specific image info
Message-ID: <YnI7Bt3bVzUpBzVt@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-3-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 03.05.2022 um 16:55 hat Hanna Reitz geschrieben:
> The ImageInfo object currently only contains (optional) format-specific
> image information.  However, perhaps the protocol node can provide some
> additional information, so add a new field presenting it.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  qapi/block-core.json |  6 +++++-
>  block/qapi.c         | 19 +++++++++++++++++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index beeb91952a..e7d6c2e0cc 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -236,6 +236,9 @@
>  # @format-specific: structure supplying additional format-specific
>  #                   information (since 1.7)
>  #
> +# @protocol-specific: structure supplying additional protocol-specific
> +#                     information (since 7.1)
> +#
>  # Since: 1.3
>  #
>  ##
> @@ -246,7 +249,8 @@
>             '*backing-filename': 'str', '*full-backing-filename': 'str',
>             '*backing-filename-format': 'str', '*snapshots': ['SnapshotInfo'],
>             '*backing-image': 'ImageInfo',
> -           '*format-specific': 'ImageInfoSpecific' } }
> +           '*format-specific': 'ImageInfoSpecific',
> +           '*protocol-specific': 'ImageInfoSpecific' } }

I'm not a fan of this one. It solves the problem for exactly one special
case (even if admittedly a common one) and leaves everything else as it
is. It is unclear what it produces in configurations that aren't the
simple one format node on top of one protocol node layout.

I would rather interpret 'format-specific' as 'driver-specific' and make
the ImageInfo for any child node accessible.

With rbd we already interpret it like a generic driver thing that is not
just for formats that because it implements .bdrv_get_specific_info even
though we didn't have a 'protocol-specific' yet.

Making other nodes has precedence, too. 'backing-image' is even in the
context of this hunk. VMDK exposes its extents the same way. So maybe
what we really want is a 'children' list with the ImageInfo of every
child node. And then qemu-img could go through all children and print
headings like "Driver specific information for file (#block123)". Then
filters like blkdebug could add their information and it would be
printed, too.

>  ##
>  # @ImageCheck:
> diff --git a/block/qapi.c b/block/qapi.c
> index 51202b470a..293983cf82 100644
> --- a/block/qapi.c
> +++ b/block/qapi.c
> @@ -262,6 +262,7 @@ void bdrv_query_image_info(BlockDriverState *bs,
>      int64_t size;
>      const char *backing_filename;
>      BlockDriverInfo bdi;
> +    BlockDriverState *protocol_bs;
>      int ret;
>      Error *err = NULL;
>      ImageInfo *info;
> @@ -303,6 +304,24 @@ void bdrv_query_image_info(BlockDriverState *bs,
>      }
>      info->has_format_specific = info->format_specific != NULL;
>  
> +    /* Try to look for an unambiguous protocol node */
> +    protocol_bs = bs;
> +    while (protocol_bs && !QLIST_EMPTY(&protocol_bs->children)) {
> +        protocol_bs = bdrv_primary_bs(protocol_bs);
> +    }

If bs is already a leaf node, this duplicates the information, which
looks weird:

    $ build/qemu-img info -f file ~/tmp/test.raw
    image: /home/kwolf/tmp/test.raw
    file format: file
    virtual size: 10 GiB (10737418240 bytes)
    disk size: 7.63 GiB
    Format specific information:
        extent size: 1048576
    Protocol specific information:
        extent size: 1048576

>
> +    if (protocol_bs) {
> +        /* Assert that this is a protocol node */
> +        assert(QLIST_EMPTY(&protocol_bs->children));
> +
> +        info->protocol_specific = bdrv_get_specific_info(protocol_bs, &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            qapi_free_ImageInfo(info);
> +            goto out;
> +        }
> +        info->has_protocol_specific = info->protocol_specific != NULL;
> +    }
> +
>      backing_filename = bs->backing_file;
>      if (backing_filename[0] != '\0') {
>          char *backing_filename2;

Kevin


