Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C45822CE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:08:48 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGd26-0004W7-O3
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGctG-0005r6-89
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGctD-0006VK-Gs
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658912374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCaL9jLS2ezHJ/JvG4LQNDnGfG5RfKWuqrXrA8s7rx4=;
 b=TvMMHHNQlNSOA1khHqvTH+tbiYlsA9d50MVFmmRsL3P0qdKmvo58X3XRm+WHgUgeE2cW57
 sZvlnvdbE3ink5kvA0nbFnBQLhDqVF533Ur/4nis5yk019s/dM0fzswvRcHYBX1AktG+v2
 E1XapdSyWFEsLIp7wc0t82GPlf7CWj0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-LwtyeeyBPm-ivTaJAn1Eig-1; Wed, 27 Jul 2022 04:59:32 -0400
X-MC-Unique: LwtyeeyBPm-ivTaJAn1Eig-1
Received: by mail-yb1-f199.google.com with SMTP id
 m123-20020a253f81000000b0066ff6484995so13032551yba.22
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCaL9jLS2ezHJ/JvG4LQNDnGfG5RfKWuqrXrA8s7rx4=;
 b=Zb0lKKalp8Bi2uwGR/5M0b6f+zChWD0gSgKtfu96WJNsa6BusDhAVEkvJty2arDC8x
 Lq/gARzo1v58sMVaFWurW2zg9sIvreG5YKBlcVJTluQcWkJdfBszmFChjAFIU/aRwj47
 dsrRmxflUHFayP9MThKUdGjpVFT7CtFCOIK8ATraqkekAHyuUvH3mLRf96LQffDL2SBW
 cJnbnZUgee4rjbSU1ccDyI/3pidjtNyETiWAb7AxIL4q65VIFQwTtJO0kcHWOXX4dSF5
 Hx49/gU3XVGSVqsMBu5p1OScLJa3BdmvvrpJU7bfs211DEzLAQU4rYfArv3g1nvnf4et
 EoVA==
X-Gm-Message-State: AJIora8Tj5Bj8qKKxOiYNdGtnQTNechGEPYSAW3ei4ymOPxEqa6EoU/x
 PALBoMdAdWuf6nurxr1aOQJwoDFGnSOxSp1Hfd69VCTrYYYRrAszt1mEuI8T7sOgAbOE3+l58v8
 LrNnNVrkFH8+GB/ustTSj/AGZNFoAU/E=
X-Received: by 2002:a25:d6cc:0:b0:671:6e7e:d5d9 with SMTP id
 n195-20020a25d6cc000000b006716e7ed5d9mr6216568ybg.14.1658912372043; 
 Wed, 27 Jul 2022 01:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjxzezeTHXYQ2cyMQ4CNqyDSIv6EYtgxTUow1rRZDZbOzkW3Vc6Sv9Uy4AACbLXAsBGcLkNSidhfnlfqUNQ88=
X-Received: by 2002:a25:d6cc:0:b0:671:6e7e:d5d9 with SMTP id
 n195-20020a25d6cc000000b006716e7ed5d9mr6216555ybg.14.1658912371856; Wed, 27
 Jul 2022 01:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-4-bmeng.cn@gmail.com>
In-Reply-To: <20220727073542.811420-4-bmeng.cn@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 11:59:20 +0300
Message-ID: <CAPMcbCqUVNkOhEoubQDX_wR1hYZQN2K2-xrBKsMdSFXP1=YKew@mail.gmail.com>
Subject: Re: [PATCH 3/5] qga/commands-win32: Use os_get_win_version()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000a3688105e4c5a2bc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000a3688105e4c5a2bc
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 10:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Drop its own ga_get_win_version() implementation, and use the one
> provided in oslib-win32 instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  qga/commands-win32.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 7ed7664715..6186f2e1f2 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2178,26 +2178,6 @@ static ga_win_10_0_t const
> WIN_10_0_CLIENT_VERSION_MATRIX[3] = {
>      {0, 0}
>  };
>
> -static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
> -{
> -    typedef NTSTATUS(WINAPI *rtl_get_version_t)(
> -        RTL_OSVERSIONINFOEXW *os_version_info_ex);
> -
> -    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
> -
> -    HMODULE module = GetModuleHandle("ntdll");
> -    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> -    if (fun == NULL) {
> -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> -            "Failed to get address of RtlGetVersion");
> -        return;
> -    }
> -
> -    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
> -    rtl_get_version(info);
> -    return;
> -}
> -
>  static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
>  {
>      DWORD major = os_version->dwMajorVersion;
> @@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)
>
>  GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
>  {
> -    Error *local_err = NULL;
>      OSVERSIONINFOEXW os_version = {0};
>      bool server;
>      char *product_name;
>      GuestOSInfo *info;
>
> -    ga_get_win_version(&os_version, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return NULL;
> -    }
> +    os_get_win_version(&os_version);
>

GA should not fail if it can't detect the Windows version but theoretically
os_get_win_version can crash application if GetProcAddress will return NULL


>
>      server = os_version.wProductType != VER_NT_WORKSTATION;
>      product_name = ga_get_win_product_name(errp);
> --
> 2.34.1
>
>

--000000000000a3688105e4c5a2bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 10:36 AM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin =
Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;<br>
<br>
Drop its own ga_get_win_version() implementation, and use the one<br>
provided in oslib-win32 instead.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0qga/commands-win32.c | 27 +--------------------------<br>
=C2=A01 file changed, 1 insertion(+), 26 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 7ed7664715..6186f2e1f2 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2178,26 +2178,6 @@ static ga_win_10_0_t const WIN_10_0_CLIENT_VERSION_M=
ATRIX[3] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{0, 0}<br>
=C2=A0};<br>
<br>
-static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)<b=
r>
-{<br>
-=C2=A0 =C2=A0 typedef NTSTATUS(WINAPI *rtl_get_version_t)(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 RTL_OSVERSIONINFOEXW *os_version_info_ex);<br>
-<br>
-=C2=A0 =C2=A0 info-&gt;dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW=
);<br>
-<br>
-=C2=A0 =C2=A0 HMODULE module =3D GetModuleHandle(&quot;ntdll&quot;);<br>
-=C2=A0 =C2=A0 PVOID fun =3D GetProcAddress(module, &quot;RtlGetVersion&quo=
t;);<br>
-=C2=A0 =C2=A0 if (fun =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, QERR_QGA_COMMAND_FAILED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to get address of R=
tlGetVersion&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun=
;<br>
-=C2=A0 =C2=A0 rtl_get_version(info);<br>
-=C2=A0 =C2=A0 return;<br>
-}<br>
-<br>
=C2=A0static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool=
 id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DWORD major =3D os_version-&gt;dwMajorVersion;<br>
@@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)<br>
<br>
=C2=A0GuestOSInfo *qmp_guest_get_osinfo(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0OSVERSIONINFOEXW os_version =3D {0};<br>
=C2=A0 =C2=A0 =C2=A0bool server;<br>
=C2=A0 =C2=A0 =C2=A0char *product_name;<br>
=C2=A0 =C2=A0 =C2=A0GuestOSInfo *info;<br>
<br>
-=C2=A0 =C2=A0 ga_get_win_version(&amp;os_version, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 os_get_win_version(&amp;os_version);<br></blockquote><div><b=
r></div><div>GA should not fail if it can&#39;t detect the Windows version =
but theoretically</div><div>os_get_win_version can crash application if Get=
ProcAddress will return NULL<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0server =3D os_version.wProductType !=3D VER_NT_WORKSTAT=
ION;<br>
=C2=A0 =C2=A0 =C2=A0product_name =3D ga_get_win_product_name(errp);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000a3688105e4c5a2bc--


