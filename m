Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3CC5364C5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:35:47 +0200 (CEST)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc0B-0007dp-3A
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nubye-0006pj-5X
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nubyY-0001vK-VA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653665645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ykFL6czrDKNcoXqD0UEHo1uWdGjvgWyTfbSBJySKB0=;
 b=hnxwvpLRK7YsDS8HCv2Dlt4WKPe1YgMd1LvUEm/TY+sFdscU7rS8hSV1fmNK72R3rsWO4i
 ajXmxogeYrIsYv+viEAJAuB6GSoUxDng3FrN/myuB5erAtCK2G3v9kgsVociFKHNZj2R7h
 1AJhxQnUJ79u8+zqhAYOK36S4DIJrPE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-7bTTstogORWNyixmkH3V1g-1; Fri, 27 May 2022 11:34:02 -0400
X-MC-Unique: 7bTTstogORWNyixmkH3V1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA4371C06909;
 Fri, 27 May 2022 15:34:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B00D2026D07;
 Fri, 27 May 2022 15:33:58 +0000 (UTC)
Date: Fri, 27 May 2022 17:33:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 6/8] vduse-blk: Implement vduse-blk export
Message-ID: <YpDvZRUMAuhQLbJe@redhat.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <20220523084611.91-7-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523084611.91-7-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 23.05.2022 um 10:46 hat Xie Yongji geschrieben:
> This implements a VDUSE block backends based on
> the libvduse library. We can use it to export the BDSs
> for both VM and container (host) usage.
> 
> The new command-line syntax is:
> 
> $ qemu-storage-daemon \
>     --blockdev file,node-name=drive0,filename=test.img \
>     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> 
> After the qemu-storage-daemon started, we need to use
> the "vdpa" command to attach the device to vDPA bus:
> 
> $ vdpa dev add name vduse-export0 mgmtdev vduse
> 
> Also the device must be removed via the "vdpa" command
> before we stop the qemu-storage-daemon.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  MAINTAINERS                   |   4 +-
>  block/export/export.c         |   6 +
>  block/export/meson.build      |   5 +
>  block/export/vduse-blk.c      | 307 ++++++++++++++++++++++++++++++++++
>  block/export/vduse-blk.h      |  20 +++
>  meson.build                   |  13 ++
>  meson_options.txt             |   2 +
>  qapi/block-export.json        |  28 +++-
>  scripts/meson-buildoptions.sh |   4 +
>  9 files changed, 385 insertions(+), 4 deletions(-)
>  create mode 100644 block/export/vduse-blk.c
>  create mode 100644 block/export/vduse-blk.h

> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 0685cb8b9a..e4bd4de363 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -177,6 +177,23 @@
>              '*allow-other': 'FuseExportAllowOther' },
>    'if': 'CONFIG_FUSE' }
>  
> +##
> +# @BlockExportOptionsVduseBlk:
> +#
> +# A vduse-blk block export.
> +#
> +# @num-queues: the number of virtqueues. Defaults to 1.
> +# @queue-size: the size of virtqueue. Defaults to 256.
> +# @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
> +#                      and must be power of 2. Defaults to 512 bytes.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'BlockExportOptionsVduseBlk',
> +  'data': { '*num-queues': 'uint16',
> +            '*queue-size': 'uint16',
> +            '*logical-block-size': 'size'} }
> +
>  ##
>  # @NbdServerAddOptions:
>  #
> @@ -280,6 +297,7 @@
>  # @nbd: NBD export
>  # @vhost-user-blk: vhost-user-blk export (since 5.2)
>  # @fuse: FUSE export (since: 6.0)
> +# @vduse-blk: vduse-blk export (since 7.1)
>  #
>  # Since: 4.2
>  ##
> @@ -287,7 +305,8 @@
>    'data': [ 'nbd',
>              { 'name': 'vhost-user-blk',
>                'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
> -            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> +            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
> +            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
>  
>  ##
>  # @BlockExportOptions:
> @@ -295,7 +314,8 @@
>  # Describes a block export, i.e. how single node should be exported on an
>  # external interface.
>  #
> -# @id: A unique identifier for the block export (across all export types)
> +# @id: A unique identifier for the block export (across the host for vduse-blk
> +#      export type or across all export types for other types)

I find this sentence a bit confusing, but more importantly, it shows
that you are using one value for two different purposes: The ID to
identfy the export within QEMU (must be distinct from any other exports
in the same QEMU process, but can overlap with names used by other
processes), and the VDUSE name to uniquely identify it on the host (must
be distinct from other VDUSE devices on the same host, but can overlap
with other export types like NBD in the same process).

We can fix this on top, but I would suggest having a separate option for
the VDUSE device name, like BlockExportOptionsNbdBase contains a 'name'
option for the export name that is different from the export ID in QEMU.

>  # @node-name: The node name of the block node to be exported (since: 5.2)
>  #
> @@ -331,7 +351,9 @@
>        'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
>                            'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>        'fuse': { 'type': 'BlockExportOptionsFuse',
> -                'if': 'CONFIG_FUSE' }
> +                'if': 'CONFIG_FUSE' },
> +      'vduse-blk': { 'type': 'BlockExportOptionsVduseBlk',
> +                     'if': 'CONFIG_VDUSE_BLK_EXPORT' }
>     } }

Kevin


