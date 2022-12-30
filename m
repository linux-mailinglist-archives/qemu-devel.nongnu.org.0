Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1C659C43
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 21:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBMAv-0001x9-J9; Fri, 30 Dec 2022 15:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pBMAo-0001wu-TC
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 15:40:14 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pBMAm-0003tM-Gc
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 15:40:14 -0500
Received: by mail-lf1-x12f.google.com with SMTP id bp15so32997056lfb.13
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 12:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=13Q7jhDZ0IuOtUb0EPALbrk43pBuMJ8MS8gtUwh+U4E=;
 b=YEU8Vvh/q3D2tSU/nLMhtriICOtVeoMC/Z5Q6d880tEbAtAPleYTHmzdES0OyLfvlP
 py6OaChUIKHvNdxUhSn7wKGLnJ1OjUOaRCr//mY9ScriCeX7HUYJ5OeB4+VaR1chsymz
 nDqV+Mqw7iBrI+9/3IZlNisMqLIE3Du8TOEvKQgt0AJm4+ZNdUocyiYx6VrNmrqxlWP2
 TlyCpXTqv2bvRGRiLSU0S8P/QckPLQh+dhuwT4nKDA4L0zUJpgfzajL3IaeSkfQktwV+
 8SaWkjaTBVJUKXKCC35lPwC5jBTpJOkiIDqUZW+KJdbZEikbwav3pHciA2PLaCYycfA7
 wAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13Q7jhDZ0IuOtUb0EPALbrk43pBuMJ8MS8gtUwh+U4E=;
 b=0C0NxtY0obl13n9K15D/3i5CyAsWZz1tg6rcggLOgti+phTNqgM+6oFlYzw7B44Wfz
 WkR/GX5n2ma+8eoykckodXzcLy6EOfOpxQQDoIaz7BdlWGJ7brCxDLqNVaFEoBKhqRw0
 F72VqBPhkyI7vuS162+CG388ikPWuwnYnqgXwjLCghs2UIcTxvJ2FJJlpaEFnp3YjaZJ
 JgLKagLY8XTTZ6bbCDY1RdAJgo3dDBTFK13Bv1ozhIzBy9Qlo0VuPI5SkE68nDrRXQp2
 PphPEE56d2/2UD6qaO6OUDYW2UVGBGsDUPCb5mjjEvVxhYuxIxIYwXs+xdxwGJNGJaU7
 IOgw==
X-Gm-Message-State: AFqh2kokMfhLdqXg1hBN5v2FIMOlHv/TGKTZR6ZXke7AGY5NsNcsbKV2
 +wBNK1SkRtUxGagr73NBJ7U=
X-Google-Smtp-Source: AMrXdXvHDLWxwFoq6ZVLBVFrnmc7OhVBbjbY1wGfVtLWdy9z0HVXNcTcdQSegacKqXCrGaQ1/qoxSg==
X-Received: by 2002:a05:6512:510:b0:4cb:4e2:7a89 with SMTP id
 o16-20020a056512051000b004cb04e27a89mr5442179lfb.25.1672432809829; 
 Fri, 30 Dec 2022 12:40:09 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05651203f400b004a44ffb1023sm3610652lfq.57.2022.12.30.12.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 12:40:09 -0800 (PST)
Date: Fri, 30 Dec 2022 21:40:03 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] target/microblaze: Add gdbstub xml
Message-ID: <Y69MozrLfHLqdkrI@toto>
References: <20221230162419.3106998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230162419.3106998-1-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 30, 2022 at 08:24:19AM -0800, Richard Henderson wrote:
> Mirroring the upstream gdb xml files, the two stack boundary
> registers are separated out.

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>



> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I did this thinking I would be fixing:
> 
>   TEST    basic gdbstub support on microblaze
>   Truncated register 35 in remote 'g' packet
>   Traceback (most recent call last):
>     File "/home/rth/qemu/src/tests/tcg/multiarch/gdbstub/sha1.py",
>       line 71, in <module> if gdb.parse_and_eval('$pc') == 0:
>   gdb.error: No registers.
> 
> but in the end it turned out that the gdb-multiarch supplied
> by ubuntu 22.04 simply doesn't support MicroBlaze, as can be
> seen with the "set architecture" command within gdb.
> 
> (I built gdb from source, to try and debug why this still wasn't
> working, only to find that it did.  :-P)
> 
> Alex, any way to modify our gdb test to fail gracefully here?
> 
> Regardless, having proper xml for all of our targets seems
> like the correct way forward.
> 
> 
> r~
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> ---
>  configs/targets/microblaze-linux-user.mak   |  1 +
>  configs/targets/microblaze-softmmu.mak      |  1 +
>  configs/targets/microblazeel-linux-user.mak |  1 +
>  configs/targets/microblazeel-softmmu.mak    |  1 +
>  target/microblaze/cpu.h                     |  2 +
>  target/microblaze/cpu.c                     |  7 ++-
>  target/microblaze/gdbstub.c                 | 51 +++++++++++-----
>  gdb-xml/microblaze-core.xml                 | 67 +++++++++++++++++++++
>  gdb-xml/microblaze-stack-protect.xml        | 12 ++++
>  9 files changed, 128 insertions(+), 15 deletions(-)
>  create mode 100644 gdb-xml/microblaze-core.xml
>  create mode 100644 gdb-xml/microblaze-stack-protect.xml
> 
> diff --git a/configs/targets/microblaze-linux-user.mak b/configs/targets/microblaze-linux-user.mak
> index 4249a37f65..0a2322c249 100644
> --- a/configs/targets/microblaze-linux-user.mak
> +++ b/configs/targets/microblaze-linux-user.mak
> @@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=common
>  TARGET_SYSTBL=syscall.tbl
>  TARGET_BIG_ENDIAN=y
>  TARGET_HAS_BFLT=y
> +TARGET_XML_FILES=gdb-xml/microblaze-core.xml gdb-xml/microblaze-stack-protect.xml
> diff --git a/configs/targets/microblaze-softmmu.mak b/configs/targets/microblaze-softmmu.mak
> index 8385e2d333..e84c0cc728 100644
> --- a/configs/targets/microblaze-softmmu.mak
> +++ b/configs/targets/microblaze-softmmu.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=microblaze
>  TARGET_BIG_ENDIAN=y
>  TARGET_SUPPORTS_MTTCG=y
>  TARGET_NEED_FDT=y
> +TARGET_XML_FILES=gdb-xml/microblaze-core.xml gdb-xml/microblaze-stack-protect.xml
> diff --git a/configs/targets/microblazeel-linux-user.mak b/configs/targets/microblazeel-linux-user.mak
> index d0e775d840..270743156a 100644
> --- a/configs/targets/microblazeel-linux-user.mak
> +++ b/configs/targets/microblazeel-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=microblaze
>  TARGET_SYSTBL_ABI=common
>  TARGET_SYSTBL=syscall.tbl
>  TARGET_HAS_BFLT=y
> +TARGET_XML_FILES=gdb-xml/microblaze-core.xml gdb-xml/microblaze-stack-protect.xml
> diff --git a/configs/targets/microblazeel-softmmu.mak b/configs/targets/microblazeel-softmmu.mak
> index af40391f2f..9b688036bd 100644
> --- a/configs/targets/microblazeel-softmmu.mak
> +++ b/configs/targets/microblazeel-softmmu.mak
> @@ -1,3 +1,4 @@
>  TARGET_ARCH=microblaze
>  TARGET_SUPPORTS_MTTCG=y
>  TARGET_NEED_FDT=y
> +TARGET_XML_FILES=gdb-xml/microblaze-core.xml gdb-xml/microblaze-stack-protect.xml
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 1e84dd8f47..e541fbb0b3 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -367,6 +367,8 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                          MemTxAttrs *attrs);
>  int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf, int reg);
> +int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, int reg);
>  
>  static inline uint32_t mb_cpu_read_msr(const CPUMBState *env)
>  {
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 817681f9b2..a2d2f5c340 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -28,6 +28,7 @@
>  #include "qemu/module.h"
>  #include "hw/qdev-properties.h"
>  #include "exec/exec-all.h"
> +#include "exec/gdbstub.h"
>  #include "fpu/softfloat-helpers.h"
>  
>  static const struct {
> @@ -294,6 +295,9 @@ static void mb_cpu_initfn(Object *obj)
>      CPUMBState *env = &cpu->env;
>  
>      cpu_set_cpustate_pointers(cpu);
> +    gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
> +                             mb_cpu_gdb_write_stack_protect, 2,
> +                             "microblaze-stack-protect.xml", 0);
>  
>      set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
>  
> @@ -422,7 +426,8 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>      cc->sysemu_ops = &mb_sysemu_ops;
>  #endif
>      device_class_set_props(dc, mb_properties);
> -    cc->gdb_num_core_regs = 32 + 27;
> +    cc->gdb_num_core_regs = 32 + 25;
> +    cc->gdb_core_xml_file = "microblaze-core.xml";
>  
>      cc->disas_set_info = mb_disas_set_info;
>      cc->tcg_ops = &mb_tcg_ops;
> diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
> index 2e6e070051..8143fcae88 100644
> --- a/target/microblaze/gdbstub.c
> +++ b/target/microblaze/gdbstub.c
> @@ -39,8 +39,11 @@ enum {
>      GDB_PVR0  = 32 + 6,
>      GDB_PVR11 = 32 + 17,
>      GDB_EDR   = 32 + 18,
> -    GDB_SLR   = 32 + 25,
> -    GDB_SHR   = 32 + 26,
> +};
> +
> +enum {
> +    GDB_SP_SHL,
> +    GDB_SP_SHR,
>  };
>  
>  int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
> @@ -83,12 +86,6 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>      case GDB_EDR:
>          val = env->edr;
>          break;
> -    case GDB_SLR:
> -        val = env->slr;
> -        break;
> -    case GDB_SHR:
> -        val = env->shr;
> -        break;
>      default:
>          /* Other SRegs aren't modeled, so report a value of 0 */
>          val = 0;
> @@ -97,6 +94,23 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>      return gdb_get_reg32(mem_buf, val);
>  }
>  
> +int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_buf, int n)
> +{
> +    uint32_t val;
> +
> +    switch (n) {
> +    case GDB_SP_SHL:
> +        val = env->slr;
> +        break;
> +    case GDB_SP_SHR:
> +        val = env->shr;
> +        break;
> +    default:
> +        return 0;
> +    }
> +    return gdb_get_reg32(mem_buf, val);
> +}
> +
>  int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>  {
>      MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
> @@ -135,12 +149,21 @@ int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>      case GDB_EDR:
>          env->edr = tmp;
>          break;
> -    case GDB_SLR:
> -        env->slr = tmp;
> -        break;
> -    case GDB_SHR:
> -        env->shr = tmp;
> -        break;
> +    }
> +    return 4;
> +}
> +
> +int mb_cpu_gdb_write_stack_protect(CPUMBState *env, uint8_t *mem_buf, int n)
> +{
> +    switch (n) {
> +    case GDB_SP_SHL:
> +        env->slr = ldl_p(mem_buf);
> +        break;
> +    case GDB_SP_SHR:
> +        env->shr = ldl_p(mem_buf);
> +        break;
> +    default:
> +        return 0;
>      }
>      return 4;
>  }
> diff --git a/gdb-xml/microblaze-core.xml b/gdb-xml/microblaze-core.xml
> new file mode 100644
> index 0000000000..becf77c89c
> --- /dev/null
> +++ b/gdb-xml/microblaze-core.xml
> @@ -0,0 +1,67 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2008 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.microblaze.core">
> +  <reg name="r0" bitsize="32" regnum="0"/>
> +  <reg name="r1" bitsize="32" type="data_ptr"/>
> +  <reg name="r2" bitsize="32"/>
> +  <reg name="r3" bitsize="32"/>
> +  <reg name="r4" bitsize="32"/>
> +  <reg name="r5" bitsize="32"/>
> +  <reg name="r6" bitsize="32"/>
> +  <reg name="r7" bitsize="32"/>
> +  <reg name="r8" bitsize="32"/>
> +  <reg name="r9" bitsize="32"/>
> +  <reg name="r10" bitsize="32"/>
> +  <reg name="r11" bitsize="32"/>
> +  <reg name="r12" bitsize="32"/>
> +  <reg name="r13" bitsize="32"/>
> +  <reg name="r14" bitsize="32"/>
> +  <reg name="r15" bitsize="32"/>
> +  <reg name="r16" bitsize="32"/>
> +  <reg name="r17" bitsize="32"/>
> +  <reg name="r18" bitsize="32"/>
> +  <reg name="r19" bitsize="32"/>
> +  <reg name="r20" bitsize="32"/>
> +  <reg name="r21" bitsize="32"/>
> +  <reg name="r22" bitsize="32"/>
> +  <reg name="r23" bitsize="32"/>
> +  <reg name="r24" bitsize="32"/>
> +  <reg name="r25" bitsize="32"/>
> +  <reg name="r26" bitsize="32"/>
> +  <reg name="r27" bitsize="32"/>
> +  <reg name="r28" bitsize="32"/>
> +  <reg name="r29" bitsize="32"/>
> +  <reg name="r30" bitsize="32"/>
> +  <reg name="r31" bitsize="32"/>
> +  <reg name="rpc" bitsize="32" type="code_ptr"/>
> +  <reg name="rmsr" bitsize="32"/>
> +  <reg name="rear" bitsize="32"/>
> +  <reg name="resr" bitsize="32"/>
> +  <reg name="rfsr" bitsize="32"/>
> +  <reg name="rbtr" bitsize="32"/>
> +  <reg name="rpvr0" bitsize="32"/>
> +  <reg name="rpvr1" bitsize="32"/>
> +  <reg name="rpvr2" bitsize="32"/>
> +  <reg name="rpvr3" bitsize="32"/>
> +  <reg name="rpvr4" bitsize="32"/>
> +  <reg name="rpvr5" bitsize="32"/>
> +  <reg name="rpvr6" bitsize="32"/>
> +  <reg name="rpvr7" bitsize="32"/>
> +  <reg name="rpvr8" bitsize="32"/>
> +  <reg name="rpvr9" bitsize="32"/>
> +  <reg name="rpvr10" bitsize="32"/>
> +  <reg name="rpvr11" bitsize="32"/>
> +  <reg name="redr" bitsize="32"/>
> +  <reg name="rpid" bitsize="32"/>
> +  <reg name="rzpr" bitsize="32"/>
> +  <reg name="rtlbx" bitsize="32"/>
> +  <reg name="rtlbsx" bitsize="32"/>
> +  <reg name="rtlblo" bitsize="32"/>
> +  <reg name="rtlbhi" bitsize="32"/>
> +</feature>
> diff --git a/gdb-xml/microblaze-stack-protect.xml b/gdb-xml/microblaze-stack-protect.xml
> new file mode 100644
> index 0000000000..997301e8a2
> --- /dev/null
> +++ b/gdb-xml/microblaze-stack-protect.xml
> @@ -0,0 +1,12 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2008 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.microblaze.stack-protect">
> +  <reg name="rslr" bitsize="32"/>
> +  <reg name="rshr" bitsize="32"/>
> +</feature>
> -- 
> 2.34.1
> 

