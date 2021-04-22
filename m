Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74E367DC5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:34:59 +0200 (CEST)
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVje-0001Ee-Dh
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZVgw-00006z-Jj
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZVgq-0002tB-PO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619083924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0y1gTf3qk2k0CjD+2fI5LJeLLUPqpHFrHe/kX1HnnsE=;
 b=i1dkbMhw2lbxBQCgFY3rSrNQZa/vGWz4IW5LS7h+bcY15ohQUZQBHfScot7n1/KatS1ntv
 u+1otVJurN805u9aG0lMmeymt2CrcT+YR9iDYFIqYSz/p811M3PTVR0+EdjLQ8LSB8jh86
 HlLvW6+ub0QO4p54DtLkRDnsTl8cqsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-aukeWkUaOwm6T_ky3D4b8Q-1; Thu, 22 Apr 2021 05:32:02 -0400
X-MC-Unique: aukeWkUaOwm6T_ky3D4b8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBE51006C80;
 Thu, 22 Apr 2021 09:32:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EC25D9D3;
 Thu, 22 Apr 2021 09:31:56 +0000 (UTC)
Date: Thu, 22 Apr 2021 11:31:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 2/3] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
Message-ID: <YIFCi1vJR4jpMJ1r@merkur.fritz.box>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
 <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
 <YIBDlEQ0AlRc9r0y@merkur.fritz.box>
 <88b9912e-97d3-f18a-b3cc-7891f3c55e3a@yandex-team.ru>
 <20210421155929-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210421155929-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>, yc-core@yandex-team.ru,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.04.2021 um 21:59 hat Michael S. Tsirkin geschrieben:
> On Wed, Apr 21, 2021 at 07:13:24PM +0300, Denis Plotnikov wrote:
> > 
> > On 21.04.2021 18:24, Kevin Wolf wrote:
> > > Am 25.03.2021 um 16:12 hat Denis Plotnikov geschrieben:
> > > > Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
> > > > introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
> > > > because of connection problems with vhost-blk daemon.
> > > > 
> > > > However, it introdues a new problem. Now, any communication errors
> > > > during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
> > > > lead to qemu abort on assert in vhost_dev_get_config().
> > > > 
> > > > This happens because vhost_user_blk_disconnect() is postponed but
> > > > it should have dropped s->connected flag by the time
> > > > vhost_user_blk_device_realize() performs a new connection opening.
> > > > On the connection opening, vhost_dev initialization in
> > > > vhost_user_blk_connect() relies on s->connection flag and
> > > > if it's not dropped, it skips vhost_dev initialization and returns
> > > > with success. Then, vhost_user_blk_device_realize()'s execution flow
> > > > goes to vhost_dev_get_config() where it's aborted on the assert.
> > > > 
> > > > To fix the problem this patch adds immediate cleanup on device
> > > > initialization(in vhost_user_blk_device_realize()) using different
> > > > event handlers for initialization and operation introduced in the
> > > > previous patch.
> > > > On initialization (in vhost_user_blk_device_realize()) we fully
> > > > control the initialization process. At that point, nobody can use the
> > > > device since it isn't initialized and we don't need to postpone any
> > > > cleanups, so we can do cleaup right away when there is a communication
> > > > problem with the vhost-blk daemon.
> > > > On operation we leave it as is, since the disconnect may happen when
> > > > the device is in use, so the device users may want to use vhost_dev's data
> > > > to do rollback before vhost_dev is re-initialized (e.g. in vhost_dev_set_log()).
> > > > 
> > > > Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> > > > Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > I think there is something wrong with this patch.
> > > 
> > > I'm debugging an error case, specifically num-queues being larger in
> > > QEMU that in the vhost-user-blk export. Before this patch, it has just
> > > an unfriendly error message:
> > > 
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Unexpected end-of-file before all data were read
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Failed to read msg header. Read 0 instead of 12. Original request 24.
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: vhost-user-blk: get block config failed
> > > qemu-system-x86_64: Failed to set msg fds.
> > > qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temporarily unavailable (11)
> > > 
> > > After the patch, it crashes:
> > > 
> > > #0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
> > > #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
> > > #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> > > #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
> > > #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
> > > #5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
> > > #6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
> > > #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
> > > #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
> > > #9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
> > > 
> > > The problem is that vhost_user_read_cb() still accesses dev->opaque even
> > > though the device has been cleaned up meanwhile when the connection was
> > > closed (the vhost_user_blk_disconnect() added by this patch), so it's
> > > NULL now. This problem was actually mentioned in the comment that is
> > > removed by this patch.
> > > 
> > > I tried to fix this by making vhost_user_read() cope with the fact that
> > > the device might have been cleaned up meanwhile, but then I'm running
> > > into the next set of problems.
> > > 
> > > The first is that retrying is pointless, the error condition is in the
> > > configuration, it will never change.
> > > 
> > > The other is that after many repetitions of the same error message, I
> > > got a crash where the device is cleaned up a second time in
> > > vhost_dev_init() and the virtqueues are already NULL.
> > > 
> > > So it seems to me that erroring out during the initialisation phase
> > > makes a lot more sense than retrying.
> > > 
> > > Kevin
> > 
> > But without the patch there will be another problem which the patch actually
> > addresses.
> > 
> > It seems to me that there is a case when the retrying is useless and this is
> > exactly your case -- we'll never get a proper configuration.
> > 
> > What if we get rid of the re-connection and give the only try to realize the
> > device? Than we don't need case separating for initialization and operation
> > of device, correct? But I don't familiar with the cases where the reconnect
> > is needed? Do you know something it?
> 
> Reconnect is for when server is restarted while we are talking to it.

Sure, and that makes sense once the device has actually been realized.
But do we really have a use case for reconnecting during initialisation?
Commit 77542d43149 seems to just have added both at once, without
explaining in the commit message what the reason for this decision is.

The problem here is that we can't seem to tell what is a fatal error and
what is just a server restart. Fatal errors just seem much more likely
during device initialisation and turning them into endless loops in
vhost_user_blk_device_realize() is probably not a great idea.

Either way, we have a use-after-free in the error case and that needs
fixing once we have decided on the intended behaviour.

(The real fix for my num-queues error is of course checking the number
explicitly instead of making invalid requests, and this would hide the
bug we're discussing here, but I assume that more error cases like this
exist.)

Unrelated to the bug, I also wonder why the reconnection logic was
implemented specifically in vhost-user-blk. Isn't this something that
should apply to all vhost-user devices? Possibly with some callbacks for
device specific logic?

Kevin


