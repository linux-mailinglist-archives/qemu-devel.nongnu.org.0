Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB14029AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:25:17 +0200 (CEST)
Received: from localhost ([::1]:45944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb6C-0004ks-GU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNagi-0003iy-4v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:58:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNagf-0004Ew-UL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:58:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id u9so14282280wrg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5900lkAEZ/6L9YX3yLKrRhWB8KnYm9l4XpxD5QVCI4Q=;
 b=iffw1HPOAcXeLtwO1sVuWL968Mdc83wMBs5ozkWh4VCd+fsYuUhBqYm6jXqTfFwy46
 Sdt3/+kwMKEzOE2QdpUMnCZv3oU6ZLSApxIor7q6RqRO/Uxus9IEPawyDi7CZcG6NcAE
 wXrPcfEtSLNPqmPKHG2Ulw0Q79UGb2T/zBWFsXLtrOJsDEatNjJHsajKQEaR/jqajxNq
 Ou1R/fpHVu5gCdJ2aYDHl+wV0OcMtsH3jaRktHM8oajEdKGu+wf7AKeEXVkKhPXH3Wr+
 tu9KzjqW+wdl5kKKLOUUnmWpnHJggKY1ZuWQuUNIVUmgsi6fCwu2xNpWeDmjapICFI6e
 sLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5900lkAEZ/6L9YX3yLKrRhWB8KnYm9l4XpxD5QVCI4Q=;
 b=Okh0xdVeeSgH/2xFfzcUqJqBrHtTbRdS3urPsm9RynZWnnQ9nGi4IG3QglHEhEJSuv
 RcSEOehvSrv60TLSOBkpsuX+Gf9R9UApOFus35zSPV6dVmJVOy5fM7DTIC9xIrcy1FTz
 /gZ3gpW2hPAPPuuNhQoBQ/Ac4oWUqqOYO7a/LR0pYEcuPQ1LDurVQmaVK/rgPi93knVe
 dyIsLOzVWVbK/QuzeDdOcrgSUsYrMhGhJ3QaOYwWugaEcv/ukrvyk70/dIspTBvcDds4
 0mKzB/3eJJ3PS3CCrV7lKMgw6gNJt32RhgZQmZZ9twK+3HrNY7xOq5wiCHca2/BKAdc9
 O4tA==
X-Gm-Message-State: AOAM531rjqpunG+DLZTIXRHjpoiw0rXmS+jJFW3BZEDBG6AmEwNNlQy5
 OwDaxXyYshOwOybpFevWsUF3FXyqIvKLbL1fQW+9Lg==
X-Google-Smtp-Source: ABdhPJyNz9w2xmO4gIGLIjfbsUDdHaw1SCa+g2bW1eVJgnkhUG69BUTuOpNo1cqP8VgHPCzIr+O6woJiQJA3q6jZoNU=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr18062264wrr.376.1631019532386; 
 Tue, 07 Sep 2021 05:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-3-maz@kernel.org>
In-Reply-To: <20210822144441.1290891-3-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:58:03 +0100
Message-ID: <CAFEAcA9=SJd52ZEQb0gyW+2q9md4KMnLy8YsME-Mkd-AbvV41Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm/virt: Honor highmem setting when computing
 highest_gpa
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
>
> Even when the VM is configured with highmem=off, the highest_gpa
> field includes devices that are above the 4GiB limit, which is
> what highmem=off is supposed to enforce. This leads to failures
> in virt_kvm_type() on systems that have a crippled IPA range,
> as the reported IPA space is larger than what it should be.
>
> Instead, honor the user-specified limit to only use the devices
> at the lowest end of the spectrum.
>
> Note that this doesn't affect memory, which is still allowed to
> go beyond 4GiB with highmem=on configurations.
>
> Cc: Andrew Jones <drjones@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..bc189e30b8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1598,7 +1598,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_memmap(VirtMachineState *vms)
>  {
>      MachineState *ms = MACHINE(vms);
> -    hwaddr base, device_memory_base, device_memory_size;
> +    hwaddr base, device_memory_base, device_memory_size, ceiling;
>      int i;
>
>      vms->memmap = extended_memmap;
> @@ -1625,7 +1625,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>      device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>
>      /* Base address of the high IO region */
> -    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    ceiling = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
>      if (base < device_memory_base) {
>          error_report("maxmem/slots too huge");
>          exit(EXIT_FAILURE);
> @@ -1642,7 +1642,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = base - 1;
> +    if (vms->highmem) {
> +           /* If we have highmem, move the IPA limit to the top */
> +           ceiling = base;
> +    }
> +    vms->highest_gpa = ceiling - 1;

This doesn't look right to me. If highmem is false and the
high IO region would be above the 4GB mark then we should not
create the high IO region at all, surely? This code looks like
it goes ahead and puts the high IO region above 4GB and then
lies in the highest_gpa value about what the highest used GPA is.

-- PMM

