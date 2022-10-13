Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52F5FE36D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:41:27 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj51A-00060t-PX
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj4vS-00044P-BY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj4vP-0002Rk-M4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bp11so4598417wrb.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjVk3CJ4slBuNZEdWsoYytNmRJoa5E5Dpq4oTROBO3w=;
 b=PLrviyVCUhdbFGzqE8gDxxEzDEOr5OiZs1g9jDdQZZBSxxPx7VULT9cFk8d8jRgvVd
 bkg8gz+cjA/rCfl4oGPLc43lfTKaIk1Ow/x55tcL6gVrcEwmAC770in12n90SY+9RbwZ
 GmWNM08W7vOUH8hNqY8Hj5HJuHkot21Bn4ZoIhOSzEW71/crsGO74BY8q5rZVzk5kVuZ
 HxtABMuk/a73uHkio+dRckFEUAf8IeGJvipF1hWx2uWeu2OZcfdarnR/pflDLtkVoWtV
 QuyP8UAhOyQ52RDYe6zKTPeBy7lbiuueFlo3MELO77KXDHXq+fzG0r8qisTzDnZ0VL4G
 0+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YjVk3CJ4slBuNZEdWsoYytNmRJoa5E5Dpq4oTROBO3w=;
 b=2kt+uMof8IeFDCFjkmXnsK6QNNhnGUwNkWeihnAJFh0isiYTsWYgyaYJGv9yld0At6
 SW67mn+J9TLeb5kUalNDzkE2m5qMdtDJB0yvc4tIODiDkM46NscmLadgvmpoWqbV/IIu
 qNHUNVytiFASZ+YWD/8R+2eX6HIEQoXldhAWXWWkT2onBvyd4FOb8bQBMLp+CR/MFerr
 8+zX8beefU41DCEB22OGaCaYA73PIfhXLDR5mBPb0GfO/hu/MS+IiLutkya2eKDvOowd
 GVeWtrp/2J9oO5alqzgIad+elzD5vGf0dBCld9iMLWuTdMLumug5O2/+6473ZSQ7wLcA
 tz3A==
X-Gm-Message-State: ACrzQf2NiV2EfjxoJdaZ6iK9vG6F1Tq6Co212kJj1Yd/6AGDMbAVLQDQ
 mxTjdZ+48jfbJz085CBKoOEQBUlWHXz2tA==
X-Google-Smtp-Source: AMsMyM60rZ6+XDDy/lqOcSGlHWcr1qGZMw/hghKdYlVrcnLkGEAE3/nmV2fGrpZzYPe6PgCnADeL4g==
X-Received: by 2002:a5d:456b:0:b0:230:9e5b:c64c with SMTP id
 a11-20020a5d456b000000b002309e5bc64cmr1166676wrc.211.1665693324474; 
 Thu, 13 Oct 2022 13:35:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a5d6311000000b0022e035a4e93sm357114wru.87.2022.10.13.13.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 13:35:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8ED981FFB7;
 Thu, 13 Oct 2022 21:35:23 +0100 (BST)
References: <20221013131304.623740-1-pbonzini@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Thu, 13 Oct 2022 21:35:12 +0100
In-reply-to: <20221013131304.623740-1-pbonzini@redhat.com>
Message-ID: <8735brpilw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/configure b/configure
> index f4ff1cf305..a5af9c524f 100755
> --- a/configure
> +++ b/configure
> @@ -2474,6 +2474,9 @@ echo "HOST_CC=3D$host_cc" >> $config_host_mak
>  if test -n "$gdb_bin"; then
>      echo "HAVE_GDB_BIN=3D$gdb_bin" >> $config_host_mak
>  fi
> +if test "$plugins" =3D "yes" ; then
> +    echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
> +fi

Don't we already do that anyway?

>=20=20
>  tcg_tests_targets=3D
>  for target in $target_list; do


--=20
Alex Benn=C3=A9e

