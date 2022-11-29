Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E616E63C07C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p00A8-0000X2-A3; Tue, 29 Nov 2022 07:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p00A6-0000WM-5M
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p00A4-0006FK-6D
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669726590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vogiSoL5xLYjiogxZoCy+v2W3+1tiolZfd55MIxTrnI=;
 b=PGX/Wb/hoB1++EQ50tSWMmuOlIEtN1Fb3xigDimCMRdWe6tnOb9Tj9FHlD+5auumJHM37R
 9KPuOiPK0jNlsjvLIYQo5kT/88IrXnP2bM0WU7AxTXvM7z5FxBxaqlzvL/3PnHZY+tWW0M
 D1KC4aOIumm/zLq4+c598yHwTIttfzc=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266--NGn4LUQPBmOGkeuRIkpng-1; Tue, 29 Nov 2022 07:56:29 -0500
X-MC-Unique: -NGn4LUQPBmOGkeuRIkpng-1
Received: by mail-vs1-f70.google.com with SMTP id
 x124-20020a676382000000b003b06d949d70so5096716vsb.19
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 04:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vogiSoL5xLYjiogxZoCy+v2W3+1tiolZfd55MIxTrnI=;
 b=Fd5vfZ3VIyXDHt8NbaCIMQ56CcJ0sreLWr2Zb4pyYwi/kWv+teuy9kGqaNv0/FIlfT
 j0bDIJLpqKZdmfF6BpJvB8rFF+RzHN7hwx6kpVRk4IC+FS0/Hj/lGoIcXfuex/S8QNmA
 Ksv8KxYrGmXoj/SNpTnSmpGCgtD4duHL339SQ7alTkuejgbfzsFxAgvha8gH7i0uJ41C
 nowrdrqXV4bdhTlm0B0UJVVGXLcTodIwZsX8Pfs4LL4615w/7lFSz8Z/P24d3heBmy5p
 eXeaJihTzacENaSZpLErnpvCDK5qKksPKrvjRyaPjbxPhy//S/LIbI7zH7Zb7p7Upla2
 T1+w==
X-Gm-Message-State: ANoB5plEfc+eM0a1EG0ZM4Tfn73caMbSnZJdyPmAAOPQorfkqodaPRQe
 aSz2qmPW44uiPZmX4HeyMt93P7q4ZzgvwErzof/zyjAdxUaKkNmJxBnZHafcTbnEp1wfJ+UZCfe
 VIK87PJvZVEozIHUm0OwCRbL0gE6d+eA=
X-Received: by 2002:a67:ee95:0:b0:3aa:2354:b5d2 with SMTP id
 n21-20020a67ee95000000b003aa2354b5d2mr22508344vsp.16.1669726588769; 
 Tue, 29 Nov 2022 04:56:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52HkJJudKVSfqlTkXIjlRyPsgZzZ0c4ks3Zj8GQNJYYr56uRqhOLI586HTliZTN67BpJP+9uqMP+uoLgdVyek=
X-Received: by 2002:a67:ee95:0:b0:3aa:2354:b5d2 with SMTP id
 n21-20020a67ee95000000b003aa2354b5d2mr22508336vsp.16.1669726588524; Tue, 29
 Nov 2022 04:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
 <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
 <Y4W+/OZWjVZz75pU@redhat.com>
In-Reply-To: <Y4W+/OZWjVZz75pU@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 29 Nov 2022 13:56:16 +0100
Message-ID: <CABgObfaL7m65fms0DKbqg4GhFqwFmfH5PXcDXuE1aqFYGhpxtw@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002e730205ee9b847e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--0000000000002e730205ee9b847e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 29 nov 2022, 09:12 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> > However some firmware sources are only available from QEMU's submodules=
.
> So
> > either we distribute those submodules as separate tarballs, or distros
> > would need to use the bundled tarball as well.
>
> If the firmware doesn't exist as a standalone project, IMHO, it is
> fine to bundle their sources with QEMU


> They're not small though, for example we have a fork of uboot.

> Separately, I am not even sure what compiler is needed for the old
> > Macintosh ROMs...
>
> That we're not sure how to build some ROMS is exactly why
> distros have their build everything from source policy !
>

What I mean is that it might be that an ancient proprietary compiler is
needed. I am not sure though.

Paolo


> With regards,
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

--0000000000002e730205ee9b847e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 29 nov 2022, 09:12 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
&gt; However some firmware sources are only available from QEMU&#39;s submo=
dules. So<br>
&gt; either we distribute those submodules as separate tarballs, or distros=
<br>
&gt; would need to use the bundled tarball as well.<br>
<br>
If the firmware doesn&#39;t exist as a standalone project, IMHO, it is<br>
fine to bundle their sources with QEMU</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div><=
/div><div dir=3D"auto">They&#39;re not small though, for example we have a =
fork of uboot.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; Separately, I am not even sure what compiler is needed for the old<br>
&gt; Macintosh ROMs...<br>
<br>
That we&#39;re not sure how to build some ROMS is exactly why<br>
distros have their build everything from source policy !<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">What I mean is that=
 it might be that an ancient proprietary compiler is needed. I am not sure =
though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000002e730205ee9b847e--


