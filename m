Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64731600BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:57:39 +0200 (CEST)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMsM-0008IQ-DJ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhf-00024H-5X
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhL-000623-DZ
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665999974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TtjzYQEqhAYPY/z/T1NNlsYM3eHi83vk4TEM3NM5YyQ=;
 b=CLX2q9TV9MGkgYfx8XESHhWybKbZ2bd3ZKNc9SwsI6qNb3sOHyD4Hm8LwQAgZBNI51ZrJ8
 Mmaoy6mQE4D2PPkncvgx55c/W/29f6NVWdVUZxsHGeMc+yE3JFFYiJbifteeObjjgtIxkd
 W9OiiaBORIvXb/y1woki82XuqVYi/WQ=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-MZ3OzsTmPkSm4kseyqWoVQ-1; Mon, 17 Oct 2022 05:46:12 -0400
X-MC-Unique: MZ3OzsTmPkSm4kseyqWoVQ-1
Received: by mail-io1-f70.google.com with SMTP id
 23-20020a5d9c57000000b006bbd963e8adso6557563iof.19
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TtjzYQEqhAYPY/z/T1NNlsYM3eHi83vk4TEM3NM5YyQ=;
 b=7oTFdoT6rrPL1eXHYv0TvM5DH9Q/5OunpDxLw5a93Mwwg5r6txSk/7RN2BXJituaiW
 4w00B4tMobwbja4CjSAwFciCXneVMO7xy+pup8lbCQk9il1a9/l/UoJud1l0/0e2KN4C
 R8zduMO5J3KV49u/v3rkMyGX8hlyynxFV10aWDm3+8ywm4I+s+i7neZhfPZU+VgFT9KF
 asovyM59jwpSRgcXhJaSb6yxSpzkWXRNYw2czJPEz8gYC2QjlnQ1plI+3TrF4Elwbj4v
 DJtaZyzq7ulFtH2dvJ8+faiPYcYAQrNrKo4/ZPrwyc/WYMKS7Q4rsyNmSgjX31QoVfUX
 XKDA==
X-Gm-Message-State: ACrzQf2qTobmQFPjgOzZG6pFJF2WUpJ39K5L6fBSp+WsI7k0td+AxUD4
 c0jqRaI04Ps1rK4elTPMXmndInjfUwsaUJoCNKwEAXbIcIEQzNHyveoY4CZypd5GoyyPFqJq4Ap
 3zM6J14Zp3kNwgF+TLjNj1Nk59Jiht2Q=
X-Received: by 2002:a92:d441:0:b0:2f9:b6e7:4271 with SMTP id
 r1-20020a92d441000000b002f9b6e74271mr4152303ilm.217.1665999971901; 
 Mon, 17 Oct 2022 02:46:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64+TCMuW30h4zEJ8ev9wX3KGkGGKvSk4/VabG7xLnfyzV6h5dFcQR5lSGznZP3cz/o4p11wbw1pa6pXiJWYrA=
X-Received: by 2002:a92:d441:0:b0:2f9:b6e7:4271 with SMTP id
 r1-20020a92d441000000b002f9b6e74271mr4152287ilm.217.1665999971678; Mon, 17
 Oct 2022 02:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-2-frankja@linux.ibm.com>
In-Reply-To: <20221017083822.43118-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 Oct 2022 13:45:54 +0400
Message-ID: <CAMxuvaz52Ewy7ekKnK6ntPXXABgzLznZTNjmEssTCokkGiYi8w@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] dump: Use a buffer for ELF section data and
 headers
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="0000000000008214bd05eb37d8ce"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--0000000000008214bd05eb37d8ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 12:39 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> Currently we're writing the NULL section header if we overflow the
> physical header number in the ELF header. But in the future we'll add
> custom section headers AND section data.
>
> To facilitate this we need to rearange section handling a bit. As with
> the other ELF headers we split the code into a prepare and a write
> step.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




> ---
>  dump/dump.c           | 79 +++++++++++++++++++++++++++++--------------
>  include/sysemu/dump.h |  2 ++
>  2 files changed, 55 insertions(+), 26 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 236559b03a..e7a3b54ebe 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -380,31 +380,60 @@ static void write_elf_phdr_note(DumpState *s, Error
> **errp)
>      }
>  }
>
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static void prepare_elf_section_hdr_zero(DumpState *s)
>  {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> +    if (dump_is_64bit(s)) {
> +        Elf64_Shdr *shdr64 =3D s->elf_section_hdrs;
> +
> +        shdr64->sh_info =3D cpu_to_dump32(s, s->phdr_num);
> +    } else {
> +        Elf32_Shdr *shdr32 =3D s->elf_section_hdrs;
> +
> +        shdr32->sh_info =3D cpu_to_dump32(s, s->phdr_num);
> +    }
> +}
> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero
> +     */
> +    sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
> +    len =3D sizeof_shdr * s->shdr_num;
> +    s->elf_section_hdrs =3D g_malloc0(len);
> +
> +    /*
> +     * The first section header is ALWAYS a special initial section
> +     * header.
> +     *
> +     * The header should be 0 with one exception being that if
> +     * phdr_num is PN_XNUM then the sh_info field contains the real
> +     * number of segment entries.
> +     *
> +     * As we zero allocate the buffer we will only need to modify
> +     * sh_info for the PN_XNUM case.
> +     */
> +    if (s->phdr_num >=3D PN_XNUM) {
> +        prepare_elf_section_hdr_zero(s);
> +    }
> +}
> +
> +static void write_elf_section_headers(DumpState *s, Error **errp)
> +{
> +    size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
>      int ret;
>
> -    if (type =3D=3D 0) {
> -        shdr_size =3D sizeof(Elf32_Shdr);
> -        memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> -        shdr =3D &shdr32;
> -    } else {
> -        shdr_size =3D sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> -        shdr =3D &shdr64;
> +    prepare_elf_section_hdrs(s);
> +
> +    ret =3D fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_sh=
dr,
> s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write section
> headers");
>      }
>
> -    ret =3D fd_write_vmcore(shdr, shdr_size, s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret,
> -                         "dump: failed to write section header table");
> -    }
> +    g_free(s->elf_section_hdrs);
>  }
>
>  static void write_data(DumpState *s, void *buf, int length, Error **errp=
)
> @@ -591,12 +620,10 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    /* write section to vmcore */
> -    if (s->shdr_num) {
> -        write_elf_section(s, 1, errp);
> -        if (*errp) {
> -            return;
> -        }
> +    /* write section headers to vmcore */
> +    write_elf_section_headers(s, errp);
> +    if (*errp) {
> +        return;
>      }
>
>      /* write notes to vmcore */
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index b62513d87d..9995f65dc8 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -177,6 +177,8 @@ typedef struct DumpState {
>      int64_t filter_area_begin;  /* Start address of partial guest memory
> area */
>      int64_t filter_area_length; /* Length of partial guest memory area *=
/
>
> +    void *elf_section_hdrs;     /* Pointer to section header buffer */
> +
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
>      uint32_t nr_cpus;           /* number of guest's cpu */
> --
> 2.34.1
>
>

--0000000000008214bd05eb37d8ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 12:39 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fr=
ankja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Currently we&#39;re writing the NULL section header if w=
e overflow the<br>
physical header number in the ELF header. But in the future we&#39;ll add<b=
r>
custom section headers AND section data.<br>
<br>
To facilitate this we need to rearange section handling a bit. As with<br>
the other ELF headers we split the code into a prepare and a write<br>
step.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r><br><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 79 ++++++++++++=
+++++++++++++++++--------------<br>
=C2=A0include/sysemu/dump.h |=C2=A0 2 ++<br>
=C2=A02 files changed, 55 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 236559b03a..e7a3b54ebe 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -380,31 +380,60 @@ static void write_elf_phdr_note(DumpState *s, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void write_elf_section(DumpState *s, int type, Error **errp)<br>
+static void prepare_elf_section_hdr_zero(DumpState *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Elf32_Shdr shdr32;<br>
-=C2=A0 =C2=A0 Elf64_Shdr shdr64;<br>
-=C2=A0 =C2=A0 int shdr_size;<br>
-=C2=A0 =C2=A0 void *shdr;<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Elf64_Shdr *shdr64 =3D s-&gt;elf_section_hdrs;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64-&gt;sh_info =3D cpu_to_dump32(s, s-&gt;=
phdr_num);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Elf32_Shdr *shdr32 =3D s-&gt;elf_section_hdrs;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32-&gt;sh_info =3D cpu_to_dump32(s, s-&gt;=
phdr_num);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void prepare_elf_section_hdrs(DumpState *s)<br>
+{<br>
+=C2=A0 =C2=A0 size_t len, sizeof_shdr;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Section ordering:<br>
+=C2=A0 =C2=A0 =C2=A0* - HDR zero<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) : size=
of(Elf32_Shdr);<br>
+=C2=A0 =C2=A0 len =3D sizeof_shdr * s-&gt;shdr_num;<br>
+=C2=A0 =C2=A0 s-&gt;elf_section_hdrs =3D g_malloc0(len);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The first section header is ALWAYS a special initial=
 section<br>
+=C2=A0 =C2=A0 =C2=A0* header.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* The header should be 0 with one exception being that=
 if<br>
+=C2=A0 =C2=A0 =C2=A0* phdr_num is PN_XNUM then the sh_info field contains =
the real<br>
+=C2=A0 =C2=A0 =C2=A0* number of segment entries.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* As we zero allocate the buffer we will only need to =
modify<br>
+=C2=A0 =C2=A0 =C2=A0* sh_info for the PN_XNUM case.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (s-&gt;phdr_num &gt;=3D PN_XNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf_section_hdr_zero(s);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void write_elf_section_headers(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr)=
 : sizeof(Elf32_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 if (type =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf32_Shdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr32, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr32;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf64_Shdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr64, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr64;<br>
+=C2=A0 =C2=A0 prepare_elf_section_hdrs(s);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D fd_write_vmcore(s-&gt;elf_section_hdrs, s-&gt;shdr_n=
um * sizeof_shdr, s);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret, &quot;dump: faile=
d to write section headers&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(shdr, shdr_size, s);<br>
-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dump: failed to write section header table&quot;);<b=
r>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(s-&gt;elf_section_hdrs);<br>
=C2=A0}<br>
<br>
=C2=A0static void write_data(DumpState *s, void *buf, int length, Error **e=
rrp)<br>
@@ -591,12 +620,10 @@ static void dump_begin(DumpState *s, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* write section to vmcore */<br>
-=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* write section headers to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_section_headers(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index b62513d87d..9995f65dc8 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -177,6 +177,8 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0int64_t filter_area_begin;=C2=A0 /* Start address of pa=
rtial guest memory area */<br>
=C2=A0 =C2=A0 =C2=A0int64_t filter_area_length; /* Length of partial guest =
memory area */<br>
<br>
+=C2=A0 =C2=A0 void *elf_section_hdrs;=C2=A0 =C2=A0 =C2=A0/* Pointer to sec=
tion header buffer */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *note_buf;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 buffer for notes */<br>
=C2=A0 =C2=A0 =C2=A0size_t note_buf_offset;=C2=A0 =C2=A0 =C2=A0/* the writi=
ng place in note_buf */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t nr_cpus;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* number of guest&#39;s cpu */<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000008214bd05eb37d8ce--


