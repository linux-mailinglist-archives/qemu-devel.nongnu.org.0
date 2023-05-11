Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9036FF7FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:03:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9gd-0004XE-1O; Thu, 11 May 2023 13:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px9ga-0004Wi-P3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px9gY-0002yb-Ll
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683824553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3AV6y38mKO5fyuO0f3CpGSkMrOss8R+W7zIu1D+6PMs=;
 b=DU6mJZOJF/QLgp8Sat22AyvYX9F0+JzxuoFIUMBZt+mx6fvDkgmukC4PC+Zzt5+dMLKZAJ
 0+4VPrXebAGVE/WMytrUAzvcSLFlXNEcD2k0DsgIIVKbvK6HZrSFWly35R/8AYOGGCDLFT
 GEQXbCUkfti9300OIMf+QT/OnGdeDfE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-ZWHCwYhQPF-B3CZFwgMK1w-1; Thu, 11 May 2023 13:02:31 -0400
X-MC-Unique: ZWHCwYhQPF-B3CZFwgMK1w-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-55a40d32a6bso98295057b3.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 10:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824551; x=1686416551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3AV6y38mKO5fyuO0f3CpGSkMrOss8R+W7zIu1D+6PMs=;
 b=HJGj+FENhniYk64paNKWjCkw6WEUivD3Jq4C1BzNu9Bs5KKAwZZn+uektOvg51VcWC
 hB6sQtL2xlwBQTgwRVCP100YYBp6U0PSS7jQAZbihGlck9TArfUWNxNnMN0vK87uDzmv
 4DduENBzhX7Ys68sg/FjBBg4ytCScX4NQVsQDipxTIhrVcOFsgf8WbuRBJGGc2s9klm0
 OpKRH7e6pTBsm29MVGT7xttbqi1Y16z3dnkRqt/l2ZSzGiOTWbKMfYE1KC/zJizy4n5Z
 8VNH3PiLoM9HcXO1p7ENN23zeOw1i7vek/x+bn8AfBrUkRT4s1b3cRfkPilMDgBUIWol
 GwUA==
X-Gm-Message-State: AC+VfDzSKYWAL/9ZsUvkqeDrrVHjrSv37IOHWtIDYKQ1P/pteuSmchtE
 s6CAbUqOfI0h4/XHi/BEdhvCgY8FHC3PR+z51jfirpPD8Nf/r6GRX4g110oRVozj85vD+Q3AlI8
 vncuj4Ueo7HSuEUidIShfcx1QdmZ0dRw=
X-Received: by 2002:a05:7500:e1a7:b0:105:81dc:7cbf with SMTP id
 qc39-20020a057500e1a700b0010581dc7cbfmr505997gab.71.1683824549820; 
 Thu, 11 May 2023 10:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RQnoUE5FGxpz4jcv54spQvArmXXaY7eQWz7WGm6htuGiAtcNJ9XEUREUBBdUCphrZHBbKVcBjHqt4ERFOa+g=
X-Received: by 2002:a05:7500:e1a7:b0:105:81dc:7cbf with SMTP id
 qc39-20020a057500e1a700b0010581dc7cbfmr505917gab.71.1683824548049; Thu, 11
 May 2023 10:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230511165640.1862868-1-alex.bennee@linaro.org>
In-Reply-To: <20230511165640.1862868-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 May 2023 19:02:16 +0200
Message-ID: <CABgObfabZgJro_faUfhADWtTg1ewpM2iMtmt4KkJpSBqmJsF_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] Makefile: include gtags in UNCHECKED_GOALS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000d6d1e05fb6df459"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000d6d1e05fb6df459
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 11 mag 2023, 18:56 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> This is the mechanism we use to avoid defaulting to a build dir when
> we don't need to.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

I had already squashed this into Steven Sistare's recently posted patch,
which otherwise would have broken the "pages" job in CI.

Paolo

---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e421f8a1f4..c566aeb418 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -26,7 +26,7 @@ quiet-command-run =3D $(if $(V),,$(if $2,printf "  %-7s
> %s\n" $2 $3 && ))$1
>  quiet-@ =3D $(if $(V),,@)
>  quiet-command =3D $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>
> -UNCHECKED_GOALS :=3D %clean TAGS cscope ctags dist \
> +UNCHECKED_GOALS :=3D %clean TAGS cscope ctags gtags dist \
>      help check-help print-% \
>      docker docker-% vm-help vm-test vm-build-%
>
> --
> 2.39.2
>
>

--0000000000000d6d1e05fb6df459
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 11 mag 2023, 18:56 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This is the mechanism we use to =
avoid defaulting to a build dir when<br>
we don&#39;t need to.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I had=
 already squashed this into Steven Sistare&#39;s recently posted patch, whi=
ch otherwise would have broken the &quot;pages&quot; job in CI.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
---<br>
=C2=A0Makefile | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/Makefile b/Makefile<br>
index e421f8a1f4..c566aeb418 100644<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -26,7 +26,7 @@ quiet-command-run =3D $(if $(V),,$(if $2,printf &quot;=C2=
=A0 %-7s %s\n&quot; $2 $3 &amp;&amp; ))$1<br>
=C2=A0quiet-@ =3D $(if $(V),,@)<br>
=C2=A0quiet-command =3D $(quiet-@)$(call quiet-command-run,$1,$2,$3)<br>
<br>
-UNCHECKED_GOALS :=3D %clean TAGS cscope ctags dist \<br>
+UNCHECKED_GOALS :=3D %clean TAGS cscope ctags gtags dist \<br>
=C2=A0 =C2=A0 =C2=A0help check-help print-% \<br>
=C2=A0 =C2=A0 =C2=A0docker docker-% vm-help vm-test vm-build-%<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--0000000000000d6d1e05fb6df459--


