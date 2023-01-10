Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16C663DCB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:16:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKr-0002YX-Qc; Tue, 10 Jan 2023 04:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFBKn-0002Xq-V0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFBKm-0002vE-Bt
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4bcPq2l2o5sPGn+LTSip0sajp7edLCe337OVXFkyTZo=;
 b=XGMTCQ8RcM5knANWSrX01T3cjbhOl1S0Mg9KMAuIzqUt6aLocQ9g3UjCVhbDMWmTD14QLo
 Y2IC0DPv5rK2ORC/INwvMdloPqRYYe2jeyoMso6uaJvw34qAjemgioH9tU3YgX+pLPW9Dz
 lKfvw8zEo2WkYlInXPkR/or7MSJCwWE=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-bhqeXFthPIOGmNlyKOWEwA-1; Tue, 10 Jan 2023 04:54:18 -0500
X-MC-Unique: bhqeXFthPIOGmNlyKOWEwA-1
Received: by mail-vk1-f199.google.com with SMTP id
 u187-20020a1fabc4000000b003ca3e899f8fso3607706vke.22
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 01:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4bcPq2l2o5sPGn+LTSip0sajp7edLCe337OVXFkyTZo=;
 b=7qEaGXXzirSE4CMfiHlrdm9O8nHFbYA+rAt/+dpBoR85AMjexzhIjRVN/ghH84iSQz
 x9A3lBoo1uiD7KoH/hscUcXItttM09o2lKKot+TVqoguUqlGdJ4pXOMnBe556SxC5Ntn
 a59kM7707PGCtNpnAFZTuAcYgQ1f6V4YJ0pXTNCV+3LTmIHQeN41ep9uaeIfhiIdggZu
 4JbqTmWBFAjnTabPBY24lM7Kx3LJeQH52efHxoKG9AWXhtwyxfQ0ZYkdootEvBjW+Xu5
 Y/EikuJ81UFpT3fGNZLD3zbPU5mwt2irn0D9LrMFWMzN9xWjS5WFj0J9U5JKjHyqv/57
 gDnw==
X-Gm-Message-State: AFqh2kpQTpWsudLwRTzc/0q2DSQjk1JEXJ4am4d4knWQU56du/ywAeIt
 pD1zodcsPkCQU42CNtG7kv7cFyoZf7+NGAKM2Ny6hOuGHSphGpXaZ85PHcWZOqCHDBTIADSSdbH
 xzWbswMl+i2oJnNqYmDqzcylYoTv8PDE=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr9314328vsk.42.1673344457776; 
 Tue, 10 Jan 2023 01:54:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdbcYvaDD0JZn5nPTgIXnSXAuBAFpZJgApJS5ok2kufe0+nPFni5DZW0mqEfetEwMDlMELpCM1WJ71LZnCodU=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr9314320vsk.42.1673344457422; Tue, 10 Jan
 2023 01:54:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671741278.git.marcel@holtmann.org>
 <20230104205302-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230104205302-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 10 Jan 2023 10:54:06 +0100
Message-ID: <CABgObfZM1uKmFTuaCGas+BDC2s9R+NtNyfjBMbm10vaCkD868Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,
 libvduse
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Xie Yongji <xieyongji@bytedance.com>
Content-Type: multipart/alternative; boundary="000000000000f8cc4705f1e5dd7d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--000000000000f8cc4705f1e5dd7d
Content-Type: text/plain; charset="UTF-8"

Il gio 5 gen 2023, 02:58 Michael S. Tsirkin <mst@redhat.com> ha scritto:

> Paolo I understand you are merging this?
>

It would be fine either way; when I find issues in a series I tend to queue
it just in case the other maintainer prefers to leave further handling to
me. In this case it caught my eye due to the meson.build implications.

Anyhow I have already passed it through CI (a bit slow due to the holidays)
and will send the PR today or tomorrow.

Paolo


> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> >  subprojects/libvduse/libvduse.c           |  9 ++++--
> >  subprojects/libvduse/meson.build          |  8 ++++-
> >  subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----------
> >  subprojects/libvhost-user/meson.build     |  8 ++++-
> >  4 files changed, 42 insertions(+), 19 deletions(-)
> >
> > --
> > 2.38.1
> >
> >
> >
>
>

--000000000000f8cc4705f1e5dd7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 5 gen 2023, 02:58 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Paolo I understand you are merging this?<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It woul=
d be fine either way; when I find issues in a series I tend to queue it jus=
t in case the other maintainer prefers to leave further handling to me. In =
this case it caught my eye due to the meson.build implications.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Anyhow I have already passed it thr=
ough CI (a bit slow due to the holidays) and will send the PR today or tomo=
rrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
<br>
&gt;=C2=A0 subprojects/libvduse/libvduse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 9 ++++--<br>
&gt;=C2=A0 subprojects/libvduse/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 ++++-<br>
&gt;=C2=A0 subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----=
------<br>
&gt;=C2=A0 subprojects/libvhost-user/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 8 ++++-<br>
&gt;=C2=A0 4 files changed, 42 insertions(+), 19 deletions(-)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.38.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000f8cc4705f1e5dd7d--


