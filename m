Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D946CB06A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:11:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgu6T-0001Rt-RJ; Mon, 27 Mar 2023 17:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pgu6Q-0001Pw-Ns
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pgu6O-0008MG-MZ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679951402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJA1A9CRB78t+j60bAgzx6Apio6og+MwZ8sZW41/d7Q=;
 b=d1IW8XXt+dBFWU0LS9ZTaUNM1fUfSlN4YPyrThlHAML11N/ARFwl51SGg+s9is+9E0SxPA
 jCz1Bl3qe9Nzl8IFjRikdFdYSN7f8UQfe8ujJnj4phgNybMHT5cowy4c1HI5I9tkrfCUpE
 ZqGRTlj3wJDBNp+LaqjbqiPyD7Z3JYQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-87Gf0ofTNbGPvIR3LSVmAQ-1; Mon, 27 Mar 2023 17:10:00 -0400
X-MC-Unique: 87Gf0ofTNbGPvIR3LSVmAQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 c18-20020ab030d2000000b00751d7bbfb13so4644784uam.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJA1A9CRB78t+j60bAgzx6Apio6og+MwZ8sZW41/d7Q=;
 b=oPDGFdgtOD5+NS1bBFgKSB5dNqs2KKOouId+XRY0sq11Euvl84ENOpwrqXCLujOLcW
 eSxCo1ONxq2xOxl03kJaffjy01Z7uW6e4SZaqYspdPqImrbQb+ghuj1s3mDAPLrVSGYk
 nHW7X84zbXYZgGCG+gdkTJz9LgeKpd3opHXkfCRx0VU02/OKeJWibyhBvBCRYrPTyiAQ
 tNz1JPm/T9/qVEOfeZNP9IswMF716bsdW1obyfJHQvdxIIMLu3mWjjStPru4i0i0/5bW
 6A7ymcNk+3vHBfAjMkY7+a53+j7TW0x1SyYbnc56VWxrsSuUUfJPvJMvZL4YzDh7/cPo
 qiWw==
X-Gm-Message-State: AAQBX9dWvMlobU8fENPek4zFHpIgw/1xqqPxS1jr2aAc/vOaiIUwFd3v
 vI9FIXWVNYSuN/fPa1ECA2XcKyJvChH2SKXnkRYJpb9fZ6YYbjlqHaA0CDLL2HvqySqgcFLaW8M
 8dWg+ktYJwhMiiivWQk9pEcpckh2mTls=
X-Received: by 2002:a1f:3890:0:b0:432:911c:d523 with SMTP id
 f138-20020a1f3890000000b00432911cd523mr7132573vka.1.1679951399598; 
 Mon, 27 Mar 2023 14:09:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBbEAfleVD4mWnIHn+AdCCNs1hsf1T9gn7aN6JA41Oq/F5LAwDjvc6ym/vZHNpDSren2u45pdum3nUpWwWGxk=
X-Received: by 2002:a1f:3890:0:b0:432:911c:d523 with SMTP id
 f138-20020a1f3890000000b00432911cd523mr7132555vka.1.1679951399307; Mon, 27
 Mar 2023 14:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230327151349.97572-1-philmd@linaro.org>
 <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
 <e4a0b994-965a-2bd4-5517-b11e31b002ee@linaro.org>
In-Reply-To: <e4a0b994-965a-2bd4-5517-b11e31b002ee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Mar 2023 23:09:49 +0200
Message-ID: <CABgObfZ8pfrfMV0YLWo-bPyh7fCehk+NjRRnkKA15DQnqy3Mpg@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Wu <peter@lekensteyn.nl>, Julio Faracco <jcfaracco@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006564f605f7e82ad6"
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

--0000000000006564f605f7e82ad6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 27 mar 2023, 20:58 Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> h=
a
scritto:

> > The warning can also be suppressed if the build uses `-isystem
> > /opt/homebrew/include` instead of `-I/opt/homebrew/include` as I just
> > have tested.
>

Is that option added by QEMU's configure or meson.build? Or is it added by
homebrew? The fact that /opt/homebrew/include it isn't considered a system
seems to be a homebrew decision.

IIUC by design meson only allows including *relative* directories,
> and manage the system ones:
> https://mesonbuild.com/Include-directories.html


That's for includes that are part of QEMU.

Meson has as_system for dependency objects (
https://mesonbuild.com/Reference-manual_returned_dep.html) but lzfse
doesn't have a .pc file, its detection has to be done by hand.

Paolo


> > If we can find a solution how to implement that I thing it would look
> > nicer. Technically the patch looks good.
> >
> > Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> Thanks!
>
>

--0000000000006564f605f7e82ad6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 27 mar 2023, 20:58 Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; ha scrit=
to:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
&gt; The warning can also be suppressed if the build uses `-isystem <br>
&gt; /opt/homebrew/include` instead of `-I/opt/homebrew/include` as I just =
<br>
&gt; have tested.<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Is that option added by QEMU&#39;s configure or meson.buil=
d? Or is it added by homebrew? The fact that /opt/homebrew/include it isn&#=
39;t considered a system seems to be a homebrew decision.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
IIUC by design meson only allows including *relative* directories,<br>
and manage the system ones:<br>
<a href=3D"https://mesonbuild.com/Include-directories.html" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://mesonbuild.com/Include-directories=
.html</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">That&#39;s for includes that are part of QEMU.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Meson has as_system for dependency objects (<a =
href=3D"https://mesonbuild.com/Reference-manual_returned_dep.html">https://=
mesonbuild.com/Reference-manual_returned_dep.html</a>) but lzfse doesn&#39;=
t have a .pc file, its detection has to be done by hand.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
&gt; If we can find a solution how to implement that I thing it would look =
<br>
&gt; nicer. Technically the patch looks good.<br>
&gt; <br>
&gt; Reviewed-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=
=3D"_blank" rel=3D"noreferrer">sw@weilnetz.de</a>&gt;<br>
<br>
Thanks!<br>
<br>
</blockquote></div></div></div>

--0000000000006564f605f7e82ad6--


