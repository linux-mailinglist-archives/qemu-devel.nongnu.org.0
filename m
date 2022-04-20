Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B672508BEA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:17:04 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhC4l-0004Ov-9O
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBO9-00071l-BB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBO7-0007Ax-KP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3W+ejk8UO+GnHm210nmFS2vywLtnxQGLArrIEObwN8=;
 b=hUj++kZZfakgGULjs+JMrfeEOswMN2fj31Syb0bPwG5zWlTZQaCwHXd4DIwc8GH4ThXKA6
 6EVeTH2zfS+uIqpwFN41g1NmjF7W9sIq9v+erC7t/72J714w+d9ei1EbWB9tbX5zgNDxvJ
 /lNVxv/zYaFwYKLVzngBMKI0c2E/ieU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-devMOLj9OwykOnSMDOSgZw-1; Wed, 20 Apr 2022 10:32:57 -0400
X-MC-Unique: devMOLj9OwykOnSMDOSgZw-1
Received: by mail-yb1-f200.google.com with SMTP id
 h82-20020a25d055000000b00641d2fd5f3fso1609652ybg.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s3W+ejk8UO+GnHm210nmFS2vywLtnxQGLArrIEObwN8=;
 b=AG4s2oFbDhn/4pqoXCeTstOf5byr5a/V/lMJcw69trdMm7JPrE68t4D/Gm8knRquLd
 m2zloLb1XVx4370xOwdaLnxVd4fBFmJw3y/xIgxgSHlXQ+Fqu9+ARLe8DRN+9uAfQzuh
 YFX35vvtM9xG3b5n6SMYfqpRCQ0pM1abhhiPZ953q9S82E9SHHpyW19BGfBmbQwl/ddM
 9fdlhV7tBxx8o06ksTD2IdtQqvzt+KW5xO11O3mYTrpxNiBdt4atBMIciRAt0W7QuPFy
 kugGkjGWStyUOB0vk5ybGKAAzbN0RhV3yqH5rQiZigQTqzKc9KfrEn1XWshCZdYFaxbA
 O+ag==
X-Gm-Message-State: AOAM53282kiLA1KgcGQ+eX0EXa5BjZ6xhWYWuAf8DX1xV8I5uZLLJoFN
 9hh6IO6AaH/3Rd18nq+UrHUEq4kYFmyXkiK1BTVc1D1SqaVbRCffL+Jv4QdGq2j77VtnLnOk7a4
 tYcvrC87cPdxCe/FPWQiMugVZP3fSuJY=
X-Received: by 2002:a0d:d9cf:0:b0:2ef:5421:430f with SMTP id
 b198-20020a0dd9cf000000b002ef5421430fmr20666729ywe.312.1650465177255; 
 Wed, 20 Apr 2022 07:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4zUl5udgMLZk3g840OUQhCp4Fu0DlR8A2LssYW9WtKw3xKqjV32ffAGawtjSDBfJL179zC8GULkknDsz3e+E=
X-Received: by 2002:a0d:d9cf:0:b0:2ef:5421:430f with SMTP id
 b198-20020a0dd9cf000000b002ef5421430fmr20666710ywe.312.1650465177050; Wed, 20
 Apr 2022 07:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
In-Reply-To: <YmAUaMp7kTRaRCGY@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 18:32:46 +0400
Message-ID: <CAMxuvawHu24F8Cffqg8Ti9jwH=pjJm1XThcDij3B=mhobQ1FEA@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 6:10 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > According to our configure checks, this is the list of supported
> > compilers.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >  docs/about/build-platforms.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/docs/about/build-platforms.rst b/docs/about/build-platform=
s.rst
> > index c29a4b8fe649..1980c5d2476f 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> >  The version of the Windows API that's currently targeted is Vista / Se=
rver
> >  2008.
> >
> > +Supported compilers
> > +-------------------
> > +
> > +To compile, QEMU requires either:
> > +
> > +- GCC >=3D 7.4.0
> > +- Clang >=3D 6.0
> > +- XCode Clang >=3D 10.0
>
> Do we need to spell out the versions explicitly ? These versions are
> all derived from what's available in the repos of the supported build
> platforms, similar to any other build deps we have. I don't think we
> want to start a precedent of duplicating versions in this doc for
> build deps we have, and there's nothing particularly special about
> compilers in this respect.

We have checks in configure for those, I wanted a more human-readable
and readily available version.

The set of supported platforms is not rigid, so imho it helps to
document the basic build requirements.

If/when we introduce Rust and/or C++ etc, I would also expect an
explicit doc section about it.

> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


