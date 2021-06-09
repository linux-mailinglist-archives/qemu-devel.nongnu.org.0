Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1823A1AA6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:16:31 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0sY-00067N-LQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lr0e3-0000Vr-Sl
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:01:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lr0e0-0000lL-S8
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:01:31 -0400
Received: by mail-ed1-x533.google.com with SMTP id r11so29098623edt.13
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bz58zNvkLoHYgTXK1IvYO2TBEZQJOrMb5IntExHM5ck=;
 b=HAWQzuEapQciVQNvG1SvUd7Cvbptji+Dj0OpFyKTQ0BEWXZg34tQTWBhyC0bfdCA8Z
 hiohLMGagbbQQg9YLWtEKqoyKqMV6hxB999wMrcxb2pto/rp+AWqft4iW4r59BKlMz1v
 Qrmd6VmBjkmOWGTVo0ggJQSWn0gunj/eXMVbBic1i5aXo6KzKZ+dtXrYP7Bwo7+A+Ntw
 HVaY+uFOlg7DrTCuuDm473T18abajWKcEtbkmHp2Qa+WpFCRQuZI4tUAVkiiZ1kRClAs
 IP4aLmkEYmJZ13qZbSB1Scggk/UvezKEziX/cWURs80NSnZPuAS6eQSuLHP3QIX9/sE9
 5tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bz58zNvkLoHYgTXK1IvYO2TBEZQJOrMb5IntExHM5ck=;
 b=XlArgd5JPVXdpffyUCh1vaNjsAJozZGJheIZC49Jv1r/Xf/2nFNwzLS/Z/gZAGkzj7
 L/GbtYPsMBpWtPOpXgdA8cE7hlEWBNn3FqWqt8LOeRGKbPM4sv5lAeNfvtTDtmxqgV6I
 HO6qDFb+8j2a1T8/Fhstil9dDWjj8O618tMl1OOUpJZpsuaeDJkzDp68Al2DnJ6I4WfF
 BU3qmxoNP9yJVH64Zu2WgQaDuzknTRguPEmh0ZPtzUofN8pUetgIT35c1tezat1+MgMB
 abrNXmmAm/Fm4SsnudXpZ6SK4ABGP9GV5cJWRWdHrnhYhiaxpKcTSXFa2RNmFxEOVGYx
 ltUw==
X-Gm-Message-State: AOAM531btLWfZWWLg7bt4dr5sZ5XLpX5tcY89A5JsgZdvM8xXT6lwfB7
 X2IBdNqpIYoRxD9p1Ivh/4Atcz4gyPO5XIggJks=
X-Google-Smtp-Source: ABdhPJxzKoVjGNqzy6U3VMDLpeTgyyrnyHkGPSJQcIe0bgIxq57OilPnD4Scx7v72efkTClZvqBx8T2LtXLT29k3ud0=
X-Received: by 2002:a05:6402:cb5:: with SMTP id
 cn21mr155486edb.164.1623254486027; 
 Wed, 09 Jun 2021 09:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210609152559.1088596-1-philmd@redhat.com>
In-Reply-To: <20210609152559.1088596-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Jun 2021 20:01:14 +0400
Message-ID: <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005116105c457636d"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005116105c457636d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> When the management layer queries a binary built using --disable-tpm
> for TPM devices, it gets confused by getting empty responses:
>
>   { "execute": "query-tpm" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-types" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-models" }
>   {
>       "return": [
>       ]
>   }
>
> Make it clearer by returning an error, mentioning the feature is
> disabled:
>
>   { "execute": "query-tpm" }
>   {
>       "error": {
>           "class": "GenericError",
>           "desc": "this feature or command is not currently supported"
>       }
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Why not make the qapi schema conditional?

---
>  stubs/tpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/stubs/tpm.c b/stubs/tpm.c
> index 9bded191d9d..8c904215b39 100644
> --- a/stubs/tpm.c
> +++ b/stubs/tpm.c
> @@ -7,6 +7,8 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-commands-tpm.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/error.h"
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>
> @@ -21,16 +23,19 @@ void tpm_cleanup(void)
>
>  TPMInfoList *qmp_query_tpm(Error **errp)
>  {
> +    error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
>
>  TpmTypeList *qmp_query_tpm_types(Error **errp)
>  {
> +    error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
>
>  TpmModelList *qmp_query_tpm_models(Error **errp)
>  {
> +    error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005116105c457636d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 2021 at 7:33 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">When the management layer queries a binary built using --disable-tpm=
<br>
for TPM devices, it gets confused by getting empty responses:<br>
<br>
=C2=A0 { &quot;execute&quot;: &quot;query-tpm&quot; }<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;return&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 }<br>
=C2=A0 { &quot;execute&quot;: &quot;query-tpm-types&quot; }<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;return&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 }<br>
=C2=A0 { &quot;execute&quot;: &quot;query-tpm-models&quot; }<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;return&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 }<br>
<br>
Make it clearer by returning an error, mentioning the feature is<br>
disabled:<br>
<br>
=C2=A0 { &quot;execute&quot;: &quot;query-tpm&quot; }<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;error&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;class&quot;: &quot;GenericError&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;desc&quot;: &quot;this feature or =
command is not currently supported&quot;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Why not make the qapi schema conditional?</div><div> <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0stubs/tpm.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/stubs/tpm.c b/stubs/tpm.c<br>
index 9bded191d9d..8c904215b39 100644<br>
--- a/stubs/tpm.c<br>
+++ b/stubs/tpm.c<br>
@@ -7,6 +7,8 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-tpm.h&quot;<br>
+#include &quot;qapi/qmp/qerror.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;sysemu/tpm.h&quot;<br>
=C2=A0#include &quot;hw/acpi/tpm.h&quot;<br>
<br>
@@ -21,16 +23,19 @@ void tpm_cleanup(void)<br>
<br>
=C2=A0TPMInfoList *qmp_query_tpm(Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
=C2=A0TpmTypeList *qmp_query_tpm_types(Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
=C2=A0TpmModelList *qmp_query_tpm_models(Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000005116105c457636d--

