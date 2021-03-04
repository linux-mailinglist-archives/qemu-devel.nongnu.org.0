Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ADB32D0AE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:30:29 +0100 (CET)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlFU-000262-OL
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlAz-0007Ok-MB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:25:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlAv-0005n6-EF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614853544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4bhod+7WhIRCc7cv4pxr/w4RpKamjO2bMYSrLgi0pXc=;
 b=TSYf7FDVnANLmoAxKDorvGIzYBijrf8bFaWyqQi7o4MFr/9nkY53PLR46Q1iWW11lXpdwX
 8K5/a0Z3z/aHeO2YBOVaKqTiXEuxgAXP1O0XcaU9viDAVm1xhWiqvsLfGGcmxH/a+n8bGs
 2nb1csCDRREAs3FjP7fdsrVGMRn8QoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-wez1hNQ_Ne6P4Pr7HH0A0Q-1; Thu, 04 Mar 2021 05:25:42 -0500
X-MC-Unique: wez1hNQ_Ne6P4Pr7HH0A0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04139108BD09;
 Thu,  4 Mar 2021 10:25:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 121665FCC8;
 Thu,  4 Mar 2021 10:25:35 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:25:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <YEC1nQPYf4e5o8/j@redhat.com>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
 <20210304085540.ivknwqwrvhko3vxg@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210304085540.ivknwqwrvhko3vxg@steredhat>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Lieven <pl@kamp.de>, dillaman@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 09:55:40AM +0100, Stefano Garzarella wrote:
> On Wed, Mar 03, 2021 at 01:47:06PM -0500, Jason Dillaman wrote:
> > On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > 
> > > Hi Jason,
> > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
> > > writing data is very slow compared to a raw file.
> > > 
> > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
> > > different object size, for the raw file I see '4 MiB objects', for QCOW2
> > > I see '64 KiB objects' as reported on comment 14 [2].
> > > This should be the main issue of slowness, indeed forcing in the code 4
> > > MiB object size also for QCOW2 increased the speed a lot.
> > > 
> > > Looking better I discovered that for raw files, we call rbd_create()
> > > with obj_order = 0 (if 'cluster_size' options is not defined), so the
> > > default object size is used.
> > > Instead for QCOW2, we use obj_order = 16, since the default
> > > 'cluster_size' defined for QCOW2, is 64 KiB.
> > > 
> > > Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
> > > size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
> > > QemuOpts calling qemu_opts_to_qdict_filtered().
> > > For some reason that I have yet to understand, after this deletion,
> > > however remains in QemuOpts the default value of 'cluster_size' for
> > > qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
> > > 
> > > At this point my doubts are:
> > > Does it make sense to use the same cluster_size as qcow2 as object_size
> > > in RBD?
> > 
> > No, not really. But it also doesn't really make any sense to put a
> > QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
> > does not put QCOW2 images on RBD, it converts QCOW2 images into raw
> > images to store in RBD.
> 
> Yes, that was my doubt, thanks for the confirmation.
> 
> Also Daniel (+CC) confirmed me the same thing, but just to be complete he
> added that there is a case where OpenStack could use qcow2 on RBD, but in
> this case using in-kernel RBD, so the QEMU RBD is not involved.
> 
> > 
> > > If we want to keep the 2 options separated, how can it be done? Should
> > > we rename the option in block/rbd.c?
> > 
> > You can already pass overrides to the RBD block driver by just
> > appending them after the
> > "rbd:<filename>[:option1=value1[:option2=value2]]" portion, perhaps
> > that could be re-used.
> 
> I see, we should extend qemu_rbd_parse_filename() to suppurt it.

We shouldn't really be extending the legacy filename syntax.
If we need extra options we want them in the QAPI schema for
blockdev.

> Maybe if we don't want to support this configuration, we should print some
> warning messages.

Note these are separate layers in QEMU block layer. qcow2 is a format
driver, while RBD is a protocol driver. QEMU lets any format driver be
run on top of any protocol driver in general. In practice there are
certain combinations that are more sane and commonly used than others,
but QEMU doesn't document this or assign support level to pairing
right now.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


