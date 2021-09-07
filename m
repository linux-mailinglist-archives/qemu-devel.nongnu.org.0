Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68716402EBF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 21:07:42 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNgRY-0003BZ-Up
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 15:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNgQD-0002RM-Sw
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 15:06:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNgQC-00081w-19
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 15:06:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so127078wmq.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BsMtAw6yiah262Fx17PuUxNErMIzNN0XmxO4goOJ4ws=;
 b=ItBYJmN4ck2pDGjtZ0ULQxHu9F65tJA2uaocCvzuFS9851Xzn4B/WP3VXutBEv7klr
 OOUuSBQnTFwA0OpNOfEYsGqrHPZq3m1mpPPucNvV98ZY5ufoFmdaRsD23fN4JohpMTPR
 cIsWzlLf3COmhwPihlTDWuYZKXS14uPlrNRGsDFZLdIevvHqgx2bn/Fwlvvcoc81H+9W
 WBa3DobubDpMO5u2pxWSpxoXRhxLWa2xmdNY33foNM28TRziT60KN7OMXoJUL3Nfh9nI
 kXRo41KuUAqQOGVclekHc0NFcxqhYeZzmLqQZwof0A7ogb7xHiM4yd2QRraeYm0TV8Rs
 fKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsMtAw6yiah262Fx17PuUxNErMIzNN0XmxO4goOJ4ws=;
 b=U/f6MORQljGo3it3/7RDapLt8rXhe3VD2WVn9xunG8H3swGN8K6OD/l5iicBlGjf9j
 afyjU8meaWhr0/VJs9LEmKq5W1byKFuHKP8d4W1Mcs3ZK//M6U51131NJd6RCICEmDrz
 JFFV5bQaWLxYzt9vXWgk0lZYe1cJGPiPKHy/bpyNbE6tkqIPh0FBme1aAIrYuPDAy/57
 5B78V69qi8j46FR68jzHWiGhHDeMz4DLfSlQYPv4U/WQ6pcCwuLkMRVd7tOVuY+km03w
 zzp6YWZ5MjVywr/ms/2WOZ3RbzFBarfzarr1C+ozeMccrPvAwkWO/+Imr8dSp2z+XP2n
 qXHA==
X-Gm-Message-State: AOAM533LyfKPHOruGN1fnRXykP1UFGbt/dLJl7fn/KIFMMHl+FTZNTf0
 r+D4H00TlyY1mniENtEKB+wbg+F0JtL4KglpUKI=
X-Google-Smtp-Source: ABdhPJxNLPEiQMjqIckKRSA8pqr1rFaPFlMTc/RYDiG92FtIh7+5pdKkG8rCAKnMUvDd/Au4VOkljzGPaFqIvDEp7z8=
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr5640533wmk.96.1631041573288;
 Tue, 07 Sep 2021 12:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210907172625.227568-1-pbonzini@redhat.com>
In-Reply-To: <20210907172625.227568-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Sep 2021 23:06:00 +0400
Message-ID: <CAJ+F1CJcj4rqMJmq0H01Wus4rJu0pZQXWG3RqO=Q0XT+n_z6NQ@mail.gmail.com>
Subject: Re: [PATCH] meson: look up cp and dtrace with find_program()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097025005cb6c757d"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000097025005cb6c757d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 7, 2021 at 9:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Avoid that meson prints a "Program xyz found" test once per
> custom_target.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Is there a meson bug already?


> ---
>  pc-bios/keymaps/meson.build | 3 ++-
>  trace/meson.build           | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 05eda6c0d2..44247a12b5 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -38,6 +38,7 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in
> config_host
>  else
>    native_qemu_keymap =3D qemu_keymap
>  endif
> +cp =3D find_program('cp')
>
>  t =3D []
>  foreach km, args: keymaps
> @@ -55,7 +56,7 @@ foreach km, args: keymaps
>                         build_by_default: true,
>                         input: km,
>                         output: km,
> -                       command: ['cp', '@INPUT@', '@OUTPUT@'],
> +                       command: [cp, '@INPUT@', '@OUTPUT@'],
>                         install: true,
>                         install_dir: qemu_datadir / 'keymaps')
>    endif
> diff --git a/trace/meson.build b/trace/meson.build
> index 74c3214a13..54e509c17c 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -2,6 +2,7 @@
>  specific_ss.add(files('control-target.c'))
>
>  trace_events_files =3D []
> +dtrace =3D find_program('dtrace')
>  foreach dir : [ '.' ] + trace_events_subdirs
>    trace_events_file =3D meson.project_source_root() / dir / 'trace-event=
s'
>    trace_events_files +=3D [ trace_events_file ]
> @@ -39,13 +40,13 @@ foreach dir : [ '.' ] + trace_events_subdirs
>      trace_dtrace_h =3D custom_target(fmt.format('trace-dtrace', 'h'),
>                                     output: fmt.format('trace-dtrace',
> 'h'),
>                                     input: trace_dtrace,
> -                                   command: [ 'dtrace', '-DSTAP_SDT_V2',
> '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
> +                                   command: [ dtrace, '-DSTAP_SDT_V2',
> '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
>      trace_ss.add(trace_dtrace_h)
>      if host_machine.system() !=3D 'darwin'
>        trace_dtrace_o =3D custom_target(fmt.format('trace-dtrace', 'o'),
>                                       output: fmt.format('trace-dtrace',
> 'o'),
>                                       input: trace_dtrace,
> -                                     command: [ 'dtrace',
> '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
> +                                     command: [ dtrace, '-DSTAP_SDT_V2',
> '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
>        trace_ss.add(trace_dtrace_o)
>      endif
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000097025005cb6c757d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 9:27 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Avo=
id that meson prints a &quot;Program xyz found&quot; test once per<br>
custom_target.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div><br></div=
><div><div>Is there a meson bug already?</div><div> </div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0pc-bios/keymaps/meson.build | 3 ++-<br>
=C2=A0trace/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<b=
r>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build<br>
index 05eda6c0d2..44247a12b5 100644<br>
--- a/pc-bios/keymaps/meson.build<br>
+++ b/pc-bios/keymaps/meson.build<br>
@@ -38,6 +38,7 @@ if meson.is_cross_build() or &#39;CONFIG_XKBCOMMON&#39; n=
ot in config_host<br>
=C2=A0else<br>
=C2=A0 =C2=A0native_qemu_keymap =3D qemu_keymap<br>
=C2=A0endif<br>
+cp =3D find_program(&#39;cp&#39;)<br>
<br>
=C2=A0t =3D []<br>
=C2=A0foreach km, args: keymaps<br>
@@ -55,7 +56,7 @@ foreach km, args: keymaps<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 build_by_default: true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 input: km,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 output: km,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0command: [&#39;cp&#39;, &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;],<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0command: [cp, &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install: true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install_dir: qemu_datadir / &#39;keymaps&#39;)<br>
=C2=A0 =C2=A0endif<br>
diff --git a/trace/meson.build b/trace/meson.build<br>
index 74c3214a13..54e509c17c 100644<br>
--- a/trace/meson.build<br>
+++ b/trace/meson.build<br>
@@ -2,6 +2,7 @@<br>
=C2=A0specific_ss.add(files(&#39;control-target.c&#39;))<br>
<br>
=C2=A0trace_events_files =3D []<br>
+dtrace =3D find_program(&#39;dtrace&#39;)<br>
=C2=A0foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>
=C2=A0 =C2=A0trace_events_file =3D meson.project_source_root() / dir / &#39=
;trace-events&#39;<br>
=C2=A0 =C2=A0trace_events_files +=3D [ trace_events_file ]<br>
@@ -39,13 +40,13 @@ foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br=
>
=C2=A0 =C2=A0 =C2=A0trace_dtrace_h =3D custom_target(fmt.format(&#39;trace-=
dtrace&#39;, &#39;h&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: fmt.format(&#3=
9;trace-dtrace&#39;, &#39;h&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: trace_dtrace,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [ &#39;dtrace&=
#39;, &#39;-DSTAP_SDT_V2&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;, &#39;-h&#3=
9;, &#39;-s&#39;, &#39;@INPUT@&#39; ])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [ dtrace, &#39=
;-DSTAP_SDT_V2&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;, &#39;-h&#39;, &#39;-=
s&#39;, &#39;@INPUT@&#39; ])<br>
=C2=A0 =C2=A0 =C2=A0trace_ss.add(trace_dtrace_h)<br>
=C2=A0 =C2=A0 =C2=A0if host_machine.system() !=3D &#39;darwin&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_dtrace_o =3D custom_target(fmt.format(&#39=
;trace-dtrace&#39;, &#39;o&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: fmt.for=
mat(&#39;trace-dtrace&#39;, &#39;o&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: trace_dt=
race,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [ &#39;=
dtrace&#39;, &#39;-DSTAP_SDT_V2&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;, &#3=
9;-G&#39;, &#39;-s&#39;, &#39;@INPUT@&#39; ])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [ dtrac=
e, &#39;-DSTAP_SDT_V2&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;, &#39;-G&#39;,=
 &#39;-s&#39;, &#39;@INPUT@&#39; ])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_ss.add(trace_dtrace_o)<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000097025005cb6c757d--

