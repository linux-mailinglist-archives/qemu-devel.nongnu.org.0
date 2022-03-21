Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834934E2788
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:32:27 +0100 (CET)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWI94-0000r7-Av
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:32:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWI2L-0002tD-TF
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWI2H-0000xh-Us
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647869125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pgDJCXn4D/KHNbLlGW3/7AYU98D4sHNJoOeDuqwFOc8=;
 b=c0gQ3kyKpSGlkkMCxp7AivwbRLJxnv30iD4E3h9XGdqHoQOLRcsa7GIu0vE0zYOzIp2SlN
 TCMKz1QgCg3Yw8VoU3bkzY71FPH97qNmzSlqdtxp/9YbcxA0m6zXreveT//GGzZ4eIdI+/
 QHeKz0PyZixq4jn4XcTE2T4ejmqAMsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-n8x8RfmlMAihMfBcwdU67g-1; Mon, 21 Mar 2022 09:25:18 -0400
X-MC-Unique: n8x8RfmlMAihMfBcwdU67g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A8AA28EC116;
 Mon, 21 Mar 2022 13:25:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A2140FF415;
 Mon, 21 Mar 2022 13:25:16 +0000 (UTC)
Date: Mon, 21 Mar 2022 08:25:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v3 4/6] vduse-blk: implements vduse-blk export
Message-ID: <20220321132514.nmfl5rxjkncrnme3@redhat.com>
References: <20220321071439.151-1-xieyongji@bytedance.com>
 <20220321071439.151-5-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220321071439.151-5-xieyongji@bytedance.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, stefanha@redhat.com, jsnow@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 03:14:37PM +0800, Xie Yongji wrote:
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
> ---

Looking at just the QAPI:

> +++ b/qapi/block-export.json
> @@ -170,6 +170,22 @@
>              '*allow-other': 'FuseExportAllowOther' },
>    'if': 'CONFIG_FUSE' }
>  
> +##
> +# @BlockExportOptionsVduseBlk:
> +#
> +# A vduse-blk block export.
> +#
> +# @num-queues: the number of virtqueues. Defaults to 1.
> +# @queue-size: the size of virtqueue. Defaults to 128.
> +# @logical-block-size: Logical block size in bytes. Defaults to 512 bytes.

Any restrictions on this not being allowed to be smaller than 512, or
that it must be a power of 2, or that it has a maximum size?  If so,
they should be documented.

> +#
> +# Since: 7.0

This is a new feature, and is too late for 7.0, so this line should
mention 7.1.

> +##
> +{ 'struct': 'BlockExportOptionsVduseBlk',
> +  'data': { '*num-queues': 'uint16',
> +            '*queue-size': 'uint16',
> +            '*logical-block-size': 'size'} }
> +
>  ##
>  # @NbdServerAddOptions:
>  #
> @@ -273,6 +289,7 @@
>  # @nbd: NBD export
>  # @vhost-user-blk: vhost-user-blk export (since 5.2)
>  # @fuse: FUSE export (since: 6.0)
> +# @vduse-blk: vduse-blk export (since 7.0)

Another spot for 7.1.

>  #
>  # Since: 4.2
>  ##
> @@ -280,7 +297,8 @@
>    'data': [ 'nbd',
>              { 'name': 'vhost-user-blk',
>                'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
> -            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> +            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
> +            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
>  
>  ##
>  # @BlockExportOptions:
> @@ -324,7 +342,9 @@
>        'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
>                            'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>        'fuse': { 'type': 'BlockExportOptionsFuse',
> -                'if': 'CONFIG_FUSE' }
> +                'if': 'CONFIG_FUSE' },
> +      'vduse-blk': { 'type': 'BlockExportOptionsVduseBlk',
> +                     'if': 'CONFIG_VDUSE_BLK_EXPORT' }
>     } }
>  

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


