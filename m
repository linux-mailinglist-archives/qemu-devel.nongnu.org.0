Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C24342E3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 03:33:00 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md0TS-0005Cy-Qi
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 21:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md0S6-00042P-3T
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 21:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md0Rz-0001xv-Ga
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 21:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634693484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeotHisjk5Xxiriij3mIJq21IO5w6xUY9WZaeljfKI0=;
 b=fV4+w7Q6hq9vG+RBfY6U/COwdZF3h5m4xammDMlojz0CoTLwnLHMURWyAvOBKlLmME+Zyi
 n1QK2kF1kfToaZJP0CsI4LI2esC6TyMvoGAdPZROz6Gub8y3b13PDrBXAM/S5GD2Yom7z6
 J0eUKyfjJBAOm0ED0YUUxqICZmBGfAU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-u9Bu0zazNg-fyEtrbtFkdA-1; Tue, 19 Oct 2021 21:31:23 -0400
X-MC-Unique: u9Bu0zazNg-fyEtrbtFkdA-1
Received: by mail-lf1-f72.google.com with SMTP id
 z18-20020a0565120c1200b003fd76d7ca21so2288538lfu.13
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 18:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MeotHisjk5Xxiriij3mIJq21IO5w6xUY9WZaeljfKI0=;
 b=cgYOr9D9cxbgMHHpYrVB7ZI6xIXZAv7nu4NDaejRZdqPa3vX1XsWn47y8IJ602sgoc
 mj2KovNr9rE4/Tov+4wBE3SQPH3z1d/lI2lYA75oDpoPoVi2TqBEBmq43MfibUrD5Fvz
 +xkSrRI6FI3O+y0VYVyuaU+ERzlQtDizt8KPI9H6olowf+DN+sSR43ftlhPSfpUO3gz0
 rTo6nYO/2IvBEWPard/C+VtVMJdTRZ8dWttNytvRcM99DGhgchCGhTRai5q41pMLmY5q
 AnMOp7DqRmXuZxVXaczLW0ar325yRpTHHFl/t4sq5V4n403Dk3xq7oRTwN+1dbXT0mtV
 nu3g==
X-Gm-Message-State: AOAM533PPw30iQqNT1ed3PMWfG3LDb5NBxaloQdqRxIEeRwjRFtsJ6vs
 Jm5fm5bVpmu7TKmFjsZpD14Lx5gYBCyjMxuDE0ITaMqvMuSACnWaiZAhJZUtCSEWkj7kzveCVFu
 FmVA6aMMeW9gCOjzAT6mN7gaXLxVDyk8=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr10376210ljj.217.1634693482023; 
 Tue, 19 Oct 2021 18:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzCy5/MQlzhJtasC6A8HDSjzPTsY+rTvUUDbtAmMsx14CIpQ2dhoo4IdE+KDs7DlNeX18SGVTsYVKHnSdGms0=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr10376188ljj.217.1634693481766; 
 Tue, 19 Oct 2021 18:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
 <20211019165611.scfagcp4ikhigx5k@habkost.net>
In-Reply-To: <20211019165611.scfagcp4ikhigx5k@habkost.net>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 09:31:10 +0800
Message-ID: <CACGkMEskUCah0t5FEzrf1kHnC4=iOVSU9=h9zJozQLynEQznaQ@mail.gmail.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Oct 20, 2021 at 12:56 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> > > On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > > > Forgot to CC maintainers.
> > > > >
> > > > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > > >
> > > > > Stefan
> > > >
> > > > OMG
> > > > where all compat properties broken all the time?
> > >
> > > Compat properties that existed when commit f6e501a28ef9 ("virtio:
> > > Provide version-specific variants of virtio PCI devices") was
> > > merged are not broken, because virtio-*-transitional and
> > > virtio-*-non-transitional were brand new QOM types (so there's no
> > > compatibility to be kept with old QEMU versions).
> > >
> > > Compat properties referencing "virtio-*-pci" instead of
> > > "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> > > broken, yes.
> > >
> > > --
> > > Eduardo
> >
> > Oh. So just this one:
> >     { "virtio-net-pci", "vectors", "3"},
> >
> > right?
>
> I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
> hw/core/machine.c.
>
> pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
> virtio compat props on spapr.c and s390-virtio-ccw.c.
>
> >
> > about the patch: how do people feel about virtio specific
> > stuff in qdev core? Ok by everyone?
>
> Not OK, if we have a mechanism to avoid that, already (the
> "virtio-net-pci-base" type name).  I wonder what we can do to
> make this kind of mistake less likely, though.
>
> Jean-Louis, Jason, does the following fix work?

Yes.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32d..bd9c6156c1a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
>      { "ICH9-LPC", "smm-compat", "on"},
>      { "PIIX4_PM", "smm-compat", "on"},
>      { "virtio-blk-device", "report-discard-granularity", "off" },
> -    { "virtio-net-pci", "vectors", "3"},
> +    { "virtio-net-pci-base", "vectors", "3"},
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>
> --
> Eduardo
>


