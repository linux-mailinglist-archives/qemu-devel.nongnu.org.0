Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B7301B6D
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 12:36:06 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3dgb-0004x6-Fq
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 06:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3ddm-0003mE-Vd
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 06:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3ddg-0006Bu-FQ
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 06:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611487982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCLS2mJWvAC52M73XpszpbWBl3BIbML8VJiQd1bsj3Q=;
 b=Vislh94G5mha3RktBjoDkOPh3/sNrfdAtmPCvRS14bYe8z9WWHjI4ywXWa0jYz+4H1HNP8
 6VUfCcTJAmf+dRgnJlJakiHBGmxyzCacjKtdJCyTMI+MZxdmLPv4yEMfNXFApxUBkG2eVx
 TjVaF+Y4FYtHLNh4CTU7iGxcjIWs3gs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-cnqwFSI2MOCIv9PAKpv4jA-1; Sun, 24 Jan 2021 06:33:00 -0500
X-MC-Unique: cnqwFSI2MOCIv9PAKpv4jA-1
Received: by mail-pj1-f71.google.com with SMTP id l7so6663166pjy.0
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 03:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCLS2mJWvAC52M73XpszpbWBl3BIbML8VJiQd1bsj3Q=;
 b=tTIqswejXOudHaK5YhPRiG5QfUtTFciymrxOFqDF7Nc7VX3VAKX5isirR3/uSI6NBa
 8JaDLxEpexH/ecpXT2AlqQrqyrRPV5WMloMsp1Dhc91bn30579s4GYB4tt9zGhouIvYY
 zhEyizVLp+kzhVIB1ed8sz4P9ZEbRVemUPXylX8wzSDisiDkT8u0JqkaLuoadEZ0o++d
 UINLZa+7eCsPWMmKzPC6o8XsfLksJcz+gnSbbQOGkeApZrwRgVnBMdKr15wAYNm2S2oD
 eVmxXtxg4zw17Otr3y1W21NLcVFIkYrF9K40u1JFCmr3/CB/xu8GJS++BFTB4FFQfYA7
 vq+A==
X-Gm-Message-State: AOAM531Zh9RYg8CDJIJx04nWAY2mA3PoTWJqDVQ7JaWTbgY6tYvoysGK
 Gm8ADEJCGrnhR5bTXTF4hVx1Vv8WU+Z4xnw4C/bAY/lUg3niYrSTFPicgjq1NN5bY3T7jFSZWMy
 AcC0M1LP50FRw7v8x8KB16Dx4dTRSpZU=
X-Received: by 2002:a17:90b:b0b:: with SMTP id
 bf11mr10770406pjb.122.1611487979523; 
 Sun, 24 Jan 2021 03:32:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHGXa/CwOruQ9MG200YyxHSYCvuB4OYempGHsTSLWx4QxnkIgySBcjm2W42MF+JmEfUtkJ3aHmddus35eAVUI=
X-Received: by 2002:a17:90b:b0b:: with SMTP id
 bf11mr10770386pjb.122.1611487979326; 
 Sun, 24 Jan 2021 03:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20210124075848.53971-1-thuth@redhat.com>
In-Reply-To: <20210124075848.53971-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 24 Jan 2021 12:32:47 +0100
Message-ID: <CABgObfbxY_ETKF6V9QYh2rQeF0fRD5EVWjJtnyyexc2qe5CMgQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009163ea05b9a3c8bf"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009163ea05b9a3c8bf
Content-Type: text/plain; charset="UTF-8"

check-block is not run by "meson test".

Paolo

Il dom 24 gen 2021, 08:58 Thomas Huth <thuth@redhat.com> ha scritto:

> Currently, our check-system-* jobs are recompiling the whole sources
> again. This happens due to the fact that the jobs are checking out
> the whole source tree and required submodules again, and only try
> to use the "build" directory with the binaries and object files
> as an artifact from the previous stage - which simply does not work
> anymore (with the current version of meson). Due to some changed
> time stamps, meson is always trying to rebuild the whole tree.
>
> To fix this problem, use "meson test --no-rebuild" instead of
> "make check" to avoid rebuilding all binaries every time. This
> saves ca. 15 - 20 minutes of precious CI cycles in each run.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Marked as "RFC" since I'm not quite sure whether "meson test" has
>  the same test coverage as "make check"... Paolo?
>
>  .gitlab-ci.yml | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b5..c9fb11c325 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -34,6 +34,19 @@ include:
>          make -j"$JOBS" $MAKE_CHECK_ARGS ;
>        fi
>
> +.native_meson_test_job:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - cd build
> +    - touch *
> +    - make git-submodule-update
> +    - if [ -x ../meson/meson.py ]; then
> +          ../meson/meson.py test --no-rebuild -t 5 $MESON_TEST_ARGS ;
> +      else
> +          meson test --no-rebuild -t 5 $MESON_TEST_ARGS ;
> +      fi
> +
>  .native_test_job_template: &native_test_job_definition
>    stage: test
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> @@ -83,17 +96,15 @@ build-system-alpine:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - .git-submodule-status
>        - build
>
>  check-system-alpine:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-alpine
>        artifacts: true
>    variables:
>      IMAGE: alpine
> -    MAKE_CHECK_ARGS: check
>
>  acceptance-system-alpine:
>    <<: *native_test_job_definition
> @@ -118,13 +129,12 @@ build-system-ubuntu:
>        - build
>
>  check-system-ubuntu:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
>      IMAGE: ubuntu2004
> -    MAKE_CHECK_ARGS: check
>
>  acceptance-system-ubuntu:
>    <<: *native_test_job_definition
> @@ -149,13 +159,12 @@ build-system-debian:
>        - build
>
>  check-system-debian:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-debian
>        artifacts: true
>    variables:
>      IMAGE: debian-amd64
> -    MAKE_CHECK_ARGS: check
>
>  # No targets are built here, just tools, docs, and unit tests. This
>  # also feeds into the eventual documentation deployment steps later
> @@ -194,13 +203,12 @@ build-system-fedora:
>        - build
>
>  check-system-fedora:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-fedora
>        artifacts: true
>    variables:
>      IMAGE: fedora
> -    MAKE_CHECK_ARGS: check
>
>  acceptance-system-fedora:
>    <<: *native_test_job_definition
> @@ -226,13 +234,12 @@ build-system-centos:
>        - build
>
>  check-system-centos:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-centos
>        artifacts: true
>    variables:
>      IMAGE: centos8
> -    MAKE_CHECK_ARGS: check
>
>  acceptance-system-centos:
>    <<: *native_test_job_definition
> @@ -256,13 +263,12 @@ build-system-opensuse:
>        - build
>
>  check-system-opensuse:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-system-opensuse
>        artifacts: true
>    variables:
>      IMAGE: opensuse-leap
> -    MAKE_CHECK_ARGS: check
>
>  acceptance-system-opensuse:
>     <<: *native_test_job_definition
> @@ -525,13 +531,12 @@ build-crypto-old-nettle:
>        - build
>
>  check-crypto-old-nettle:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-crypto-old-nettle
>        artifacts: true
>    variables:
>      IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
>
>
>  build-crypto-old-gcrypt:
> @@ -546,13 +551,12 @@ build-crypto-old-gcrypt:
>        - build
>
>  check-crypto-old-gcrypt:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-crypto-old-gcrypt
>        artifacts: true
>    variables:
>      IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
>
>
>  build-crypto-only-gnutls:
> @@ -567,13 +571,12 @@ build-crypto-only-gnutls:
>        - build
>
>  check-crypto-only-gnutls:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>    needs:
>      - job: build-crypto-only-gnutls
>        artifacts: true
>    variables:
>      IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
>
>  # We don't need to exercise every backend with every front-end
>  build-trace-multi-user:
> --
> 2.27.0
>
>

--0000000000009163ea05b9a3c8bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">check-block is not run by &quot;meson test&quot;.<div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il dom 24 gen 2021, 08:58 =
Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt=
; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently, our check-=
system-* jobs are recompiling the whole sources<br>
again. This happens due to the fact that the jobs are checking out<br>
the whole source tree and required submodules again, and only try<br>
to use the &quot;build&quot; directory with the binaries and object files<b=
r>
as an artifact from the previous stage - which simply does not work<br>
anymore (with the current version of meson). Due to some changed<br>
time stamps, meson is always trying to rebuild the whole tree.<br>
<br>
To fix this problem, use &quot;meson test --no-rebuild&quot; instead of<br>
&quot;make check&quot; to avoid rebuilding all binaries every time. This<br=
>
saves ca. 15 - 20 minutes of precious CI cycles in each run.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0Marked as &quot;RFC&quot; since I&#39;m not quite sure whether &quot;=
meson test&quot; has<br>
=C2=A0the same test coverage as &quot;make check&quot;... Paolo?<br>
<br>
=C2=A0.gitlab-ci.yml | 41 ++++++++++++++++++++++-------------------<br>
=C2=A01 file changed, 22 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml<br>
index de3a3d25b5..c9fb11c325 100644<br>
--- a/.gitlab-ci.yml<br>
+++ b/.gitlab-ci.yml<br>
@@ -34,6 +34,19 @@ include:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make -j&quot;$JOBS&quot; $MAKE_CHECK_ARGS=
 ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
+.native_meson_test_job:<br>
+=C2=A0 stage: test<br>
+=C2=A0 image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest<br>
+=C2=A0 script:<br>
+=C2=A0 =C2=A0 - cd build<br>
+=C2=A0 =C2=A0 - touch *<br>
+=C2=A0 =C2=A0 - make git-submodule-update<br>
+=C2=A0 =C2=A0 - if [ -x ../meson/meson.py ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../meson/meson.py test --no-rebuild -t =
5 $MESON_TEST_ARGS ;<br>
+=C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meson test --no-rebuild -t 5 $MESON_TES=
T_ARGS ;<br>
+=C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0.native_test_job_template: &amp;native_test_job_definition<br>
=C2=A0 =C2=A0stage: test<br>
=C2=A0 =C2=A0image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest<br>
@@ -83,17 +96,15 @@ build-system-alpine:<br>
=C2=A0 =C2=A0artifacts:<br>
=C2=A0 =C2=A0 =C2=A0expire_in: 2 days<br>
=C2=A0 =C2=A0 =C2=A0paths:<br>
-=C2=A0 =C2=A0 =C2=A0 - .git-submodule-status<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-alpine:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-alpine<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: alpine<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0acceptance-system-alpine:<br>
=C2=A0 =C2=A0&lt;&lt;: *native_test_job_definition<br>
@@ -118,13 +129,12 @@ build-system-ubuntu:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-ubuntu:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-ubuntu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: ubuntu2004<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0acceptance-system-ubuntu:<br>
=C2=A0 =C2=A0&lt;&lt;: *native_test_job_definition<br>
@@ -149,13 +159,12 @@ build-system-debian:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-debian:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-debian<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: debian-amd64<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0# No targets are built here, just tools, docs, and unit tests. This<b=
r>
=C2=A0# also feeds into the eventual documentation deployment steps later<b=
r>
@@ -194,13 +203,12 @@ build-system-fedora:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-fedora:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-fedora<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: fedora<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0acceptance-system-fedora:<br>
=C2=A0 =C2=A0&lt;&lt;: *native_test_job_definition<br>
@@ -226,13 +234,12 @@ build-system-centos:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-centos:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-centos<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: centos8<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0acceptance-system-centos:<br>
=C2=A0 =C2=A0&lt;&lt;: *native_test_job_definition<br>
@@ -256,13 +263,12 @@ build-system-opensuse:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-system-opensuse:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-system-opensuse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: opensuse-leap<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0acceptance-system-opensuse:<br>
=C2=A0 =C2=A0 &lt;&lt;: *native_test_job_definition<br>
@@ -525,13 +531,12 @@ build-crypto-old-nettle:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-crypto-old-nettle:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-crypto-old-nettle<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: centos7<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
<br>
=C2=A0build-crypto-old-gcrypt:<br>
@@ -546,13 +551,12 @@ build-crypto-old-gcrypt:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-crypto-old-gcrypt:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-crypto-old-gcrypt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: centos7<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
<br>
=C2=A0build-crypto-only-gnutls:<br>
@@ -567,13 +571,12 @@ build-crypto-only-gnutls:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- build<br>
<br>
=C2=A0check-crypto-only-gnutls:<br>
-=C2=A0 &lt;&lt;: *native_test_job_definition<br>
+=C2=A0 extends: .native_meson_test_job<br>
=C2=A0 =C2=A0needs:<br>
=C2=A0 =C2=A0 =C2=A0- job: build-crypto-only-gnutls<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts: true<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0IMAGE: centos7<br>
-=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check<br>
<br>
=C2=A0# We don&#39;t need to exercise every backend with every front-end<br=
>
=C2=A0build-trace-multi-user:<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--0000000000009163ea05b9a3c8bf--


