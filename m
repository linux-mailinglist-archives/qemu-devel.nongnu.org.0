Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DF37F403
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:28:03 +0200 (CEST)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6hO-0005NC-W9
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lh6g5-0004PO-9u
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lh6g0-000132-RR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620894394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nibr0W2FoUiYbsC6Or3e6j8+kvxv7oLVcYROcNwipQU=;
 b=U4fAS01AP2yImpoHD1sjmOgAPMd4kakNVpd1RxpH9O2oajZNBNzHEQkcM8BJGDNIel6iuT
 NWeJTJitSq0S1SeM1ywuh3UrS7tFftZUApsKvZJaKN46vgD/s8nBE93rSnmfkrR/ljqnV9
 r0f/EKZH+BfaASMqUn9OUl0SMmAZE7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-p0EzlBafPsWxvCMZ1yABWA-1; Thu, 13 May 2021 04:26:31 -0400
X-MC-Unique: p0EzlBafPsWxvCMZ1yABWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 210BB6D4F9;
 Thu, 13 May 2021 08:26:30 +0000 (UTC)
Received: from work-vm (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 509B56E407;
 Thu, 13 May 2021 08:26:25 +0000 (UTC)
Date: Thu, 13 May 2021 09:26:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [Virtio-fs] host-user reconnection and crash recovery
Message-ID: <YJzirr/g1DlZr4X8@work-vm>
References: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
 <CAFQAk7jhNzMqh9VcsxUmsqxM25K=cR546hpNUY+5M50-UHSg-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFQAk7jhNzMqh9VcsxUmsqxM25K=cR546hpNUY+5M50-UHSg-A@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.636, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Yongji Xie <xieyongji@bytedance.com>, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, fam.zheng@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jiachen Zhang (zhangjiachen.jaycee@bytedance.com) wrote:
> Hi Stefan and Sebastien,
> 
> I think I should give some background context from my perspective.
> 
> For the virtiofsd crash reconnection (recovery) to QEMU, as said by
> Stefan, we discussed the possible implementation on the bi-weekly virtio-fs
> call. I had also sent an RFC patch to the virtio-fs mail-list (
> https://patchwork.kernel.org/project/qemu-devel/cover/20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com/),
> we also have some discussion on the further revision direction in that
> mail.
> 
> We also have some needs to support virtiofsd crash recovery when it is used
> with cloud-hypervisor (https://github.com/cloud-hypervisor/cloud-hypervisor).
> However, the virtiofsd crash reconnection RFC patch relies on
> QEMU's vhost-user socket reconnection feature and QEMU's vhost-user
> inflight I/O tracking feature, which are both not supported by
> cloud-hypervisor.
> 
> So I also issued an initial pull-request of cloud-hypervisor vhost-user
> socket reconnection (
> https://github.com/cloud-hypervisor/cloud-hypervisor/pull/2387), which is
> reviewed by Sebastien. Based on vhost-user socket reconnection, we also
> want to further develop vhost-user inflight I/O tracking feature for
> cloud-hypervisor, and finally to support virtiofsd crash reconnection.
> 
> I am sorry for the delayed patch-revision of the two patch sets. I hope I
> can free up some time in these two months to make some further progress.

I'm curious what your use case is for virtiofsd crash
recovery/reconnection - is there some reason you expect the daemon to
crash or need to be restarted more than the whole VM?

In the case of vhost-user networking with dpdk I can see the case where
there is a central networking switch process shared between many VMs; so
wanting to restart that without restarting all the VMs makes sense to
me; where each VM has it's own virtiofsd I don't understand the use as
much.

Dave

> All the best,
> Jiachen
> 
> On Tue, May 11, 2021 at 11:02 PM Boeuf, Sebastien <sebastien.boeuf@intel.com>
> wrote:
> 
> > Hi Stefan,
> >
> > Thanks for the explanation.
> >
> > So reconnection for vhost-user is not a well defined behavior,
> > and QEMU is doing its best to retry when possible, depending
> > on each device.
> >
> > The guest does not know about it, so it's never notified that
> > the device needs to be reset.
> >
> > But what about the vhost-user backend initialization? Does
> > QEMU go again through initializing memory table, vrings, etc...
> > since it can't assume anything from the backend?
> >
> > Thanks,
> > Sebastien
> >
> > ------------------------------
> > *From:* Stefan Hajnoczi
> > *Sent:* Tuesday, May 11, 2021 2:45 PM
> > *To:* Boeuf, Sebastien
> > *Cc:* virtio-fs@redhat.com; qemu-devel@nongnu.org
> > *Subject:* vhost-user reconnection and crash recovery
> >
> > Hi Sebastien,
> > On #virtio-fs IRC you asked:
> >
> >  I have a vhost-user question regarding disconnection/reconnection. How
> >  should this be handled? Let's say the vhost-user backend disconnects,
> >  and reconnects later on, does QEMU reset the virtio device by notifying
> >  the guest? Or does it simply reconnects to the backend without letting
> >  the guest know about what happened?
> >
> > The vhost-user protocol does not have a generic reconnection solution.
> > Reconnection is handled on a case-by-case basis because device-specific
> > and implementation-specific state is involved.
> >
> > The vhost-user-fs-pci device in QEMU has not been tested with
> > reconnection as far as I know.
> >
> > The ideal reconnection behavior is to resume the device from its
> > previous state without disrupting the guest. Device state must survive
> > reconnection in order for this to work. Neither QEMU virtiofsd nor
> > virtiofsd-rs implement this today.
> >
> > virtiofs has a lot of state, making it particularly difficult to support
> > either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We
> > have discussed virtiofs crash recovery on the bi-weekly virtiofs call
> > (https://etherpad.opendev.org/p/virtiofs-external-meeting). If you want
> > to work on this then joining the call would be a good starting point to
> > coordinate with others.
> >
> > One approach for transparent crash recovery is for virtiofsd to keep its
> > state in tmpfs (e.g. inode/fd mappings) and open fds shared with a
> > clone(2) process via CLONE_FILES. This way the virtiofsd process can
> > terminate but its state persists in memory thanks to its clone process.
> > The clone can then be used to launch the new virtiofsd process from the
> > old state. This would allow the device to resume transparently with QEMU
> > only reconnecting the vhost-user UNIX domain socket. This is an idea
> > that we discussed in the bi-weekly virtiofs call.
> >
> > You mentioned device reset. VIRTIO 1.1 has the Device Status Field
> > DEVICE_NEEDS_RESET flat that the device can use to tell the driver that
> > a reset is necessary. This feature is present in the specification but
> > not implemented in the Linux guest drivers. Again the reason is that
> > handling it requires driver-specific logic for restoring state after
> > reset...otherwise the device reset would be visible to userspace.
> >
> > Stefan
> >
> > ---------------------------------------------------------------------
> > Intel Corporation SAS (French simplified joint stock company)
> > Registered headquarters: "Les Montalets"- 2, rue de Paris,
> > 92196 Meudon Cedex, France
> > Registration Number:  302 456 199 R.C.S. NANTERRE
> > Capital: 4,572,000 Euros
> >
> > This e-mail and any attachments may contain confidential material for
> > the sole use of the intended recipient(s). Any review or distribution
> > by others is strictly prohibited. If you are not the intended
> > recipient, please contact the sender and delete all copies.
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/virtio-fs
> >

> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


