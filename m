Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F202DBC5C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 08:54:14 +0100 (CET)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRdV-0002rz-51
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 02:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpRch-0002Ix-QE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpRcf-00078f-TL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608105201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nssnUtsUnelwrKzCuxjzYw8ohTveI/9IjNC20NO4gM=;
 b=J/sXu0EjLgzB2dNwzS/k3sTxQoUtYs4px23oNR/5/DY1QFk4waxyZdaZ/AMpRSGa1C6U1Q
 5Dew0dhWc1s28UWdG762YX1aQXgMbS/ILhO5X8qIJ0HujRBkTYlbD+PAfXvlg3MIy4ZF24
 ojJpE5ub/r/l5d3lUty9KD9Le4LOonk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-wNXj7wYmOmKSYRddH-nEww-1; Wed, 16 Dec 2020 02:53:18 -0500
X-MC-Unique: wNXj7wYmOmKSYRddH-nEww-1
Received: by mail-il1-f200.google.com with SMTP id s23so18744026ilk.14
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 23:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nssnUtsUnelwrKzCuxjzYw8ohTveI/9IjNC20NO4gM=;
 b=p9bg13V0QJ0uO6Eyqw0NvcbbEl0GwEMqw5R1IaSFcHBETkMN9hWlaLJHrIw40d110U
 m/JHVrrPJR7ETLiSQjKlZ9KrM1hBB+olaRPurf1IWCxBRWBUdRB9K2OC5B4DAEaAamXJ
 lya/+WR53ne9Oe9fwXyZQTz7EYALKQDh5JuMREVV/G8j6qbHTTZ7iFgwjE5+xLHjs8Ib
 jwOI2t5EVdLYOKbU4xLNkLeLwfQ6OoL59lG07VQM4vCPcsDGitJ+RNtyPgDkp3z/aG2H
 SHU4JGQjkVBsWc3ie1ZCKAqGF553QX7+CjOplbAV7vSzYGLMjaW1BllQ6EnJtOiD6yYk
 u5Qg==
X-Gm-Message-State: AOAM532uwJlImNgquoVQoH4SAMNxoVepJhG2tYhARoilRssKV0EsodBc
 ewF5ySFLEegwF7fqPdttGDhMbon47CY+zoXFXVJ6XRUWISZHaEU7Kap5VoGgfp4JQV/ayhzc0V2
 /9yCS5/mktFaCuKqOOZdvydXjQ/ckZSE=
X-Received: by 2002:a5d:8405:: with SMTP id i5mr41315553ion.164.1608105198113; 
 Tue, 15 Dec 2020 23:53:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKPybHvJMKq0USdjb7OqI97JafRt/PgoxtTuS+Z+8DJDDMGfZTHzBAd8grg0RKpTZCu2VPVBx7N3w6s5DqkuQ=
X-Received: by 2002:a5d:8405:: with SMTP id i5mr41315540ion.164.1608105197834; 
 Tue, 15 Dec 2020 23:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-3-ehabkost@redhat.com>
In-Reply-To: <20201215224133.3545901-3-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Dec 2020 11:53:06 +0400
Message-ID: <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] qom: Assert that objects being destroyed have no
 parent
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000014283805b6902b03"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000014283805b6902b03
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, Dec 16, 2020 at 2:41 AM Eduardo Habkost <ehabkost@redhat.com> wrote:

> QOM reference counting bugs are often hard to detect, but there's
> one kind of bug that's easier: if we are freeing an object but is
> still attached to a parent, it means the reference count is wrong
> (because the parent always hold a reference to their children).
>
> Add an assertion to make sure we detect those cases.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

On the principle, I fully agree. But the risk is high to introduce
regression if objects are manipulated in strange ways.

I remember I wanted object_unref() to automatically remove itself from the
parent when the last ref is dropped. I think there were similar concerns.

Maybe with --enable-qom-debug ? (removing the -cast)

---
>  qom/object.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qom/object.c b/qom/object.c
> index f2ae6e6b2a..5cfed6d7c6 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -685,6 +685,7 @@ static void object_finalize(void *data)
>      object_deinit(obj, ti);
>
>      g_assert(obj->ref == 0);
> +    g_assert(obj->parent == NULL);
>      if (obj->free) {
>          obj->free(obj);
>      }
> --
> 2.28.0
>
>

--00000000000014283805b6902b03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 2:41 AM Eduardo Habko=
st &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">QOM refere=
nce counting bugs are often hard to detect, but there&#39;s<br>
one kind of bug that&#39;s easier: if we are freeing an object but is<br>
still attached to a parent, it means the reference count is wrong<br>
(because the parent always hold a reference to their children).<br>
<br>
Add an assertion to make sure we detect those cases.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>On the principle, I fully agree. But the risk is high to introduce re=
gression if objects are manipulated in strange ways.<br></div></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I remember I wante=
d object_unref() to automatically remove itself from the parent when the la=
st ref is dropped. I think there were similar concerns.<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Maybe with --enable-q=
om-debug ? (removing the -cast)<br></div><div class=3D"gmail_quote"><br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qom/object.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/qom/object.c b/qom/object.c<br>
index f2ae6e6b2a..5cfed6d7c6 100644<br>
--- a/qom/object.c<br>
+++ b/qom/object.c<br>
@@ -685,6 +685,7 @@ static void object_finalize(void *data)<br>
=C2=A0 =C2=A0 =C2=A0object_deinit(obj, ti);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(obj-&gt;ref =3D=3D 0);<br>
+=C2=A0 =C2=A0 g_assert(obj-&gt;parent =3D=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (obj-&gt;free) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj-&gt;free(obj);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div></div>

--00000000000014283805b6902b03--


