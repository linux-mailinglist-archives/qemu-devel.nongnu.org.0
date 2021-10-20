Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F381E43447C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:06:35 +0200 (CEST)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3oB-0000NC-2x
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3kR-00060N-Do
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3kP-0005Ie-An
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634706160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yd6lFaSRSdVvsLb3z+8unkHye0Lv5mQEznYNp8Yf/Vg=;
 b=K3vvpe3qimB6O8pIh8/t/D6+XwyYTckqtwJlEz/pWkg2P2juruV2P/D0GgKFv9/swEzUAn
 4vK41ECgU1enxCvX/5MRo3MRs8zJ7kddDYzHaP6AYqK34HKfGEkqwZlz59q0/eSCUFJ+8i
 e/hItiFAmAtfGjVqFhIt5Vz4mBFHi10=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-QrDvZuI6MXCqcORgmQOXvg-1; Wed, 20 Oct 2021 01:02:37 -0400
X-MC-Unique: QrDvZuI6MXCqcORgmQOXvg-1
Received: by mail-lf1-f71.google.com with SMTP id
 br42-20020a056512402a00b003fd94a74905so2561253lfb.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 22:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd6lFaSRSdVvsLb3z+8unkHye0Lv5mQEznYNp8Yf/Vg=;
 b=rPbk6UCoYmS8li6FKd5R2dnAkk3uJX12052vTsYv/zAF27Tipoj6Me9sdYJ5JVyy89
 9O2e5WEJgHrwE4dHqatkMTE42N2b1ikIToCrEzAk5aDa2NOPt1VbEwokYRI4oHrju4Rq
 FvjIyMXLwiwF8p2Ownda3YCWGbllw/kP5VsmFSKRYH9G2Tgn/sV8LL1gpG1IsidrqZ6V
 Z2LBg9em3+wUAeznhPXyBczzZX74pCFz/4dPej9x23IM6e+JQRySQW7++mAlDA7LcySM
 Zb5lsppfPy/kDyrAxSP1ec7tezQ6jR77t4dWrAOtbtiXITC0azTbIzF9kF8lIreu9eLn
 EJ1w==
X-Gm-Message-State: AOAM532ukpvCtZ/vRqCEX00AZUj5txdPEE84qpnH0OopIfLaTuKZEtP5
 2MyrSMJM+tSaPvBqT7sX8F3em+JtRl47+FIomQzhuBhKN5cAonIedjJwbs34k9VTaWXdu+Dej0t
 8532pkLMN/v5JHddBZTt3+MjOjqdap9w=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr11480435ljf.107.1634706155821; 
 Tue, 19 Oct 2021 22:02:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNcwbUC/JsJrKk8HpSoq476B+nvjY1J+TL7ioP/r3p2I3ZwgbqWFUT4h6O8OrTIQAh0nZDoZPnuILNZEZNqrQ=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr11480391ljf.107.1634706155384; 
 Tue, 19 Oct 2021 22:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
 <20211019165611.scfagcp4ikhigx5k@habkost.net>
 <CACGkMEskUCah0t5FEzrf1kHnC4=iOVSU9=h9zJozQLynEQznaQ@mail.gmail.com>
In-Reply-To: <CACGkMEskUCah0t5FEzrf1kHnC4=iOVSU9=h9zJozQLynEQznaQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 13:02:24 +0800
Message-ID: <CACGkMEuegAVjRudWPb5YZ7s7AZ1V_MvCkFviV1w5J_0f+bh+Vg@mail.gmail.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jean-Louis Dupond <jean-louis@dupond.be>,
 pbonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 9:31 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 12:56 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> > > > On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > > > > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > > > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > > > > Forgot to CC maintainers.
> > > > > >
> > > > > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > > > >
> > > > > > Stefan
> > > > >
> > > > > OMG
> > > > > where all compat properties broken all the time?
> > > >
> > > > Compat properties that existed when commit f6e501a28ef9 ("virtio:
> > > > Provide version-specific variants of virtio PCI devices") was
> > > > merged are not broken, because virtio-*-transitional and
> > > > virtio-*-non-transitional were brand new QOM types (so there's no
> > > > compatibility to be kept with old QEMU versions).
> > > >
> > > > Compat properties referencing "virtio-*-pci" instead of
> > > > "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> > > > broken, yes.
> > > >
> > > > --
> > > > Eduardo
> > >
> > > Oh. So just this one:
> > >     { "virtio-net-pci", "vectors", "3"},
> > >
> > > right?
> >
> > I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
> > hw/core/machine.c.
> >
> > pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
> > virtio compat props on spapr.c and s390-virtio-ccw.c.
> >
> > >
> > > about the patch: how do people feel about virtio specific
> > > stuff in qdev core? Ok by everyone?
> >
> > Not OK, if we have a mechanism to avoid that, already (the
> > "virtio-net-pci-base" type name).  I wonder what we can do to
> > make this kind of mistake less likely, though.
> >
> > Jean-Louis, Jason, does the following fix work?
>
> Yes.
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> Thanks
>
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b8d95eec32d..bd9c6156c1a 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
> >      { "ICH9-LPC", "smm-compat", "on"},
> >      { "PIIX4_PM", "smm-compat", "on"},
> >      { "virtio-blk-device", "report-discard-granularity", "off" },
> > -    { "virtio-net-pci", "vectors", "3"},
> > +    { "virtio-net-pci-base", "vectors", "3"},

Rethink about this, any chance that we can use "virtio-net-pci" as the
base_name? It looks to me this can cause less confusion and consistent
with the existing compat properties.

Thanks

> >  };
> >  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> >
> > --
> > Eduardo
> >


