Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6D6CEF86
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:34:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYkR-0003x3-Cs; Wed, 29 Mar 2023 12:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phYkO-0003wX-SZ
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:34:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phYkN-0002Xi-65
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:34:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id r29so16363452wra.13
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680107641;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2y9a0856zu5x8ML1Ab+5YfKAGk6SRy7ofJsSVYfQK2I=;
 b=GjL4jvkvYvxgUck+H3nhckeiOUmeEjaBkH04RsalXauQGhExNnycSKRDr5dzZn3fwU
 f7j3rAdkEoohKtO1/fqXJG2MC9ODp/nlsBbErNkQ41d7MlmJ3Z6k2Bb3EmkrPVwSbR9G
 TOfyOGPzvsKMyW4avEsufpCKnYniC/M1SO/OWenXzEKn6O3nIpuqbdpKXsd2E5q4YzsD
 89SZ4w1XmPFj82+x58wm4aub+SpvgR3+V9atDFBnpxKTraXb9FFFT/4t74QNSE5LhbEg
 dxhI6aDUJp4ApJ7wORtUySedOTjv/qqvzjhCsVrPXvcRz730Hjm6C5p4zPtemrQXaa9l
 xLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107641;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2y9a0856zu5x8ML1Ab+5YfKAGk6SRy7ofJsSVYfQK2I=;
 b=3aI7birXMD+FriXYd3G2SSguOfkvItqUrBcY8bVtMEwv5WpfPb38d+VaQiKIHnnC68
 R9aDFckIGNRZ1Y0E1p/BkCu/zJDdXXOVUZoY3yQxeCEdxbXrKC6pb4F6KCLt/ksWzj6y
 qD8QhGB7uvu3pUxvfpsqZchqrcdOVlxerQqtYX1VsEugXMrjefkLBH5REXeDwIewxd3Z
 T49WS/uuNWUaB56ZZT6cqYkFtuWUDcHL6tNoZZewIDgxop3tkR7z6o1S/FO0qbNVkdbm
 y2S9wwYS+b6FOQGvy7TdV6/kqZcJ5rmcDjAuxtwX8OBREHCMEYC91Umx5sgT9nGp6PRF
 1/Fw==
X-Gm-Message-State: AAQBX9e967BF7dB4ssDvdmrwitPS+rs9ZyCZ2VifBa8A17FMHzvdYRue
 YaNNo6iQrilhEUqW1tva1UYRJz9PJdpXFpJoQ2Y=
X-Google-Smtp-Source: AKy350ZrDKhf0gEKgBfHA14NoQ3JTFL8XiEcqSwR+AVpW7HmnD3izX7EdwuJmq4D5NHpZEg7MyMtfg==
X-Received: by 2002:a5d:6411:0:b0:2c7:1e16:57cf with SMTP id
 z17-20020a5d6411000000b002c71e1657cfmr15641938wru.67.1680107641013; 
 Wed, 29 Mar 2023 09:34:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056000120d00b002d7a75a2c20sm23312314wrx.80.2023.03.29.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 09:34:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 462241FFB7;
 Wed, 29 Mar 2023 17:34:00 +0100 (BST)
References: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marco Liebel <quic_mliebel@quicinc.com>
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] Use hexagon toolchain version 16.0.0
Date: Wed, 29 Mar 2023 17:33:54 +0100
In-reply-to: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
Message-ID: <87fs9nqzyf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Marco Liebel <quic_mliebel@quicinc.com> writes:

> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> index 5308ccb8fe..b99d99f943 100644
> --- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -27,7 +27,7 @@ RUN apt-get update && \
>=20=20
>=20=20
>  ENV TOOLCHAIN_INSTALL /opt
> -ENV TOOLCHAIN_RELEASE 15.0.3
> +ENV TOOLCHAIN_RELEASE 16.0.0
>  ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-un=
known-linux-musl"
>  ENV TOOLCHAIN_URL
> https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/=
v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz

Queued to for-8.0/more-misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

