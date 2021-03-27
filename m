Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680234B7D0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:56:14 +0100 (CET)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQAMG-0003PI-PB
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQAKh-0002d5-UI; Sat, 27 Mar 2021 10:54:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQAKg-00074U-9c; Sat, 27 Mar 2021 10:54:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id j7so8448077wrd.1;
 Sat, 27 Mar 2021 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JdROy15pAtbNMtSb54gF+TwONCrfrGobuvrqtB5Kb4c=;
 b=RG9Q15FEnlr7Pj7/A01tJMk0zJdAMwBL0alqTMCYxlyWIfCjVAkQoJ3r1vUX6ZCj4i
 BKHii/iHYyrhgAfsV9Puw7rGYrikghiRoN+eQCwXdtXc7zx8E7YGg0lG6OTUtt8+uunj
 o3qOUqhGjR8mZkkMw4TpD9mMyRQt+mdFZgKOGsFANa7dcnX/4cZ46xft0Rhjduad08SN
 b2qzZHS3jYdvav2Iy9/dh+bVE/1W73j9y4hgSFVWyPI7kV24EEUzoeBYoBKni9dYOIxA
 3C+RurdAUseyRyPzOdupYGGFOnZHxKrBSFa4yjYEoRIf0SBmrbP4Z1WJd6moZjUj6Ovy
 5fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdROy15pAtbNMtSb54gF+TwONCrfrGobuvrqtB5Kb4c=;
 b=P2rp7F/Y19r2P0lhsCG4IzBDnniIQR+3lrN8IPRExb8wGCuVXTLd5iQYLn8Uh/GTCV
 l82W6JUCMPld//ulWjNYrsvM8zpd5Almb70LzpJW9bAsz7aqUgxejjCL7LJxJgPEuidc
 5B44slA88jMV5S6HizQx+7aWbsC0tolUq/swEthGzLxa8oiyTLfylbnXZmcLLyO4Ejkr
 gFQKwWYTulYL87zRYthhKWBwfaQH2VL3olofvkbFe1abOq53yHITasuuliploGOXCbal
 44KRccpY5O/ts5bjBmxzOZJ/jGTIWvOOr+/C2ry7Hu2TglA7jWitgNGumQpD7pXvycmc
 k7hg==
X-Gm-Message-State: AOAM530UGgJbO8TUhsfrnFGPigyZnmKbGgtoRzYlMj+4MK1aw2UZ5Ktt
 0dCNEK7IX0SB6yiHTG7ybGRMANb9cY7gOA==
X-Google-Smtp-Source: ABdhPJzkspr4relGJvJspAw/G9aMHB9nWR6F2+i9Uyi5xidfm1aS0y04cOt+KjGzZz45XquvAnZzQA==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr19836961wrx.35.1616856871426; 
 Sat, 27 Mar 2021 07:54:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm19705878wrw.51.2021.03.27.07.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 07:54:30 -0700 (PDT)
Subject: Re: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210327082804.2259480-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9c5e949-1790-31ae-54c7-ccfdc3c16ae9@amsat.org>
Date: Sat, 27 Mar 2021 15:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210327082804.2259480-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 3/27/21 9:28 AM, Thomas Huth wrote:
> Many files include hw/sysbus.h without needing it. Remove the superfluous
> include statements.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/cubieboard.c         | 1 -
>  hw/arm/orangepi.c           | 1 -
>  hw/char/riscv_htif.c        | 1 -
>  hw/char/sifive_uart.c       | 1 -
>  hw/char/virtio-serial-bus.c | 1 -
>  hw/core/generic-loader.c    | 1 -
>  hw/core/guest-loader.c      | 1 -
>  hw/ide/ahci_internal.h      | 1 -
>  hw/input/lasips2.c          | 1 -
>  hw/intc/arm_gic_kvm.c       | 1 -
>  hw/intc/arm_gicv3.c         | 1 -
>  hw/intc/arm_gicv3_kvm.c     | 1 -
>  hw/intc/s390_flic_kvm.c     | 1 -
>  hw/isa/lpc_ich9.c           | 1 -
>  hw/isa/piix4.c              | 1 -
>  hw/moxie/moxiesim.c         | 1 -
>  hw/nios2/generic_nommu.c    | 1 -
>  hw/nubus/nubus-bus.c        | 1 -
>  hw/nvram/spapr_nvram.c      | 1 -
>  hw/rx/rx-gdbsim.c           | 1 -
>  hw/s390x/s390-ccw.c         | 1 -
>  hw/s390x/virtio-ccw.c       | 1 -
>  hw/timer/mips_gictimer.c    | 1 -
>  hw/usb/xen-usb.c            | 1 -
>  hw/vfio/ap.c                | 1 -
>  hw/vfio/ccw.c               | 1 -
>  hw/xen/xen-bus-helper.c     | 1 -
>  27 files changed, 27 deletions(-)

$ git grep -l '#include "hw/sysbus.h"' hw \
  | xargs git grep -L sysbus_ \
  | xargs git grep -L 'SysBusDevice\s\+\w'

hw/arm/cubieboard.c
hw/arm/orangepi.c
hw/char/riscv_htif.c
hw/char/sifive_uart.c
hw/char/virtio-serial-bus.c
hw/core/generic-loader.c
hw/core/guest-loader.c
hw/hyperv/vmbus.c
hw/i386/x86-iommu.c
hw/ide/ahci_internal.h
hw/input/lasips2.c
hw/intc/arm_gic_kvm.c
hw/intc/arm_gicv3.c
hw/intc/arm_gicv3_kvm.c
hw/intc/s390_flic_kvm.c
hw/isa/lpc_ich9.c
hw/isa/piix4.c
hw/moxie/moxiesim.c
hw/nios2/generic_nommu.c
hw/nubus/nubus-bridge.c
hw/nubus/nubus-bus.c
hw/nvram/spapr_nvram.c
hw/ppc/spapr_pci.c
hw/riscv/riscv_hart.c
hw/rx/rx-gdbsim.c
hw/s390x/s390-ccw.c
hw/s390x/virtio-ccw.c
hw/timer/mips_gictimer.c
hw/tricore/tc27x_soc.c
hw/usb/xen-usb.c
hw/vfio/ap.c
hw/vfio/ccw.c
hw/xen/xen-bus-helper.c

diff with your set:

@@ -5,6 +5,8 @@
 hw/char/virtio-serial-bus.c
 hw/core/generic-loader.c
 hw/core/guest-loader.c
+hw/hyperv/vmbus.c
+hw/i386/x86-iommu.c
 hw/ide/ahci_internal.h
 hw/input/lasips2.c
 hw/intc/arm_gic_kvm.c
@@ -15,12 +17,16 @@
 hw/isa/piix4.c
 hw/moxie/moxiesim.c
 hw/nios2/generic_nommu.c
+hw/nubus/nubus-bridge.c
 hw/nubus/nubus-bus.c
 hw/nvram/spapr_nvram.c
+hw/ppc/spapr_pci.c
+hw/riscv/riscv_hart.c
 hw/rx/rx-gdbsim.c
 hw/s390x/s390-ccw.c
 hw/s390x/virtio-ccw.c
 hw/timer/mips_gictimer.c
+hw/tricore/tc27x_soc.c
 hw/usb/xen-usb.c
 hw/vfio/ap.c
 hw/vfio/ccw.c

6 more candidates?

