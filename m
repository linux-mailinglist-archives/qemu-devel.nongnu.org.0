Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBD4A8BB0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:31:58 +0100 (CET)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgtg-0000U6-4K
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFg7Z-0005r0-Li
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:42:13 -0500
Received: from [2a00:1450:4864:20::62a] (port=46034
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFg7W-0004Gc-Fz
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:42:13 -0500
Received: by mail-ej1-x62a.google.com with SMTP id me13so11056306ejb.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KGIcJLtvJJX8CfGDzxFZD1S7FB+vrbgMLSfy7mPfp8E=;
 b=ts5wiA8CDUP5Di8hVvktAAt1WWivCM+DxSSDOD9XJh5TjRchwmRhMtL3F/kT+8Na1D
 38QQ9KnLe0W7xMOH7pZ/QESPc3BH9ZbKVRV0hTpiPGflFORuAiW2OCzyPoZjOlUb0zJ/
 5i6BLXL3GVamAsjTioR3YEBlZkEZYl1B06OazlIZip3JYqztvMbjykDjwbtW6+YTiejN
 yRUl/6NBATGoa9++R7LNjijgpFRMLQdu3edychut2HppaxQpaP78Og7MxfvhDd6YY+X+
 oDQLhYSvtfby6FsBKouHYz0QL8cf6n6VwwSIBUiAy5pwY2VsaBAgSZdmwRDeiinIe3QJ
 AClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KGIcJLtvJJX8CfGDzxFZD1S7FB+vrbgMLSfy7mPfp8E=;
 b=ZMAb0QmMceKHOATWSiep2k5asjB5KeTfYZnMqYXjQD76ncyiF+mYe3ERNNBWZveYiq
 aoZ0KJKjt7+ShaPW8E5bSO4gU1jFGUduTdyvcnyBxdwK1c2pty5nHWxACp1TtC7kzE2T
 /hI2BsFFTHzk3p1Lw+YFp4TGOYoPVHd5XHosxkNcJsKvml+MAcHyZS2H7fhRH+LRl4gF
 1fpFfp3vLrlmCILbsGQJbFiwi/GysSnxiDCNWXu5a0J2/vX9N2mYU59Hf4oapZCfEn1y
 DOWa5B1gQ91+yUXxYeGdxYb4HYbuUPJ/7kTMmn9NWqUNtjle6uvNQZWFk0cPsai/BX7b
 uRqQ==
X-Gm-Message-State: AOAM531TIQ0c/+rfatY58U0Zy4OcKahv0EjTlv3HkVVZhuaRS/iPgLQJ
 I2TTKGyPWqunkKJ9zWvSncfuxA==
X-Google-Smtp-Source: ABdhPJz7UFqX3BfCXMgHBVbdqtsv3gnVwoN1O7efHeWBOOXVEEyJn4nbrehUGHOHt5+Z9Gztzs4d6g==
X-Received: by 2002:a17:907:8a05:: with SMTP id
 sc5mr29763092ejc.316.1643910129039; 
 Thu, 03 Feb 2022 09:42:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gz19sm17036956ejc.10.2022.02.03.09.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:42:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 213BD1FFB7;
 Thu,  3 Feb 2022 17:42:07 +0000 (GMT)
References: <20220203155304.2648009-1-valentinghita@google.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Valentin Ghita <valentinghita@google.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
Date: Thu, 03 Feb 2022 17:40:49 +0000
In-reply-to: <20220203155304.2648009-1-valentinghita@google.com>
Message-ID: <87tudfsv80.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Valentin Ghita <valentinghita@google.com> writes:

> The DEBUGEN bit is set by the debugger when it is connected to the
> core.  Software can use this bit to check if a debug session is active.
>
> Add a function in gdbstub to check if the debugger is attached to a CPU
> and use this information when the DHCSR register is read in armv7m_nvic.
>
> Signed-off-by: Valentin Ghita <valentinghita@google.com>

Nack - use of the gdbstub should be transparent to the guest. It is not
trying to model any real JTAG/External debug hardware here.

> ---
>  gdbstub.c              | 10 ++++++++++
>  hw/intc/armv7m_nvic.c  |  4 ++++
>  include/exec/gdbstub.h |  6 ++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 3c14c6a038..d4e39db8e7 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
>      return 0;
>  }
>=20=20
> +bool gdb_attached(CPUState *cpu)
> +{
> +    GDBProcess *process =3D gdb_get_cpu_process(cpu);
> +    if (process !=3D NULL) {
> +        return process->attached;
> +    }
> +
> +    return false;
> +}
> +
>  static void register_types(void)
>  {
>      type_register_static(&char_gdb_type_info);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 13df002ce4..d6fff94bca 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -21,6 +21,7 @@
>  #include "sysemu/runstate.h"
>  #include "target/arm/cpu.h"
>  #include "exec/exec-all.h"
> +#include "exec/gdbstub.h"
>  #include "exec/memop.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> @@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_t o=
ffset, MemTxAttrs attrs)
>          }
>          /* We provide minimal-RAS only: RFSR is RAZ/WI */
>          return 0;
> +    case 0xdf0: /* DHCSR */
> +        /* Bit 0: DEBUGEN. */
> +        return gdb_attached(CPU(cpu)) ? 1 : 0;
>      case 0xf34: /* FPCCR */
>          if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
>              return 0;
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index a024a0350d..383f4e5224 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *=
buf, int len)
>   */
>  int gdbserver_start(const char *port_or_device);
>=20=20
> +/**
> + * gdb_attached: check if GDB is attached to a given CPU.
> + * @cpu: the CPU to check if GDB is attached to.
> + */
> +bool gdb_attached(CPUState *cpu);
> +
>  /**
>   * gdb_has_xml:
>   * This is an ugly hack to cope with both new and old gdb.


--=20
Alex Benn=C3=A9e

