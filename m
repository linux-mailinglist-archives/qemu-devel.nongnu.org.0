Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB955C094
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:11:21 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o697n-00080c-Dt
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68y0-0002oj-Jb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68xv-0007lX-Bj
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656414066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uuClk7+YfMOE80H837bo/H/mUNUW647IlRb7YjkkjIA=;
 b=ir9LSVoXCcDBUnHapDgf+/0kW7ZXwpgWX18TlGebuFcI8Br/beFSaElC87KDxnoWNlf5KI
 bQyb5AKs03AuitoUz6kj9UAbdfbAci8nuGmhcKhSVVUbbxgFu4x+m+54TgDBMvcff5LhFP
 h1D0lUWliKvDhKp6W6ub6qd1iIeJWqU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-ujI1Kcq3Nfe0Ow97BF8LkQ-1; Tue, 28 Jun 2022 07:01:04 -0400
X-MC-Unique: ujI1Kcq3Nfe0Ow97BF8LkQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r132-20020a1c448a000000b003a02a3f0beeso586704wma.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uuClk7+YfMOE80H837bo/H/mUNUW647IlRb7YjkkjIA=;
 b=aN5CkkWgKgazXAEzcr0I9Zm4jGFmo41TgmsAtQPmI5mMJm+InCYJZ0gNXiQhHIQjaa
 +7WTH1gY1LnviikVBIQjXv4IqM9LrbgaCYm0V1C7PByIt/KejFCGlwD2CdtNzcWqKZQr
 apvsi8t4xTnpmdrq8xCl0XjP9d6+Wvo1FzS6yvean0uHOVx68Tc7Q8lmejRsJnmInznX
 kW7XjoTxRY15NkPr++ADaUkQTre3IHkRri0DZyT6Pb740iZgDnZ5S3w3iOpUwNHEBPeE
 SLxzz79rawI6rA4Py5pCgIjfa1Ti69TywkvBn0cbaKJ7BeWIvzoNZwjHu+I5bEX9xosI
 u1PA==
X-Gm-Message-State: AJIora/z791COGbR3QhmhC+QXycL/wUj4U49WTBd8TaE/6K0vNN8vhrH
 83kZKlc9opWq2lRgT/71zxom2cuqwTcfe5cEaoi2SqLaIfNrsNQCD+V3qyiplqUNJZVnj0E1reX
 GYxYyBaSRPBT580k=
X-Received: by 2002:a05:6000:1e0f:b0:21b:b032:6b3d with SMTP id
 bj15-20020a0560001e0f00b0021bb0326b3dmr17844493wrb.337.1656414063701; 
 Tue, 28 Jun 2022 04:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoRjQm8qTJAY5a5bWgNlaW8xWdouexy2Ap96PO7Dixc6nLdxSiI2WyraGrb1SRvhh/ujeCAA==
X-Received: by 2002:a05:6000:1e0f:b0:21b:b032:6b3d with SMTP id
 bj15-20020a0560001e0f00b0021bb0326b3dmr17844450wrb.337.1656414063338; 
 Tue, 28 Jun 2022 04:01:03 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 r68-20020a1c2b47000000b0039c4b518df4sm20628453wmr.5.2022.06.28.04.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:01:02 -0700 (PDT)
Date: Tue, 28 Jun 2022 07:00:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220628064831-mutt-send-email-mst@kernel.org>
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
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

On Tue, Jun 28, 2022 at 11:43:58AM +0100, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 11:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
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
> >
> > I think we can skip the checkout in the tarball if we like.
> > If people want to run the test they can checkout then.
> 
> For tarballs and submodules, we want to provide the code in the
> cases where we're providing binary blobs, and for where it's
> required to build QEMU proper.
> 
> Overall I think that the approach we use today for providing
> guest binaries (submodules with the code, pre-built blobs checked
> into git) is creaking at the seams and often awkward for downstream
> distros (who want to rebuild the binaries anyway).
> 
> Plus submodules in general in git work really badly and awkwardly,
> and I'd rather we didn't add them unless we really must.
> 
> We already have an approach for "tests that use binaries" --
> the avocado test suites. Is that something we could use in this
> case ?
> 
> thanks
> -- PMM

From experience avocado is basically rolling its own reimplementation of
git fetch. Result is weird failures when some corner case or another
isn't handled perfectly. Kind of unavoidable since you can't have
ISOs for a ton of guest OSes reasonably in a git repo. Well maybe
with sparse checkouts you can. Haven't really looked at it.

These specific tests are weird, kind of special in that they are developer
oriented.  I *would* like anyone making changes to ACPI to run them, and
for CI to run them on patches, but I do not believe e.g. distros
necessarily need them.

git submodules are awkward basically because they are an automated wget.
I don't think an explicit wget is much better ... but
looks like I'm alone in this. Oh well.
So it will be a weird dance of wget a tarball, unpack, generate
ISO and run. God help you if you need to patch the test - it's
wget all the way down.


-- 
MST


