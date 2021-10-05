Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AD422F5F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:49:17 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoZ2-0005At-FS
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mXn1R-000898-QC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mXn1N-0003jP-Pg
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633450224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jHU1fPYSkgh884EYz9bMT9VIm2vdXxi9WgIE1XOXCk=;
 b=BhV5lq5uuT6VCAe02lTuzzYU6jW9kGOVDuKHVZ57xnnUo3MCLHXZX2rpKHUUGh0HTxb+XJ
 OjL9MGViO5PNgpMBF7usI2WefyX/mE5towgzpD4zpI2D5JK7GnO3v2Fs79DHKUywk7jKnx
 Wyu6714iGEAwE/IQqA+6voYlLT0Bhic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-7vUOvyuVN72Z2AOIWliGxg-1; Tue, 05 Oct 2021 12:10:23 -0400
X-MC-Unique: 7vUOvyuVN72Z2AOIWliGxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314D98015C7;
 Tue,  5 Oct 2021 16:10:22 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D95E4779C2;
 Tue,  5 Oct 2021 16:10:08 +0000 (UTC)
Date: Tue, 5 Oct 2021 12:10:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
MIME-Version: 1.0
In-Reply-To: <YVxaodahFBOvANL0@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: kwolf@redhat.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 Roman Kagan <rvkagan@yandex-team.ru>, yc-core@yandex-team.ru,
 pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 03:01:05PM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Tue, Oct 05, 2021 at 02:18:40AM +0300, Roman Kagan wrote:
> > > On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> > > > On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > > > > It might be useful for the cases when a slow block layer should be replaced
> > > > > with a more performant one on running VM without stopping, i.e. with very low
> > > > > downtime comparable with the one on migration.
> > > > > 
> > > > > It's possible to achive that for two reasons:
> > > > > 
> > > > > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> > > > >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> > > > >   each other in the values of migration service fields only.
> > > > > 2.The device driver used in the guest is the same: virtio-blk
> > > > > 
> > > > > In the series cross-migration is achieved by adding a new type.
> > > > > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > > > > VMstate, also it implements migration save/load callbacks to be compatible
> > > > > with migration stream produced by "virtio-blk" device.
> > > > > 
> > > > > Adding the new type instead of modifying the existing one is convenent.
> > > > > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > > > > device from the existing non-compatible one using qemu machinery without any
> > > > > other modifiactions. That gives all the variety of qemu device related
> > > > > constraints out of box.
> > > > 
> > > > Hmm I'm not sure I understand. What is the advantage for the user?
> > > > What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> > > > We could add some hacks to make it compatible for old machine types.
> > > 
> > > The point is that virtio-blk and vhost-user-blk are not
> > > migration-compatible ATM.  OTOH they are the same device from the guest
> > > POV so there's nothing fundamentally preventing the migration between
> > > the two.  In particular, we see it as a means to switch between the
> > > storage backend transports via live migration without disrupting the
> > > guest.
> > > 
> > > Migration-wise virtio-blk and vhost-user-blk have in common
> > > 
> > > - the content of the VMState -- VMSTATE_VIRTIO_DEVICE
> > > 
> > > The two differ in
> > > 
> > > - the name and the version of the VMStateDescription
> > > 
> > > - virtio-blk has an extra migration section (via .save/.load callbacks
> > >   on VirtioDeviceClass) containing requests in flight
> > > 
> > > It looks like to become migration-compatible with virtio-blk,
> > > vhost-user-blk has to start using VMStateDescription of virtio-blk and
> > > provide compatible .save/.load callbacks.  It isn't entirely obvious how
> > > to make this machine-type-dependent, so we came up with a simpler idea
> > > of defining a new device that shares most of the implementation with the
> > > original vhost-user-blk except for the migration stuff.  We're certainly
> > > open to suggestions on how to reconcile this under a single
> > > vhost-user-blk device, as this would be more user-friendly indeed.
> > > 
> > > We considered using a class property for this and defining the
> > > respective compat clause, but IIUC the class constructors (where .vmsd
> > > and .save/.load are defined) are not supposed to depend on class
> > > properties.
> > > 
> > > Thanks,
> > > Roman.
> > 
> > So the question is how to make vmsd depend on machine type.
> > CC Eduardo who poked at this kind of compat stuff recently,
> > paolo who looked at qom things most recently and dgilbert
> > for advice on migration.
> 
> I don't think I've seen anyone change vmsd name dependent on machine
> type; making fields appear/disappear is easy - that just ends up as a
> property on the device that's checked;  I guess if that property is
> global (rather than per instance) then you can check it in
> vhost_user_blk_class_init and swing the dc->vmsd pointer?

class_init can be called very early during QEMU initialization,
so it's too early to make decisions based on machine type.

Making a specific vmsd appear/disappear based on machine
configuration or state is "easy", by implementing
VMStateDescription.needed.  But this would require registering
both vmsds (one of them would need to be registered manually
instead of using DeviceClass.vmsd).

I don't remember what are the consequences of not using
DeviceClass.vmsd to register a vmsd, I only remember it was
subtle.  See commit b170fce3dd06 ("cpu: Register
VMStateDescription through CPUState") and related threads.  CCing
Philippe, who might remember the details here.

If that's an important use case, I would suggest allowing devices
to implement a DeviceClass.get_vmsd method, which would override
DeviceClass.vmsd if necessary.  Is the problem we're trying to
address worth the additional complexity?

-- 
Eduardo


