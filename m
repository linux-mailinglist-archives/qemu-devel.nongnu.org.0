Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BA4AFCF8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:12:04 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHsNn-0000mk-QI
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHreO-0005CN-SP
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHreL-0000oZ-1g
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644431104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t3w/pwhoi7nzEatShDLHjAYvpBXZalLj59HG7+6/tiw=;
 b=f68vNzpXTRd5N6z4pehRK5nJQUUTy2XS0mSxEHBv6qckRwaM9AEMH+raJgKtbNQnKoO9Ju
 E7ZVOdHDRMFtDcYRs6Nqo8QqTWhfsEmgfhlpk3+NCDnQDFHiNNlXslXk6AYeHhMarrCG7f
 ZbEprCCU++inmVj9SnI2KtH1ukDZ3v4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-UDLY6xJcOF2_V_b6YQriMA-1; Wed, 09 Feb 2022 13:24:59 -0500
X-MC-Unique: UDLY6xJcOF2_V_b6YQriMA-1
Received: by mail-ua1-f70.google.com with SMTP id
 l25-20020ab03d99000000b003105fa57cc3so1609982uac.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 10:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t3w/pwhoi7nzEatShDLHjAYvpBXZalLj59HG7+6/tiw=;
 b=CDCm+exb0DwBzRFR2yeXLA+3s/ghBtTIJT+8rysFfFbSPLv+mVskjCBHjGeY95XQtt
 gYTVBEHkuDZFa/Ap4CuvVoMZbvgLZnxCX3LWT35ljCH6ZhC0TPAe9GRQxvi3ZIqRSkZA
 tepXuZ07opekmysaqpyJeT4SDlzlutWFonAip2ZHda8Nyw9YiSvaw2yry0I7wCFNVBfA
 EqF6uOPpTH7YBofQTRUfNADeQw+B1WZyRQAu95AO3G6PZivxjlV5lTvjnKCF8pF1Zf1P
 0CsAWe6zRIOaRMSPphMaUWDLhNVGnJiE+aIVZqHv3DXHbYNAK4XhOBfRK6MrzRsDdNoz
 hwiQ==
X-Gm-Message-State: AOAM533HqF+7XbMvCemE+ADs9LeDv+adCwru5ubUaC+O88x8CR5ccDIm
 IGiOrAN+C8h14PPseBIEj1ZbwxgZI8FQrxqREFlhMr1+G14nqSGmiIJUj/CLVXSg1PZAVsBFWxb
 XxYscQL9SvIweEFojI4aZFXhyfWx59XQ=
X-Received: by 2002:a05:6130:423:: with SMTP id
 ba35mr1069330uab.50.1644431098457; 
 Wed, 09 Feb 2022 10:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUq69Zi0X38EBnB1k0l4GMsexc2/nT5cQ+jdhBrldZ2dKT/ruEmIxzbONO6HVXgrdXPPpj8XU87pgKYHnII7A=
X-Received: by 2002:a05:6130:423:: with SMTP id
 ba35mr1069321uab.50.1644431098252; 
 Wed, 09 Feb 2022 10:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20220207213039.2278569-1-jsnow@redhat.com>
 <20220209125101.lgyd3gdmrzugwsoe@laptop.redhat>
In-Reply-To: <20220209125101.lgyd3gdmrzugwsoe@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Wed, 9 Feb 2022 13:24:47 -0500
Message-ID: <CAFn=p-Y-PGrpFrJ4qawOMFvF=bEx9FtkuPm+J-AYAAq6OH-JHg@mail.gmail.com>
Subject: Re: [PATCH] Python: discourage direct setup.py install
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 9, 2022 at 7:51 AM Beraldo Leal <bleal@redhat.com> wrote:
>
> On Mon, Feb 07, 2022 at 04:30:39PM -0500, John Snow wrote:
> > When invoking setup.py directly, the default behavior for 'install' is
> > to run the bdist_egg installation hook, which is ... actually deprecated
> > by setuptools. It doesn't seem to work quite right anymore.
> >
> > By contrast, 'pip install' will invoke the bdist_wheel hook
> > instead. This leads to differences in behavior for the two approaches. I
> > advocate using pip in the documentation in this directory, but the
> > 'setup.py' which has been used for quite a long time in the Python world
> > may deceptively appear to work at first glance.
>
> +1 for that. Using setup.py directly is no longer a good practice. All
> direct invocations of setup.py are deprecated.
>
> > ---
> >  python/setup.py | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/python/setup.py b/python/setup.py
> > index 2014f81b75..c5bc45919a 100755
> > --- a/python/setup.py
> > +++ b/python/setup.py
> > @@ -5,9 +5,26 @@
> >  """
> >
> >  import setuptools
> > +from setuptools.command import bdist_egg
> > +import sys
> >  import pkg_resources
> >
> >
> > +class bdist_egg_guard(bdist_egg.bdist_egg):
> > +    """
> > +    Protect against bdist_egg from being executed
> > +
> > +    This prevents calling 'setup.py install' directly, as the 'install'
> > +    CLI option will invoke the deprecated bdist_egg hook. "pip install"
> > +    calls the more modern bdist_wheel hook, which is what we want.
> > +    """
> > +    def run(self):
> > +        sys.exit(
> > +            'Installation directly via setup.py is not supported.\n'
> > +            'Please use `pip install .` instead.'
> > +        )
> > +
> > +
> >  def main():
> >      """
> >      QEMU tooling installer
> > @@ -16,7 +33,7 @@ def main():
> >      # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
> >      pkg_resources.require('setuptools>=39.2')
> >
> > -    setuptools.setup()
> > +    setuptools.setup(cmdclass={'bdist_egg': bdist_egg_guard})
> >
> >
>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>
> --
> Beraldo
>

Thanks, staging this one to my python branch.

--js


