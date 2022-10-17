Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A60F600BAB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:57:11 +0200 (CEST)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMru-0007m2-3F
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhf-00024L-74
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhL-00061u-D9
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665999972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jteS3FY+J3sIjeFV+d2W7NYe758nZsLb95Ze6zQT1Hw=;
 b=KWrrLhoffqm5D8xsQLYV8kcpF6zd+nJW81t3OiAZnFHHJuxnYjfaLoPQ7PRAPps4IWZaGH
 lWAgL4DlT4g+BoE1xE5x6FITXYtcZBiTcPmykV6Ek9xB7oqR9t16+MfCX0Q/LRGt6mQmou
 MuqFIXZt8PzpYOwTKpxWRuoVyzCttc0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-puuLnR2INqWic3WzHBC1KQ-1; Mon, 17 Oct 2022 05:46:08 -0400
X-MC-Unique: puuLnR2INqWic3WzHBC1KQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 m21-20020a0568080f1500b00350c7fc362cso3774323oiw.11
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jteS3FY+J3sIjeFV+d2W7NYe758nZsLb95Ze6zQT1Hw=;
 b=LOJNNT+YtIbP4mUoX753Dc5F28SIhaiaVs2lYv4HXNYsW/zV02G7Ix5DLMm40tBdEB
 4qHrRaOdB3ZGR82X6DuYQqyf/VbTKJFYRzUp1APs4kCMWVzibK++eCcSNiYzldVdovwA
 rxunPIznD7+g0DohjPQWgpWeB2IVLb7L70bqXDuxnFn0mjA8JcIqF/0iseAtgqCUMUaQ
 jr3Jq0+vEMd99eXVd73gTzJZ9MlQ0OIuuPbF//qo7bGqbXX6ALiA3cNzQzdeHYwuq9sh
 4dQb0R1UpyqokPwCfQOTDlZM446qCniiNVhehnJV5j7m+oieaChiAGG6EcB1rGEmV7T3
 lzkw==
X-Gm-Message-State: ACrzQf0wFpZOwRRhsJd9e21+Dm3UdMDJ0OWUFojxUtfKxtPec8DY5NqW
 VFV3CaQeujKAX1GOmkFPoj0T398U4q0nd6/j0L5i3cMV5kVA2H9GgUi9DeXwCgMyFilV2LPsJ4d
 TCtiFON5cx2TpOHIZ4uUYAb8djVXvGUE=
X-Received: by 2002:a05:6830:4a6:b0:661:8587:7000 with SMTP id
 l6-20020a05683004a600b0066185877000mr4792026otd.378.1665999967676; 
 Mon, 17 Oct 2022 02:46:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vJOKF6s0v4Y6BNuhTJ2k6BYTBsRRHr9eHVsuf9G4xzUvrIqdN/vG5fiPngzDdrZdTqrUpOxCneBrYd9a0u7g=
X-Received: by 2002:a05:6830:4a6:b0:661:8587:7000 with SMTP id
 l6-20020a05683004a600b0066185877000mr4792013otd.378.1665999967463; Mon, 17
 Oct 2022 02:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-3-frankja@linux.ibm.com>
In-Reply-To: <20221017083822.43118-3-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 Oct 2022 13:45:50 +0400
Message-ID: <CAMxuvay=aCL=rWdiP3fDva0Yum97N4mgMmXVOE7F=ZkYt-OHCA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] dump: Write ELF section headers right after ELF
 header
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="00000000000041c15005eb37d81e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041c15005eb37d81e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 12:39 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> Let's start bundling the writes of the headers and of the data so we
> have a clear ordering between them. Since the ELF header uses offsets
> to the headers we can freely order them.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  dump/dump.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index e7a3b54ebe..b168a25321 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  elf header |
>       *   --------------
> +     *   |  sctn_hdr   |
> +     *   --------------
>       *   |  PT_NOTE    |
>       *   --------------
>       *   |  PT_LOAD    |
> @@ -591,8 +593,6 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  PT_LOAD    |
>       *   --------------
> -     *   |  sec_hdr    |
> -     *   --------------
>       *   |  elf note   |
>       *   --------------
>       *   |  memory     |
> @@ -608,6 +608,12 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> +    /* write section headers to vmcore */
> +    write_elf_section_headers(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* write PT_NOTE to vmcore */
>      write_elf_phdr_note(s, errp);
>      if (*errp) {
> @@ -620,12 +626,6 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    /* write section headers to vmcore */
> -    write_elf_section_headers(s, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
>      /* write notes to vmcore */
>      write_elf_notes(s, errp);
>  }
> @@ -1868,16 +1868,13 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      }
>
>      if (dump_is_64bit(s)) {
> -        s->phdr_offset =3D sizeof(Elf64_Ehdr);
> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) *
> s->phdr_num;
> -        s->note_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> -        s->memory_offset =3D s->note_offset + s->note_size;
> +        s->shdr_offset =3D sizeof(Elf64_Ehdr);
> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> +        s->note_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) *
> s->phdr_num;
>      } else {
> -
> -        s->phdr_offset =3D sizeof(Elf32_Ehdr);
> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) *
> s->phdr_num;
> -        s->note_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) *
> s->shdr_num;
> -        s->memory_offset =3D s->note_offset + s->note_size;
> +        s->shdr_offset =3D sizeof(Elf32_Ehdr);
> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) *
> s->shdr_num;
> +        s->note_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) *
> s->phdr_num;
>      }
>
>      return;
> --
> 2.34.1
>
>

--00000000000041c15005eb37d81e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 12:39 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fr=
ankja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Let&#39;s start bundling the writes of the headers and o=
f the data so we<br>
have a clear ordering between them. Since the ELF header uses offsets<br>
to the headers we can freely order them.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 31 ++++++++++++++-----------------<br>
=C2=A01 file changed, 14 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index e7a3b54ebe..b168a25321 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 elf header |<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0|=C2=A0 sctn_hdr=C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 PT_NOTE=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 PT_LOAD=C2=A0 =C2=A0 |<br>
@@ -591,8 +593,6 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 PT_LOAD=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0|=C2=A0 sec_hdr=C2=A0 =C2=A0 |<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 elf note=C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 memory=C2=A0 =C2=A0 =C2=A0|<br>
@@ -608,6 +608,12 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* write section headers to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_section_headers(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0write_elf_phdr_note(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
@@ -620,12 +626,6 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* write section headers to vmcore */<br>
-=C2=A0 =C2=A0 write_elf_section_headers(s, errp);<br>
-=C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0write_elf_notes(s, errp);<br>
=C2=A0}<br>
@@ -1868,16 +1868,13 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D sizeof(Elf64_Ehdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D s-&gt;phdr_offset + size=
of(Elf64_Phdr) * s-&gt;phdr_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;shdr_offset + size=
of(Elf64_Shdr) * s-&gt;shdr_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_offset + s-=
&gt;note_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D sizeof(Elf64_Ehdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D s-&gt;shdr_offset + size=
of(Elf64_Shdr) * s-&gt;shdr_num;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;phdr_offset + size=
of(Elf64_Phdr) * s-&gt;phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D sizeof(Elf32_Ehdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D s-&gt;phdr_offset + size=
of(Elf32_Phdr) * s-&gt;phdr_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;shdr_offset + size=
of(Elf32_Shdr) * s-&gt;shdr_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_offset + s-=
&gt;note_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D sizeof(Elf32_Ehdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D s-&gt;shdr_offset + size=
of(Elf32_Shdr) * s-&gt;shdr_num;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;phdr_offset + size=
of(Elf32_Phdr) * s-&gt;phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000041c15005eb37d81e--


