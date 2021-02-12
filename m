Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3431A016
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:54:07 +0100 (CET)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYta-0003v5-L0
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAYrS-0002gk-92; Fri, 12 Feb 2021 08:51:54 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAYrO-0005q0-Ra; Fri, 12 Feb 2021 08:51:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u14so1061651wmq.4;
 Fri, 12 Feb 2021 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Kmra64lKoBS5SJaJIMJTD6sCYCL8C1qmklYShzUm5s=;
 b=hddCpJ3w1XHV3ZmyMsK1mVstlKc2f13m0XVsZl+5oZYh+hWIvjgUUH2fNBa1oKjNGP
 Xp0ndhfdn2Kul6Tf9g2WFg2nBXl4wee3jCsHB/4zI3BMhdbbOsBe7otXwjSM3eRSy/oZ
 5d5pcg2LJVef/cCAtN1o5I/e27Rb01kgGb/nz+Fclw2ZoFyVZdB1yuZOriasA0ZK0eFS
 YZxcl9nsGdfwldC8/Z0DhaBvlcZwtorxLZsa1bGg/hQTewWxbq3u3zu87omstOTw69Lc
 Yuoa5dYARiuhJKQSGFAp2XaWqM7EOcFbqZOTqlXQgV7oG6wAxHFTDUu6oNPSSQ/mUQ/z
 FCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Kmra64lKoBS5SJaJIMJTD6sCYCL8C1qmklYShzUm5s=;
 b=cS+Nq1ricE4+Y7jNB5/G9O6xQukGLg4zEw9ORN+e3FRT+wpX0Ejmk/67MRZOdHMyCi
 w2FU+dVoH5BtscvPB7Vys0X7qWgxe8SvSHHRvi3AFdg9RcZdw4aSaw1XBhrZW2nyWTrs
 DkVaiTV1YFfm0IDj02vfvEtoZaK9iN6/GzgJKCnXSf3JeTCY7iqL7c6Szuf7ml98zK6b
 hRKo7348lezfruRmp/BbYRJhB0o7ocVe2pK1BxamqcMnzCdSGbMkpzBRnMOumHf+C4zc
 hUguvAityUaUlowiYW3QvJC80eKPYdMRrwAG5+d5bwOUHHIrlJrzRipAy1gdyBHvZ9x5
 nIdg==
X-Gm-Message-State: AOAM533Hs/3e0eXR2rP/EG/xI2+SVYBeEe5MrftV/ipKoX8vZ+RG/9lb
 EHluYRkpbYMyfQ3H7DKqP3cDzcRR1tA=
X-Google-Smtp-Source: ABdhPJzeF0l5NHxBYRlxWTU4QxNmGB9VrBwOfI2E9KMOO/neWO2cYfRO+H+dYiI4XMQsPGPkgWZYqw==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr2883922wmg.12.1613137908324; 
 Fri, 12 Feb 2021 05:51:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g136sm86121wme.10.2021.02.12.05.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 05:51:47 -0800 (PST)
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
 <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c4d9df9a-21f5-524e-abfa-dea2ea1ec16f@amsat.org>
Date: Fri, 12 Feb 2021 14:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 2:45 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> MPS3 boards have an extra SWITCH register in the FPGAIO block which
>> reports the value of some switches.  Implement this, governed by a
>> property the board code can use to specify whether whether it exists.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/hw/misc/mps2-fpgaio.h |  1 +
>>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>>  2 files changed, 11 insertions(+)
> 
> I changed my mind about the property/struct field name here, I think
> "has" is what we tend to use rather than "have". Trivial change
> to squash into this patch:

What about "use-switches"?

use-x: 12 occurences
has-x: 9.

Is there a difference in the meaning? Maybe have refers to
something internal, while use to something external?

$ git grep -F 'DEFINE_PROP_BOOL("use-'
hw/audio/hda-codec.c:848:    DEFINE_PROP_BOOL("use-timer",
HDAAudioState, use_timer,  true),
hw/block/nvme.c:4556:    DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl,
params.use_intel_id, false),
hw/intc/ppc-uic.c:278:    DEFINE_PROP_BOOL("use-vectors", PPCUIC,
use_vectors, true),
hw/ppc/spapr_rng.c:135:    DEFINE_PROP_BOOL("use-kvm", SpaprRngState,
use_kvm, false),
hw/virtio/virtio.c:3722:    DEFINE_PROP_BOOL("use-started",
VirtIODevice, use_started, true),
hw/virtio/virtio.c:3723:    DEFINE_PROP_BOOL("use-disabled-flag",
VirtIODevice, use_disabled_flag, true),
target/microblaze/cpu.c:292:    DEFINE_PROP_BOOL("use-stack-protection",
MicroBlazeCPU, cfg.stackprot,
target/microblaze/cpu.c:311:    DEFINE_PROP_BOOL("use-barrel",
MicroBlazeCPU, cfg.use_barrel, true),
target/microblaze/cpu.c:312:    DEFINE_PROP_BOOL("use-div",
MicroBlazeCPU, cfg.use_div, true),
target/microblaze/cpu.c:313:    DEFINE_PROP_BOOL("use-msr-instr",
MicroBlazeCPU, cfg.use_msr_instr, true),
target/microblaze/cpu.c:314:    DEFINE_PROP_BOOL("use-pcmp-instr",
MicroBlazeCPU, cfg.use_pcmp_instr, true),
target/microblaze/cpu.c:315:    DEFINE_PROP_BOOL("use-mmu",
MicroBlazeCPU, cfg.use_mmu, true),

$ git grep -F 'DEFINE_PROP_BOOL("has-'
hw/gpio/imx_gpio.c:295:    DEFINE_PROP_BOOL("has-edge-sel",
IMXGPIOState, has_edge_sel, true),
hw/gpio/imx_gpio.c:296:    DEFINE_PROP_BOOL("has-upper-pin-irq",
IMXGPIOState, has_upper_pin_irq,
hw/intc/arm_gic_common.c:357:
DEFINE_PROP_BOOL("has-security-extensions", GICState, security_extn, 0),
hw/intc/arm_gic_common.c:359:
DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
hw/intc/arm_gicv3_common.c:497:
DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
hw/misc/macio/macio.c:430:    DEFINE_PROP_BOOL("has-pmu",
NewWorldMacIOState, has_pmu, false),
hw/misc/macio/macio.c:431:    DEFINE_PROP_BOOL("has-adb",
NewWorldMacIOState, has_adb, false),
hw/misc/macio/pmu.c:782:    DEFINE_PROP_BOOL("has-adb", PMUState,
has_adb, true),
target/arm/cpu.c:1110:            DEFINE_PROP_BOOL("has-mpu", ARMCPU,
has_mpu, true);

