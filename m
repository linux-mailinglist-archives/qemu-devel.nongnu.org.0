Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3790A51F21A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 03:09:10 +0200 (CEST)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnrtc-0004nD-Qt
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 21:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnrrz-000434-Kq
 for qemu-devel@nongnu.org; Sun, 08 May 2022 21:07:28 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:41358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnrrv-0007Xr-KI
 for qemu-devel@nongnu.org; Sun, 08 May 2022 21:07:26 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-edf9ddb312so12170529fac.8
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wTIwaBEETt4LoV4Jfl5I2vB2yGAfNwdHbPKSmeTEXYA=;
 b=BE4cWfSpXrd2CtUU194wCd+MXh6/BD85bqd7Y6bn9a4rRQFvyK897e4KZh80eBtR1j
 dipWfjVNh1IubGQ6r4oDQHc1I3lZKrdWbXlrxjabXzJY8t/1qIu8HJbWYjIIiSovo7Gm
 /I/Zr6f78x11vt10GZJOayo8/Y2umziHvcvoKE1cEbeMFa2q4etT5cFzkCkbuqfqHjUQ
 NihhqwSL3GuMbiQ1C1+CgE5BT5ZUyNN3MuSLqj0H5u3bYeFNvMHLRaL6DhdYwlmL21FJ
 wlTprTovgCHQ2Thq0L+ixo/VgA5fb91JR5aX0Cjc518CIdObQzWdqzfsRttARgAx6azT
 ya1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wTIwaBEETt4LoV4Jfl5I2vB2yGAfNwdHbPKSmeTEXYA=;
 b=dZ9HIye+wOqFSMooWpkz9E6bUnXlQBvtm1rPSOZurnOvFyKlvQDaQnLSka4vr8c7l3
 mNE81n4XUM87AdWt89Xbar2I4NJ+CXjtyjn+OssrGRpvFxD+vYRK+AEC4/qB4F04jvDb
 dS757UUyK06UQdwDLmkGDRGhn+4kTZmLNSGFn7oUBPZvKKBrVIKIw9pgD7fLqcAmk49H
 53jFXU4P5VUMEx7WGA9+Fiblynd7BQjkxPeoDPBFcQCv1MHk18e5hAiANDK39yFNpcll
 //NTJQV+mmFfvEkPqeIIvrlXEoto6qsQRupFroTnN4QWDvF0r0ceP9yVMzswPRRTjM0z
 xh4Q==
X-Gm-Message-State: AOAM533o4VbPZzb7Luz5SS9g5BOr9Jd+n2fRgU3vZ3ftnh6d+HiCijsa
 8Ih47rh3jx5ni7ElwwqYqI05Mg==
X-Google-Smtp-Source: ABdhPJyqQjIrdbkrKGCLNBJB9LT9BymgkxGgA30fmk33fqoitKSdnzMZyPatm64wUMnLhjAnIIlssw==
X-Received: by 2002:a05:6870:a9a4:b0:e6:4451:f4b0 with SMTP id
 ep36-20020a056870a9a400b000e64451f4b0mr9122517oab.252.1652058440880; 
 Sun, 08 May 2022 18:07:20 -0700 (PDT)
Received: from ?IPV6:2607:fb90:20d3:bb93:373e:fef5:c815:bba3?
 ([2607:fb90:20d3:bb93:373e:fef5:c815:bba3])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4ac287000000b0035eb4e5a6bdsm4407273ooq.19.2022.05.08.18.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 18:07:19 -0700 (PDT)
Message-ID: <322378f7-5ce2-319b-5a93-da0070915c63@linaro.org>
Date: Sun, 8 May 2022 20:07:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/53] qemu-sparc queue 20220508
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/8/22 14:55, Mark Cave-Ayland wrote:
> The following changes since commit f1336649156cf57f5d874a98e619fb362e3fcb59:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-07 06:14:16 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/mcayland/qemu.git tags/qemu-sparc-20220508
> 
> for you to fetch changes up to 1f110516190f146df40f49aef2f1ef5903b8f540:
> 
>    artist: only render dirty scanlines on the display surface (2022-05-08 18:52:37 +0100)
> 
> ----------------------------------------------------------------
> qemu-sparc queue
> - HPPA general improvements and tidy-ups
> - artist minor fixes and performance improvement

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Mark Cave-Ayland (53):
>        dino: checkpatch fixes
>        dino: move registers from dino_init() to DINO_PCI_BRIDGE init function
>        dino: move PCI bus initialisation to dino_pcihost_init()
>        dino: move PCI windows initialisation to dino_pcihost_init()
>        dino: add memory-as property containing a link to the memory address space
>        dino: move pci_setup_iommu() to dino_pcihost_init()
>        dino: move PCI bus master address space setup to dino_pcihost_realize()
>        dino: move initial register configuration to new dino_pcihost_reset() function
>        dino: use QOM cast instead of directly referencing parent_obj
>        dino: return PCIBus from dino_init() using qdev_get_child_bus()
>        dino: split declarations from dino.c into dino.h
>        hppa: use new CONFIG_HPPA_B160L option instead of CONFIG_DINO to build hppa machine
>        dino: change dino_init() to return the DINO device instead of PCIBus
>        machine.c: map DINO device during board configuration
>        dino.h: add defines for DINO IRQ numbers
>        dino: define IRQ inputs as qdev GPIOs
>        dino: wire up serial IRQ using a qdev GPIO in machine.c
>        dino: remove unused dino_set_timer_irq() IRQ handler
>        hppa: move dino_init() from dino.c to machine.c
>        dino: use numerical constant for iar0 and iar1 reset values
>        dino: move DINO HPA constants from hppa_hardware.h to dino.h
>        dino: move from hw/hppa to hw/pci-host
>        lasi: checkpatch fixes
>        lasi: move memory region initialisation to new lasi_init() function
>        lasi: move register memory mapping from lasi.c to machine.c
>        lasi: move initialisation of iar and rtc to new lasi_reset() function
>        lasi: move LASIState and associated QOM structures to lasi.h
>        lasi: replace lasi_get_irq() with defined constants
>        lasi: define IRQ inputs as qdev GPIOs
>        lasi: use qdev GPIOs to wire up IRQs in lasi_initfn()
>        lasi: fix serial port initialisation
>        lasi: update lasi_initfn() to return LASIState
>        lasi: move LAN initialisation to machine.c
>        lasi: move parallel port initialisation to machine.c
>        lasi: move second serial port initialisation to machine.c
>        lasi: move PS2 initialisation to machine.c
>        lasi: remove address space parameter from lasi_initfn()
>        lasi: move lasi_initfn() to machine.c
>        lasi: use constants for device register offsets
>        lasi: use numerical constant for iar reset value
>        hppa: move device headers from hppa_sys.h into individual .c files
>        lasi: move from hw/hppa to hw/misc
>        hppa: move hppa_pci_ignore_ops from pci.c to machine.c
>        hppa: remove hw/hppa/pci.c
>        hppa: remove unused trace-events from from hw/hppa
>        hppa: move enable_lan() define from hppa_sys.h to machine.c
>        hppa: remove the empty hppa_sys.h file
>        hppa: use MACHINE QOM macros for defining the hppa machine
>        hppa: fold machine_hppa_machine_init() into machine_hppa_machine_init_class_init()
>        hppa: simplify machine function names in machine.c
>        artist: checkpatch and newline style fixes
>        artist: remove unused ROP8OFF() macro
>        artist: only render dirty scanlines on the display surface
> 
>   MAINTAINERS                              |   4 +
>   configs/devices/hppa-softmmu/default.mak |   2 +-
>   hw/display/artist.c                      |  33 ++---
>   hw/hppa/Kconfig                          |   5 +-
>   hw/hppa/hppa_hardware.h                  |   5 -
>   hw/hppa/hppa_sys.h                       |  24 ----
>   hw/hppa/machine.c                        | 124 ++++++++++++++---
>   hw/hppa/meson.build                      |   2 +-
>   hw/hppa/pci.c                            |  88 ------------
>   hw/hppa/trace-events                     |  14 --
>   hw/misc/Kconfig                          |   3 +
>   hw/{hppa => misc}/lasi.c                 | 161 +++++----------------
>   hw/misc/meson.build                      |   3 +
>   hw/misc/trace-events                     |   5 +
>   hw/pci-host/Kconfig                      |   4 +
>   hw/{hppa => pci-host}/dino.c             | 231 ++++++++++---------------------
>   hw/pci-host/meson.build                  |   3 +
>   hw/pci-host/trace-events                 |   5 +
>   include/hw/misc/lasi.h                   |  78 +++++++++++
>   include/hw/pci-host/dino.h               | 146 +++++++++++++++++++
>   meson.build                              |   1 -
>   21 files changed, 477 insertions(+), 464 deletions(-)
>   delete mode 100644 hw/hppa/hppa_sys.h
>   delete mode 100644 hw/hppa/pci.c
>   delete mode 100644 hw/hppa/trace-events
>   rename hw/{hppa => misc}/lasi.c (60%)
>   rename hw/{hppa => pci-host}/dino.c (71%)
>   create mode 100644 include/hw/misc/lasi.h
>   create mode 100644 include/hw/pci-host/dino.h


