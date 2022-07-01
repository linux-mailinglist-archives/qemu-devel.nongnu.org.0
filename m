Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AED562CD7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 09:40:58 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7BGq-0003gw-GB
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 03:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7BF3-0002vI-8J
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7BEz-0004E8-So
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656661140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBjuhX8EBMDceANze/4DF6Mu72IuyU/WN1tpSqp/bK4=;
 b=A9iubWvTY+o4IAFDQve+8kwLC7VO2PZ8+K4/FO3dMwvHYiqhblp3rAM/l1aoei6oZGAmA6
 r8niwze0JGSTahM9vrzwjkCy/cIgNxpfEiQv81eEJBFaJ+dWjBshcrrzp4s+5dl2/BqWaf
 S2iMv34qL6Am9Q2IGDeYUXpQUDZuNjc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-l-H-niFmMjiAS_ToXJoslw-1; Fri, 01 Jul 2022 03:38:57 -0400
X-MC-Unique: l-H-niFmMjiAS_ToXJoslw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z19-20020a05640240d300b00437633081abso1235852edb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 00:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OBjuhX8EBMDceANze/4DF6Mu72IuyU/WN1tpSqp/bK4=;
 b=qs9Dji3SRT/Trog3KJAufQmqAMII5nXGqKKgZrKlvTHzg3Jj5d7Qfzh5UfjB89KjuX
 jHvQCcLyzUwV7N19u4HpMbvmefFoWwWS0B14Nl+/oWja/HutvKcOLd+J9M3/ZFtAaqi3
 QRDMArwZBNwUQ7IXSNq5RAvQ05byUcn4SDJ5xr5vf0eBeaSEdkXQI4/5Nr61y4Ltqjsp
 /PWtfTnut9qeMGALfSCnsBXTC5X5fuzsyABa5L163SfANynOG8I0OHMJrE/JhhVVYUa7
 PDrB6vB8i9j2ZGvMT4dSOpBe2fQ9hBlfwDaQEYbK89E7kJNkASWiq2Fo63Y3kPtFuZbP
 H6TQ==
X-Gm-Message-State: AJIora+6ig0x8RSStNjidV8aSM7lV+epupQScGUCSODuGfGKV+p6PwI0
 ImXjgAej1/aERygBF1dZbUWURDfBeBk4U5p+KNePeSuV6f/YanbyymKnG6hkz/n7ginlKU7t+Ne
 5NJMumFmMYeyzZns=
X-Received: by 2002:a05:6402:34c2:b0:436:7edf:ba with SMTP id
 w2-20020a05640234c200b004367edf00bamr17634194edc.67.1656661136140; 
 Fri, 01 Jul 2022 00:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjXRPrecrjmRBICYfwEwJJyg5jN7iVxXPdNfQpT0st0ip3xFfpBcome3YeH+Sz/CoJ7Phy9Q==
X-Received: by 2002:a05:6402:34c2:b0:436:7edf:ba with SMTP id
 w2-20020a05640234c200b004367edf00bamr17634173edc.67.1656661135929; 
 Fri, 01 Jul 2022 00:38:55 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 hb10-20020a170906b88a00b007266185ca67sm8033074ejb.150.2022.07.01.00.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 00:38:55 -0700 (PDT)
Date: Fri, 1 Jul 2022 03:38:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220701033006-mutt-send-email-mst@kernel.org>
References: <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
 <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
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

On Fri, Jul 01, 2022 at 12:58:33PM +0530, Ani Sinha wrote:
> On Fri, Jul 1, 2022 at 12:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 01, 2022 at 06:12:14AM +0200, Thomas Huth wrote:
> > > I even wouldn't mind if you put your python stuff in a new directory like
> > > tests/pytests/ for example, as long as it downloads your binaries separately
> > > - as I wrote in another mail, the avocado framework rather looks like an
> > > oddball in our test framework nowadays since it uses a separate test runner
> > > and not the meson test harness, so having a new approach for python-based
> > > tests is maybe even a good idea. I just really want to avoid that this goes
> > > into tests/qtest (since it really does not belong there), and please don't
> > > add more external stuff via git submodules, that's really the wrong approach
> > > for this.
> >
> > I get it, people hate submodules with passion.  I think trying another
> > approach for testing that is neither avocado nor qtest is
> > not too bad. As long as this is not user visible, we can
> > allow ourselves space to experiment.
> >
> > OK so, how about this:
> > - put it in a new directory: tests/roms?
> > - create repo for a fork of biosbits under git.qemu.org
> > - roll our own analog to git submodules: a script
> >   that clones the repo
> 
> No need to clone the whole repo. We can simply download the binaries
> that the girlab CI job would generate from the bits sources in that
> repo.
> We need to clone if we are always building bits from source for every
> test. That is not necessary IMHO since much of the bits package would
> remain as is without modification.

IMHO CI job idea isn't great since isn't versioned at all, is it?
Also as long as test passes, sure. But if it fails one will
need the sources to investigate.

Let's start with building things from source. Add an option
of prebuilt binaries as an optimization once things
stabilize.


> > - new target make check-roms,
> 
> I think make pytest or some such is better and more generic if other
> such tests in other areas follow suit.

The name is not critical in my mind, but I think we need to decide
what exactly differentiates it from other tests.


> 
> if the clone exists locally -
> >   run the test, if not - skip it
> 
> if download of the bits binaries fail, skip it.

You seem to be recreating either git or avocado or both here.

Personally I want something that works offline.



> > - as for using pre-generates ISOs as an optimization,
> >   I'm not sure how important that is, if yes -
> >   we can add another repo and another make target along the
> >   same lines
> >
> >
> >
> > --
> > MST
> >


