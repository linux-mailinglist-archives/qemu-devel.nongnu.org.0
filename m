Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFC403AF5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:51:18 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxyv-0007mo-42
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNxx9-0006fY-8g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNxx6-0005r1-H9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631108963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RioyZBHZIZVXNvYL83wqB8ZPB6VXojQAXaT68GaSPqU=;
 b=acmE2sqNV2vD55TcS2NlcZpo0wuipqT/pUg+ErT8UsBQ4qCpeZmKsJpSCdR6C0jnOXMC27
 dzh41uGcFlAhejZ47jQUeOpet6ymCcb0RVrU0TQAuwjswSgZSpgUaMT+esFIHAGLgrc+7t
 CR8KyjgpumJbT4y4e0GaMObc7pOdgF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-o0ofT4qHNYGSul8bXNxHoQ-1; Wed, 08 Sep 2021 09:49:18 -0400
X-MC-Unique: o0ofT4qHNYGSul8bXNxHoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E478108E6EC;
 Wed,  8 Sep 2021 13:48:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F2D1A26A;
 Wed,  8 Sep 2021 13:48:49 +0000 (UTC)
Date: Wed, 8 Sep 2021 14:48:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <YTi/P6IKQfNzXoaf@redhat.com>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210907134756.apnxzgbvw2ztetag@steredhat>
 <20210908134135.xvidtghamwahbdqk@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210908134135.xvidtghamwahbdqk@steredhat>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 03:41:35PM +0200, Stefano Garzarella wrote:
> On Tue, Sep 07, 2021 at 03:47:56PM +0200, Stefano Garzarella wrote:
> > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > > > enabled the SEQPACKET feature bit.
> > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > > > the host kernel supports SEQPACKET but machine type version is less than
> > > > 6.1, we get the following errors:
> > > > 
> > > >    Features 0x130000002 unsupported. Allowed features: 0x179000000
> > > >    Failed to load virtio-vhost_vsock:virtio
> > > >    error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> > > >    load of migration failed: Operation not permitted
> > > > 
> > > > Let's disable the feature bit for machine types < 6.1, adding a
> > > > `features` field to VHostVSock to simplify the handling of upcoming
> > > > features we will support.
> > > 
> > > IIUC, this will still leave migration broken for anyone migrating
> > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
> > > a kernel lacking that, or vica-verca.
> > 
> > This should be true for migrating from kernel that supports SEQPACKET to
> > a kernel lacking that.
> > 
> > For vice-versa I'm not sure, since vhost_get_features() will disable
> > that feature if the host kernel doesn't support it, and the guest will
> > not have acked it.
> 
> I did some testing and the migration is only broken in the case of
> kernel 5.14+ (SEQPACKET supported) -> kernel 5.13 (SEQPACKET not supported).
> 
> Vice-versa works well because the feature is not acked.
> 
> > 
> > > 
> > > If a feature is dependant on a host kernel feature we can't turn
> > > that on automatically as part of the machine type, as we need
> > > ABI stability across migration indepdant of kernel version.
> > > 
> > 
> > How do we typically handle this?
> > 
> > I wrongly thought it was an expected behavior that migrating a guest
> > using a vhost device from a new kernel to an old one can fail if not all
> > features are supported.
> > 
> > I need to take a look at the other vhost devices.
> 
> I took a look at vhost-net and vhost-scsi and we don't seem to handle this
> case. Maybe I'm missing something...

We've never done very well at having a consistent story wrt deps
on kernel features. So I wouldn't be surprised to see differences
or omissions anywhere and people not notice the issue.

> So following your advice, the best thing would be to have this feature
> disabled by default and require the user to enable it explicitly so we are
> sure it is needed. At this point a migration to a kernel that doesn't
> support it is rightly broken.
> 
> Or is there something better we can do?
> 
> @Michael @Jason any thoughts?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


