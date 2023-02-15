Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C56979C9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEwY-0007KW-E3; Wed, 15 Feb 2023 05:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwW-0007HA-FH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEwU-0004RX-Oz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676456594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kq4wLZIQiP/Gja23OWHMvB0ZkqX72v6pQmWpUQPN7cg=;
 b=D4vOr19B9o7NOhboiKJMgNswB/r5jpkbfbVRUCIjT7AQCgqoI+9zsDuqmOp2UAZm3dNbmI
 4XxoVHP/66a0gu7Y16qu8jb99vWcTo5oqLzqzgENtrRmZ0eIM47UwA/xv2K9ECro2C1JTP
 y5RQaAAYcEeE9B7MCQRWkxxq9iSV1Gg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-BGSavTYqNuix2bO0TRrPgQ-1; Wed, 15 Feb 2023 05:23:12 -0500
X-MC-Unique: BGSavTYqNuix2bO0TRrPgQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 y44-20020a9f326f000000b00657d8cfac32so6505699uad.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kq4wLZIQiP/Gja23OWHMvB0ZkqX72v6pQmWpUQPN7cg=;
 b=1hCZhLRPbxLL4RDUNhQW4uKn8sHxGZGVJKNcIVNWIxmDDoiEzeMTYKNGv3U0C1M4xA
 WNmH/icfjYdue6q12eyoZPkMQA5rcNgJT/aPJBLQiO89cKdXupwlVtz7nIpx3Ub9ov70
 ugFbPYW98mIRpsc30otpZk5ZSfSQCScrwfiEbAhk/Nvk541WBhYqUnv4+4Rn3+xlxK9S
 8PfG5qs/CqDXdyR/rIR7BoVi40u2w7kXK5brrna/XKr9w3X+7ktmCBYgdz/wm1maggEV
 Adp/rpR7GjaXCvjuZtcZf/Bvj3zPybEebuQk+j5Ts1W2izP1NmOCgMYGJJmadBhtZ2lF
 n2KA==
X-Gm-Message-State: AO0yUKWyhcXGGCkpn2dM8BMiu79vuoJ/fKnAkuhDaKeF4UFLS3g3SreU
 a5XNnp6/oWefSnlj/UCW0hJc9j6OGUfsKhNEehWD0aXeXTLMcX/Md/0XSgz02NOzZtbRV4vy+ab
 MnMPrNui3VAJLlXFdaMSruN/PJc27+jA=
X-Received: by 2002:ab0:3b97:0:b0:68a:9366:216e with SMTP id
 p23-20020ab03b97000000b0068a9366216emr171202uaw.59.1676456591984; 
 Wed, 15 Feb 2023 02:23:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZXmUhXNqfCDgn1fDxjsEBcVFNY5J9MgGiy892soaefDlZQQ9MNNoSjR/BGpCI31yaNBQDkN8joROcNXsmWgg=
X-Received: by 2002:ab0:3b97:0:b0:68a:9366:216e with SMTP id
 p23-20020ab03b97000000b0068a9366216emr171201uaw.59.1676456591776; Wed, 15 Feb
 2023 02:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
 <20230209085004.2745131-3-kfir@daynix.com>
In-Reply-To: <20230209085004.2745131-3-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 15 Feb 2023 04:23:00 -0600
Message-ID: <CAPMcbCob-SEjNtmghGpQN6yG2ZX28wAaW3i4785c5Z_uPE4vCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] qga/win/vss: query VSS backup type
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000a275e105f4ba7728"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000a275e105f4ba7728
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 9, 2023 at 2:50 AM Kfir Manor <kfir@daynix.com> wrote:

> Query VSS backup type number (DWORD) from QEMU Guest Agent VSS Provider
> registry key registry value VssOption
>
> Translate the VSS backup type number (DWORD) into its VSS backup type
> (VSS_BACKUP_TYPE)
>
> Returns the queried VSS backup type if the program encounters unexpected
> behaviors or values return default VSS backup type VSS_BT_FULL instead
>
> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/vss-win32/requester.cpp | 38 +++++++++++++++++++++++++++++++++++++
>  qga/vss-win32/vss-handles.h |  3 +++
>  2 files changed, 41 insertions(+)
>
> diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
> index b371affeab..27fdb9236b 100644
> --- a/qga/vss-win32/requester.cpp
> +++ b/qga/vss-win32/requester.cpp
> @@ -23,6 +23,8 @@
>  /* Call QueryStatus every 10 ms while waiting for frozen event */
>  #define VSS_TIMEOUT_EVENT_MSEC 10
>
> +#define DEFAULT_VSS_BACKUP_TYPE VSS_BT_FULL
> +
>  #define err_set(e, err, fmt, ...)
>    \
>      ((e)->error_setg_win32_wrapper((e)->errp, __FILE__, __LINE__,
> __func__, \
>                                     err, fmt, ## __VA_ARGS__))
> @@ -234,6 +236,42 @@ out:
>      }
>  }
>
> +DWORD get_reg_dword_value(HKEY baseKey, LPCSTR subKey, LPCSTR valueName,
> +                          DWORD defaultData)
> +{
> +    DWORD regGetValueError;
> +    DWORD dwordData;
> +    DWORD dataSize = sizeof(DWORD);
> +
> +    regGetValueError = RegGetValue(baseKey, subKey, valueName,
> RRF_RT_DWORD,
> +                                   NULL, &dwordData, &dataSize);
> +    if (regGetValueError  != ERROR_SUCCESS) {
> +        return defaultData;
> +    }
> +    return dwordData;
> +}
> +
> +bool is_valid_vss_backup_type(VSS_BACKUP_TYPE vssBT)
> +{
> +    return (vssBT > VSS_BT_UNDEFINED && vssBT < VSS_BT_OTHER);
> +}
> +
> +VSS_BACKUP_TYPE get_vss_backup_type(
> +    VSS_BACKUP_TYPE defaultVssBT = DEFAULT_VSS_BACKUP_TYPE)
> +{
> +    VSS_BACKUP_TYPE vssBackupType;
> +
> +    vssBackupType = static_cast<VSS_BACKUP_TYPE>(
> +                            get_reg_dword_value(HKEY_LOCAL_MACHINE,
> +
> QGA_PROVIDER_REGISTRY_ADDRESS,
> +                                                "VssOption",
> +                                                defaultVssBT));
> +    if (!is_valid_vss_backup_type(vssBackupType)) {
> +        return defaultVssBT;
> +    }
> +    return vssBackupType;
> +}
> +
>  void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
>  {
>      COMPointer<IVssAsync> pAsync;
> diff --git a/qga/vss-win32/vss-handles.h b/qga/vss-win32/vss-handles.h
> index 0f8a741ad2..1a7d842129 100644
> --- a/qga/vss-win32/vss-handles.h
> +++ b/qga/vss-win32/vss-handles.h
> @@ -6,6 +6,9 @@
>  #define QGA_PROVIDER_NAME "QEMU Guest Agent VSS Provider"
>  #define QGA_PROVIDER_LNAME L(QGA_PROVIDER_NAME)
>  #define QGA_PROVIDER_VERSION L(QEMU_VERSION)
> +#define QGA_PROVIDER_REGISTRY_ADDRESS "SYSTEM\\CurrentControlSet"\
> +                                      "\\Services"\
> +                                      "\\" QGA_PROVIDER_NAME
>
>  #define EVENT_NAME_FROZEN  "Global\\QGAVSSEvent-frozen"
>  #define EVENT_NAME_THAW    "Global\\QGAVSSEvent-thaw"
> --
> 2.38.1
>
>

--000000000000a275e105f4ba7728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9=
, 2023 at 2:50 AM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@da=
ynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Query VSS backup type number (DWORD) from QEMU Guest Agent VSS Prov=
ider registry key registry value VssOption<br>
<br>
Translate the VSS backup type number (DWORD) into its VSS backup type (VSS_=
BACKUP_TYPE)<br>
<br>
Returns the queried VSS backup type if the program encounters unexpected be=
haviors or values return default VSS backup type VSS_BT_FULL instead<br>
<br>
Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"=
_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/requester.cpp | 38 ++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/vss-win32/vss-handles.h |=C2=A0 3 +++<br>
=C2=A02 files changed, 41 insertions(+)<br>
<br>
diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp<br>
index b371affeab..27fdb9236b 100644<br>
--- a/qga/vss-win32/requester.cpp<br>
+++ b/qga/vss-win32/requester.cpp<br>
@@ -23,6 +23,8 @@<br>
=C2=A0/* Call QueryStatus every 10 ms while waiting for frozen event */<br>
=C2=A0#define VSS_TIMEOUT_EVENT_MSEC 10<br>
<br>
+#define DEFAULT_VSS_BACKUP_TYPE VSS_BT_FULL<br>
+<br>
=C2=A0#define err_set(e, err, fmt, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0((e)-&gt;error_setg_win32_wrapper((e)-&gt;errp, __FILE_=
_, __LINE__, __func__, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err, fmt, ## __VA_ARGS=
__))<br>
@@ -234,6 +236,42 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+DWORD get_reg_dword_value(HKEY baseKey, LPCSTR subKey, LPCSTR valueName,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DWORD defaultData)<br>
+{<br>
+=C2=A0 =C2=A0 DWORD regGetValueError;<br>
+=C2=A0 =C2=A0 DWORD dwordData;<br>
+=C2=A0 =C2=A0 DWORD dataSize =3D sizeof(DWORD);<br>
+<br>
+=C2=A0 =C2=A0 regGetValueError =3D RegGetValue(baseKey, subKey, valueName,=
 RRF_RT_DWORD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;dwordData, &=
amp;dataSize);<br>
+=C2=A0 =C2=A0 if (regGetValueError=C2=A0 !=3D ERROR_SUCCESS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return defaultData;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return dwordData;<br>
+}<br>
+<br>
+bool is_valid_vss_backup_type(VSS_BACKUP_TYPE vssBT)<br>
+{<br>
+=C2=A0 =C2=A0 return (vssBT &gt; VSS_BT_UNDEFINED &amp;&amp; vssBT &lt; VS=
S_BT_OTHER);<br>
+}<br>
+<br>
+VSS_BACKUP_TYPE get_vss_backup_type(<br>
+=C2=A0 =C2=A0 VSS_BACKUP_TYPE defaultVssBT =3D DEFAULT_VSS_BACKUP_TYPE)<br=
>
+{<br>
+=C2=A0 =C2=A0 VSS_BACKUP_TYPE vssBackupType;<br>
+<br>
+=C2=A0 =C2=A0 vssBackupType =3D static_cast&lt;VSS_BACKUP_TYPE&gt;(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 get_reg_dword_value(HKEY_LOCAL_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 QGA_PROVIDER_REGISTRY_ADDRESS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;VssOption&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 defaultVssBT));<br>
+=C2=A0 =C2=A0 if (!is_valid_vss_backup_type(vssBackupType)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return defaultVssBT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return vssBackupType;<br>
+}<br>
+<br>
=C2=A0void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *err=
set)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0COMPointer&lt;IVssAsync&gt; pAsync;<br>
diff --git a/qga/vss-win32/vss-handles.h b/qga/vss-win32/vss-handles.h<br>
index 0f8a741ad2..1a7d842129 100644<br>
--- a/qga/vss-win32/vss-handles.h<br>
+++ b/qga/vss-win32/vss-handles.h<br>
@@ -6,6 +6,9 @@<br>
=C2=A0#define QGA_PROVIDER_NAME &quot;QEMU Guest Agent VSS Provider&quot;<b=
r>
=C2=A0#define QGA_PROVIDER_LNAME L(QGA_PROVIDER_NAME)<br>
=C2=A0#define QGA_PROVIDER_VERSION L(QEMU_VERSION)<br>
+#define QGA_PROVIDER_REGISTRY_ADDRESS &quot;SYSTEM\\CurrentControlSet&quot=
;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\Service=
s&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\&quot; =
QGA_PROVIDER_NAME<br>
<br>
=C2=A0#define EVENT_NAME_FROZEN=C2=A0 &quot;Global\\QGAVSSEvent-frozen&quot=
;<br>
=C2=A0#define EVENT_NAME_THAW=C2=A0 =C2=A0 &quot;Global\\QGAVSSEvent-thaw&q=
uot;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--000000000000a275e105f4ba7728--


