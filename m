Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CA6562FA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 15:03:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9o4E-0006z4-JS; Mon, 26 Dec 2022 09:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o43-0006w5-OD
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o41-0007SX-W8
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672063369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PssJfykA68WL45Xut8F3XRqdiHFlQA/+Lbe1U8v4kH4=;
 b=gHagDIdQP/oE1PB3FyyeI0p/2kRkq2oq/Ql57dEU8/JQj4iaSinu/TuRwH3kYc2lHKOC7C
 +1NP5DAnyeI4WpUOAkEf61qWEtisCvOIJMwwdEbyFhaE1wHH66tUWWcYCvgc5SFK1AI2ki
 7KoB5iQNrxdHACU4U6KqmqiSlMXMCDY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-iXva3_-wPHevMb3mI68gIA-1; Mon, 26 Dec 2022 09:02:47 -0500
X-MC-Unique: iXva3_-wPHevMb3mI68gIA-1
Received: by mail-vs1-f69.google.com with SMTP id
 w125-20020a676283000000b003c832a3b970so807667vsb.6
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 06:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PssJfykA68WL45Xut8F3XRqdiHFlQA/+Lbe1U8v4kH4=;
 b=M1TXRd/W/2wCZQZIYXOfJm+vtTAE2u+UaX7UCOL0mXJki3k183dMI3EUB+cQ84kUAd
 s/sisSbbF8QhJx4Vepta4bRXISDo28PDB5ClkbO2AFNbjxI2XG59TB9Necsd+EcVNx5S
 6cAY0u0qDxdhjrPpp3+NVDoQn68uGfKFVuNpEoPpuyHG8kx9qTgTq9TnvxFuQ8bcV019
 PLmgH/kua9XDkQU1dRX6iyHeKQwO4TFUtzPX7FWonuWVY7thAmrFmgGVXEgubhNoswNc
 oRJWS0WjRvDQQzPRPePr87qlKEFaZWnD/lEhWXKJa86v/eYQfJSKPE77lQjNz6VFFbhn
 kseg==
X-Gm-Message-State: AFqh2kqJCwJX7ai3H9Gy1BVFv0v9efxGUkmCjRiGV7sxITWGjBDUq6j0
 mtJw605vBtS6hoW2hhE3yK7ir3bPa3CKr9rkyMm+1hDcB6d7vzV2ihw/6zAf5YHpjZTxCSBgL5i
 gW4XStjjh276uIz1Tb0wHrkQ9/8LrkWw=
X-Received: by 2002:a05:6102:3351:b0:3c3:f1cd:f17a with SMTP id
 j17-20020a056102335100b003c3f1cdf17amr1046355vse.40.1672063366755; 
 Mon, 26 Dec 2022 06:02:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwjCvz1g31cCaeAxTrhzQwOys4mK/TExLlks+cQLmXdnPI+EjWRxWsx2kMlfnKCTfcE6Ht7hIqDEFk4S9MWkY=
X-Received: by 2002:a05:6102:3351:b0:3c3:f1cd:f17a with SMTP id
 j17-20020a056102335100b003c3f1cdf17amr1046349vse.40.1672063366488; Mon, 26
 Dec 2022 06:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20221120140044.752503-1-kfir@daynix.com>
 <CAJ+F1CJzw9M_DEbe0QG7Z8pt91JnNfZ8v93Ni8o9Fxq2ZVr=wQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CJzw9M_DEbe0QG7Z8pt91JnNfZ8v93Ni8o9Fxq2ZVr=wQ@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 26 Dec 2022 16:02:35 +0200
Message-ID: <CAPMcbCrO_3oohFfvWe-Wi5yUXky_jifb5hJUW2UKqFZrSVpiOA@mail.gmail.com>
Subject: Re: [PATCH 0/2] qemu-ga-win: 'guest-get-fsinfo' command wont query
 storage devices of bus type USB
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="00000000000000801e05f0bb97f4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000000801e05f0bb97f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the series was merged

Best Regards,
Konstantin Kostiuk.

On Mon, Nov 21, 2022 at 8:38 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Sun, Nov 20, 2022 at 6:09 PM Kfir Manor <kfir@daynix.com> wrote:
> >
> > guest-get-fsinfo won't query storage devices of bus-type USB (
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2090333).
> >
> > Bug, get_pci_info function returns an error after not finding any
> storage port device info on the USB disk parent device (because of USB
> abstraction).
> >
> > Fix, skip getting PCI info (get_pci_info function) for USB disks (as US=
B
> disk doesn't have PCI info), and return an empty PCI address instead to
> keep with schema.
> >
> >
> > Kfir Manor (2):
> >   adding a empty PCI address creation function
> >   skip getting pci info for USB disks
> >
> >  qga/commands-win32.c | 32 +++++++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > --
> > 2.38.1
> >
> >
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>
> --
> Marc-Andr=C3=A9 Lureau
>
>

--00000000000000801e05f0bb97f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>the series was merged</div><div><br></div><div><div><=
div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regard=
s,</div><div>Konstantin Kostiuk.</div></div></div></div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2=
1, 2022 at 8:38 AM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi<br>
<br>
On Sun, Nov 20, 2022 at 6:09 PM Kfir Manor &lt;<a href=3D"mailto:kfir@dayni=
x.com" target=3D"_blank">kfir@daynix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; guest-get-fsinfo won&#39;t query storage devices of bus-type USB (<a h=
ref=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2090333" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D20903=
33</a>).<br>
&gt;<br>
&gt; Bug, get_pci_info function returns an error after not finding any stor=
age port device info on the USB disk parent device (because of USB abstract=
ion).<br>
&gt;<br>
&gt; Fix, skip getting PCI info (get_pci_info function) for USB disks (as U=
SB disk doesn&#39;t have PCI info), and return an empty PCI address instead=
 to keep with schema.<br>
&gt;<br>
&gt;<br>
&gt; Kfir Manor (2):<br>
&gt;=C2=A0 =C2=A0adding a empty PCI address creation function<br>
&gt;=C2=A0 =C2=A0skip getting pci info for USB disks<br>
&gt;<br>
&gt;=C2=A0 qga/commands-win32.c | 32 +++++++++++++++++++++-----------<br>
&gt;=C2=A0 1 file changed, 21 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
<br>
<br>
-- <br>
Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div>

--00000000000000801e05f0bb97f4--


