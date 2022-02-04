Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336D4A9760
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:04:15 +0100 (CET)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvRu-00053G-2g
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFusu-0002Lr-58
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:28:04 -0500
Received: from [2a00:1450:4864:20::634] (port=41736
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFuss-0000xX-14
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:28:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id a8so17440533ejc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0Ic6JMtvvExUYDDWZkUPEWdsgRnS0qvjvUnt94ggBs4=;
 b=ph6sAs0wMXDFvdTSmswUeQodABe670U9wGaJYslzXhMSrap0mSfHH8K6S8FbAc0Lrj
 vq5hRBSvKiNm6pSxml3LcnWkG0Lq+GqnBHDOOP6yYfAVpfXhlbFaYupmhlJ2KGmWvPk0
 2x42MS9949MkhFnoCp/kj7HmX6mSKx0itRTzn3iBdHAMWVKh/oUNdxy2r/OuiUCqq9Yd
 1kAfwDEb9/vwTImra/aDIprqa4WPDIXBge7rWl0RBT6hOAmtW81oxT8e3j2aZDM0gYv0
 QcaQQWdkFBJbO56nEuRtQYn+w3m9+u6mhzR9YP/FCNnVF7QmS79Cbp0pCcUf/10rBx2P
 umzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0Ic6JMtvvExUYDDWZkUPEWdsgRnS0qvjvUnt94ggBs4=;
 b=uE8Fz+/oM9c3op/fJV+SpIagXzci5lmGaTWz6PC9gCGJdTO1dyKclA7NsN//XNs+yZ
 1fRFNrg0OET5NjpsNR58pGLWK+YWqLA1IMj9db3ngK9x3sZYeu0a2oya+Xt5sH6Clgjf
 iSfjz4VPwXFTd4LSFbBTKVKmtgxby5otnFHDG/54raJSbIx1xPgjDbvsb9ZVsdnZMEy4
 5UadQupMBmnuDbZJF9jyqE3Fa/lGVUL3/NTHeRsQC7p1aoy+6XV/UjUQBdmH9vjcPSZi
 y+bCVJ1n1y95z11ldRA2WYppJUiCMZjZnBKs2luSeuZRv/p4ROP5x+JY3/WWIPEiFxsS
 UXvQ==
X-Gm-Message-State: AOAM531KKMayBN0JWunQZYigHKGjXwGHCG+HqD8wcy1IM7Fb89IG3d8w
 zkiBqdfQZR9Bqkc6VKK5keLH6A==
X-Google-Smtp-Source: ABdhPJwUWXc6Y9ZgjdNJ8brLhFkeIQOCqYi8JrYveh3Y+KN+0IeCwtYZtJV5wJqwAo3pa3SZDrvTTQ==
X-Received: by 2002:a17:907:2da7:: with SMTP id
 gt39mr1703596ejc.563.1643966880028; 
 Fri, 04 Feb 2022 01:28:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j15sm446965ejx.199.2022.02.04.01.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 01:27:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 777271FFB7;
 Fri,  4 Feb 2022 09:27:58 +0000 (GMT)
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Valentin Ghita <valentinghita@google.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
Date: Fri, 04 Feb 2022 09:17:26 +0000
In-reply-to: <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
Message-ID: <87czk3rnfl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

> On Thu, Feb 3, 2022 at 7:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>  Valentin Ghita <valentinghita@google.com> writes:
>
>  > The DEBUGEN bit is set by the debugger when it is connected to the
>  > core.  Software can use this bit to check if a debug session is active.
>  >
>  > Add a function in gdbstub to check if the debugger is attached to a CPU
>  > and use this information when the DHCSR register is read in armv7m_nvi=
c.
>  >
>  > Signed-off-by: Valentin Ghita <valentinghita@google.com>
>
>  Nack - use of the gdbstub should be transparent to the guest. It is not
>  trying to model any real JTAG/External debug hardware here.
>
> The goal was to support the following piece of code:
>
> if (DHCSR.C_DEBUGEN) {
>     __asm ("bkpt");
> }
>=20=20
> And I have another patch which handles the bkpt exception when the DEBUGEN
> bit is set, by interrupting the CPU.
>
> Any suggestions on how we can achieve this?

Assuming you are happy for the device to act as though a external
debugger is attached regardless of the gdbstub state you could use a CPU
property on the command line to enable this behaviour. We have some
examples for SVE for the 64 bit CPUs (see object_property_add for
sve-max-vq). So something like:

  -cpu cortex-m3,dhscr=3Dtrue

You would probably want to model the behaviour of DHSCR.C_HALT as well
because that is something the core might do to itself if it detects it
is running under debug.

For completeness you might want to model the read values from the point
of view of the gdbstub although it wouldn't provide any view into the
system you can't already see as far as I can tell.

>
> Thank you,
> Valentin.
>
>  > ---
>  >  gdbstub.c              | 10 ++++++++++
>  >  hw/intc/armv7m_nvic.c  |  4 ++++
>  >  include/exec/gdbstub.h |  6 ++++++
>  >  3 files changed, 20 insertions(+)
>  >
>  > diff --git a/gdbstub.c b/gdbstub.c
>  > index 3c14c6a038..d4e39db8e7 100644
>  > --- a/gdbstub.c
>  > +++ b/gdbstub.c
>  > @@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
>  >      return 0;
>  >  }
>  >=20=20
>  > +bool gdb_attached(CPUState *cpu)
>  > +{
>  > +    GDBProcess *process =3D gdb_get_cpu_process(cpu);
>  > +    if (process !=3D NULL) {
>  > +        return process->attached;
>  > +    }
>  > +
>  > +    return false;
>  > +}
>  > +
>  >  static void register_types(void)
>  >  {
>  >      type_register_static(&char_gdb_type_info);
>  > diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>  > index 13df002ce4..d6fff94bca 100644
>  > --- a/hw/intc/armv7m_nvic.c
>  > +++ b/hw/intc/armv7m_nvic.c
>  > @@ -21,6 +21,7 @@
>  >  #include "sysemu/runstate.h"
>  >  #include "target/arm/cpu.h"
>  >  #include "exec/exec-all.h"
>  > +#include "exec/gdbstub.h"
>  >  #include "exec/memop.h"
>  >  #include "qemu/log.h"
>  >  #include "qemu/module.h"
>  > @@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_=
t offset, MemTxAttrs attrs)
>  >          }
>  >          /* We provide minimal-RAS only: RFSR is RAZ/WI */
>  >          return 0;
>  > +    case 0xdf0: /* DHCSR */
>  > +        /* Bit 0: DEBUGEN. */
>  > +        return gdb_attached(CPU(cpu)) ? 1 : 0;
>  >      case 0xf34: /* FPCCR */
>  >          if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
>  >              return 0;
>  > diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>  > index a024a0350d..383f4e5224 100644
>  > --- a/include/exec/gdbstub.h
>  > +++ b/include/exec/gdbstub.h
>  > @@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArra=
y *buf, int len)
>  >   */
>  >  int gdbserver_start(const char *port_or_device);
>  >=20=20
>  > +/**
>  > + * gdb_attached: check if GDB is attached to a given CPU.
>  > + * @cpu: the CPU to check if GDB is attached to.
>  > + */
>  > +bool gdb_attached(CPUState *cpu);
>  > +
>  >  /**
>  >   * gdb_has_xml:
>  >   * This is an ugly hack to cope with both new and old gdb.
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

