Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C7648AAA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 23:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3lfK-0000de-Jm; Fri, 09 Dec 2022 17:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3lfI-0000dM-EL
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 17:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3lfF-0000Xa-B6
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 17:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670624175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yi1sL/pHTTDhaDGhMaywi95gcMus6uqKoEYyWkPkN0g=;
 b=fzlOWGcKh60O44/bxWMRCkPjOq0Akxs8HHtze9RcpaUr4wCOI5GVio7jm9GWS873Oex0s+
 mI8UwyBGueAw7qx3SN7cffzwrfBlN1zm2dxJYyclpMGSmEUtdL5oeIBJp/zovnWq5WdD41
 HCoEXxIInYtdBwf//EcTpch4gOaSKE0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-4GyM6HtWNmW2HlJtyuAQvQ-1; Fri, 09 Dec 2022 17:16:13 -0500
X-MC-Unique: 4GyM6HtWNmW2HlJtyuAQvQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 l62-20020a677041000000b003aa06a96e75so1663492vsc.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 14:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yi1sL/pHTTDhaDGhMaywi95gcMus6uqKoEYyWkPkN0g=;
 b=kDZqBIx1JObyeKZqmOwSnw89HlPdUbCfvIVUre1g/Wbn1cQftn7bforzFuGSZvSnse
 y5CzyK49sdQfJhuv87oMVSbBR53Q4OPW9UsZwbxL6IRznHgXv7Clmx7RazPXL0CdqUbt
 2fxTPZR55Mbhbm5oKBqIYicHK8GTx/gU99ndAkbWtEGLLrZ74Cn78F7YgziPsVavF2lb
 bKRtvv2KupmHFtau4ou0NPJ9eMM1smbU3chf718JKUN5ySgwQMOp+1awmpdAwOmXSNu+
 77zIQOfC/Ga49SJdSx7aPM7loUYL1ZNd3/oVZhwn5lHHAkKCFDbqKlHSojXGVVe+N1xv
 ZIww==
X-Gm-Message-State: ANoB5pla8x01E+Gq1xykfKWsCnE3ENTS5QigHJWRjugd5j7z/n2Oj+cC
 ocr1f4a+1cJZx5jKQJLS/YDI9NARpTjZMdGrnOs2NAZ97Gbxq6KYhRcS858tfOKjMJjuhcMPPki
 BT3wVsjxwOG5pGPxxwYoc5iBSY6SxWno=
X-Received: by 2002:ab0:69cc:0:b0:410:2392:40f with SMTP id
 u12-20020ab069cc000000b004102392040fmr53777646uaq.109.1670624173450; 
 Fri, 09 Dec 2022 14:16:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5s4objdYrd+lU/J30VUCoyK3Fu9cYi295olqRBups7Waq9XtYhV1IrrKmZlL4/qzxVzKQ0N+XeswLYNi9v2Nk=
X-Received: by 2002:ab0:69cc:0:b0:410:2392:40f with SMTP id
 u12-20020ab069cc000000b004102392040fmr53777637uaq.109.1670624173150; Fri, 09
 Dec 2022 14:16:13 -0800 (PST)
MIME-Version: 1.0
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
 <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
 <CAFEAcA8MrUwOt+gaSVF6tMpG_HO_wCN_O11Ezst97-_52PR9pQ@mail.gmail.com>
 <a14c2624-36fa-b5c1-a358-95694e01a339@redhat.com>
 <CAFEAcA8DttcCD7ofcjfifigssAZpnLAe23-J9=iadmM31+nV0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8DttcCD7ofcjfifigssAZpnLAe23-J9=iadmM31+nV0Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 9 Dec 2022 23:16:02 +0100
Message-ID: <CABgObfazaGTAe4L-fyVyL3GUa+GHxe8YZPspLLUojVLSGefW0Q@mail.gmail.com>
Subject: Re: Target-dependent include path, why?
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000064ec2005ef6c809b"
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

--00000000000064ec2005ef6c809b
Content-Type: text/plain; charset="UTF-8"

Il ven 9 dic 2022, 20:54 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> > - placing pkg-config output directly in $(QEMU_CFLAGS) and $(LIBS).
> > This caused binaries to have unnecessary dependencies at times.
>
> Yeah, this is what I think of as "the standard thing".
>

Got it, and it wasn't exactly what QEMU was doing. There was at least
libs_softmmu, libs_qga. So in practice it would be more similar to the
other one:

> - a mix of the two, with the include path added to QEMU_CFLAGS and a
> > target variable definition "foo$(EXESUF): LIBS += ..." that avoided the
> > unnecessary dependencies.
>

which meson does support.

However the issue you mention below is indeed the gnutls bug, and it can be
fixed. If I recall correctly it was meant to be a temporary workaround for
the actual bug.

I need to check again but I recall I had two fixes in mind, one was a more
risky change in Meson, the other was a new declare_dependency(..., objects:
...) argument to be used instead of link_whole. link_whole was used before
but it didn't work for some reason, maybe something to do with static
linking.

I was hoping to stop the Meson upgrades at 0.63, but I agree that it is
messy and it would be a good reason for another bump in the future.

Paolo

The thing I find counterintuitive about what we have currently
> is that I can add a #include of a QEMU-internal header to a
> source file, and now the build can be broken on some host
> system configurations.
>



Paolo


> I'd be happier with either:
>  (1) it's always safe to #include QEMU's own headers in its
>      source files
>  (2) sometimes a new QEMU header #include requires you to add a
>      dependency to a meson.build file, but if you forget to do
>      this then the build reliably fails on *all* host systems
>
> thanks
> -- PMM
>
>

--00000000000064ec2005ef6c809b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 9 dic 2022, 20:54 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritt=
o:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
&gt; - placing pkg-config output directly in $(QEMU_CFLAGS) and $(LIBS).<br=
>
&gt; This caused binaries to have unnecessary dependencies at times.<br>
<br>
Yeah, this is what I think of as &quot;the standard thing&quot;.<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Got it, and=
 it wasn&#39;t exactly what QEMU was doing. There was at least libs_softmmu=
, libs_qga. So in practice it would be more similar to the other one:</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
&gt; - a mix of the two, with the include path added to QEMU_CFLAGS and a<b=
r>
&gt; target variable definition &quot;foo$(EXESUF): LIBS +=3D ...&quot; tha=
t avoided the<br>
&gt; unnecessary dependencies.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">which meson does support.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">However the issue you mention below is inde=
ed the gnutls bug, and it can be fixed. If I recall correctly it was meant =
to be a temporary workaround for the actual bug.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I need to check again but I recall I had two fixes=
 in mind, one was a more risky change in Meson, the other was a new declare=
_dependency(..., objects: ...) argument to be used instead of link_whole. l=
ink_whole was used before but it didn&#39;t work for some reason, maybe som=
ething to do with static linking.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I was hoping to stop the Meson upgrades at 0.63, but I agree that=
 it is messy and it would be a good reason for another bump in the future.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">The thing I find counterintuitive about what we have curren=
tly<br>
is that I can add a #include of a QEMU-internal header to a<br>
source file, and now the build can be broken on some host<br>
system configurations.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
I&#39;d be happier with either:<br>
=C2=A0(1) it&#39;s always safe to #include QEMU&#39;s own headers in its<br=
>
=C2=A0 =C2=A0 =C2=A0source files<br>
=C2=A0(2) sometimes a new QEMU header #include requires you to add a<br>
=C2=A0 =C2=A0 =C2=A0dependency to a meson.build file, but if you forget to =
do<br>
=C2=A0 =C2=A0 =C2=A0this then the build reliably fails on *all* host system=
s<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--00000000000064ec2005ef6c809b--


