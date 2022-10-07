Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAC25F7B39
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:13:38 +0200 (CEST)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpyh-0005Sk-HP
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ogoor-0005rw-3n
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ogoon-00025W-Ok
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665154757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NuLAOqt2bfOCiLESVxa+xK8M47JOdxc97BavJWIQT+8=;
 b=WtxlM6vdlZ9nHG0O5p+jT+Yp7hUS6dSt4fjc++4gVc7kv8tLqaZvqqqt/wIATXsqBolb4o
 KnShxTjbP0bLq8g58kIX2txZsYb16AiOOQJe2ilrpdAKkPpIH1yLKAykyvwXlzhLpl3CaT
 AgOeyOdKUFV8dDntqJyf065ZA8Jp1WA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-M8rhBsfxOgGe3Nksc-VPXg-1; Fri, 07 Oct 2022 10:59:13 -0400
X-MC-Unique: M8rhBsfxOgGe3Nksc-VPXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39D673826A4C;
 Fri,  7 Oct 2022 14:59:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65EA1403167;
 Fri,  7 Oct 2022 14:59:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35DAE21E691D; Fri,  7 Oct 2022 16:59:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Yanan Wang <wangyanan55@huawei.com>,
 sgarzare@redhat.com,  "Richard W.M. Jones" <rjones@redhat.com>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  integration@gluster.org,
 qemu-block@nongnu.org,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Paolo Bonzini <pbonzini@redhat.com>,  Kevin
 Wolf <kwolf@redhat.com>,  afaria@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Xie
 Changlong <xiechanglong.d@gmail.com>,  John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Jeff Cody <codyprime@gmail.com>,
 "Denis V. Lunev" <den@openvz.org>,  Laurent Vivier <lvivier@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 02/13] blkio: add libblkio block driver
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-3-stefanha@redhat.com>
Date: Fri, 07 Oct 2022 16:59:10 +0200
In-Reply-To: <20221006213507.645402-3-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Thu, 6 Oct 2022 17:34:56 -0400")
Message-ID: <874jwfr875.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Stefan Hajnoczi <stefanha@redhat.com> writes:

> libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> high-performance disk I/O. It currently supports io_uring,
> virtio-blk-vhost-user, and virtio-blk-vhost-vdpa with additional drivers
> under development.
>
> One of the reasons for developing libblkio is that other applications
> besides QEMU can use it. This will be particularly useful for
> virtio-blk-vhost-user which applications may wish to use for connecting
> to qemu-storage-daemon.
>
> libblkio also gives us an opportunity to develop in Rust behind a C API
> that is easy to consume from QEMU.
>
> This commit adds io_uring, virtio-blk-vhost-user, and
> virtio-blk-vhost-vdpa BlockDrivers to QEMU using libblkio. It will be
> easy to add other libblkio drivers since they will share the majority of
> code.
>
> For now I/O buffers are copied through bounce buffers if the libblkio
> driver requires it. Later commits add an optimization for
> pre-registering guest RAM to avoid bounce buffers.
>
> The syntax is:
>
>   --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
>
> and:
>
>   --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off

The patch also adds nvme-io_uring.  Shouldn't the commit message mention
it?

>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS                   |   6 +
>  meson_options.txt             |   2 +
>  qapi/block-core.json          |  75 ++-
>  meson.build                   |   9 +
>  block/blkio.c                 | 830 ++++++++++++++++++++++++++++++++++
>  tests/qtest/modules-test.c    |   3 +
>  block/meson.build             |   1 +
>  scripts/meson-buildoptions.sh |   3 +
>  8 files changed, 925 insertions(+), 4 deletions(-)
>  create mode 100644 block/blkio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1530b51a2..0dcae6168a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3403,6 +3403,12 @@ L: qemu-block@nongnu.org
>  S: Maintained
>  F: block/vdi.c
>  
> +blkio
> +M: Stefan Hajnoczi <stefanha@redhat.com>
> +L: qemu-block@nongnu.org
> +S: Maintained
> +F: block/blkio.c
> +
>  iSCSI
>  M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
>  M: Paolo Bonzini <pbonzini@redhat.com>
> diff --git a/meson_options.txt b/meson_options.txt
> index 79c6af18d5..66128178bf 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -117,6 +117,8 @@ option('bzip2', type : 'feature', value : 'auto',
>         description: 'bzip2 support for DMG images')
>  option('cap_ng', type : 'feature', value : 'auto',
>         description: 'cap_ng support')
> +option('blkio', type : 'feature', value : 'auto',
> +       description: 'libblkio block device driver')
>  option('bpf', type : 'feature', value : 'auto',
>          description: 'eBPF support')
>  option('cocoa', type : 'feature', value : 'auto',
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index f21fa235f2..6c6ae2885c 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2951,11 +2951,18 @@
>              'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
>              {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>              {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> -            'http', 'https', 'iscsi',
> -            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
> -            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
> +            'http', 'https',
> +            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
> +            'iscsi',
> +            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme',
> +            { 'name': 'nvme-io_uring', 'if': 'CONFIG_BLKIO' },

This enumeration value and ...

> +            'parallels', 'preallocate', 'qcow', 'qcow2', 'qed', 'quorum',
> +            'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx',
> +            { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
> +            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
> +            'vmdk', 'vpc', 'vvfat' ] }
>  
>  ##
>  # @BlockdevOptionsFile:
> @@ -3678,6 +3685,58 @@
>              '*debug': 'int',
>              '*logfile': 'str' } }
>  
> +##
> +# @BlockdevOptionsIoUring:
> +#
> +# Driver specific block device options for the io_uring backend.
> +#
> +# @filename: path to the image file
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'BlockdevOptionsIoUring',
> +  'data': { 'filename': 'str' },
> +  'if': 'CONFIG_BLKIO' }
> +
> +##
> +# @BlockdevOptionsNvmeIoUring:
> +#
> +# Driver specific block device options for the nvme-io_uring backend.
> +#
> +# @filename: path to the image file
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'BlockdevOptionsNvmeIoUring',
> +  'data': { 'filename': 'str' },
> +  'if': 'CONFIG_BLKIO' }

... this type aren't used in this patch.  Did you ...

> +
> +##
> +# @BlockdevOptionsVirtioBlkVhostUser:
> +#
> +# Driver specific block device options for the virtio-blk-vhost-user backend.
> +#
> +# @path: path to the vhost-user UNIX domain socket.
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'BlockdevOptionsVirtioBlkVhostUser',
> +  'data': { 'path': 'str' },
> +  'if': 'CONFIG_BLKIO' }
> +
> +##
> +# @BlockdevOptionsVirtioBlkVhostVdpa:
> +#
> +# Driver specific block device options for the virtio-blk-vhost-vdpa backend.
> +#
> +# @path: path to the vhost-vdpa character device.
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> +  'data': { 'path': 'str' },
> +  'if': 'CONFIG_BLKIO' }
> +
>  ##
>  # @IscsiTransport:
>  #
> @@ -4305,6 +4364,8 @@
>                         'if': 'HAVE_HOST_BLOCK_DEVICE' },
>        'http':       'BlockdevOptionsCurlHttp',
>        'https':      'BlockdevOptionsCurlHttps',
> +      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
> +                      'if': 'CONFIG_BLKIO' },
>        'iscsi':      'BlockdevOptionsIscsi',
>        'luks':       'BlockdevOptionsLUKS',
>        'nbd':        'BlockdevOptionsNbd',
> @@ -4327,6 +4388,12 @@
>        'throttle':   'BlockdevOptionsThrottle',
>        'vdi':        'BlockdevOptionsGenericFormat',
>        'vhdx':       'BlockdevOptionsGenericFormat',
> +      'virtio-blk-vhost-user':
> +                    { 'type': 'BlockdevOptionsVirtioBlkVhostUser',
> +                      'if': 'CONFIG_BLKIO' },
> +      'virtio-blk-vhost-vdpa':
> +                    { 'type': 'BlockdevOptionsVirtioBlkVhostVdpa',
> +                      'if': 'CONFIG_BLKIO' },
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
>        'vvfat':      'BlockdevOptionsVVFAT'

... forget to add a branch here?


[...]


