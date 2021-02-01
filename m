Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A746030B31C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 00:07:01 +0100 (CET)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6iHc-0004vC-P8
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 18:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6iFS-0004O1-Nm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6iFN-0006no-C0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvnMG6CADm48dG/hBh79DnWoayzEWeo3bA5fN8YsSoU=;
 b=Lup59yg/qwAM1ozECjy+VnpErtzT4WKSE1cctaPqVDAXJKtk78Mt4mvEtxLUOG6gBvFtYw
 P5yV0nsR5ALaKa4FnYxDT9FwI+Dee/wxv+GKEa4FsGMixmkzW3jPoyLxM6ZyrlCrjImgl3
 UXa7ohJ8s4ZbsaEkON7nuCL5IqrlanM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-hCK6pTVbOlOJTtXyz7n6DA-1; Mon, 01 Feb 2021 18:04:37 -0500
X-MC-Unique: hCK6pTVbOlOJTtXyz7n6DA-1
Received: by mail-pg1-f200.google.com with SMTP id l7so6374538pgj.4
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 15:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvnMG6CADm48dG/hBh79DnWoayzEWeo3bA5fN8YsSoU=;
 b=hzObeNknD0azWFmU4dgVBI6AmtEQVWvKpKxmkC3CSGLahSMuYAmuyuAjhCHsbHy0Eo
 ePpYnJbNzqKUQ9nZn4LY5s3EwK76np4Owme2oDNi6/lhbS3lQ5T5OMpzIkXrAMj6fjY3
 HA+zg+7t57ASamAaGGPYjvwBaNLLtNWCmlnpqZoqCrUXTayduo1BaXgJhzrC8nMi52CG
 eh5a621V9lNuD9IzpX3dEt4aOctbZigmfsyGv9KE1DVTIlvbLENgb1UJYRXl7nqTE/kg
 qikk0vUv8CSr1ySZJnu58AGr2I6Prhe51r8QJ+56lJli+totyYps8bAmnuvdD6wrph+i
 7d7A==
X-Gm-Message-State: AOAM533E3RwKG1O1hG4BbVLPWdWyfYANqZZlGV5fCcdcrxx49hBdRqkq
 BfwDwKWbww5+JcpthVXyjovyvQZn/wa8qvXzx9Q5RovavQfkxcV+/pJ4cKtIXLd3C1ALOckoBw+
 +V97fgjgnli7Au+4syKZKx6cqdrVTJOc=
X-Received: by 2002:a17:90a:294e:: with SMTP id
 x14mr1146756pjf.6.1612220676277; 
 Mon, 01 Feb 2021 15:04:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWcHA0Nun1JrApBEElCalHtTh5T+FYhrBDaEJwrgrg6AskHE4PZTTnRQci4Q9wQff9eo8iTHlo1VgExtHtjGc=
X-Received: by 2002:a17:90a:294e:: with SMTP id
 x14mr1146737pjf.6.1612220675972; 
 Mon, 01 Feb 2021 15:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20210201211456.1133364-1-wainersm@redhat.com>
In-Reply-To: <20210201211456.1133364-1-wainersm@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Feb 2021 00:04:23 +0100
Message-ID: <CABgObfanXqg9rd1OnumUnSCm0n76mDbP9kNzp8ih0+SJ4jDXgA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Allow to build virtiofsd without the entire tools
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b11c6005ba4e603c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: misono.tomohiro@jp.fujitsu.com, qemu-devel <qemu-devel@nongnu.org>,
 stefanha@redhat.com, David Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b11c6005ba4e603c
Content-Type: text/plain; charset="UTF-8"

Il lun 1 feb 2021, 22:15 Wainer dos Santos Moschetta <wainersm@redhat.com>
ha scritto:

> Not too long ago (QEMU 5.0) it was possible to configure with
> --disable-tools
> and still have virtiofsd built. With the recent port of the build system to
> Meson, it is now built together with the tools though.
>
> The Kata Containers [1] project build QEMU with --disable-tools to
> decrease the
> attack surface


---enable-tools only adds separate executables, therefore it can't add to
the attack surface of the emulators. So this is misleading.

That said, it does make sense to let --enable-virtiofsd override
--disable-tools, and the same in the other direction too.

Paolo

Side note: in a private chat with Stefan Hajnoczi he come up with the idea
> that perhaps --disable-tools could be like --without-default-features where
> one can add back on feature-by-feature basis. This is outside the scope of
> this
> series but I thought in sharing because IMHO it is deserves a discussion.


> [1] https://katacontainers.io
>
> Wainer dos Santos Moschetta (1):
>   virtiofsd: Allow to build it without the tools
>
>  tools/meson.build | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> --
> 2.29.2
>
>

--000000000000b11c6005ba4e603c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 1 feb 2021, 22:15 Wainer dos Santos Moschetta &=
lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@redhat.com</a>&gt; ha sc=
ritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Not too long ago (QEMU 5.0) =
it was possible to configure with --disable-tools<br>
and still have virtiofsd built. With the recent port of the build system to=
<br>
Meson, it is now built together with the tools though.<br>
<br>
The Kata Containers [1] project build QEMU with --disable-tools to decrease=
 the<br>
attack surface</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">---enable-tools only =
adds separate executables, therefore it can&#39;t add to the attack surface=
 of the emulators. So this is misleading.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">That said, it does make sense to let --enable-virtiofsd o=
verride --disable-tools, and the same in the other direction too.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Side note: in a private chat with Stefan Hajnoczi he come up with th=
e idea<br>
that perhaps --disable-tools could be like --without-default-features where=
<br>
one can add back on feature-by-feature basis. This is outside the scope of =
this<br>
series but I thought in sharing because IMHO it is deserves a discussion.</=
blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
[1] <a href=3D"https://katacontainers.io" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://katacontainers.io</a><br>
<br>
Wainer dos Santos Moschetta (1):<br>
=C2=A0 virtiofsd: Allow to build it without the tools<br>
<br>
=C2=A0tools/meson.build | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div></div>

--000000000000b11c6005ba4e603c--


