Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DD55196B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:53:54 +0200 (CEST)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Guf-0008UG-Kd
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3GtP-0007b5-8o
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:52:35 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3GtN-0006E3-Dg
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:52:34 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id w6so18798068ybl.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YcifKYrI2ApgGAbOWRj4bO/PuiNJkhM/FHTLjQyT0IE=;
 b=F8fZ1mAJnFlNq+DzqWhgJEtQXE+vJNlMU5aeXIXQylIwM8tLOM0IYdMf+J7MdNyPAI
 4jsh2WrbJsPqjv46YDK0rIICbDIR7lw+yIT+LzYbOqGS64TPsngdDSYF36m9WnM5Hpst
 jHPplDWx1pvC79sF5UJjQr4FjVRb19sZRwx1gjeDb9F3UFXD2PYBVST5+GApUIVXBi/O
 kBD8bnK5pzo+qvGdOqsDnoO3UEVGccuQE3dVtXhK2vBc4yaQ6vBjQtjrJZbb7IsZIC/F
 JjawXyVnHvL6UCe9IeqtmDJS1DLEZ9fqgVdRMy6AzTgxULx10fHcv3vC92FylhP8Oxbe
 Y3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcifKYrI2ApgGAbOWRj4bO/PuiNJkhM/FHTLjQyT0IE=;
 b=30UxSSfU8huhslxGXvDFuhfDkljwZgIVVSj6bpjabSZBgmTacmGRUsS3729GK18cUi
 FapBM0rcKN1+W2JhicDPRE8tvqdmWlAsPmtw3uvEcHZBxKllCcCJA75yRSY6dP8m9bDG
 rDBh/SWoxCZJwMe/L2lxlTGFUdaPqqurNfP7Off+hTXFbYvAQtMpwTeglEVseGimcJ0e
 GnG3AbaElRDe4ZhKgYNArZvsYTUR9Wfcv3nb03QpdvCsq2kB3VSM6O9fRjGSskbuJb1N
 tAgQOpbiF0bhrkJtuuwVbVyxSIO6sNFpXgd8vnR2WGJE9Gbv/osjTHUphZxD7kTyXltK
 J4nw==
X-Gm-Message-State: AJIora9JGZ4nHcmQXEYbP6942iusfvfbYf23I9FvYTlhYo9gYjHQAo8c
 UWwBvPl0trVhdIMUXmp0PyEtfqktZZ4e8SW7VpYGAw==
X-Google-Smtp-Source: AGRyM1uqvOF0SyyRxoWvK4zUkoDKDQTwrImFNyZcbC5QnHkEice1X7tYq31hxowDRiki+V+PAiq4uKNBWmSwC6Zg+Yk=
X-Received: by 2002:a25:907:0:b0:668:afc1:65e6 with SMTP id
 7-20020a250907000000b00668afc165e6mr19831530ybj.85.1655729552236; Mon, 20 Jun
 2022 05:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220615163846.313229-1-richard.henderson@linaro.org>
In-Reply-To: <20220615163846.313229-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 13:52:21 +0100
Message-ID: <CAFEAcA9FvaJKD4=jBuWijd3ym1+aj=RJfr=7mugrFTLMCEfq+A@mail.gmail.com>
Subject: Re: [PATCH] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 15 Jun 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The bug is an uninitialized memory read, along the translate_fail
> path, which results in garbage being read from iotlb_to_section,
> which can lead to a crash in io_readx/io_writex.
>
> The bug may be fixed by writing any value with zero
> in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
> the xlat'ed address returns io_mem_unassigned, as desired by the
> translate_fail path.
>
> It is most useful to record the original physical page address,
> which will eventually be logged by memory_region_access_valid
> when the access is rejected by unassigned_mem_accepts.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  softmmu/physmem.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 657841eed0..fb0f0709b5 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -681,6 +681,9 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>      AddressSpaceDispatch *d =
>          qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
>
> +    /* Record the original phys page for use by the translate_fail path. */
> +    *xlat = addr;

There's no doc comment for address_space_translate_for_iotlb(),
so there's nothing that says explicitly that addr is obliged
to be page aligned, although it happens that its only caller
does pass a page-aligned address. Were we already implicitly
requiring a page-aligned address here, or does not masking
addr before assigning to *xlat impose a new requirement ?

thanks
-- PMM

