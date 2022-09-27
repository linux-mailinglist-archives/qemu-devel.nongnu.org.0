Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778595ECF49
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:27:56 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odI7O-000524-ME
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odI5o-0003Zu-QC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odI5m-0005Tu-TG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664313974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnktkC+bSpxfablCVmo6y44LdRxM+8fWqJxbAyFalNg=;
 b=Vfxxau//sfugWIEltNWrKKIqysjlPpd6A6e+AJtO0Gvhn6eZlbJmKdyHvPqJR5OSyZPPBY
 GsIaRxx03AeLQQJLn4KI/v53CZHB5yj5Ds5Ja8k0ppNflGyhtr75xMYnCRKBuZ35cn4Fdu
 vg22gRArrNFo9CmJia9MuBOFTuhTRQ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-o4ahFWvDNZqjpRgvB4rbVA-1; Tue, 27 Sep 2022 17:26:13 -0400
X-MC-Unique: o4ahFWvDNZqjpRgvB4rbVA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so9162242wms.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WnktkC+bSpxfablCVmo6y44LdRxM+8fWqJxbAyFalNg=;
 b=D857AqlEKA7BpZ4XBGXe69mSM70DShdirIYnc1LoNj/er9c2TViLt0ohgx9Szwg8FQ
 Wgj7NDrsR3RMKeisNit9VYKYYOiKx/QNY5jKC5WzP0IYPcIppxBNUqUKyeApcxtTaXzy
 Pl+UwKm95kL9PYzScIEA9i3ZfwIototLFJtJP3VGFzgq4W2zXXBTWkJlYLAodwPjA855
 skvE3YFMma6GMaSCQ41UOisjgTCjClXrOZ6+A13BzB1JPAreICDGrlWkteMxj45ia2BN
 TqRQu7hrHnB10g46Sz0Ok3sj2mM39soYfFpFJExFicQspOxaxXSfPJXVL0xo/dIJxC/y
 Wetg==
X-Gm-Message-State: ACrzQf0F13Of0/suxLBqmfI+JY8vCwrPVKTqLgoR0+QbpAQAQiGo+kzW
 I5SzyuKY5I2NHv7wd79VT2W+qGO0LkX1OkHS3fT2gHuDCvoCXJTG7bZjeFaI1netdbrXfpvaAVP
 NDwzg03AVEGPScW4=
X-Received: by 2002:a05:6000:1e0d:b0:22c:aa08:5272 with SMTP id
 bj13-20020a0560001e0d00b0022caa085272mr7155765wrb.296.1664313970736; 
 Tue, 27 Sep 2022 14:26:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OeP/IeDIOCKZny2GdEpdDmlHs0yhMJK343fIliOgjs7R5PcLCtVDV7ed+/gBN6EwgreY+3w==
X-Received: by 2002:a05:6000:1e0d:b0:22c:aa08:5272 with SMTP id
 bj13-20020a0560001e0d00b0022caa085272mr7155752wrb.296.1664313970459; 
 Tue, 27 Sep 2022 14:26:10 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c379800b003b483000583sm2572306wmr.48.2022.09.27.14.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:26:10 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:26:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
Message-ID: <20220927172212-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
 <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
 <YxdG4LISpDFvBr0k@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxdG4LISpDFvBr0k@redhat.com>
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

On Tue, Sep 06, 2022 at 02:10:56PM +0100, Daniel P. Berrangé wrote:
> On Tue, Jul 12, 2022 at 12:22:10PM +0530, Ani Sinha wrote:
> > 
> > 
> > On Mon, 11 Jul 2022, John Snow wrote:
> > 
> > > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > Integrate the pytest framework with the meson build system. This will make meson
> > > > run all the pytests under the pytest directory.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  tests/Makefile.include   |  4 +++-
> > > >  tests/meson.build        |  1 +
> > > >  tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 53 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tests/pytest/meson.build
> > > >
> > > > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > > > index 3accb83b13..40755a6bd1 100644
> > > > --- a/tests/Makefile.include
> > > > +++ b/tests/Makefile.include
> > > > @@ -3,12 +3,14 @@
> > > >  .PHONY: check-help
> > > >  check-help:
> > > >         @echo "Regression testing targets:"
> > > > -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> > > > +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
> > >
> > > Does this mean that "make check" *requires* an internet connection?
> > 
> > No. My test will be skipped if it is unable to download the artifacts it
> > requires due to lack of Internet connectivity.
> 
> That's not the only concern, there are also people who have metered
> internet connections, or whose connections are slow and thus have
> long download times. Any test that downloads should be opt-in only.
> 
> 
> With regards,
> Daniel

<rant>
This is why I wanted git submodules. A well understood decentralized
model. Now we are reinventing them badly.
I asked on the maintainers summit what issues people have with
submodules, no one volunteered any information.
It might make sense to figure out if there's a way to
use submodules sanely.

</rant>


Anyway, download should just be done separately,
make check should just verify it has the correct binary
and if not fail.

And I'd like to have a target that fails if it can not
run the tests a opposed to skipping.



> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


