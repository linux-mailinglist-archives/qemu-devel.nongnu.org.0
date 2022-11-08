Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C4621C13
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTVh-0000vn-6P; Tue, 08 Nov 2022 13:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1osTVX-0000py-R0
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1osTVV-00015X-4e
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667932771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iR3pfLwhipHYeLu3jWe5v5r4GSFxojnxqPdRdf/Htmc=;
 b=bkl7OSLSnWG6GX3qwQfnRi4LWhhcaIGhcpxVtrXvW0eok84QQQ9BV1/ACqq7VgfILU5YZP
 Akgr+n6iO0QgXZ8QTWroHTkEEDDgQtTmxxtSP3THbKXQItRfUojr3D/euDL8SdA52NZWeA
 G7t9SenqpyMyktNRiXU7x4YcrdfbQ68=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-MLd6cW2kNJubM8C9N0qJ-Q-1; Tue, 08 Nov 2022 13:39:30 -0500
X-MC-Unique: MLd6cW2kNJubM8C9N0qJ-Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 s186-20020a1f90c3000000b003b7690bbea1so4339641vkd.21
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iR3pfLwhipHYeLu3jWe5v5r4GSFxojnxqPdRdf/Htmc=;
 b=JfGMofpxjMq3jP+g/lzCHB2kPJgiQH/FgTv1BdBJrGpHKmkMbxgILF2I83sHHuZENB
 oPBDdn4DzFwPQ84E1DsaGia5uIVk29rVO3D0yF/jz3WJDowZ0n+z+kC49EW+PuRrzrfK
 uyhYsqS4KKhigh2gp2AoIgRD3RwbOxlqNDJpy0XtTMcNyzPcvXPq5rv24mQb7FvKsw9a
 9IeLS43GRYbYiJ5asQkYSzWgPuOHf4kT+0X0/MqqjdSKh/WMVs25gGWprGB3netptdYj
 3PGz6jXghwU9BMaDJ1KWOl68wNyp783qf7mhSk1x4v4/DDgw/j3In4mmp3QIQW56bZZa
 qVhw==
X-Gm-Message-State: ACrzQf0AQKTSfPNcU2ufag2XeQVsIhl74mdZDTkydQgCtSMLJ0Fow4V0
 XSP2BM25QzCRynMrsG6NCtgvY3oXAkUjkgPMQw9PSu8uVgZejEZmlGHjBXfZVBP94aPUpG5+/u7
 JuoxbhfS/gDmvuwJOcbF9VXoZ/vuvYrU=
X-Received: by 2002:a67:c29b:0:b0:3aa:3af1:2369 with SMTP id
 k27-20020a67c29b000000b003aa3af12369mr30417911vsj.27.1667932769438; 
 Tue, 08 Nov 2022 10:39:29 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4fCLndAgB49op7GEA0u8copASOLrkcs2qGhmkhUVYURzNzMkzn8BdouKepzA2hedueJtWqLtJENKhWka2otpw=
X-Received: by 2002:a67:c29b:0:b0:3aa:3af1:2369 with SMTP id
 k27-20020a67c29b000000b003aa3af12369mr30417900vsj.27.1667932769206; Tue, 08
 Nov 2022 10:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20221030222841.42377-1-philmd@linaro.org>
 <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
 <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
 <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
In-Reply-To: <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 8 Nov 2022 19:39:18 +0100
Message-ID: <CABgObfYnEdEJNo6cW_8=SuotEq9Q13yDz8428zndnSYYzKK1eQ@mail.gmail.com>
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>, 
 qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000037ddb905ecf9dc0f"
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

--00000000000037ddb905ecf9dc0f
Content-Type: text/plain; charset="UTF-8"

Il mar 8 nov 2022, 16:09 Thomas Huth <thuth@redhat.com> ha scritto:

> >> If it is the last thing, we should put in the "Build Dependencies"
> >> part of the release notes that a C++ compiler is no longer required
> >> and mention that the configure options to specify it will go away in
> >> a future release.
> >
> > I guess the last use is from the Guest Agent on Windows...
> >
> > $ git ls-files | fgrep .cpp
> > qga/vss-win32/install.cpp
> > qga/vss-win32/provider.cpp
> > qga/vss-win32/requester.cpp
>
> Yes, I think the c++ configure options are still required for that Windows
> stuff ... but IIRC Paolo once mentioned that we could simplify the linker
> logic in configure or meson.build once the nanomips stuff has been
> converted, since we now do not have to mix C and C++ linkage anymore?
>

Yes, it can be simplified to remove the link_language checks.

Paolo

>

--00000000000037ddb905ecf9dc0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 8 nov 2022, 16:09 Thomas Huth &lt;<a href=3D"ma=
ilto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">&gt;&gt; If it is the last thing, we should put in=
 the &quot;Build Dependencies&quot;<br>
&gt;&gt; part of the release notes that a C++ compiler is no longer require=
d<br>
&gt;&gt; and mention that the configure options to specify it will go away =
in<br>
&gt;&gt; a future release.<br>
&gt; <br>
&gt; I guess the last use is from the Guest Agent on Windows...<br>
&gt; <br>
&gt; $ git ls-files | fgrep .cpp<br>
&gt; qga/vss-win32/install.cpp<br>
&gt; qga/vss-win32/provider.cpp<br>
&gt; qga/vss-win32/requester.cpp<br>
<br>
Yes, I think the c++ configure options are still required for that Windows =
<br>
stuff ... but IIRC Paolo once mentioned that we could simplify the linker <=
br>
logic in configure or meson.build once the nanomips stuff has been <br>
converted, since we now do not have to mix C and C++ linkage anymore?=C2=A0=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Yes, it can be simplified to remove the link_language checks.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000037ddb905ecf9dc0f--


