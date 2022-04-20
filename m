Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA9508DF2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:04:39 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDks-0001Lz-FU
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhDUU-0005mq-OJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhDUR-0004AA-OQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650473258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPrrz68FKYIJDoOhR8ug+6CoHYYc7rmowmE5BWrqMww=;
 b=Y3C16n+lM8VHd4vpUMTgHzV+ICmc5WN+jA5+hjfn9JczfHFH6ZxL9y+ByNcNMJZYhByFlY
 YQcTfzxXbsYfqgY5ZQnusw+SsyRONYzYJKwQ5Ex5CJ8YW+nXdm7ycGCDCnvoA7L8lRs6nZ
 jqyYvT5is4Tzdj/5AkCPklCxliFQ3M0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-qiowjG49MO6_1q5uV9phpQ-1; Wed, 20 Apr 2022 12:47:37 -0400
X-MC-Unique: qiowjG49MO6_1q5uV9phpQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 t39-20020a25f627000000b006454ab7ecf2so1926197ybd.21
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MPrrz68FKYIJDoOhR8ug+6CoHYYc7rmowmE5BWrqMww=;
 b=hxYGaw7poeRgPgrP/kILM1u9Pr9eUNZEy9nLa12p2UwgCIRyGjBOhDniC1MzMZ8Bi5
 LXgWpbGKMfdsyDlKF5SkqSbNzddjp9nUeAlIz/ZxCEveqFoJ7UYUaAqLRMYeZYrQWByo
 OQWi1iJjE1AcyQxz8oKa0WOQEBGesrxVkbpP6ha6mDxbFzhAaxQjsz6FO30oxgKaTjGW
 b+zDsmF59UXjTxT2tTgxrku7ZfT1L6kkwmxQczS94Pn04I4fIb5msTF+6MAx+jSWl2VH
 BdKd5lna/9lxd56Fhcw2T3ivaA6n0LJlqzONPvN6rPZEmxCK6gp0YjBiCg/tAGbZTDmf
 +cPA==
X-Gm-Message-State: AOAM531yttlKONP+h6yHv9lpm4FJU940veBUNMBE0XewCVzXwYC1DhuB
 TBjcOg1q3KyxVQflWSJKArzzmBdxNiguyChvU1PHtop4ZsuDkhFmP968No+OQWsh3Po+YJVnvWu
 5V/mjmlL03SmwrF1oVHo+Alo46qluu/U=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr21802161ywd.445.1650473256532; 
 Wed, 20 Apr 2022 09:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzrE6rh4vNV3ibFx5ihHV9S60Hvinh1ATgIuFGZMF0o1it4Se/o51Kq2YQLT88/22kCTWSV67UxeJxImBAve8=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr21802140ywd.445.1650473256358; Wed, 20
 Apr 2022 09:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
 <YmAlm0WXIf2n4VRX@redhat.com>
 <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
 <YmAs4K5NYcpNwCAc@redhat.com>
In-Reply-To: <YmAs4K5NYcpNwCAc@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 20:47:25 +0400
Message-ID: <CAMxuvayqchs0M5PJxuMtVWjahUSg=OUSA4KFy-y2CT_QWU76CA@mail.gmail.com>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 7:55 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Apr 20, 2022 at 07:32:38PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Apr 20, 2022 at 7:24 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Wed, Apr 20, 2022 at 06:50:12PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Hi
> > > >
> > > > On Wed, Apr 20, 2022 at 6:46 PM Marc-Andr=C3=A9 Lureau
> > > > <marcandre.lureau@redhat.com> wrote:
> > > > >
> > > > > Hi
> > > > >
> > > > > On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wr=
ote:
> > > > > >
> > > > > > On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> > > > > > > On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@re=
dhat.com wrote:
> > > > > > >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > > > >>
> > > > > > >> According to our configure checks, this is the list of suppo=
rted
> > > > > > >> compilers.
> > > > > > >>
> > > > > > >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redh=
at.com>
> > > > > > >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> > > > > > >> ---
> > > > > > >>   docs/about/build-platforms.rst | 10 ++++++++++
> > > > > > >>   1 file changed, 10 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/docs/about/build-platforms.rst b/docs/about/bui=
ld-platforms.rst
> > > > > > >> index c29a4b8fe649..1980c5d2476f 100644
> > > > > > >> --- a/docs/about/build-platforms.rst
> > > > > > >> +++ b/docs/about/build-platforms.rst
> > > > > > >> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> > > > > > >>   The version of the Windows API that's currently targeted i=
s Vista / Server
> > > > > > >>   2008.
> > > > > > >>
> > > > > > >> +Supported compilers
> > > > > > >> +-------------------
> > > > > > >> +
> > > > > > >> +To compile, QEMU requires either:
> > > > > > >> +
> > > > > > >> +- GCC >=3D 7.4.0
> > > > > > >> +- Clang >=3D 6.0
> > > > > > >> +- XCode Clang >=3D 10.0
> > > > > > >
> > > > > > > Do we need to spell out the versions explicitly ? These versi=
ons are
> > > > > > > all derived from what's available in the repos of the support=
ed build
> > > > > > > platforms, similar to any other build deps we have. I don't t=
hink we
> > > > > > > want to start a precedent of duplicating versions in this doc=
 for
> > > > > > > build deps we have, and there's nothing particularly special =
about
> > > > > > > compilers in this respect.
> > > > > >
> > > > > > I agree with Daniel - when I saw this patch, the first thought =
that I had
> > > > > > was: "This will be getting out of sync quickly" ...
> > > > >
> > > > > I don't have the impression we bump our compiler requirement regu=
larly
> > > > > or lightly.
> > > > >
> > > > > > so I'd also recommend to rather not add this here.
> > > > >
> > > > > Outdated documentation is still better than no documentation. YMM=
V.
> > > >
> > > > Another question that is difficult to answer without being familiar
> > > > with QEMU details is whether it can compile with MSVC. This
> > > > documentation would, since it is explicit about the requirement.
> > >
> > > Documenting that we mandate GCC or Clang is reasonable. Ideally we co=
uld
> > > have a list of all 3rd party deps we have in fact, I'm just not a fan=
 of
> > > copying the version numbers across from configure/meson.
> > >
> >
> > I agree, duplicating the version information is not optimal... Yet it
> > is better than not having it, or having to read or run configure imho.
> >
> > Sorry (or not) to insist, but it would help having an explicit list of
> > supported compilers in the human doc (because configure/meson doesn't
> > rule others out, afaik, nor it really can or should)
>
> Perhaps I'm misunderstanding what you mean, but configure certainly
> does rules out other compilers, giving a clear message:
>
> if ! compile_prog "" "" ; then
>     error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang =
v10.0)"
> fi
>

How can this test fail with other compilers?

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


