Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E03A3048
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:10:55 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNGh-0000uJ-0X
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrNEk-0007jg-3g
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:08:54 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrNEe-0000Hh-6M
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:08:53 -0400
Received: by mail-yb1-xb31.google.com with SMTP id g38so25843ybi.12
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pt/TZ91+zLumDJ1F3jy2c5S3Fi+vFLnXjC8A5WA1q0o=;
 b=VybUse79xhfiedVnWLf953Q7OuTffy3PCLRHOuxE3zO1+bpYU3QsJ/+XeaFnw9n1m0
 q68pDqjNylzVkIs8Ngu5cXpmx+vdKVcBN6TaPpuHHzK0+/ynOxxAOYmpWfd27wD+OD1b
 H8n0wNc/cd6gI6b4buVZAH2qOh0ddNWNOM4RvFNctplaljpHV73lo33u9n21ongUOsKh
 8xdLdrRIbPUHXr8F5pBkOjIOCY2cQ1Mf8n2+MjB54ajGnpSljjmKW/g1i40kNS38aqN1
 7GQBBVvAxdTM5/fAW93hEXjv98+XRIEw+r2V+Uh07nBX7j1uXKUG2bOIh2enGsYoF5FP
 Efvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pt/TZ91+zLumDJ1F3jy2c5S3Fi+vFLnXjC8A5WA1q0o=;
 b=EonLrcv8n4tSdZEoW6chfphf1mMf8aO1Qmh+FVOLOQQuogc5Rc1DKvemF+qCpkChrf
 1rbk7bP6T4WC1AVD72v9kIknYU+ppMxuHlRaURdWRL8+mTALtS1VQ1IT8Jh7Zjmdi6MT
 QVmmCmG82NHGYHI9PcoNFtCmYqgmehO6dpMpsG++X29Uwap0egdJ17bEZ1gh/cBjPeKW
 /36bpVgK06cUjYFu4oh6ZVMMLg8PeSiLwg6bXorPI3sdFLRGOi7r36Ovlr5lU/NIAfU4
 zhYpUc7Cz2663AVQbqdoi7rNASQWQusL/z3mIDiW44enUUIrDh1IAivn8CLhk8P0lxF6
 co1Q==
X-Gm-Message-State: AOAM530C3dOgske7CvOz5a/UcBTpqomg8GJTFHIqrRl77XCWSUpwWcxM
 5epw13LmVo7hEmgCpUoScvtgcbW0wRBNkWdKU+lWtQ==
X-Google-Smtp-Source: ABdhPJxM+TjZxlsSsV/Y4vH0gckThOrKam3z7dyPOyBaD+4wNIEbNZm6ZFHn8x4QqXM3giMc2b/29R4x4omIyYeyzik=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr8541680ybm.345.1623341327177; 
 Thu, 10 Jun 2021 09:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210610155811.3313927-1-konstantin@daynix.com>
 <YMI3gundDsLZq1lw@redhat.com>
In-Reply-To: <YMI3gundDsLZq1lw@redhat.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 10 Jun 2021 19:08:36 +0300
Message-ID: <CAJ28CFR0CBAsq4WokeW_OG8gG2UFGSL3H0UB-p2FgXxH3pjhbg@mail.gmail.com>
Subject: Re: [PATCH v2] qga-win: Free GMatchInfo properly
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000027ed8105c46b9b20"
Received-SPF: none client-ip=2607:f8b0:4864:20::b31;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000027ed8105c46b9b20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk wrote:
> > The g_regex_match function creates match_info even if it
> > returns FALSE. So we should always call g_match_info_free.
> > A better solution is using g_autoptr for match_info variable.
> >
> > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> > ---
> >  qga/commands-win32.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> > index 300b87c859..785a5cc6b2 100644
> > --- a/qga/commands-win32.c
> > +++ b/qga/commands-win32.c
> > @@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> **errp)
> >              continue;
> >          }
> >          for (j =3D 0; hw_ids[j] !=3D NULL; j++) {
> > -            GMatchInfo *match_info;
> > +            g_autoptr(GMatchInfo) match_info;
>
> This should be initialized to NULL otherwise...
>
> >              GuestDeviceIdPCI *id;
> >              if (!g_regex_match(device_pci_re, hw_ids[j], 0,
> &match_info)) {
> >                  continue;
>
> this continue will trigger freeing of unintialized memory
>

But we always call match_info, so match_info is always initialized.
The g_regex_match function creates match_info even if it returns FALSE.


>
> Essentially all g_auto* variables should be init to NULL
> at all times, even if it currently looks harmless.
>
> > @@ -2511,7 +2511,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> **errp)
> >              id->vendor_id =3D g_ascii_strtoull(vendor_id, NULL, 16);
> >              id->device_id =3D g_ascii_strtoull(device_id, NULL, 16);
> >
> > -            g_match_info_free(match_info);
> >              break;
> >          }
> >          if (skip) {
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

Best wishes,
Kostiantyn Kostiuk

--00000000000027ed8105c46b9b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrang=C3=A9 &lt;<a h=
ref=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 10, 2021 =
at 06:58:11PM +0300, Kostiantyn Kostiuk wrote:<br>
&gt; The g_regex_match function creates match_info even if it<br>
&gt; returns FALSE. So we should always call g_match_info_free.<br>
&gt; A better solution is using g_autoptr for match_info variable.<br>
&gt; <br>
&gt; Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@day=
nix.com" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qga/commands-win32.c | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
&gt; index 300b87c859..785a5cc6b2 100644<br>
&gt; --- a/qga/commands-win32.c<br>
&gt; +++ b/qga/commands-win32.c<br>
&gt; @@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error=
 **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; hw_ids[j] !=3D NULL; j=
++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GMatchInfo *match_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GMatchInfo) match=
_info;<br>
<br>
This should be initialized to NULL otherwise...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDeviceIdPCI *id;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_regex_match(dev=
ice_pci_re, hw_ids[j], 0, &amp;match_info)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
;<br>
<br>
this continue will trigger freeing of unintialized memory<br></blockquote><=
div><br></div><div><div>But we always call match_info, so match_info is alw=
ays=C2=A0initialized.</div><span class=3D"gmail-im"><div>The g_regex_match =
function creates match_info even if it returns FALSE. </div></span></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Essentially all g_auto* variables should be init to NULL<br>
at all times, even if it currently looks harmless.<br>
<br>
&gt; @@ -2511,7 +2511,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error=
 **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id-&gt;vendor_id =3D g=
_ascii_strtoull(vendor_id, NULL, 16);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id-&gt;device_id =3D g=
_ascii_strtoull(device_id, NULL, 16);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_match_info_free(match_inf=
o);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (skip) {<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br></blockquote><div><br></div><div><br clear=3D"all"><div><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Best wishes,</div><div>Ko=
stiantyn Kostiuk</div></div></div></div>=C2=A0</div></div></div>

--00000000000027ed8105c46b9b20--

