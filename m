Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4FC5EDD92
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:18:18 +0200 (CEST)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWx7-0004qx-0G
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTkt-0001Ab-9W
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTkr-0005T1-5K
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptqyefLQRTp0DSNVesWWAc1HfvdNC2Z/RJRvSkHVf1g=;
 b=LvVDAkygAolPfwnJf2nqjKsM524Jqj5+NA0q/sZV7rTq/jV0Vfg8taUzz8kO+VJ6AO8Jcd
 aSQKJaCQ1MWDeAD2ubUiSETKQ7C8NAsukKsZuWguPfQ1lKF7TOyFJN2Dt4vpAXuA+EH0l8
 Jv4EW2rtgr/H9PPMJIyiOVbiD1RUpE0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-VPU7tWi3ODyBSN1zvRqOIA-1; Wed, 28 Sep 2022 05:53:23 -0400
X-MC-Unique: VPU7tWi3ODyBSN1zvRqOIA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v22-20020adf8b56000000b0022af189148bso2846730wra.22
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ptqyefLQRTp0DSNVesWWAc1HfvdNC2Z/RJRvSkHVf1g=;
 b=QPvsTtuwVNBs+LhAaYshhmUjxs/I2crkXu2ebxNp56dZ9S2OY1z5F+ChFxhwudz2dr
 jcNJp0V5W7IoTLaJg4CpJkRuyy7VaTnl94qVcwk20tTuVL/7yPDURfPVY7HYwWaHgkSP
 dKvhejsx88aO9ERma/2Zu6r42YNNvqYdVYzxLuA9kJYouaUP4cD0nUe309yerdef+Ffb
 jbHOb1Da8itmOcWe3+5djbKvVgw5GQcDESLQa3VUCusbJ/GXTyDyUJku9ytIuIbcipaU
 N44UDhIvzr87NZ1uG9Wwt6rNVX0nbjGED3dl0lGDISjjPdwVd8g5dECxjWcPMK25xL8J
 V6ew==
X-Gm-Message-State: ACrzQf32AEN7MS4bmrZ3MFTYfRxSxJIUgpAWFEXhMB1DduSwm/jMSo28
 wryicWmQygUuGBIQSvoIZQpzPiN7bsckcUQVTVvixq774DvM9YQlTRr2jVUO6M/z8vYbgQaKJi7
 A28TeRgG/aGCCEOk=
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr5956595wma.96.1664358801958; 
 Wed, 28 Sep 2022 02:53:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sA1+hkGtkSb8UQAJsjL4GQvV5V7akXJaadmFYgYxPbp+IN28g3wVw4xJr/oNf2OhHjfWWRg==
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr5956566wma.96.1664358801678; 
 Wed, 28 Sep 2022 02:53:21 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b0022a2dbc80fdsm3752024wrp.10.2022.09.28.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:53:21 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:53:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928054803-mutt-send-email-mst@kernel.org>
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQVyj5ouhGshZ2+@redhat.com>
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

On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrote:
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
> > >  * We already got bug reports for the code in the submodule,
> > >    where people did not understand that they should report that
> > >    rather to the original project instead (i.e. you ship it - you
> > >    own it)
> > >  * People get the impression that QEMU is a huge monster
> > >    application if they count the number of code lines, run
> > >    their code scanner tools on the tarball contents, etc.
> > >    Remember "nemu", for example, where one of the main complaints
> > >    was that QEMU has too many lines of code?
> > > 
> > > - If programs includes code via submodules, this gets a higher
> > >   burder for distro maintainers, since they have to patch each
> > >   and every package when there is a bug, instead of being able to
> > >   fix it in one central place.
> > > 
> > > So in my opinion we should avoid new submodules if there is an alternative.
> > > 
> > >  Thomas
> > 
> > So looking at the latest proposals downloading files from CI,
> > checksumming them etc etc. No auto checkout, not added automatically
> > either, right?
> > 
> > This seems to be the only difference:
> > - we include the submodule content in our release tarballs
> 
> That's just one of the issues with submodules. Working with them in general
> is not a pleasant experiance.

This is what I asked about at the maintainers summit.
I'd like to map the issues and see if there's anything
we can do to solve them. In particular we will likely
keep using submodules where we historically did
so it's time well spent.

I agree generally but the big question is what to replace these with.
Below I assume the replacement is a script such as avocado or pytest
with its own hashing, calling wget internally etc etc.


> Thomas pointed out some of the issues, such
> as 'git checkout' ignoring submodules, requiring extra steps to sync them.


Not different from a home grown SCM as part of test script, right?

> The flipside on tarballs is that the auto-generated tarballs from gitlab
> do not include submodules, so the tests will be missing the files they
> wanted.

Not different from a home grown SCM as part of test script, right?

> There's also the perenial problem that developers frequently send
> patches that mistakenly include submodule changes,

OK, so the thing to do would be to look for ways to exclude submodule changes
from git commits.

> which is related to the
> way that 'git checkout' doesn't sync submodule state when switching branches.

Not different from a home grown SCM as part of test script, right?

> I'd really like to see us doing more to eliminate as much use of submodules
> as is possible over time. 

Or try to fix the problems, right?


> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


