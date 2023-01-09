Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B28662F8D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:52:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExFe-00069y-JS; Mon, 09 Jan 2023 13:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pExFc-00069P-D0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:52:04 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pExFa-000549-Iv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:52:04 -0500
Received: by mail-pl1-x633.google.com with SMTP id p24so10494063plw.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG6lDbHYYZu7/SvU2JnkOgPWksOoTJwjvgwv4X3IJ/Q=;
 b=bN6C8pcvznwbS/cJH23blAWATfIUVX2tY61WqdzXstPnCFdqKr0646RJhIBTvDvPwk
 imXn8Axrc4gc82wN6GN7hg4LgpmovGw0t0PyV2iD0nHxDQO3EfBWJKUWQgD9hmLAE5T2
 3NMXr8DepvL3YE4WOHdDthBdOBgOWpcwSyFYJTDqrCVhfba7Uhc8Ei5nli9f2a9xKoR3
 R2UlEQgFUcn7CU3sXcATTPpqCWEDiqnv2F8cbRlyjMU+Yk8iraAH/4+85kFjbfKwBKuS
 Z81TePc9DvUI0mJv2KeYUrls1D/YX9tWYRFRf6X66M8sXBgJ6bBWCVYB73Qg+8lhVTL6
 oQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GG6lDbHYYZu7/SvU2JnkOgPWksOoTJwjvgwv4X3IJ/Q=;
 b=SlWDRu4T8GprR/N8xOx4/CuZChfpciTLywpVpiYVc8qSEYxPsR/ozLgFPlv4bv6Vr5
 Zi7IhYINQIoLWRJqmHWHRQ2clkgd34REhFXQPBFTYwFncCge487leh9ziygy/daD9bcs
 ZeZwZpzEk6RHur0PJra9gkmMYApsidqMfBVRHFD7FdGl3TY6WetChQyj3iprcx3rbK3e
 Zlhk0eQoFRdh2YMUGMXWpjN1jxIY8NDw0qf8IpsDxjTV8dFCIryeuXPXXGYaV3HXGGEo
 AMf72RpGWCrs0U/81su7OGzlg5L3ujcnHtc7yj9CnWaC/jleDyBIDcOLeYMxWV/7DfIp
 JShA==
X-Gm-Message-State: AFqh2kqcajiih6EU3Q4MsKUs2VCzMWMootV29nn9bQqIBkLM9Timn5de
 jjzSJ1E+gmKgHMmzF5ZkoPXYMmBVa1XOj2jzDI7T4A==
X-Google-Smtp-Source: AMrXdXskSm7Q9gagp8mh2HzdIx/6u091GMHoP0GlW7mKVqh+lBKOZ+SS114+bXfcW2uttYxYMulJN0Yd5rWhtQfrf1E=
X-Received: by 2002:a17:902:690a:b0:193:1f3a:4977 with SMTP id
 j10-20020a170902690a00b001931f3a4977mr668467plk.168.1673290321072; Mon, 09
 Jan 2023 10:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
 <20230109181447.235989-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230109181447.235989-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 18:51:49 +0000
Message-ID: <CAFEAcA_YHvJWJMwxSQAQRphCgDNOSf2arbqMY8_T7VCByXCVsA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] meson: replace Perl usage with Python
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, David Hildenbrand <david@redhat.com>,
 kraxel@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 18:16, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Let's try to remove Perl usage during build time.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qapi-schema/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index 9dfe98bc9a..d85b14f28c 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -259,22 +259,23 @@ if build_docs
>    # Fix possible inconsistency in line endings in generated output and
>    # in the golden reference (which could otherwise cause test failures
>    # on Windows hosts). Unfortunately diff --strip-trailing-cr
> -  # is GNU-diff only. The odd-looking perl is because we must avoid
> +  # is GNU-diff only. The odd-looking python is because we must avoid
>    # using an explicit '\' character in the command arguments to
>    # a custom_target(), as Meson will unhelpfully replace it with a '/'
>    # (https://github.com/mesonbuild/meson/issues/1564)

This comment is not applicable to your Python rewrite of this.
It's talking about the way that the Perl code has to create
a variable with a '\r' value in a weird way (using "$x =3D chr 13")
and then do a substitution using that variable, rather than the obvious
direct s// command ("s/\r//"), to work around a meson bug if the code
has a literal \ character in it. Your python has no '\'s in it.

> +  remove_cr =3D [python, '-c', 'import sys;[sys.stdout.write(line.replac=
e(chr(13), "")) for line in sys.stdin]']
>    qapi_doc_out_nocr =3D custom_target('QAPI rST doc newline-sanitized',
>                                      output: ['doc-good.txt.nocr'],
>                                      input: qapi_doc_out[0],
>                                      build_by_default: true,
> -                                    command: ['perl', '-pe', '$x =3D chr=
 13; s/$x$//', '@INPUT@'],
> +                                    command: [remove_cr, '@INPUT@'],
>                                      capture: true)
>
>    qapi_doc_ref_nocr =3D custom_target('QAPI rST doc reference newline-sa=
nitized',
>                                      output: ['doc-good.ref.nocr'],
>                                      input: files('doc-good.txt'),
>                                      build_by_default: true,
> -                                    command: ['perl', '-pe', '$x =3D chr=
 13; s/$x$//', '@INPUT@'],
> +                                    command: [remove_cr, '@INPUT@'],
>                                      capture: true)
>
>    test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc=
_out_nocr[0]],
> --
> 2.39.0

Maybe we should consider putting the Python into a script in
scripts/ ? "Remove \r characters" is pretty trivial, but on the
other hand I think this is the only Meson custom_target() we
have where we directly invoke a script interpreter with a
bit of inline script, and inline bits of script doesn't really
seem to be a style Meson encourages (unlike Make).

thanks
-- PMM

