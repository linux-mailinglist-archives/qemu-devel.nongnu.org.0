Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E962C5EDF97
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:02:15 +0200 (CEST)
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYZi-0002Ii-Ji
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odX1k-0007YC-KY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odX1f-0007t3-Ec
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664371378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgBV04isna9fymBO+7iaFwn1vcnNwSTtAsRHcxWDoSk=;
 b=JKXQcV/RLxYCuRGsbhpD5XPH1AQuf9iHPENQobeBhh5AfA7MKm/FLxkOgcSv9qbNBbuU49
 zZBiUJJcV7vSFhlUKxegnWHpDN2GvWtGzI90oWZrtWL8G4aN4j2rvpTnT01mvbxy4EuK5z
 XB710sKKoH27l9Ed01bvUErVfs5DOIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-g9IaoYgxNvyS35IC_eoGXg-1; Wed, 28 Sep 2022 09:22:57 -0400
X-MC-Unique: g9IaoYgxNvyS35IC_eoGXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b0022cc38d5a8fso1030728wrc.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 06:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fgBV04isna9fymBO+7iaFwn1vcnNwSTtAsRHcxWDoSk=;
 b=bXd/NEisA41ZvekDtVpGIWBDbIvTzjzUMlJOe65RD92abgt26Hq1TAK7CMC2QW7VxP
 qdLWvAGVYXgOjPR6gTHMqnGLJFZ7zTWumc7pusgGynma3SNeALsZZFq0IC9ppuhUbTY5
 l3wFpUiDvIRtKnmigTfC5doYjpQ4jnn2Idg+CuLkMzaA1WZcaj9lEsu4koegadecASpi
 eavONJ40bZ1u1Vqk7Yd+YkIr5bpJYbiRlvnulUIxNVSkNX+Vq0F21lFDijNK6zXhIS/p
 4FlxYc+3x0CStwpWSOoR/JYu8C4UxKgib4U7GU/59xTKIUQ3JI9Ep5IWQc6mbXSIZhxI
 w/OA==
X-Gm-Message-State: ACrzQf0IOVDdD0LWvR9q1X1Ymtkq1W441e0HaGym8Tl/A6oSsRJTh4Ln
 0CO5oClOgUS2gKRKYgDhyAFPHVSwyx2QAF84BVDU7+FTyYRfzud2SgiyZ1AqsQo6EJFEXHn3JYr
 SS7smE9Aj5Q3KkW4=
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr6976781wmb.66.1664371376073; 
 Wed, 28 Sep 2022 06:22:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mWCgyRwTuLeedAUuarSrDl0JTZxnX7vpf/lJb2zDpiRCbr2v7v/4QPGlNnEQaJL9nDgH2GA==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr6976747wmb.66.1664371375778; 
 Wed, 28 Sep 2022 06:22:55 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 k17-20020adfe3d1000000b0022af70874a1sm4854185wrm.36.2022.09.28.06.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 06:22:55 -0700 (PDT)
Date: Wed, 28 Sep 2022 09:22:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928091650-mutt-send-email-mst@kernel.org>
References: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928054803-mutt-send-email-mst@kernel.org>
 <YzQam+F1HEu5g52A@redhat.com>
 <CANCZdfo0iyw3TGOmp=UHgV7dY8ZVX1DVs58Cdj_GufL-QN48zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANCZdfo0iyw3TGOmp=UHgV7dY8ZVX1DVs58Cdj_GufL-QN48zQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 07:15:53AM -0600, Warner Losh wrote:
> 
> 
> On Wed, Sep 28, 2022 at 7:09 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
>     On Wed, Sep 28, 2022 at 05:53:17AM -0400, Michael S. Tsirkin wrote:
>     > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
>     > > On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrote:
>     > > > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
>     > > > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
>     > > > > [...]
>     > > > > > For biosbits if we are going this route then I feel a submodule
>     is much
>     > > > > > better.  It records which version exactly each qemu version
>     wants.
>     > > > >
>     > > > > As far as I know, you can also specify the version when using pip,
>     can't
>     > > > > you? So that's not really an advantage here.
>     > > > >
>     > > > > On the contrary, submodules have a couple of disadvantages that I
>     really
>     > > > > dislike:
>     > > > >
>     > > > > - submodules do not get updated automatically when doing a "git
>     checkout",
>     > > > > we have to update them via a script instead. This causes e.g.
>     trouble if you
>     > > > > rsync your source tree to a machine that has no access to the
>     internet and
>     > > > > you forgot to update the submodule before the sync
>     > > > >
>     > > > > - the content of submodules is not added to the tarballs that get
>     created on
>     > > > > the git forges automatically. There were lots of requests from
>     users in the
>     > > > > past that tried to download a tarball from github and then wondered
>     why they
>     > > > > couldn't compile QEMU.
>     > > > >
>     > > > > - we include the submodule content in our release tarballs, so
>     people get
>     > > > > the impression that hte submodule content is part of the QEMU
>     sources. This
>     > > > > has two disadvantages:
>     > > > >  * We already got bug reports for the code in the submodule,
>     > > > >    where people did not understand that they should report that
>     > > > >    rather to the original project instead (i.e. you ship it - you
>     > > > >    own it)
>     > > > >  * People get the impression that QEMU is a huge monster
>     > > > >    application if they count the number of code lines, run
>     > > > >    their code scanner tools on the tarball contents, etc.
>     > > > >    Remember "nemu", for example, where one of the main complaints
>     > > > >    was that QEMU has too many lines of code?
>     > > > >
>     > > > > - If programs includes code via submodules, this gets a higher
>     > > > >   burder for distro maintainers, since they have to patch each
>     > > > >   and every package when there is a bug, instead of being able to
>     > > > >   fix it in one central place.
>     > > > >
>     > > > > So in my opinion we should avoid new submodules if there is an
>     alternative.
>     > > > >
>     > > > >  Thomas
>     > > >
>     > > > So looking at the latest proposals downloading files from CI,
>     > > > checksumming them etc etc. No auto checkout, not added automatically
>     > > > either, right?
>     > > >
>     > > > This seems to be the only difference:
>     > > > - we include the submodule content in our release tarballs
>     > >
>     > > That's just one of the issues with submodules. Working with them in
>     general
>     > > is not a pleasant experiance.
>     >
>     > This is what I asked about at the maintainers summit.
>     > I'd like to map the issues and see if there's anything
>     > we can do to solve them. In particular we will likely
>     > keep using submodules where we historically did
>     > so it's time well spent.
>     >
>     > I agree generally but the big question is what to replace these with.
>     > Below I assume the replacement is a script such as avocado or pytest
>     > with its own hashing, calling wget internally etc etc.
>     >
>     >
>     > > Thomas pointed out some of the issues, such
>     > > as 'git checkout' ignoring submodules, requiring extra steps to sync
>     them.
>     >
>     >
>     > Not different from a home grown SCM as part of test script, right?
> 
>     We're not building a home grown SCM as part of a test script, so
>     this answer is irrelevant.
> 
>     > > There's also the perenial problem that developers frequently send
>     > > patches that mistakenly include submodule changes,
>     >
>     > OK, so the thing to do would be to look for ways to exclude submodule
>     changes
>     > from git commits.
> 
>     If someone wants to make git suck less with submodules great, but needs
>     someone to actually do the work.
> 
> 
> A big part of the problem is knowing which of the following commands I have to
> do to undo the uncommitted changes, the committed changes, the staged changes,
> etc:
> 
> git submodule update --init --recursive
> git submodule update --init
> git submodule foreach --recursive git reset --hard
> git submodule foreach --recursive git clean -xfd
> git submodule foreach --recursive git clean -xfg
> 
> (all of these are in my history, I honestly don't know the difference between
> the last two).
> And each 'oops' takes time away from upstreaming bsd-user I don't really have
> that
> much of. I've wasted hours on this over the past year between all the different
> ways
> it can screw up.
> 
> To be fair, it is a relatively small fraction of the time, but as you can tell
> from the
> animation in my email it inspires much passion.
> 
> Warner
>  

OK this is understandable.

I think for what we do in qemu (never change upstream really)
	git submodule update --checkout testsub
	git update-index --skip-worktree testsub
is more or less what most people want.

This assumes you have a script that basically does
	git submodule deinit XYZ
	git submodule update --init XYZ
	git update-index --skip-worktree XYZ
each time, and do not need to work on the submodule proper.




>     > > I'd really like to see us doing more to eliminate as much use of
>     submodules
>     > > as is possible over time.p
>     >
>     > Or try to fix the problems, right?
> 
>     Again needs someone to actually make it happen.
> 
>     Meanwhile  QEMU already has an integrated test harness in the form
>     of Avocado that does everything needed. If Avocado had just been
>     used for this biosbits test in the first place, the test would
>     likely have already been merged to QEMU, instead of us having this
>     never ending debate on how to re-invent an alternative to what
>     already avocado does.
> 
>     With regards,
>     Daniel
>     --
>     |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange
>     :|
>     |: https://libvirt.org         -o-            https://fstop138.berrange.com
>     :|
>     |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange
>     :|
> 
> 
> 


