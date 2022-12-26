Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB86562FF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 15:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9o6l-0000XT-8B; Mon, 26 Dec 2022 09:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o6V-0000OU-Qr
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o6S-0008FS-9u
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672063519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDr0xr7eIEB2Ro9+wkKivFMJ9VRC20JYPtL7wm03Drw=;
 b=Qs83aJ+Y8PtA7tv1SHfv3ikj782PXo26yczEUUmu0aCD9c7Mb1C4BLyDEim7vVZUq8QzvC
 0Cq25YiIYFdL4Z+Zh8LPyd9rCtQct/MaNTrIpIIVQUKruUaH3WDQZRSGoz/1QAnrZNbpYS
 5YffStQZ6E/k1Fy2F3N3oC/qGrvg4L0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-0izsLS02N1-xJJW7Y-RYHQ-1; Mon, 26 Dec 2022 09:05:18 -0500
X-MC-Unique: 0izsLS02N1-xJJW7Y-RYHQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 t30-20020a05610210de00b003c59346f348so1531266vsr.16
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 06:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDr0xr7eIEB2Ro9+wkKivFMJ9VRC20JYPtL7wm03Drw=;
 b=6OFsrGU0UauYHWHXlPMtv2OgAHswF5/QO9SNu7esCuKAYKFWwrrMuRPYo2/QjmKB/t
 Fw6taIh6LDhymctKSEDwB/y6Bob4j/tjZAiIZrH5OXSOxchHbLywunOMfGPwD6kfNZhH
 +bsY5Y0KL/ABFYyAXeq35WH8rxD7J17o1PgloQ0bHbpZqY+LoKfmO83XB0QERrGgfmns
 QWlUdtwVUPpNUiKWgMdI6RXNgyQmccDn8mdVmMTjzQchHZ+TI4W92XSc8ib4LHPDGjxN
 O37y6nxQHgwm+XNyPuALlXobbUUk/OZ6ccG57gFQ6XqnN2WxUEuNGN7ek7wKhxAhPSDM
 Fo/w==
X-Gm-Message-State: AFqh2kpiz/LDAe/khoXpbWpyh5hn1vKs6D+DtgKN3LAYN9GzC3dgV0nc
 JmjR0TIAf1kN8Er/gqpt/eBttjzZecMx5wftFLmELFVpLmZ9TgBipOqSDio6NDzdr9kw8XEHzYd
 F2/at6GmXXWOb6KZeBX4ynqx3W8e0z7c=
X-Received: by 2002:a05:6102:5792:b0:3b5:3f84:287 with SMTP id
 dh18-20020a056102579200b003b53f840287mr2272093vsb.66.1672063517173; 
 Mon, 26 Dec 2022 06:05:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3mnrJQtrVBLV09JH6RZeYOHypxVcGthD2IIvWR/mxOOh4h3Ps9QFkhn/sy/jLPl+JLqb6nkH40XVQzFzbryA=
X-Received: by 2002:a05:6102:5792:b0:3b5:3f84:287 with SMTP id
 dh18-20020a056102579200b003b53f840287mr2272090vsb.66.1672063516982; Mon, 26
 Dec 2022 06:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 26 Dec 2022 16:05:06 +0200
Message-ID: <CAPMcbCqpi9zgNHi9n2_XTdCeaO7nMBG_DguMdURQL1Y7FCGCmg@mail.gmail.com>
Subject: Re: [PATCH 0/2] qga: Add ZFS TRIM support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com
Content-Type: multipart/alternative; boundary="000000000000f8d16605f0bb9f23"
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

--000000000000f8d16605f0bb9f23
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

Can you please rebase your changes to the current master?
I failed to apply these patches.

Best Regards,
Konstantin Kostiuk.


On Tue, Nov 15, 2022 at 8:46 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Move Linux-specific FS TRIM code to commands-linux.c and add support of
> ZFS TRIM for FreeBSD.
>
> Alexander Ivanov (2):
>   qga: Move FS TRIM code to commands-linux.c
>   qga: Add ZFS TRIM support for FreeBSD
>
>  qga/commands-bsd.c    | 109 ++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-common.h |   1 +
>  qga/commands-linux.c  |  73 ++++++++++++++++++++++++++++
>  qga/commands-posix.c  |  72 ----------------------------
>  4 files changed, 183 insertions(+), 72 deletions(-)
>
> --
> 2.34.1
>
>

--000000000000f8d16605f0bb9f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><div><br></div><div>Can you please=
 rebase your changes to the current master? <br></div><div>I failed to appl=
y these patches.<br></div><div><br></div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Nov 15, 2022 at 8:46 PM Alexander Ivanov &lt;<a href=3D"mailto=
:alexander.ivanov@virtuozzo.com">alexander.ivanov@virtuozzo.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Move Linux-s=
pecific FS TRIM code to commands-linux.c and add support of<br>
ZFS TRIM for FreeBSD.<br>
<br>
Alexander Ivanov (2):<br>
=C2=A0 qga: Move FS TRIM code to commands-linux.c<br>
=C2=A0 qga: Add ZFS TRIM support for FreeBSD<br>
<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 | 109 +++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qga/commands-common.h |=C2=A0 =C2=A01 +<br>
=C2=A0qga/commands-linux.c=C2=A0 |=C2=A0 73 ++++++++++++++++++++++++++++<br=
>
=C2=A0qga/commands-posix.c=C2=A0 |=C2=A0 72 ----------------------------<br=
>
=C2=A04 files changed, 183 insertions(+), 72 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000f8d16605f0bb9f23--


