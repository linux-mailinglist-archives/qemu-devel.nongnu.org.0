Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC040645592
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 09:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2pyG-0007VA-Ur; Wed, 07 Dec 2022 03:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p2pxv-0007TA-SF
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p2pxs-0001ka-BE
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670402378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oYJGQ1ooYxKg7+Ap3mFfWc0tAjj2Gwz62DUS5M9V2Yg=;
 b=CSnbU2dlIb4PjOTS0vkJupKOFMlMQXEeBH/RIziaPDrwc9sMx/L3GvqMfc2LunCc6bk23a
 HKCxonvZGZJ1rbsqcNxG+nyE0NluhDGCEOaFINnSk1nBq9CpxowGt+0U57oX6jA2Wzb0uK
 Obu4pxP0Y8WqVHwwwNgmMlkyd1FX8QI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-rmjBnpQCNTK4psxPhVMB6Q-1; Wed, 07 Dec 2022 03:39:36 -0500
X-MC-Unique: rmjBnpQCNTK4psxPhVMB6Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 n14-20020a9f314e000000b004114b0c125fso8415134uab.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 00:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oYJGQ1ooYxKg7+Ap3mFfWc0tAjj2Gwz62DUS5M9V2Yg=;
 b=hG2WK2skBZievw4OhAKULxkgBCXmWdI6Hiarpn5jZkgZcYl2VDQgjtqRIXT36QdD+Z
 YZ5sp/kd/lrwVVl9+zX3n199k1gxKSSTDG8s9Tjrh9CCHQcDKd1w91lYC2W0PcbwRwID
 +vMY4Y69Yb8sIKgR1tHiTIn86oT9LMwHbCFw+4hd40cdgCzxiaeeLQBuGDTWyc6gOr1p
 rYkeEvTFw0vfe6zw4fgc1v5iBDbPhzKxQvNZ/E+WKOWLWRq8QaldBfrKze8X8B8fMGYM
 Fg+HgVC9FAjZ+hG9H0xGf6xY295BO7DymOOljUw1JRaOf2HBGwHqg5tHxTsnoNqtCjyD
 L5aQ==
X-Gm-Message-State: ANoB5pmKAPlUdDL3gwTGw3fbDFdsBgcau3iTbK/YiBCG0i6BZcN8yfIn
 Hk4h+7RRHIw3clXhOOicX9LOqCqKsxmWulwp2n3xuN6T1unINeqkEo+5Li9sX0LO+yQGb5XkpPs
 y46qvAOwEqYl6IL5YBZDjUGgnFVBxC84=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr40066577uao.75.1670402375856; 
 Wed, 07 Dec 2022 00:39:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SjuOnLxjgrAtfQBz4OucvLakKd6dt6pdXbzVbOLyNLMnEH6Pzo7oNzWS5TMSPoF1grKJLiykm72t3t7uHgl0=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr40066571uao.75.1670402375658; Wed, 07
 Dec 2022 00:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
 <871qpjf86a.fsf@pond.sub.org>
 <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
 <4ce0329b-0868-f6b5-63f2-62ae212c76a7@redhat.com>
 <718dbdad-4920-d2c8-b3a6-c0f83fd818f1@cestc.cn>
In-Reply-To: <718dbdad-4920-d2c8-b3a6-c0f83fd818f1@cestc.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 7 Dec 2022 09:39:24 +0100
Message-ID: <CABgObfb9kL2WCHUNQ4KVRAQWZPGBWmKGyaodX5yMChS+9x9PmA@mail.gmail.com>
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
To: Zhipeng Lu <luzhipeng@cestc.cn>
Cc: Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?RGFuaWVsIFAuQmVycmFuZ8Op?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>
Content-Type: multipart/alternative; boundary="0000000000003bc4a705ef38dc1d"
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

--0000000000003bc4a705ef38dc1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It should be like this:

-device usb-bot,id=3Dbot0
-device scsi-{cd,hd},bus=3Dbot0.0,drive=3Ddrive0

Libvirt has the code to generate the options for SCSI controllers, but
usb-bot only allows one disk attached to it so it's easier to make it a
<drive> element.

Paolo

Il sab 3 dic 2022, 13:52 Zhipeng Lu <luzhipeng@cestc.cn> ha scritto:

> Could you give the detail qemu cmdline about usb-bot?
>
> =E5=9C=A8 2022/12/2 17:40, Paolo Bonzini =E5=86=99=E9=81=93:
> > On 12/2/22 03:26, Zhipeng Lu wrote:
> >> NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> >> sda             8:0    0  100M  1 disk
> >> vda           252:0    0   10G  0 disk
> >> =E2=94=9C=E2=94=80vda1        252:1    0    1G  0 part /boot
> >> =E2=94=94=E2=94=80vda2        252:2    0    9G  0 part
> >>    =E2=94=9C=E2=94=80rhel-root 253:0    0    8G  0 lvm  /
> >>    =E2=94=94=E2=94=80rhel-swap 253:1    0    1G  0 lvm  [SWAP]
> >> lshw -short|grep cdrom -i
> >> No cdrom.
> >>
> >> My patch is to solve this problem, usb cdrom emulated as cdrom.
> >
> > This is a libvirt bug, it should use usb-bot instead of usb-storage
> > together with -blockdev.  Then it can add a scsi-cd device below usb-bo=
t.
> >
> > Paolo
> >
> >>
> >>
> >> =E5=9C=A8 2022/12/1 23:35, Markus Armbruster =E5=86=99=E9=81=93:
> >>> luzhipeng <luzhipeng@cestc.cn> writes:
> >>>
> >>>> From: zhipeng Lu <luzhipeng@cestc.cn>
> >>>>
> >>>> The drive interface supports media=3Dcdrom so that the usb cdrom
> >>>> can be emulated as cdrom in qemu, but libvirt deprived the drive
> >>>> interface, so media=3Dcdrom is added to the blockdev interface to
> >>>> support usb cdrom emulated as cdrom
> >>>>
> >>>> Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn>
> >>>
> >>> What problem are you trying to solve?
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >
> >
> >
>
>
>

--0000000000003bc4a705ef38dc1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>It should be like this:<div dir=3D"auto"><br></div><=
div dir=3D"auto">-device usb-bot,id=3Dbot0</div><div dir=3D"auto">-device s=
csi-{cd,hd},bus=3Dbot0.0,drive=3Ddrive0</div><div dir=3D"auto"><br></div>Li=
bvirt has the code to generate the options for SCSI controllers, but usb-bo=
t only allows one disk attached to it so it&#39;s easier to make it a &lt;d=
rive&gt; element.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo<=
br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">Il sab 3 dic 2022, 13:52 Zhipeng Lu &lt;<a href=3D"mailto:luzhipe=
ng@cestc.cn">luzhipeng@cestc.cn</a>&gt; ha scritto:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Could you give the detail qemu cmdline about usb-bot?<br>
<br>
=E5=9C=A8 2022/12/2 17:40, Paolo Bonzini =E5=86=99=E9=81=93:<br>
&gt; On 12/2/22 03:26, Zhipeng Lu wrote:<br>
&gt;&gt; NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAJ:MIN=
 RM=C2=A0 SIZE RO TYPE MOUNTPOINT<br>
&gt;&gt; sda=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 8:0=C2=A0=C2=A0=C2=A0 0=C2=A0 100M=C2=A0 1 disk<br>
&gt;&gt; vda=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25=
2:0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 10G=C2=A0 0 disk<br>
&gt;&gt; =E2=94=9C=E2=94=80vda1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=
52:1=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 1G=C2=A0 0 part /boot<br>
&gt;&gt; =E2=94=94=E2=94=80vda2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=
52:2=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 9G=C2=A0 0 part<br>
&gt;&gt; =C2=A0=C2=A0 =E2=94=9C=E2=94=80rhel-root 253:0=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 8G=C2=A0 0 lvm=C2=A0 /<br>
&gt;&gt; =C2=A0=C2=A0 =E2=94=94=E2=94=80rhel-swap 253:1=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 1G=C2=A0 0 lvm=C2=A0 [SWAP]<br>
&gt;&gt; lshw -short|grep cdrom -i<br>
&gt;&gt; No cdrom.<br>
&gt;&gt;<br>
&gt;&gt; My patch is to solve this problem, usb cdrom emulated as cdrom.<br=
>
&gt; <br>
&gt; This is a libvirt bug, it should use usb-bot instead of usb-storage <b=
r>
&gt; together with -blockdev.=C2=A0 Then it can add a scsi-cd device below =
usb-bot.<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =E5=9C=A8 2022/12/1 23:35, Markus Armbruster =E5=86=99=E9=81=93:<b=
r>
&gt;&gt;&gt; luzhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" target=3D"=
_blank" rel=3D"noreferrer">luzhipeng@cestc.cn</a>&gt; writes:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; From: zhipeng Lu &lt;<a href=3D"mailto:luzhipeng@cestc.cn"=
 target=3D"_blank" rel=3D"noreferrer">luzhipeng@cestc.cn</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The drive interface supports media=3Dcdrom so that the usb=
 cdrom<br>
&gt;&gt;&gt;&gt; can be emulated as cdrom in qemu, but libvirt deprived the=
 drive<br>
&gt;&gt;&gt;&gt; interface, so media=3Dcdrom is added to the blockdev inter=
face to<br>
&gt;&gt;&gt;&gt; support usb cdrom emulated as cdrom<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: zhipeng Lu &lt;<a href=3D"mailto:luzhipeng@=
cestc.cn" target=3D"_blank" rel=3D"noreferrer">luzhipeng@cestc.cn</a>&gt;<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What problem are you trying to solve?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--0000000000003bc4a705ef38dc1d--


