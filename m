Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AF5630F1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:05:01 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DWG-0002dN-EF
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7DAI-0002gb-7x
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7DAF-00039V-9X
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656668534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QHSnzeO2M2nAQgGZuxqdfWv9n5f1UUOBlLFIF753rHE=;
 b=C1ti4B2mi02PhF7CVjBC7yluGWYVyohTL+xujgYi7fYId0dRtYiXYySjyiFwYZZroCo5KQ
 CmtvVoEdwtN9jPreUurATOAdpvVoj/VHrIP0TvuQCvKY5BKKYBg9apaeMK7u1qdHp1VWRH
 ZPZMMljzc53jjsxxv3qi5fS8v4+kQKg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-uYO54yjNNwujklijfJ2hRw-1; Fri, 01 Jul 2022 05:42:13 -0400
X-MC-Unique: uYO54yjNNwujklijfJ2hRw-1
Received: by mail-ej1-f71.google.com with SMTP id
 ne36-20020a1709077ba400b00722d5f547d8so552695ejc.19
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 02:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QHSnzeO2M2nAQgGZuxqdfWv9n5f1UUOBlLFIF753rHE=;
 b=NNOfZpbWHfMyEo7Ffu1I/8I6FlpnKKLe9oYcmPr5dZAdzBi/udq9atSPJhE0YTVq0X
 nca4KVIt0MoH8tXUCbC5pNWkSffKbOCQfdYFGFpdtzi4JWsOsFRZK+xKxcdNaHtHdlWs
 pBJ3Xjrpv0vSE20DGBafyN/PuippPwp2brwt/x200GhB9+vCh6mvz6mVA/3UU4flTbjP
 K1Egqo6J62OaOgLdRu54tdKStVWXo8/W+VsWtP9Q3wgLLxRXEjsypZ6WJ6bxYGeqIv5j
 45GZvuQpfY8oTw4aWuwNhMr36XQnFBENgc5iMi0ubZWo/2xQmVaixyNBU8VuKCB+N4qW
 fhUg==
X-Gm-Message-State: AJIora/zEo5vkiIiOkmkm59AZ05iqMgWcFvsn7Afu86Pq4Qt8hbgI9cy
 kiJ8xA2XmwiQLB3+1avifqZZPFNlfJIa6+RLeWdw9++eC4ZhsOMKSi1/o+Idt+pMMzAxnJPeFiB
 mxK5oAwC4b41SG+M=
X-Received: by 2002:a17:906:b78f:b0:726:9341:5d62 with SMTP id
 dt15-20020a170906b78f00b0072693415d62mr13395740ejb.571.1656668532277; 
 Fri, 01 Jul 2022 02:42:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLypOuP3b3+b9Bjpd4miqfLVV/pi0iu9Xuu6S0zw/n0hBzT8NNgoiz6/yhJRjWmMLj4RCUFw==
X-Received: by 2002:a17:906:b78f:b0:726:9341:5d62 with SMTP id
 dt15-20020a170906b78f00b0072693415d62mr13395718ejb.571.1656668532025; 
 Fri, 01 Jul 2022 02:42:12 -0700 (PDT)
Received: from redhat.com ([2.55.35.209]) by smtp.gmail.com with ESMTPSA id
 b3-20020a17090636c300b00726b8e84c1asm5687681ejc.21.2022.07.01.02.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 02:42:11 -0700 (PDT)
Date: Fri, 1 Jul 2022 05:42:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220701053949-mutt-send-email-mst@kernel.org>
References: <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
 <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
 <20220701033006-mutt-send-email-mst@kernel.org>
 <CAARzgwwhrsG1EkA9=kH9Y456_Yz5KEA9tMQoQ6wGufoPGTu69w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwwhrsG1EkA9=kH9Y456_Yz5KEA9tMQoQ6wGufoPGTu69w@mail.gmail.com>
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

On Fri, Jul 01, 2022 at 01:20:30PM +0530, Ani Sinha wrote:
> On Fri, Jul 1, 2022 at 1:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 01, 2022 at 12:58:33PM +0530, Ani Sinha wrote:
> > > On Fri, Jul 1, 2022 at 12:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Fri, Jul 01, 2022 at 06:12:14AM +0200, Thomas Huth wrote:
> > > > > I even wouldn't mind if you put your python stuff in a new directory like
> > > > > tests/pytests/ for example, as long as it downloads your binaries separately
> > > > > - as I wrote in another mail, the avocado framework rather looks like an
> > > > > oddball in our test framework nowadays since it uses a separate test runner
> > > > > and not the meson test harness, so having a new approach for python-based
> > > > > tests is maybe even a good idea. I just really want to avoid that this goes
> > > > > into tests/qtest (since it really does not belong there), and please don't
> > > > > add more external stuff via git submodules, that's really the wrong approach
> > > > > for this.
> > > >
> > > > I get it, people hate submodules with passion.  I think trying another
> > > > approach for testing that is neither avocado nor qtest is
> > > > not too bad. As long as this is not user visible, we can
> > > > allow ourselves space to experiment.
> > > >
> > > > OK so, how about this:
> > > > - put it in a new directory: tests/roms?
> > > > - create repo for a fork of biosbits under git.qemu.org
> > > > - roll our own analog to git submodules: a script
> > > >   that clones the repo
> > >
> > > No need to clone the whole repo. We can simply download the binaries
> > > that the girlab CI job would generate from the bits sources in that
> > > repo.
> > > We need to clone if we are always building bits from source for every
> > > test. That is not necessary IMHO since much of the bits package would
> > > remain as is without modification.
> >
> > IMHO CI job idea isn't great since isn't versioned at all, is it?
> 
> bits is versioned yes, in a crude way. every time you make a commit in
> the top level repo, the version would increment by one.

Is it easy to find out which source was this generated from?
And is there a promise to keep these around indefinitely?

> > Also as long as test passes, sure. But if it fails one will
> > need the sources to investigate.
> 
> sources might also be needed to write the tests.
> 
> >
> > Let's start with building things from source.
> 
> hmm. bitys uses old autotools, not ninja and takes about 10/15 mins to
> build depending on parallelity and build host.

Right. But whoever wants to use these just needs to do it once.


> Add an option
> > of prebuilt binaries as an optimization once things
> > stabilize.
> >
> >
> > > > - new target make check-roms,
> > >
> > > I think make pytest or some such is better and more generic if other
> > > such tests in other areas follow suit.
> >
> > The name is not critical in my mind, but I think we need to decide
> > what exactly differentiates it from other tests.
> >
> >
> > >
> > > if the clone exists locally -
> > > >   run the test, if not - skip it
> > >
> > > if download of the bits binaries fail, skip it.
> >
> > You seem to be recreating either git or avocado or both here.
> >
> > Personally I want something that works offline.
> >
> >
> >
> > > > - as for using pre-generates ISOs as an optimization,
> > > >   I'm not sure how important that is, if yes -
> > > >   we can add another repo and another make target along the
> > > >   same lines
> > > >
> > > >
> > > >
> > > > --
> > > > MST
> > > >
> >


