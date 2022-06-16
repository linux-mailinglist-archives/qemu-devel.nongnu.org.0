Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2B54EC91
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 23:29:19 +0200 (CEST)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1x3G-0007CX-BJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 17:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1o1x26-0006Bo-EK; Thu, 16 Jun 2022 17:28:06 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1o1x24-0002sF-1p; Thu, 16 Jun 2022 17:28:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id m20so5078504ejj.10;
 Thu, 16 Jun 2022 14:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOPPUXqeLOlHoCSIGcznCkYf6Ps7sFv2iPT3tpWja8s=;
 b=fXCr2CBP+Aruh/NcCdWvsuXJUH5VgKDUOzIKQtRp0tQhZCdLEl1HPQOppj24eWHsav
 yxGniq5XICKoDAWBMiTtiJj1c2jhGmBRX1AjfL6uxRTz+ClVfEz61q2CK4s0WPOo/5eM
 OXdzm1OdW/26QRCYFxgK2T3S1C+H7Sv0Ef+yqCJUD+eJvXuJ1DjgPWKiEmRxjVGJhyXP
 rvHspEhlTSDuRGoZtP0KhHhELQ2CX24tCZY8ZuB8/mrDrfr4w37p3h7JtjjgCXGG2K/q
 IUhDGk5DXCNA+0hv+1F3x8xANw3oWmn0bpyi0arx8pKUO+worDnQYlx59t/uCAvU8no2
 hghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOPPUXqeLOlHoCSIGcznCkYf6Ps7sFv2iPT3tpWja8s=;
 b=oSBTqi46D3EsBm7+DgpIjSJUkYSAl5FFpXF6priqX7SZhA8YgWb0I5aMge4LaaI+SU
 YcFZoIaF6VwP51+pt3Tin+tMd0g4WPN4VXKV3C27upaD2CHHE0SZ521SDk3yW+7stqtd
 MC1NAIxU17kjAZ1hH8P+w7bDHSW7D2Zdjo5taIu8s/QCkDYhjdd7TBsqPoGEmsEd9sH2
 VuEhlAEpBS8OBUdlBEfVXNUIIee1DRKUiB+VLquFNWLwVjlJv17aJj98dOCnH3MFRQyi
 XPpY7rRigPFfNwH0uyQxXuiYOzmBfDZT6Us47kevjhctCNPHzwxRzzReo4prS5PhtnwV
 ja0w==
X-Gm-Message-State: AJIora8TJvjoInxliiE4J1d8KMaJcjSbVyE4HebSGqBtBADPQZj3vCCS
 1w2gOVidB1LOEFg3kmZZhgfOXasSjFhelELgOjQ=
X-Google-Smtp-Source: AGRyM1ucUcLcv85CFSt/jb1wbYNjMR1jYX4BXG95WaQNLiaWe+p33EbxrRMjKXW+Qz2ClslXrrh4lrfPyRRwsUAwbM0=
X-Received: by 2002:a17:907:6289:b0:6e0:eb0c:8ee7 with SMTP id
 nd9-20020a170907628900b006e0eb0c8ee7mr5984646ejc.245.1655414879091; Thu, 16
 Jun 2022 14:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220609164712.1539045-1-stefanha@redhat.com>
 <Yqi3gMu8pHuhqxXz@stefanha-x1.localdomain>
In-Reply-To: <Yqi3gMu8pHuhqxXz@stefanha-x1.localdomain>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Thu, 16 Jun 2022 17:27:48 -0400
Message-ID: <CALm7yL0XrxsM=2RWpKCEGF3ayiEYieo93NLq6iznJcw53dgGqA@mail.gmail.com>
Subject: Re: [PATCH 0/2] linux-aio: fix unbalanced plugged counter in
 laio_io_unplug()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-stable@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d2ffa505e1974f04"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=mark.mielke@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--000000000000d2ffa505e1974f04
Content-Type: text/plain; charset="UTF-8"

Thank you for finding this and fixing it. This issue has been giving us
grief for months, and this patch appears to resolve the problem.

In our case, it seemed to have much greater severity with the RHEL / CentOS
7.x Linux 3.10 kernel when tied to SolidFire iSCSI based storage. This
caused it to escape notice in our original soak period, and is likely a
contributor to why others didn't encounter the problem. However, I believe
this looks like a serious problem that could affect any guest machine that
does a large amount of I/O. I believe the SolidFire connection may be that
the I/O can queue up more easily than the local NVMe storage we also use,
and there could be something related to the SolidFire QoS re-balancing
where the iSCSI connection may be re-negotiated from time to time. So, I
think this is more like "happens in some environments more than others",
and unfortunately it happened a lot in one of our environments. :-(


On Tue, Jun 14, 2022 at 12:36 PM Stefan Hajnoczi <stefanha@redhat.com>
wrote:

> On Thu, Jun 09, 2022 at 05:47:10PM +0100, Stefan Hajnoczi wrote:
> > An unlucky I/O pattern can result in stalled Linux AIO requests when the
> > plugged counter becomes unbalanced. See Patch 1 for details.
> >
> > Patch 2 adds a comment to explain why the laio_io_unplug() even checks
> max
> > batch in the first place.
> >
> > Stefan Hajnoczi (2):
> >   linux-aio: fix unbalanced plugged counter in laio_io_unplug()
> >   linux-aio: explain why max batch is checked in laio_io_unplug()
> >
> >  block/linux-aio.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > --
> > 2.36.1
> >
>
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
>
> Stefan
>


-- 
Mark Mielke <mark.mielke@gmail.com>

--000000000000d2ffa505e1974f04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for finding this and fixing it. This issue has b=
een giving us grief for months, and this patch appears to resolve the probl=
em.<div><br></div><div>In our case, it seemed to have much greater severity=
 with the RHEL / CentOS 7.x Linux 3.10 kernel when tied to SolidFire iSCSI =
based storage. This caused it to escape notice in our original soak period,=
 and is likely a contributor to why others didn&#39;t encounter the problem=
. However, I believe this looks like a serious problem that could affect an=
y guest machine that does a large amount of I/O. I believe the SolidFire co=
nnection may be that the I/O can queue up more easily than the local NVMe s=
torage we also use, and there could be something related to the SolidFire Q=
oS re-balancing where the iSCSI connection may be re-negotiated from time t=
o time. So, I think this is more like &quot;happens in some environments mo=
re than others&quot;, and unfortunately it happened a lot in one of our env=
ironments. :-(</div><div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 14, 2022 at 12:36 PM Stefan =
Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, Jun 09, 2022 at 05:47:10PM +0100, Stefan Hajnoczi wrote:<br>
&gt; An unlucky I/O pattern can result in stalled Linux AIO requests when t=
he<br>
&gt; plugged counter becomes unbalanced. See Patch 1 for details.<br>
&gt; <br>
&gt; Patch 2 adds a comment to explain why the laio_io_unplug() even checks=
 max<br>
&gt; batch in the first place.<br>
&gt; <br>
&gt; Stefan Hajnoczi (2):<br>
&gt;=C2=A0 =C2=A0linux-aio: fix unbalanced plugged counter in laio_io_unplu=
g()<br>
&gt;=C2=A0 =C2=A0linux-aio: explain why max batch is checked in laio_io_unp=
lug()<br>
&gt; <br>
&gt;=C2=A0 block/linux-aio.c | 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.36.1<br>
&gt; <br>
<br>
Thanks, applied to my block tree:<br>
<a href=3D"https://gitlab.com/stefanha/qemu/commits/block" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.com/stefanha/qemu/commits/block</a><br>
<br>
Stefan<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gm=
ail.com" target=3D"_blank">mark.mielke@gmail.com</a>&gt;<br><br></div>

--000000000000d2ffa505e1974f04--

