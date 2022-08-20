Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2D59AC53
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 09:44:47 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPJ9y-0004IY-3S
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 03:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oPJ83-0001mz-0I
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oPJ7y-0006Tw-FP
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660981361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4HrGZZHS/4/lHhUkVBDFNRMg/i8IinScJmDhGsDP2s=;
 b=T+2deSj5q9aqkrXGQdRvd7t+DZ2TMaNkjMjlMhNXikT8CVHSRUgyMp4RhAHW0Ex2ON1L/b
 hQiLBdPWw4wj4a0+CAaII51AE4NkreD1rI9MeHVnyScbKjr/0glx2ecWjK53U1S2tXwFLA
 tvo6hAiI5k/lTGctHSDMQURlVdM1szQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-_Q5KJf1qN_mF5Zl6Pkz8gA-1; Sat, 20 Aug 2022 03:42:39 -0400
X-MC-Unique: _Q5KJf1qN_mF5Zl6Pkz8gA-1
Received: by mail-lj1-f200.google.com with SMTP id
 l6-20020a2ea306000000b0025ff55d64afso1559946lje.0
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 00:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=m4HrGZZHS/4/lHhUkVBDFNRMg/i8IinScJmDhGsDP2s=;
 b=ksIsWYIsawVooJyI/3RABJS4cWQHyZYqA0vuQ6yxzR4LsMw58o0jMGzP96Zj55yda0
 Rmff8qH3LNs/oIB1m3rSIeyvSe8MghCsdvCXK7pxpIywg9pQyo94Y6Fwd3QDQTBbuZNh
 XpJvEXlJR40lOSwSanHzIVQNN1UvPutYe3LZrvwDAQ87rLMgn3LovKd7WkZ0WOJT4HEr
 lRV5bM+TT7SEBwwoNkgSvUAybZMpRhIusx2sPoEsE8oBqPZcPOY9pAgPjDurff6KscLD
 GI40sm9M57ERoFMZboMlzDGCrHZ/iOs/4KywqKc9TRzFs6mBcPoniMNcKliiKs+rftPw
 NxQA==
X-Gm-Message-State: ACgBeo1HI3ZJStIsG4aLRIXK3IOsmBAITOiskHYZm1yWfB9MGGJW/D8z
 03khh8Jtnp/mAAMbuFdz6PDTKc0NjB0d6+3//TJctt+rmEPCl1vDAgp8C3ZWVTc6qmNYQpjwm07
 PLLuWURYNBLYxm1lN0JoBTG6K8DcfId8=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr3225097ljq.205.1660981358043; 
 Sat, 20 Aug 2022 00:42:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ydv79hauO+sbAiaqFM1I1PcAQAp1gOdiAdoHH74eYYAd9k68bfBpXJ6V7XeMr0UH1P9wT9CBocubID5XJ9rc=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr3225090ljq.205.1660981357718; Sat, 20
 Aug 2022 00:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220804122950.1577012-1-john@john-millikin.com>
In-Reply-To: <20220804122950.1577012-1-john@john-millikin.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 20 Aug 2022 09:42:25 +0200
Message-ID: <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
To: John Millikin <john@john-millikin.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000ce4ab705e6a75b00"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

--000000000000ce4ab705e6a75b00
Content-Type: text/plain; charset="UTF-8"

No, I had not seen it indeed. Queued now, thanks.

Paolo

Il gio 4 ago 2022, 14:39 John Millikin <john@john-millikin.com> ha scritto:

> SunOS expects CD-ROM devices to have a block size of 512, and will
> fail to mount or install using QEMU's default block size of 2048.
>
> When initializing the SCSI device, allow the `physical_block_size'
> block device option to override the default block size.
>
> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
>  hw/scsi/scsi-disk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> This is the same diff as sent to qemu-devel@ about a week ago. That
> first email seems to have been eaten by a grue, but replying to it
> worked, so maybe the grue is gone now.
>
> See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
> related discussion about SunOS CD-ROM compatibility.
>
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index f5cdb9ad4b..acdf8dc05c 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error
> **errp)
>      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
>      AioContext *ctx;
>      int ret;
> +    uint32_t blocksize = 2048;
>
>      if (!dev->conf.blk) {
>          /* Anonymous BlockBackend for an empty drive. As we put it into
> @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error
> **errp)
>          assert(ret == 0);
>      }
>
> +    if (dev->conf.physical_block_size != 0) {
> +        blocksize = dev->conf.physical_block_size;
> +    }
> +
>      ctx = blk_get_aio_context(dev->conf.blk);
>      aio_context_acquire(ctx);
> -    s->qdev.blocksize = 2048;
> +    s->qdev.blocksize = blocksize;
>      s->qdev.type = TYPE_ROM;
>      s->features |= 1 << SCSI_DISK_F_REMOVABLE;
>      if (!s->product) {
> --
> 2.25.1
>
>

--000000000000ce4ab705e6a75b00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, I had not seen it indeed. Queued now, thanks.<div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 4 ago 2022, 1=
4:39 John Millikin &lt;<a href=3D"mailto:john@john-millikin.com" target=3D"=
_blank" rel=3D"noreferrer">john@john-millikin.com</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">SunOS expects CD-ROM devices to have a b=
lock size of 512, and will<br>
fail to mount or install using QEMU&#39;s default block size of 2048.<br>
<br>
When initializing the SCSI device, allow the `physical_block_size&#39;<br>
block device option to override the default block size.<br>
<br>
Signed-off-by: John Millikin &lt;<a href=3D"mailto:john@john-millikin.com" =
rel=3D"noreferrer noreferrer" target=3D"_blank">john@john-millikin.com</a>&=
gt;<br>
---<br>
=C2=A0hw/scsi/scsi-disk.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
This is the same diff as sent to qemu-devel@ about a week ago. That<br>
first email seems to have been eaten by a grue, but replying to it<br>
worked, so maybe the grue is gone now.<br>
<br>
See <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1127" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-=
project/qemu/-/issues/1127</a> for some<br>
related discussion about SunOS CD-ROM compatibility.<br>
<br>
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c<br>
index f5cdb9ad4b..acdf8dc05c 100644<br>
--- a/hw/scsi/scsi-disk.c<br>
+++ b/hw/scsi/scsi-disk.c<br>
@@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0SCSIDiskState *s =3D DO_UPCAST(SCSIDiskState, qdev, dev=
);<br>
=C2=A0 =C2=A0 =C2=A0AioContext *ctx;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 uint32_t blocksize =3D 2048;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!dev-&gt;conf.blk) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Anonymous BlockBackend for an empty dr=
ive. As we put it into<br>
@@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(ret =3D=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (dev-&gt;conf.physical_block_size !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blocksize =3D dev-&gt;conf.physical_block_size=
;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ctx =3D blk_get_aio_context(dev-&gt;conf.blk);<br>
=C2=A0 =C2=A0 =C2=A0aio_context_acquire(ctx);<br>
-=C2=A0 =C2=A0 s-&gt;qdev.blocksize =3D 2048;<br>
+=C2=A0 =C2=A0 s-&gt;qdev.blocksize =3D blocksize;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qdev.type =3D TYPE_ROM;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;features |=3D 1 &lt;&lt; SCSI_DISK_F_REMOVABLE;<b=
r>
=C2=A0 =C2=A0 =C2=A0if (!s-&gt;product) {<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000ce4ab705e6a75b00--


