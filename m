Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05B3F1B93
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:28:05 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj1Y-0002El-2H
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiyF-000464-5V
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:24:39 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiyC-00011i-9e
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:24:38 -0400
Received: by mail-ej1-x634.google.com with SMTP id qk33so13250650ejc.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MxJZAmiRBKVITWDVgn/EujcjGVmHLC2dZigGtYB1+XU=;
 b=iIiWpPQ6kV+71NimJKhX72o86BcdaxxR3UcGIlcD/396QWTeZD8AGFTRhIfmt7quhP
 7ya3X41p+q1IKKHzE9NR/6Mh3oS9AQAbKjIyGm9UrMlEb1AMisR3s5bKyzY/20PsP7fH
 6OpnADAMTCRb+DUSrFpd+uZcHi4QwCTEn0UlqLYDBrDFU53M7LwMH/OHzYrLBQq/OTkK
 mwHopJ/Z5PyJMaLK1XYiBTnCVvWbgc9IgWPFWAi1z+8ZV+BLDY5mINytP/igcd0IwGA3
 rppwucyt0qEFm7OtsLvOInKHol6Y27QhdjQf+jlWWEd6cUWgA44GRzPl0cMUb3qnE1nk
 m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MxJZAmiRBKVITWDVgn/EujcjGVmHLC2dZigGtYB1+XU=;
 b=V+1fRM857T6fOFCFNsKhaZvL5zq275mCist6dheeUMS+DrmGPaOO4ib7EWxLyy1bCI
 wO8SnfplluC7Mvj9fIWN7uuB+KnD47m4iRV8wLwQMOk9lIPr9XAEq94Fq8K8erxJ983n
 BPnIgOnbQeXG5Klz0ZjPNOAqzDSazlIoJChS5ASAAlUcIqlCPL5nDoKdqyVm6pS+lmKp
 VpqTX4bJqSytp30mgPgujH605xVHJ7HxhFPY06JdVPNAO6gNWejU3G2wB3fDYWRJdem1
 eSBF4Xkc9aJFq+Z9GVbHkiP8f/vrSI4P9U1/+xXM4TWeBt1zgMoZDgBj7bLWLiMvLQNz
 q6dQ==
X-Gm-Message-State: AOAM530f/DRxQW7f90/dXRhSgfoK9XmIzSQ+TYmev7gbbOBRYG2EWFTY
 yFXCqFXqxhWFzt5f1eB2I1p1hw9/3LOkac83wfjiaQ==
X-Google-Smtp-Source: ABdhPJxwJkySlOBzI8AvqPf4F0fRaqYuu9d0WcvzELrFm4s6VZ8WU3LEE/aPkPrUai5gly6ByQST4Y57xepPc2BPjKQ=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr16187591ejf.85.1629383074850; 
 Thu, 19 Aug 2021 07:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-2-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:23:48 +0100
Message-ID: <CAFEAcA96oX2__WnRe7Fa02sSVgRNn7UsZy8_VxGAZc9cZ9e45w@mail.gmail.com>
Subject: Re: [PATCH 1/6] memory: Do not increase refcount on global
 system_memory region
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> system_memory is statically allocated in memory_map_init()
> (softmmu/physmem.c) and is never destroyed. No need to
> increment its refcount.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  softmmu/memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..185f978c925 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -24,7 +24,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qom/object.h"
>  #include "trace.h"
> -
> +#include "exec/address-spaces.h"
>  #include "exec/memory-internal.h"
>  #include "exec/ram_addr.h"
>  #include "sysemu/kvm.h"
> @@ -2923,7 +2923,9 @@ void address_space_remove_listeners(AddressSpace *a=
s)
>
>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char=
 *name)
>  {
> -    memory_region_ref(root);
> +    if (root !=3D get_system_memory()) {
> +        memory_region_ref(root);
> +    }

...but there's no need to have an odd special in this code either,
is there? What harm does it do if the system memory MR has a lot of
references ?

-- PMM

