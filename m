Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0A5ACCFF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 09:45:41 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV6nc-0003xl-8D
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 03:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV6le-0002VC-PD
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV6lb-0006Ki-WB
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662363814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3Mqp79kYx0FHrOGIMwoj1igSipSgusjVmgbcEDX34o=;
 b=T517F79ppv3JNSQr/NF8h8tQJozWW3+0Xz0If4JiUUYFMefwMXolwtpVus0QE9Xw2W0fl+
 gpgyNzGBeK4vEbeFylrukkxMs0h7iT5OBWH1sYHmyIEZWXuO+9PP4cwJbvkooB6Vwz+Y4s
 KN/lJ0yU7xKx+tgSeCeUUpHl0rBtD/k=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-o0W7chYnM2-9Iv71Ii5PWQ-1; Mon, 05 Sep 2022 03:43:33 -0400
X-MC-Unique: o0W7chYnM2-9Iv71Ii5PWQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 v4-20020a2ea444000000b00261e0d5bc25so2607765ljn.19
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 00:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=X3Mqp79kYx0FHrOGIMwoj1igSipSgusjVmgbcEDX34o=;
 b=avfuug3MWkf5dWkV3jiypFteToxxfDohy4cW2IEHYFUeaR4mxrlf2ueXUefALnU14j
 2k604886dPWXU9Z0K4/I34zu4jtUWqc2g5HS11dYznLIdZ7HHLbVob7x+YPqmKB9uiVX
 o2w/Tu+SgTYDP4gG6TNIcXV6TLAQ0iVWlTN41pC/VSJE0aMHZYLuhlzx0iadS5LNrMnD
 hO4JaKZyS2lR5seX+dkzEkKTqRYa8QGYUJ0pWfnvH4LtSIofcgK136CKz3U1RuV9qTBA
 /byLJ5bMrV3k/5KsSeIDt+7zmEbbrBAUkwsBhAHLghC/fAcHEQA2JkSSndzo3nV5Dbfq
 O0hQ==
X-Gm-Message-State: ACgBeo3c7n4bV/IMQSH0d8VQkuaX+LjP1Uc+SyVnZLWIwJt+0zxqcwSx
 DHuvSjMhBixI3gVgqO1X7oF4VTeatvQaTt4HoxHlWOp8ldvoJ5wyGExJ3MpGQ4iWkqXKt+ur6z5
 nihFLC5qO229I7pVv4i2tLetNwoK5x2I=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr14653531ljq.205.1662363811803; 
 Mon, 05 Sep 2022 00:43:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7eoOWn4xkCtC0SI2xyAp3hkjIn6ucmNfJjFvt7Et95tF7VKcqXFW8EHZiBYrheSXpp0vkRrNq1ZNV2b9xUf1A=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr14653524ljq.205.1662363811478; Mon, 05
 Sep 2022 00:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220804122950.1577012-1-john@john-millikin.com>
 <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
 <YxVtWkzEJP7WotRe@john-millikin.com>
In-Reply-To: <YxVtWkzEJP7WotRe@john-millikin.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 5 Sep 2022 09:43:20 +0200
Message-ID: <CABgObfb=nS0MEG2WWA3mu=LqiqJKSFxr0A53fPkYKvT+k10cZg@mail.gmail.com>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
To: John Millikin <john@john-millikin.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="00000000000078970305e7e93c37"
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

--00000000000078970305e7e93c37
Content-Type: text/plain; charset="UTF-8"

Probably just my screw up, or it broke something when testing... let me
check.

Paolo

Il lun 5 set 2022, 05:30 John Millikin <john@john-millikin.com> ha scritto:

> I notice this patch wasn't included in the [PULL] series last week, and
> it isn't present in the `master` branch.
>
> Is there anything else I should be doing to get it merged in? Sorry if
> this isn't a good question, I'm not used to QEMU's email-based change
> management workflow.
>
> On Sat, Aug 20, 2022 at 09:42:25AM +0200, Paolo Bonzini wrote:
> > No, I had not seen it indeed. Queued now, thanks.
> >
> > Paolo
> >
> > Il gio 4 ago 2022, 14:39 John Millikin <john@john-millikin.com> ha
> scritto:
> >
> > > SunOS expects CD-ROM devices to have a block size of 512, and will
> > > fail to mount or install using QEMU's default block size of 2048.
> > >
> > > When initializing the SCSI device, allow the `physical_block_size'
> > > block device option to override the default block size.
> > >
> > > Signed-off-by: John Millikin <john@john-millikin.com>
> > > ---
> > >  hw/scsi/scsi-disk.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > This is the same diff as sent to qemu-devel@ about a week ago. That
> > > first email seems to have been eaten by a grue, but replying to it
> > > worked, so maybe the grue is gone now.
> > >
> > > See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
> > > related discussion about SunOS CD-ROM compatibility.
> > >
> > > diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> > > index f5cdb9ad4b..acdf8dc05c 100644
> > > --- a/hw/scsi/scsi-disk.c
> > > +++ b/hw/scsi/scsi-disk.c
> > > @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev,
> Error
> > > **errp)
> > >      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
> > >      AioContext *ctx;
> > >      int ret;
> > > +    uint32_t blocksize = 2048;
> > >
> > >      if (!dev->conf.blk) {
> > >          /* Anonymous BlockBackend for an empty drive. As we put it
> into
> > > @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev,
> Error
> > > **errp)
> > >          assert(ret == 0);
> > >      }
> > >
> > > +    if (dev->conf.physical_block_size != 0) {
> > > +        blocksize = dev->conf.physical_block_size;
> > > +    }
> > > +
> > >      ctx = blk_get_aio_context(dev->conf.blk);
> > >      aio_context_acquire(ctx);
> > > -    s->qdev.blocksize = 2048;
> > > +    s->qdev.blocksize = blocksize;
> > >      s->qdev.type = TYPE_ROM;
> > >      s->features |= 1 << SCSI_DISK_F_REMOVABLE;
> > >      if (!s->product) {
> > > --
> > > 2.25.1
> > >
> > >
>
>

--00000000000078970305e7e93c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Probably just my screw up, or it broke something when tes=
ting... let me check.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Il lun 5 set 2022, 05:30 John Millikin &lt;<a href=3D"mailto:john@john-m=
illikin.com">john@john-millikin.com</a>&gt; ha scritto:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">I notice this patch wasn&#39;t included in the [PULL] =
series last week, and<br>
it isn&#39;t present in the `master` branch.<br>
<br>
Is there anything else I should be doing to get it merged in? Sorry if<br>
this isn&#39;t a good question, I&#39;m not used to QEMU&#39;s email-based =
change<br>
management workflow.<br>
<br>
On Sat, Aug 20, 2022 at 09:42:25AM +0200, Paolo Bonzini wrote:<br>
&gt; No, I had not seen it indeed. Queued now, thanks.<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; Il gio 4 ago 2022, 14:39 John Millikin &lt;<a href=3D"mailto:john@john=
-millikin.com" target=3D"_blank" rel=3D"noreferrer">john@john-millikin.com<=
/a>&gt; ha scritto:<br>
&gt; <br>
&gt; &gt; SunOS expects CD-ROM devices to have a block size of 512, and wil=
l<br>
&gt; &gt; fail to mount or install using QEMU&#39;s default block size of 2=
048.<br>
&gt; &gt;<br>
&gt; &gt; When initializing the SCSI device, allow the `physical_block_size=
&#39;<br>
&gt; &gt; block device option to override the default block size.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: John Millikin &lt;<a href=3D"mailto:john@john-mill=
ikin.com" target=3D"_blank" rel=3D"noreferrer">john@john-millikin.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/scsi/scsi-disk.c | 7 ++++++-<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; This is the same diff as sent to qemu-devel@ about a week ago. Th=
at<br>
&gt; &gt; first email seems to have been eaten by a grue, but replying to i=
t<br>
&gt; &gt; worked, so maybe the grue is gone now.<br>
&gt; &gt;<br>
&gt; &gt; See <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1127=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-p=
roject/qemu/-/issues/1127</a> for some<br>
&gt; &gt; related discussion about SunOS CD-ROM compatibility.<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c<br>
&gt; &gt; index f5cdb9ad4b..acdf8dc05c 100644<br>
&gt; &gt; --- a/hw/scsi/scsi-disk.c<br>
&gt; &gt; +++ b/hw/scsi/scsi-disk.c<br>
&gt; &gt; @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev=
, Error<br>
&gt; &gt; **errp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SCSIDiskState *s =3D DO_UPCAST(SCSIDiskState,=
 qdev, dev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AioContext *ctx;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t blocksize =3D 2048;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!dev-&gt;conf.blk) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Anonymous BlockBackend for a=
n empty drive. As we put it into<br>
&gt; &gt; @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *de=
v, Error<br>
&gt; &gt; **errp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret =3D=3D 0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (dev-&gt;conf.physical_block_size !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 blocksize =3D dev-&gt;conf.physical_=
block_size;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ctx =3D blk_get_aio_context(dev-&gt;conf.blk)=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 aio_context_acquire(ctx);<br>
&gt; &gt; -=C2=A0 =C2=A0 s-&gt;qdev.blocksize =3D 2048;<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;qdev.blocksize =3D blocksize;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;qdev.type =3D TYPE_ROM;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;features |=3D 1 &lt;&lt; SCSI_DISK_F_RE=
MOVABLE;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!s-&gt;product) {<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</blockquote></div>

--00000000000078970305e7e93c37--


