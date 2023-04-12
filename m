Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F46E0046
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:01:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmha0-0004On-8i; Wed, 12 Apr 2023 17:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmhZs-0004N0-0U
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmhZn-0006dC-JY
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681333209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSgrMi+Mi2AOQ4axjkxb0nfFcKvvAKezs24AWJGYdHg=;
 b=jLBjo58dWHrCCeQwC5TLhxnJExt4LMTAeNEmvXGGkn4oD4LhN1MNoUpY1Jj1etDjPw8qUg
 VPnKQiGGmApJEsod5HfcjM+5R4glYN/WYIVEHwF+Lfn99D5P7K8iwA7qsz0Oj1JFilRw4b
 n1C/Ru4HR3wKjgtcQaTQ19WWmrjjA1Y=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-3NaJ8M73PqOI5VpHrzYNlw-1; Wed, 12 Apr 2023 17:00:08 -0400
X-MC-Unique: 3NaJ8M73PqOI5VpHrzYNlw-1
Received: by mail-pg1-f198.google.com with SMTP id
 g129-20020a636b87000000b005072b17a298so5507525pgc.14
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333207; x=1683925207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iSgrMi+Mi2AOQ4axjkxb0nfFcKvvAKezs24AWJGYdHg=;
 b=V0tB98l1caQYswGJG3hqkHpYY8FivrxwN531Mm3HpDLFPGHb1bhWYpIEydU7aDulnq
 z8lJ45aFcTPPXSrSnBFTcICgW2Wr4t0Y4GzuVI7Fhtce9AY+iat4HZBgQmHhv8WX/5ko
 GR+FJ5bj/U9SR2w7bMzsXve3aakzWTE9dgCRjNEBGjbVt+JwpLKKLX85T6GlvVsENRX+
 ewSy65HzLE8+FOa/UnAxl+nrHttHlAaa+UqGLsR0MvaOHeGFPwPdLJvtS9NSuBH6nJAn
 27Yq1UqYobkt2vPHxJLH1frjc8YA0gUCuFo6d4yvFC5f4HeuvECGv3SoM5l+6DpI3Z/H
 OVMw==
X-Gm-Message-State: AAQBX9et7qMedVFynyD7+mOPBEm3hesBvrVioaQ+/Wemf8xU43WMSbWP
 4O3Og3Z1uiV4Wb3f46O6Ew5UR6PtbeQAk8pq62U40hmzOGs4xLQAJslhtpmDe7jx/VzZRNL4ti5
 26KOTETcmkvKCg2tSz48MX4jwkFQn6HM=
X-Received: by 2002:a63:2111:0:b0:503:a26e:b4cf with SMTP id
 h17-20020a632111000000b00503a26eb4cfmr5079789pgh.8.1681333207227; 
 Wed, 12 Apr 2023 14:00:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSLEvxp1u+UVLJwP65EXqhBPjcIAasiPOifSLXxnij5I5+olwUIwhF5/hlybEpBYF2rf9GrvuLRqc7P1s8BO0=
X-Received: by 2002:a63:2111:0:b0:503:a26e:b4cf with SMTP id
 h17-20020a632111000000b00503a26eb4cfmr5079768pgh.8.1681333206854; Wed, 12 Apr
 2023 14:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230329124601.822209-1-berrange@redhat.com>
In-Reply-To: <20230329124601.822209-1-berrange@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Apr 2023 16:59:55 -0400
Message-ID: <CAFn=p-YU_0YXrZ-TF-QSQak1vCJwtxE7yDNYAHQX_OV75YR=DA@mail.gmail.com>
Subject: Re: [PATCH] tests/vm: use the default system python for NetBSD
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Warner Losh <imp@bsdimp.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 29, 2023 at 8:47=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.

Is this the default Python, or does it just happen to be the python
that one of our other dependencies claims to require? From my notes on
the mkvenv.py work, I had actually changed this over to requiring
Python 3.10, because it appeared at the time that NetBSD only shipped
pip for 3.10.

e.g. https://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/index-all.html
you can see here we've got "py310-pip" but I don't see "py39-pip". The
only other pip I see is py27-pip.

The impression I got was:

1) There's no such thing as a "default" python for NetBSD,
2) The best Python to use on this platform is currently 3.10.

I'm not very familiar with NetBSD though, so it's definitely possible
I misunderstood something.

--js

>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/vm/netbsd | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index aa54338dfa..0b9536ca17 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
>          "git-base",
>          "pkgconf",
>          "xz",
> -        "python37",
>          "ninja-build",
>
>          # gnu tools
> @@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
>          mkdir src build; cd src;
>          tar -xf /dev/rld1a;
>          cd ../build
> -        ../src/configure --python=3Dpython3.7 --disable-opengl {configur=
e_opts};
> +        ../src/configure --disable-opengl {configure_opts};
>          gmake --output-sync -j{jobs} {target} {verbose};
>      """
>      poweroff =3D "/sbin/poweroff"
> --
> 2.39.1
>
>


