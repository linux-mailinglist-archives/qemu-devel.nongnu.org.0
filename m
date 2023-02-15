Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CE6979CE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEwo-0007da-HV; Wed, 15 Feb 2023 05:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwj-0007dM-Pw
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwg-0004U8-5n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676456605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rn3Il1aNF/WsY9jgKMg9WZgO5jrSpXeAgEfFoJopodU=;
 b=WA6fqdLU6fa9CWGSLGkE4d09o1G3Xpsf4TSDdcJBDnfcrFT3RbNWgRjbQXkneXOCYlBZ/0
 LdUkUQa3+jXN33U8OdWglEHVgHFxwt3y91y8Oar56snke7/4XzSJhhH12ZxSfAmCBwTtEw
 e4cIm6bGqM9qQ2MG/HLKR0POWb5EKz0=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-PkvM0HqgNo2ke3uUMbagTw-1; Wed, 15 Feb 2023 05:23:23 -0500
X-MC-Unique: PkvM0HqgNo2ke3uUMbagTw-1
Received: by mail-ua1-f70.google.com with SMTP id
 g4-20020ab01304000000b0060d5bfd73b5so6624178uae.16
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rn3Il1aNF/WsY9jgKMg9WZgO5jrSpXeAgEfFoJopodU=;
 b=e1bBEM/A3WALQ86TQP0Z1D5McZbgmjfIc32arcD3INtXfEldH3YqxMoXKp7qnuQyZm
 pAEzO5ydldlhDSN0ZnWYl3bIiko7tkVGQKrrgl/3ZSRCpiYOT88VX9OUcqUaKh80OsYS
 O63OhoVfvgEnG/MyX++QxnZORbqgLsrQz/G2yf5Z/GCY5Hymnf+Cv4Dg8g586Wa07o1h
 OmBUjxhow8/kI3OYvpgoRLMIY2hvQJGhokttlHXuAoQpxum/0GnktS7KeRESb4lytl8e
 V0zQ4corZns+NGIbCuow2rpODn53VXOocqVJRMzjeXxOa0LdxPtbhC5rP7PE6EOHrpyM
 oCog==
X-Gm-Message-State: AO0yUKUEkY3+7dFOqof2SeFbnotzZ3ziB3s9K8QaCa4Sq64NXFukJzP5
 CBGkf7z5ECI1T2Mgbniw6rfKzy+FuUoVuANNuoUs+/WH7YVxnQYcon/X/n7u8yXuBlWq37tKixb
 P/hFaUoMvtmXRDPGM9dSQgKm0w3pKUN+OChqiBkM=
X-Received: by 2002:a1f:a7d7:0:b0:3e9:fd3b:692e with SMTP id
 q206-20020a1fa7d7000000b003e9fd3b692emr237627vke.38.1676456602622; 
 Wed, 15 Feb 2023 02:23:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/nKbrEVyCL3sV/wxlaDsTAsVDkYH2Jg+/sk/64g5rjxMaZpK9xoBker/y0lI+0VZdZXjSEeanAICApVF3XsTA=
X-Received: by 2002:a1f:a7d7:0:b0:3e9:fd3b:692e with SMTP id
 q206-20020a1fa7d7000000b003e9fd3b692emr237623vke.38.1676456602446; Wed, 15
 Feb 2023 02:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
 <20230209085004.2745131-4-kfir@daynix.com>
In-Reply-To: <20230209085004.2745131-4-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 15 Feb 2023 04:23:11 -0600
Message-ID: <CAPMcbCrqbMZhK3+RWhm+6Kyc-raQkhah6Vx7F=wj=Ri2DtQz8Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] qga/win/vss: requester_freeze changes
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="0000000000004541fd05f4ba78d2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000004541fd05f4ba78d2
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 9, 2023 at 2:50 AM Kfir Manor <kfir@daynix.com> wrote:

> Change requester_freeze so that the VSS backup type queried from the
> registry
>
> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/vss-win32/requester.cpp | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
> index 27fdb9236b..163b3870b9 100644
> --- a/qga/vss-win32/requester.cpp
> +++ b/qga/vss-win32/requester.cpp
> @@ -285,6 +285,7 @@ void requester_freeze(int *num_vols, void
> *mountpoints, ErrorSet *errset)
>      DWORD wait_status;
>      int num_fixed_drives = 0, i;
>      int num_mount_points = 0;
> +    VSS_BACKUP_TYPE vss_bt = get_vss_backup_type();
>
>      if (vss_ctx.pVssbc) { /* already frozen */
>          *num_vols = 0;
> @@ -332,7 +333,7 @@ void requester_freeze(int *num_vols, void
> *mountpoints, ErrorSet *errset)
>          goto out;
>      }
>
> -    hr = vss_ctx.pVssbc->SetBackupState(true, true, VSS_BT_FULL, false);
> +    hr = vss_ctx.pVssbc->SetBackupState(true, true, vss_bt, false);
>      if (FAILED(hr)) {
>          err_set(errset, hr, "failed to set backup state");
>          goto out;
> --
> 2.38.1
>
>

--0000000000004541fd05f4ba78d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9=
, 2023 at 2:50 AM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@da=
ynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Change requester_freeze so that the VSS backup type queried from th=
e registry<br>
<br>
Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"=
_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/requester.cpp | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp<br>
index 27fdb9236b..163b3870b9 100644<br>
--- a/qga/vss-win32/requester.cpp<br>
+++ b/qga/vss-win32/requester.cpp<br>
@@ -285,6 +285,7 @@ void requester_freeze(int *num_vols, void *mountpoints,=
 ErrorSet *errset)<br>
=C2=A0 =C2=A0 =C2=A0DWORD wait_status;<br>
=C2=A0 =C2=A0 =C2=A0int num_fixed_drives =3D 0, i;<br>
=C2=A0 =C2=A0 =C2=A0int num_mount_points =3D 0;<br>
+=C2=A0 =C2=A0 VSS_BACKUP_TYPE vss_bt =3D get_vss_backup_type();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (vss_ctx.pVssbc) { /* already frozen */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_vols =3D 0;<br>
@@ -332,7 +333,7 @@ void requester_freeze(int *num_vols, void *mountpoints,=
 ErrorSet *errset)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 hr =3D vss_ctx.pVssbc-&gt;SetBackupState(true, true, VSS_BT_=
FULL, false);<br>
+=C2=A0 =C2=A0 hr =3D vss_ctx.pVssbc-&gt;SetBackupState(true, true, vss_bt,=
 false);<br>
=C2=A0 =C2=A0 =C2=A0if (FAILED(hr)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err_set(errset, hr, &quot;failed to set b=
ackup state&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--0000000000004541fd05f4ba78d2--


