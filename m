Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB35FE2FF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 21:53:33 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4Gp-00019e-Qy
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 15:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj4Cb-0007VZ-2f
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:49:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj4CZ-0003bp-Dm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:49:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w18so4450280wro.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70ou7/5Ej7KM5G9RJ4Njnz96WTS4rKd69kj+FzC4NaE=;
 b=fXJnyzoX5jzanZCwe2rLrcCcH6sGx69ERCAAM8FoVLUty1fjNC3WghyhMooRg75y6F
 YPMjrv2lr74ts49fMhWCnoJST4HLEemA0vEyixMQWgcgReZrWz32EnYfBSO6UjZK2vLY
 1Z0N8FURLOWH2svHGor0Zc5tI0wwmAXTfSWOxVtCHKCjJFq0z28jkyB5IEWUeNyMx+vM
 uqHvzyEvwz1ta2eoR3lK9V96AXLURt3EvdcYY2U02wtxw2Fbv0OCSFQJhn03FAqnVfaN
 gOPpqgjApuWgFTNTRb35PXfu+fJ/bTV2KeodZkt/iZ89szgRl2k+serrFF/rTDUCerSD
 J4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=70ou7/5Ej7KM5G9RJ4Njnz96WTS4rKd69kj+FzC4NaE=;
 b=40zm06sJW6becCGRL3hmW8w6Pu1TxWr8+kra3hn/NV9C4cBv86Ro/EkqHmyUKSK6+W
 nOgGA9cRlhymQ0KbOhlIHzT3n/JU03sX/oqscJzYo0mvbA8nK9vIKmWEaaXI6G5aD/FH
 uGYKdJyBCMMBmIO1y7oFRcxQwDTodOv3Zb6ykp58PB3QGCM2fEJfIr8niNJf6lzFXpbU
 meneGmHuGRIT54IzYSjcHpCdCneSpUS1fpUvicjusCFt6Ar0LgWbrVFtslcchaYnjRyi
 QLkKyvOA7Mj13COAeU/JI3O/9DQVaqOcQT8IPhWI1byaBHd2u7d+d1ouLimYOUOZL9Us
 BFQA==
X-Gm-Message-State: ACrzQf3/oWgwhQqAVB+7db/N6Gf3xjZQcM7C3rCQ2MaTLO/7u+kMtOQl
 0Xxt4q+FKrexJigZ5wPKVKY2eQ==
X-Google-Smtp-Source: AMsMyM6Qcn912woDPrBElOCf58m0JORMk7jWQ9hs9cJL1L4kBTIULz7pMtndeWfZjFg1UuLW/ngtPg==
X-Received: by 2002:a5d:64cf:0:b0:231:2e6c:7609 with SMTP id
 f15-20020a5d64cf000000b002312e6c7609mr1070592wri.172.1665690543193; 
 Thu, 13 Oct 2022 12:49:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c089300b003c409244bb0sm362188wmp.6.2022.10.13.12.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 12:49:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 237051FFB7;
 Thu, 13 Oct 2022 20:49:02 +0100 (BST)
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
 <20221013154705.1846261-5-alex.bennee@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 4/7] configure: don't enable cross compilers unless
 in target_list
Date: Thu, 13 Oct 2022 20:48:38 +0100
In-reply-to: <20221013154705.1846261-5-alex.bennee@linaro.org>
Message-ID: <877d13pkr5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This avoids the unfortunate effect of always builds the pc-bios blobs
> for targets the user isn't interested in.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  configure | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/configure b/configure
> index 45ee6f4eb3..246651f25d 100755
> --- a/configure
> +++ b/configure
> @@ -1866,6 +1866,11 @@ probe_target_compiler() {
>    container_cross_ranlib=3D
>    container_cross_strip=3D
>=20=20
> +  case " $target_list " in
> +    " $1 ") ;;
> +    *) return 1 ;;
> +  esac
> +

this of course prevents building of roms by actually disabling all
target compilers...

>    target_arch=3D${1%%-*}
>    case $target_arch in
>      aarch64) container_hosts=3D"x86_64 aarch64" ;;


--=20
Alex Benn=C3=A9e

