Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA56F1D03
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:55:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRNY-0000FB-A6; Fri, 28 Apr 2023 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psRNV-0008T9-MF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psRNT-0006MM-W5
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682700923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ra5C5MYobiyEsygWhYz8PuN4sR82QM6sUqcFIhpphS0=;
 b=MXt9Iq4SFq+WK2DGxH3eJJWGRZQglgVAeIdGL7iADzyc3X2KlaS1SQvWYbjvav6yO4JxXF
 FzaA/a3XXRFth3cO1WiiBDt5YFQJTBU1TqrYdo9+YFqksCpcxHF9VsjPsEGRFavzlk4szg
 QCUiHTL2bCfbzGcVTk47zK6QAniIric=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-22K-Ok1CO3yFJIQYU-ugKQ-1; Fri, 28 Apr 2023 12:55:21 -0400
X-MC-Unique: 22K-Ok1CO3yFJIQYU-ugKQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-42e3d5f8dfdso52946137.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700921; x=1685292921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ra5C5MYobiyEsygWhYz8PuN4sR82QM6sUqcFIhpphS0=;
 b=lpj06uufJO+9fGAP6MpJNELBms9HbrPU0ZBHjG9hVQXKI0EJ5xSNGuKGYWMTDE5K4U
 7zsCASeY66r8FSkIVXzOpawGn7FeBkUA3qU6ELraFB79o+bH1fHl08Hm7pr6zhLv68EX
 I1Hy5gJIoSjOCxsaDUtxrJ68HL+vd+NM6fjnBBmqqvSrM4Xt3HC9YZbNamdlZAzWqEU7
 p+Sc6RugOXAfAPzl26XC1fzzZIKg1GQev8kYfsN1X8N3r5b7S1j0v7BtHxNq4gThrLlB
 ANVF+vzKhcTQU9jgKJ57I4c/C4xcqOYKX+Y6f4MzsTXPUIgu2PQqTIyik/rnPp4n6v7t
 TECQ==
X-Gm-Message-State: AC+VfDw6QA3w5u5ZiWU/aGkmKDv7lene/2GiIv/GunnTASCLjj3ZCLfb
 EGuZMiOASoqOY3hwESwCbP2IYAKyLXOBFdg1Vm8CAQAEx/rNawoQJFf0whmjYtPq5noUMufutTl
 vMot1p8QpoBPZntiZtkQtCmosG9a5ZhU=
X-Received: by 2002:a67:e303:0:b0:42e:2b9f:f8f0 with SMTP id
 j3-20020a67e303000000b0042e2b9ff8f0mr2415568vsf.30.1682700921269; 
 Fri, 28 Apr 2023 09:55:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7DCcGcQgGX/W2Bwm6YrKiETiF2e2ntdbzN6cXYRr1BUa8dbHQHOL60T4j+gR6mozxpk9FkySAiLY3QW24GoaU=
X-Received: by 2002:a67:e303:0:b0:42e:2b9f:f8f0 with SMTP id
 j3-20020a67e303000000b0042e2b9ff8f0mr2415554vsf.30.1682700921056; Fri, 28 Apr
 2023 09:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230420202939.1982044-1-clg@kaod.org>
 <87a5ywgkqg.fsf@secure.mitica>
 <ZEfUq52l/wut8puM@redhat.com> <ZEfWAciwsB+t7Crk@redhat.com>
 <CABgObfY1ZmfRGjVnsQ6NC7jTe_X+Gx4uxW4R048xxaJ3Vdt+9A@mail.gmail.com>
 <87v8hg9dqm.fsf@secure.mitica>
In-Reply-To: <87v8hg9dqm.fsf@secure.mitica>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 28 Apr 2023 18:55:09 +0200
Message-ID: <CABgObfb6cGUWdOg2cSGjnP7JLN+HxtT2Fkch8pJeTmjgfHyT5w@mail.gmail.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
To: "Quintela, Juan" <quintela@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a9c10605fa6856a3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000a9c10605fa6856a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 28 apr 2023, 18:25 Juan Quintela <quintela@redhat.com> ha scritto:

> > On the other hand, if the pointer to the heap-allocated BHListSlice
> > escaped, this would be a dangling pointer as well=E2=80=94just not the =
kind that
> > the new GCC warning can report.
>
> I don't agree here.
> If with my patch it becomes a dangling pointer because we free it.
> With Cedric patch it is a local variable that gets exited out of the
> function that created it.


> Choose your poison.  One thing is bad and the other is worse.
>

Not sure which is worse=E2=80=94explicitly disabling a warning, at least, c=
learly
says the compiler finds it iffy.

> So this patch is also doing nothing but shut up the compiler; but it's
> > doing so in an underhanded manner and with a runtime cost, and as such
> it's
> > worse than Cedric's patch.
>
> Ok.  I don't care (enogouh) about this to continue a discussion.. Can we
> get Cedric patch upstream?
>

Yes I am sending the pull request very soon.

Paolo


> Thanks, Juan.
>
>

--000000000000a9c10605fa6856a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 28 apr 2023, 18:25 Juan Quintela &lt;<a href=3D=
"mailto:quintela@redhat.com">quintela@redhat.com</a>&gt; ha scritto:</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
&gt; On the other hand, if the pointer to the heap-allocated BHListSlice<br=
>
&gt; escaped, this would be a dangling pointer as well=E2=80=94just not the=
 kind that<br>
&gt; the new GCC warning can report.<br>
<br>
I don&#39;t agree here.<br>
If with my patch it becomes a dangling pointer because we free it.<br>
With Cedric patch it is a local variable that gets exited out of the<br>
function that created it.</blockquote></div></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Choose your poison.=C2=A0 One thing is bad and the other is worse.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Not sure =
which is worse=E2=80=94explicitly disabling a warning, at least, clearly sa=
ys the compiler finds it iffy.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; So =
this patch is also doing nothing but shut up the compiler; but it&#39;s<br>
&gt; doing so in an underhanded manner and with a runtime cost, and as such=
 it&#39;s<br>
&gt; worse than Cedric&#39;s patch.<br>
<br>
Ok.=C2=A0 I don&#39;t care (enogouh) about this to continue a discussion.. =
Can we<br>
get Cedric patch upstream?<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Yes I am sending the pull request very soon.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Thanks, Juan.<br>
<br>
</blockquote></div></div></div>

--000000000000a9c10605fa6856a3--


