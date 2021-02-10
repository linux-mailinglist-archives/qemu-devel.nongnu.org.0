Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73231733E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:22:06 +0100 (CET)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xs5-0006o0-VO
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9xmN-000218-1s
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9xmD-0005BK-5z
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612995359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEH6FvmbJgbpMEy5AX6rry8qG7GqcYH7uQPYcSVJ/jQ=;
 b=e5LQbMG6TyMgFKhVNTWQE5XCKxuNMdI8L5hJSA/4JuHP/2bIoS2SeHOCWvm/LFqSltf9oH
 ALTLb9U7fLVKH4QKtfvgUvzRIoX20yowFominCUcvlj8GYe2K5rSRfQH01C6z9wnxwFU/g
 xo7+vDsx7fwC0k7jj/ifR6d2b5fky/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-gHJpyYYcNLePncblwf66uQ-1; Wed, 10 Feb 2021 17:15:58 -0500
X-MC-Unique: gHJpyYYcNLePncblwf66uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29C1D107ACE3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 22:15:57 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-163.rdu2.redhat.com [10.10.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195CA7092D;
 Wed, 10 Feb 2021 22:15:45 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A299F220BCF; Wed, 10 Feb 2021 17:15:44 -0500 (EST)
Date: Wed, 10 Feb 2021 17:15:44 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210210221544.GC3200@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210210163830-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210210163830-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 04:39:06PM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 25, 2021 at 01:01:09PM -0500, Vivek Goyal wrote:
> > Hi,
> > 
> > We are working on DAX support in virtiofs and have some patches out of
> > the tree hosted here.
> > 
> > https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev
> > 
> > These patches have not been proposed for merge yet, becasue David
> > Gilbert noticed that we can run into a deadlock during an emergency
> > reboot of guest kernel. (echo b > /proc/sysrq-trigger).
> > 
> > I have provided details of deadlock in 4th path of the series with
> > subject "qemu, vhost-user: Extend protocol to start/stop/flush slave
> > channel".
> > 
> > Basic problem seems to be that we don't have a proper mechanism to
> > shutdown slave channel when vhost-user device is stopping. This means
> > there might be pending messages in slave channel and slave is blocked
> > and waiting for response.
> > 
> > This is an RFC patch series to enhance vhost-user protocol to 
> > properly shutdown/flush slave channel and avoid the deadlock. Though
> > we faced the issue in the context of virtiofs, any vhost-user
> > device using slave channel can potentially run into issues and
> > can benefit from these patches.
> > 
> > Any feedback is welcome. Currently patches are based on out of
> > tree code but after I get some feedback, I can only take pieces
> > which are relevant to upstream and post separately.
> > 
> > Thanks
> > Vivek
> 
> No comments so far - do you plan to post a non-RFC patchset?

Yes. Stefan wants me to poll both unix fd and slave fd in device
shutdown path and serve both of these in parallel, instead of
adding a new slave channel shutdown message. I am planning to give
it a try and post new patches.

Vivek
> 
> 
> > Vivek Goyal (6):
> >   virtiofsd: Drop ->vu_dispatch_rwlock while waiting for thread to exit
> >   libvhost-user: Use slave_mutex in all slave messages
> >   vhost-user: Return error code from slave_read()
> >   qemu, vhost-user: Extend protocol to start/stop/flush slave channel
> >   libvhost-user: Add support to start/stop/flush slave channel
> >   virtiofsd: Opt in for slave start/stop/shutdown functionality
> > 
> >  hw/virtio/vhost-user.c                    | 151 +++++++++++++++++++++-
> >  subprojects/libvhost-user/libvhost-user.c | 147 +++++++++++++++++----
> >  subprojects/libvhost-user/libvhost-user.h |   8 +-
> >  tools/virtiofsd/fuse_virtio.c             |  20 +++
> >  4 files changed, 294 insertions(+), 32 deletions(-)
> > 
> > -- 
> > 2.25.4
> 


