Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC73089C9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:13:37 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VSr-0000rX-32
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VRW-0000Pp-OC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VRU-0004uo-3x
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611933131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHJ2OrTS7UwY6TYrufBmOhDg6waDZoSncmc1lQE0EU8=;
 b=jDuEcGgdEhahv3JpSwgWY/GvPYfvItNOK/86ajix+HDYTK8rQbPw5MsPtV08NHiMn4yO3w
 GSgpQFwF0dsigQByfjoQrhqjT6t9TPC+5ueXPy775twy0OEHuQZw/XEPa8IG05Y2sgJzL8
 I0LzFPArhvrFWhBOaI2VwlkQ/Dpgisg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-HADTVujMPl6QwEo3Q-drfQ-1; Fri, 29 Jan 2021 10:12:09 -0500
X-MC-Unique: HADTVujMPl6QwEo3Q-drfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85485AFA81
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:12:07 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-45.rdu2.redhat.com [10.10.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 180CA5C1B4;
 Fri, 29 Jan 2021 15:11:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A9ED9220BCF; Fri, 29 Jan 2021 10:11:55 -0500 (EST)
Date: Fri, 29 Jan 2021 10:11:55 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/6] qemu, vhost-user: Extend protocol to
 start/stop/flush slave channel
Message-ID: <20210129151155.GD3146@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-5-vgoyal@redhat.com>
 <20210128165234.GC20377@stefanha-x1.localdomain>
 <20210129141600.GA3146@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210129141600.GA3146@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 09:16:00AM -0500, Vivek Goyal wrote:
> On Thu, Jan 28, 2021 at 04:52:34PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Jan 25, 2021 at 01:01:13PM -0500, Vivek Goyal wrote:
> > > Currently we don't have a mechanism to flush slave channel while shutting
> > > down vhost-user device and that can result a deadlock. Consider following
> > > scenario.
> > > 
> > > 1. Slave gets a request from guest on virtqueue (say index 1, vq1), to map
> > >    a portion of file in qemu address space.
> > > 
> > > 2. Thread serving vq1 receives this request and sends a message to qemu on
> > >    slave channel/fd and gets blocked in waiting for a response from qemu.
> > > 
> > > 3. In the mean time, user does "echo b > /proc/sysrq-trigger" in guest. This
> > >    leads to qemu reset and ultimately in main thread we end up in
> > >    vhost_dev_stop() which is trying to shutdown virtqueues for the device.
> > > 
> > > 4. Slave gets VHOST_USER_GET_VRING_BASE message to shutdown a virtqueue on
> > >    unix socket being used for communication.
> > > 
> > > 5. Slave tries to shutdown the thread serving vq1 and waits for it to
> > >    terminate. But vq1 thread can't terminate because it is waiting for
> > >    a response from qemu on slave_fd. And qemu is not processing slave_fd
> > >    anymore as qemu is ressing (and not running main event loop anymore)
> > >    and is waiting for a response to VHOST_USER_GET_VRING_BASE.
> > > 
> > > So we have a deadlock. Qemu is waiting on slave to response to
> > > VHOST_USER_GET_VRING_BASE message and slave is waiting on qemu to
> > > respond to request it sent on slave_fd.
> > > 
> > > I can reliably reproduce this race with virtio-fs.
> > > 
> > > Hence here is the proposal to solve this problem. Enhance vhost-user
> > > protocol to properly shutdown slave_fd channel. And if there are pending
> > > requests, flush the channel completely before sending the request to
> > > shutdown virtqueues.
> > > 
> > > New workflow to shutdown slave channel is.
> > > 
> > > - Qemu sends VHOST_USER_STOP_SLAVE_CHANNEL request to slave. It waits
> > >   for an reply from guest.
> > > 
> > > - Then qemu sits in a tight loop waiting for
> > >   VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message from slave on slave_fd.
> > >   And while waiting for this message, qemu continues to process requests
> > >   on slave_fd to flush any pending requests. This will unblock threads
> > >   in slave and allow slave to shutdown slave channel.
> > > 
> > > - Once qemu gets VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message, it knows
> > >   no more requests will come on slave_fd and it can continue to shutdown
> > >   virtqueues now.
> > > 
> > > - Once device starts again, qemu will send VHOST_USER_START_SLAVE_CHANNEL
> > >   message to slave to open the slave channel and receive requests.
> > > 
> > > IOW, this allows for proper shutdown of slave channel, making sure
> > > no threads in slave are blocked on sending/receiving message. And
> > > this in-turn allows for shutting down of virtqueues, hence resolving
> > > the deadlock.
> > 
> > Is the new message necessary?
> 
> Hi Stefan,
> 
> It probably is not necessary but it feels like a cleaner and simpler
> solution.
> 
> There slave is a separate channel from virtqueues. And if device is
> stopping, we want to make sure there are no pending requests in
> slave channel. It is possible that virtqueue shutodwn is successful
> but other entity could still be sending messages on slave channel. In
> that case, shall we say device shutdown complete and stop polling
> slave channel?
> 
> IOW, the way we have explicit protocol messages to shutdown each
> vring, it makes sense to have explicit protocol message to shutdown
> slave channel as well. Right now there is no mechanism to do that.
> 

Thinking more from "slave" point of view. It might have a separate thread
to send messages on slave channel. It has no idea when to stop sending
messages on slave channel, as there is no mechanism to shutdown slave.
Only method seems to be that master will close slave fd and that
will close connection.

That means if a device is being stopped (and not removed), then it
is possible virtqueues got stopped but a thread in slave is blocked
on slave channel (recvmsg()) and expecting a response back.

That's why I think enhancing protocol to explicitly shutdown slave
channel makes sense. Instead of assuming that stopping a virtuqueue
should automatically mean slave channel is stopped.

Vivek



> IMHO, introducing an explicit mechanism in protocol to shutdown
> slave channel feels better as compared to say keep on serving
> slave channel in parallel while waiting for virtuqueues to shutdown
> and stop serving slave as soon as last virtuqueue is stopped (there
> could still be pending slave message right after last virtuqueue
> got shutdown).
> 
> 
> > How about letting QEMU handle slave fd
> > activity while waiting for virtqueues to stop instead?
> > 
> > In other words, QEMU should monitor both the UNIX domain socket and the
> > slave fd after it has sent VHOST_USER_GET_VRING_BASE and is awaiting the
> > response.
> 
> I can give it a try. If there is a strong preference for this solution.
> I guess I can patch vhost_user_get_vring_base() to poll and serve both
> unix domain socket and slave fd.
> 
> But at this point of time I do think that adding a mechanism to shutodwn
> slave channel (the way we have mechanism to shutdown vring), sounds
> better from design point of view.
> 
> Vivek


