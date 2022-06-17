Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B954F7C8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:46:25 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BMm-00022M-8j
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o2BEq-0005H6-V4
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o2BEo-0003jf-Af
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655469489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sruUjnEoxUvb5USAiCjCEZl8YC67DOv1HWaqZU1f0SE=;
 b=WQzq8/hD3n0wPIk6jcPvqQZl1spWot4LViNy6R3bboTkL3UwGXpew0yclxOWl50IX0lFjN
 ST7ka+e8M0ue87v8c3pPCH2uSrmT7N4h1RgpekrliveYWuLuks7KEEPiIPgPoJM6J9/aAa
 K/V3gvkF8BsdTb7aV6Uf4XTGDu2gNAQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-gTN4Q5ALPo6QD8eQ8Oa_dQ-1; Fri, 17 Jun 2022 08:38:08 -0400
X-MC-Unique: gTN4Q5ALPo6QD8eQ8Oa_dQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-101b3601c5dso569785fac.19
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 05:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sruUjnEoxUvb5USAiCjCEZl8YC67DOv1HWaqZU1f0SE=;
 b=2pzH1NF+BIWCBW84DloCUXZOc3h9NTb2Qv9qINgp7VArnN/VnMDFalYzJOA8b9CA3O
 oceJcOuzSiz08p3llvM+UiTlxa34q1ijZ9MfC8+LhcbkqQDZDbWYXjmRJUwp88UV7hj5
 k/lyiQ6K1AIbIkFBUbOhlTmWndfeYwARZ8yP1c7gF063Xdf1uOaL4Oqqk+bG6+hwponD
 58kBHZO+R07I4P8h9bGLHcmlGmoet+/RPN5bK5M4o01SGODDyb6dAFlsDlLn90zmrSoP
 pxNnHFaozRHBfY2Bq2V0vVq3VzusrFgLPJcxBj8Gso0yHqooKFf/joCW1uZTKxQvS3Ri
 w5pw==
X-Gm-Message-State: AJIora8Ive1mOJNLqfPPsOUty7OHHYCY32/qCBniAqlpRWX8Ev55+nZO
 dYFVOO4zGZEo2IyQoEEPhhE3QowQF5RWTu6/4hSMmsAeEfniXXK+wq4z1B7UMYICjB5+Kdpglie
 wxABwURLQOVil58uBWhtDJxUE3CNxCOI=
X-Received: by 2002:a9d:7581:0:b0:60c:13a3:8a11 with SMTP id
 s1-20020a9d7581000000b0060c13a38a11mr3762273otk.378.1655469487368; 
 Fri, 17 Jun 2022 05:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5Yz55U5g1petCYB0KMZ2N4XM2XZy58XEcw32azIjTc6E22kV3q8zCT/k/3lGoTBwQ1eUMqXFCejk++9SkOGg=
X-Received: by 2002:a9d:7581:0:b0:60c:13a3:8a11 with SMTP id
 s1-20020a9d7581000000b0060c13a38a11mr3762264otk.378.1655469487177; Fri, 17
 Jun 2022 05:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
 <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
 <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
In-Reply-To: <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 17 Jun 2022 16:37:56 +0400
Message-ID: <CAMxuvawyO4uViOTUpji553dkqzRmvoL3YbDXXjd3Ca8SMmWxoA@mail.gmail.com>
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jun 17, 2022 at 1:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit?
> >
> > Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it back in
> > with the following diff on top then everything works again:
>
> Ah, the other way around.
>
> > diff --git a/ui/console.c b/ui/console.c
> > index 365a2c14b8..decae4287f 100644
> > --- a/ui/console.c
> > +++ b/ui/console.c
> > @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,
> >
> >  void qemu_console_resize(QemuConsole *s, int width, int height)
> >  {
> > -    DisplaySurface *surface;
> > +    DisplaySurface *surface = qemu_console_surface(s);
> >
> >      assert(s->console_type == GRAPHIC_CONSOLE);
> >
> > -    if (qemu_console_get_width(s, -1) == width &&
> > +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
> > +        qemu_console_get_width(s, -1) == width &&
> >          qemu_console_get_height(s, -1) == height) {
> >          return;
> >      }
> >
> > > Which depth changes triggers this?  Going from direct color to a
> > > paletted mode?
> >
> > A quick test suggests anything that isn't 32-bit colour is affected.
>
> Hmm, I think the commit should simply be reverted.
>
> Short-cutting the qemu_console_resize() call is only valid in case the
> current surface was created by qemu_console_resize() too.  When it is
> something else -- typically a surface backed by vga vram -- it's not.
> Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...

Oh ok, it might be worth adding a comment to clarify that. By
reverting, we are going back to the situation where
qemu_console_resize() will create a needless surface when rendering
with GL. As I tried to explain in the commit message, it will need
more changes to prevent that. I can take a look later.


