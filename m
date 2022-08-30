Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFA5A5D10
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 09:36:47 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSvnc-00079y-Lx
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 03:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSvhb-0003FY-4K
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 03:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSvhX-0002nt-H1
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 03:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661844622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0urpd1EeImC3ondQloXrINnAKmaviNOvckEnw2fnGv4=;
 b=ABv2/tBCJLewtirabDaLJnNj9U7bpfPwIoATFfTAlUxXyK87Rr5YfjE8b+rhq8urzvw+hW
 9gc3cbHIfsUljotR0/kDsdHdea3pXgkXH0Y7LRq9iVLh6P4RleR376t68c/TB+TreB7v5G
 OPJ8BEeMayvaaKaibQs11r1IU9qQN40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-mqPtLM5-O46jMI0wBW1UPg-1; Tue, 30 Aug 2022 03:30:19 -0400
X-MC-Unique: mqPtLM5-O46jMI0wBW1UPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925DB85A58F;
 Tue, 30 Aug 2022 07:30:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 837E440315A;
 Tue, 30 Aug 2022 07:30:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 063E521E6900; Tue, 30 Aug 2022 09:30:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Denis V.
 Lunev" <den@openvz.org>,  Peter Xu <peterx@redhat.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,  qemu-block@nongnu.org,  John
 Snow <jsnow@redhat.com>,  integration@gluster.org,  Vladimir
 Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  David Hildenbrand
 <david@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Fam Zheng <fam@euphon.net>,
 sgarzare@redhat.com,  Alberto Faria <afaria@redhat.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Wen Congyang <wencongyang2@huawei.com>,  Eric Blake
 <eblake@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Eduardo Habkost
 <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>,  Xie Changlong <xiechanglong.d@gmail.com>
Subject: Re: [RFC v4 01/11] blkio: add libblkio block driver
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-2-stefanha@redhat.com>
Date: Tue, 30 Aug 2022 09:30:16 +0200
In-Reply-To: <20220822222402.176088-2-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Mon, 22 Aug 2022 18:23:52 -0400")
Message-ID: <877d2qkx2v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  MAINTAINERS                   |   6 +
>  meson_options.txt             |   2 +
>  qapi/block-core.json          |  53 ++-
>  meson.build                   |   9 +
>  block/blkio.c                 | 725 ++++++++++++++++++++++++++++++++++
>  tests/qtest/modules-test.c    |   3 +
>  block/meson.build             |   1 +
>  scripts/meson-buildoptions.sh |   3 +
>  8 files changed, 800 insertions(+), 2 deletions(-)
>  create mode 100644 block/blkio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ce4227ff6..f8ccd5954c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3397,6 +3397,12 @@ L: qemu-block@nongnu.org
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
> index e58e158396..67d841a8d2 100644
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
> index 2173e7734a..c8d217b50c 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2951,11 +2951,16 @@
>              'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
>              {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>              {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> -            'http', 'https', 'iscsi',
> +            'http', 'https',
> +            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
> +            'iscsi',
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx',
> +            { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
> +            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
> +            'vmdk', 'vpc', 'vvfat' ] }
>  
>  ##
>  # @BlockdevOptionsFile:
> @@ -3678,6 +3683,42 @@
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
> +  'data': { 'filename': 'str' } }
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
> +  'data': { 'path': 'str' } }
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
> +  'data': { 'path': 'str' } }
> +

We seem to be evenly split between 'filename' and 'path'.  Before the
patch we have four uses of 'filename' in this schema file (ImageInfo,
ImageCheck, BlockDriverOptionsFile, BlockdevCreateOptionsFile), and
three of 'path' (BlockdevOptionsSsh, BlockdevOptionsGluster,
BlockdevOptionsNfs).  There's also 'backing-file', 'data-file',
'backing-filename', 'file', and probably more (I stopped looking).

I dislike 'path'.  For what it's worth, POSIX calls this "pathname", and
the components "filename".  Everyday use hardly ever distinguishes
between the two.  Plain "path", however, is commonly used for lists of
directories.

>  ##
>  # @IscsiTransport:
>  #
> @@ -4305,6 +4346,8 @@
>                         'if': 'HAVE_HOST_BLOCK_DEVICE' },
>        'http':       'BlockdevOptionsCurlHttp',
>        'https':      'BlockdevOptionsCurlHttps',
> +      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
> +                      'if': 'CONFIG_BLKIO' },
>        'iscsi':      'BlockdevOptionsIscsi',
>        'luks':       'BlockdevOptionsLUKS',
>        'nbd':        'BlockdevOptionsNbd',
> @@ -4327,6 +4370,12 @@
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

[...]

Since the naming mess is not a new one made by this patch,
Acked-by: Markus Armbruster <armbru@redhat.com>


