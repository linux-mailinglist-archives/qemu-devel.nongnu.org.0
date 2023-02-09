Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47216913A8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFe7-0004dg-KB; Thu, 09 Feb 2023 17:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQFe0-0004dH-Mp
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQFdy-0005X5-Vv
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675982634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDr1dibQeDAGSKXhxQGb/VnHfecZuCXaP5UzVizuL6g=;
 b=PkK7SP4F7xvejarAPgASysseTu782CJJdJS3RU/6pETOra+TSzTJoARUDRNLX1BkSSETf8
 JY6sQeUfodwWzjx67ZWLUuGKLefLXs+tywuBOFZ4jjGJlHUNJ8+l0wuUnEOukgf+pNTXuZ
 GSM1wCGd3aNRuQiUKfgWPY2r2JG3ce4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-oFXMDSdIMumB0toYV6cy1Q-1; Thu, 09 Feb 2023 17:43:51 -0500
X-MC-Unique: oFXMDSdIMumB0toYV6cy1Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 j191-20020a1fa0c8000000b003f28932e90bso1419201vke.14
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDr1dibQeDAGSKXhxQGb/VnHfecZuCXaP5UzVizuL6g=;
 b=qeuv+bfDNA4zBuJgWr85cp4nThwzZH1IYPpv1nLIQuqtwjDNs4GeOc2Q2k2sKG0g3N
 JXROtriuxZiFk0M937frE9gk96vh6JT6xQz7nVu6cbEPmD/io6U95RyUByBG+JX0q1j3
 rrjYrM3bYZ6PsZiqFEclDBwz6Ss8xT9kubmueKCGp3JXAOohlilCayazSp2XZJyhRFls
 AdWGI731htKhH6uv/yiWHXLD5MHfOaFRfIU/ZEvAvhD2morIqL7wQ3gIVHe/6Vw5efKk
 ka8P2fH5VIi0VWiFFdjJk5S09RAk4rpNKOJMKG7OW+hwCtFKOXdkCcMLuniJlJm938MX
 uVbQ==
X-Gm-Message-State: AO0yUKWcBzQIVQH8TJRy+r3GHRBQQs79FBDlLSw7wKjolZeRF3A1QOV1
 xx8tl75MERrIcvGGq2kHlUEyxGGpO2V5qPkO4mOJuNQdXuxhyUjMVXLc2fNdjRBMTZvgo7OXxF0
 CDsfn7cuRUndFd2VyfZpgWSojheuTr6M=
X-Received: by 2002:a05:6102:2417:b0:411:b12d:af4b with SMTP id
 j23-20020a056102241700b00411b12daf4bmr2084931vsi.42.1675982630493; 
 Thu, 09 Feb 2023 14:43:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/domDum4rmmqFzuHX1arVZGUJLcJBlGCzsAL5x9m6T0BEeNv27JuHHLhWkjtjvw9RSSEu+7cqOZ1UEGKexT+U=
X-Received: by 2002:a05:6102:2417:b0:411:b12d:af4b with SMTP id
 j23-20020a056102241700b00411b12daf4bmr2084930vsi.42.1675982630078; Thu, 09
 Feb 2023 14:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
In-Reply-To: <20230209154034.983044-7-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Feb 2023 23:43:38 +0100
Message-ID: <CABgObfZ3taU=6=JB4MGeLfDsg6MhkLSUuYNH9unO0UjMSF4ciA@mail.gmail.com>
Subject: Re: [PATCH 6/7] CI: Stop building docs on centos8
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000050eb6305f44c1de8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000050eb6305f44c1de8
Content-Type: text/plain; charset="UTF-8"

Il gio 9 feb 2023, 16:40 John Snow <jsnow@redhat.com> ha scritto:

> CentOS 8 does not ship with a sphinx new enough for our purposes (It
> necessarily uses Python 3.6), so drop this from this build. We can
> resume building docs on CentOS 9 if we wish, but we also currently test
> and build docs on Fedora, Ubuntu, Alpine and Debian.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>

It's possible to teach lcitool to use pip instead to install docutils,
sphinx and sphinx-rtd-theme
Once we can drop the previous patch this one can go as well; as soon as the
last lcitool prerequisite is in (
https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341) I will pick the
rest of this series, if that's okay for you.

Paolo

---
>  .gitlab-ci.d/buildtest.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aa149a3524..0eb7f6606d4 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -166,7 +166,7 @@ build-system-centos:
>    variables:
>      IMAGE: centos8
>      CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
> -      --enable-modules --enable-trace-backends=dtrace --enable-docs
> +      --enable-modules --enable-trace-backends=dtrace
>        --enable-vfio-user-server
>      TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>        x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
> --
> 2.39.0
>
>

--00000000000050eb6305f44c1de8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 9 feb 2023, 16:40 John Snow &lt;<a href=3D"mail=
to:jsnow@redhat.com">jsnow@redhat.com</a>&gt; ha scritto:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">CentOS 8 does not ship with a sphinx new enough for =
our purposes (It<br>
necessarily uses Python 3.6), so drop this from this build. We can<br>
resume building docs on CentOS 9 if we wish, but we also currently test<br>
and build docs on Fedora, Ubuntu, Alpine and Debian.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s possible to tea=
ch lcitool to use pip instead to install docutils, sphinx and sphinx-rtd-th=
eme</div><div dir=3D"auto">Once we can drop the previous patch this one can=
 go as well; as soon as the last lcitool prerequisite is in (<a href=3D"htt=
ps://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341">https://gitlab.com=
/libvirt/libvirt-ci/-/merge_requests/341</a>) I will pick the rest of this =
series, if that&#39;s okay for you.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0.gitlab-ci.d/buildtest.yml | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml<br>
index 0aa149a3524..0eb7f6606d4 100644<br>
--- a/.gitlab-ci.d/buildtest.yml<br>
+++ b/.gitlab-ci.d/buildtest.yml<br>
@@ -166,7 +166,7 @@ build-system-centos:<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: centos8<br>
=C2=A0 =C2=A0 =C2=A0CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enab=
le-fdt=3Dsystem<br>
-=C2=A0 =C2=A0 =C2=A0 --enable-modules --enable-trace-backends=3Ddtrace --e=
nable-docs<br>
+=C2=A0 =C2=A0 =C2=A0 --enable-modules --enable-trace-backends=3Ddtrace<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-vfio-user-server<br>
=C2=A0 =C2=A0 =C2=A0TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64-softmmu rx-softmmu sh4-softmmu nios2-soft=
mmu<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div></div>

--00000000000050eb6305f44c1de8--


