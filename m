Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156D3CB51D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:16:51 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Jxd-0002Ja-RV
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Jvw-0000To-EX
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:15:00 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Jvu-0002QX-JW
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:15:00 -0400
Received: by mail-ej1-x630.google.com with SMTP id go30so14118877ejc.8
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUErOJY+kLZvJn2yUui8U0AXkEdTFlAGHFM+/hh6yHw=;
 b=g/kfODtCE+EMjpB3cayVNRsk/UyZMPMfZd9VGAJagdcsRqHnNHp6O6W0NZh4SvGguV
 XEolWElhckhyvjXdoQcsruhQJg0s0V8uepdQryOQI6NgZ+6FAkCttXCHy27uZfSJgScA
 sySKnMSQ38Hf88CjyTGk3TEnCdDLugcEz6Zdisp8gJJFt1K1MRGT7CFZns78D/1gEvys
 iCHyC5jwzlDFnsOg9nDqtBaYUCXzHC0EtB/EDQ30e6IgM5Fx8fwri6De8ns/GOjXSugy
 ZE+u15u3ADR7cVCYnujv1SK1y9XXLoHDUA/JZCbTeuacJ6epyl7WQSVWb2zA3ar6/sen
 YtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUErOJY+kLZvJn2yUui8U0AXkEdTFlAGHFM+/hh6yHw=;
 b=ng/wMhLVpZ4Jhwhx1jAbo6xbzLRv+5VGDDGf2SteiQdy4hPSd6BhJjD5wPyk5pvcGG
 uX2tc1m2QS36yVIhyDUEOW7k1RIj02h9LjcMhVDsVkKzdvD3tVpZF1JKSwlv4vsMHrKb
 f7X7EMDFzyb3xRJjH3VYbTXD7/J7LTRza/697zPUzocDpMmmH7Jw+K15/CK3n6hzzcnE
 L1C5z5K50GDvNMUsLdKiaVkr10591CKSGhu8Dt3C53I6mIBkz7P+EYhHqpa5yJPAZvHD
 GOFdDg8gSiX6aPJ5XtrE+VORSyO4TjGvUViL2hSN80mYOdIDlv89UeTILs61b9xbQNB1
 bSPQ==
X-Gm-Message-State: AOAM532zfHlS+uLa5X6gnZiR+e/wh5XJTztEcQ+sms7XHe+sL50gIe6G
 0HetYo4a1gmEgpzs3LSDbktZX6xw/mdTWQVcT/xVNA==
X-Google-Smtp-Source: ABdhPJzbTXBCCJ5ABkQ34dWEu8TfUlcWJJcyIK3CuSJ7z9VwrqGtfKrPt0XShBEfdiLWpft0LcD8vt5Mgf3UOcZkhpQ=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr10550410ejy.407.1626426896826; 
 Fri, 16 Jul 2021 02:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210714180635.1648966-1-richard.henderson@linaro.org>
 <20210714180635.1648966-3-richard.henderson@linaro.org>
In-Reply-To: <20210714180635.1648966-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 10:14:16 +0100
Message-ID: <CAFEAcA9yQRVVyHbdXnKq=XcPfB=6pAmpOCJ0Zj1Hqr5L8Aco0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Add sve-default-vector-length cpu property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 19:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the behavour of /proc/sys/abi/sve_default_vector_length
> under the real linux kernel.  We have no way of passing along
> a real default across exec like the kernel can, but this is a
> decent way of adjusting the startup vector length of a process.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> +#ifdef CONFIG_USER_ONLY
> +/* Mirror linux /proc/sys/abi/sve_default_vector_length. */

/proc/sys/abi/sve_default_vector_length wants a vector length in
bytes, and it looks like we take a length in bits. I assume that's
to match other places where the user can specify vector lengths,
but we should mention the units we expect and that it's not what
the kernel uses.

We also don't support the kernel's (undocumented) "-1 means set
to the maximum" behaviour -- do we need it, or is that more reasonably
achievable by the user via other properties ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Regarding documentation, yeah, we don't have a great place
to put usermode specific CPU properties. I would just put
the documentation with the docs of the other properties.
Maybe we'll sort out the document structure later (or at least
put a link from the usermode doc section into the CPU part of
the system-emulation doc section), but the usermode emulation
documentation overall is in need of a massive overhaul some day...

thanks
-- PMM

