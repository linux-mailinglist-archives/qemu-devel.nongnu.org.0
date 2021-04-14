Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD335EE61
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 09:34:15 +0200 (CEST)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWa2Q-0001tJ-Eo
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 03:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lWa1S-0001TC-BI
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:33:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lWa1Q-0001hY-IU
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:33:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id x4so22490248edd.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 00:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3IxtXXo1v/GGpL1EbxBq6LB3YJCEZlD2bAw2LUJVWI=;
 b=cpBJHpeMODzqm3LnbsGCNrlqjWTLCc0NhPzgaHHqvvL1pw9gjvpihgFUvZAQzsl+G9
 /KeaghquRR/DL0bwFLm/yBriH5wPNuHtDR7hpkjc7dNXQ8BcBLaDSqvvTAycvYXgZEnp
 FfPcmRyQERDrrr8Lm6V3DFtLHvSHO9rff8ur+qc8E9o+7H/vP8p3LjIo11wbJAwwqbiy
 mK263j8KUFCJELeA690XjTOn28j4FLbKECwLJxb60Vf8ykYpgQdq8UL5aCj5xZdSDNnf
 M0Bnj7gdmwiG+oVcmLxX/JyO+8dd7B5thQQPjF/AVAqq+JedSPKFIMZw0PB3vp3RdPbD
 ZTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3IxtXXo1v/GGpL1EbxBq6LB3YJCEZlD2bAw2LUJVWI=;
 b=LY2ZdsUJ+yP4i94iPBhDiUEy0uXTddq2yA8j8VVH9appCxT9drmPAj6a2hOIXUe7VZ
 544b401OFriIIHpo7PZRNtrvNf1CGp2WYOLcf6PTmRO9F0JSXeFAEisA7ed590gJWezO
 /itSjDQ57HV7xM9FHhBT32n24t+nG4Q1mfJroNx86gi9oXG27IqvQzgN0B39SZhdCBVQ
 fOd4KycMF+RqlUzrFyHNYu8MDUOJp/K5cUJbadtVzz9zwuPnUkqDcpqtkdN4hKWcCB54
 tzpIrcctU+ZwgsUmACIpYZiPq0LYtiT45bsDbjdvC/C9HXI5NngkYLcyyZaRRQrr8peF
 U+Vw==
X-Gm-Message-State: AOAM532j1LSsoDFBefLpRUb7Pfp82k92bNblnhtJeLPYP/aWL9ka2jhp
 tj0gXJwkNV4hprkMojUPDKkiOIzNLjNzwTPAKpY=
X-Google-Smtp-Source: ABdhPJxlow0Y+HLXP1yTQwhB6GXdV51PVVbNwpq1F6R1TMYOQaBMGUK7j2/xB3VOt0k4/gtwflScxlmV5xBFxuzJX0E=
X-Received: by 2002:aa7:da46:: with SMTP id w6mr40826487eds.30.1618385590476; 
 Wed, 14 Apr 2021 00:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210412170255.231406-1-sgarzare@redhat.com>
In-Reply-To: <20210412170255.231406-1-sgarzare@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 14 Apr 2021 11:32:58 +0400
Message-ID: <CAJ+F1CLoZGR-2QSuVqqCLo9EmCihW96famLn0qEQ8f+ZZw-PHA@mail.gmail.com>
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003ae40605bfe9c292"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ae40605bfe9c292
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 9:06 PM Stefano Garzarella <sgarzare@redhat.com>
wrote:

> get_relocated_path() allocates a GString object and returns the
> character data (C string) to the caller without freeing the memory
> allocated for that object as reported by valgrind:
>
>   24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>      by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C4827: g_string_sized_new (in
> /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x906314: get_relocated_path (cutils.c:1036)
>      by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
>      by 0x6E1F77: qemu_init (vl.c:2687)
>      by 0x3E3AF8: main (main.c:49)
>
> Let's use g_string_free(gstring, false) to free only the GString object
> and transfer the ownership of the character data to the caller.
>
> Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/cutils.c b/util/cutils.c
> index ee908486da..c9b91e7535 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>          g_string_append(result, dir - 1);
>      }
> -    return result->str;
> +    return g_string_free(result, false);
>  }
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003ae40605bfe9c292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 12, 2021 at 9:06 PM Stefa=
no Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com">sgarzare@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>get_relocated_path() allocates a GString object and returns the<br>
character data (C string) to the caller without freeing the memory<br>
allocated for that object as reported by valgrind:<br>
<br>
=C2=A0 24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,5=
32<br>
=C2=A0 =C2=A0 =C2=A0at 0x4839809: malloc (vg_replace_malloc.c:307)<br>
=C2=A0 =C2=A0 =C2=A0by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.=
6600.8)<br>
=C2=A0 =C2=A0 =C2=A0by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.=
so.0.6600.8)<br>
=C2=A0 =C2=A0 =C2=A0by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib=
-2.0.so.0.6600.8)<br>
=C2=A0 =C2=A0 =C2=A0by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.s=
o.0.6600.8)<br>
=C2=A0 =C2=A0 =C2=A0by 0x906314: get_relocated_path (cutils.c:1036)<br>
=C2=A0 =C2=A0 =C2=A0by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)<=
br>
=C2=A0 =C2=A0 =C2=A0by 0x6E1F77: qemu_init (vl.c:2687)<br>
=C2=A0 =C2=A0 =C2=A0by 0x3E3AF8: main (main.c:49)<br>
<br>
Let&#39;s use g_string_free(gstring, false) to free only the GString object=
<br>
and transfer the ownership of the character data to the caller.<br>
<br>
Fixes: f4f5ed2cbd (&quot;cutils: introduce get_relocated_path&quot;)<br>
Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com=
" target=3D"_blank">sgarzare@redhat.com</a>&gt;<br></blockquote><div><br></=
div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=
=A0 <br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
---<br>
=C2=A0util/cutils.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/util/cutils.c b/util/cutils.c<br>
index ee908486da..c9b91e7535 100644<br>
--- a/util/cutils.c<br>
+++ b/util/cutils.c<br>
@@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(G_IS_DIR_SEPARATOR(dir[-1]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append(result, dir - 1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return result-&gt;str;<br>
+=C2=A0 =C2=A0 return g_string_free(result, false);<br>
=C2=A0}<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003ae40605bfe9c292--

