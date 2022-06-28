Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10355C015
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:08:38 +0200 (CEST)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6897-0003Aj-Uh
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o684k-0000vg-DK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o684i-0005An-D3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6zLfi3hqEWVQpR/4vUthw4EcxKS6cHGJ5Z2z1fV5r8=;
 b=iCXRb8cpNKlpaUYykFc0+0As4fDa0CjJ2ZDO9Yf+IAYSmhgDoexEtUC3F9w4mNkWmHvoFZ
 lhBIZteUxFw4lZdshuDY6bjSaeBMXcT4Min4yysXqHqMbnzM2xF9ykKSYMv1pN2Jw2wTZ7
 u1T/6bWyIQSsqhS2Qna66U1qqZzfuQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-wrrAcGJXOpm3MnluaA9vDA-1; Tue, 28 Jun 2022 06:04:02 -0400
X-MC-Unique: wrrAcGJXOpm3MnluaA9vDA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so5775344wmb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R6zLfi3hqEWVQpR/4vUthw4EcxKS6cHGJ5Z2z1fV5r8=;
 b=fqhtoyLRBGm6I5BGBRTFwn/m8zR1aZEWvdEYKZ64VH3G2Nd3dO5S2CQ/mBvlthWHLL
 US/Fn1a1UaY4qlMlaz5tDUOmC4MdNLiwsef5enlGd01gLy9L+4vKgSbQ4TSdx3ai5/y1
 2jUnWQJXES4aU/AVBikxYa72XOh9F6+A2tMrh8JfWFVWSj2oWzmm/h1NOLov8a2r0lUR
 k6i/xzdD4IlKfCe+7eDmQ1XLvQWTl51PSlYstkdNC6Hi4ZBuPZuhsSlKSrRKfBL/jqIN
 q/SlCyq1xM/tvZ6ET2RsZTeOBJX2V6s1SzLpmm2GB2ze6Qcd+F91MuTyvcGfkNCJC5Cm
 tFaQ==
X-Gm-Message-State: AJIora9h3fannkEHKkiGihX33XCgHwXrtB8I01Qra0RZ7z/sPk9y9AGd
 BqnkduxXRv1KgAjXYHVPXZObuFnDwxGbRdxTtyqX7w9WhXRViLuxDgSz8eg2+C3+Csv4uotuLkr
 ghvamUgrJLTlSn3g=
X-Received: by 2002:a5d:4e12:0:b0:21b:ae89:73e7 with SMTP id
 p18-20020a5d4e12000000b0021bae8973e7mr16368853wrt.386.1656410641547; 
 Tue, 28 Jun 2022 03:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBF0Cvy2jkk7TbaVtfJk2B4o0fPQwFaBKtDqqp5U/w3X0Mrwfr6iBCu2BCMnHmsJeV2//hNA==
X-Received: by 2002:a5d:4e12:0:b0:21b:ae89:73e7 with SMTP id
 p18-20020a5d4e12000000b0021bae8973e7mr16368827wrt.386.1656410641266; 
 Tue, 28 Jun 2022 03:04:01 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 bh7-20020a05600c3d0700b0039c948dbb61sm16502308wmb.26.2022.06.28.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:04:00 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:03:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628060210-mutt-send-email-mst@kernel.org>
References: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 02:19:41PM +0530, Ani Sinha wrote:
> 
> 
> On Tue, Jun 28, 2022 at 14:05 Ani Sinha <ani@anisinha.ca> wrote:
> 
>     On Tue, Jun 28, 2022 at 1:58 PM Thomas Huth <thuth@redhat.com> wrote:
>     >
>     > On 28/06/2022 10.23, Daniel P. Berrangé wrote:
>     > > On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
>     > >> On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrangé <
>     berrange@redhat.com> wrote:
>     > >>>
>     > >>> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
>     > >>>> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
>     > >>>>> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
>     > >>>>>>>>>>>> No problem with that. So that's venv. But do we need pip and
>     pulling
>     > >>>>>>>>>>>> packages from the net during testing?
>     > >>>>>>>>>>>
>     > >>>>>>>>>>> We do that too. See requirements.txt in tests/
>     > >>>>>>>>>>> Following two are downloaded:
>     > >>>>>>>>>>> avocado-framework==88.1
>     > >>>>>>>>>>> pycdlib==1.11.0
>     > >>>>>>>>>>>
>     > >>>>>>>>>>> Also see this line in Makefie.include:
>     > >>>>>>>>>>>
>     > >>>>>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>     > >>>>>>>>>>
>     > >>>>>>>>>> Right but that's avocado since it pulls lots of stuff from
>     > >>>>>>>>>> the net anyway.
>     > >>>>>>>>>> Are the libraries in question not packaged on major distros?
>     > >>>>>>>>>
>     > >>>>>>>>> Currently I only need this:
>     > >>>>>>>>> https://github.com/python-tap/tappy
>     > >>>>>>>>> which is the basic TAP processing library for python.
>     > >>>>>>>>>
>     > >>>>>>>>> It seems its only installed through pip:
>     > >>>>>>>>> https://tappy.readthedocs.io/en/latest/
>     > >>>>>>>>>
>     > >>>>>>>>> I do not think this is packaged by default. It's such a basic
>     library
>     > >>>>>>>>> for parsing test output that maybe we can keep this somewhere
>     within
>     > >>>>>>>>> the python src tree? Not sure ...
>     > >>>>>>>>
>     > >>>>>>>> It's pretty small for sure. Another submodule?
>     > >>>>>>>
>     > >>>>>>> Unlike BITS, this one is likely going to be maintained for a
>     while and
>     > >>>>>>> will receive new releases through
>     > >>>>>>> https://pypi.org/project/tap.py/
>     > >>>>>>> so forking is OK but someone has to keep this updated.
>     > >>>>>>>
>     > >>>>>>> I am open to anything. Whatever feels right is fine to me.
>     > >>>>>>
>     > >>>>>> John Snow is currently working on the "Pythonification" of various
>     QEMU
>     > >>>>>> bits, I think you should loop him into this discussion, too.
>     > >>>>>>
>     > >>>>>>    Thomas
>     > >>>>>
>     > >>>>> submodule does not mean we fork necessarily. We could have
>     > >>>>> all options: check for the module and use it if there, if not
>     > >>>>> use one from system if not there install with pip ..
>     > >>>>> But yea, I'm not sure what's best either.
>     > >>>>
>     > >>>> submodules create a dependency on an internet connection, too. So
>     before you
>     > >>>> add yet another submodule (which have a couple of other
>     disadvantages), I
>     > >>>> think you could also directly use the venv here.
>     > >>>
>     > >>> Definitely not submodules.
>     > >>>
>     > >>> We need to get out of the mindset that submodules are needed for
>     every new
>     > >>> dependancy we add. Submodules are only appropriate if the external
>     project
>     > >>> is designed to be used as a copylib (eg the keycodemapdb tool), or if
>     we
>     > >>> need to bundle in order to prevent a regression for previously
>     deployed
>     > >>> QEMU installs where the dependancy is known not to exist on all our
>     > >>> supported platforms.
>     > >>>
>     > >>> This does not apply in this case, because the proposed use of tappy
>     is
>     > >>> merely for a test case. Meson just needs to check if tappy exists and
>     if
>     > >>> it does, then use it, otherwise skip the tests that need it. The user
>     can
>     > >>> arrange to install tappy, as they do with the majority of other deps.
>     > >>>
>     > >>> If John's venv stuff is relevant, then we don't even need the meson
>     checks,
>     > >>> just delegate to the venv setup.
>     > >>>
>     > >>> Regardless, no submodules are needed or desirable.
>     > >>
>     > >> What about keeping biosbits stuff? Source or pre-built.
>     > >
>     > > Shipping them as pre-built binaries in QEMU is not a viable option
>     > > IMHO, especially for grub as a GPL'd project we need to be extremely
>     > > clear about the exact corresponding source and build process for any
>     > > binary.
>     > >
>     > > For this kind of thing I would generally expect the distro to provide
>     > > packages that we consume. Looking at biosbits I see it is itself
>     > > bundling a bunch more 3rd party projects, libffi, grub2, and including
>     > > even an ancient version of python as a submodule.
>     > >
>     > > So bundling a pre-built biosbits in QEMU appears to mean that we're in
>     > > turn going to unexpectedly bundle a bunch of other 3rd party projects
>     > > too, all with dubious license compliance. I don't think this looks like
>     > > something we should have in qemu.git or qemu tarballs. It will also
>     > > make it challenging for the distro to take biosbits at all, unless
>     > > those 3rd party bundles can be eliminated in favour of using existing
>     > > builds their have packaged for grub, python, libffi, etc.
>     >
>     > So if this depends on some third party binary bits, I think this is
>     pretty
>     > similar to the tests in the avocado directory ... there we download third
>     > party binaries, too... Wouldn't it make sense to adapt your tests to that
>     > framework?
> 
>     I do not want to bring in the whole avocado framework because it would
>     unnecessarily make things complicated. I just need the qemu machine
>     python library and that is enough. For downloading third party stuff,
> 
>     we can simply wget things from somewhere.
> 
> 
> https://pypi.org/project/wget/
> 
> That get_asset() call is an overkill for downloading two archives. 
> 

For biosbits if we are going this route then I feel a submodule is much
better.  It records which version exactly each qemu version wants.


> 
> 
>     >
>     >   Thomas
>     >
> 


