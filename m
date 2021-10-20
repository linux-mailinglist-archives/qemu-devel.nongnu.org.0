Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55486434E78
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:01:43 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdD66-0005WH-Dt
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdD2r-0003Kq-Gp
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdD2p-0005E5-OE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634741898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sUMHvaAweaLRvHwGDM638Xi6t3XU1P17Qi1nsIB7ByI=;
 b=VBSONbFTe4SCojJsKFNjAJrujjK2uNEmN3zymjbfEyK+r219Ej5h2jpLKnvldYFSFytATS
 l0Ck271vS/PLijRWUXOJR4shYT5J+FOO7SQvePiW4I0rnFEmv0YASICkupCa9uM3x1VPFt
 QjzpogCf1sZRearQiBnLuRbxZZCTX0g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-usB_SejKPjuavzXxJfiBtA-1; Wed, 20 Oct 2021 10:58:17 -0400
X-MC-Unique: usB_SejKPjuavzXxJfiBtA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so4372547wmi.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sUMHvaAweaLRvHwGDM638Xi6t3XU1P17Qi1nsIB7ByI=;
 b=IAXLs9+FI7NJIYBlwWge4VKAWLVcdNWZ64be0nQAgseNf5gzeyxvpwNszHz3ASHcp/
 cs1CYKPwgib8d2w/hJmWrg5QwIArK4cAvEZbFgRtOZb8FuKYIHYWzTRAW7udP5PGyB4M
 azAqezrGEs0MoxGyfoBXlPPLWmub+X5oHh5wwIJWvOqEkiTGz8I726Vn60f+VlkqLKCI
 nL15RI7/JeF5thZ7Z7Xxn1rjNS79+ITdB4Anb7Nv4QNLm3l1Mb1B9oRBv3D0CauOqYUG
 tzPr4e5l8W49Tk0ouOtzM0ggIwucwMStPWibUKqpVAUSqP8Cb+fSP9WAb2+3sTB+KfEN
 Ktrw==
X-Gm-Message-State: AOAM533vlEEvjrxoOxCmgU8Sw1w8sjKa4Bw+8/4XHifAgr3zANpzJIMb
 jmrIhvxAuaGc4R3/zudbfENmtWPwyfrNmkKig2Ps02ekDAFYPqS5cRICIKsR0rNFQe4OFQiwPb8
 5wGe1erObgG28ca4=
X-Received: by 2002:adf:d209:: with SMTP id j9mr243955wrh.43.1634741896090;
 Wed, 20 Oct 2021 07:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNygy63IAnQShYv89ZHa6Rf17pDT6PKso3beuG9oN32wmi7VK/yUKLz/Md160KI6IF1fPkLQ==
X-Received: by 2002:adf:d209:: with SMTP id j9mr243926wrh.43.1634741895843;
 Wed, 20 Oct 2021 07:58:15 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z5sm6517992wmp.26.2021.10.20.07.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:58:15 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:58:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211020105655-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
 <20211019165611.scfagcp4ikhigx5k@habkost.net>
 <CACGkMEskUCah0t5FEzrf1kHnC4=iOVSU9=h9zJozQLynEQznaQ@mail.gmail.com>
 <CACGkMEuegAVjRudWPb5YZ7s7AZ1V_MvCkFviV1w5J_0f+bh+Vg@mail.gmail.com>
 <20211020140917.2mirnsjkhcykotcu@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20211020140917.2mirnsjkhcykotcu@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jean-Louis Dupond <jean-louis@dupond.be>,
 pbonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 10:09:17AM -0400, Eduardo Habkost wrote:
> On Wed, Oct 20, 2021 at 01:02:24PM +0800, Jason Wang wrote:
> > On Wed, Oct 20, 2021 at 9:31 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 12:56 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
> > > > > On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> > > > > > On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > > > > > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > > > > > > Forgot to CC maintainers.
> > > > > > > >
> > > > > > > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > > > > > >
> > > > > > > > Stefan
> > > > > > >
> > > > > > > OMG
> > > > > > > where all compat properties broken all the time?
> > > > > >
> > > > > > Compat properties that existed when commit f6e501a28ef9 ("virtio:
> > > > > > Provide version-specific variants of virtio PCI devices") was
> > > > > > merged are not broken, because virtio-*-transitional and
> > > > > > virtio-*-non-transitional were brand new QOM types (so there's no
> > > > > > compatibility to be kept with old QEMU versions).
> > > > > >
> > > > > > Compat properties referencing "virtio-*-pci" instead of
> > > > > > "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> > > > > > broken, yes.
> > > > > >
> > > > > > --
> > > > > > Eduardo
> > > > >
> > > > > Oh. So just this one:
> > > > >     { "virtio-net-pci", "vectors", "3"},
> > > > >
> > > > > right?
> > > >
> > > > I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
> > > > hw/core/machine.c.
> > > >
> > > > pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
> > > > virtio compat props on spapr.c and s390-virtio-ccw.c.
> > > >
> > > > >
> > > > > about the patch: how do people feel about virtio specific
> > > > > stuff in qdev core? Ok by everyone?
> > > >
> > > > Not OK, if we have a mechanism to avoid that, already (the
> > > > "virtio-net-pci-base" type name).  I wonder what we can do to
> > > > make this kind of mistake less likely, though.
> > > >
> > > > Jean-Louis, Jason, does the following fix work?
> > >
> > > Yes.
> > >
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > >
> > > Thanks
> > >
> > > >
> > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > ---
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index b8d95eec32d..bd9c6156c1a 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
> > > >      { "ICH9-LPC", "smm-compat", "on"},
> > > >      { "PIIX4_PM", "smm-compat", "on"},
> > > >      { "virtio-blk-device", "report-discard-granularity", "off" },
> > > > -    { "virtio-net-pci", "vectors", "3"},
> > > > +    { "virtio-net-pci-base", "vectors", "3"},
> > 
> > Rethink about this, any chance that we can use "virtio-net-pci" as the
> > base_name? It looks to me this can cause less confusion and consistent
> > with the existing compat properties.
> 
> It's probably too late now: we can't change the semantics of
> "-global virtio-net-pci" without breaking compatibility.

You mean someone playing with virtio-net-pci-base and friends?
We could maybe make virtio-net-pci-base be an alias to
virtio-net-pci.

> The original reasoning for making generic_name != base_name is at
> this comment in struct VirtioPCIDeviceTypeInfo:
> 
>     /*
>      * Common base class for the subclasses below.
>      *
>      * Required only if transitional_name or non_transitional_name is set.
>      *
>      * We need a separate base type instead of making all types
>      * inherit from generic_name for two reasons:
>      * 1) generic_name implements INTERFACE_PCIE_DEVICE, but
>      *    transitional_name does not.
>      * 2) generic_name has the "disable-legacy" and "disable-modern"
>      *    properties, transitional_name and non_transitional name don't.
>      */
>     const char *base_name;
> 
> (I had to look it up.  I didn't remember the original reason for that)


Maybe we can find a different way to address these. Jason, any ideas?

> -- 
> Eduardo


