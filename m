Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA45F7C37
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:28:32 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogr9D-00082A-55
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ogr7F-0005uJ-It; Fri, 07 Oct 2022 13:26:31 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ogr7D-0000x3-8V; Fri, 07 Oct 2022 13:26:29 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j7so6495228ybb.8;
 Fri, 07 Oct 2022 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fVRcQCUDrb1HrU5YN6s1FDmrw2CxPoDhhdO+ks1gi5w=;
 b=gNb9zs2nV4+z9dy/dkip4i7v3ANiV8tt+zgtWqV0/l9G9j/ppTFPyrIbBAhCaBCrzu
 mZfmLeYIyqyahWfYUwsN2Eta4Yk15HSOd/FyC8nKat1sMTe36om8ztyrtUpVIYlINfjS
 GPLL7h5i39Tx2qBauqbDTjmIk9QhXqPuL/rCD4hA1J6FyhsQfRd8sdZLUgfqqd93GT3P
 Rt2PQZrF3Dv31n/HswLq88dyxNIZwaRYLJr6BtfQ8NVVuwBdF4rhrVBlsmkZuMxsgQH7
 rVmMqUVAbwt0QMOWBcefIdYxuL86I3WFxHuLQPzgu5XmyjeP0a4nk87LcjAiKHZ6iUIP
 ZKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVRcQCUDrb1HrU5YN6s1FDmrw2CxPoDhhdO+ks1gi5w=;
 b=gsYNNQtj5iz/zSaDV0CImusuZwvg+p47U/G5zY5ZoJrJ2wuibGS21karHpiSrOnmnq
 L+fnYW+xZVyIVvwr+VT0SP5yrdY2/PYkOFBCs0MvSa3yGFJyVM54EWKcRQhIrKu4/T9E
 /yqXl7YsBVtuwjdblyp3O1EAddHvPihH/jvvyLWw/NLrvWicsLLise+C1sF08lMb4NCV
 0J741R0+w16Sjpj09ssXA6iWIa4flx8bHNhjHdVdKG460aUOnEkaSbUur/DPMsbiXKOy
 UKKgkFp6k9yUmo+1E9hgUKp7XbOIJKZo3QHwuS17qvpSDnAbTP8ti7GVbXL7dN9ljcC3
 wPbQ==
X-Gm-Message-State: ACrzQf0bY0A6fYF4wS7gd+IrIUqA2Onv8PV+Weh6wIOagubntw9so8u2
 z+3uuWyBMJONNbl95lXuyKueeXOtaNwYaroJnqM=
X-Google-Smtp-Source: AMsMyM4hwhwms8OxNtbP0xSr7IyBG0JjzGdng/ZRz8Jsk8ua4RJ8w7CZGqHNOnmWsNbw4blymn1kE78dfaqa7kwRoFI=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr2011045ybe.642.1665163584172; Fri, 07
 Oct 2022 10:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-3-stefanha@redhat.com>
 <874jwfr875.fsf@pond.sub.org>
In-Reply-To: <874jwfr875.fsf@pond.sub.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 7 Oct 2022 13:26:12 -0400
Message-ID: <CAJSP0QU53OaaY9PwYiYYOL655Qx_3f04durtXh7uE9vgieeHvQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] blkio: add libblkio block driver
To: Markus Armbruster <armbru@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com, 
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, afaria@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Xie Changlong <xiechanglong.d@gmail.com>, John Snow <jsnow@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jeff Cody <codyprime@gmail.com>, 
 "Denis V. Lunev" <den@openvz.org>, Laurent Vivier <lvivier@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wen Congyang <wencongyang2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, 7 Oct 2022 at 11:41, Markus Armbruster <armbru@redhat.com> wrote:
>
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring,
> > virtio-blk-vhost-user, and virtio-blk-vhost-vdpa with additional drivers
> > under development.
> >
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > virtio-blk-vhost-user which applications may wish to use for connecting
> > to qemu-storage-daemon.
> >
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> >
> > This commit adds io_uring, virtio-blk-vhost-user, and
> > virtio-blk-vhost-vdpa BlockDrivers to QEMU using libblkio. It will be
> > easy to add other libblkio drivers since they will share the majority of
> > code.
> >
> > For now I/O buffers are copied through bounce buffers if the libblkio
> > driver requires it. Later commits add an optimization for
> > pre-registering guest RAM to avoid bounce buffers.
> >
> > The syntax is:
> >
> >   --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
> >
> > and:
> >
> >   --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off
>
> The patch also adds nvme-io_uring.  Shouldn't the commit message mention
> it?

Yes, will fix in the next revision. Thanks!
>
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Acked-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  MAINTAINERS                   |   6 +
> >  meson_options.txt             |   2 +
> >  qapi/block-core.json          |  75 ++-
> >  meson.build                   |   9 +
> >  block/blkio.c                 | 830 ++++++++++++++++++++++++++++++++++
> >  tests/qtest/modules-test.c    |   3 +
> >  block/meson.build             |   1 +
> >  scripts/meson-buildoptions.sh |   3 +
> >  8 files changed, 925 insertions(+), 4 deletions(-)
> >  create mode 100644 block/blkio.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e1530b51a2..0dcae6168a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3403,6 +3403,12 @@ L: qemu-block@nongnu.org
> >  S: Maintained
> >  F: block/vdi.c
> >
> > +blkio
> > +M: Stefan Hajnoczi <stefanha@redhat.com>
> > +L: qemu-block@nongnu.org
> > +S: Maintained
> > +F: block/blkio.c
> > +
> >  iSCSI
> >  M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> >  M: Paolo Bonzini <pbonzini@redhat.com>
> > diff --git a/meson_options.txt b/meson_options.txt
> > index 79c6af18d5..66128178bf 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -117,6 +117,8 @@ option('bzip2', type : 'feature', value : 'auto',
> >         description: 'bzip2 support for DMG images')
> >  option('cap_ng', type : 'feature', value : 'auto',
> >         description: 'cap_ng support')
> > +option('blkio', type : 'feature', value : 'auto',
> > +       description: 'libblkio block device driver')
> >  option('bpf', type : 'feature', value : 'auto',
> >          description: 'eBPF support')
> >  option('cocoa', type : 'feature', value : 'auto',
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index f21fa235f2..6c6ae2885c 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -2951,11 +2951,18 @@
> >              'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
> >              {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> >              {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> > -            'http', 'https', 'iscsi',
> > -            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
> > -            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
> > +            'http', 'https',
> > +            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
> > +            'iscsi',
> > +            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme',
> > +            { 'name': 'nvme-io_uring', 'if': 'CONFIG_BLKIO' },
>
> This enumeration value and ...
>
> > +            'parallels', 'preallocate', 'qcow', 'qcow2', 'qed', 'quorum',
> > +            'raw', 'rbd',
> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> > +            'ssh', 'throttle', 'vdi', 'vhdx',
> > +            { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
> > +            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
> > +            'vmdk', 'vpc', 'vvfat' ] }
> >
> >  ##
> >  # @BlockdevOptionsFile:
> > @@ -3678,6 +3685,58 @@
> >              '*debug': 'int',
> >              '*logfile': 'str' } }
> >
> > +##
> > +# @BlockdevOptionsIoUring:
> > +#
> > +# Driver specific block device options for the io_uring backend.
> > +#
> > +# @filename: path to the image file
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsIoUring',
> > +  'data': { 'filename': 'str' },
> > +  'if': 'CONFIG_BLKIO' }
> > +
> > +##
> > +# @BlockdevOptionsNvmeIoUring:
> > +#
> > +# Driver specific block device options for the nvme-io_uring backend.
> > +#
> > +# @filename: path to the image file
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsNvmeIoUring',
> > +  'data': { 'filename': 'str' },
> > +  'if': 'CONFIG_BLKIO' }
>
> ... this type aren't used in this patch.  Did you ...
>
> > +
> > +##
> > +# @BlockdevOptionsVirtioBlkVhostUser:
> > +#
> > +# Driver specific block device options for the virtio-blk-vhost-user backend.
> > +#
> > +# @path: path to the vhost-user UNIX domain socket.
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsVirtioBlkVhostUser',
> > +  'data': { 'path': 'str' },
> > +  'if': 'CONFIG_BLKIO' }
> > +
> > +##
> > +# @BlockdevOptionsVirtioBlkVhostVdpa:
> > +#
> > +# Driver specific block device options for the virtio-blk-vhost-vdpa backend.
> > +#
> > +# @path: path to the vhost-vdpa character device.
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > +  'data': { 'path': 'str' },
> > +  'if': 'CONFIG_BLKIO' }
> > +
> >  ##
> >  # @IscsiTransport:
> >  #
> > @@ -4305,6 +4364,8 @@
> >                         'if': 'HAVE_HOST_BLOCK_DEVICE' },
> >        'http':       'BlockdevOptionsCurlHttp',
> >        'https':      'BlockdevOptionsCurlHttps',
> > +      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
> > +                      'if': 'CONFIG_BLKIO' },
> >        'iscsi':      'BlockdevOptionsIscsi',
> >        'luks':       'BlockdevOptionsLUKS',
> >        'nbd':        'BlockdevOptionsNbd',
> > @@ -4327,6 +4388,12 @@
> >        'throttle':   'BlockdevOptionsThrottle',
> >        'vdi':        'BlockdevOptionsGenericFormat',
> >        'vhdx':       'BlockdevOptionsGenericFormat',
> > +      'virtio-blk-vhost-user':
> > +                    { 'type': 'BlockdevOptionsVirtioBlkVhostUser',
> > +                      'if': 'CONFIG_BLKIO' },
> > +      'virtio-blk-vhost-vdpa':
> > +                    { 'type': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > +                      'if': 'CONFIG_BLKIO' },
> >        'vmdk':       'BlockdevOptionsGenericCOWFormat',
> >        'vpc':        'BlockdevOptionsGenericFormat',
> >        'vvfat':      'BlockdevOptionsVVFAT'
>
> ... forget to add a branch here?

Yes! Alberto tried to run it earlier today and hit this problem. Will
fix in the next revision:

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6c6ae2885c..d752e8550d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4373,6 +4373,8 @@
       'null-aio':   'BlockdevOptionsNull',
       'null-co':    'BlockdevOptionsNull',
       'nvme':       'BlockdevOptionsNVMe',
+      'nvme-io_uring': { 'type': 'BlockdevOptionsNvmeIoUring',
+                         'if': 'CONFIG_BLKIO' },
       'parallels':  'BlockdevOptionsGenericFormat',
       'preallocate':'BlockdevOptionsPreallocate',
       'qcow2':      'BlockdevOptionsQcow2',

