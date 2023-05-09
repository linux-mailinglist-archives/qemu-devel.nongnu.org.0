Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDD6FCD0C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:54:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRWl-00047M-88; Tue, 09 May 2023 13:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pwRWj-000475-1n
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:53:29 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pwRWg-0007x2-W3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:53:28 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-956ff2399b1so1161943966b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683654804; x=1686246804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo0Zj9h5ft1LgkAp33nH/Es7FnZaylUJpYAGNuruPLA=;
 b=EikC22AN1OShbvsGtq6+i/CHCEcm9sp9h0FpGhA0RsNkkQxGpBlXDJqddsX2yOcH8K
 reWb2TxHIIX+BubrTwERFs1Zb2cM8+RzZaxxlIVK6bqi19b5ZPjJ4w4dAgbaXhzcpSG5
 rc2T7BpD6GRRPvBU5Kh2YTI5Gb9ONdLeLRiW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683654804; x=1686246804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eo0Zj9h5ft1LgkAp33nH/Es7FnZaylUJpYAGNuruPLA=;
 b=Tzvrh1dzE3mwyu6ZP+aPxCQ7and2sDSTZVHC0VCef+JwX0fOPqx5y4Y2ENIdrAyVD8
 XVIomYXHqJe1DynjRghzkq9tVHGfzQuN/qcyHXHB/nMocYKDvUOgm0v/DFCE6XeUUZwP
 IK98+6WKg8VSk9fyG/aJDoUU/HLHyKQMxjVAoZEYJP7Mki2YMVmF47YHMPjWBxvc9hF/
 w688vOxaC/kGh2rRip+BsY7rvrqV/uOs5n5fhQqcEbG42ddX1mJSyFW9+xxaEsy6Y0Sv
 Mpan8ffldrP1XhmF2hrvNe1Qv+Xy6qXT3poXzE1yaBIzYxRTjw/LrwZvNSxCaYOkPJYc
 q49g==
X-Gm-Message-State: AC+VfDyYxPdmkuMxn313yrfS7MKxipngjw9SO94P5tUzS/AcJ3HvVI5V
 ZgiNuFJ2GO9Tty12txrHrKxuebb7sgVgvDRoFn0xHg==
X-Google-Smtp-Source: ACHHUZ67gEiOGiknBj1JBy/Dso2i3ySwMJXgM5XtyqXiXUizzRbHrmZ9f6oAP+GAUTgZGjYrbs6dNg==
X-Received: by 2002:a17:906:da87:b0:966:3c82:4a95 with SMTP id
 xh7-20020a170906da8700b009663c824a95mr9028525ejb.19.1683654804643; 
 Tue, 09 May 2023 10:53:24 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 gf25-20020a170906e21900b0094edfbd475csm1556761ejb.127.2023.05.09.10.53.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:53:24 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-50dba8a52dcso6603a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 10:53:24 -0700 (PDT)
X-Received: by 2002:a05:6402:2744:b0:506:90c4:b63b with SMTP id
 z4-20020a056402274400b0050690c4b63bmr6139edd.4.1683654804020; Tue, 09 May
 2023 10:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230504191243.746-1-gurchetansingh@chromium.org>
 <CAJ+F1CK+myw2n3bvT9Ys-heDr8W-CatJcroR=cPOpJUv_VDNwQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CK+myw2n3bvT9Ys-heDr8W-CatJcroR=cPOpJUv_VDNwQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 9 May 2023 10:53:10 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnakdA+q=+GDv0gFxFrQHTutsw=C=rPYm8vSSsNwhg1ag@mail.gmail.com>
Message-ID: <CAAfnVBnakdA+q=+GDv0gFxFrQHTutsw=C=rPYm8vSSsNwhg1ag@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] virtio-gpu cleanups and obvious definitions
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, kraxel@redhat.com, 
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com, 
 alex.bennee@linaro.org, shentey@gmail.com
Content-Type: multipart/alternative; boundary="00000000000084e3cd05fb466ead"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000084e3cd05fb466ead
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 5:43=E2=80=AFAM Marc-Andr=C3=A9 Lureau <marcandre.lu=
reau@gmail.com>
wrote:

> Hi
>
> On Thu, May 4, 2023 at 11:13=E2=80=AFPM Gurchetan Singh <
> gurchetansingh@chromium.org> wrote:
>
>> From: Gurchetan Singh <gurchetansingh@google.com>
>>
>> v3 of "virtio-gpu cleanups and obvious definitions"
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.html
>>
>> All patches have been reviewed, though there was a question from
>> Bernhard Beschow about patch (3) and how it fits with the QOM:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.html
>>
>> I go into detail in patch 3 commit message, but I think we meet
>> the requirements (which are tricky/fuzzy anyways).  Also, I think
>> this is the cleanest way to add another 3D virtgpu backend.  But
>> if anyone has other ideas, please do reply/review.
>>
>> Antonio Caggiano (1):
>>   virtio-gpu: CONTEXT_INIT feature
>>
>> Dr. David Alan Gilbert (1):
>>   virtio: Add shared memory capability
>>
>> Gurchetan Singh (3):
>>   hw/display/virtio-gpu-virgl: virtio_gpu_gl -> virtio_gpu_virgl
>>   hw/display/virtio-gpu-virgl: make GL device more library agnostic
>>   hw/display/virtio-gpu-virgl: define callbacks in realize function
>>
>>  hw/display/virtio-gpu-base.c   |   3 +
>>  hw/display/virtio-gpu-gl.c     | 114 +--------------------------
>>  hw/display/virtio-gpu-virgl.c  | 137 +++++++++++++++++++++++++++++++--
>>  hw/virtio/virtio-pci.c         |  18 +++++
>>  include/hw/virtio/virtio-gpu.h |  11 +--
>>  include/hw/virtio/virtio-pci.h |   4 +
>>  6 files changed, 160 insertions(+), 127 deletions(-)
>>
>> --
>> 2.40.1.521.gf1e218fcd8-goog
>>
>>
>>
> This looks fine to me:
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> however, do you have a series rebased on top that makes use of those
> changes? (I think we may want to delay merging this one until it's actual=
ly
> needed)
>

Got it.  Bernhard actually recommended a separate virtio-gpu-rutabaga
device instead of virtio-gpu-gl.  I went with that approach:

https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01571.html
https://gitlab.freedesktop.org/gurchetansingh/qemu-gfxstream/-/commits/qemu=
-gfxstream-3

I'll send out a new full-featured series once testing/hack cleanups are
complete -- so no further action is needed on your part.


>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000084e3cd05fb466ead
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 5:43=E2=80=AFA=
M Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">=
marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, M=
ay 4, 2023 at 11:13=E2=80=AFPM Gurchetan Singh &lt;<a href=3D"mailto:gurche=
tansingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: G=
urchetan Singh &lt;<a href=3D"mailto:gurchetansingh@google.com" target=3D"_=
blank">gurchetansingh@google.com</a>&gt;<br>
<br>
v3 of &quot;virtio-gpu cleanups and obvious definitions&quot;<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-04/msg05392.html</a><br>
<br>
All patches have been reviewed, though there was a question from<br>
Bernhard Beschow about patch (3) and how it fits with the QOM:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-05/msg00057.html</a><br>
<br>
I go into detail in patch 3 commit message, but I think we meet<br>
the requirements (which are tricky/fuzzy anyways).=C2=A0 Also, I think<br>
this is the cleanest way to add another 3D virtgpu backend.=C2=A0 But<br>
if anyone has other ideas, please do reply/review.<br>
<br>
Antonio Caggiano (1):<br>
=C2=A0 virtio-gpu: CONTEXT_INIT feature<br>
<br>
Dr. David Alan Gilbert (1):<br>
=C2=A0 virtio: Add shared memory capability<br>
<br>
Gurchetan Singh (3):<br>
=C2=A0 hw/display/virtio-gpu-virgl: virtio_gpu_gl -&gt; virtio_gpu_virgl<br=
>
=C2=A0 hw/display/virtio-gpu-virgl: make GL device more library agnostic<br=
>
=C2=A0 hw/display/virtio-gpu-virgl: define callbacks in realize function<br=
>
<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0| 114 +----------------=
----------<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 137 +++++++++++++++++++++++++++=
++++--<br>
=C2=A0hw/virtio/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++=
+++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 11 +--<br>
=C2=A0include/hw/virtio/virtio-pci.h |=C2=A0 =C2=A04 +<br>
=C2=A06 files changed, 160 insertions(+), 127 deletions(-)<br>
<br>
-- <br>
2.40.1.521.gf1e218fcd8-goog<br>
<br>
<br>
</blockquote></div><div><br></div><div>This looks fine to me:</div><div>Rev=
iewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div><b=
r></div><div>however, do you have a series rebased on top that makes use of=
 those changes? (I think we may want to delay merging this one until it&#39=
;s actually needed)</div></div></blockquote><div><br></div><div>Got it.=C2=
=A0 Bernhard actually recommended a separate virtio-gpu-rutabaga device ins=
tead of virtio-gpu-gl.=C2=A0 I went with that approach:</div><div><br></div=
><div><a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg0=
1571.html">https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01571.h=
tml</a></div><div><a href=3D"https://gitlab.freedesktop.org/gurchetansingh/=
qemu-gfxstream/-/commits/qemu-gfxstream-3">https://gitlab.freedesktop.org/g=
urchetansingh/qemu-gfxstream/-/commits/qemu-gfxstream-3</a><br></div><div><=
br></div><div>I&#39;ll send out a new full-featured series once testing/hac=
k cleanups are complete -- so no further action is needed on your part.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div><br></div><br><span>-- </span><br><div dir=3D"ltr">Marc-And=
r=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--00000000000084e3cd05fb466ead--

