Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B15EDD72
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:04:02 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWjJ-000806-6z
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTfd-0005aX-41
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTfb-0004oR-5G
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P4Jf3bM8NBUe5wFPxZz9WMYwg84Nx6SUfosL6Z+vOAE=;
 b=H7h/5h9GNGSXM/ie7GvZqGiejwNmdmvaZANaBv0U3ci+gwAKGAOd9ybFnbiU2ClPUE2sHA
 dk9WYsw2ri2GwUtWApkIiadpvyMj6OS0KSKPM1IXExzgSR//z+bPgSGgdwFfg2zYygzEEs
 TcHOAqYfbB9zw5H7ji7xdF3BlVPc8GQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-qCD4srpBNBaDZ9kYyNnAPw-1; Wed, 28 Sep 2022 05:47:57 -0400
X-MC-Unique: qCD4srpBNBaDZ9kYyNnAPw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h20-20020adfaa94000000b0022cc1de1251so1098128wrc.15
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=P4Jf3bM8NBUe5wFPxZz9WMYwg84Nx6SUfosL6Z+vOAE=;
 b=gv+QKxL6aOZPbn2eoowYLCf0o5Q6Rwz3SiaXVbwEfDjHm8ASqrCP4FmTeb6v/z7UAV
 lJX6WsFQ5Q3KQ5vVOU+UMpy0/a3Qx/THbri0vC+5f01q5goGlpnIxaavtPqFPaeCQ9zd
 FIF4UEwYP7vDQ7fYZvt31OfjSSR2XGaUwHJzG8xsgZ5try/nZfY3OY+y3wb8zPgbCaZC
 L/Ojz/b7UsSR2ygWe93W7TMSWVt/ZW2wUlz2TqQ+Et95FLteHUX09EKstL3LBm2eIdTd
 w8MYNjd708vnyGxummNRY6DzRENJsIhVtvV6CyIgG0U9Lhlh4Cj+jdSf0nVwN9ZLEWVj
 1OWA==
X-Gm-Message-State: ACrzQf0cAkRM8s2x3ZpIN5W1j8+Ld7Kjb2snBak3Agt1SvQqvsqqdEmG
 wwPS3013xmkJwlbKGbQqVEr7ufYjihBA+Q4s7z8JY5ll48HPoaEfD5L0MMQgsSgkko8k538yAaP
 VJ54jIYBnWqddg/4=
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr6239236wmq.193.1664358476261; 
 Wed, 28 Sep 2022 02:47:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61mlMjqmhvR5X3WluC70hm2PRjolITxN7mHW58e5kscRVlwxwxTdvAwNybyfEBXEbjVO51GQ==
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr6239212wmq.193.1664358475866; 
 Wed, 28 Sep 2022 02:47:55 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 i9-20020a1c5409000000b003b486027c8asm1277728wmb.20.2022.09.28.02.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:47:55 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:47:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928054730-mutt-send-email-mst@kernel.org>
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <654ed688-55c2-6ea5-6f02-5ba6b4454863@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654ed688-55c2-6ea5-6f02-5ba6b4454863@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 11:33:52AM +0200, Thomas Huth wrote:
> On 28/09/2022 11.26, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> > > [...]
> > > > For biosbits if we are going this route then I feel a submodule is much
> > > > better.  It records which version exactly each qemu version wants.
> > > 
> > > As far as I know, you can also specify the version when using pip, can't
> > > you? So that's not really an advantage here.
> > > 
> > > On the contrary, submodules have a couple of disadvantages that I really
> > > dislike:
> > > 
> > > - submodules do not get updated automatically when doing a "git checkout",
> > > we have to update them via a script instead. This causes e.g. trouble if you
> > > rsync your source tree to a machine that has no access to the internet and
> > > you forgot to update the submodule before the sync
> > > 
> > > - the content of submodules is not added to the tarballs that get created on
> > > the git forges automatically. There were lots of requests from users in the
> > > past that tried to download a tarball from github and then wondered why they
> > > couldn't compile QEMU.
> > > 
> > > - we include the submodule content in our release tarballs, so people get
> > > the impression that hte submodule content is part of the QEMU sources. This
> > > has two disadvantages:
> > >   * We already got bug reports for the code in the submodule,
> > >     where people did not understand that they should report that
> > >     rather to the original project instead (i.e. you ship it - you
> > >     own it)
> > >   * People get the impression that QEMU is a huge monster
> > >     application if they count the number of code lines, run
> > >     their code scanner tools on the tarball contents, etc.
> > >     Remember "nemu", for example, where one of the main complaints
> > >     was that QEMU has too many lines of code?
> > > 
> > > - If programs includes code via submodules, this gets a higher
> > >    burder for distro maintainers, since they have to patch each
> > >    and every package when there is a bug, instead of being able to
> > >    fix it in one central place.
> > > 
> > > So in my opinion we should avoid new submodules if there is an alternative.
> > > 
> > >   Thomas
> > 
> > So looking at the latest proposals downloading files from CI,
> > checksumming them etc etc. No auto checkout, not added automatically
> > either, right?
> > 
> > This seems to be the only difference:
> > - we include the submodule content in our release tarballs
> > 
> > How about we just fix that? Thomas would that address your
> > concern at least wrt tests?
> 
> If I'm not forced to checkout that submodule,

I think the make check script can do that?

> and if we don't add it to the
> release tarball, I guess there's not much left I can complain about ;-)
> 
>  Thomas


