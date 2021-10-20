Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F6434E65
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:57:33 +0200 (CEST)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdD24-0001Wf-Ra
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdD0k-0008H1-1a
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdD0g-0001kO-LM
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634741765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJBAEBD6xgfJGaihQUv1vIFTGmYvM7kqmI5ApoA1/Tc=;
 b=GSaUy5SjdRQHDTENwqYyIuWXtMU7V2Gst+T3n5f/4TNLuu3xs7k0MSsRQHXnh9oCo264H/
 0+OZAnQkab+9FMNB5piPQw+r+KiHY9pNnEm4nRQ7hQ/YaQbu/GGjxLgthmqgm4udI84IQA
 +SFCt9B1OS9Xe+GIZi1dWMIYfDpNjHA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-CkCUkro_MzCiYmULmVJ0pQ-1; Wed, 20 Oct 2021 10:56:04 -0400
X-MC-Unique: CkCUkro_MzCiYmULmVJ0pQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c201-20020a1c9ad2000000b0030d6982305bso525004wme.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BJBAEBD6xgfJGaihQUv1vIFTGmYvM7kqmI5ApoA1/Tc=;
 b=11ULO4GaPn4i0KFWigmgOoYLV82AchPLLa/2ICUqlbhNfEpfbprA1K1cl1KjfYxQEO
 4gNPCPrrzbWdCyBzk4+p7no4w4/qdqMkc5Dv8SVgxoJq1J3dtIsFr82ZqdazPp9WgY9z
 xMlK0fsxVzPPI2BSgk7zjuU57lot3XHi++4gek62D4MJtF13qma52wE8gSFIE9wHnhy1
 yAAO/eRXOPbT1AzW6LEw6C+ILHx2pxpOFGVIOWpYu+/+7ajhIIrDJ+fU9MM+ciehfOHk
 eOkj+iK5abfbwh9TYbQe9ndt7LWd6uv3jnRlnug2YEFaDOXy2MhSX6Ks0DZNNDJocxen
 oS7g==
X-Gm-Message-State: AOAM530TTMA7xG5MME/yu6qawz+hnTkGQOHvWOJibWefgw7m5cSi3pG0
 WwFOB8jk60+W4rQFaxlaZ/i7vO0vg00RUDdxCSuWgKjE0ts+URf4ZiUnQS7p3QDqW85NSv5Rsj4
 wKoWYOt344ssAVTM=
X-Received: by 2002:adf:9c11:: with SMTP id f17mr216365wrc.147.1634741763156; 
 Wed, 20 Oct 2021 07:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQlF6Nuw3G0xXOo8nOQcKGr6QKRbIh80G73j4wEqJ0JqkwlPMHhJV8J1rPJBNJ5P81a+vajg==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr216319wrc.147.1634741762789; 
 Wed, 20 Oct 2021 07:56:02 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id 133sm5358794wmb.24.2021.10.20.07.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:56:02 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:55:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211020105521-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
 <20211019165611.scfagcp4ikhigx5k@habkost.net>
 <20211020034005-mutt-send-email-mst@kernel.org>
 <20211020135737.3wubfa4c6ijflolp@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20211020135737.3wubfa4c6ijflolp@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: berrange@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 Jean-Louis Dupond <jean-louis@dupond.be>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 09:57:37AM -0400, Eduardo Habkost wrote:
> On Wed, Oct 20, 2021 at 03:41:38AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 19, 2021 at 12:56:11PM -0400, Eduardo Habkost wrote:
> > > On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> > > > > On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > > > > > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > > > > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > > > > > Forgot to CC maintainers.
> > > > > > > 
> > > > > > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > > > > > 
> > > > > > > Stefan
> > > > > > 
> > > > > > OMG
> > > > > > where all compat properties broken all the time?
> > > > > 
> > > > > Compat properties that existed when commit f6e501a28ef9 ("virtio:
> > > > > Provide version-specific variants of virtio PCI devices") was
> > > > > merged are not broken, because virtio-*-transitional and
> > > > > virtio-*-non-transitional were brand new QOM types (so there's no
> > > > > compatibility to be kept with old QEMU versions).
> > > > > 
> > > > > Compat properties referencing "virtio-*-pci" instead of
> > > > > "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> > > > > broken, yes.
> > > > > 
> > > > > -- 
> > > > > Eduardo
> > > > 
> > > > Oh. So just this one:
> > > >     { "virtio-net-pci", "vectors", "3"},
> > > > 
> > > > right?
> > > 
> > > I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
> > > hw/core/machine.c.
> > > 
> > > pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
> > > virtio compat props on spapr.c and s390-virtio-ccw.c.
> > > 
> > > > 
> > > > about the patch: how do people feel about virtio specific
> > > > stuff in qdev core? Ok by everyone?
> > > 
> > > Not OK, if we have a mechanism to avoid that, already (the
> > > "virtio-net-pci-base" type name).  I wonder what we can do to
> > > make this kind of mistake less likely, though.
> > > 
> > > Jean-Louis, Jason, does the following fix work?
> > > 
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index b8d95eec32d..bd9c6156c1a 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
> > >      { "ICH9-LPC", "smm-compat", "on"},
> > >      { "PIIX4_PM", "smm-compat", "on"},
> > >      { "virtio-blk-device", "report-discard-granularity", "off" },
> > > -    { "virtio-net-pci", "vectors", "3"},
> > > +    { "virtio-net-pci-base", "vectors", "3"},
> > >  };
> > >  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> > 
> > Hmm I'm a bit confused at this point, as to why does
> > specifying properties for virtio-net-pci on command
> > line with -global work, but in compat list doesn't. Do others
> > understand?
> 
> I don't think that's the case.  -global behaves similarly to compat_props.
> 
> Running an unpatched QEMU 6.1.0 binary:
> 
> $ echo -e 'info qtree\nquit' | qemu-system-x86_64 -device virtio-net-pci -machine pc-q35-5.2 -monitor stdio | grep vectors
>         vectors = 3 (0x3)
> $ echo -e 'info qtree\nquit' | qemu-system-x86_64 -device virtio-net-pci-non-transitional -machine pc-q35-5.2 -monitor stdio | grep vectors
>         vectors = 4 (0x4)
> $ echo -e 'info qtree\nquit' | qemu-system-x86_64 -device virtio-net-pci-non-transitional -global virtio-net-pci.vectors=3 -monitor stdio | grep vectors
>         vectors = 4 (0x4)
> $ echo -e 'info qtree\nquit' | qemu-system-x86_64 -device virtio-net-pci-non-transitional -global virtio-net-pci-base.vectors=3 -monitor stdio | grep vectors
>         vectors = 3 (0x3)

OK so ... that's another breakage then. Suggestions how to fix?

> 
> -- 
> Eduardo


