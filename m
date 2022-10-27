Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7060F385
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:20:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyyC-0001pY-Pe; Thu, 27 Oct 2022 05:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyyA-0001j7-Fb
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:14:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyy7-00054a-4W
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:14:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bk15so1059390wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZGwdbEOXw949lT3yWyt5S6iSBH6m+8XdWD5xqo2RPRw=;
 b=SiK+nFIrGpFk78OASZMx5dh1BfdXLD14xkp3hWfVdWG63emC3PAEjRvlLYf8encrUC
 lE68u07gY7kv2wTgQbetb6WgSJ0U80/HS/ptq1qGaZwqvfjCuJeLWJAuS4LSc2yfpvmK
 HevRDhuoGJpwawcR/EGEdEy77c46yE4qGg4qlM6b761Gn1/Dc47QwmTjQLuG7+b0pCoa
 GIkNOGS1worNcHzcX5qnQg5GG4azuRP72AQebLT1oikoxtNoy+3OeSwvhlsTW2EMBow/
 28ztzxUuwRKewq00w1pCN5CcSFSq31Ej0dWDgzjZ6dwgNtqxWIpvBAmWUyFJ+MiNHDuD
 jPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZGwdbEOXw949lT3yWyt5S6iSBH6m+8XdWD5xqo2RPRw=;
 b=B0rA+BNsPMzBVY4GTF+M5MAONON8SjepO3id6sOb0kNWqCR27vgtvlxNJbgbR8KaQv
 2wCrEJi0KVd+dVblUbu4G9IX+dMHpln+YJ8fjsVpxuUT0Pn5jnncAmXcso1mKZzZNxD5
 2bBejAUV4psTPo6Zdp9VE1PmHzx4Q7YF4tVnuT7l/HeriXcBcSsPSm5rPBkYDGT+DdEQ
 dKdcXi4HIYx8IeMYo/mORpS84VaYKJhUJx8COJQHI7QZV97SPG+Hp6ws6qs9PgVUv/DU
 Ptv0EO5MdBBhBgbiENL0LsSx0JjxN0RhRJoMPS/XeAH78PpPMrywLn4dV0a1zdsKTITk
 z36g==
X-Gm-Message-State: ACrzQf0y9ov2tvM3JMvxM9dfwwjp34iUtDJUA/iJQYdBd24R1K+7jXw9
 bXwUr5hCJaZHLTwflDxra/RvRA==
X-Google-Smtp-Source: AMsMyM6u7ZhWLfIdgCKLSw8N5NFDf333geBEWeiu0NdL0/9VFrxXMHyYnYkmq/Yx0I7xnG3tppNcIw==
X-Received: by 2002:a5d:51c2:0:b0:236:7000:8e82 with SMTP id
 n2-20020a5d51c2000000b0023670008e82mr13358127wrv.191.1666862067237; 
 Thu, 27 Oct 2022 02:14:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b0023655e51c33sm675268wrt.4.2022.10.27.02.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:14:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56F571FFB7;
 Thu, 27 Oct 2022 10:14:26 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-13-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: stefano.stabellini@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 12/12] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Thu, 27 Oct 2022 10:14:03 +0100
In-reply-to: <20221015050750.4185-13-vikram.garhwal@amd.com>
Message-ID: <87tu3p1vd9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> have_xen_pci_passthrough is only used for Xen x86 VMs.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I think this might want to before 11/12. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 0027d7d195..43e70936ee 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1454,6 +1454,8 @@ have_xen_pci_passthrough =3D get_option('xen_pci_pa=
ssthrough') \
>             error_message: 'Xen PCI passthrough requested but Xen not ena=
bled') \
>    .require(targetos =3D=3D 'linux',
>             error_message: 'Xen PCI passthrough not available on this pla=
tform') \
> +  .require(cpu =3D=3D 'x86'  or cpu =3D=3D 'x86_64',
> +           error_message: 'Xen PCI passthrough not available on this pla=
tform') \
>    .allowed()


--=20
Alex Benn=C3=A9e

