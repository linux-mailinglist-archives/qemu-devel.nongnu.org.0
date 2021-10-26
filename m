Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59543B357
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:44:24 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMkZ-00051f-Bd
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfMiG-0001q2-0q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfMiD-00028U-Le
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635255716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELNVVjNjf8B8aRXCCnqx015VEmcugb9PIsM4FcgJ+dw=;
 b=bJE3Eb4Ds5+IPWsd3cG+UaF3zx1Wyq1VXx7ljjLQhKXREAY54bj68CDpud0rpa0PI/5GK8
 JdeztgswowN2xUrB+QrKmEBE2VZVLEvdknC8edQYEUJPVgZycJIxOyQYW8po9jLb4ePdK1
 N6e5jGs68gLkdmw6UDFKXsER6Db4mc0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-cDwH7QsMNHaSQFYVvdxCqg-1; Tue, 26 Oct 2021 09:41:53 -0400
X-MC-Unique: cDwH7QsMNHaSQFYVvdxCqg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x13-20020a05640226cd00b003dd4720703bso7129455edd.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 06:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ELNVVjNjf8B8aRXCCnqx015VEmcugb9PIsM4FcgJ+dw=;
 b=2VHOg0MELS2zQ9nVqusAZOXIHTe0G6Vur8Q4HVkXEW/nrS94TAoAc5e/KpxSoiUaOC
 U9VJ5HBMtU+lr2HoVY0CCro2pm6QmiUIrKBPeqitbDjJ0w5Pq1wZ7Dke5RMm2xbBqI6/
 /3HFIh3uqjzBtyfNg9MnRGqeBIqC7rjFwsPpm0jF7V73pjepZ2mXOGoLJ9H6xl4dEBVB
 q2JiE3Idw06RiPLJUVEWbirLICWcFo/S4+93ilbd9TN2Ge6acU/3qJ51ByvaKW/5WqTu
 VeDAx4p8+6OtonSnAMbHgKIr7eAJG4CadAGoZYQbn3KD3qec/DmvNPCj+L0cMMvW0D8f
 OwgQ==
X-Gm-Message-State: AOAM532Oy8N4Y3IJ+5ybTaaCwbelRfve5vJCri7BdAuaUq9/hoo4+060
 FDb/EvE0yC+th5/z1T0uuTt2ON2oCx1tCiTe0YXL2N1q0RmbZzdkBwRYmeTBKU30GZ5iV9c2zEV
 KW+Lh7Xw9Va48yds=
X-Received: by 2002:a17:906:fb0e:: with SMTP id
 lz14mr24871226ejb.289.1635255712731; 
 Tue, 26 Oct 2021 06:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT0R3N2TqVY7MxNR6aJZNsqfqYdVRuWU+4OYxu6+xLLb9rWeJO9RJIMbiYlusXYykT6hf8vg==
X-Received: by 2002:a17:906:fb0e:: with SMTP id
 lz14mr24871190ejb.289.1635255712512; 
 Tue, 26 Oct 2021 06:41:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id hp13sm7526496ejc.66.2021.10.26.06.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 06:41:51 -0700 (PDT)
Date: Tue, 26 Oct 2021 15:41:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PULL v2 02/44] tests: qtest: add qtest_has_accel() to check if
 tested binary supports accelerator
Message-ID: <20211026154150.301f4887@redhat.com>
In-Reply-To: <CAKf6xpvZjvFMNOersS-dSxDOffNeOmhcL2y_36_xOnuPUsrEMQ@mail.gmail.com>
References: <20211020101844.988480-1-mst@redhat.com>
 <20211020101844.988480-3-mst@redhat.com>
 <CAKf6xpvZjvFMNOersS-dSxDOffNeOmhcL2y_36_xOnuPUsrEMQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Oct 2021 09:04:43 -0400
Jason Andryuk <jandryuk@gmail.com> wrote:

> On Wed, Oct 20, 2021 at 6:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Igor Mammedov <imammedo@redhat.com>
> >
> > Currently it is not possible to create tests that have KVM as a hard
> > requirement on a host that doesn't support KVM for tested target
> > binary (modulo going through the trouble of compiling out
> > the offending test case).
> >
> > Following scenario makes test fail when it's run on non x86 host:
> >   qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288
> >
> > This patch introduces qtest_has_accel() to let users check if accel is
> > available in advance and avoid executing non run-able test-cases.
> >
> > It implements detection of TCG and KVM only, the rest could be
> > added later on, when we actually start testing them in qtest.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  tests/qtest/libqos/libqtest.h |  8 ++++++++
> >  tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
> >  meson.build                   |  6 ++++++
> >  3 files changed, 41 insertions(+)
> >
> > diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> > index a68dcd79d4..59e9271195 100644
> > --- a/tests/qtest/libqos/libqtest.h
> > +++ b/tests/qtest/libqos/libqtest.h
> > @@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
> >   */
> >  const char *qtest_get_arch(void);
> >
> > +/**
> > + * qtest_has_accel:
> > + * @accel_name: Accelerator name to check for.
> > + *
> > + * Returns: true if the accelerator is built in.
> > + */
> > +bool qtest_has_accel(const char *accel_name);
> > +
> >  /**
> >   * qtest_add_func:
> >   * @str: Test case path.
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 73f6b977a6..25aeea385b 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -922,6 +922,33 @@ const char *qtest_get_arch(void)
> >      return end + 1;
> >  }
> >
> > +bool qtest_has_accel(const char *accel_name)
> > +{
> > +    if (g_str_equal(accel_name, "tcg")) {
> > +#if defined(CONFIG_TCG)
> > +        return true;
> > +#else
> > +        return false;
> > +#endif
> > +    } else if (g_str_equal(accel_name, "kvm")) {
> > +        int i;
> > +        const char *arch = qtest_get_arch();
> > +        const char *targets[] = { CONFIG_KVM_TARGETS };
> > +
> > +        for (i = 0; i < ARRAY_SIZE(targets); i++) {  
> 
> A xen osstest build fails with:
> ../qemu-xen-dir-remote/tests/qtest/libqtest.c: In function 'qtest_has_accel':
> ../qemu-xen-dir-remote/tests/qtest/libqtest.c:938:23: error:
> comparison of unsigned expression < 0 is always false
> [-Werror=type-limits]
>          for (i = 0; i < ARRAY_SIZE(targets); i++) {
>                        ^
> 
> Super long osstest log
> here:http://logs.test-lab.xenproject.org/osstest/logs/165703/build-i386-xsm/6.ts-xen-build.log
> 
> It was configured like:
> $source/configure --enable-xen --target-list=i386-softmmu \
> --enable-debug \
> --enable-trace-backend=log \
> --prefix=/usr/local \
> --libdir=/usr/local/lib/xen/lib \
> --includedir=/usr/local/lib/xen/include \
> --extra-cflags="-DXC_WANT_COMPAT_EVTCHN_API=1 \
> -DXC_WANT_COMPAT_GNTTAB_API=1 \
> -DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
> -DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
> " \
> --extra-ldflags="-Wl,-rpath,/usr/local/lib/xen/lib" \
> --bindir=/usr/local/lib/xen/bin \
> --datadir=/usr/local/share/qemu-xen \
> --localstatedir=/var \
> --docdir=/usr/local/lib/xen/share/doc \
> --mandir=/usr/local/lib/xen/share/man \
> --libexecdir=/usr/local/lib/xen/libexec \
> --firmwarepath=/usr/local/lib/xen/share/qemu-firmware \
> --disable-kvm \
> --disable-docs \
> --disable-guest-agent \
> --python=python3 \
> --cpu=i386 ;
> 
> --cpu=i386 may be important?  osstest is building in a 32bit debian
> environment.  My 64bit fedora workstation fails to configure with
> --cpu=i386, and it builds successfully without it.
> 
> Maybe add #if defined(CONFIG_KVM) around the code like CONFIG_TCG above?

Thanks for reporting, I'll post fix in a moment.

> Regards,
> Jason
> 


