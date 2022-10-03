Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432BF5F3190
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:57:34 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLwq-0002wI-23
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLp6-0001TE-K9
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLp4-0002uT-2Q
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664804969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XrGPEeRFqKp9ccg+KQX6Qdn+sSsSjAQVIO+1kvnrJNU=;
 b=YF5kPgq3vYtWWARnvMK0Yq1M70YakjkGQixtp7DSpcSs/JnwYmyBxUBZRCuwp0fW8UYVX9
 WY5pu2B+uYU8ZO+7aNyZa/VgADoYwsphrMz07BQeBWtKhCSDpLf+zjFHFsZSU3Y9aFc7pF
 T5vb7Ncwj6XTyTCZ1zWR5Po5dN3rjBo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-Aasdw7pRMY-RZWTh_EWMSg-1; Mon, 03 Oct 2022 09:49:27 -0400
X-MC-Unique: Aasdw7pRMY-RZWTh_EWMSg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-355ae0f4d3dso98679017b3.14
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XrGPEeRFqKp9ccg+KQX6Qdn+sSsSjAQVIO+1kvnrJNU=;
 b=j/SBMj9ODotlaXtOjipsdZ+TTx0yFmVP7ThxA1wghwj5ig2BudViheEtegVHCZSQVw
 KeQY/COwQBTYtVYKL4ydkjTZ1vWX8ltgfLV1PHNzYtQ3bdqy/9xwpG11yFFDhh5SoTcH
 Nil15y0Zgqe+KA87U2gFL4obqWwMFiTh+piKrA+pIGsOLpAmSkip8+4Xh9LJLToVJFY3
 wzjSoj+c/74RXTlMuiWD19996ARs2txUM21SvBa/8L69HcV36DR+LQ0G2pqYvEukmyHM
 HVHp+xAj0q6fAlXNjA0B271On3VXb1nvKxynUYunro6wgClVPwR249iVYTpYos9sAM/e
 h0xw==
X-Gm-Message-State: ACrzQf2UIOHrFHVjnmze+g3qfEmwbcuz+CtuXcc3uIK3z03F2X7jGwEX
 lsrH8TkqzxjRFmOfEtY6vTlRRTW9ZDTAKUNkut+BdHnnpuYMK2gdfgZxciSkawCDxjU6oe80R/n
 w/gzOwUaImaxbDDjYnuFtedJPptH5xZA=
X-Received: by 2002:a25:b74b:0:b0:6b7:76a:6a5 with SMTP id
 e11-20020a25b74b000000b006b7076a06a5mr20594564ybm.432.1664804967198; 
 Mon, 03 Oct 2022 06:49:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oW1spPHVOJFa6OzqjZB3mk2w57UAN3aZ9QlEk4TFdflU50NBDThwO7OLUt6pgyyZMS3ycRLSwy9mqZZiq3zg=
X-Received: by 2002:a25:b74b:0:b0:6b7:76a:6a5 with SMTP id
 e11-20020a25b74b000000b006b7076a06a5mr20594553ybm.432.1664804966988; 
 Mon, 03 Oct 2022 06:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-8-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221003093911.1844031-8-alexander.ivanov@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Oct 2022 16:49:15 +0300
Message-ID: <CAPMcbCpLOGm4Q4H=ygSnN=puqFtnL3LBBxSOG2kMzcnKxU7B7g@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] qga: Add HW address getting for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 marcandre.lureau@gmail.com
Content-Type: multipart/alternative; boundary="000000000000ad93f305ea219c97"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000ad93f305ea219c97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Oct 3, 2022 at 12:39 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Replace a dumb function in commands-bsd.c by the code of HW address
> getting.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-bsd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index 40f7ec7600..5f423a4710 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -20,6 +20,8 @@
>  #include <sys/param.h>
>  #include <sys/ucred.h>
>  #include <sys/mount.h>
> +#include <net/if_dl.h>
> +#include <net/ethernet.h>
>  #include <paths.h>
>
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> @@ -179,7 +181,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>  int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
>                        bool *obtained, Error **errp)
>  {
> +    struct sockaddr_dl *sdp;
> +
>      *obtained =3D false;
> +    if (ifa->ifa_addr->sa_family !=3D AF_LINK) {
> +        /* We can get HW address only for AF_LINK family. */
> +        g_debug("failed to get MAC address of %s", ifa->ifa_name);
> +        return 0;
> +    }
> +
> +    sdp =3D (struct sockaddr_dl *)ifa->ifa_addr;
> +    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
> +    *obtained =3D true;
> +
>      return 0;
>  }
>  #endif /* HAVE_GETIFADDRS */
> --
> 2.34.1
>
>

--000000000000ad93f305ea219c97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3=
, 2022 at 12:39 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@=
virtuozzo.com">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Replace a dumb function in com=
mands-bsd.c by the code of HW address<br>
getting.<br>
<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-bsd.c | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index 40f7ec7600..5f423a4710 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -20,6 +20,8 @@<br>
=C2=A0#include &lt;sys/param.h&gt;<br>
=C2=A0#include &lt;sys/ucred.h&gt;<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
+#include &lt;net/if_dl.h&gt;<br>
+#include &lt;net/ethernet.h&gt;<br>
=C2=A0#include &lt;paths.h&gt;<br>
<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
@@ -179,7 +181,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp=
)<br>
=C2=A0int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool *obtained, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 struct sockaddr_dl *sdp;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0*obtained =3D false;<br>
+=C2=A0 =C2=A0 if (ifa-&gt;ifa_addr-&gt;sa_family !=3D AF_LINK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We can get HW address only for AF_LINK fami=
ly. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to get MAC address of %s&=
quot;, ifa-&gt;ifa_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sdp =3D (struct sockaddr_dl *)ifa-&gt;ifa_addr;<br>
+=C2=A0 =C2=A0 memcpy(buf, sdp-&gt;sdl_data + sdp-&gt;sdl_nlen, ETHER_ADDR_=
LEN);<br>
+=C2=A0 =C2=A0 *obtained =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
=C2=A0#endif /* HAVE_GETIFADDRS */<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000ad93f305ea219c97--


