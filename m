Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECC63AE2E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhRv-0000CR-7Q; Mon, 28 Nov 2022 11:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhRt-0000Bt-1J
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:57:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhRr-00081n-DO
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:57:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id h11so10596917wrw.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxNdG0tzOJviEPe9Wbk0QSKwMu9pNvl/mO5bj0qHzFY=;
 b=ju+Q8WwsUaEpAwQ50b9ZuBdOR9r1LfGfNtEmWIsqvXI5oVT6muWv2oqM5Gykm2hex9
 Cu+UcP5BDZyImZ/EPQMkdWadks/Pyqa+MgdfzbzCsWBtlBLF5zxLvwonJJdFu3tmzkxh
 goz09TZsE3Y+NSL2uh7Leot6bJ0Avvkmbl10GoEZwflLGFHAuaStScbORaaVNyh4G+o7
 hlqOiDgr4LDTo2NR1ci7gjbEaotxbigBioFWtwncArUvzPk1WWmU5Bcd3M1nLbZ0Wmlb
 fWgSJhC0gyGfMCsMbJ+rGV9SFEvzwftxo/tk7/TfMjFh+XIqxsIbBHQ0vPkwqdBJQPVf
 3mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yxNdG0tzOJviEPe9Wbk0QSKwMu9pNvl/mO5bj0qHzFY=;
 b=EnElJ/5i3VfFdYGmrN2ti6sy7EaEtLjpR+sahgyL5xBftofGWe3SyWNir+qntFTlM7
 t1Goyoi5DTyuvPfQ9fPKM7apKCb0YQej2mk+4rEJBHDHFOFkFT2MylU7F7ItGRcRE0EH
 oCXpIXtmiWgaGNk8NAxFUUhTCybX+51n5GE6Y+24T8CR4RPxQY1UAegARl+tyU/O/7bu
 66QUsZZeLoQMyMDFc5Ta19tQ4eiPQ7Slu1io4EaJyE7UlqQYJ0S5a3WfCnNL9oxzWrZP
 08z55UXLw0Wq1+nhZqyE+24PZguIvJ0Z8aD2Nt+hwcWC6SImTg6k8X7X8Jy/2SNMtWyo
 ULCg==
X-Gm-Message-State: ANoB5pk2JMnyGJUE+bqsqvLdEYFSJwLcBSdO5eUFjlwgGHYFHcvGc0yy
 OVs7f1YoiSAL4hJVg8zkIS3Hgw==
X-Google-Smtp-Source: AA0mqf4FKSqCI7rqRNgULg6myQA1V5ejt+biZW4U27bIUo4gn8xYy5C8uz9PbWcagiKLMXhBbcN+2Q==
X-Received: by 2002:adf:e6c4:0:b0:241:dae2:431f with SMTP id
 y4-20020adfe6c4000000b00241dae2431fmr22082080wrm.261.1669654657860; 
 Mon, 28 Nov 2022 08:57:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfce09000000b0022dc6e76bbdsm11270190wrn.46.2022.11.28.08.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:57:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F36B61FFB7;
 Mon, 28 Nov 2022 16:57:36 +0000 (GMT)
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-4-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-8.0 3/5] scripts/make-release: Remove CI yaml and
 more git files from the tarball
Date: Mon, 28 Nov 2022 16:55:11 +0000
In-reply-to: <20221128092555.37102-4-thuth@redhat.com>
Message-ID: <87fse3xbi7.fsf@linaro.org>
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


Thomas Huth <thuth@redhat.com> writes:

> These files are of no use in a normal tarball and thus should not
> be included here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/make-release | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index 44a9d86a04..febeb6cb36 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -41,6 +41,9 @@ git submodule update --init --single-branch
>          BaseTools/Source/C/BrotliCompress/brotli \
>          CryptoPkg/Library/OpensslLib/openssl \
>          MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
> +
> +rm -v .*.yml

Why remove them instead of excluding them like you do for .git* bellow.

>  popd
> -tar --exclude=3D.git -cjf ${destination}.tar.bz2 ${destination}
> +
> +tar --exclude=3D".git*" -cjf ${destination}.tar.bz2 ${destination}

In fact you could probably instead use a file (release.exclude?) and put
all those patterns in there?

>  rm -rf ${destination}


--=20
Alex Benn=C3=A9e

