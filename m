Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53B2C53D8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:19:22 +0100 (CET)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGF7-0000Cp-4Y
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kiG9B-00055I-1x
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kiG98-00043L-9H
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606392789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bknT7GirI8IHOqG+cTLloJAY1Ffnv5XtW86WlGJa+jE=;
 b=EGrPw9tVCGBPMRRNgMGqYGPSO3LC0eV6KgcHC50nGJfKBr3gaBInVuifTgsv99S15aQ8b6
 DCrjEpYz2PjBsce87wbvUu9joy3El+tgIh4SU7fV01tXWjPQuFsBhVFGOyYzjuH+3sLV6d
 dBMR4wI/Q/Jebvpj1OgA0pifx2bmOIA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-9CLxMmCjOQ2k1FlbexGHMA-1; Thu, 26 Nov 2020 07:13:07 -0500
X-MC-Unique: 9CLxMmCjOQ2k1FlbexGHMA-1
Received: by mail-il1-f200.google.com with SMTP id u17so1218489ilb.4
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bknT7GirI8IHOqG+cTLloJAY1Ffnv5XtW86WlGJa+jE=;
 b=hSLIrQS/kaHJEgYAG2GphJ9vYfmacljRfaC+bpTZjouXw8JfcEP9yeVuJcc+uetH7s
 p6WJkzAT5EV99RbHLRUt9YX83ujztvvYx/VjCDUyc8tKGoSJ/Flll4KCitew8m1uogze
 LiY7AOHiPvnFa8FQn/SujX55k567T/FOhiiFha/cY2xxtzP9ugoP/6Q/1MITD2MCVVrc
 tWDl3I34m5U4SVxF6QDfeUVMymcOAB/4MiuGvpX9r4ajmuTv59aygR9RF8MumAPKtgGG
 ttyFhNfxWgdedJaR3e4tbE2PQQFKphVPRVNqv6wDYxJ+6Hhr3c1A5b8FKbs4B0HaOpgy
 r8ZQ==
X-Gm-Message-State: AOAM532somIXTlmhENt7lSNHzKzOMdt30EYByGyTvYvZu1ppVrlH7fwU
 vxAar8l/m7gjv9fOFGRWuh4I9yZxUUcVYQkjWpWx4cat0gdXA1K02KY02nvuKCdxiOczLaKh447
 TR0hvAvQN1SmJJ4r9NISeywO46Dq4cv0=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr2362567ilq.161.1606392787183; 
 Thu, 26 Nov 2020 04:13:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8mnqS0cRBKCDb+UMdmjQ5LVWU9HsKIuAQ6w34GJaQa4P51b3mxqHILjUsb6O/EPHtwTCcuFLcgzIZEyCpFIE=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr2362555ilq.161.1606392786979; 
 Thu, 26 Nov 2020 04:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-13-marcandre.lureau@redhat.com>
 <CAFEAcA_g5-tuqrRY8khKC0e7LBrJYr6DTVBx322=+yPYP4HcJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_g5-tuqrRY8khKC0e7LBrJYr6DTVBx322=+yPYP4HcJQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 26 Nov 2020 16:12:56 +0400
Message-ID: <CAMxuvaymUu7n4RHFSPOf5rie57QsyBLzx=QSwxeeyfs2kSsWrw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] compiler: remove GNUC check
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 4:10 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires Clang or GCC, that define and support __GNUC__ extensions=
.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/compiler.h | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > index 108bfdb391..f492baf341 100644
> > --- a/include/qemu/compiler.h
> > +++ b/include/qemu/compiler.h
> > @@ -55,14 +55,10 @@
> >      (offsetof(container, field) + sizeof_field(container, field))
> >
> >  /* Convert from a base type to a parent type, with compile time checki=
ng.  */
> > -#ifdef __GNUC__
> >  #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
> >      char __attribute__((unused)) offset_must_be_zero[ \
> >          -offsetof(type, field)]; \
> >      container_of(dev, type, field);}))
> > -#else
> > -#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
> > -#endif
>
> This bit looks good.
>
> >  #define typeof_field(type, field) typeof(((type *)0)->field)
> >  #define type_check(t1,t2) ((t1*)0 - (t2*)0)
> > @@ -93,7 +89,7 @@
> >  #if defined(__clang__)
> >    /* clang doesn't support gnu_printf, so use printf. */
> >  # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> > -#elif defined(__GNUC__)
> > +#else
> >     /* Use gnu_printf (qemu uses standard format strings). */
> >  # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> >  # if defined(_WIN32)
> > @@ -101,8 +97,6 @@
> >      * even when MinGW or GLib include files use __printf__. */
> >  #  define __printf__ __gnu_printf__
> >  # endif
> > -#else
> > -#define GCC_FMT_ATTR(n, m)
> >  #endif
>
> Didn't you already change the GCC_FMT_ATTR stuff in a previous
> patch in the series? If so this part should just be squashed
> into that one.
>

It's a mix of concerns. I focused on the first patch on the clang
exception, then dropped the explicit GNUC check. I would rather keep
it that way.

thanks


