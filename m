Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3A5EDD85
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:11:51 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWqq-000625-7Q
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odTpD-0004Qn-On
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odTpB-00060j-Jo
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664359072;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LPEbT43L4AwK2Cx4QfVmGJZRe5w2AhJmB0ByWQykOo=;
 b=Z7O++Q6M8VST1de8ljLkAAG1Pi1I9nh7WiZH/+lA/TVHDa42d+Pa3fi+CK4Gfe2x92/h7M
 khlwl72MGsnU+WS3lOgcOoc2arA3yXGKgcnLnjypOcfd4tlWKBRmCyP81zE1Z15dagZMjR
 pUT3d3OE4JFGrcXnlXGu7jiDeM2qZho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-aWt0bS-FN7G2RER3kXPsqA-1; Wed, 28 Sep 2022 05:57:51 -0400
X-MC-Unique: aWt0bS-FN7G2RER3kXPsqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31C2C101A528;
 Wed, 28 Sep 2022 09:57:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEA64C15BA4;
 Wed, 28 Sep 2022 09:57:49 +0000 (UTC)
Date: Wed, 28 Sep 2022 10:57:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <YzQam+F1HEu5g52A@redhat.com>
References: <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928054803-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928054803-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 05:53:17AM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> > On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> > > > [...]
> > > > > For biosbits if we are going this route then I feel a submodule is much
> > > > > better.  It records which version exactly each qemu version wants.
> > > > 
> > > > As far as I know, you can also specify the version when using pip, can't
> > > > you? So that's not really an advantage here.
> > > > 
> > > > On the contrary, submodules have a couple of disadvantages that I really
> > > > dislike:
> > > > 
> > > > - submodules do not get updated automatically when doing a "git checkout",
> > > > we have to update them via a script instead. This causes e.g. trouble if you
> > > > rsync your source tree to a machine that has no access to the internet and
> > > > you forgot to update the submodule before the sync
> > > > 
> > > > - the content of submodules is not added to the tarballs that get created on
> > > > the git forges automatically. There were lots of requests from users in the
> > > > past that tried to download a tarball from github and then wondered why they
> > > > couldn't compile QEMU.
> > > > 
> > > > - we include the submodule content in our release tarballs, so people get
> > > > the impression that hte submodule content is part of the QEMU sources. This
> > > > has two disadvantages:
> > > >  * We already got bug reports for the code in the submodule,
> > > >    where people did not understand that they should report that
> > > >    rather to the original project instead (i.e. you ship it - you
> > > >    own it)
> > > >  * People get the impression that QEMU is a huge monster
> > > >    application if they count the number of code lines, run
> > > >    their code scanner tools on the tarball contents, etc.
> > > >    Remember "nemu", for example, where one of the main complaints
> > > >    was that QEMU has too many lines of code?
> > > > 
> > > > - If programs includes code via submodules, this gets a higher
> > > >   burder for distro maintainers, since they have to patch each
> > > >   and every package when there is a bug, instead of being able to
> > > >   fix it in one central place.
> > > > 
> > > > So in my opinion we should avoid new submodules if there is an alternative.
> > > > 
> > > >  Thomas
> > > 
> > > So looking at the latest proposals downloading files from CI,
> > > checksumming them etc etc. No auto checkout, not added automatically
> > > either, right?
> > > 
> > > This seems to be the only difference:
> > > - we include the submodule content in our release tarballs
> > 
> > That's just one of the issues with submodules. Working with them in general
> > is not a pleasant experiance.
> 
> This is what I asked about at the maintainers summit.
> I'd like to map the issues and see if there's anything
> we can do to solve them. In particular we will likely
> keep using submodules where we historically did
> so it's time well spent.
> 
> I agree generally but the big question is what to replace these with.
> Below I assume the replacement is a script such as avocado or pytest
> with its own hashing, calling wget internally etc etc.
> 
> 
> > Thomas pointed out some of the issues, such
> > as 'git checkout' ignoring submodules, requiring extra steps to sync them.
> 
> 
> Not different from a home grown SCM as part of test script, right?

We're not building a home grown SCM as part of a test script, so
this answer is irrelevant.

> > There's also the perenial problem that developers frequently send
> > patches that mistakenly include submodule changes,
> 
> OK, so the thing to do would be to look for ways to exclude submodule changes
> from git commits.

If someone wants to make git suck less with submodules great, but needs
someone to actually do the work.

> > I'd really like to see us doing more to eliminate as much use of submodules
> > as is possible over time. 
> 
> Or try to fix the problems, right?

Again needs someone to actually make it happen.

Meanwhile  QEMU already has an integrated test harness in the form
of Avocado that does everything needed. If Avocado had just been
used for this biosbits test in the first place, the test would
likely have already been merged to QEMU, instead of us having this
never ending debate on how to re-invent an alternative to what
already avocado does.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


