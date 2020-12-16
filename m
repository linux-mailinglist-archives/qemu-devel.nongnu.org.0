Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD472DBC31
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 08:47:53 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRXL-0000QC-Rr
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 02:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpRVh-0008PE-2g
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpRVb-0004nD-Rf
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608104761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRRiDJxCijr7WYbRB9bJ8McvHx6x2bFZYnn8Kn6+sDA=;
 b=Hqp9rPfa1m+mE/GhZiSgnLF5SzOSqf7rwnU7Z9hugBt6gTCxJo1yyVm5uqKgUVA27YRAW5
 RP8SofKmJJ/x/+rptmDSd3LVVbwdIGhIdfatE/xTG+IEhOgDRfDXDziQ4MkUXqPoU/bbSU
 CcMFfSXQjG6Mmw86iEJblMaXQ4V7Q5M=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-CbVVPu1bPESc-xQRM3ft7w-1; Wed, 16 Dec 2020 02:45:59 -0500
X-MC-Unique: CbVVPu1bPESc-xQRM3ft7w-1
Received: by mail-il1-f198.google.com with SMTP id f2so18702751ils.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 23:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRRiDJxCijr7WYbRB9bJ8McvHx6x2bFZYnn8Kn6+sDA=;
 b=uQ3qDQ+T1kxtxG7gmVl+isYO4M6K7QbcNS2+4sqdyA0FAmy2LHgaGMRYiUUJjteZHv
 5dG+32EwQspUJGAU8l5rEseWmzqfuPfno2/MuaXmMJfhLYcIff9yZsNS833ZA9f9ww8A
 B167jENiX54mpfoU9EQmCqxuwopjKqesPjsoemL4Qp48wyrenj7CD81hdBDbz4o6qfQO
 nZslNsZXvg/OZDiqBxvwD9Yu1jMs1E32VRwVs7dcxQSAYiRZWIbrxhvnsqyJi2qq5V9O
 OlyTbNxxeSDH4baFj+p7tH1hfWrGeRktaMPmAMufKFqPCCHbR8KBhuhFvlHGn40Vx0jV
 DQGg==
X-Gm-Message-State: AOAM532yxlBFA1QWzxjcKPJQ0PZbAu9ruZGY/SLeztYAMotGjxhr/Jcp
 1RXi9wtENEF3uhAK53gCdOLmFSURcD49kFtxfZ4MCUkak5zet8D2gSQiPW7VtrRm+WGRCgoTdgQ
 cjFoOm+4zSgTdqZgKzWGeaX7QvcPEMr4=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr44672573ilm.161.1608104758774; 
 Tue, 15 Dec 2020 23:45:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrrKN1zr+7oNEdJ0fG3UAxal+ib6UpIGc/80g6p3bkHGPWGLNG6ZiVRFLD9KglHUz2RHVnNYPGjfuvQPAbAfw=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr44672568ilm.161.1608104758636; 
 Tue, 15 Dec 2020 23:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-2-ehabkost@redhat.com>
In-Reply-To: <20201215224133.3545901-2-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Dec 2020 11:45:47 +0400
Message-ID: <CAMxuvaxPNL1sw0t+nn+dfa_fU1+=AoZQLMTG+s-TiXjQ+J_vxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] test-char: Destroy chardev correctly at
 char_file_test_internal()
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e6894405b69010d2"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

--000000000000e6894405b69010d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 2:41 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> commit 1e419ee68fa5 ("chardev: generate an internal id when none
> given") changed the reference ownership semantics of
> qemu_chardev_new(NULL, ...): now all chardevs created using
> qemu_chardev_new() are added to the /chardevs QOM container, and
> the caller does not own a reference to the newly created object.
>
> However, the code at char_file_test_internal() had not been
> updated and was calling object_unref() on a chardev object it
> didn't own.  This makes the chardev be destroyed, but leaves a
> dangling pointer in the /chardev container children list, and
> seems to be the cause of the following char_serial_test() crash:
>
>   Unexpected error in object_property_try_add() at ../qom/object.c:1220: =
\
>       attempt to add duplicate property 'serial-id' to object (type
> 'container')
>   ERROR test-char - too few tests run (expected 38, got 9)
>
> Update the code to use object_unparent() at the end of
> char_file_test_internal(), to make sure the chardev will be
> correctly removed from the QOM tree.
>
> Fixes: 1e419ee68fa5 ("chardev: generate an internal id when none given")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

nice catch
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-char.c b/tests/test-char.c
> index 953e0d1c1f..06102977b6 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -1298,7 +1298,7 @@ static void char_file_test_internal(Chardev
> *ext_chr, const char *filepath)
>      g_assert(strncmp(contents, "hello!", 6) =3D=3D 0);
>
>      if (!ext_chr) {
> -        object_unref(OBJECT(chr));
> +        object_unparent(OBJECT(chr));
>          g_unlink(out);
>      }
>      g_free(contents);
> --
> 2.28.0
>
>

--000000000000e6894405b69010d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 2:41 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">co=
mmit 1e419ee68fa5 (&quot;chardev: generate an internal id when none<br>
given&quot;) changed the reference ownership semantics of<br>
qemu_chardev_new(NULL, ...): now all chardevs created using<br>
qemu_chardev_new() are added to the /chardevs QOM container, and<br>
the caller does not own a reference to the newly created object.<br>
<br>
However, the code at char_file_test_internal() had not been<br>
updated and was calling object_unref() on a chardev object it<br>
didn&#39;t own.=C2=A0 This makes the chardev be destroyed, but leaves a<br>
dangling pointer in the /chardev container children list, and<br>
seems to be the cause of the following char_serial_test() crash:<br>
<br>
=C2=A0 Unexpected error in object_property_try_add() at ../qom/object.c:122=
0: \<br>
=C2=A0 =C2=A0 =C2=A0 attempt to add duplicate property &#39;serial-id&#39; =
to object (type &#39;container&#39;)<br>
=C2=A0 ERROR test-char - too few tests run (expected 38, got 9)<br>
<br>
Update the code to use object_unparent() at the end of<br>
char_file_test_internal(), to make sure the chardev will be<br>
correctly removed from the QOM tree.<br>
<br>
Fixes: 1e419ee68fa5 (&quot;chardev: generate an internal id when none given=
&quot;)<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>nice catch<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&=
gt;=C2=A0 <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0tests/test-char.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/test-char.c b/tests/test-char.c<br>
index 953e0d1c1f..06102977b6 100644<br>
--- a/tests/test-char.c<br>
+++ b/tests/test-char.c<br>
@@ -1298,7 +1298,7 @@ static void char_file_test_internal(Chardev *ext_chr,=
 const char *filepath)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(strncmp(contents, &quot;hello!&quot;, 6) =3D=
=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!ext_chr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unparent(OBJECT(chr));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_unlink(out);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(contents);<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div></div>

--000000000000e6894405b69010d2--


