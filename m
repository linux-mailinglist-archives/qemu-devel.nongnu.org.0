Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E15322C3F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:30:07 +0100 (CET)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYhS-0005tM-Fq
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEYes-0002jD-9R
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEYep-0001OB-AQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614090442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qE9OzDz3PVY3mmY1ts7B9EQJu7FPqZd2uSs/q1jBSSA=;
 b=TtRsWJ02kx+p0f7wSTfxs1PvikdA+B82lAplGLznP1YJaSQ5jRSY85A0Ul6YAtR7pOKcXB
 gymGgWHXyOQfSQ6dl6cE07iBap5Bsj84+Jnb1g8IPjvYavo0xtqyHzS2ZMcP77ZwBU+0hg
 p1IKSWOXYrCdyiyiUuOJDphHfbhRYJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-s9Bp5jw_MW-BqnUdV1kZyQ-1; Tue, 23 Feb 2021 09:27:17 -0500
X-MC-Unique: s9Bp5jw_MW-BqnUdV1kZyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5A0085EE63;
 Tue, 23 Feb 2021 14:23:42 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-211.rdu2.redhat.com [10.10.117.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA0B75D6AB;
 Tue, 23 Feb 2021 14:23:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8104722054F; Tue, 23 Feb 2021 09:23:30 -0500 (EST)
Date: Tue, 23 Feb 2021 09:23:30 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210223142330.GA3153@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210223091358-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210223091358-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 09:14:16AM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 25, 2021 at 01:01:09PM -0500, Vivek Goyal wrote:
> > Hi,
> > 
> > We are working on DAX support in virtiofs and have some patches out of
> > the tree hosted here.
> > 
> > https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev
> 
> any plans to post a non RFC version?

We want to post a non-RFC version. But review comments have not been
taken care of yet.

Stefan says don't extend vhost-user protocl. Instead, modify
vhost_user_read() so that it polls both u->user->chr (unix domain socket)
as well as u->slave_fd. IOW, keep on servicing slave fd request while we
are waiting for vhost user message response.

Have not been able to figure out how to do that given unix domain
socket details are abstracted behind char device interface. 

CCing Greg, He might have ideas on how do that.

Vivek

> 
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
> > 
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


