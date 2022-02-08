Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C34ADEE1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:05:39 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTvu-0003ls-Ms
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:05:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSmZ-0007Q7-D1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:51:55 -0500
Received: from [2a00:1450:4864:20::430] (port=33282
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSmX-0004y2-I6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:51:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id e3so17603869wra.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=680h9APO9tqvzAsFfCLQjTqiS71XU6tPaRvaITmh+3o=;
 b=kDydl+jfW9zN/8/IvSeYFezUXHsPrwiFYL26sXpGFYHvCh+J4Yem8/arEYKj2maYJP
 3zjkRltH86IYbNhjDb+hTU81ZPyG0EPSPvFbnNLdkPy6j/yHUtOc7t3i0s3+A8JPQaIN
 smNxHFtqe1hd7DWZBjPvAtuDDodVaUaqPduVy8IpWgjHPrjiEt2BNnFtNiEFDJpYTmow
 v7BriyMxCoNL6bQCOMDEf4lzokxqIO4xbQA6AQ2cqADiqq+yQJyAXDxxw7Jto9iBOMZl
 CwXsEiVtQQg7MIZ4U00bwe029XSV3t1kD5a0U704bwGl0kBX8S09uZLF3nx0QdKjsMuT
 xYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=680h9APO9tqvzAsFfCLQjTqiS71XU6tPaRvaITmh+3o=;
 b=xZHnfS+0mwR0wDZD8o8DWIDatfHnBQCQzKzntmM6ScbYdniPO4jwdnY1eCQb5DKfE5
 6pu9oq1QTI/+VxVdJILZlDUTowyv0QDPjd6iTKcMIGre0/hej+2Lk2UlK6Ml+NKGLIoQ
 nqGnWvH0DjcVoIfAB5r6zQ1CfAvmj62addi/YjhjfCbpJLlSARWpOxkG0OZWRls62Su1
 Evt5XQXrIcfP3eWv5a8qjYhcBgyOJvr3n5dwoaok2bqKNZL8Ut5vD5n4iWs3scV8r+lm
 ORBkrErkJMU/15DeJBrSwbkK5ybVOX5sKBT6cIwVsvcJMGB2sBql7foqdyzJG90GjNeI
 XiaQ==
X-Gm-Message-State: AOAM533sKHqVqLvertqayP+asWScahtNePAsUTUEgfXDAaRfqNqRpwpY
 AVfbWi+RZJlCMk81Bz9F5q3DSyeOtZRIQb0QDgfOag==
X-Google-Smtp-Source: ABdhPJxaqacmx8n4v254WhbgQ/qUu3/CXu1WsdXsZUoz5uolyu59idBs1rkjwa/gCsOZqJDKkIKX1WNwCm3qflsEeKw=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4242642wrz.2.1644335512225; 
 Tue, 08 Feb 2022 07:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20220208125909.3031809-1-alex.bennee@linaro.org>
In-Reply-To: <20220208125909.3031809-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 15:51:41 +0000
Message-ID: <CAFEAcA-UX4h-vCvQtkyZ803H+HyL_-o+dFgR54BUEAkFSEAoQw@mail.gmail.com>
Subject: Re: [RFC PATCH] include/exec: fix softmmu version of TARGET_ABI_FMT_lx
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 15:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> TARGET_ABI_FMT_lx isn't available for softmmu which causes confusion
> when trying to print. As abi_ptr =3D=3D target_ulong use its format strin=
g
> instead.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index a878fd0105..da987fe8ad 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -121,7 +121,7 @@ static inline bool guest_range_valid_untagged(abi_ulo=
ng start, abi_ulong len)
>  })
>  #else
>  typedef target_ulong abi_ptr;
> -#define TARGET_ABI_FMT_ptr TARGET_ABI_FMT_lx
> +#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
>  #endif
>
>  uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);

I think this was clearly just a bug that we never noticed because
we haven't tried using TARGET_ABI_FMT_ptr in softmmu code before.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I do still wonder whether the softmmu code in question really
ought to be using abi_ptr, though.

thanks
-- PMM

