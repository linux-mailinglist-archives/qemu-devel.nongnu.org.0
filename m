Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9142D3EB8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:29:38 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvmz-0004Jo-IQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kmvkq-0002vv-Cu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kmvkn-0008Ib-QT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkbNrnwLg4MCQBfK6YxYOGZihNEG5026HVI+jw2DPYc=;
 b=JX4MHBuEbQh/7Y98SqMTipZ2X9rCcZJOsTgKOduTzk+FvGFrsZ7/OozxWMQCyW/Iq6eUMW
 UrQwv/0hxH7kfIAnuhMwq8YYinvE2rLINGRWmItUev+G1WYln+htqAbYRk88kHwwgcN5lJ
 JhzKqWDVQtNMG4A7NdRYvLWlzax80Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-_4IPs0VPO1es2zo-zKkK4w-1; Wed, 09 Dec 2020 04:27:13 -0500
X-MC-Unique: _4IPs0VPO1es2zo-zKkK4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B981005504;
 Wed,  9 Dec 2020 09:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F71D18E59;
 Wed,  9 Dec 2020 09:27:10 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 852DF4BB7B;
 Wed,  9 Dec 2020 09:27:09 +0000 (UTC)
Date: Wed, 9 Dec 2020 04:26:50 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <1410217602.34486578.1607506010536.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201208093715.GX203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201208093715.GX203660@stefanha-x1.localdomain>
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.68.5.20, 10.4.195.18]
Thread-Topic: vDPA software assisted live migration
Thread-Index: UAk5pFR+aaXpJfnw1iW4417H+q8oRQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>,
 Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>,
 Lars Ganrot <lars.ganrot@gmail.com>, Rob Miller <rob.miller@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Howard Cai <howard.cai@gmail.com>,
 Parav Pandit <parav@mellanox.com>, vm <vmireyno@marvell.com>,
 Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

----- Original Message -----
> On Fri, Nov 20, 2020 at 07:50:38PM +0100, Eugenio P=C3=A9rez wrote:
> > This series enable vDPA software assisted live migration for vhost-net
> > devices. This is a new method of vhost devices migration: Instead of
> > relay on vDPA device's dirty logging capability, SW assisted LM
> > intercepts dataplane, forwarding the descriptors between VM and device.
>=20
> Pros:
> + vhost/vDPA devices don't need to implement dirty memory logging
> + Obsoletes ioctl(VHOST_SET_LOG_BASE) and friends
>=20
> Cons:
> - Not generic, relies on vhost-net-specific ioctls
> - Doesn't support VIRTIO Shared Memory Regions
>   https://github.com/oasis-tcs/virtio-spec/blob/master/shared-mem.tex

I may miss something but my understanding is that it's the
responsiblity of device to migrate this part?

> - Performance (see below)
>=20
> I think performance will be significantly lower when the shadow vq is
> enabled. Imagine a vDPA device with hardware vq doorbell registers
> mapped into the guest so the guest driver can directly kick the device.
> When the shadow vq is enabled a vmexit is needed to write to the shadow
> vq ioeventfd, then the host kernel scheduler switches to a QEMU thread
> to read the ioeventfd, the descriptors are translated, QEMU writes to
> the vhost hdev kick fd, the host kernel scheduler switches to the vhost
> worker thread, vhost/vDPA notifies the virtqueue, and finally the
> vDPA driver writes to the hardware vq doorbell register. That is a lot
> of overhead compared to writing to an exitless MMIO register!

I think it's a balance. E.g we can poll the virtqueue to have an
exitless doorbell.

>=20
> If the shadow vq was implemented in drivers/vhost/ and QEMU used the
> existing ioctl(VHOST_SET_LOG_BASE) approach, then the overhead would be
> reduced to just one set of ioeventfd/irqfd. In other words, the QEMU
> dirty memory logging happens asynchronously and isn't in the dataplane.
>=20
> In addition, hardware that supports dirty memory logging as well as
> software vDPA devices could completely eliminate the shadow vq for even
> better performance.

Yes. That's our plan. But the interface might require more thought.

E.g is the bitmap a good approach? To me reporting dirty pages via
virqueue is better since it get less footprint and is self throttled.

And we need an address space other than the one used by guest for
either bitmap for virtqueue.

>=20
> But performance is a question of "is it good enough?". Maybe this
> approach is okay and users don't expect good performance while dirty
> memory logging is enabled.

Yes, and actually such slow down may help for the converge of the
migration.

Note that the whole idea is try to have a generic solution for all
types of devices. It's good to consider the performance but for the
first stage, it should be sufficient to make it work and consider to
optimize on top.

> I just wanted to share the idea of moving the
> shadow vq into the kernel in case you like that approach better.

My understanding is to keep kernel as simple as possible and leave the
polices to userspace as much as possible. E.g it requires us to
disable doorbell mapping and irq offloading, all of which were under
the control of userspace.

Thanks

>=20
> Stefan
>


