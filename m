Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB093649EA9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hwo-0003wG-Sk; Mon, 12 Dec 2022 07:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p4hwe-0003vu-UK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:30:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p4hwc-0001lc-SB
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670848204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETVRY8gLPmL7Zk6XrKutB7oeRWEyzONMpdjIrrMfA2o=;
 b=bfRfUbcMCGTBBEgc4rSIRP3pn1B10cl4NTWfb+WBNVWWLS8aYm6IOSGbNMeUOloJv/Pmw+
 gQlJCwZ66gsTJQdj71eBuwLPTMUymXDECXkk+LyeH+45juf44lBk6h/omalas0iLwS0i0H
 jArsoBGwOs34eH1QxqHh8djz2N76V+Y=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-qhKMFw-JMDGrR5Qb24U5Xg-1; Mon, 12 Dec 2022 07:30:02 -0500
X-MC-Unique: qhKMFw-JMDGrR5Qb24U5Xg-1
Received: by mail-ua1-f72.google.com with SMTP id
 t7-20020ab04ac7000000b004199dbe4e01so5226150uae.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ETVRY8gLPmL7Zk6XrKutB7oeRWEyzONMpdjIrrMfA2o=;
 b=NySqfTz8y1FrPxwed7Q8fVdUI5r22VlBzrP4c5tViFp601V+YA9WVpTPgguZPmDVP2
 cT6CL9599qCK9Qg0GN4BwOTadB0B1csSCVYTUNUQSzAmlBIvrdJgg+mm1oAqrYpKLok4
 WmKhyK5ztYMuFXURddR99D9081DhQ+qFw235SB9MdGprvYN/pdRXi+iy7VVq5chAhG+v
 wIrWW3xfV+yweH/hj80VQVTN5bFXKFPdEm7N4u7R0pwSS0AlqC4KZwH6YIAoZ/IW4CJ+
 xKwIn5VPXk6IQ69Loz9za+FORzTdmIJGIBEFJ9KkboWDCIyHDlyx+30TePwQj2cfJMGc
 AGAg==
X-Gm-Message-State: ANoB5pkvyV0Vnq/kGWsCI1iKgIbVlAhSVcvmoq2yK9rKzBYKdwAvBZax
 B0sI4+5mwbLlethH+y89WCyrlCgV5CdvxNGGVaKM6rIGF78kY2FqU6MQy+q0jYICn0+F5V6Nzng
 0/qA64HNDUxJIeDCRotInHZaezMKaBwM=
X-Received: by 2002:a05:6122:c94:b0:3b5:ee70:5cf6 with SMTP id
 ba20-20020a0561220c9400b003b5ee705cf6mr45316440vkb.20.1670848202007; 
 Mon, 12 Dec 2022 04:30:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4PXlChdf2p05dNZyrAzPXVP79O2aVn9iifKBI2IUt8gJEfNcK45UF85XOSrZ+DtTtka7lcF1aBnvWRSeJP3BA=
X-Received: by 2002:a05:6122:c94:b0:3b5:ee70:5cf6 with SMTP id
 ba20-20020a0561220c9400b003b5ee705cf6mr45316434vkb.20.1670848201720; Mon, 12
 Dec 2022 04:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
In-Reply-To: <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 12 Dec 2022 14:29:50 +0200
Message-ID: <CAPMcbCoEfeZW0YQRN1To6zdGEP4g4GV3PBS9EDGqs_dYFNTF4g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] qga: improve "syslog" domain logging
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, marcandre.lureau@gmail.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000899e2005efa0a93f"
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

--000000000000899e2005efa0a93f
Content-Type: text/plain; charset="UTF-8"

Currently, there is a code freeze in QEMU for release 7.2.
I will merge this after it https://wiki.qemu.org/Planning/7.2

Best Regards,
Konstantin Kostiuk.


On Mon, Dec 12, 2022 at 2:17 PM Andrey Drobyshev <
andrey.drobyshev@virtuozzo.com> wrote:

> On 11/29/22 19:38, Andrey Drobyshev wrote:
> > These patches extend QGA logging interface, primarily under Windows
> > guests.  They enable QGA to write to Windows event log, much like
> > syslog() on *nix.  In addition we get rid of hardcoded log level used by
> > ga_log().
> >
> > v2:
> > * Close event_log handle when doing cleanup_agent()
> > * Fix switch cases indentation as reported by scripts/checkpatch.pl
> >
> > Andrey Drobyshev (2):
> >   qga-win: add logging to Windows event log
> >   qga: map GLib log levels to system levels
> >
> >  configure                 |  3 +++
> >  qga/installer/qemu-ga.wxs |  5 ++++
> >  qga/main.c                | 50 +++++++++++++++++++++++++++++++++++----
> >  qga/meson.build           | 19 ++++++++++++++-
> >  qga/messages-win32.mc     |  9 +++++++
> >  5 files changed, 81 insertions(+), 5 deletions(-)
> >  create mode 100644 qga/messages-win32.mc
> >
>
> Could you please clarify the status of these patches?
>
>

--000000000000899e2005efa0a93f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Currently, there is a code freeze in QEMU for release=
 7.2.<br></div>I will merge this after it <a href=3D"https://wiki.qemu.org/=
Planning/7.2">https://wiki.qemu.org/Planning/7.2</a><div><br clear=3D"all">=
<div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kosti=
uk.</div></div></div></div><br></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 2:17 PM =
Andrey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev@virtuozzo.com">andr=
ey.drobyshev@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 11/29/22 19:38, Andrey Drobyshev wrote:<br>
&gt; These patches extend QGA logging interface, primarily under Windows<br=
>
&gt; guests.=C2=A0 They enable QGA to write to Windows event log, much like=
<br>
&gt; syslog() on *nix.=C2=A0 In addition we get rid of hardcoded log level =
used by<br>
&gt; ga_log().<br>
&gt; <br>
&gt; v2:<br>
&gt; * Close event_log handle when doing cleanup_agent()<br>
&gt; * Fix switch cases indentation as reported by scripts/<a href=3D"http:=
//checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; <br>
&gt; Andrey Drobyshev (2):<br>
&gt;=C2=A0 =C2=A0qga-win: add logging to Windows event log<br>
&gt;=C2=A0 =C2=A0qga: map GLib log levels to system levels<br>
&gt; <br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 qga/installer/qemu-ga.wxs |=C2=A0 5 ++++<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 50 +++++++++++++++++++++++++++++++++++----<br>
&gt;=C2=A0 qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++=
+++++++++++-<br>
&gt;=C2=A0 qga/<a href=3D"http://messages-win32.mc" rel=3D"noreferrer" targ=
et=3D"_blank">messages-win32.mc</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++<br=
>
&gt;=C2=A0 5 files changed, 81 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 qga/<a href=3D"http://messages-win32.mc" rel=
=3D"noreferrer" target=3D"_blank">messages-win32.mc</a><br>
&gt; <br>
<br>
Could you please clarify the status of these patches?<br>
<br>
</blockquote></div>

--000000000000899e2005efa0a93f--


