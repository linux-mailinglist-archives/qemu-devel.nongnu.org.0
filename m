Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CD404783
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:04:25 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFyp-0006Dk-Rl
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFx5-0005Jj-8Y
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFwy-0008NG-RW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631178147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTgrIv02Rx/QmGFF8hEDIoCNqRJr4cFITT7ln0zXlJc=;
 b=hEL2fg8kIzQAlpK+0VZSv/mCF9t3mhaFKOy74aSmOhxQ/cXnSj/FxZMGaJ4IsaQzrGkwG0
 6nRtoIJcFkmFeHa2H1lOHF9+uzGuICiVGM2zVVzRgvIoXt8AwQsVgiiw5NUyiV58RcXyfD
 rgSA+gI0QIR4SFfVg+rrTvwRk27ak50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-JAO5vRunMMGgAVINRFkaqQ-1; Thu, 09 Sep 2021 05:02:26 -0400
X-MC-Unique: JAO5vRunMMGgAVINRFkaqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5050A10168CB;
 Thu,  9 Sep 2021 09:02:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2D96A8E7;
 Thu,  9 Sep 2021 09:02:15 +0000 (UTC)
Date: Thu, 9 Sep 2021 10:02:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <YTnNlEz+0LohJHRG@redhat.com>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210909044603-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 Jiang Wang <jiang.wang@bytedance.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > > enabled the SEQPACKET feature bit.
> > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > > the host kernel supports SEQPACKET but machine type version is less than
> > > 6.1, we get the following errors:
> > > 
> > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
> > >     Failed to load virtio-vhost_vsock:virtio
> > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> > >     load of migration failed: Operation not permitted
> > > 
> > > Let's disable the feature bit for machine types < 6.1, adding a
> > > `features` field to VHostVSock to simplify the handling of upcoming
> > > features we will support.
> > 
> > IIUC, this will still leave migration broken for anyone migrating
> > a >= 6.1 machine type between a kernel that supports SEQPACKET and
> > a kernel lacking that, or vica-verca.  
> > 
> > If a feature is dependant on a host kernel feature we can't turn
> > that on automatically as part of the machine type, as we need
> > ABI stability across migration indepdant of kernel version.
> > 
> > 
> > Regards,
> > Daniel
> 
> This is a fundamental problem we have with kernel accelerators.
> A higher level solution at management level is needed.
> For now yes, we do turn features on by default,
> consistent kernels on source and destination are assumed.
> For downstreams not a problem at all as they update
> userspace and kernel in concert.

Even downstream in RHEL that is not actually valid anymore. Container
based deployment has killed any assumptions that can be made in this
respect. Even if the userspace and kernel are updated in lockstep in
a particular RHEL release, you cannot assume the running environment
will have a matched pair.

Users can be running QEMU userspace from RHEL-8.5 inside a container
that has been deployed on a host using a 8.3 kernel. We've even had
cases of running QEMU from RHEL-8, on a RHEL-7 host.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


