Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB76FF68D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:58:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8fJ-00072r-Qm; Thu, 11 May 2023 11:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px8fH-00072h-QZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px8fG-0005ly-86
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvcjJXsIghMQ32ALOto3Yy0wG6WvjETzN9n4+vxWipA=;
 b=PApP+tgqT/4ggYFhFqR9T8wAecYCj9ojv97anHEvHBReYWEJRjxjABgnKrYDOo9z12WJdZ
 cVK+RvzJBH2U+QBbgf+RgnugGLrE4Kt4AhvaMJB5knlyq5GaICB9TEzu2vVycuY0tUJOnY
 Dsi0XouEHYiCyODCxXT32H60ZUXi/T8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-lFKWZBW-NGGmqQFgYo-EBg-1; Thu, 11 May 2023 11:57:07 -0400
X-MC-Unique: lFKWZBW-NGGmqQFgYo-EBg-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-780d1c6574cso30578851241.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820627; x=1686412627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvcjJXsIghMQ32ALOto3Yy0wG6WvjETzN9n4+vxWipA=;
 b=bYx6+Ucy0kr5/1JYY35LeO0Lt0+Phi2k4wT498FaMJMkuIumK9FWmiW/LcLnmFkIMp
 XNEuStACNjmPIEgwOnNOi4GqoAaOZcmVyiF/lXG0rnFkV1lHKFn/KxUWWRQkUKmoCEGr
 WXHUGqo5O7J64rzLkf12TlYb07JDzPXOlYZS62dr/lks1RrlYCcbUDc9FDVcgb18siaD
 J4SWTZ68ND/GB/F83BBuhQTGxJHLaWEyfOwEZlNzyCcgjtebnZyyeRtdOlF4qhvl4UFZ
 RfRUSasTexxopk5bFlxfsd6seOKs11B75i7lI2+x3mMC2jkMo8Tu0c8bxwX9y/KCN51C
 P7rQ==
X-Gm-Message-State: AC+VfDzT0tKmQH0ZQnSfcsz8uNUlanYgpS8GMZXZzW9MJWcMvnL6rixS
 i5tW97mlogsfECFmcI0KB/0kkcvnd1KvanPJDOjZEhgoXgE//8+F7OUQ5H+o9/uCh6PE5d+F2PX
 nAMhZfKP89eYDxheMbZ4F8ItKEWuE7rM=
X-Received: by 2002:a05:6122:794:b0:44f:e199:e601 with SMTP id
 k20-20020a056122079400b0044fe199e601mr9518479vkr.7.1683820626685; 
 Thu, 11 May 2023 08:57:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qCqwfLrD7gUnF/Wg+g+m1sPQqxMoJGn54GKaRprPOU86uK32D4hLG8oujM35Y3MrLXJ+m367+PS2iwkpBVls=
X-Received: by 2002:a05:6122:794:b0:44f:e199:e601 with SMTP id
 k20-20020a056122079400b0044fe199e601mr9518457vkr.7.1683820626411; Thu, 11 May
 2023 08:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-8-jsnow@redhat.com>
 <e9f60dff-0cc5-82c9-cb68-8c43b7de80a4@redhat.com>
 <CAFn=p-YyBkDsmshShv3jJiL_wSMR6SVy5Z8axgsE4gWkh-r_ZQ@mail.gmail.com>
In-Reply-To: <CAFn=p-YyBkDsmshShv3jJiL_wSMR6SVy5Z8axgsE4gWkh-r_ZQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 May 2023 17:56:55 +0200
Message-ID: <CABgObfaFPQ9tTGho4mtD3k6sp=WZ_KMArdZj-ZgXU_qA5LhGdQ@mail.gmail.com>
Subject: Re: [PATCH 07/27] mkvenv: add diagnose() method for ensure() failures
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004d95eb05fb6d0a58"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--0000000000004d95eb05fb6d0a58
Content-Type: text/plain; charset="UTF-8"

Il gio 11 mag 2023, 17:53 John Snow <jsnow@redhat.com> ha scritto:

>
> You're right, in the "optional" case for sphinx the error isn't really
> *that* bad or serious. I'll try to work this or something very similar to
> it in.
>
> I was thinking it could be up to the caller to discard the input, but I
> suppose we can also route the semantics down into the tool, too.
>
> I'll play with it.
>

If you think that what I posted is okay or at least a start, I can squash
it in.

Paolo


> --js
>
>>

--0000000000004d95eb05fb6d0a58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 11 mag 2023, 17:53 John Snow &lt;<a href=3D"mai=
lto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; ha scritto:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div><br></div><div dir=3D"auto">=
You&#39;re right, in the &quot;optional&quot; case for sphinx the error isn=
&#39;t really *that* bad or serious. I&#39;ll try to work this or something=
 very similar to it in.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I was thinking it could be up to the caller to discard the input, but I sup=
pose we can also route the semantics down into the tool, too.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I&#39;ll play with it.</div></div></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">If you =
think that what I posted is okay or at least a start, I can squash it in.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"au=
to">--js</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div></div>

--0000000000004d95eb05fb6d0a58--


