Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FA595468
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:03:49 +0200 (CEST)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrYC-0003rD-Lw
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNrTf-0007cX-Gr
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNrTb-00083c-30
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660636742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sj/+801v8/rSFA8ETLTvkyEG0koXJzu4+VzwqXZ1oTQ=;
 b=Z+vpnPXPfmMRlnS/i2kmgEfhp+n/xM3KEhh2S3kA7hCiUf56hmnSqnvO1YLRzVtcSZx68Y
 bcrpoEe3QgLzw/l/yF7OzkVL6/leH7dd6te8e2eFH8+9GPS1NvEp7WWV2yZfh9guGPQVGw
 kzbka6XVoZgq3Xv4qYDjvfsXUNHQ/RI=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-sGfE0Fr4NA-RbzbWh-TovA-1; Tue, 16 Aug 2022 03:59:00 -0400
X-MC-Unique: sGfE0Fr4NA-RbzbWh-TovA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-10eb770df49so2286547fac.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 00:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Sj/+801v8/rSFA8ETLTvkyEG0koXJzu4+VzwqXZ1oTQ=;
 b=iZ3CxnOWIYAZUI5yHkx0+J6DvrfX0BeOrUPKsu+CL5yWdTdkdw7C7YtjoiFb8JmA2Y
 uNegIsgd9f1YZp7WxbdY//gOxGQ7pNDIMcdPCo/7eZR+sm0MSHoqwNMxLV92AGiUVInA
 LiWcPOmETQZ81EwIUQoYb7RqHQMAojBNRlfC2IPhbsoXHZGIkNz2n4FqXle+sukp9/sv
 RxSCPxZcPTqwgJPHBSt650dx4StWaB1OVtD50DTx7USXEfeGkPnbiK0LN8BmAYuUzUd4
 oWEob5yS45ByG+FbYfzeidfcLuUAFaRqWRiQ4kkpiI4AF82ZVmj6z4tNliIirE5nNsD/
 a5IQ==
X-Gm-Message-State: ACgBeo2F7bL45Mcd2/CARAk/FenFIng9Cjh4RyljsVW1lCZgkgaq6+ma
 sX23mEubJc66DYajGS74TsQSrZ6slyJJ4bGUPcq+8Fd6AqNPc4mAY06nnleSyYNnV971VHwAXvv
 rAJz3XxMqm1Ct4kc9nrotuZdnW1KJNRY=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr12864302oab.205.1660636739439; 
 Tue, 16 Aug 2022 00:58:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SptUGVji5nxXjiIM8xgLTWNBujrR3/1WlYzBr7SeS9AZp1JOEY3bms5Unx0toJNP7db1AAXbPIHAqgU9L/rs=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr12864278oab.205.1660636739199; Tue, 16
 Aug 2022 00:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-2-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 16 Aug 2022 11:58:48 +0400
Message-ID: <CAMxuvaxgjW-mmHVTJ=4atQpQc2s5KyOUjnTVCyUSb+FYsciqAg@mail.gmail.com>
Subject: Re: [PATCH v5 01/18] dump: Replace opaque DumpState pointer with a
 typed one
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 11, 2022 at 4:13 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> It's always better to convey the type of a pointer if at all
> possible. So let's add the DumpState typedef to typedefs.h and move
> the dump note functions from the opaque pointers to DumpState
> pointers.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: C=C3=A9dric Le Goater <clg@kaod.org>
> CC: Daniel Henrique Barboza <danielhb413@gmail.com>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Greg Kurz <groug@kaod.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Bin Meng <bin.meng@windriver.com>
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Thomas Huth <thuth@redhat.com>
> CC: Richard Henderson <richard.henderson@linaro.org>
> CC: David Hildenbrand <david@redhat.com>
> ---
>  include/hw/core/sysemu-cpu-ops.h |  8 ++++----
>  include/qemu/typedefs.h          |  1 +
>  target/arm/arch_dump.c           |  6 ++----
>  target/arm/cpu.h                 |  4 ++--
>  target/i386/arch_dump.c          | 30 +++++++++++++++---------------
>  target/i386/cpu.h                |  8 ++++----
>  target/ppc/arch_dump.c           | 18 +++++++++---------
>  target/ppc/cpu.h                 |  4 ++--
>  target/riscv/arch_dump.c         |  6 ++----
>  target/riscv/cpu.h               |  4 ++--
>  target/s390x/arch_dump.c         | 10 +++++-----
>  target/s390x/s390x-internal.h    |  2 +-
>  12 files changed, 49 insertions(+), 52 deletions(-)
>
> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cp=
u-ops.h
> index a9ba39e5f2..ee169b872c 100644
> --- a/include/hw/core/sysemu-cpu-ops.h
> +++ b/include/hw/core/sysemu-cpu-ops.h
> @@ -53,25 +53,25 @@ typedef struct SysemuCPUOps {
>       * 32-bit VM coredump.
>       */
>      int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
> -                            int cpuid, void *opaque);
> +                            int cpuid, DumpState *s);
>      /**
>       * @write_elf64_note: Callback for writing a CPU-specific ELF note t=
o a
>       * 64-bit VM coredump.
>       */
>      int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
> -                            int cpuid, void *opaque);
> +                            int cpuid, DumpState *s);
>      /**
>       * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-speci=
fic ELF
>       * note to a 32-bit VM coredump.
>       */
>      int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
> -                                void *opaque);
> +                                DumpState *s);
>      /**
>       * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-speci=
fic ELF
>       * note to a 64-bit VM coredump.
>       */
>      int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
> -                                void *opaque);
> +                                DumpState *s);
>      /**
>       * @virtio_is_big_endian: Callback to return %true if a CPU which su=
pports
>       * runtime configurable endianness is currently big-endian.
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 42f4ceb701..054fd46fa6 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -129,6 +129,7 @@ typedef struct VirtIODevice VirtIODevice;
>  typedef struct Visitor Visitor;
>  typedef struct VMChangeStateEntry VMChangeStateEntry;
>  typedef struct VMStateDescription VMStateDescription;
> +typedef struct DumpState DumpState;
>
>  /*
>   * Pointer types
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index b1f040e69f..2d8e41ab8a 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -232,12 +232,11 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFun=
ction f,
>  #endif
>
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque)
> +                             int cpuid, DumpState *s)
>  {
>      struct aarch64_note note;
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> -    DumpState *s =3D opaque;
>      uint64_t pstate, sp;
>      int ret, i;
>
> @@ -360,12 +359,11 @@ static int arm_write_elf32_vfp(WriteCoreDumpFunctio=
n f, CPUARMState *env,
>  }
>
>  int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque)
> +                             int cpuid, DumpState *s)
>  {
>      struct arm_note note;
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> -    DumpState *s =3D opaque;
>      int ret, i;
>      bool fpvalid =3D cpu_isar_feature(aa32_vfp_simd, cpu);
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5168e3d837..fc8b358779 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1100,9 +1100,9 @@ int arm_gen_dynamic_svereg_xml(CPUState *cpu, int b=
ase_reg);
>  const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
>
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque);
> +                             int cpuid, DumpState *s);
>  int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque);
> +                             int cpuid, DumpState *s);
>
>  #ifdef TARGET_AARCH64
>  int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);
> diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
> index 004141fc04..c290910a04 100644
> --- a/target/i386/arch_dump.c
> +++ b/target/i386/arch_dump.c
> @@ -42,7 +42,7 @@ typedef struct {
>
>  static int x86_64_write_elf64_note(WriteCoreDumpFunction f,
>                                     CPUX86State *env, int id,
> -                                   void *opaque)
> +                                   DumpState *s)
>  {
>      x86_64_user_regs_struct regs;
>      Elf64_Nhdr *note;
> @@ -94,7 +94,7 @@ static int x86_64_write_elf64_note(WriteCoreDumpFunctio=
n f,
>      buf +=3D descsz - sizeof(x86_64_user_regs_struct)-sizeof(target_ulon=
g);
>      memcpy(buf, &regs, sizeof(x86_64_user_regs_struct));
>
> -    ret =3D f(note, note_size, opaque);
> +    ret =3D f(note, note_size, s);
>      g_free(note);
>      if (ret < 0) {
>          return -1;
> @@ -148,7 +148,7 @@ static void x86_fill_elf_prstatus(x86_elf_prstatus *p=
rstatus, CPUX86State *env,
>  }
>
>  static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *en=
v,
> -                                int id, void *opaque)
> +                                int id, DumpState *s)
>  {
>      x86_elf_prstatus prstatus;
>      Elf64_Nhdr *note;
> @@ -170,7 +170,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction=
 f, CPUX86State *env,
>      buf +=3D ROUND_UP(name_size, 4);
>      memcpy(buf, &prstatus, sizeof(prstatus));
>
> -    ret =3D f(note, note_size, opaque);
> +    ret =3D f(note, note_size, s);
>      g_free(note);
>      if (ret < 0) {
>          return -1;
> @@ -180,7 +180,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction=
 f, CPUX86State *env,
>  }
>
>  int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque)
> +                             int cpuid, DumpState *s)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
>      int ret;
> @@ -189,10 +189,10 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction =
f, CPUState *cs,
>      bool lma =3D !!(first_x86_cpu->env.hflags & HF_LMA_MASK);
>
>      if (lma) {
> -        ret =3D x86_64_write_elf64_note(f, &cpu->env, cpuid, opaque);
> +        ret =3D x86_64_write_elf64_note(f, &cpu->env, cpuid, s);
>      } else {
>  #endif
> -        ret =3D x86_write_elf64_note(f, &cpu->env, cpuid, opaque);
> +        ret =3D x86_write_elf64_note(f, &cpu->env, cpuid, s);
>  #ifdef TARGET_X86_64
>      }
>  #endif
> @@ -201,7 +201,7 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f,=
 CPUState *cs,
>  }
>
>  int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                             int cpuid, void *opaque)
> +                             int cpuid, DumpState *s)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
>      x86_elf_prstatus prstatus;
> @@ -224,7 +224,7 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,
>      buf +=3D ROUND_UP(name_size, 4);
>      memcpy(buf, &prstatus, sizeof(prstatus));
>
> -    ret =3D f(note, note_size, opaque);
> +    ret =3D f(note, note_size, s);
>      g_free(note);
>      if (ret < 0) {
>          return -1;
> @@ -329,7 +329,7 @@ static void qemu_get_cpustate(QEMUCPUState *s, CPUX86=
State *env)
>
>  static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
>                                        CPUX86State *env,
> -                                      void *opaque,
> +                                      DumpState *s,
>                                        int type)
>  {
>      QEMUCPUState state;
> @@ -369,7 +369,7 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFu=
nction f,
>      buf +=3D ROUND_UP(name_size, 4);
>      memcpy(buf, &state, sizeof(state));
>
> -    ret =3D f(note, note_size, opaque);
> +    ret =3D f(note, note_size, s);
>      g_free(note);
>      if (ret < 0) {
>          return -1;
> @@ -379,19 +379,19 @@ static inline int cpu_write_qemu_note(WriteCoreDump=
Function f,
>  }
>
>  int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cs,
> -                                 void *opaque)
> +                                 DumpState *s)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
>
> -    return cpu_write_qemu_note(f, &cpu->env, opaque, 1);
> +    return cpu_write_qemu_note(f, &cpu->env, s, 1);
>  }
>
>  int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cs,
> -                                 void *opaque)
> +                                 DumpState *s)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
>
> -    return cpu_write_qemu_note(f, &cpu->env, opaque, 0);
> +    return cpu_write_qemu_note(f, &cpu->env, s, 0);
>  }
>
>  int cpu_get_dump_info(ArchDumpInfo *info,
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 82004b65b9..b75108d6a3 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1938,13 +1938,13 @@ extern const VMStateDescription vmstate_x86_cpu;
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
>
>  int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
> -                             int cpuid, void *opaque);
> +                             int cpuid, DumpState *s);
>  int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
> -                             int cpuid, void *opaque);
> +                             int cpuid, DumpState *s);
>  int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
> -                                 void *opaque);
> +                                 DumpState *s);
>  int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
> -                                 void *opaque);
> +                                 DumpState *s);
>
>  void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
>                                  Error **errp);
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 1139cead9f..f58e6359d5 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -270,23 +270,23 @@ ssize_t cpu_get_note_size(int class, int machine, i=
nt nr_cpus)
>  static int ppc_write_all_elf_notes(const char *note_name,
>                                     WriteCoreDumpFunction f,
>                                     PowerPCCPU *cpu, int id,
> -                                   void *opaque)
> +                                   DumpState *s)
>  {
> -    NoteFuncArg arg =3D { .state =3D opaque };
> +    NoteFuncArg arg =3D { .state =3D s };
>      int ret =3D -1;
>      int note_size;
>      const NoteFuncDesc *nf;
>
>      for (nf =3D note_func; nf->note_contents_func; nf++) {
> -        arg.note.hdr.n_namesz =3D cpu_to_dump32(opaque, sizeof(arg.note.=
name));
> -        arg.note.hdr.n_descsz =3D cpu_to_dump32(opaque, nf->contents_siz=
e);
> +        arg.note.hdr.n_namesz =3D cpu_to_dump32(s, sizeof(arg.note.name)=
);
> +        arg.note.hdr.n_descsz =3D cpu_to_dump32(s, nf->contents_size);
>          strncpy(arg.note.name, note_name, sizeof(arg.note.name));
>
>          (*nf->note_contents_func)(&arg, cpu);
>
>          note_size =3D
>              sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_=
size;
> -        ret =3D f(&arg.note, note_size, opaque);
> +        ret =3D f(&arg.note, note_size, s);
>          if (ret < 0) {
>              return -1;
>          }
> @@ -295,15 +295,15 @@ static int ppc_write_all_elf_notes(const char *note=
_name,
>  }
>
>  int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque)
> +                               int cpuid, DumpState *s)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
> +    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
>  }
>
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque)
> +                               int cpuid, DumpState *s)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
> +    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
>  }
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a4c893cfad..f7d28fe093 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1354,9 +1354,9 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
>  const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
>  #endif
>  int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque);
> +                               int cpuid, DumpState *s);
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque);
> +                               int cpuid, DumpState *s);
>  #ifndef CONFIG_USER_ONLY
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> index 709f621d82..736a232956 100644
> --- a/target/riscv/arch_dump.c
> +++ b/target/riscv/arch_dump.c
> @@ -64,12 +64,11 @@ static void riscv64_note_init(struct riscv64_note *no=
te, DumpState *s,
>  }
>
>  int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque)
> +                               int cpuid, DumpState *s)
>  {
>      struct riscv64_note note;
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -    DumpState *s =3D opaque;
>      int ret, i =3D 0;
>      const char name[] =3D "CORE";
>
> @@ -134,12 +133,11 @@ static void riscv32_note_init(struct riscv32_note *=
note, DumpState *s,
>  }
>
>  int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque)
> +                               int cpuid, DumpState *s)
>  {
>      struct riscv32_note note;
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -    DumpState *s =3D opaque;
>      int ret, i;
>      const char name[] =3D "CORE";
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..9699504721 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -505,9 +505,9 @@ extern const char * const riscv_fpr_regnames[];
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
>  void riscv_cpu_do_interrupt(CPUState *cpu);
>  int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque);
> +                               int cpuid, DumpState *s);
>  int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> -                               int cpuid, void *opaque);
> +                               int cpuid, DumpState *s);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
);
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index 08daf93ae1..f60a14920d 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -204,7 +204,7 @@ static const NoteFuncDesc note_linux[] =3D {
>  static int s390x_write_elf64_notes(const char *note_name,
>                                         WriteCoreDumpFunction f,
>                                         S390CPU *cpu, int id,
> -                                       void *opaque,
> +                                       DumpState *s,
>                                         const NoteFuncDesc *funcs)
>  {
>      Note note;
> @@ -222,7 +222,7 @@ static int s390x_write_elf64_notes(const char *note_n=
ame,
>          (*nf->note_contents_func)(&note, cpu, id);
>
>          note_size =3D sizeof(note) - sizeof(note.contents) + nf->content=
s_size;
> -        ret =3D f(&note, note_size, opaque);
> +        ret =3D f(&note, note_size, s);
>
>          if (ret < 0) {
>              return -1;
> @@ -235,16 +235,16 @@ static int s390x_write_elf64_notes(const char *note=
_name,
>
>
>  int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                              int cpuid, void *opaque)
> +                              int cpuid, DumpState *s)
>  {
>      S390CPU *cpu =3D S390_CPU(cs);
>      int r;
>
> -    r =3D s390x_write_elf64_notes("CORE", f, cpu, cpuid, opaque, note_co=
re);
> +    r =3D s390x_write_elf64_notes("CORE", f, cpu, cpuid, s, note_core);
>      if (r) {
>          return r;
>      }
> -    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, opaque, note_=
linux);
> +    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux=
);
>  }
>
>  int cpu_get_dump_info(ArchDumpInfo *info,
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.=
h
> index 6aba7fd0ca..b5ae0ae364 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -227,7 +227,7 @@ static inline hwaddr decode_basedisp_s(CPUS390XState =
*env, uint32_t ipb,
>
>  /* arch_dump.c */
>  int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> -                              int cpuid, void *opaque);
> +                              int cpuid, DumpState *s);
>
>
>  /* cc_helper.c */
> --
> 2.34.1
>


