Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B1582292
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:58:56 +0200 (CEST)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcsY-0004MR-Ip
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGcnr-0008H8-Ea
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGcnn-0005gD-RE
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658912036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p1a9mW0udkD6vsBsgIApGe9iWUsFp8sJzZubzLzx4mU=;
 b=ccbd+PsvEZ89QQRSag+/bTofqObeRVAQNHKzvLoUMXroqunbg1gzb3XhrvthGKfXKe5RUi
 I9kmbG3e5vvVhde3qL4sW1QonmbZ49H4ADQuBPDnQAkJm7EpRONil2lQwe4XWsxnGBF+km
 vJKeYf/PSFM53adHwYo3yxY42U+Ff+I=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-MbYPNg8wOTqIFvAjPtbz_Q-1; Wed, 27 Jul 2022 04:53:54 -0400
X-MC-Unique: MbYPNg8wOTqIFvAjPtbz_Q-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31dfe25bd47so132712117b3.18
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1a9mW0udkD6vsBsgIApGe9iWUsFp8sJzZubzLzx4mU=;
 b=4b9hjl+IE5sqfJz3UnJS6fLfC+PgHjc4t32uHY50LSjh17aDp1YmSRE9e3GR64d9HJ
 xZFQ4FccD5wbqm464dSmVSgw38RpLZsRkzb/D48qiwCVbH+CfXwsfsOgfRIxmaqm4vbT
 BjP+0pnqAONJFG6Z3iZLpwEwyS1NIIUKy6dnrGd1riYaKcN+F9TR75oEPBssMx0GLWpm
 64ch1ZyNF7V937foiTFNa6/G4Qn8bhoAuboxeXqR9CVEgtVajq7Bx+VACRe034vwk7DM
 gJmkcnNuW7DPw8qPw5JcOV1ndx2stn4KT5SJaqI9er+nXXFPMwwJ3eR7CezIwi3erFJD
 o2Tg==
X-Gm-Message-State: AJIora+9GPsAGqHEbCWUIKibTY8WAjEgMtfAzvT72V+8OARZh03B0mis
 xhyE8vlIfD2FBSdgnSLewazWaN3EEvxmpfFqErpEQeyxpI+EBaOFYoX6IUwkyPHS37eBsgvcn1J
 WEG2N1tnLEfPltP7lt/czxTGZpXB+csA=
X-Received: by 2002:a25:d6cc:0:b0:671:6e7e:d5d9 with SMTP id
 n195-20020a25d6cc000000b006716e7ed5d9mr6205136ybg.14.1658912034186; 
 Wed, 27 Jul 2022 01:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sh7FD0izO5w1mxdb0OnIVbwbNUWK7F+7PSo5j9L/+wNc7xLcFiakQ4uESRbw4SSlFYa1R9u3Wbz0T3P0J43UY=
X-Received: by 2002:a25:d6cc:0:b0:671:6e7e:d5d9 with SMTP id
 n195-20020a25d6cc000000b006716e7ed5d9mr6205121ybg.14.1658912033950; Wed, 27
 Jul 2022 01:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
In-Reply-To: <20220727073542.811420-5-bmeng.cn@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 11:53:42 +0300
Message-ID: <CAPMcbCo81iCA7ZnvWY7=OqA7vrAuhx7jA5EPiqJLnq4LzpKstA@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000007f5f2905e4c58e63"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000007f5f2905e4c58e63
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 10:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Support for the unix socket has existed both in BSD and Linux for the
> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> the native support for the unix socket has came to Windows. Starting
> this build, two Win32 processes can use the AF_UNIX address family
> over Winsock API to communicate with each other.
>
> Introduce a new build time config option CONFIG_AF_UNIX when the build
> host has such a capability, and a run-time check afunix_available() for
> Windows host in the QEMU sockets util codes.
>
> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  meson.build         |  6 ++++++
>  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 47 insertions(+), 7 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 75aaca8462..73e5de5957 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
>    '''), error_message: 'AF_ALG requested but could not be
> detected').allowed()
>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
>
> +if targetos != 'windows'
> +  config_host_data.set('CONFIG_AF_UNIX', true)
> +else
> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> +endif
> +
>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
>    'linux/vm_sockets.h', 'AF_VSOCK',
>    prefix: '#include <sys/socket.h>',
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 0e2298278f..d85f3ea3ee 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -17,6 +17,15 @@
>   */
>  #include "qemu/osdep.h"
>
> +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
> +# include <afunix.h>
> +/*
> + * AF_UNIX support is available since Windows 10 build 17063
> + * See
> https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> + */
> +# define WIN_BUILD_AF_UNIX 17063
> +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
> +
>  #ifdef CONFIG_AF_VSOCK
>  #include <linux/vm_sockets.h>
>  #endif /* CONFIG_AF_VSOCK */
> @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const
> char *str,
>  }
>  #endif /* CONFIG_AF_VSOCK */
>
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>
>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>  {
> @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
>  #endif
>  }
>
> +#ifdef CONFIG_WIN32
> +static bool afunix_available(void)
> +{
> +    OSVERSIONINFOEXW os_version = { 0 };
> +
> +    os_get_win_version(&os_version);
> +
> +    return os_version.dwBuildNumber >= WIN_BUILD_AF_UNIX;
>

I think this is a bad variant to check feature support by checking
Windows build. From my point, you should try to create an AF_UNIX
socket and if it fails then fall back to the old behavior.


> +}
> +#endif
> +
>  static int unix_listen_saddr(UnixSocketAddress *saddr,
>                               int num,
>                               Error **errp)
> @@ -912,6 +932,13 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
>      size_t pathlen;
>      size_t addrlen;
>
> +#ifdef CONFIG_WIN32
> +    if (!afunix_available()) {
> +        error_setg(errp, "AF_UNIX is not available on your Windows");
> +        return -1;
> +    }
>
+#endif
> +
>      sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          error_setg_errno(errp, errno, "Failed to create Unix socket");
> @@ -1004,6 +1031,13 @@ static int unix_connect_saddr(UnixSocketAddress
> *saddr, Error **errp)
>          return -1;
>      }
>
> +#ifdef CONFIG_WIN32
> +    if (!afunix_available()) {
> +        error_setg(errp, "AF_UNIX is not available on your Windows");
> +        return -1;
> +    }
> +#endif
> +
>      sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          error_setg_errno(errp, errno, "Failed to create socket");
> @@ -1060,14 +1094,14 @@ static int unix_listen_saddr(UnixSocketAddress
> *saddr,
>                               int num,
>                               Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno = ENOTSUP;
>      return -1;
>  }
>
>  static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno = ENOTSUP;
>      return -1;
>  }
> @@ -1335,7 +1369,7 @@ socket_sockaddr_to_address_inet(struct
> sockaddr_storage *sa,
>  }
>
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>  static SocketAddress *
>  socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>                                  socklen_t salen,
> @@ -1362,7 +1396,7 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      addr->u.q_unix.path = g_strndup(su->sun_path, salen);
>      return addr;
>  }
> -#endif /* WIN32 */
> +#endif /* CONFIG_AF_UNIX */
>
>  #ifdef CONFIG_AF_VSOCK
>  static SocketAddress *
> @@ -1394,10 +1428,10 @@ socket_sockaddr_to_address(struct sockaddr_storage
> *sa,
>      case AF_INET6:
>          return socket_sockaddr_to_address_inet(sa, salen, errp);
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>      case AF_UNIX:
>          return socket_sockaddr_to_address_unix(sa, salen, errp);
> -#endif /* WIN32 */
> +#endif
>
>  #ifdef CONFIG_AF_VSOCK
>      case AF_VSOCK:
> --
> 2.34.1
>
>
>

--0000000000007f5f2905e4c58e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><br></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 10:47 AM Bin Meng &lt=
;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin Meng &lt=
;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng@windr=
iver.com</a>&gt;<br>
<br>
Support for the unix socket has existed both in BSD and Linux for the<br>
longest time, but not on Windows. Since Windows 10 build 17063 [1],<br>
the native support for the unix socket has came to Windows. Starting<br>
this build, two Win32 processes can use the AF_UNIX address family<br>
over Winsock API to communicate with each other.<br>
<br>
Introduce a new build time config option CONFIG_AF_UNIX when the build<br>
host has such a capability, and a run-time check afunix_available() for<br>
Windows host in the QEMU sockets util codes.<br>
<br>
[1] <a href=3D"https://devblogs.microsoft.com/commandline/af_unix-comes-to-=
windows/" rel=3D"noreferrer" target=3D"_blank">https://devblogs.microsoft.c=
om/commandline/af_unix-comes-to-windows/</a><br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++------=
-<br>
=C2=A02 files changed, 47 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 75aaca8462..73e5de5957 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2327,6 +2327,12 @@ have_afalg =3D get_option(&#39;crypto_afalg&#39;) \<=
br>
=C2=A0 =C2=A0&#39;&#39;&#39;), error_message: &#39;AF_ALG requested but cou=
ld not be detected&#39;).allowed()<br>
=C2=A0config_host_data.set(&#39;CONFIG_AF_ALG&#39;, have_afalg)<br>
<br>
+if targetos !=3D &#39;windows&#39;<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, true)<br>
+else<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, cc.has_header(&#39;a=
funix.h&#39;))<br>
+endif<br>
+<br>
=C2=A0config_host_data.set(&#39;CONFIG_AF_VSOCK&#39;, cc.has_header_symbol(=
<br>
=C2=A0 =C2=A0&#39;linux/vm_sockets.h&#39;, &#39;AF_VSOCK&#39;,<br>
=C2=A0 =C2=A0prefix: &#39;#include &lt;sys/socket.h&gt;&#39;,<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 0e2298278f..d85f3ea3ee 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -17,6 +17,15 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
+#if defined(CONFIG_WIN32) &amp;&amp; defined(CONFIG_AF_UNIX)<br>
+# include &lt;afunix.h&gt;<br>
+/*<br>
+ * AF_UNIX support is available since Windows 10 build 17063<br>
+ * See <a href=3D"https://devblogs.microsoft.com/commandline/af_unix-comes=
-to-windows/" rel=3D"noreferrer" target=3D"_blank">https://devblogs.microso=
ft.com/commandline/af_unix-comes-to-windows/</a><br>
+ */<br>
+# define WIN_BUILD_AF_UNIX 17063<br>
+#endif /* CONFIG_WIN32 &amp;&amp; CONFIG_AF_UNIX */<br>
+<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0#include &lt;linux/vm_sockets.h&gt;<br>
=C2=A0#endif /* CONFIG_AF_VSOCK */<br>
@@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const =
char *str,<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_AF_VSOCK */<br>
<br>
-#ifndef _WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
<br>
=C2=A0static bool saddr_is_abstract(UnixSocketAddress *saddr)<br>
=C2=A0{<br>
@@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)<b=
r>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
+#ifdef CONFIG_WIN32<br>
+static bool afunix_available(void)<br>
+{<br>
+=C2=A0 =C2=A0 OSVERSIONINFOEXW os_version =3D { 0 };<br>
+<br>
+=C2=A0 =C2=A0 os_get_win_version(&amp;os_version);<br>
+<br>
+=C2=A0 =C2=A0 return os_version.dwBuildNumber &gt;=3D WIN_BUILD_AF_UNIX;<b=
r></blockquote><div><br></div><div>I think this is a bad variant to check f=
eature support by checking <br></div><div>Windows build. From my point, you=
 should try to create an AF_UNIX</div><div>socket and if it fails then fall=
 back to the old behavior. <br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+}<br>
+#endif<br>
+<br>
=C2=A0static int unix_listen_saddr(UnixSocketAddress *saddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
@@ -912,6 +932,13 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,=
<br>
=C2=A0 =C2=A0 =C2=A0size_t pathlen;<br>
=C2=A0 =C2=A0 =C2=A0size_t addrlen;<br>
<br>
+#ifdef CONFIG_WIN32<br>
+=C2=A0 =C2=A0 if (!afunix_available()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;AF_UNIX is not availabl=
e on your Windows&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br></blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0sock =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);<br>
=C2=A0 =C2=A0 =C2=A0if (sock &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;Faile=
d to create Unix socket&quot;);<br>
@@ -1004,6 +1031,13 @@ static int unix_connect_saddr(UnixSocketAddress *sad=
dr, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifdef CONFIG_WIN32<br>
+=C2=A0 =C2=A0 if (!afunix_available()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;AF_UNIX is not availabl=
e on your Windows&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0sock =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);<br>
=C2=A0 =C2=A0 =C2=A0if (sock &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;Faile=
d to create socket&quot;);<br>
@@ -1060,14 +1094,14 @@ static int unix_listen_saddr(UnixSocketAddress *sad=
dr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on you=
r host&quot;);<br>
=C2=A0 =C2=A0 =C2=A0errno =3D ENOTSUP;<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
=C2=A0static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on you=
r host&quot;);<br>
=C2=A0 =C2=A0 =C2=A0errno =3D ENOTSUP;<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
@@ -1335,7 +1369,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_stora=
ge *sa,<br>
=C2=A0}<br>
<br>
<br>
-#ifndef WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0static SocketAddress *<br>
=C2=A0socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t salen,<br>
@@ -1362,7 +1396,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_stora=
ge *sa,<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, s=
alen);<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
-#endif /* WIN32 */<br>
+#endif /* CONFIG_AF_UNIX */<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0static SocketAddress *<br>
@@ -1394,10 +1428,10 @@ socket_sockaddr_to_address(struct sockaddr_storage =
*sa,<br>
=C2=A0 =C2=A0 =C2=A0case AF_INET6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_inet(sa=
, salen, errp);<br>
<br>
-#ifndef WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0 =C2=A0 =C2=A0case AF_UNIX:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_unix(sa=
, salen, errp);<br>
-#endif /* WIN32 */<br>
+#endif<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0 =C2=A0 =C2=A0case AF_VSOCK:<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000007f5f2905e4c58e63--


