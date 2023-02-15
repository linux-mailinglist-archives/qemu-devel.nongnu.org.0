Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5B6979CD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEwT-0007G1-Ll; Wed, 15 Feb 2023 05:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwN-0007Fa-9T
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwL-0004QP-MW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676456584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bRtFC17N5OLOhejVHP1uaPx2nLmnzBxHKdRoiFA5/iI=;
 b=ATHD4OTIW17TCZYBAYp447kB3GWZCyo335AqKAdtCkUh6EdwIk+HtyDQbjx5L57MIP6hYT
 zL/U/PGR6JIXytYcykFqjajH9jZb7YY+Z91pNqOiU79jN1qnd0QEThSR1vxrJVFqAyssMg
 sWCLWxX+c9zyE8n66oFrW52NwdySIr8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-7Q3e4H6fPlefvaLUcnEZ7Q-1; Wed, 15 Feb 2023 05:23:02 -0500
X-MC-Unique: 7Q3e4H6fPlefvaLUcnEZ7Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 z42-20020ab0492d000000b00423b333ff7dso6631942uac.22
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676456581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bRtFC17N5OLOhejVHP1uaPx2nLmnzBxHKdRoiFA5/iI=;
 b=mM95KTKMNjAhl/5XqCjhuKsNm4kKYerMHkjYpH9Fq0dxTIgU8dIfH1xvzIq90Z0shl
 /SVWikW6E1j2XVV4cHtwF3R0IvN/Dv4YC9biRvXI9ngBWBPJYLPrAf4ltFVIoCVYM/yw
 iUAbtk9b+oxuwCH8tpZdxpEgqZs71RHdOvlh4WWHv6h5eC/Vi6i6I99A/PB4PbGHpZPO
 YD14izSUbYXCSTMIz75hAigF5Q1tjmoIFPh/lHei2hRPQ6FmYgPqG8bOk71P+THeLybz
 i5i6ksONShKdJt/12pN16i/xsooByHTPzY2T5CwCP5wsYExuqnIQquaPRULfJg5hjPss
 LDFg==
X-Gm-Message-State: AO0yUKXijREdcW91Wgr1iSmYLGCYyAbaL8WbZeXYN079gIozqTAUtpim
 zgyX90Yk25l6qmtOwHQeWzUfHKbB0SgoCkXCaGBdqV6Jwzqomo0I8gnOYnZlraDHfOVBf2jAO7a
 MEHn239BASE98VTyVLeoRUQXVLJbXH2fYmnKYpa8=
X-Received: by 2002:a67:6ac2:0:b0:412:bb8:d767 with SMTP id
 f185-20020a676ac2000000b004120bb8d767mr316520vsc.74.1676456581529; 
 Wed, 15 Feb 2023 02:23:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+jUygHzpNxVcjrEcWvDvLePBPyrxtA/CpgmZiRO+ceV4Du4TSDODOGO67C/TYo5dzfEuVLZfQgWcsJ705LzrQ=
X-Received: by 2002:a67:6ac2:0:b0:412:bb8:d767 with SMTP id
 f185-20020a676ac2000000b004120bb8d767mr316518vsc.74.1676456581343; Wed, 15
 Feb 2023 02:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
 <20230209085004.2745131-2-kfir@daynix.com>
In-Reply-To: <20230209085004.2745131-2-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 15 Feb 2023 04:22:50 -0600
Message-ID: <CAPMcbCo2iaa3M8V5TN1O+WTLmygp7XVwGpqgPpD4SyKzaKnuNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga/win/installer: add VssOption to installer
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000033fcf05f4ba7763"
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

--000000000000033fcf05f4ba7763
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 9, 2023 at 2:50 AM Kfir Manor <kfir@daynix.com> wrote:

> Adds registry value VssOption with value 1 to QEMU Guest Agent VSS
> Provider service registry key
>
> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/installer/qemu-ga.wxs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 51340f7ecc..f7f145aa05 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -121,6 +121,10 @@
>                <RegistryValue Type="integer" Name="TypesSupported"
> Value="7" />
>                <RegistryValue Type="string" Name="EventMessageFile"
> Value="[qemu_ga_directory]qemu-ga.exe" />
>              </RegistryKey>
> +            <RegistryKey Root="HKLM"
> +                         Key="System\CurrentControlSet\Services\QEMU
> Guest Agent VSS Provider">
> +              <RegistryValue Type="integer" Name="VssOption" Value="1" />
> +            </RegistryKey>
>            </Component>
>          </Directory>
>        </Directory>
> --
> 2.38.1
>
>

--000000000000033fcf05f4ba7763
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9=
, 2023 at 2:50 AM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@da=
ynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Adds registry value VssOption with value 1 to QEMU Guest Agent VSS =
Provider service registry key<br>
<br>
Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"=
_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 51340f7ecc..f7f145aa05 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -121,6 +121,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryValue Ty=
pe=3D&quot;integer&quot; Name=3D&quot;TypesSupported&quot; Value=3D&quot;7&=
quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryValue Ty=
pe=3D&quot;string&quot; Name=3D&quot;EventMessageFile&quot; Value=3D&quot;[=
qemu_ga_directory]qemu-ga.exe&quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/RegistryKey&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;RegistryKey Root=3D&quot;HKL=
M&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Key=3D&quot;System\CurrentControlSet\Services\QEMU Guest A=
gent VSS Provider&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;RegistryValue Type=3D=
&quot;integer&quot; Name=3D&quot;VssOption&quot; Value=3D&quot;1&quot; /&gt=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/RegistryKey&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Directory&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Directory&gt;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--000000000000033fcf05f4ba7763--


