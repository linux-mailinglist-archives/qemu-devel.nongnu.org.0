Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962626DF1B6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:10:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXQV-0008He-1s; Wed, 12 Apr 2023 06:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmXQS-0008HS-N8
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:10:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmXQQ-0006rT-SN
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:10:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g5so13698342wrb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294201; x=1683886201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPJ2SFierbyb3Cclh63Wlefmv6JskXMO+atr4mXdl8I=;
 b=BScgF6Er6TmA9oO9n/EyYK3mPOlQAD+EaBbBo1rH+wjOVZNNffPA5u8mTVh3sa9rAd
 QHL+9y7eA4QlOM3dyrIeluXkvHuwijSBYc25rAQSnSY41YwmH6MRPHChCzVJ4vm8FZX4
 5ebp5hfJis2nUoxbankpexnCPOMMn9n+Fl8A8S52wn/8zWiNcd9wti3k0LgL9iYgsG2H
 LSxKzu/DesSxMfYHcYjnym0+FpfzyNZUD+IuLQ1UJfJHADUtRUkxAajjpL4xVZUAVupL
 6VU9hq/G3upGGHaf8TMUHF5mDs6JMlXa7eqGqeUUOqlnGB9+CYU1PclzWUb7I8YuWA2d
 v6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294201; x=1683886201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bPJ2SFierbyb3Cclh63Wlefmv6JskXMO+atr4mXdl8I=;
 b=FTb7gg9Lc5EXtd1Pep/uDpuwo1p8V73SavHumf16DsIyP86LzhN9YoTI7HicWefL8u
 Tf6TmmfjSMHt/YtbGxdm7CXYVWPZQmZqCBKrFL8UZCSczUflxt5/h1eSj871h4BZ8qi0
 uWM7Qa18fR6A+/oB7HEwiN78vwmxx5FhJd1UolhEoLHqdYlWVoKkmb1a/Dgt6mn66pwk
 cvYAfe9jBiCV3qXAXI778xJZG2AuTSKgaYDywRtIW6i6F/OC3gjWQL1o2bmkcJvitwEz
 1bpTKSNQGvUTp/N2TR0/NkhiwNmKBd8QjR2yjMI/19kWayKj00wFUkvv9SstDwBdnpz2
 nuRA==
X-Gm-Message-State: AAQBX9cdDpoBjXbXiONVfi9KPkZLzdvKtP1d3b6uKB+jf6ARWHXxHuQB
 wIgsVKytoihkOoQ7IaclYpS2YA==
X-Google-Smtp-Source: AKy350aBY3mwROC5VviG3+/nxUD4IH6ZvxN1KXZmddzemSoJH/nDLqqfeanFjDkNN3oVWK6yU/IRoQ==
X-Received: by 2002:adf:ee0f:0:b0:2d0:354e:dc77 with SMTP id
 y15-20020adfee0f000000b002d0354edc77mr9024079wrn.66.1681294200833; 
 Wed, 12 Apr 2023 03:10:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f490a0cd1asm1080829wrq.92.2023.04.12.03.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 03:10:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 190F31FFB7;
 Wed, 12 Apr 2023 11:10:00 +0100 (BST)
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos  Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Date: Wed, 12 Apr 2023 11:08:50 +0100
In-reply-to: <20230411210422.24255-1-vikram.garhwal@amd.com>
Message-ID: <877cuhpg1z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails=
 the
> build for aarch64 target.
>
> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-=
devel/2023-02/msg03979.html
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..6867839248 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>    variables:
>      IMAGE: debian-amd64-cross
>      ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

x86 should handle --disable-tcg fine.

>=20=20
>  cross-arm64-xen-only:
>    extends: .cross_accel_build_job
> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>    variables:
>      IMAGE: debian-arm64-cross
>      ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

Currently this builds qemu-system-i386, but with your changes and the
work Fabiano is doing:

  Message-Id: <20230313151058.19645-1-farosas@suse.de>
  Date: Mon, 13 Mar 2023 12:10:48 -0300
  Subject: [PATCH v9 00/10] target/arm: Allow CONFIG_TCG=3Dn builds
  From: Fabiano Rosas <farosas@suse.de>

We should be able to have a qemu-system-aarch64 supporting Xen without TCG

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

