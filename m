Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1E2D6E52
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 04:07:41 +0100 (CET)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knYmS-0006qf-8n
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 22:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1knYk0-0005pF-OH; Thu, 10 Dec 2020 22:05:08 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1knYja-0007Cc-Pl; Thu, 10 Dec 2020 22:05:08 -0500
Received: by mail-oi1-x243.google.com with SMTP id l200so8271901oig.9;
 Thu, 10 Dec 2020 19:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7Bqe7TUfqEXtWYklNV7hKPySGhYcLApAf1F2RPky7D4=;
 b=MTz+Yx0futif80qpy7eoEareq5bBeomWVnSSVCUp3d/LG9w7RZFzlXbFgjXAmuS15v
 jnIMbJbEvUwk1tpY1FZRMhBPabzqn1+m3TGaxnJDQstH7J9zuFNyZ5VhQ10upXiGUpSV
 N+uVOKU4JP0CwiwdAFUQOPpVa7GHJcNBauPk+n+H9Qb8wNNz0PLOJVcNsxklPvZhariY
 R5AF0WnRE76IO247iD/a3p26EBARnpOyLyomuZLscjzBf7XmEFQF+ib6hakCJvStuTw6
 YVb30naQY1tJEZ5aMmF5HEprIPZSAvDAbzJPIj47CYBnyXimNZpO7acBDVO+IWWm+Sau
 rORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=7Bqe7TUfqEXtWYklNV7hKPySGhYcLApAf1F2RPky7D4=;
 b=hDt3YWnliGFAmDZb/QRVcGK6BqoZE7sWhM01h8VFMVdgNxjLbAeA9ypyZqIy+2+0gM
 bk1Cj/5ZFrxqp7MhEoZENNLn89Z+brYgbjOzqfuK4T3UaxoSJgNHZR4k+AAFnRygZr7s
 Bvwn4odM2q7yJ1qZW5KL2Z8VJyjMO03nl5LiA4PQNGMdPvwb3iEXHR0szgJ8RT3Tl4Ss
 zLu1EGX7F3kLrfKwyc7dnEpWE21RKXQvemvnDiaPt93Uj4w/0x6VQPLhQJkTRLuOW3LE
 zJeDKaceqc1g8p1ub/wypT/dRTiJpQtY3MU8ol7xHylgeMF9V6oayxPoFfdNep+eiQM5
 Ii8A==
X-Gm-Message-State: AOAM532SjyJ+/+yJrslry53acIt2HH0wiZUmWns4Oyd0GgSRcGuHhX5A
 O7NHqnsCEiTcGOVEoj4rCw==
X-Google-Smtp-Source: ABdhPJxFlvvv0pZ/35xbJ+Y1JHGa/Yn0JATIhP8XfkBhXf/0FbxVJlj7UKf0zpQYPHICIriOdJm3tA==
X-Received: by 2002:aca:ad8d:: with SMTP id w135mr7466149oie.27.1607655879006; 
 Thu, 10 Dec 2020 19:04:39 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id y35sm1566582otb.5.2020.12.10.19.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:04:38 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9cf8:f63f:d424:8677])
 by serve.minyard.net (Postfix) with ESMTPSA id 0CBB2180570;
 Fri, 11 Dec 2020 03:04:37 +0000 (UTC)
Date: Thu, 10 Dec 2020 21:04:35 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation
 support
Message-ID: <20201211030435.GI11017@minyard.net>
References: <20201211015156.2053372-1-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211015156.2053372-1-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:
> This patch series include a few more NPCM7XX devices including
> 
> - Analog Digital Converter (ADC)
> - Pulse Width Modulation (PWM)
> - Keyboard Style Controller (KSC)
> 
> To utilize these modules we also add two extra functionalities:
> 
> 1. We modified the CLK module to generate clock values using qdev_clock.
>    These clocks are used to determine various clocks in NPCM7XX devices.
> 2. We added support for emulating IPMI responder devices in BMC machines,
>    similar to the existing IPMI device support for CPU emulation. This allows
>    a qemu instance running BMC firmware to serve as an external BMC for a qemu
>    instance running server software. It utilizes the KCS module we implemented.

Looking at the IPMI changes, why didn't you just re-use the existing
IPMI infrastructure?  ipmi_host.[ch] is basically a subset of ipmi.[ch],
and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with
some names changed.  That kind of code duplication is not acceptable.
Plus you copied my code and removed my copyrights, which is really
not acceptable and illegal.

I'm not exactly sure why you needed you own KCS interface, either.  It
looks like the interface is somewhat different in some ways, but
integrating it into the current KCS code is probably a better choice if
that can be done.

-corey

> 
> Hao Wu (7):
>   hw/misc: Add clock converter in NPCM7XX CLK module
>   hw/timer: Refactor NPCM7XX Timer to use CLK clock
>   hw/adc: Add an ADC module for NPCM7XX
>   hw/misc: Add a PWM module for NPCM7XX
>   hw/ipmi: Add an IPMI host interface
>   hw/ipmi: Add a KCS Module for NPCM7XX
>   hw/ipmi: Add an IPMI external host device
> 
>  default-configs/devices/arm-softmmu.mak |   2 +
>  docs/system/arm/nuvoton.rst             |   6 +-
>  hw/adc/meson.build                      |   1 +
>  hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
>  hw/arm/npcm7xx.c                        |  65 +-
>  hw/ipmi/Kconfig                         |   5 +
>  hw/ipmi/ipmi_host.c                     |  40 ++
>  hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
>  hw/ipmi/meson.build                     |   3 +
>  hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
>  hw/misc/meson.build                     |   1 +
>  hw/misc/npcm7xx_clk.c                   | 795 +++++++++++++++++++++++-
>  hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
>  hw/timer/npcm7xx_timer.c                |  25 +-
>  include/hw/adc/npcm7xx_adc.h            |  72 +++
>  include/hw/arm/npcm7xx.h                |   6 +
>  include/hw/ipmi/ipmi_host.h             |  56 ++
>  include/hw/ipmi/ipmi_responder.h        |  66 ++
>  include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
>  include/hw/misc/npcm7xx_clk.h           | 146 ++++-
>  include/hw/misc/npcm7xx_pwm.h           | 106 ++++
>  include/hw/timer/npcm7xx_timer.h        |   1 +
>  tests/qtest/meson.build                 |   4 +-
>  tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
>  tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
>  25 files changed, 4221 insertions(+), 32 deletions(-)
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 hw/ipmi/ipmi_host.c
>  create mode 100644 hw/ipmi/ipmi_host_extern.c
>  create mode 100644 hw/ipmi/npcm7xx_kcs.c
>  create mode 100644 hw/misc/npcm7xx_pwm.c
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 include/hw/ipmi/ipmi_host.h
>  create mode 100644 include/hw/ipmi/ipmi_responder.h
>  create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
>  create mode 100644 include/hw/misc/npcm7xx_pwm.h
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
> 
> -- 
> 2.29.2.684.gfbc64c5ab5-goog
> 

