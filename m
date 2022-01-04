Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB069483F18
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:23:39 +0100 (CET)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4g2c-0007Zd-Tt
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n4g1Q-0006PN-Jg
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n4g1O-0008SJ-HG
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641288141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpPbMs6w49sFOKkrthipgLc9y9OJDJtApyK1XofcVnU=;
 b=hKBoTGRtTyMrSnGQYV4CLPx80o1w65kGnuz/W/7eYyl9404EUMa8HOzFC4sOfMPXC5yj/Q
 e4VHHFJhsNavbDra6ScwVKZPpMe1o751/Rzk46rSY081iCVpL6gB9LSmA60zx193KNJeDb
 ekE6SBcGOfrfdZhUMsThJIRiUxQ4pA0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-IZszrnsrPPSlttnBGTvtrw-1; Tue, 04 Jan 2022 04:22:19 -0500
X-MC-Unique: IZszrnsrPPSlttnBGTvtrw-1
Received: by mail-pf1-f199.google.com with SMTP id
 c74-20020a621c4d000000b004bbfc8d62d5so10901349pfc.18
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kpPbMs6w49sFOKkrthipgLc9y9OJDJtApyK1XofcVnU=;
 b=1amr8I07d+PmkxLW746BMBDQ+qMcnKkzNla+7bgmZqc6JElyyTcgXZtMUQ+lAL4gJM
 jFLtgUNoVHoFSfltADRf2wP2DYeX4NbVwykfUhr6YJrsP0JvyouegBzhI1lr97tF1627
 srqOntIEkGMq8iWDQT4c7n1z9GpvMYJR8/O0faZ26dFPRBm1re5J8LRskZFyX4NUNw0M
 UP9x3cgcRQlEvswCNAYV8G5Mop4fs91hJue0rWNvgSNluasrCibCJRRbi2GhClRNDips
 2ZE/pvySuA0gGkENoudjM66qdYAQlZLuamXwP8IrLTNOKtcZJPLIBz8JaBDMZcy973Q+
 BDJw==
X-Gm-Message-State: AOAM530XYs1yx08ieBevUPMazRyQwzSmsMaCOFt2cdVc7IChKlcMGJ50
 8NKShdCjXFS4VjkeMEmha2cIoHI+CH2Nx+/xXRLC3TUCvGVuGkoLSy0liwn7HjXkmvmAOR7FmXv
 1LaNqNqjwjCvIMQ/mNqo+JDk4JGYqbpw=
X-Received: by 2002:a05:6a00:2349:b0:4ba:98c6:48f6 with SMTP id
 j9-20020a056a00234900b004ba98c648f6mr50281807pfj.42.1641288138881; 
 Tue, 04 Jan 2022 01:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyXYhkU6lzA4q7pfqmF/EDFPEXCEO2c2ztYIn7xvD6z67Wu5AjyaOC21m+15h0iKYTcGDBAPxUhaCCI25yFlk=
X-Received: by 2002:a05:6a00:2349:b0:4ba:98c6:48f6 with SMTP id
 j9-20020a056a00234900b004ba98c648f6mr50281779pfj.42.1641288138584; Tue, 04
 Jan 2022 01:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20220104091240.160867-1-thuth@redhat.com>
In-Reply-To: <20220104091240.160867-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 4 Jan 2022 13:22:07 +0400
Message-ID: <CAMxuvawfYGyhEnf3q8djozK5XW3aRe4Tt+z_xC-yoUGDTRNSkg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Enable docs in the centos job
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 1:12 PM Thomas Huth <thuth@redhat.com> wrote:
>
> We just ran into a problem that the docs don't build on RHEL8 / CentOS 8
> anymore. Seems like these distros are using one of the oldest Sphinx
> versions that we still have to support. Thus enable the docs build in
> the CI on CentOS so that such bugs don't slip in so easily again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  Based-on: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
>
>  .gitlab-ci.d/buildtest.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index d52fde23ec..083d1b25e5 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -164,7 +164,7 @@ build-system-centos:
>    variables:
>      IMAGE: centos8
>      CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=3Dsyst=
em
> -                    --enable-modules --enable-trace-backends=3Ddtrace
> +      --enable-modules --enable-trace-backends=3Ddtrace --enable-docs
>      TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>        x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
>      MAKE_CHECK_ARGS: check-build
> --
> 2.27.0
>


