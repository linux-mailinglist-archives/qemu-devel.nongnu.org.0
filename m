Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E0508E16
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:10:24 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDqR-0000XX-Eb
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhDZ7-0006d2-2H
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhDZ5-0004yh-5U
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650473546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1c/KtlrFth8tNTlxRJGE6FP9lUrcAa5AxATQqtE7oU=;
 b=esE/moQChbvqhnGQ8sVf+s6leQNU2fim3jzeZBiTBYv+K3OhnDKskUZXtf7LWUgRNi6ssr
 FE7ZQOthY8BvyJSuKZzQEE7jnrFb2a/nXe1CZi3We0+67b3h9Py8r5C9v1hF11WU1/dubY
 ovrHfqnsBlYG6GkQnaYysm7OV7QMFyk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-IVhPbNx0Mo2HWJn4iMfBNA-1; Wed, 20 Apr 2022 12:52:25 -0400
X-MC-Unique: IVhPbNx0Mo2HWJn4iMfBNA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2ef53391dbaso20300667b3.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q1c/KtlrFth8tNTlxRJGE6FP9lUrcAa5AxATQqtE7oU=;
 b=AiLWINDzPSd9qvqnBcggQkKXc6J077tCVhVSh6ZWyto5JXbcXHguUMo+bPJTXbs0xq
 GSAZUjZ9O/Y9UnJ13SL59TGM4FTIDE/NEzq7jn606fB9jbFKwzmbCILkagl0JVsmF3O6
 kEp4eHsZj4R2G2Isov77xYXl4OlVzDyLt/TKLxUNzYpLa5Xxi1p8rH5ZXvcyYL70CcRA
 CHxTLbz5QpQbs0I1K6Y2fBZcDa3eqNyAP8VSY/3StaTg6LsVnMyweNowh18r9Wq733+e
 NgAH2AVkpDraC7bBs7PzshAtJW5KRfRPMEdYCP/BYsoXqmp8I3YOHKXERtx9MVeSa9f9
 YOxw==
X-Gm-Message-State: AOAM53026DLTfoRaQfjjd5AgeTuRLENoKlG8HIdKwVYc/EQ8nhsLKQbW
 u8Jb+fMD+SaN8uJ7nxnCeSQNasU/ee6EABZH/8JCrqQfZ9ZYbJoHJ8V6V3LOPqM5JyBa3vtQy5W
 IU6u014MOp1q8cL2UtLLAkcme+DqH8JQ=
X-Received: by 2002:a0d:f485:0:b0:2e6:8c95:d874 with SMTP id
 d127-20020a0df485000000b002e68c95d874mr21465489ywf.23.1650473544649; 
 Wed, 20 Apr 2022 09:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbY9lcM/+h45zkC5MIaq8uKokUmKzsLqwGA95mR35EgHCoVga+//L6moIh6x93yaRsiZ6s/qr4B0nayfUx4N8=
X-Received: by 2002:a0d:f485:0:b0:2e6:8c95:d874 with SMTP id
 d127-20020a0df485000000b002e68c95d874mr21465476ywf.23.1650473544441; Wed, 20
 Apr 2022 09:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
 <YmAlm0WXIf2n4VRX@redhat.com>
 <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
 <67453a39-a2a5-b523-9221-d932926a3594@redhat.com>
In-Reply-To: <67453a39-a2a5-b523-9221-d932926a3594@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 20:52:13 +0400
Message-ID: <CAMxuvazexnPsf17iZ72oL-bg+LPwqigDy487GRU_g=sxHjCM9A@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: Thomas Huth <thuth@redhat.com>
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 8:11 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/04/2022 17.32, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Apr 20, 2022 at 7:24 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> >>
> >> On Wed, Apr 20, 2022 at 06:50:12PM +0400, Marc-Andr=C3=A9 Lureau wrote=
:
> >>> Hi
> >>>
> >>> On Wed, Apr 20, 2022 at 6:46 PM Marc-Andr=C3=A9 Lureau
> >>> <marcandre.lureau@redhat.com> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote=
:
> >>>>>
> >>>>> On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> >>>>>> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.=
com wrote:
> >>>>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>>>>>
> >>>>>>> According to our configure checks, this is the list of supported
> >>>>>>> compilers.
> >>>>>>>
> >>>>>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> >>>>>>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> >>>>>>> ---
> >>>>>>>    docs/about/build-platforms.rst | 10 ++++++++++
> >>>>>>>    1 file changed, 10 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-pl=
atforms.rst
> >>>>>>> index c29a4b8fe649..1980c5d2476f 100644
> >>>>>>> --- a/docs/about/build-platforms.rst
> >>>>>>> +++ b/docs/about/build-platforms.rst
> >>>>>>> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> >>>>>>>    The version of the Windows API that's currently targeted is Vi=
sta / Server
> >>>>>>>    2008.
> >>>>>>>
> >>>>>>> +Supported compilers
> >>>>>>> +-------------------
> >>>>>>> +
> >>>>>>> +To compile, QEMU requires either:
> >>>>>>> +
> >>>>>>> +- GCC >=3D 7.4.0
> >>>>>>> +- Clang >=3D 6.0
> >>>>>>> +- XCode Clang >=3D 10.0
> >>>>>>
> >>>>>> Do we need to spell out the versions explicitly ? These versions a=
re
> >>>>>> all derived from what's available in the repos of the supported bu=
ild
> >>>>>> platforms, similar to any other build deps we have. I don't think =
we
> >>>>>> want to start a precedent of duplicating versions in this doc for
> >>>>>> build deps we have, and there's nothing particularly special about
> >>>>>> compilers in this respect.
> >>>>>
> >>>>> I agree with Daniel - when I saw this patch, the first thought that=
 I had
> >>>>> was: "This will be getting out of sync quickly" ...
> >>>>
> >>>> I don't have the impression we bump our compiler requirement regular=
ly
> >>>> or lightly.
> >>>>
> >>>>> so I'd also recommend to rather not add this here.
> >>>>
> >>>> Outdated documentation is still better than no documentation. YMMV.
> >>>
> >>> Another question that is difficult to answer without being familiar
> >>> with QEMU details is whether it can compile with MSVC. This
> >>> documentation would, since it is explicit about the requirement.
> >>
> >> Documenting that we mandate GCC or Clang is reasonable. Ideally we cou=
ld
> >> have a list of all 3rd party deps we have in fact, I'm just not a fan =
of
> >> copying the version numbers across from configure/meson.
> >>
> >
> > I agree, duplicating the version information is not optimal... Yet it
> > is better than not having it, or having to read or run configure imho.
>
> Well, no, it's better to have it in the configure script. Every user who
> wants to compile QEMU will run the configure script, but not necessarily
> read the documentation first.

Iirc, I came up with this question because I was modifying some header
(something in compiler.h or atomic.h). My initial reaction was not to
run configure. It would not help answer the question...

>
> > Sorry (or not) to insist, but it would help having an explicit list of
> > supported compilers in the human doc
>
> ... and what about necessary libraries ... if you start with the compiler=
s
> here, shouldn't we also list the necessary versions of glib, libfdt, pixm=
an,
> etc. here? ... No, IMHO this really does not scale, you could maybe menti=
on
> that GCC or Clang is necessary, and maybe that you need at least glib to
> compile QEMU, but listing the versions there is just duplicated informati=
on
> that will be ugly to maintain, without too much real benefit for the user=
s
> (they already know whether their distro is supported or not), and way too
> much hassle for the developers.
>

The compilers are (mostly) interchangeable, it's not the case for the
dependencies. But it would be nice to document our strict requirements
imho.


