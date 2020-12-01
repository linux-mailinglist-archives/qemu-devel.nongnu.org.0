Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695872CAFE7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 23:24:19 +0100 (CET)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkE4I-0006x3-0s
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 17:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkE1x-0005Jz-7J
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkE1u-0007zC-7y
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606861308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVHbILCQsLypCAGfHmK5wLqaUC5ajBuCpCOwuNfb+gQ=;
 b=Wb5wMCrdcYh79ehHEt7ET1ipO5rB9dBVPy8E89dXhcOuW2GEi8On/RMaTSKmQiQRrHkl1d
 9Xl5Ni0DyrdMaVblY6yAM8IVcGQ/4n2W8WmR2tleHmSvTh4cNdCNepwJwekdBlLv4M0iGb
 y+PAVR53Mf9QpTFv8ZRHi3lh0pyD9rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-TiF-PWhuPfaOc3ikwwF_vA-1; Tue, 01 Dec 2020 17:21:46 -0500
X-MC-Unique: TiF-PWhuPfaOc3ikwwF_vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E53F3E747;
 Tue,  1 Dec 2020 22:21:44 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D25F5C1B4;
 Tue,  1 Dec 2020 22:21:39 +0000 (UTC)
Date: Tue, 1 Dec 2020 15:21:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201201152139.0a7de6aa@w520.home>
In-Reply-To: <44d9da84-a5ae-9637-d497-e92c446d04e3@huawei.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com>
 <20201123144622.75a18812@w520.home>
 <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
 <20201130100337.4afe8eb4@w520.home>
 <44d9da84-a5ae-9637-d497-e92c446d04e3@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 14:37:52 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2020/12/1 1:03, Alex Williamson wrote:
> > On Thu, 26 Nov 2020 14:56:17 +0800
> > Shenming Lu <lushenming@huawei.com> wrote:
> >   
> >> Hi,
> >>
> >> After reading everyone's opinions, we have a rough idea for this issue.
> >>
> >> One key point is whether it is necessary to setup the config space before
> >> the device can accept further migration data. I think it is decided by
> >> the vendor driver, so we can simply ask the vendor driver about it in
> >> .save_setup, which could avoid a lot of unnecessary copies and settings.
> >> Once we have known the need, we can iterate the config space (before)
> >> along with the device migration data in .save_live_iterate and
> >> .save_live_complete_precopy, and if not needed, we can only migrate the
> >> config space in .save_state.
> >>
> >> Another key point is that the interrupt enabling should be after the
> >> restoring of the interrupt controller (might not only interrupts).
> >> My solution is to add a subflag at the beginning of the config data
> >> (right after VFIO_MIG_FLAG_DEV_CONFIG_STATE) to indicate the triggered
> >> actions on the dst (such as whether to enable interrupts).
> >>
> >> Below is it's workflow.
> >>
> >> On the save path:
> >> 	In vfio_save_setup():
> >> 	Ask the vendor driver if it needs the config space setup before it
> >> 	can accept further migration data.  
> > 
> > How does "ask the vendor driver" actually work?  
> 
> Maybe via a ioctl?
> Oh, it seems that we have to ask the dst vendor driver (in vfio_load_setup)
> and send the config data (before) along with the device migration data
> every time?...

Migration data streams are unidirectional, otherwise we break offline
migration.  There are various ways other than an ioctl for a vendor
driver to advertise requirements, ex. a capability on the migration
region info, but it's not clear to me that we really need this info yet.

> >> 		|
> >> 	In vfio_save_iterate() (pre-copy):
> >> 	If *needed*, save the config space which would be setup on the dst
> >> 	before the migration data, but send with a subflag to instruct not
> >> 	to (such as) enable interrupts.  
> > 
> > If not for triggering things like MSI/X configuration, isn't config
> > space almost entirely virtual?  What visibility does the vendor driver
> > have to the VM machine dependencies regarding device interrupt versus
> > interrupt controller migration?  
> 
> My thought is that the vendor driver only decides the order of the config
> space setup and the receiving of the migration data, but leaves the VM
> machine dependencies to QEMU.

But again, config space is largely virtual, the vendor driver doesn't
have access to it, it's only the effects of config space, like
representing the interrupt mode and configuring it on the device or
specific registers that QEMU writes through that the vendor driver
sees.  So how is it that the vendor driver decides the order?  The
vendor driver doesn't have visibility to the VM machine dependencies,
like when the interrupt controller is sufficiently configured to enable
device interrupts.  It seems that a vendor driver that depends on QEMU
enabling interrupts at a specific point is inherently dependent on
assumptions in the machine configuration.

> >> 		|
> >> 	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
> >> 	The same as that in vfio_save_iterate().
> >> 		|
> >> 	In .save_state (stop-and-copy, non-iterable process):
> >> 	If *needed*, only send a subflag to instruct to enable interrupts.
> >> 	If *not needed*, save the config space and setup everything on the dst.  
> > 
> > Again, how does the vendor driver have visibility to know when the VM
> > machine can enable interrupts?  
> 
> It seems troubling if the vendor driver needs the interrupts to be enabled
> first...

Yes.

> >> Besides the above idea, we might be able to choose to let the vendor driver do
> >> more: qemu just sends and writes the config data (before) along with the device
> >> migration data every time, and it's up to the vendor driver to filter out/buffer
> >> the received data or reorder the settings...  
> > 
> > There is no vendor driver in QEMU though, so are you suggesting that
> > QEMU follows a standard protocol and the vendor driver chooses when to
> > enable specific features?  For instance, QEMU would call SET_IRQS and
> > the driver would return success, but defer that setup if necessary?
> > That seems quite troubling as we then have ioctls that behave
> > differently depending on the device state and we have no error path to
> > userspace should that setup fail later.  The vendor driver does have
> > its own data stream for migration, so the vendor driver could tell the
> > destination version of itself what type of interrupt to use, which
> > might be sufficient if we were to ignore the latency if QEMU were to
> > defer interrupt setup until stop-and-copy.  
> 
> Did you mean that we could only enable MSI-X during the iterable phase, but
> leave the setup of these unmasked vectors to the non-iterable phase?
> It looks good to me.

On x86 the vfio SET_IRQS ioctl is independent of the VM interrupt
setup, so we could decouple configuring the device interrupts from
plumbing them through the VM.  However, doesn't ARM64 require mapping
an MSI doorbell page via vfio?  Where does is that configured during the
machine load versus the device iterative phase?

> > Is the question of when to setup device interrupts versus the interrupt
> > controller state largely a machine issue within QEMU?  If so, shouldn't
> > it be at QEMU's determination when to act on the config space
> > information on the target?  
> 
> I think it would be simpler if ensuring the proper calling order in QEMU...
> 
> > IOW, if a vendor driver has a dependency on
> > interrupt configuration, they need to include it in their own pre-copy
> > data stream and decouple that dependency from userspace interrupt
> > configuration via the SET_IRQS ioctl.  Is that possible?  Thanks,
> >   
> 
> I don't understand what the decoupling that dependency from userspace
> interrupt configuration means...

I mean that the vendor driver cannot depend on when QEMU calls
SET_IRQS, the vendor specific migration stream contains any information
the vendor driver needs about interrupt configuration such that QEMU
can call SET_IRQS whenever it chooses.  Thanks,

Alex


