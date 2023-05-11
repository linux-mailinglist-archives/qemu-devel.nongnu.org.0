Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C306FF6E0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:15:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8w0-00077k-W0; Thu, 11 May 2023 12:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px8vz-00076Q-7W
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px8vx-0001Im-JN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683821664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAgNQ76oqWisqXMSQPCdukNBnQCr8ABM1Zb6YKFC+ow=;
 b=de5a4R7mC8PJoNUHKDhi4U0MR0IfyiOqjPpHVqomwvy9VxAkZUQdknAi3288nm/jSThkBu
 Hmr/LBLloUyVVuFbaF8p+L53kHTrFgYk+1RDOulNeLKpL19VJABRSc8bpgMNOY6zZ1MIBw
 BpP9HaZWfyfUXDBRkFxEsXsA51+ix28=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-sR_3day7OI6VwSvT3jThmw-1; Thu, 11 May 2023 12:14:22 -0400
X-MC-Unique: sR_3day7OI6VwSvT3jThmw-1
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-780e23ab096so1379017241.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683821662; x=1686413662;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAgNQ76oqWisqXMSQPCdukNBnQCr8ABM1Zb6YKFC+ow=;
 b=PqfU+/CujywbWYHECHyyeYH9C3tLsTRlzZ25GsOVZBhPx1ELJQj9T4j5S9Wi5jKcyi
 44Wk0+WIBX5pc+FrRTwN917DlzmmUQfCcgn9/uXtDEbv7Ck05S1tgqig1kIaQXRC8Glx
 yWtBISGlT3fIYw4lfM4ZZKvuPdJptMqiLTOlnTmt9BmrrhEW8wS91K6MHTm1D0elNXbV
 AG6XRipvOTFdnAqph/ZoHo4o2h8RVrN1/4xRx7spTyTZ+UCg6oMwB2yW3h32MCD3/1C6
 cnnqBbn/+xGYnzugO5himRUqbbPTxUCiRMYDymhvMTfeOI8Hsbq9udHeBlrkkVcJ1X/a
 stpw==
X-Gm-Message-State: AC+VfDzwv5R5LhsRpqMIwWGOGoVlNvFcDvs7GS3CL6innqQn1F2bXi3G
 wb+ZUZAUb2LmwiPKQguTh4cjKU4c0IDuuDlWRS5vRsVs68m8eqICo9ZxoMYJg3+n/re7hvkdu+s
 aLJAIZFWmlaJWNIMvyseCckUCIC8K2A0=
X-Received: by 2002:a05:6102:d3:b0:434:89e3:5a39 with SMTP id
 u19-20020a05610200d300b0043489e35a39mr7710988vsp.10.1683821661907; 
 Thu, 11 May 2023 09:14:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7loAKXoPF6PBNY+1nDIspfvLL1f3dnBmnpvGpfm1D6iiSOh9cGZ7okM9R0RW5DkPkVz/KVRYvxOXweqOR7YJo=
X-Received: by 2002:a05:6102:d3:b0:434:89e3:5a39 with SMTP id
 u19-20020a05610200d300b0043489e35a39mr7710952vsp.10.1683821661666; Thu, 11
 May 2023 09:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-28-jsnow@redhat.com>
 <ac20b31a-5018-186f-3d7c-ea9d7d0f11c4@redhat.com>
 <CAFn=p-axwgCSju3e86rRHMBbdSkYiTMPaaL857DO+4bW5fu9WQ@mail.gmail.com>
In-Reply-To: <CAFn=p-axwgCSju3e86rRHMBbdSkYiTMPaaL857DO+4bW5fu9WQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 May 2023 18:14:10 +0200
Message-ID: <CABgObfYHpiHuRkFDVFU8YovqUqETzQBse9-tK7C+69VMFfrS2w@mail.gmail.com>
Subject: Re: [PATCH 27/27] mkvenv.py: experiment; use distlib to generate
 script entry points
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
Content-Type: multipart/alternative; boundary="000000000000024fd705fb6d48f1"
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

--000000000000024fd705fb6d48f1
Content-Type: text/plain; charset="UTF-8"

Il gio 11 mag 2023, 17:58 John Snow <jsnow@redhat.com> ha scritto:

> I'll make that simplifying change, which will also allow me to just put
>> the import in the global scope instead of trying to do it JIT to work
>> around ensurepip shenanigans. Should be a few less "I know this is bad"
>> comments for the linters, too.
>
>
I don't think you can do that because, until you are running in the new
venv, you aren't guaranteed to have either distlib or pip. Once in the venv
you'll get the latter via ensurepip, if it wasn't already present in the
system site-packages.

Paolo

--js
>
>>

--000000000000024fd705fb6d48f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Il gio 11 mag 2023, 17:58 John Snow &lt;<a hr=
ef=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">I&#39;ll make that simplifying chang=
e, which will also allow me to just put the import in the global scope inst=
ead of trying to do it JIT to work around ensurepip shenanigans. Should be =
a few less &quot;I know this is bad&quot; comments for the linters, too.</b=
lockquote></div></div></div></blockquote></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I don&#39;t think you can do that because, until you are =
running in the new venv, you aren&#39;t guaranteed to have either distlib o=
r pip. Once in the venv you&#39;ll get the latter via ensurepip, if it wasn=
&#39;t already present in the system site-packages.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div cla=
ss=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
auto"><div dir=3D"auto">--js<br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000024fd705fb6d48f1--


