Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18585ED43E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 07:29:45 +0200 (CEST)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odPdg-0006RJ-Oq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 01:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odPbt-0004oV-RA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odPbj-0008V8-J4
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664342861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVwc1niaditCDxFplIzlHtZ1B1MQmJ0UYf7XhaGiWI0=;
 b=ScNt1q4TV0N1U7gsGZy038RY0MA2Byblr91R4oPszpZVKnHevs+wQDuGFT4ojAtCdmCemA
 V5dXVQYcTIK1KrGrB0GcLNtQoKMIo5ffGjt7HUVhco5rMsKLJehZnRaj8Kx5jG5XN4iCO+
 PIhXr12x4026oBjOPttOSgPkucCq/8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-IzFG1rXON56wZvG9KRP5EA-1; Wed, 28 Sep 2022 01:27:38 -0400
X-MC-Unique: IzFG1rXON56wZvG9KRP5EA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF99185A794;
 Wed, 28 Sep 2022 05:27:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E1F640C6EC2;
 Wed, 28 Sep 2022 05:27:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A00421E691D; Wed, 28 Sep 2022 07:27:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Yanan Wang <wangyanan55@huawei.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  John Snow
 <jsnow@redhat.com>,  "Denis V. Lunev" <den@openvz.org>,  Xie Changlong
 <xiechanglong.d@gmail.com>,  Eric Blake <eblake@redhat.com>,
 integration@gluster.org,  David Hildenbrand <david@redhat.com>,  Wen
 Congyang <wencongyang2@huawei.com>,  Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,  afaria@redhat.com,  Fam Zheng
 <fam@euphon.net>,  Thomas Huth <thuth@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Peter Xu
 <peterx@redhat.com>,  Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Philippe =?utf-8?Q?Math?=
 =?utf-8?Q?ieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  sgarzare@redhat.com
Subject: Re: [PATCH v5 02/12] blkio: add libblkio block driver
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-3-stefanha@redhat.com>
Date: Wed, 28 Sep 2022 07:27:34 +0200
In-Reply-To: <20220927193431.22302-3-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Tue, 27 Sep 2022 15:34:21 -0400")
Message-ID: <87sfkc1321.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>

[...]

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index f21fa235f2..5aed0dd436 100644
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

Should these be 'if': 'CONFIG_BLKIO'?

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


