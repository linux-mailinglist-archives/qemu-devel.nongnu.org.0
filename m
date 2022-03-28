Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD34E926F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 12:23:49 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYmXL-0002A1-JZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 06:23:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYmWB-0001Cf-Gg
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 06:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYmW6-0000uf-AI
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 06:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648462948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4OCN1eOgrOy7ECoescUvMzt573CjARf4CVtS4ozLLQ=;
 b=FJ8rRiPu6JGxFnMPVqA803VbgROG+LRWKAGm59sR2x3PoHf29YcKd480upINbtmWOcIaTm
 Ezpnt7OUoyePuqaCZ9l0Gee3JElYkTazcNUI8TGXIwyUHNjKkT4eO+YJeXul7p5/CLbKyJ
 BOzxGzh5cZURvJHSDQy1tOFb676AIHQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-2rGuEvItMeuVc4cxix2Y0A-1; Mon, 28 Mar 2022 06:22:25 -0400
X-MC-Unique: 2rGuEvItMeuVc4cxix2Y0A-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2e643f85922so114534417b3.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 03:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V4OCN1eOgrOy7ECoescUvMzt573CjARf4CVtS4ozLLQ=;
 b=Dcik2fQ/Eymi6X8pIBJW68lKB1OrqpntleQtfQxN6JC82NZkgc4+abxI8QdBljhS0A
 thQR1B5bgXdpLszpDXiuh4c+6aJWXNAm/3kt9MITCrfbXvWLP4Qkdvg52MusSqco7CZ0
 WCRFxlCuZXlwYF5If85/aMb8mwV4di4W8KrysZmRIBVWou0q+PbhhyEMQDlBOi2QOXI/
 W3cOvgWLqRQQfpg1EtS++ELEdpMvJUQo7YJXOpK/9gIRQt3UaB3Ncyk0f9mIS/LTKQfm
 3FMhv7aYgPxJvlkNzr86mEWXk8/H/ua/f97UWHFT0xTSqJYyuccZ4TBENFu8fX5MBPtq
 BqWA==
X-Gm-Message-State: AOAM530ox4BCIan6xHhc5wp1kdt7wQ4EyRf7/dd0j+c6iXdYebqCl3PE
 UqLEIjanaF8pk2Z2Ftgs2i4Of2COurCOvwjJlBA+Iept7BpUbWB5Vt28OiKsAg40z0pSI9BcgLu
 p6/I6EnIYBLPwmgWBvflUhe5yEABGgYU=
X-Received: by 2002:a81:7bc6:0:b0:2e6:3a20:2e09 with SMTP id
 w189-20020a817bc6000000b002e63a202e09mr24428890ywc.312.1648462943823; 
 Mon, 28 Mar 2022 03:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbUrB/Kh7+6jmErcBgV3urN7CJIrP/BIXsVdrwMQWf6V7AC+elqYXAHV/Sk3ZQKzsv9Wsu0kjb2hTQtKsEKEo=
X-Received: by 2002:a81:7bc6:0:b0:2e6:3a20:2e09 with SMTP id
 w189-20020a817bc6000000b002e63a202e09mr24428867ywc.312.1648462943615; Mon, 28
 Mar 2022 03:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-6-marcandre.lureau@redhat.com>
 <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
In-Reply-To: <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 28 Mar 2022 14:22:12 +0400
Message-ID: <CAMxuvaxHgVy-JA+XzAKJ4cjGYefpxyE_fmMLRqzPQPjVQKV8yg@mail.gmail.com>
Subject: Re: [PATCH 5/5] s390x/tcg: fix format-truncation warning
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Mar 28, 2022 at 12:59 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/03/2022 10.47, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > ../target/s390x/tcg/translate.c: In function =E2=80=98s390x_translate_i=
nit=E2=80=99:
> > ../target/s390x/tcg/translate.c:224:64: error: =E2=80=98%d=E2=80=99 dir=
ective output may be truncated writing between 1 and 11 bytes into a region=
 of size 3 [-Werror=3Dformat-truncation=3D]
> >    224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "=
r%d", i);
> >        |                                                               =
 ^~
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   target/s390x/tcg/translate.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.=
c
> > index 5acfc0ff9b4e..a082342a0424 100644
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
> >
> >   void s390x_translate_init(void)
> >   {
> > -    int i;
> > +    size_t i;
> >
> >       psw_addr =3D tcg_global_mem_new_i64(cpu_env,
> >                                         offsetof(CPUS390XState, psw.add=
r),
> > @@ -221,7 +221,7 @@ void s390x_translate_init(void)
> >                                      "cc_vr");
> >
> >       for (i =3D 0; i < 16; i++) {
> > -        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i)=
;
> > +        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i=
);
>
> The compiler is *really* too stupid to see that i is in the range between=
 0
> and 16 here??? ... that rather sounds like a compiler bug to me than
> something that we should work-around in the QEMU source code. Considering
> that you're using a x.0 release of GCC, please file a bug against GCC
> instead. If they refuse to fix it for GCC 12.1 or later, we can revisit t=
his
> patch, but currently, I really think this should be fixed in GCC instead.
>

I opened: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105080

Although I think the "workaround" is simple and would avoid users &
distributions having to add --disable-werror, and possibly miss other
issues.


