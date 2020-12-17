Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C12DD0CB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:50:59 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kproA-0004N4-29
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprlp-0002nV-6b
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprln-00029F-3w
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608205710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MNmcd0ySR5s0OzorVD1y4iCDrsLYHldTsjCO++eGzmY=;
 b=SOjVj2pVayBcLNMw61y+djv+qTmDOi5UnMvma/MVbhdNBR06OApV1WhCMlVvw6KDgK3ayn
 H3ge18OuFpSXxE4VnxzYyDqcF4PsSfScQlwY20aWi4VFQfGA0eqbaPPN9sLXwn7BLthRLF
 jKyBdSYMfY6glMVqb14jKvq1OxVdQOg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-rvtoLOufP8yKNblafYFK3g-1; Thu, 17 Dec 2020 06:48:28 -0500
X-MC-Unique: rvtoLOufP8yKNblafYFK3g-1
Received: by mail-io1-f70.google.com with SMTP id y197so27018055iof.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MNmcd0ySR5s0OzorVD1y4iCDrsLYHldTsjCO++eGzmY=;
 b=poIU3TQCeKPXn5CcpP1vZNSSRQI5blH1ljS2tB9Y3nzZ058bXg+mWIs64SM2qRuaJX
 5oxTUf1kk+TqXQl4bEMcuF6Mr6b9M8NPDG0R5C/YMWk4+FAWnLPRcy/BAeeZityCibu/
 yznRx3HvTmIJtqcbzETX4dsuS7T0MAQnnpRwYf7RClBeH617fc5+ESlQFmFDq3y+SG0W
 dlT+t82dqnlwS8gc3yCoZabKUmD3dN3N8R/mkks9lo4MwkZjKkccqUYUtYdSChyEly+C
 rZk/ygA0BPJ5f6MNGjueTgQuViBZRWrC3YDhBSsDGB2KSn0uhJY/VzhG5hfpubuk9F/K
 KwxQ==
X-Gm-Message-State: AOAM532f7EjhF9NVKI+HE3BA14AsXAI6sjn1lXwBvAO4AQiX27Djh0xq
 IQw1AxBSK1qmXZTzSHganT/87rS+brjU6znhhPl/DUu/o2JHPQjHJMiwNkEAC/Nlp87H4EHmFw0
 ooiDAsz22DfZWRS0OabroVLJiXUFnKh0=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50069485ilm.161.1608205707592; 
 Thu, 17 Dec 2020 03:48:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwieXPgRVzfOv+8cLEbqnXSc7SLkP3Kq6OeKCYNQDsmNB7i8rFJoF4VEMrj8jCD8w1ABtS/18uE6jdYpV9ERYw=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50069482ilm.161.1608205707454; 
 Thu, 17 Dec 2020 03:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-3-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 15:48:16 +0400
Message-ID: <CAMxuvayuO-vOsghcnV8h=4dVR6g5ttg1VSuKhTtocSYk=zNLKw@mail.gmail.com>
Subject: Re: [PATCH 02/18] curl: remove compatibility code, require 7.29.0
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eb3fa205b6a79187"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eb3fa205b6a79187
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> cURL 7.16.0 was released in October 2006.  Just remove code that is
> in all likelihood not being used anywhere, and require the oldest version
> found in currently supported distros, which is 7.29.0 from CentOS 7.
>
> pkg-config is enough for QEMU, since it does not need extra information
> such as the path for certicate authorities.  All supported platforms
> today will all have pkg-config for curl, so we can drop curl-config.
>
> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  block/curl.c | 28 ----------------------------
>  configure    |  9 ++-------
>  2 files changed, 2 insertions(+), 35 deletions(-)
>
> diff --git a/block/curl.c b/block/curl.c
> index d24a4c5897..4ff895df8f 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -37,26 +37,6 @@
>
>  // #define DEBUG_VERBOSE
>
> -#if LIBCURL_VERSION_NUM >=3D 0x071000
> -/* The multi interface timer callback was introduced in 7.16.0 */
> -#define NEED_CURL_TIMER_CALLBACK
> -#define HAVE_SOCKET_ACTION
> -#endif
> -
> -#ifndef HAVE_SOCKET_ACTION
> -/* If curl_multi_socket_action isn't available, define it statically her=
e
> in
> - * terms of curl_multi_socket. Note that ev_bitmask will be ignored,
> which is
> - * less efficient but still safe. */
> -static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,
> -                                            curl_socket_t sockfd,
> -                                            int ev_bitmask,
> -                                            int *running_handles)
> -{
> -    return curl_multi_socket(multi_handle, sockfd, running_handles);
> -}
> -#define curl_multi_socket_action __curl_multi_socket_action
> -#endif
> -
>  #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
>                     CURLPROTO_FTP | CURLPROTO_FTPS)
>
> @@ -140,7 +120,6 @@ typedef struct BDRVCURLState {
>  static void curl_clean_state(CURLState *s);
>  static void curl_multi_do(void *arg);
>
> -#ifdef NEED_CURL_TIMER_CALLBACK
>  /* Called from curl_multi_do_locked, with s->mutex held.  */
>  static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>  {
> @@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long
> timeout_ms, void *opaque)
>      }
>      return 0;
>  }
> -#endif
>
>  /* Called from curl_multi_do_locked, with s->mutex held.  */
>  static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
> @@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)
>
>  static void curl_multi_timeout_do(void *arg)
>  {
> -#ifdef NEED_CURL_TIMER_CALLBACK
>      BDRVCURLState *s =3D (BDRVCURLState *)arg;
>      int running;
>
> @@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)
>
>      curl_multi_check_completion(s);
>      qemu_mutex_unlock(&s->mutex);
> -#else
> -    abort();
> -#endif
>  }
>
>  /* Called with s->mutex held.  */
> @@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState
> *bs,
>      s->multi =3D curl_multi_init();
>      s->aio_context =3D new_context;
>      curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
> -#ifdef NEED_CURL_TIMER_CALLBACK
>      curl_multi_setopt(s->multi, CURLMOPT_TIMERDATA, s);
>      curl_multi_setopt(s->multi, CURLMOPT_TIMERFUNCTION, curl_timer_cb);
> -#endif
>  }
>
>  static QemuOptsList runtime_opts =3D {
> diff --git a/configure b/configure
> index 42b39544d4..c0a3e1556b 100755
> --- a/configure
> +++ b/configure
> @@ -3428,17 +3428,12 @@ done
>  ##########################################
>  # curl probe
>  if test "$curl" !=3D "no" ; then
> -  if $pkg_config libcurl --exists; then
> -    curlconfig=3D"$pkg_config libcurl"
> -  else
> -    curlconfig=3Dcurl-config
> -  fi
>    cat > $TMPC << EOF
>  #include <curl/curl.h>
>  int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0;=
 }
>  EOF
> -  curl_cflags=3D$($curlconfig --cflags 2>/dev/null)
> -  curl_libs=3D$($curlconfig --libs 2>/dev/null)
> +  curl_cflags=3D$($pkg_config libcurl --cflags 2>/dev/null)
> +  curl_libs=3D$($pkg_config libcurl --libs 2>/dev/null)
>    if compile_prog "$curl_cflags" "$curl_libs" ; then
>      curl=3Dyes
>    else
> --
> 2.29.2
>
>
>

--000000000000eb3fa205b6a79187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">cURL=
 7.16.0 was released in October 2006.=C2=A0 Just remove code that is<br>
in all likelihood not being used anywhere, and require the oldest version<b=
r>
found in currently supported distros, which is 7.29.0 from CentOS 7.<br>
<br>
pkg-config is enough for QEMU, since it does not need extra information<br>
such as the path for certicate authorities.=C2=A0 All supported platforms<b=
r>
today will all have pkg-config for curl, so we can drop curl-config.<br>
<br>
Suggested-by: Daniel Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.co=
m" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0block/curl.c | 28 ----------------------------<br>
=C2=A0configure=C2=A0 =C2=A0 |=C2=A0 9 ++-------<br>
=C2=A02 files changed, 2 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/block/curl.c b/block/curl.c<br>
index d24a4c5897..4ff895df8f 100644<br>
--- a/block/curl.c<br>
+++ b/block/curl.c<br>
@@ -37,26 +37,6 @@<br>
<br>
=C2=A0// #define DEBUG_VERBOSE<br>
<br>
-#if LIBCURL_VERSION_NUM &gt;=3D 0x071000<br>
-/* The multi interface timer callback was introduced in 7.16.0 */<br>
-#define NEED_CURL_TIMER_CALLBACK<br>
-#define HAVE_SOCKET_ACTION<br>
-#endif<br>
-<br>
-#ifndef HAVE_SOCKET_ACTION<br>
-/* If curl_multi_socket_action isn&#39;t available, define it statically h=
ere in<br>
- * terms of curl_multi_socket. Note that ev_bitmask will be ignored, which=
 is<br>
- * less efficient but still safe. */<br>
-static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 curl_socket_t sockfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int ev_bitmask,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int *running_handles)<br>
-{<br>
-=C2=A0 =C2=A0 return curl_multi_socket(multi_handle, sockfd, running_handl=
es);<br>
-}<br>
-#define curl_multi_socket_action __curl_multi_socket_action<br>
-#endif<br>
-<br>
=C2=A0#define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CURLP=
ROTO_FTP | CURLPROTO_FTPS)<br>
<br>
@@ -140,7 +120,6 @@ typedef struct BDRVCURLState {<br>
=C2=A0static void curl_clean_state(CURLState *s);<br>
=C2=A0static void curl_multi_do(void *arg);<br>
<br>
-#ifdef NEED_CURL_TIMER_CALLBACK<br>
=C2=A0/* Called from curl_multi_do_locked, with s-&gt;mutex held.=C2=A0 */<=
br>
=C2=A0static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)=
<br>
=C2=A0{<br>
@@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms,=
 void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0/* Called from curl_multi_do_locked, with s-&gt;mutex held.=C2=A0 */<=
br>
=C2=A0static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,<br>
@@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)<br>
<br>
=C2=A0static void curl_multi_timeout_do(void *arg)<br>
=C2=A0{<br>
-#ifdef NEED_CURL_TIMER_CALLBACK<br>
=C2=A0 =C2=A0 =C2=A0BDRVCURLState *s =3D (BDRVCURLState *)arg;<br>
=C2=A0 =C2=A0 =C2=A0int running;<br>
<br>
@@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0curl_multi_check_completion(s);<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock(&amp;s-&gt;mutex);<br>
-#else<br>
-=C2=A0 =C2=A0 abort();<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0/* Called with s-&gt;mutex held.=C2=A0 */<br>
@@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState *=
bs,<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;multi =3D curl_multi_init();<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;aio_context =3D new_context;<br>
=C2=A0 =C2=A0 =C2=A0curl_multi_setopt(s-&gt;multi, CURLMOPT_SOCKETFUNCTION,=
 curl_sock_cb);<br>
-#ifdef NEED_CURL_TIMER_CALLBACK<br>
=C2=A0 =C2=A0 =C2=A0curl_multi_setopt(s-&gt;multi, CURLMOPT_TIMERDATA, s);<=
br>
=C2=A0 =C2=A0 =C2=A0curl_multi_setopt(s-&gt;multi, CURLMOPT_TIMERFUNCTION, =
curl_timer_cb);<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0static QemuOptsList runtime_opts =3D {<br>
diff --git a/configure b/configure<br>
index 42b39544d4..c0a3e1556b 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -3428,17 +3428,12 @@ done<br>
=C2=A0##########################################<br>
=C2=A0# curl probe<br>
=C2=A0if test &quot;$curl&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 if $pkg_config libcurl --exists; then<br>
-=C2=A0 =C2=A0 curlconfig=3D&quot;$pkg_config libcurl&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 curlconfig=3Dcurl-config<br>
-=C2=A0 fi<br>
=C2=A0 =C2=A0cat &gt; $TMPC &lt;&lt; EOF<br>
=C2=A0#include &lt;curl/curl.h&gt;<br>
=C2=A0int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return=
 0; }<br>
=C2=A0EOF<br>
-=C2=A0 curl_cflags=3D$($curlconfig --cflags 2&gt;/dev/null)<br>
-=C2=A0 curl_libs=3D$($curlconfig --libs 2&gt;/dev/null)<br>
+=C2=A0 curl_cflags=3D$($pkg_config libcurl --cflags 2&gt;/dev/null)<br>
+=C2=A0 curl_libs=3D$($pkg_config libcurl --libs 2&gt;/dev/null)<br>
=C2=A0 =C2=A0if compile_prog &quot;$curl_cflags&quot; &quot;$curl_libs&quot=
; ; then<br>
=C2=A0 =C2=A0 =C2=A0curl=3Dyes<br>
=C2=A0 =C2=A0else<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000eb3fa205b6a79187--


