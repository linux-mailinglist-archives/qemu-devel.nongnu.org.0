Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6863AE6B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 18:06:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhVM-0002Cx-RR; Mon, 28 Nov 2022 12:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhUx-000200-Fp
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:00:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhUu-0000Iu-SG
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:00:50 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so12166583wmb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aTBdieAxgYCWlyf3l/LF2mL57RvGl8oEDFb1SJIXmk=;
 b=JpLp9YLHW+9AfvSZi8wJPCYrwd0gmiVQltZ06+4KIWxhCyxUdrDEsAdRWTrkLH9oOV
 D/QSi/xu70jtBYau/SLvNffgrBWvwCLnXTX/cc1CMpddhX1hmsmdLz458MsborqGBZyw
 H6hb3mcb52DGW+IaCJ/1QiNMInvoVwA23IuhOg683NuDjLDoQy5LjpCqoKVz9O8Ys7d5
 OmJJU0bjvsp/H1dI4bZnwwBbw8+UurAQL8nh0ecOO5X7Rwh91Aude9rzfIRlDSnWmDrW
 flW4TBQigJPvkFjg6imqMdhRER9l9MDwMlGXPbImPU7o1VMzvTRmfAEz5KGzHio/jJ5S
 p+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4aTBdieAxgYCWlyf3l/LF2mL57RvGl8oEDFb1SJIXmk=;
 b=6D7s4bQwNrNuo2wSnaMYRWHoG2KWzKhsJxdnS1jVuHFDZV6PVTQq4BhFnT5zD3bCsn
 DfWcvHIFnHqc1b7YGw5+LHMZy1b53YQiYMHFyBnDfYshUu0f3g/rLT/cYEVx3jwX2Ayk
 DuSIJ/IJEn79uIHF7hRnwvMPDgLR+pYVYjRxRXKjHyYf8m1g8e/7/X3Ckguzuzln4Ozb
 veHvzBp+kNaR2SkAPqyIXoy7m7uvZlgl0JJlTkpx750nUAeUnP53CnaGt262o14qFFKZ
 MkaBPCByPiuVeUDHG4W8p7sRftjXoReBKtzoa+NzPMV4P0GiB1MaQKOPNEyIgo/uamo8
 ZRJg==
X-Gm-Message-State: ANoB5pkZAm4XGoJtSSBbFX7w8dKtWi0/zmzRQGjYF2lz/scMvqKhEQo0
 GXu8DYhrOwtm/Bn7I6TAH9LQIA==
X-Google-Smtp-Source: AA0mqf4Ltqr/dQXYNnLeQMxEOFlY2w3Mc4Pi1aAYjoTSov/BWgiSv0L7oSIgpcCFICjXSH/PR6ei7g==
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id
 n18-20020a05600c4f9200b003cfe87a8068mr32586897wmq.3.1669654847224; 
 Mon, 28 Nov 2022 09:00:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm11211303wri.68.2022.11.28.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:00:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 610291FFB7;
 Mon, 28 Nov 2022 17:00:46 +0000 (GMT)
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-6-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-8.0 5/5] scripts/make-release: Move roms into
 separate tarball
Date: Mon, 28 Nov 2022 16:58:57 +0000
In-reply-to: <20221128092555.37102-6-thuth@redhat.com>
Message-ID: <877czfxbcx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> Our current release tarballs are huge and caused already some trouble
> with the server traffic in the past. However, the biggest chunk (~80%)
> of the tarball is caused by the firmware sources - which most users
> don't need anyway (assuming that they just want to compile QEMU itself
> on their own). So we can certainly safe a lot of traffic by moving
> the firmware sources into a separate tarball, so that only people who
> really want to rebuild the firmware images on their own have to
> download it.
>
> This decreases the size of the main QEMU xz tarball from ca. 116 MiB
> to only 27 MiB!
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/make-release | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index febeb6cb36..44408c24a2 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -42,6 +42,19 @@ git submodule update --init --single-branch
>          CryptoPkg/Library/OpensslLib/openssl \
>          MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>=20=20
> +tar --exclude=3D".git*" -cjf ../qemu-rom-sources-${version}.tar.bz2 roms
> +rm -r roms/*
> +
> +cat > roms/README.rst <<EOF
> +Please download the qemu-rom-sources-${version}.tar.bz2 tarball
> +and unpack it in the topmost directory of the QEMU sources in
> +case you want to recompile the QEMU ROM images.
> +EOF
> +cat > roms/Makefile <<EOF
> +%:
> +	@cat README.rst
> +EOF
> +

Hmmm I guess this is marginally more magic than an exclude file. Anyway
it works:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>  rm -v .*.yml
>  popd


--=20
Alex Benn=C3=A9e

