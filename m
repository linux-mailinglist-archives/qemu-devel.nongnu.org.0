Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE063B23A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 20:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozjlL-0003UW-6Q; Mon, 28 Nov 2022 14:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ozjlG-0003UJ-Nl
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ozjlC-0000cX-23
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669663539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxrp0YFufxBfT3PaPKmtGGfeKfZv8bZkL3pGbgM/uo8=;
 b=a2pucjd2DXPaG/WGZjJ3sIeiIoUgMHBiK3hHIivuEgGV4W0r1Hl9Hvu9Hv8osh3nvODmTk
 UdTrxoOixcGJAjOhQ2Ngj61Vwoc1sc7vCapF4Pic2OGud5XrVufvEQVYPf6zHZuAxIg4Dn
 geHGuoh1x/fi1pi1FGBx9u7QtGhC5yw=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-kT39qaCpO-e8Sk9RL6H0Cg-1; Mon, 28 Nov 2022 14:25:37 -0500
X-MC-Unique: kT39qaCpO-e8Sk9RL6H0Cg-1
Received: by mail-ua1-f72.google.com with SMTP id
 a43-20020a9f376e000000b003eac6b97cf1so6271372uae.11
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 11:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxrp0YFufxBfT3PaPKmtGGfeKfZv8bZkL3pGbgM/uo8=;
 b=yFKi2ktShH72llJ26J6koZPmyLVjUXwytYk3wl+izC6s6fyvP1dkcFtlh/+samjxTg
 DI97OL+m4uMqqEnYI0004q5F7o4mv619jag6fXFLf8XGzELHf7HQRaCs7IEHTQWwc+EL
 hWKubkR40CZad5chR7avkG2ZCBNIu5DSHQk4+4zcukXRiWgRXIIhOayg6fLSpQSQ849N
 eI67NIhb58iYdoA8JNzYc8UVQKi5+vbICJYWpKeg98NKeOBVmkS+8DKUFeMYvCW9lAcC
 GnN9ErW6mLHir/7CT4tEIuH5fhAq3tLD3zJkJ+W9jNa84Mf71QclUj86uD/Qp314jChk
 k7Lg==
X-Gm-Message-State: ANoB5plS0aryCmJ/dMW15X/52yS847qS1yKbseCImirddmJcR0Jz5nym
 rG9iYvXrd99yiKfnxRWLBeXq4U8U2Abn2oYzkX6gKMZ4woSRUKeRSNrAtCaV19/mX3LeXbrpKBm
 Cvin2EU4+6w9vSsM6cHqrKSQXE8IlEpE=
X-Received: by 2002:ac5:c915:0:b0:3bc:2476:f74a with SMTP id
 t21-20020ac5c915000000b003bc2476f74amr31063239vkl.19.1669663537260; 
 Mon, 28 Nov 2022 11:25:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qtXAi5P7UfIiONP77ploC43NW1HSg/oYdeEYX0YFlBV2XpkzONn/lDqYCDUQcQDL831khDeX8I48fg9upSUA=
X-Received: by 2002:ac5:c915:0:b0:3bc:2476:f74a with SMTP id
 t21-20020ac5c915000000b003bc2476f74amr31063218vkl.19.1669663537011; Mon, 28
 Nov 2022 11:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
In-Reply-To: <Y4TqEDYs+T4z6PX/@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Nov 2022 20:25:24 +0100
Message-ID: <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000004b65b05ee8cd64c"
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

--00000000000004b65b05ee8cd64c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 28 nov 2022, 18:04 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> With my distro maintainer hat I would rather QEMU ship neither the
> ROM source, nor the ROM binaries.
>

Annd since QEMU can finally cross compile its embedded firmware modules,
too, it is now easier for distros not to use any prebuilt binary.

However some firmware sources are only available from QEMU's submodules. So
either we distribute those submodules as separate tarballs, or distros
would need to use the bundled tarball as well.

Separately, I am not even sure what compiler is needed for the old
Macintosh ROMs...

Paolo


> Still the binaries are convenient for people doing their own QEMU
> builds from source.
>
> How about shipping two distinct options:
>
>   qemu-x.y.z.tar.xz          (QEMU source only)
>   qemu-bundled-x.y.z.tar.xz  (QEMU source + bundled ROM binaries + ROM
> sources)
>
> though I'm not sure how much of an impact that will have on the download
> traffic - depends what is causing the traffic.
>
> Another option is
>
>   qemu-x.y.z.tar.xz        (QEMU source only)
>   qemu-roms-x.y.z.tar.xz   (bundled ROM binaries + ROM sources)
>
> though this is slightly more inconvenient for users, and there's the
> risk they'll use new QEMU with old ROMs.
>
>
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

--00000000000004b65b05ee8cd64c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 28 nov 2022, 18:04 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">With my distro maintainer hat I=
 would rather QEMU ship neither the<br>
ROM source, nor the ROM binaries.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Annd since QEMU can finally cross compile =
its embedded firmware modules, too, it is now easier for distros not to use=
 any prebuilt binary.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ho=
wever some firmware sources are only available from QEMU&#39;s submodules. =
So either we distribute those submodules as separate tarballs, or distros w=
ould need to use the bundled tarball as well.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Separately, I am not even sure what compiler is neede=
d for the old Macintosh ROMs...<br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Still the binaries are convenient for people doing their own QEMU<br>
builds from source.<br>
<br>
How about shipping two distinct options:<br>
<br>
=C2=A0 qemu-x.y.z.tar.xz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (QEMU source onl=
y)<br>
=C2=A0 qemu-bundled-x.y.z.tar.xz=C2=A0 (QEMU source + bundled ROM binaries =
+ ROM sources)<br>
<br>
though I&#39;m not sure how much of an impact that will have on the downloa=
d<br>
traffic - depends what is causing the traffic.<br>
<br>
Another option is<br>
<br>
=C2=A0 qemu-x.y.z.tar.xz=C2=A0 =C2=A0 =C2=A0 =C2=A0 (QEMU source only)<br>
=C2=A0 qemu-roms-x.y.z.tar.xz=C2=A0 =C2=A0(bundled ROM binaries + ROM sourc=
es)<br>
<br>
though this is slightly more inconvenient for users, and there&#39;s the<br=
>
risk they&#39;ll use new QEMU with old ROMs.<br>
<br>
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

--00000000000004b65b05ee8cd64c--


