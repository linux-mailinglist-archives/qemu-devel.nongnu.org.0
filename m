Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3430B316
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 00:02:38 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6iDM-0003JK-No
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 18:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6iAy-0002Ku-JL
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:00:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6iAu-0004rU-SF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RtC9ldxlxxFKC7pbrBzJ7XOY/TThW7FunJFSuLhiYmU=;
 b=R6YEYgHAC7tvb8K62ZBU8fyQVTxwMsdm7sjcjclOzSGV7DO0X0+y2jMUhj99xJB0sNXZG+
 3t7Oddl7YvPPSlOik4NMRSMJxNIRA8DLdpLHzJz2GthO8w239cAcjwBXaa+34T5jf+mvZg
 G5Yhxv1H8tij7jtY/qMRxBp2bDmvm4o=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-dQI5bqWNMUaqYjx8ZOx21A-1; Mon, 01 Feb 2021 18:00:01 -0500
X-MC-Unique: dQI5bqWNMUaqYjx8ZOx21A-1
Received: by mail-pj1-f69.google.com with SMTP id ds4so467917pjb.8
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 15:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtC9ldxlxxFKC7pbrBzJ7XOY/TThW7FunJFSuLhiYmU=;
 b=GtA7YFU/iU3WIZ1HkFgQx90qcSTrR5dpzZzPTHrAGaoHUB1sny3TuT7jhJsECHxgGZ
 9gXtH8t44uX4An6DRF9YVsmLpNYYYwPRTBwNeEBjW+t0gGU+QsKtZRDQwgPe8R5pUAXP
 m2Ica1ct1BqtHOnTSD8NGhJkugdG9RYVQQjH1X7MfiYEtJ0mA1+8bLjYU9/KNcylbCry
 puG8/b1qkRBzk7YqssE7nnruesJ7VQFGewrUvtTAcycmIfOaEwCJqysqnp8al/Z0n0/M
 hjQnoEyzF2H4m2AhIVCwjsuxfECGm93ByRMH4VzOET20ttZzqcbAf2ErF99L9p5h1LQf
 Gf6g==
X-Gm-Message-State: AOAM532zAWu1ptj/CcF2z2UJFNTpsod+IyA/uqUYdI+gQL6R9tJHmTaK
 vRGc+Lmm1IPFMxkYeI0IFndHVOnC5xA3TELlf7+neHvjlQvHlbefS0dvn6VCqb9lpzM9pFXaSTe
 1E/SJoxToxI8rLA8Fap5BzrRRU/ca7O0=
X-Received: by 2002:a65:4201:: with SMTP id c1mr18997355pgq.10.1612220400937; 
 Mon, 01 Feb 2021 15:00:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkxL9aRBQTYH/AaOf5DupOwoFOQOfZBPpb6XhtICapJGf6pm00/+3QIhOe5Jb6YrR3WB/j7E7fYKOsa8gbEp0=
X-Received: by 2002:a65:4201:: with SMTP id c1mr18997330pgq.10.1612220400529; 
 Mon, 01 Feb 2021 15:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
In-Reply-To: <20210201225404.3941395-2-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 1 Feb 2021 23:59:48 +0100
Message-ID: <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000460f4e05ba4e50b8"
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
Cc: Babu Moger <babu.moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000460f4e05ba4e50b8
Content-Type: text/plain; charset="UTF-8"

This is intentional, because there's no way that any hypervisor can run if
this feature is disabled.

Paolo

Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

> Not having a feature name in feature_word_info breaks error
> reporting and query-cpu-model-expansion.  Add the missing feature
> name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
>
> Fixes: 0723cc8a5558 ("target/i386: add VMX features to named CPU models")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target/i386/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ae89024d366..2bf3ab78056 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1262,7 +1262,7 @@ static FeatureWordInfo
> feature_word_info[FEATURE_WORDS] = {
>              "vmx-ept-execonly", NULL, NULL, NULL,
>              NULL, NULL, "vmx-page-walk-4", "vmx-page-walk-5",
>              NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> +            NULL, NULL, "vmx-ept-wb", NULL,
>              "vmx-ept-2mb", "vmx-ept-1gb", NULL, NULL,
>              "vmx-invept", "vmx-eptad", "vmx-ept-advanced-exitinfo", NULL,
>              NULL, "vmx-invept-single-context", "vmx-invept-all-context",
> NULL,
> --
> 2.28.0
>
>

--000000000000460f4e05ba4e50b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is intentional, because there&#39;s no way that any =
hypervisor can run if this feature is disabled.<div dir=3D"auto"><br></div>=
<div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il lun 1 feb 2021, 23:54 Eduardo Habkost &lt;=
<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Not having a feature name in fe=
ature_word_info breaks error<br>
reporting and query-cpu-model-expansion.=C2=A0 Add the missing feature<br>
name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].<br>
<br>
Fixes: 0723cc8a5558 (&quot;target/i386: add VMX features to named CPU model=
s&quot;)<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">ehabkost@redhat.com</a>&gt;<br>
---<br>
=C2=A0target/i386/cpu.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/i386/cpu.c b/target/i386/cpu.c<br>
index ae89024d366..2bf3ab78056 100644<br>
--- a/target/i386/cpu.c<br>
+++ b/target/i386/cpu.c<br>
@@ -1262,7 +1262,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORD=
S] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;vmx-ept-execonly&quot=
;, NULL, NULL, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, &quot;vmx-page-=
walk-4&quot;, &quot;vmx-page-walk-5&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, &quot;vmx-ept-wb&quo=
t;, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;vmx-ept-2mb&quot;, &q=
uot;vmx-ept-1gb&quot;, NULL, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;vmx-invept&quot;, &qu=
ot;vmx-eptad&quot;, &quot;vmx-ept-advanced-exitinfo&quot;, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &quot;vmx-invept-sing=
le-context&quot;, &quot;vmx-invept-all-context&quot;, NULL,<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div>

--000000000000460f4e05ba4e50b8--


