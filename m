Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50F5EDD77
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:04:38 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWjt-0000AV-RY
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTHr-0005nD-9h
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTHp-0001JD-5o
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664357004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGpVIVbRbGo/RSqxslHzJ9b46uLT3GvEo0fw3Zb7PCo=;
 b=H9gdEJHsb0dLOFkS+yLWzFhAz9f0u9pqcuU5o9mPN0DWQvvcfsMVGay6M8dA2qMmsExZeZ
 eA4nYrgKLJWG5Q3RkAig+Fmfi9o5NbRD6u2EZyzAeFKLc0M8F/1eEvyENGza62vHgXYcFL
 LtBPBDPpgWwZiwdKKKbm2yYGaazkIBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-MEP3eRabMdWCKFdUjtMM1Q-1; Wed, 28 Sep 2022 05:23:22 -0400
X-MC-Unique: MEP3eRabMdWCKFdUjtMM1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b0022cc38d5a8fso832088wrc.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FGpVIVbRbGo/RSqxslHzJ9b46uLT3GvEo0fw3Zb7PCo=;
 b=RjIUM53qwtfl4ex9287j68ebPQd2aSS6zwyx356c8iJ6NjsqT3roKv7bFUjmtrPUnf
 OHYO33YvOWhrQbVZrEKPo8PfPyaN2WEcxwKiTa+FECS5Z4s9WJsjyUbE9I3yCYUiAhuu
 o1womS9W/itbYutr1ntJKj1LCbKaBe4brOFipOfN6ktIJVKacP1giHi0Cy4MHhbntzV7
 m4RcWfWhn85SOkRxHOtl6EigPbH6RJmI/Zj+EtELneabuXK+jOD3hznMTLw3M7S9i8UX
 Cggr606p6N250BaaOZU2FAibswDMdJFxjXhf7+7niKKEMCI5CAaL2Cf85UyCWK41M3Sr
 QzOA==
X-Gm-Message-State: ACrzQf3lv8gECgkc6CHA4C/lJSGX8m6orcbgWAGkEd0/s3X7m0AtMDUx
 gc/KmN8qV6+njOu+TQTenE4xSrggrrgdoYtbczKxmx0EdJoydTAzNiulEYD41dipc9qx0qdqJdB
 l54Udav1o+W9OKgg=
X-Received: by 2002:a5d:5f0a:0:b0:228:dff9:5f7e with SMTP id
 cl10-20020a5d5f0a000000b00228dff95f7emr18900383wrb.601.1664357001677; 
 Wed, 28 Sep 2022 02:23:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zeEWT3HdrWdHqLdVbZvX+d7Y3tunhF1mI0ku/lcGJDpzh3dwS+D4AiGM3uKsE+Jwl/tqNmw==
X-Received: by 2002:a5d:5f0a:0:b0:228:dff9:5f7e with SMTP id
 cl10-20020a5d5f0a000000b00228dff95f7emr18900364wrb.601.1664357001456; 
 Wed, 28 Sep 2022 02:23:21 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b003b47b913901sm5925956wms.1.2022.09.28.02.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:23:20 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:23:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
Message-ID: <20220928052131-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
 <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
 <YxdG4LISpDFvBr0k@redhat.com>
 <20220927172212-mutt-send-email-mst@kernel.org>
 <28f3d1b1-f17f-e5b3-99aa-772fef2a9d94@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28f3d1b1-f17f-e5b3-99aa-772fef2a9d94@redhat.com>
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

On Wed, Sep 28, 2022 at 09:32:57AM +0200, Thomas Huth wrote:
> On 27/09/2022 23.26, Michael S. Tsirkin wrote:
> > On Tue, Sep 06, 2022 at 02:10:56PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Jul 12, 2022 at 12:22:10PM +0530, Ani Sinha wrote:
> > > > 
> > > > 
> > > > On Mon, 11 Jul 2022, John Snow wrote:
> > > > 
> > > > > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > > 
> > > > > > Integrate the pytest framework with the meson build system. This will make meson
> > > > > > run all the pytests under the pytest directory.
> > > > > > 
> > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > ---
> > > > > >   tests/Makefile.include   |  4 +++-
> > > > > >   tests/meson.build        |  1 +
> > > > > >   tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
> > > > > >   3 files changed, 53 insertions(+), 1 deletion(-)
> > > > > >   create mode 100644 tests/pytest/meson.build
> > > > > > 
> > > > > > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > > > > > index 3accb83b13..40755a6bd1 100644
> > > > > > --- a/tests/Makefile.include
> > > > > > +++ b/tests/Makefile.include
> > > > > > @@ -3,12 +3,14 @@
> > > > > >   .PHONY: check-help
> > > > > >   check-help:
> > > > > >          @echo "Regression testing targets:"
> > > > > > -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> > > > > > +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
> > > > > 
> > > > > Does this mean that "make check" *requires* an internet connection?
> > > > 
> > > > No. My test will be skipped if it is unable to download the artifacts it
> > > > requires due to lack of Internet connectivity.
> > > 
> > > That's not the only concern, there are also people who have metered
> > > internet connections, or whose connections are slow and thus have
> > > long download times. Any test that downloads should be opt-in only.
> > > 
> > > 
> > > With regards,
> > > Daniel
> > 
> > <rant>
> > This is why I wanted git submodules. A well understood decentralized
> > model. Now we are reinventing them badly.
> 
> I don't see much of a difference here with submodules with regards to
> Daniel's concerns: If you clone the QEMU repo with a good internet
> connection, you also don't get the submodules by default. If you then move
> to a bad internet connection or offline and the build system tries to pull
> in the submodule, you've also lost.
> OTOH, with downloads, you can also make sure to have all downloads cached
> while you're still on the good internet connection. The cache should
> continue working if you're then moving offline.

submodules as a cache include checksumming, a way to make local
changes without too much pain, documentation ....


> > I asked on the maintainers summit what issues people have with
> > submodules, no one volunteered any information.
> 
> You know my position already (https://lore.kernel.org/qemu-devel/d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com/),
> so at least I did not feel the need to repeat that again (and we were pretty
> short in time anyway).

Pity, but ok, I will revive that thread.

> 
>  Thomas


