Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414E4F291A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 10:39:20 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbeid-0005KF-1q
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 04:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nbeXo-0003KE-3G
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nbeXk-0007kx-GY
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649147282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4eOoUy8c44qgp7lmiNfzras4/t7WkYibQOphPFoiOCM=;
 b=cB4StaOV38+4noyU8SElk6pWDKH9At+0svXBvmW+nfFmO6x161+ElueKVseuqygxQY7d3m
 kQmcBaGkAaEuK0q/66uXGCtkqQCnNINom4icXDU/RB9Xo/mnvFcuVhJxOScAP4xts0VrWG
 sNcAkJIVovm3COruMGmGGBiIccdJ8Fs=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-1XVGkoqkMj2t0avkJv_J7A-1; Tue, 05 Apr 2022 04:28:01 -0400
X-MC-Unique: 1XVGkoqkMj2t0avkJv_J7A-1
Received: by mail-yb1-f200.google.com with SMTP id
 23-20020a250b17000000b0063d9e24cde4so6362966ybl.3
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 01:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eOoUy8c44qgp7lmiNfzras4/t7WkYibQOphPFoiOCM=;
 b=VzE34Fl+Kv/KI8T5+IqG4eXXV5IwIy6wtYZb3rRnu2GcI5bGam14ZNVBfHrztlVpnn
 BhdPLZy99jJUpmNMj6TfRk2mo0syicX5n/V3/wdfya34su5FtV5ExvNzCzMAvJNIhyWR
 a3UvoKfLmXhI8IW2IO+/yItm1zXj5AAEW50ivMKdH51cnPtpUz6wFU0ueqED3hDCWlc+
 X3rbUFCOwdjCwv3k5g4tqZu+VeSKdEUx2sqS5p6ucezW6MMPUGkaU33uhIWotHERZOfw
 6ctuOX4DYvabmFNb1T8VyRUXH/3zQf6HWWsI6b/dAxcv37T3FvYKmf2DPXQoVBo5OigW
 AIkQ==
X-Gm-Message-State: AOAM532mo/A5LdlG/RR1Y1G2KA7//HyEvd+HqrqtQIRslHNzx+r/YN7M
 HLjVDTvAY9NftMu04SGLn4pUA3cvm4Cg7AM1T4mI/kQ//AkjoDieXCelirJVPeScsNcHMxVRHWJ
 zWLEHZfzzU7nJl5fZtjoSmZVbHit4M1Q=
X-Received: by 2002:a0d:fa07:0:b0:2e5:868c:8b48 with SMTP id
 k7-20020a0dfa07000000b002e5868c8b48mr1595165ywf.471.1649147280844; 
 Tue, 05 Apr 2022 01:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCdGThU0k5TLZQLB2Wfe6ERVJNZGGg2bKY58gPgkF8kdWtMsG8i/xOhkMfzb9VJm25y/ITGU+45zmj1XXwlXI=
X-Received: by 2002:a0d:fa07:0:b0:2e5:868c:8b48 with SMTP id
 k7-20020a0dfa07000000b002e5868c8b48mr1595157ywf.471.1649147280699; Tue, 05
 Apr 2022 01:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
In-Reply-To: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 5 Apr 2022 11:27:49 +0300
Message-ID: <CAPMcbCqKYTdOCUMF_Bjt_E20kfToHTc1VCNVAjrHkC2bpL+qNQ@mail.gmail.com>
Subject: Re: [PATCH-for-7.0 v2] qga/vss-win32: fix compilation with clang++
To: qemu-devel@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d9472905dbe40586"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Helge Konetzka <hk@zapateado.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d9472905dbe40586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Mar 16, 2022 at 3:58 PM Helge Konetzka <hk@zapateado.de> wrote:

> This fixes:
>
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
> type 'char *' with an rvalue of type 'const char *'
>      char *msg =3D NULL, *nul =3D strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Compiling with clang++ of msys2 toolchain clang64 leads to
>
> [1445/1747] Compiling C++ object
> qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> ...
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
> type 'char *' with an rvalue of type 'const char *'
>      char *msg =3D NULL, *nul =3D strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:163: run-ninja] Error 1
> =3D=3D> ERROR: A failure occurred in build().
>      Aborting...
> ---
>   qga/vss-win32/install.cpp | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index 8076efe3cb..b57508fbe0 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
>        * If text doesn't contains '(', negative precision is given, which
> is
>        * treated as though it were missing.
>        */
> -    char *msg =3D NULL, *nul =3D strchr(text, '(');
> +    char *msg =3D NULL;
> +    const char *nul =3D strchr(text, '(');
>       int len =3D nul ? nul - text : -1;
>
>       FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
> --
> 2.30.2
>
>

--000000000000d9472905dbe40586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 1=
6, 2022 at 3:58 PM Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" ta=
rget=3D"_blank">hk@zapateado.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">This fixes:<br>
<br>
qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of<br>
type &#39;char *&#39; with an rvalue of type &#39;const char *&#39;<br>
=C2=A0 =C2=A0 =C2=A0char *msg =3D NULL, *nul =3D strchr(text, &#39;(&#39;);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~<br>
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
Compiling with clang++ of msys2 toolchain clang64 leads to<br>
<br>
[1445/1747] Compiling C++ object qga/vss-win32/qga-vss.dll.p/install.cpp.ob=
j<br>
FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj<br>
...<br>
qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of <br=
>
type &#39;char *&#39; with an rvalue of type &#39;const char *&#39;<br>
=C2=A0 =C2=A0 =C2=A0char *msg =3D NULL, *nul =3D strchr(text, &#39;(&#39;);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~<br>
1 error generated.<br>
ninja: build stopped: subcommand failed.<br>
make: *** [Makefile:163: run-ninja] Error 1<br>
=3D=3D&gt; ERROR: A failure occurred in build().<br>
=C2=A0 =C2=A0 =C2=A0Aborting...<br>
---<br>
=C2=A0 qga/vss-win32/install.cpp | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
index 8076efe3cb..b57508fbe0 100644<br>
--- a/qga/vss-win32/install.cpp<br>
+++ b/qga/vss-win32/install.cpp<br>
@@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* If text doesn&#39;t contains &#39;(&#39;, nega=
tive precision is given, which is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* treated as though it were missing.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 char *msg =3D NULL, *nul =3D strchr(text, &#39;(&#39;);<br>
+=C2=A0 =C2=A0 char *msg =3D NULL;<br>
+=C2=A0 =C2=A0 const char *nul =3D strchr(text, &#39;(&#39;);<br>
=C2=A0 =C2=A0 =C2=A0 int len =3D nul ? nul - text : -1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000d9472905dbe40586--


