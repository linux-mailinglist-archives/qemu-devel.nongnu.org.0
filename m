Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4955C099
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:16:29 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Cm-0002ZB-4M
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69Ad-0001n8-Qm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69AZ-0002Z7-3N
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656414849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nd5zgA4kXFykILOm8yWnL5LNIqwvpP2moQ3YVaZPzdY=;
 b=HOAYhrxVc6wUA2T4TeQDpbsqdea4SCB05mrowpSf1D69+0LPUv1aUhjEptB37EzBrXDhVn
 rbiWXrQVvZK2GeGI0O2DhsmzJjZxdScYBFG6qdQhwAhGP+eoz9+3xAyVwQuHDxaoJmA4WD
 cM+BqijzwlKt+S/RyKHUMFuBf2JCks4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-2gLTGVcfOH2FL-UTy1ZMdw-1; Tue, 28 Jun 2022 07:14:07 -0400
X-MC-Unique: 2gLTGVcfOH2FL-UTy1ZMdw-1
Received: by mail-wm1-f72.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4947407wmc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nd5zgA4kXFykILOm8yWnL5LNIqwvpP2moQ3YVaZPzdY=;
 b=eR0cX7q11lEiUFMqqbdrPMuXpqVQgFAAdFaU2FtXiTgJaO8oXGHXLbthDmIbAOxrE4
 7o3In6aCJJYFb5ishAvvUKS0hUYhK7G5FlZ/0u4hbsFVaKAny/xLLPP3WStk2f/rPOv1
 xwPSMPMvqmlzHn6/10AidKdi7007v1VLO78dSbtgB5MJSXi6MQjXFVgWh/Sk6Ot+rYFd
 aEIvbvwYXrNy8D27HH0efjbICihG1C9WLhgf50dltddsfuOC+VrRGV29RByGItkbwqZi
 481rKbl6vWmKZjKkslJ8tHXyoc8GNve/k7b0dlgyizsPQQh3lv/nGCUGA/gmU9vrFdOX
 Gddg==
X-Gm-Message-State: AJIora9jJia3T8vYajeCf1EnmBP6hO+ZRTIRCVtTcMM1ZHTvVFR4kwAl
 Ovk9eQ4Qhaj9vB9zeHcoFpog1y7UwbPxFDA2YL6uXutAwTLqZKB+I92asQH3wE2AJU3WEWyBmzb
 sEO0VLnRYjg2u41w=
X-Received: by 2002:a05:6000:107:b0:21b:8ef9:96cb with SMTP id
 o7-20020a056000010700b0021b8ef996cbmr16966112wrx.709.1656414846480; 
 Tue, 28 Jun 2022 04:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZohgPkT20pM5k4DZSdExGr8ZW56R5Qz7vtjmrIjMiAc6cqVIQgOivGfF4wIIVlPan/DEjtA==
X-Received: by 2002:a05:6000:107:b0:21b:8ef9:96cb with SMTP id
 o7-20020a056000010700b0021b8ef996cbmr16966077wrx.709.1656414846145; 
 Tue, 28 Jun 2022 04:14:06 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm12934960wrz.103.2022.06.28.04.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:14:05 -0700 (PDT)
Date: Tue, 28 Jun 2022 07:14:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220628070151-mutt-send-email-mst@kernel.org>
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 12:50:06PM +0200, Thomas Huth wrote:
> On 28/06/2022 12.30, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> > > [...]
> > > > For biosbits if we are going this route then I feel a submodule is much
> > > > better.  It records which version exactly each qemu version wants.
> > > 
> > > As far as I know, you can also specify the version when using pip, can't
> > > you? So that's not really an advantage here.
> > 
> > But of course if you do you do not get updates ;) You do
> > however rely on a 3rd party to faithfully provide you
> > correct code based on the version, and host it forever.
> > 
> > > On the contrary, submodules have a couple of disadvantages that I really
> > > dislike:
> > > 
> > > - submodules do not get updated automatically when doing a "git checkout",
> > > we have to update them via a script instead. This causes e.g. trouble if you
> > > rsync your source tree to a machine that has no access to the internet and
> > > you forgot to update the submodule before the sync
> > 
> > how is pip better?
> 
> You don't end up with an inconsistent source tree in that case (which
> happens with submodules quite easily, at least for me it happened a couple
> of times already). Either the machine has an internet connection, so that
> pip can install the missing bits, or it does not and the test has to be
> skipped.

skipped tests are too easy to ignore ...

> But if I copy the wrong state of a submodule around, things get
> messed up quite easily in my experience. Ok, you could say that this is just
> my special setup with rsync, but already given the fact that "git checkout"
> creates an inconsistent state of your source tree until you run the script
> for updating the submodules the next time is an indication that submodules
> are rather a shaky thing (e.g. if you'd create a tarball for somebody else
> from your source tree right after doing a "git checkout").

yea one has to remember to set submodule.recurse = true in .gitconfig

I agree it's annoying, I guess they don't change it for compat reasons.


> > > - the content of submodules is not added to the tarballs that get created on
> > > the git forges automatically. There were lots of requests from users in the
> > > past that tried to download a tarball from github and then wondered why they
> > > couldn't compile QEMU.
> > 
> > how is pip better here?
> 
> You don't get incomplete/non-working tarballs in that case.

So skip the test ;)

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
> > 
> > I think we can skip the checkout in the tarball if we like.
> > If people want to run the test they can checkout then.
> 
> Release tarballs don't include the ".git" folder infrastructur, so everybody
> who downloads a tarball will simply never be able to run the test.

I actually think I'm fine with that for this specific case.

> > 
> > > - If programs includes code via submodules, this gets a higher
> > >    burder for distro maintainers, since they have to patch each
> > >    and every package when there is a bug, instead of being able to
> > >    fix it in one central place.
> > 
> > Come on, this is just a test. We *really* don't care if an ISO
> > we use to test ACPI is using an exploitable version of grub.
> 
> Wait, I thought we were only talking about tappy here? The ISO binaries
> should certainly *not* be bundled in the QEMU tarballs (they are too big
> already anyway, we should rather think of moving the firmware binaries out
> of the tarball instead).
> 
>  Thomas

IIUC there are three things we are discussing
- biosbits source
- biosbits image
- tappy


-- 
MST


