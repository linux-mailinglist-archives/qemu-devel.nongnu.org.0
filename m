Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B940603E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:52:13 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTq1-0006ZC-1R
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOTm2-0004G6-VZ; Thu, 09 Sep 2021 19:48:07 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOTm1-000620-5c; Thu, 09 Sep 2021 19:48:06 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so4870284otf.2; 
 Thu, 09 Sep 2021 16:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJNnafisAOfTdtPQmtUJq0MDAevFWD/Wg9cn4hDGUW0=;
 b=CaiNpUHwudd+BcZ7dEVTmian+8pTPzHNu5bZVVuNNsumeXAjvIrC5h7tkL3JtDfJ+F
 DWvfECFwf/7vRzdiKvGgGZ5bs6uI8ojVCeLUnUyWW3kM6y4pn30K6v6k0Uor96YKqcXR
 zrsMCtVvJKtsDzGiHpEBB7mPLxx2pEJ8OsWe+U9NnBdYGqYN+5nMrNNXVB3AmYDf4T95
 4hMiunmE8EPjoTCCmSAzqx2XYIhzF+kFDCCZuKSjtvPu+smP7JXbcDJKf/QHRpPzuK/G
 PN6LXmv1bmT2G21/HUUtgMb9rPAOz0XPYk0pfVUXSgJyuT94dqc5CVEUf5rJ4zUEkpIF
 YsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=pJNnafisAOfTdtPQmtUJq0MDAevFWD/Wg9cn4hDGUW0=;
 b=bab5ChNtyHKEh/Lhv2dIigRA+vKHsTI0MGHpIuvVUqGb9/hgsd40O+GF6AdPpzkgwL
 sgXK+uiPN5MyopGdFC5xP60vyXTnuFySERrbvIZzStbNGgxhgACTvTcSnOojKPWrTrXD
 D1ebUMuR6hhnn7bpxcFicMQJBYPoUi7albolYDahkDVTN6GHYjQDaEvdhkTuFKwpWEes
 S7LeY3zPZ3qm41Gnpw7j7gfhXEPqajY5aNXQqZmeuEBRFXtw5FFmanRS8X69W5uk5q8E
 PfKUFsoAiIhWzv9xN4yasqKh1Qo1t3U2hNq5i5hwsLTc20h+PTti2f4GyvHSrG6eaVR4
 80nw==
X-Gm-Message-State: AOAM5303JLy2f4CQa4ShWuOKcewvOd9s+FBZWQcW7SzHWI4zsLw16SLc
 g4xit1WUesdYCoe7c11vgw==
X-Google-Smtp-Source: ABdhPJzf3zrtY3E97peeDF9goh5nAmOONS8LiKi4gdeyzP8JzQt8X0Ru0T9gyZ+TpWytAuw5Cb+sSA==
X-Received: by 2002:a05:6830:14d5:: with SMTP id
 t21mr2068734otq.271.1631231283518; 
 Thu, 09 Sep 2021 16:48:03 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id r31sm849148otv.45.2021.09.09.16.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 16:48:03 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:615a:3062:83b4:c204])
 by serve.minyard.net (Postfix) with ESMTPSA id 41D0318000C;
 Thu,  9 Sep 2021 23:48:02 +0000 (UTC)
Date: Thu, 9 Sep 2021 18:48:01 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 2/8] docs/specs: IPMI device emulation: main processor
Message-ID: <20210909234801.GO545073@minyard.net>
References: <20210909230620.511815-1-wuhaotsh@google.com>
 <20210909230620.511815-3-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909230620.511815-3-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32f.google.com
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
Cc: peter.maydell@linaro.org, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 04:06:14PM -0700, Hao Wu wrote:
> From: Havard Skinnemoen <hskinnemoen@google.com>
> 
> This document is an attempt to briefly document the existing IPMI
> emulation support on the main processor. It provides the necessary
> background for the BMC-side IPMI emulation proposed by the next patch.

I'm good with this for the most part.  One nit inline below.

This block diagrams depend on the previous patch.

> 
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/specs/index.rst |   1 +
>  docs/specs/ipmi.rst  | 100 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 docs/specs/ipmi.rst
> 
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index 65e9663916..1b5d177d53 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -11,6 +11,7 @@ guest hardware that is specific to QEMU.
>     ppc-spapr-xive
>     ppc-spapr-numa
>     acpi_hw_reduced_hotplug
> +   ipmi
>     tpm
>     acpi_hest_ghes
>     acpi_cpu_hotplug
> diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
> new file mode 100644
> index 0000000000..adb098b53d
> --- /dev/null
> +++ b/docs/specs/ipmi.rst
> @@ -0,0 +1,100 @@
> +=====================
> +IPMI device emulation
> +=====================
> +
> +QEMU supports emulating many types of machines. This includes machines that may
> +serve as the main processor in an IPMI system, e.g. x86 or POWER server
> +processors, as well as machines emulating ARM-based Baseband Management
> +Controllers (BMCs), e.g. AST2xxx or NPCM7xxx systems-on-chip.
> +
> +Main processor emulation
> +========================
> +
> +A server platform may include one of the following system interfaces for
> +communicating with a BMC:
> +
> +* A Keyboard Controller Style (KCS) Interface, accessible via ISA
> +  (``isa-ipmi-kcs``) or PCI (``pci-ipmi-kcs``).
> +* A Block Transfer (BT) Interface, accessible via ISA (``isa-ipmi-bt``) or PCI
> +  (``pci-ipmi-bt``).
> +* An SMBus System Interface (SSIF; ``smbus-ipmi``).
> +
> +These interfaces can all be emulated by QEMU. To emulate the behavior of the
> +BMC, the messaging interface emulators use one of the following backends:
> +
> +* A BMC simulator running within the QEMU process (``ipmi-bmc-sim``).
> +* An external BMC simulator or emulator, connected over a chardev
> +  (``ipmi-bmc-extern``). `ipmi_sim
> +  <https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.ipmi_sim>`_

Here, and in the other reference below, can you reference the official
repository instead of your own?

> +  from OpenIPMI is an example external BMC emulator.
> +
> +The following diagram shows how these entities relate to each other.
> +
> +.. blockdiag::
> +
> +    blockdiag main_processor_ipmi {
> +        orientation = portrait
> +        default_group_color = "none";
> +        class msgif [color = lightblue];
> +        class bmc [color = salmon];
> +
> +        ipmi_sim [color="aquamarine", label="External BMC"]
> +        ipmi-bmc-extern <-> ipmi_sim [label="chardev"];
> +
> +        group {
> +            orientation = portrait
> +
> +            ipmi-interface <-> ipmi-bmc;
> +
> +            group {
> +                orientation = portrait
> +
> +                ipmi-interface [class = "msgif"];
> +                isa-ipmi-kcs [class="msgif", stacked];
> +
> +                ipmi-interface <- isa-ipmi-kcs [hstyle = generalization];
> +            }
> +
> +
> +            group {
> +                orientation = portrait
> +
> +                ipmi-bmc [class = "bmc"];
> +                ipmi-bmc-sim [class="bmc"];
> +                ipmi-bmc-extern [class="bmc"];
> +
> +                ipmi-bmc <- ipmi-bmc-sim [hstyle = generalization];
> +                ipmi-bmc <- ipmi-bmc-extern [hstyle = generalization];
> +            }
> +
> +        }
> +    }
> +
> +IPMI System Interfaces
> +----------------------
> +
> +The system software running on the main processor may use a *system interface*
> +to communicate with the BMC. These are hardware devices attached to an ISA, PCI
> +or i2c bus, and in QEMU, they all need to implement ``ipmi-interface``.
> +This allows a BMC implementation to interact with the system interface in a
> +standard way.
> +
> +IPMI BMC
> +--------
> +
> +The system interface devices delegate emulation of BMC behavior to a BMC
> +device, that is a subclass of ``ipmi-bmc``. This type of device is called
> +a BMC because that's what it looks like to the main processor guest software.
> +
> +The BMC behavior may be simulated within the qemu process (``ipmi-bmc-sim``) or
> +further delegated to an external emulator, or a real BMC. The
> +``ipmi-bmc-extern`` device has a required ``chardev`` property which specifies
> +the communications channel to the external BMC.
> +
> +Wire protocol
> +=============
> +
> +The wire protocol used between ``ipmi-bmc-extern`` and the external BMC
> +emulator is defined by `README.vm
> +<https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.vm>`_ from
> +the OpenIPMI project.
> -- 
> 2.33.0.309.g3052b89438-goog
> 

