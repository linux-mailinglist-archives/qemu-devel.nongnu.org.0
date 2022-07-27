Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7E582A84
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:17:53 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjjM-0006vH-C5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ming.lei@redhat.com>)
 id 1oGiY7-0005Xl-6Z
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ming.lei@redhat.com>)
 id 1oGiY1-0001CT-3w
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658934123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f20xJSSOw4to1YvtD8QTYSKujSIjW6nxQIvZt8u0EZQ=;
 b=CkeBdyL9MDRqI/3whlyt3oAU2cJfV0V2fu0bncZXbWmZRoWCeWCLzP3VXYM3dLoUrqIi0q
 vjJ3FjW5qMmhYKEAs3SEtF/gwAB8AWnahz7JlHq4H/biZclEZPlAcUVkctUi66anFdx1ij
 kPpxFKseNcL+KIXGTbzL6Sy2Swa3a2s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-G3uIKqAyP6mH4mkcle0dEw-1; Wed, 27 Jul 2022 11:00:24 -0400
X-MC-Unique: G3uIKqAyP6mH4mkcle0dEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E364299E76D;
 Wed, 27 Jul 2022 14:59:56 +0000 (UTC)
Received: from T590 (ovpn-8-32.pek2.redhat.com [10.72.8.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23B8F403D0E0;
 Wed, 27 Jul 2022 14:59:47 +0000 (UTC)
Date: Wed, 27 Jul 2022 22:59:42 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>,
 Jens Axboe <axboe@kernel.dk>, ming.lei@redhat.com
Subject: Re: [RFC v4 5/9] qemu-iotests: test new zone operations.
Message-ID: <YuFS3vfQi3OPTKi0@T590>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-6-faithilikerun@gmail.com>
 <CAJSP0QVd0_njYR5ZT0VjGt=CgN8dZnXVZdjmh8uUhj3uO=DwUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QVd0_njYR5ZT0VjGt=CgN8dZnXVZdjmh8uUhj3uO=DwUw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ming.lei@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Jul 2022 12:10:07 -0400
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

On Wed, Jul 27, 2022 at 10:34:56AM -0400, Stefan Hajnoczi wrote:
> On Mon, 11 Jul 2022 at 22:21, Sam Li <faithilikerun@gmail.com> wrote:
> >
> > We have added new block layer APIs of zoned block devices. Test it with:
> > (1) Create a null_blk device, run each zone operation on it and see
> > whether reporting right zone information.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  tests/qemu-iotests/tests/zoned.sh | 69 +++++++++++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100755 tests/qemu-iotests/tests/zoned.sh
> >
> > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> > new file mode 100755
> > index 0000000000..e14a3a420e
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.sh
> > @@ -0,0 +1,69 @@
> > +#!/usr/bin/env bash
> > +#
> > +# Test zone management operations.
> > +#
> > +
> > +seq="$(basename $0)"
> > +echo "QA output created by $seq"
> > +status=1 # failure is the default!
> > +
> > +_cleanup()
> > +{
> > +  _cleanup_test_img
> > +  sudo rmmod null_blk
> > +}
> > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > +
> > +# get standard environment, filters and checks
> > +. ./common.rc
> > +. ./common.filter
> > +. ./common.qemu
> > +
> > +# This test only runs on Linux hosts with raw image files.
> > +_supported_fmt raw
> > +_supported_proto file
> > +_supported_os Linux
> > +
> > +QEMU_IO="build/qemu-io"
> > +IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
> > +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
> > +
> > +echo "Testing a null_blk device"
> > +echo "Simple cases: if the operations work"
> > +sudo modprobe null_blk nr_devices=1 zoned=1
> 
> Jens & Ming Lei:
> 
> null_blk is not ideal for automated test cases because it requires
> root and is global. If two tests are run at the same time they will
> interfere with each other. There is no way to have independent
> instances of the null_blk kernel module and the /dev/nullb0 device on
> a single Linux system. I think this test case can be merged for now
> but if there's time I suggest investigating alternatives.
> 
> Maybe the new Linux ublk_drv driver is a better choice if it supports
> unprivileged operation with multiple independent block devices (plus

This can be one big topic, and IMO, the io path needs to be reviewed
wrt. security risk. Also if one block device is stuck, it shouldn't
affect others, so far it can be one problem at least in sync/writeback,
if one device is hang, writeback on all block device may not move on.

> zoned storage!). It would be necessary to write a userspace null block
> device that supports zoned storage if that doesn't exist already. I
> have CCed Ming Lei and Jens Axboe for thoughts.

IMO, it shouldn't be hard to simulate zoned from userspace, the
patches[1] for setting device parameters are just sent out, then zoned
parameter could be sent to driver with the added commands easily.

Even ublk can be used to implement zoned target, such as, ublk is
exposed as one normal disk, but the backing disk could be one real
zoned/zns device.

[1] https://lore.kernel.org/linux-block/20220727141628.985429-1-ming.lei@redhat.com/T/#mb5518cf418b63fb6ca649f0df199137e50907a29

thanks,
Ming


