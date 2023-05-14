Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5495701F82
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 22:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyINd-0008M8-Ae; Sun, 14 May 2023 16:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyINa-0008Lk-S9
 for qemu-devel@nongnu.org; Sun, 14 May 2023 16:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyINV-0000qZ-PO
 for qemu-devel@nongnu.org; Sun, 14 May 2023 16:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684096296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEpao/9yT45HyzVMat0eG+MySLpre/LHqwf4QM0KYc4=;
 b=fKvxp22j7VNhermeWdcS5RzWkvpXEsanGwfMmXKHdTTXyGp/ilNgNVBt8wQ7wNorZ+ta6E
 qw9VVw4uiGvLJ7VTTfbfcStY6hAqDzgldtr3elomUkQleWPpT6ZJevvO3bO4cqQ9+eXGV+
 BWVVTHG85InJpnREpfU8sdnOcaPsg0Q=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-o9nFOsxAMeayrn0ZE2seig-1; Sun, 14 May 2023 16:31:34 -0400
X-MC-Unique: o9nFOsxAMeayrn0ZE2seig-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-43604b7f1a7so2004892137.1
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684096294; x=1686688294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEpao/9yT45HyzVMat0eG+MySLpre/LHqwf4QM0KYc4=;
 b=JZGFx9wHM4I18GKV045qwbVteiyWMuTOZCOjlpxzBb/LvJwQX+8h7z69ybsiBE3SgP
 SOEx/ZGK6iM/lQgV7260cv3y2qAsv/P2yn66XpmxgmpM5bKRJ42FMktVB2wZ6xkNwjta
 atY1KkND6yOwFswkDoZvN9sSkTs9SItH5LIfJymDdAdbKFDeVmOsAhOo6ggLmnVJqHhL
 70t28J89I+PNVaH+qGgpCyxLwNPY1LGbTsTBwBhhbQ6yes6QiSb9eLr4whgjIdnInQRL
 sS9itEFYmZmJ5QV5k/mZOvEC1Q3xS6NcqGwcONF68kacB0nXFhfr2aP/5TiKCqJC4TtI
 ZOgg==
X-Gm-Message-State: AC+VfDwZiWn55pjwmp/BJWAOeNE3wub1j6f/N+yH6FIvUVXG6Ivn0cvR
 +7zmit1RlzNjiOsy+EFLX/GwcCMDXivSqIL6TCMvWCkT3nJJApnRNmVG4Ow/6ULcUSbXL/ZtDZI
 +R8YjWD1p6nwqv7XaWzrWpl9P+T9RKKo=
X-Received: by 2002:a67:f48f:0:b0:436:211d:8f42 with SMTP id
 o15-20020a67f48f000000b00436211d8f42mr7699582vsn.19.1684096293910; 
 Sun, 14 May 2023 13:31:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Gk1M1zWOqPSP4aZjScjuGSPKNMh9Pm77pD+6CczeyadunhTVhvpzRcL3ficYzRVXegBFSlCRXEazP7mDxSyY=
X-Received: by 2002:a67:f48f:0:b0:436:211d:8f42 with SMTP id
 o15-20020a67f48f000000b00436211d8f42mr7699576vsn.19.1684096293606; Sun, 14
 May 2023 13:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230512124033.502654-1-thuth@redhat.com>
 <20230512124033.502654-17-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-17-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 14 May 2023 22:31:23 +0200
Message-ID: <CABgObfbbpsUt6yn6XWDy=HS8z_ZDs088w1wgFk_cx3A8ZAizUg@mail.gmail.com>
Subject: Re: [PATCH 16/18] tests/qtest/meson.build: Run the net filter tests
 only with default devices
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000592b5005fbad3923"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000592b5005fbad3923
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 12 mag 2023, 14:41 Thomas Huth <thuth@redhat.com> ha scritto:

> These tests rely on a default NIC to be available. Skip them if we
> used the "--without-default-devices" configure option.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

This is the only patch I have some qualms about, because it reduces
coverage in legitimate setups where the default NIC _is_ included in the
binary.

Still a lot better than before, but please add a FIXME here. We can perhaps
try to use QMP to check if the machines have a usable default NIC, and if
not skip the test, but this should not block the bulk of your work from
being merged.

So, apart from this issue, series

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

(Since I have only skimmed the contents of the individual patches but liked
them enough=E2=80=94or disliked for this one...=E2=80=94to reply already).

Paolo


---
>  tests/qtest/meson.build | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 48cd35b5b2..8fec3103b5 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -35,9 +35,9 @@ qtests_cxl =3D \
>    (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
>
>  qtests_filter =3D \
> -  (slirp.found() ? ['test-netfilter'] : []) + \
> -  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + =
\
> -  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> +  (get_option('default_devices') and slirp.found() ? ['test-netfilter'] =
:
> []) + \
> +  (get_option('default_devices') and config_host.has_key('CONFIG_POSIX')
> ? ['test-filter-mirror'] : []) + \
> +  (get_option('default_devices') and config_host.has_key('CONFIG_POSIX')
> ? ['test-filter-redirector'] : [])
>
>  qtests_i386 =3D \
>    (slirp.found() ? ['pxe-test'] : []) + \
> @@ -221,9 +221,7 @@ qtests_aarch64 =3D \
>     'migration-test']
>
>  qtests_s390x =3D \
> -  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +
>  \
> -  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>                        \
> -  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> +                     \
> +  qtests_filter + \
>    ['boot-serial-test',
>     'drive_del-test',
>     'device-plug-test',
> --
> 2.31.1
>
>

--000000000000592b5005fbad3923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 12 mag 2023, 14:41 Thomas Huth &lt;<a href=3D"m=
ailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">These tests rely on a default NIC to be available=
. Skip them if we<br>
used the &quot;--without-default-devices&quot; configure option.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">This is the only pat=
ch I have some qualms about, because it reduces coverage in legitimate setu=
ps where the default NIC _is_ included in the binary.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Still a lot better than before, but please ad=
d a FIXME here. We can perhaps try to use QMP to check if the machines have=
 a usable default NIC, and if not skip the test, but this should not block =
the bulk of your work from being merged.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">So, apart from this issue, series</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pb=
onzini@redhat.com">pbonzini@redhat.com</a>&gt;</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">(Since I have only skimmed the contents of the indiv=
idual patches but liked them enough=E2=80=94or disliked for this one...=E2=
=80=94to reply already).</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0tests/qtest/meson.build | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 48cd35b5b2..8fec3103b5 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -35,9 +35,9 @@ qtests_cxl =3D \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_CXL&#39;) ? [&#39;cxl-=
test&#39;] : [])<br>
<br>
=C2=A0qtests_filter =3D \<br>
-=C2=A0 (slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
-=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) + \<br>
-=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : [])<br>
+=C2=A0 (get_option(&#39;default_devices&#39;) and slirp.found() ? [&#39;te=
st-netfilter&#39;] : []) + \<br>
+=C2=A0 (get_option(&#39;default_devices&#39;) and config_host.has_key(&#39=
;CONFIG_POSIX&#39;) ? [&#39;test-filter-mirror&#39;] : []) + \<br>
+=C2=A0 (get_option(&#39;default_devices&#39;) and config_host.has_key(&#39=
;CONFIG_POSIX&#39;) ? [&#39;test-filter-redirector&#39;] : [])<br>
<br>
=C2=A0qtests_i386 =3D \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;pxe-test&#39;] : []) + \<br>
@@ -221,9 +221,7 @@ qtests_aarch64 =3D \<br>
=C2=A0 =C2=A0 &#39;migration-test&#39;]<br>
<br>
=C2=A0qtests_s390x =3D \<br>
-=C2=A0 (slirp.found() ? [&#39;pxe-test&#39;, &#39;test-netfilter&#39;] : [=
]) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 qtests_filter + \<br>
=C2=A0 =C2=A0[&#39;boot-serial-test&#39;,<br>
=C2=A0 =C2=A0 &#39;drive_del-test&#39;,<br>
=C2=A0 =C2=A0 &#39;device-plug-test&#39;,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div></div>

--000000000000592b5005fbad3923--


