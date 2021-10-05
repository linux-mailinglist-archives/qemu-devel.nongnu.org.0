Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F764229F8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:03:34 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXl2a-00005P-Np
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXl0b-00076a-M1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXl0M-0000nU-IC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633442472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aL9eIHISW0s/oBd3/e2V1+b+8cA3ZLtQRday8hnOxzU=;
 b=NKtNRdUNMj1jWYts17caYE7DadwZMi0wMMrTCW1NicZyJ4u0yoU1t46NTIhqJRJupAjhZr
 cMGJEtyz4XFV6U2VlS8X40lM3OHE4j/Dge/ExW10kMFYdPE4VMSKrqrgkML/i+c0hHCEr6
 /LMtsEnrFns81U5j9+FAj39aAx+UQbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-f97fH5UoNdqpXhrK8ZwoBA-1; Tue, 05 Oct 2021 10:01:10 -0400
X-MC-Unique: f97fH5UoNdqpXhrK8ZwoBA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so2737439wrc.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 07:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aL9eIHISW0s/oBd3/e2V1+b+8cA3ZLtQRday8hnOxzU=;
 b=rQCTbstdWMksunFVUJZUwIcfUp4udgkpiTS9mTLpduaheGMY7LVsSGVyieSywxDfES
 ieMtoRBO8XMbPxb7tBZdUMwNfbcDr5pO3WGMHDwWlv1UotIRnhypAjGzn1J3Ezwi1WsW
 fC9QayNP5DqmAsJMktxmvgF0TxzB+6LpWVTsW3qA8Y4AzPA6O5T4XYCGK8+9M8kOARlA
 097SUvJSwAzC03ZY2wqENtrSsBC5lEd7D68eKldKm0jhwM3qE2HCaLOyyH9nZmyATZiF
 xK7hmn/DOECKc+obZNq+Cq0QTDsj853PzNiug49rNJMLcdDeWQrA0akOTYrDOpvC1yyF
 wpog==
X-Gm-Message-State: AOAM533o3my83xhaO5tUyGRJdh8tFk3/Lqv9O3llTxpPmean23VKrBAT
 El8L7DrOyF27JvvMVMsKnZRA5cY/CSjTfDIEeXypHFCDOthSSF0Byhg03iFCw2SV2uynwD+7cf0
 SMeWIS26plITk5nA=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr3537489wmc.19.1633442469122;
 Tue, 05 Oct 2021 07:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoyQ6ae0kGy4/Nz0roHIkQGYL3tslRU5gye16ot+6aviUULw7lOJkQz3wj9FvUbiTAoKbkYQ==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr3537433wmc.19.1633442468698;
 Tue, 05 Oct 2021 07:01:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id y11sm21757225wrg.18.2021.10.05.07.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:01:07 -0700 (PDT)
Date: Tue, 5 Oct 2021 15:01:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YVxaodahFBOvANL0@work-vm>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211005024754-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 raphael.norwitz@nutanix.com, Roman Kagan <rvkagan@yandex-team.ru>,
 yc-core@yandex-team.ru, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Tue, Oct 05, 2021 at 02:18:40AM +0300, Roman Kagan wrote:
> > On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > > > It might be useful for the cases when a slow block layer should be replaced
> > > > with a more performant one on running VM without stopping, i.e. with very low
> > > > downtime comparable with the one on migration.
> > > > 
> > > > It's possible to achive that for two reasons:
> > > > 
> > > > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> > > >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> > > >   each other in the values of migration service fields only.
> > > > 2.The device driver used in the guest is the same: virtio-blk
> > > > 
> > > > In the series cross-migration is achieved by adding a new type.
> > > > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > > > VMstate, also it implements migration save/load callbacks to be compatible
> > > > with migration stream produced by "virtio-blk" device.
> > > > 
> > > > Adding the new type instead of modifying the existing one is convenent.
> > > > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > > > device from the existing non-compatible one using qemu machinery without any
> > > > other modifiactions. That gives all the variety of qemu device related
> > > > constraints out of box.
> > > 
> > > Hmm I'm not sure I understand. What is the advantage for the user?
> > > What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> > > We could add some hacks to make it compatible for old machine types.
> > 
> > The point is that virtio-blk and vhost-user-blk are not
> > migration-compatible ATM.  OTOH they are the same device from the guest
> > POV so there's nothing fundamentally preventing the migration between
> > the two.  In particular, we see it as a means to switch between the
> > storage backend transports via live migration without disrupting the
> > guest.
> > 
> > Migration-wise virtio-blk and vhost-user-blk have in common
> > 
> > - the content of the VMState -- VMSTATE_VIRTIO_DEVICE
> > 
> > The two differ in
> > 
> > - the name and the version of the VMStateDescription
> > 
> > - virtio-blk has an extra migration section (via .save/.load callbacks
> >   on VirtioDeviceClass) containing requests in flight
> > 
> > It looks like to become migration-compatible with virtio-blk,
> > vhost-user-blk has to start using VMStateDescription of virtio-blk and
> > provide compatible .save/.load callbacks.  It isn't entirely obvious how
> > to make this machine-type-dependent, so we came up with a simpler idea
> > of defining a new device that shares most of the implementation with the
> > original vhost-user-blk except for the migration stuff.  We're certainly
> > open to suggestions on how to reconcile this under a single
> > vhost-user-blk device, as this would be more user-friendly indeed.
> > 
> > We considered using a class property for this and defining the
> > respective compat clause, but IIUC the class constructors (where .vmsd
> > and .save/.load are defined) are not supposed to depend on class
> > properties.
> > 
> > Thanks,
> > Roman.
> 
> So the question is how to make vmsd depend on machine type.
> CC Eduardo who poked at this kind of compat stuff recently,
> paolo who looked at qom things most recently and dgilbert
> for advice on migration.

I don't think I've seen anyone change vmsd name dependent on machine
type; making fields appear/disappear is easy - that just ends up as a
property on the device that's checked;  I guess if that property is
global (rather than per instance) then you can check it in
vhost_user_blk_class_init and swing the dc->vmsd pointer?

Dave


> -- 
> MST
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


