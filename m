Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE411309CF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 10:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWcWD-0000yo-Do
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 04:04:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hWcUy-0000fd-9R
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:02:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hWcUu-000272-Iu
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:02:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hWcUu-00024r-6O
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:02:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72411CA36F;
	Fri, 31 May 2019 08:02:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 177AD2E165;
	Fri, 31 May 2019 08:02:41 +0000 (UTC)
Date: Fri, 31 May 2019 10:02:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Michael Rolnik <mrolnik@gmail.com>
Message-ID: <20190531100237.138a9113@redhat.com>
In-Reply-To: <20190530190738.22713-2-mrolnik@gmail.com>
References: <20190530190738.22713-1-mrolnik@gmail.com>
	<20190530190738.22713-2-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 31 May 2019 08:02:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC v20 1/8] target/avr: Add outward facing
 interfaces and core CPU logic
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, qemu-devel@nongnu.org,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 May 2019 22:07:31 +0300
Michael Rolnik <mrolnik@gmail.com> wrote:

> From: Sarah Harris <S.E.Harris@kent.ac.uk>
> 
> This includes:
> - CPU data structures
> - object model classes and functions
> - migration functions
> - GDB hooks
> 
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>

small note wrt CPU model handling below,
but otherwise looks good to me from generic CPU infrastructure POV.

> ---
>  target/avr/cpu-qom.h |  83 +++++++
>  target/avr/cpu.c     | 571 +++++++++++++++++++++++++++++++++++++++++++
>  target/avr/cpu.h     | 242 ++++++++++++++++++
>  target/avr/gdbstub.c |  85 +++++++
>  target/avr/machine.c | 122 +++++++++
>  5 files changed, 1103 insertions(+)
>  create mode 100644 target/avr/cpu-qom.h
>  create mode 100644 target/avr/cpu.c
>  create mode 100644 target/avr/cpu.h
>  create mode 100644 target/avr/gdbstub.c
>  create mode 100644 target/avr/machine.c
> 
> diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
> new file mode 100644
> index 0000000000..8085567b87
> --- /dev/null
> +++ b/target/avr/cpu-qom.h
> @@ -0,0 +1,83 @@
> +/*
> + * QEMU AVR CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#ifndef QEMU_AVR_CPU_QOM_H
> +#define QEMU_AVR_CPU_QOM_H
> +
> +#include "qom/cpu.h"
> +
> +#define TYPE_AVR_CPU "avr"
> +
> +#define AVR_CPU_CLASS(klass) \
> +                    OBJECT_CLASS_CHECK(AVRCPUClass, (klass), TYPE_AVR_CPU)
> +#define AVR_CPU(obj) \
> +                    OBJECT_CHECK(AVRCPU, (obj), TYPE_AVR_CPU)
> +#define AVR_CPU_GET_CLASS(obj) \
> +                    OBJECT_GET_CLASS(AVRCPUClass, (obj), TYPE_AVR_CPU)
> +
> +/**
> + *  AVRCPUClass:
> + *  @parent_realize: The parent class' realize handler.
> + *  @parent_reset: The parent class' reset handler.
> + *  @vr: Version Register value.
> + *
> + *  A AVR CPU model.
> + */
> +typedef struct AVRCPUClass {
> +    CPUClass parent_class;
> +
> +    DeviceRealize parent_realize;
> +    void (*parent_reset)(CPUState *cpu);
> +} AVRCPUClass;
> +
> +/**
> + *  AVRCPU:
> + *  @env: #CPUAVRState
> + *
> + *  A AVR CPU.
> + */
> +typedef struct AVRCPU {
> +    /*< private >*/
> +    CPUState parent_obj;
> +    /*< public >*/
> +
> +    CPUAVRState env;
> +} AVRCPU;
> +
> +static inline AVRCPU *avr_env_get_cpu(CPUAVRState *env)
> +{
> +    return container_of(env, AVRCPU, env);
> +}
> +
> +#define ENV_GET_CPU(e) CPU(avr_env_get_cpu(e))
> +#define ENV_OFFSET offsetof(AVRCPU, env)
> +
> +#ifndef CONFIG_USER_ONLY
> +extern const struct VMStateDescription vms_avr_cpu;
> +#endif
> +
> +void avr_cpu_do_interrupt(CPUState *cpu);
> +bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags);
> +hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
> +int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +
> +#endif
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> new file mode 100644
> index 0000000000..9175f9d022
> --- /dev/null
> +++ b/target/avr/cpu.c
> @@ -0,0 +1,571 @@
> +/*
> + * QEMU AVR CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/qemu-print.h"
> +#include "qapi/error.h"
> +#include "cpu.h"
> +#include "qemu-common.h"
> +#include "migration/vmstate.h"
> +
> +static void avr_cpu_set_pc(CPUState *cs, vaddr value)
> +{
> +    AVRCPU *cpu = AVR_CPU(cs);
> +
> +    cpu->env.pc_w = value / 2; /* internally PC points to words */
> +}
> +
> +static bool avr_cpu_has_work(CPUState *cs)
> +{
> +    AVRCPU *cpu = AVR_CPU(cs);
> +    CPUAVRState *env = &cpu->env;
> +
> +    return (cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET))
> +            && cpu_interrupts_enabled(env);
> +}
> +
> +static void avr_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
> +{
> +    AVRCPU *cpu = AVR_CPU(cs);
> +    CPUAVRState *env = &cpu->env;
> +
> +    env->pc_w = tb->pc / 2; /* internally PC points to words */
> +}
> +
> +static void avr_cpu_reset(CPUState *s)
> +{
> +    AVRCPU *cpu = AVR_CPU(s);
> +    AVRCPUClass *mcc = AVR_CPU_GET_CLASS(cpu);
> +    CPUAVRState *env = &cpu->env;
> +
> +    mcc->parent_reset(s);
> +
> +    env->pc_w = 0;
> +    env->sregI = 1;
> +    env->sregC = 0;
> +    env->sregZ = 0;
> +    env->sregN = 0;
> +    env->sregV = 0;
> +    env->sregS = 0;
> +    env->sregH = 0;
> +    env->sregT = 0;
> +
> +    env->rampD = 0;
> +    env->rampX = 0;
> +    env->rampY = 0;
> +    env->rampZ = 0;
> +    env->eind = 0;
> +    env->sp = 0;
> +
> +    memset(env->r, 0, sizeof(env->r));
> +
> +    tlb_flush(s);
> +}
> +
> +static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
> +{
> +    info->mach = bfd_arch_avr;
> +    info->print_insn = NULL;
> +}
> +
> +static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cs = CPU(dev);
> +    AVRCPUClass *mcc = AVR_CPU_GET_CLASS(dev);
> +    Error *local_err = NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    qemu_init_vcpu(cs);
> +    cpu_reset(cs);
> +
> +    mcc->parent_realize(dev, errp);
> +}
> +
> +static void avr_cpu_set_int(void *opaque, int irq, int level)
> +{
> +    AVRCPU *cpu = opaque;
> +    CPUAVRState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    uint64_t mask = (1ull << irq);
> +    if (level) {
> +        env->intsrc |= mask;
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        env->intsrc &= ~mask;
> +        if (env->intsrc == 0) {
> +            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +        }
> +    }
> +}
> +
> +static void avr_cpu_initfn(Object *obj)
> +{
> +    CPUState *cs = CPU(obj);
> +    AVRCPU *cpu = AVR_CPU(obj);
> +
> +    cs->env_ptr = &cpu->env;
> +
> +#ifndef CONFIG_USER_ONLY
> +    /* Set the number of interrupts supported by the CPU. */
> +    qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int, 57);
> +#endif
> +}
> +
> +static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
> +{
> +    ObjectClass *oc;
> +    char *name;
> +
> +    if (!cpu_model) {
> +        return NULL;
> +    }
> +
> +    oc = object_class_by_name(cpu_model);
> +    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_AVR_CPU) != NULL &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
> +    }

In other targets QEMU has 1-2 or more naming variants but that were influenced
by legacy code and we have to keep compatibility not to break existing
configurations.

In case of new cpu, I'd keep only above hunk and drop the rest so that
only one naming scheme would be available, which is compatible with
'-device' naming and QMP/monitor interfaces that we support.


> +    name = g_strdup_printf(AVR_CPU_TYPE_NAME("%s"), cpu_model);
> +    oc = object_class_by_name(name);
> +    g_free(name);
> +    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_AVR_CPU) != NULL &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
> +    }
> +
> +    return NULL;
> +}
> +
> +static void avr_cpu_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    CPUClass *cc = CPU_CLASS(oc);
> +    AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
> +
> +    mcc->parent_realize = dc->realize;
> +    dc->realize = avr_cpu_realizefn;
> +
> +    mcc->parent_reset = cc->reset;
> +    cc->reset = avr_cpu_reset;
> +
> +    cc->class_by_name = avr_cpu_class_by_name;
> +
> +    cc->has_work = avr_cpu_has_work;
> +    cc->do_interrupt = avr_cpu_do_interrupt;
> +    cc->cpu_exec_interrupt = avr_cpu_exec_interrupt;
> +    cc->dump_state = avr_cpu_dump_state;
> +    cc->set_pc = avr_cpu_set_pc;
> +#if !defined(CONFIG_USER_ONLY)
> +    cc->memory_rw_debug = avr_cpu_memory_rw_debug;
> +#endif
> +#ifdef CONFIG_USER_ONLY
> +    cc->handle_mmu_fault = avr_cpu_handle_mmu_fault;
> +#else
> +    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
> +    cc->vmsd = &vms_avr_cpu;
> +#endif
> +    cc->disas_set_info = avr_cpu_disas_set_info;
> +    cc->tlb_fill = avr_cpu_tlb_fill;
> +    cc->tcg_initialize = avr_cpu_tcg_init;
> +    cc->synchronize_from_tb = avr_cpu_synchronize_from_tb;
> +    cc->gdb_read_register = avr_cpu_gdb_read_register;
> +    cc->gdb_write_register = avr_cpu_gdb_write_register;
> +    cc->gdb_num_core_regs = 35;
> +}
> +
> +static void avr_avr1_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +}
> +
> +static void avr_avr2_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +}
> +
> +static void avr_avr25_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +}
> +
> +static void avr_avr3_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +}
> +
> +static void avr_avr31_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +}
> +
> +static void avr_avr35_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +}
> +
> +static void avr_avr4_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +}
> +
> +static void avr_avr5_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +}
> +
> +static void avr_avr51_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +}
> +
> +static void avr_avr6_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +}
> +
> +static void avr_xmega2_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +    avr_set_feature(env, AVR_FEATURE_RMW);
> +}
> +
> +static void avr_xmega4_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +    avr_set_feature(env, AVR_FEATURE_RMW);
> +}
> +
> +static void avr_xmega5_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPD);
> +    avr_set_feature(env, AVR_FEATURE_RAMPX);
> +    avr_set_feature(env, AVR_FEATURE_RAMPY);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +    avr_set_feature(env, AVR_FEATURE_RMW);
> +}
> +
> +static void avr_xmega6_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +    avr_set_feature(env, AVR_FEATURE_RMW);
> +}
> +
> +static void avr_xmega7_initfn(Object *obj)
> +{
> +    AVRCPU *cpu = AVR_CPU(obj);
> +    CPUAVRState *env = &cpu->env;
> +
> +    avr_set_feature(env, AVR_FEATURE_LPM);
> +    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
> +    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
> +    avr_set_feature(env, AVR_FEATURE_SRAM);
> +    avr_set_feature(env, AVR_FEATURE_BREAK);
> +
> +    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
> +    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
> +    avr_set_feature(env, AVR_FEATURE_RAMPD);
> +    avr_set_feature(env, AVR_FEATURE_RAMPX);
> +    avr_set_feature(env, AVR_FEATURE_RAMPY);
> +    avr_set_feature(env, AVR_FEATURE_RAMPZ);
> +    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
> +    avr_set_feature(env, AVR_FEATURE_ELPMX);
> +    avr_set_feature(env, AVR_FEATURE_ELPM);
> +    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
> +    avr_set_feature(env, AVR_FEATURE_LPMX);
> +    avr_set_feature(env, AVR_FEATURE_MOVW);
> +    avr_set_feature(env, AVR_FEATURE_MUL);
> +    avr_set_feature(env, AVR_FEATURE_RMW);
> +}
> +
> +typedef struct AVRCPUInfo {
> +    const char *name;
> +    void (*initfn)(Object *obj);
> +} AVRCPUInfo;
> +
> +static gint avr_cpu_list_compare(gconstpointer a, gconstpointer b)
> +{
> +    ObjectClass *class_a = (ObjectClass *)a;
> +    ObjectClass *class_b = (ObjectClass *)b;
> +    const char *name_a;
> +    const char *name_b;
> +
> +    name_a = object_class_get_name(class_a);
> +    name_b = object_class_get_name(class_b);
> +
> +    return strcmp(name_a, name_b);
> +}
> +
> +static void avr_cpu_list_entry(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc = data;
> +    const char *typename = object_class_get_name(oc);
> +    size_t len = strlen(typename);
> +    size_t suffix_len = strlen(AVR_CPU_TYPE_SUFFIX);
> +
> +    if (len > suffix_len) {
> +        qemu_printf("  %.*s\n", (int)(len - suffix_len), typename);
> +    } else {
> +        qemu_printf("  %s\n", typename);
> +    }
> +}
> +
> +void avr_cpu_list(void)
> +{
> +    GSList *list;
> +    list = object_class_get_list(TYPE_AVR_CPU, false);
> +    list = g_slist_sort(list, avr_cpu_list_compare);
> +    qemu_printf("Available CPUs:\n");
> +    g_slist_foreach(list, avr_cpu_list_entry, NULL);
> +    g_slist_free(list);
> +}
> +
> +#define DEFINE_AVR_CPU_TYPE(model, initfn) \
> +    {                                      \
> +        .parent = TYPE_AVR_CPU,            \
> +        .instance_init = initfn,           \
> +        .name = AVR_CPU_TYPE_NAME(model),  \
> +    }
> +
> +static const TypeInfo avr_cpu_type_info[] = {
> +    {
> +        .name = TYPE_AVR_CPU,
> +        .parent = TYPE_CPU,
> +        .instance_size = sizeof(AVRCPU),
> +        .instance_init = avr_cpu_initfn,
> +        .class_size = sizeof(AVRCPUClass),
> +        .class_init = avr_cpu_class_init,
> +        .abstract = false,
> +    },
> +    DEFINE_AVR_CPU_TYPE("avr1", avr_avr1_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr2", avr_avr2_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr25", avr_avr25_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr3", avr_avr3_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr31", avr_avr31_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr35", avr_avr35_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr4", avr_avr4_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr5", avr_avr5_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr51", avr_avr51_initfn),
> +    DEFINE_AVR_CPU_TYPE("avr6", avr_avr6_initfn),
> +    DEFINE_AVR_CPU_TYPE("xmega2", avr_xmega2_initfn),
> +    DEFINE_AVR_CPU_TYPE("xmega4", avr_xmega4_initfn),
> +    DEFINE_AVR_CPU_TYPE("xmega5", avr_xmega5_initfn),
> +    DEFINE_AVR_CPU_TYPE("xmega6", avr_xmega6_initfn),
> +    DEFINE_AVR_CPU_TYPE("xmega7", avr_xmega7_initfn),
> +};
> +
> +DEFINE_TYPES(avr_cpu_type_info)
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> new file mode 100644
> index 0000000000..d1de4e64b1
> --- /dev/null
> +++ b/target/avr/cpu.h
> @@ -0,0 +1,242 @@
> +/*
> + * QEMU AVR CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#if !defined(CPU_AVR_H)
> +#define CPU_AVR_H
> +
> +#include "qemu-common.h"
> +
> +#define TARGET_LONG_BITS 32
> +
> +#define CPUArchState struct CPUAVRState
> +
> +#include "exec/cpu-defs.h"
> +#include "fpu/softfloat.h"
> +
> +/*
> + * TARGET_PAGE_BITS cannot be more than 8 bits because
> + * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and they
> + *     should be implemented as a device and not memory
> + * 2.  SRAM starts at the address 0x0100
> + */
> +#define TARGET_PAGE_BITS 8
> +#define TARGET_PHYS_ADDR_SPACE_BITS 24
> +#define TARGET_VIRT_ADDR_SPACE_BITS 24
> +#define NB_MMU_MODES 2
> +
> +/*
> + * AVR has two memory spaces, data & code.
> + * e.g. both have 0 address
> + * ST/LD instructions access data space
> + * LPM/SPM and instruction fetching access code memory space
> + */
> +#define MMU_CODE_IDX 0
> +#define MMU_DATA_IDX 1
> +
> +#define EXCP_RESET 1
> +#define EXCP_INT(n) (EXCP_RESET + (n) + 1)
> +
> +/* Number of CPU registers */
> +#define NO_CPU_REGISTERS 32
> +/* Number of IO registers accessible by ld/st/in/out */
> +#define NO_IO_REGISTERS 64
> +
> +/*
> + * Offsets of AVR memory regions in host memory space.
> + *
> + * This is needed because the AVR has separate code and data address
> + * spaces that both have start from zero but have to go somewhere in
> + * host memory.
> + *
> + * It's also useful to know where some things are, like the IO registers.
> + */
> +/* Flash program memory */
> +#define OFFSET_CODE 0x00000000
> +/* CPU registers, IO registers, and SRAM */
> +#define OFFSET_DATA 0x00800000
> +/* CPU registers specifically, these are mapped at the start of data */
> +#define OFFSET_CPU_REGISTERS OFFSET_DATA
> +/*
> + * IO registers, including status register, stack pointer, and memory
> + * mapped peripherals, mapped just after CPU registers
> + */
> +#define OFFSET_IO_REGISTERS (OFFSET_DATA + NO_CPU_REGISTERS)
> +
> +enum avr_features {
> +    AVR_FEATURE_SRAM,
> +
> +    AVR_FEATURE_1_BYTE_PC,
> +    AVR_FEATURE_2_BYTE_PC,
> +    AVR_FEATURE_3_BYTE_PC,
> +
> +    AVR_FEATURE_1_BYTE_SP,
> +    AVR_FEATURE_2_BYTE_SP,
> +
> +    AVR_FEATURE_BREAK,
> +    AVR_FEATURE_DES,
> +    AVR_FEATURE_RMW, /* Read Modify Write - XCH LAC LAS LAT */
> +
> +    AVR_FEATURE_EIJMP_EICALL,
> +    AVR_FEATURE_IJMP_ICALL,
> +    AVR_FEATURE_JMP_CALL,
> +
> +    AVR_FEATURE_ADIW_SBIW,
> +
> +    AVR_FEATURE_SPM,
> +    AVR_FEATURE_SPMX,
> +
> +    AVR_FEATURE_ELPMX,
> +    AVR_FEATURE_ELPM,
> +    AVR_FEATURE_LPMX,
> +    AVR_FEATURE_LPM,
> +
> +    AVR_FEATURE_MOVW,
> +    AVR_FEATURE_MUL,
> +    AVR_FEATURE_RAMPD,
> +    AVR_FEATURE_RAMPX,
> +    AVR_FEATURE_RAMPY,
> +    AVR_FEATURE_RAMPZ,
> +};
> +
> +typedef struct CPUAVRState CPUAVRState;
> +
> +struct CPUAVRState {
> +    uint32_t pc_w; /* 0x003fffff up to 22 bits */
> +
> +    uint32_t sregC; /* 0x00000001 1 bits */
> +    uint32_t sregZ; /* 0x0000ffff 16 bits, negative logic; */
> +                    /* 0=flag set, >0=flag cleared */
> +    uint32_t sregN; /* 0x00000001 1 bits */
> +    uint32_t sregV; /* 0x00000001 1 bits */
> +    uint32_t sregS; /* 0x00000001 1 bits */
> +    uint32_t sregH; /* 0x00000001 1 bits */
> +    uint32_t sregT; /* 0x00000001 1 bits */
> +    uint32_t sregI; /* 0x00000001 1 bits */
> +
> +    uint32_t rampD; /* 0x00ff0000 8 bits */
> +    uint32_t rampX; /* 0x00ff0000 8 bits */
> +    uint32_t rampY; /* 0x00ff0000 8 bits */
> +    uint32_t rampZ; /* 0x00ff0000 8 bits */
> +    uint32_t eind; /* 0x00ff0000 8 bits */
> +
> +    uint32_t r[NO_CPU_REGISTERS]; /* 8 bits each */
> +    uint32_t sp; /* 16 bits */
> +
> +    uint64_t intsrc; /* interrupt sources */
> +    bool fullacc; /* CPU/MEM if true MEM only otherwise */
> +
> +    uint32_t features;
> +
> +    /* Those resources are used only in QEMU core */
> +    CPU_COMMON
> +};
> +
> +static inline int avr_feature(CPUAVRState *env, int feature)
> +{
> +    return (env->features & (1U << feature)) != 0;
> +}
> +
> +static inline void avr_set_feature(CPUAVRState *env, int feature)
> +{
> +    env->features |= (1U << feature);
> +}
> +
> +#define cpu_list avr_cpu_list
> +#define cpu_signal_handler cpu_avr_signal_handler
> +
> +#include "exec/cpu-all.h"
> +#include "cpu-qom.h"
> +
> +#define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
> +#define AVR_CPU_TYPE_NAME(model) model AVR_CPU_TYPE_SUFFIX
> +#define CPU_RESOLVING_TYPE TYPE_AVR_CPU
> +
> +static inline int cpu_mmu_index(CPUAVRState *env, bool ifetch)
> +{
> +    return ifetch ? MMU_CODE_IDX : MMU_DATA_IDX;
> +}
> +
> +void avr_cpu_tcg_init(void);
> +
> +void avr_cpu_list(void);
> +int cpu_avr_exec(CPUState *cpu);
> +int cpu_avr_signal_handler(int host_signum, void *pinfo, void *puc);
> +int avr_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int size,
> +                                int rw, int mmu_idx);
> +int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
> +                                int len, bool is_write);
> +
> +enum {
> +    TB_FLAGS_FULL_ACCESS = 1,
> +};
> +
> +static inline void cpu_get_tb_cpu_state(CPUAVRState *env, target_ulong *pc,
> +                                target_ulong *cs_base, uint32_t *pflags)
> +{
> +    uint32_t flags = 0;
> +
> +    *pc = env->pc_w * 2;
> +    *cs_base = 0;
> +
> +    if (env->fullacc) {
> +        flags |= TB_FLAGS_FULL_ACCESS;
> +    }
> +
> +    *pflags = flags;
> +}
> +
> +static inline int cpu_interrupts_enabled(CPUAVRState *env)
> +{
> +    return env->sregI != 0;
> +}
> +
> +static inline uint8_t cpu_get_sreg(CPUAVRState *env)
> +{
> +    uint8_t sreg;
> +    sreg = (env->sregC & 0x01) << 0
> +         | (env->sregZ == 0 ? 1 : 0) << 1
> +         | (env->sregN) << 2
> +         | (env->sregV) << 3
> +         | (env->sregS) << 4
> +         | (env->sregH) << 5
> +         | (env->sregT) << 6
> +         | (env->sregI) << 7;
> +    return sreg;
> +}
> +
> +static inline void cpu_set_sreg(CPUAVRState *env, uint8_t sreg)
> +{
> +    env->sregC = (sreg >> 0) & 0x01;
> +    env->sregZ = (sreg >> 1) & 0x01 ? 0 : 1;
> +    env->sregN = (sreg >> 2) & 0x01;
> +    env->sregV = (sreg >> 3) & 0x01;
> +    env->sregS = (sreg >> 4) & 0x01;
> +    env->sregH = (sreg >> 5) & 0x01;
> +    env->sregT = (sreg >> 6) & 0x01;
> +    env->sregI = (sreg >> 7) & 0x01;
> +}
> +
> +bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                        MMUAccessType access_type, int mmu_idx,
> +                        bool probe, uintptr_t retaddr);
> +
> +#include "exec/exec-all.h"
> +
> +#endif /* !defined (CPU_AVR_H) */
> diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
> new file mode 100644
> index 0000000000..537dc7226e
> --- /dev/null
> +++ b/target/avr/gdbstub.c
> @@ -0,0 +1,85 @@
> +/*
> + * QEMU AVR CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "exec/gdbstub.h"
> +
> +int avr_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
> +{
> +    AVRCPU *cpu = AVR_CPU(cs);
> +    CPUAVRState *env = &cpu->env;
> +
> +    /*  R */
> +    if (n < 32) {
> +        return gdb_get_reg8(mem_buf, env->r[n]);
> +    }
> +
> +    /*  SREG */
> +    if (n == 32) {
> +        uint8_t sreg = cpu_get_sreg(env);
> +
> +        return gdb_get_reg8(mem_buf, sreg);
> +    }
> +
> +    /*  SP */
> +    if (n == 33) {
> +        return gdb_get_reg16(mem_buf, env->sp & 0x0000ffff);
> +    }
> +
> +    /*  PC */
> +    if (n == 34) {
> +        return gdb_get_reg32(mem_buf, env->pc_w * 2);
> +    }
> +
> +    return 0;
> +}
> +
> +int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
> +{
> +    AVRCPU *cpu = AVR_CPU(cs);
> +    CPUAVRState *env = &cpu->env;
> +
> +    /*  R */
> +    if (n < 32) {
> +        env->r[n] = *mem_buf;
> +        return 1;
> +    }
> +
> +    /*  SREG */
> +    if (n == 32) {
> +        cpu_set_sreg(env, *mem_buf);
> +        return 1;
> +    }
> +
> +    /*  SP */
> +    if (n == 33) {
> +        env->sp = lduw_p(mem_buf);
> +        return 2;
> +    }
> +
> +    /*  PC */
> +    if (n == 34) {
> +        env->pc_w = ldl_p(mem_buf) / 2;
> +        return 4;
> +    }
> +
> +    return 0;
> +}
> diff --git a/target/avr/machine.c b/target/avr/machine.c
> new file mode 100644
> index 0000000000..438c8a6cb5
> --- /dev/null
> +++ b/target/avr/machine.c
> @@ -0,0 +1,122 @@
> +/*
> + * QEMU AVR CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/hw.h"
> +#include "cpu.h"
> +#include "hw/boards.h"
> +#include "migration/qemu-file.h"
> +
> +static int get_sreg(QEMUFile *f, void *opaque, size_t size,
> +    const VMStateField *field)
> +{
> +    CPUAVRState *env = opaque;
> +    uint8_t sreg;
> +
> +    sreg = qemu_get_byte(f);
> +    cpu_set_sreg(env, sreg);
> +    return 0;
> +}
> +
> +static int put_sreg(
> +    QEMUFile *f, void *opaque, size_t size,
> +    const VMStateField *field, QJSON *vmdesc)
> +{
> +    CPUAVRState *env = opaque;
> +    uint8_t sreg = cpu_get_sreg(env);
> +
> +    qemu_put_byte(f, sreg);
> +    return 0;
> +}
> +
> +static const VMStateInfo vms_sreg = {
> +    .name = "sreg",
> +    .get = get_sreg,
> +    .put = put_sreg,
> +};
> +
> +static int get_segment(
> +    QEMUFile *f, void *opaque, size_t size, const VMStateField *field)
> +{
> +    uint32_t *ramp = opaque;
> +    uint8_t temp;
> +
> +    temp = qemu_get_byte(f);
> +    *ramp = ((uint32_t)temp) << 16;
> +    return 0;
> +}
> +
> +static int put_segment(
> +    QEMUFile *f, void *opaque, size_t size,
> +    const VMStateField *field, QJSON *vmdesc)
> +{
> +    uint32_t *ramp = opaque;
> +    uint8_t temp = *ramp >> 16;
> +
> +    qemu_put_byte(f, temp);
> +    return 0;
> +}
> +
> +static const VMStateInfo vms_rampD = {
> +    .name = "rampD",
> +    .get = get_segment,
> +    .put = put_segment,
> +};
> +static const VMStateInfo vms_rampX = {
> +    .name = "rampX",
> +    .get = get_segment,
> +    .put = put_segment,
> +};
> +static const VMStateInfo vms_rampY = {
> +    .name = "rampY",
> +    .get = get_segment,
> +    .put = put_segment,
> +};
> +static const VMStateInfo vms_rampZ = {
> +    .name = "rampZ",
> +    .get = get_segment,
> +    .put = put_segment,
> +};
> +static const VMStateInfo vms_eind = {
> +    .name = "eind",
> +    .get = get_segment,
> +    .put = put_segment,
> +};
> +
> +const VMStateDescription vms_avr_cpu = {
> +    .name = "cpu",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.pc_w, AVRCPU),
> +        VMSTATE_UINT32(env.sp, AVRCPU),
> +
> +        VMSTATE_UINT32_ARRAY(env.r, AVRCPU, NO_CPU_REGISTERS),
> +
> +        VMSTATE_SINGLE(env, AVRCPU, 0, vms_sreg, CPUAVRState),
> +        VMSTATE_SINGLE(env.rampD, AVRCPU, 0, vms_rampD, uint32_t),
> +        VMSTATE_SINGLE(env.rampX, AVRCPU, 0, vms_rampX, uint32_t),
> +        VMSTATE_SINGLE(env.rampY, AVRCPU, 0, vms_rampY, uint32_t),
> +        VMSTATE_SINGLE(env.rampZ, AVRCPU, 0, vms_rampZ, uint32_t),
> +        VMSTATE_SINGLE(env.eind, AVRCPU, 0, vms_eind, uint32_t),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};


