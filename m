Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785375A3505
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 08:25:02 +0200 (CEST)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRpFd-0005O6-2c
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 02:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRpDn-000413-Bl
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 02:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRpDk-0000ve-5N
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 02:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661581382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usDfzDnTc82TvUi3BGwcyR2Swm0bRe/Xd5FVJJUOEEQ=;
 b=O3cTGZXoBTLRuC78kqpM4RDZUP1yjDkGNocbeSIOcbjZwWJvUyMCvrzaTz9hGn4UMEfrkU
 yE5KTqHu+NB8uNINxjs0IuMz4qqi1Yr6P8mlCjIpm1QTjZXdJXHzFf94215dpJEk0Imxiu
 eDbZHbBWvx6ooYRrYKRhP1a6o2mAaPA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-WfTqGGS1NjStEC7ZCNj8Lw-1; Sat, 27 Aug 2022 02:23:00 -0400
X-MC-Unique: WfTqGGS1NjStEC7ZCNj8Lw-1
Received: by mail-lf1-f72.google.com with SMTP id
 g19-20020a056512119300b00492d83ae1d5so447683lfr.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 23:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=usDfzDnTc82TvUi3BGwcyR2Swm0bRe/Xd5FVJJUOEEQ=;
 b=i2FVyrThjE0XWAy1sswLK3xbcFt6wsNUnEzTFhctrAYOPrqcfx5E3DXYg4P56N6KVj
 5fw5u2QWZPh4x1omQlYkK/W+czjv0Q8Wpge787oYNPf0EvJHuzlg92Uiicedo6GyMmC3
 2mhtj4EM6X3iIGG0WETA3Ho7xY2pnB7zIgONPaN0ix7WFHtyex36fyUYOtOA/4Xw+MQD
 8vCbXJXvVI359qvlNReLysJw7QfHksCBGZ5/QD40xX8XncqA/wj3GYUv7lUuZuiv5Bb8
 zaMPhRc8otovzvHb19XSHOHarCZp6+OvH91E10WIuXBN7nsJE1XN+E5tLEJUfX+u/+JQ
 4R+Q==
X-Gm-Message-State: ACgBeo1DFETpEveeO1rNfi6+/9aPtkdHS/SBVUQOgJHWlfeZZL0QE2/e
 22h//sIcOiKgo6WTgLRoXWoLvvy7zgEIGWWHvBYQOFvoF2DmUGtJaYgSjkLXa/mXJV+48U76vrd
 127C65HHgQ6n95Fh8G6HeaZWBWXx616s=
X-Received: by 2002:a05:6512:c06:b0:48d:1d99:2a1a with SMTP id
 z6-20020a0565120c0600b0048d1d992a1amr3856949lfu.396.1661581378975; 
 Fri, 26 Aug 2022 23:22:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6AoceeBx0OJlpkb4dQxOrKfXUCHWi887zmhwAuCchgO17uz1EBGvN5BW6R55vdqIVH+38jThVwMHag9/m0CGc=
X-Received: by 2002:a05:6512:c06:b0:48d:1d99:2a1a with SMTP id
 z6-20020a0565120c0600b0048d1d992a1amr3856943lfu.396.1661581378710; Fri, 26
 Aug 2022 23:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-16-pbonzini@redhat.com>
 <d99fd852-b4a4-2e88-30fd-8eb759eb3e5d@linaro.org>
In-Reply-To: <d99fd852-b4a4-2e88-30fd-8eb759eb3e5d@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 27 Aug 2022 08:22:47 +0200
Message-ID: <CABgObfZrc18dKi8aBrHf4PpWuSBk7NRN58E2+V5sRJ9-QOZePg@mail.gmail.com>
Subject: Re: [PATCH 15/23] i386: Destructive vector helpers for AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@nowt.org>
Content-Type: multipart/alternative; boundary="000000000000d8097205e7330f0d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d8097205e7330f0d
Content-Type: text/plain; charset="UTF-8"

Il sab 27 ago 2022, 01:46 Richard Henderson <richard.henderson@linaro.org>
ha scritto:
> +#define PACK_WIDTH (4 << SHIFT)

>
> Incorrect for AVX, it was correct with the ifdef in v1.
> Perhaps just (SHIFT ? 8 : 4)?
>

That's intentional, the AVX patches change it to an #ifndef that AVX
overrides. For now the purpose of the series is to keep things simple and
loop-ified, with AVX remaining in the background. But I can use the ternary
operator if you prefer, that's a good suggestion too.

Paolo


> I think this should be parameterized on the larger of
> the two types in the insn.  Because right now you get
> some weird arithmetic in e.g. punpck*dq.
>
>
> r~
> ,

--000000000000d8097205e7330f0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 27 ago 2022, 01:46 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:</div><div dir=3D"ltr" class=3D"gmail_attr">&gt; +#define PA=
CK_WIDTH (4 &lt;&lt; SHIFT)</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Incorrect for AVX, it was correct with the ifdef in v1.<br>
Perhaps just (SHIFT ? 8 : 4)?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">That&#39;s intentional, the AVX patches change=
 it to an #ifndef that AVX overrides. For now the purpose of the series is =
to keep things simple and loop-ified, with AVX remaining in the background.=
 But I can use the ternary operator if you prefer, that&#39;s a good sugges=
tion too.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
I think this should be parameterized on the larger of<br>
the two types in the insn.=C2=A0 Because right now you get<br>
some weird arithmetic in e.g. punpck*dq.<br>
<br>
<br>
r~<br>
,
</blockquote></div></div></div>

--000000000000d8097205e7330f0d--


