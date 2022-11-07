Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6961F1F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 12:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os0PU-00008h-N5; Mon, 07 Nov 2022 06:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os0PR-00006E-LJ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:35:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os0PN-0000En-C4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:35:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v1so15703769wrt.11
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Na2wwKE08e8BDh+stvMnQhoXMVcLhkyEaf8Jtd54+A=;
 b=xr4uhFIXf2cLQzgGlc0JpdLdP1folKxAf2DYdmXcEYsro+fAF3n0OvsO02ECuSvyQt
 M306oIUlYL8kc1gz8H+qtcaYrxLsb/76no0dnw2NtKeJuIDACyOYOuSm37DJFFPOOGgY
 rM1huttEYJtINRRzbsc/XXGuXUS+JAXvJ6gpzyW8zGQQNryjZPlHdwnnQDbNFIZDJRbj
 jWLeULRL2wxIpNZhI9bMPgNwTAD58PXt/bn9/rsbPTLXGq4G0zENGYV/p2ICOaZ03t/m
 TaoM43jZgB0ndwcQ8Kcvpb3gxM+BLyNuH5IU8IEAESP9euNslAoT5YCmS+Gmcds1Q8dJ
 JQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3Na2wwKE08e8BDh+stvMnQhoXMVcLhkyEaf8Jtd54+A=;
 b=ItfxfRFhAb0JMDPb7bCgfEh+/eSZV63ap8YcTWa4RXCHBHJ8ZAY8toz3023BI5Qf7j
 iNnubFXLJO7cU0owtc19R54egBMHtNHZbWYX2o8zcDJd9BrgZCaHPHvZZlPAJyWa5LND
 VMZ5Y7uhEK8rnBPCWJ0sx2nLGl26Sh+4jrmMsMzPQVYzMZBP/xV4GTy5gXeVAxpuXKUm
 pF+dx9o0hud73gAk5p1LnPa28u4rrZMGI08Gy/voG9gu2OyNatJH4TPn4TiW2jY7Kghi
 jb0RklycsRQ6hOkBjtQQeD20knzNMpqI4rH0dNReGHh7mZZmvCGhomK+kVbYxJQI5A7y
 9RZA==
X-Gm-Message-State: ACrzQf2jBnSbf1WwLAJkUUUsddt8FR3mzgKlNNGXKOK271Qu+oWvJEDO
 P7BwRPNIAKi/a2w+AcSqLXBdGA==
X-Google-Smtp-Source: AMsMyM6T+XN0rGx30/ldUezEqrvM5U5jbn2Vhtyo0g7lBweGaxAdcVuug7W4fTNXOElxdcdJNYFysw==
X-Received: by 2002:a05:6000:1203:b0:236:9aac:8d00 with SMTP id
 e3-20020a056000120300b002369aac8d00mr30239971wrx.221.1667820914649; 
 Mon, 07 Nov 2022 03:35:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a5d5259000000b0022cc3e67fc5sm7180550wrc.65.2022.11.07.03.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 03:35:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F4CA1FFB7;
 Mon,  7 Nov 2022 11:35:13 +0000 (GMT)
References: <20221012051846.1432050-1-iii@linux.ibm.com>
 <20221012051846.1432050-2-iii@linux.ibm.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, "Vanderson M . do
 Rosario" <vandersonmr2@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] tcg: add perfmap and jitdump
Date: Mon, 07 Nov 2022 11:04:16 +0000
In-reply-to: <20221012051846.1432050-2-iii@linux.ibm.com>
Message-ID: <87mt93gfpq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
> The first one allows the perf tool to map samples to each individual
> translation block. The second one adds the ability to resolve symbol
> names, line numbers and inspect JITed code.
>
> Example of use:
>
>     perf record qemu-x86_64 -perfmap ./a.out
>     perf report
>
> or
>
>     perf record -k 1 qemu-x86_64 -jitdump ./a.out
>     perf inject -j -i perf.data -o perf.data.jitted
>     perf report -i perf.data.jitted
>
> Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Co-developed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  accel/tcg/debuginfo.c     | 108 +++++++++++++
>  accel/tcg/debuginfo.h     |  54 +++++++
>  accel/tcg/meson.build     |   2 +
>  accel/tcg/perf.c          | 333 ++++++++++++++++++++++++++++++++++++++
>  accel/tcg/perf.h          |  28 ++++
>  accel/tcg/translate-all.c |   3 +
>  docs/devel/tcg.rst        |  20 +++
>  linux-user/elfload.c      |   3 +
>  linux-user/exit.c         |   2 +
>  linux-user/main.c         |  15 ++
>  linux-user/meson.build    |   1 +
>  meson.build               |   8 +
>  qemu-options.hx           |  20 +++
>  softmmu/vl.c              |  11 ++
>  tcg/tcg.c                 |   2 +
>  15 files changed, 610 insertions(+)
>  create mode 100644 accel/tcg/debuginfo.c
>  create mode 100644 accel/tcg/debuginfo.h
>  create mode 100644 accel/tcg/perf.c
>  create mode 100644 accel/tcg/perf.h
>
> diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
> new file mode 100644
> index 0000000000..904eb23103
> --- /dev/null
> +++ b/accel/tcg/debuginfo.c
> @@ -0,0 +1,108 @@
> +/*
> + * Debug information support.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include <elfutils/libdwfl.h>
> +
> +#include "debuginfo.h"
> +
> +static QemuMutex lock;
> +static Dwfl *dwfl;
> +static const Dwfl_Callbacks dwfl_callbacks =3D {
> +    .find_elf =3D NULL,
> +    .find_debuginfo =3D dwfl_standard_find_debuginfo,
> +    .section_address =3D NULL,
> +    .debuginfo_path =3D NULL,
> +};
> +
> +__attribute__((constructor))
> +static void debuginfo_init(void)
> +{
> +    qemu_mutex_init(&lock);
> +}
> +
> +bool debuginfo_report_elf(const char *image_name, int image_fd,
> +                          target_ulong load_bias)
> +{
> +    qemu_mutex_lock(&lock);

You can wrap this up with a QEMU_LOCK_GUARD(&lock) { and avoid having to
catch all your exit cases.

> +
> +    if (dwfl =3D=3D NULL) {
> +        dwfl =3D dwfl_begin(&dwfl_callbacks);
> +    } else {
> +        dwfl_report_begin_add(dwfl);
> +    }
> +
> +    if (dwfl =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +
> +    dwfl_report_elf(dwfl, image_name, image_name, image_fd, load_bias, t=
rue);
> +    dwfl_report_end(dwfl, NULL, NULL);
> +    qemu_mutex_unlock(&lock);
> +    return true;
> +}
> +
> +bool debuginfo_get_symbol(target_ulong address,
> +                          const char **symbol, target_ulong *offset)
> +{
> +    Dwfl_Module *dwfl_module;
> +    GElf_Off dwfl_offset;
> +    GElf_Sym dwfl_sym;
> +
> +    qemu_mutex_lock(&lock);
> +
> +    if (dwfl =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +
> +    dwfl_module =3D dwfl_addrmodule(dwfl, address);
> +    if (dwfl_module =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +
> +    *symbol =3D dwfl_module_addrinfo(dwfl_module, address, &dwfl_offset,
> +                                   &dwfl_sym, NULL, NULL, NULL);
> +    if (*symbol =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +    *offset =3D dwfl_offset;
> +    qemu_mutex_unlock(&lock);
> +    return true;
> +}
> +
> +bool debuginfo_get_line(target_ulong address,
> +                        const char **file, int *line)
> +{
> +    Dwfl_Module *dwfl_module;
> +    Dwfl_Line *dwfl_line;
> +
> +    qemu_mutex_lock(&lock);

ditto.

> +
> +    if (dwfl =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +
> +    dwfl_module =3D dwfl_addrmodule(dwfl, address);
> +    if (dwfl_module =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +
> +    dwfl_line =3D dwfl_module_getsrc(dwfl_module, address);
> +    if (dwfl_line =3D=3D NULL) {
> +        qemu_mutex_unlock(&lock);
> +        return false;
> +    }
> +    *file =3D dwfl_lineinfo(dwfl_line, NULL, line, 0, NULL, NULL);
> +    qemu_mutex_unlock(&lock);
> +    return true;
> +}
> diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
> new file mode 100644
> index 0000000000..f4f22aa786
> --- /dev/null
> +++ b/accel/tcg/debuginfo.h
> @@ -0,0 +1,54 @@
> +/*
> + * Debug information support.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ACCEL_TCG_DEBUGINFO_H
> +#define ACCEL_TCG_DEBUGINFO_H
> +
> +#include "exec/cpu-defs.h"
> +
> +#ifdef CONFIG_LIBDW
> +/*
> + * Load debuginfo for the specified guest ELF image.
> + * Return true on success, false on failure.
> + */
> +bool debuginfo_report_elf(const char *image_name, int image_fd,
> +                          target_ulong load_bias);
> +
> +/*
> + * Find a symbol name associated with the specified guest PC.
> + * Return true on success, false if there is no associated symbol.
> + */
> +bool debuginfo_get_symbol(target_ulong address,
> +                          const char **symbol, target_ulong *offset);
> +
> +/*
> + * Find a line number associated with the specified guest PC.
> + * Return true on success, false if there is no associated line number.
> + */
> +bool debuginfo_get_line(target_ulong address,
> +                        const char **file, int *line);
> +#else
> +static inline bool debuginfo_report_elf(const char *image_name, int imag=
e_fd,
> +                                        target_ulong load_bias)
> +{
> +    return false;
> +}
> +
> +static inline bool debuginfo_get_symbol(target_ulong address,
> +                                        const char **symbol,
> +                                        target_ulong *offset)
> +{
> +    return false;
> +}
> +
> +static inline bool debuginfo_get_line(target_ulong address,
> +                                      const char **file, int *line)
> +{
> +    return false;
> +}
> +#endif
> +
> +#endif
> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
> index 7a0a79d731..e206e3471b 100644
> --- a/accel/tcg/meson.build
> +++ b/accel/tcg/meson.build
> @@ -1,5 +1,6 @@
>  tcg_ss =3D ss.source_set()
>  tcg_ss.add(files(
> +  'perf.c',
>    'tcg-all.c',
>    'cpu-exec-common.c',
>    'cpu-exec.c',
> @@ -11,6 +12,7 @@ tcg_ss.add(files(
>  tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
>  tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
>  tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
> +tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
>  specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
>=20=20
>  specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
> diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
> new file mode 100644
> index 0000000000..80b5a1bf8b
> --- /dev/null
> +++ b/accel/tcg/perf.c
> @@ -0,0 +1,333 @@
> +/*
> + * Linux perf perf-<pid>.map and jit-<pid>.dump integration.
> + *
> + * The jitdump spec can be found at [1].
> + *
> + * [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/plain/tools/perf/Documentation/jitdump-specification.txt
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "elf.h"
> +#include "qemu/timer.h"
> +#include "tcg/tcg.h"
> +
> +#include "debuginfo.h"
> +#include "perf.h"
> +
> +static FILE *safe_fopen_w(const char *path)
> +{
> +    int saved_errno;
> +    FILE *f;
> +    int fd;
> +
> +    /* Delete the old file, if any. */
> +    unlink(path);
> +
> +    /* Avoid symlink attacks by using O_CREAT | O_EXCL. */
> +    fd =3D open(path, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR);
> +    if (fd =3D=3D -1) {
> +        return NULL;
> +    }
> +
> +    /* Convert fd to FILE*. */
> +    f =3D fdopen(fd, "w");
> +    if (f =3D=3D NULL) {
> +        saved_errno =3D errno;
> +        close(fd);
> +        errno =3D saved_errno;
> +        return NULL;
> +    }
> +
> +    return f;
> +}
> +
> +static FILE *perfmap;
> +
> +void perf_enable_perfmap(void)
> +{
> +    char map_file[32];
> +
> +    snprintf(map_file, sizeof(map_file), "/tmp/perf-%d.map", getpid());
> +    perfmap =3D safe_fopen_w(map_file);
> +    if (perfmap =3D=3D NULL) {
> +        warn_report("Could not open %s: %s, proceeding without perfmap",
> +                     map_file, strerror(errno));
> +    }
> +}
> +
> +static FILE *jitdump;
> +
> +#define JITHEADER_MAGIC 0x4A695444
> +#define JITHEADER_VERSION 1
> +
> +struct jitheader {
> +    uint32_t magic;
> +    uint32_t version;
> +    uint32_t total_size;
> +    uint32_t elf_mach;
> +    uint32_t pad1;
> +    uint32_t pid;
> +    uint64_t timestamp;
> +    uint64_t flags;
> +};
> +
> +enum jit_record_type {
> +    JIT_CODE_LOAD =3D 0,
> +    JIT_CODE_DEBUG_INFO =3D 2,
> +};
> +
> +struct jr_prefix {
> +    uint32_t id;
> +    uint32_t total_size;
> +    uint64_t timestamp;
> +};
> +
> +struct jr_code_load {
> +    struct jr_prefix p;
> +
> +    uint32_t pid;
> +    uint32_t tid;
> +    uint64_t vma;
> +    uint64_t code_addr;
> +    uint64_t code_size;
> +    uint64_t code_index;
> +};
> +
> +struct debug_entry {
> +    uint64_t addr;
> +    int lineno;
> +    int discrim;
> +    const char name[];
> +};
> +
> +struct jr_code_debug_info {
> +    struct jr_prefix p;
> +
> +    uint64_t code_addr;
> +    uint64_t nr_entry;
> +    struct debug_entry entries[];
> +};
> +
> +static uint32_t get_e_machine(void)
> +{
> +    Elf64_Ehdr elf_header;
> +    FILE *exe;
> +    size_t n;
> +
> +    QEMU_BUILD_BUG_ON(offsetof(Elf32_Ehdr, e_machine) !=3D
> +                      offsetof(Elf64_Ehdr, e_machine));
> +
> +    exe =3D fopen("/proc/self/exe", "r");
> +    if (exe =3D=3D NULL) {
> +        return EM_NONE;
> +    }
> +
> +    n =3D fread(&elf_header, sizeof(elf_header), 1, exe);
> +    fclose(exe);
> +    if (n !=3D 1) {
> +        return EM_NONE;
> +    }
> +
> +    return elf_header.e_machine;
> +}
> +
> +void perf_enable_jitdump(void)
> +{
> +    struct jitheader header;
> +    char jitdump_file[32];
> +#ifdef CONFIG_LINUX
> +    void *perf_marker;
> +#endif
> +
> +    if (!use_rt_clock) {
> +        warn_report("CLOCK_MONOTONIC is not available, proceeding withou=
t jitdump");
> +        return;
> +    }
> +
> +    snprintf(jitdump_file, sizeof(jitdump_file), "jit-%d.dump", getpid()=
);
> +    jitdump =3D safe_fopen_w(jitdump_file);
> +    if (jitdump =3D=3D NULL) {
> +        warn_report("Could not open %s: %s, proceeding without jitdump",
> +                     jitdump_file, strerror(errno));
> +        return;
> +    }
> +
> +#ifdef CONFIG_LINUX
> +    /*
> +     * `perf inject` will see that the mapped file name in the correspon=
ding
> +     * PERF_RECORD_MMAP or PERF_RECORD_MMAP2 event is of the form jit-%d=
.dump
> +     * and will process it as a jitdump file.
> +     */
> +    perf_marker =3D mmap(NULL, qemu_real_host_page_size(), PROT_READ | P=
ROT_EXEC,
> +                       MAP_PRIVATE, fileno(jitdump), 0);
> +    if (perf_marker =3D=3D MAP_FAILED) {
> +        warn_report("Could not map %s: %s, proceeding without jitdump",
> +                     jitdump_file, strerror(errno));
> +        fclose(jitdump);
> +        jitdump =3D NULL;
> +        return;
> +    }
> +#endif
> +
> +    header.magic =3D JITHEADER_MAGIC;
> +    header.version =3D JITHEADER_VERSION;
> +    header.total_size =3D sizeof(header);
> +    header.elf_mach =3D get_e_machine();
> +    header.pad1 =3D 0;
> +    header.pid =3D getpid();
> +    header.timestamp =3D get_clock();
> +    header.flags =3D 0;
> +    fwrite(&header, sizeof(header), 1, jitdump);
> +}
> +
> +void perf_report_prologue(void *start, size_t size)
> +{
> +    if (perfmap) {
> +        fprintf(perfmap, "%"PRIxPTR" %zx tcg-prologue-buffer\n",
> +                (uintptr_t)start, size);
> +    }
> +}
> +
> +/*
> + * Append a single line mapping to a JIT_CODE_DEBUG_INFO jitdump entry.
> + * Return 1 on success, 0 if there is no line number information for gue=
st_pc.
> + */
> +static int append_debug_entry(GArray *raw, void *host_pc,
> +                              target_ulong guest_pc)
> +{
> +    struct debug_entry ent;
> +    const char *file;
> +    int line;
> +
> +    if (!debuginfo_get_line(guest_pc, &file, &line)) {
> +        return 0;
> +    }
> +
> +    ent.addr =3D (uint64_t)host_pc;
> +    ent.lineno =3D line;
> +    ent.discrim =3D 0;
> +    g_array_append_vals(raw, &ent, sizeof(ent));
> +    g_array_append_vals(raw, file, strlen(file) + 1);
> +    return 1;
> +}
> +
> +/* Write a JIT_CODE_DEBUG_INFO jitdump entry. */
> +static void write_jr_code_debug_info(void *start, size_t size, int icoun=
t)
> +{
> +    GArray *raw =3D g_array_new(false, false, 1);
> +    struct jr_code_debug_info rec;
> +    struct debug_entry ent;
> +    target_ulong guest_pc;
> +    void *host_pc;
> +    int insn;
> +
> +    /* Reserve space for the header. */
> +    g_array_set_size(raw, sizeof(rec));
> +
> +    /* Create debug entries. */
> +    rec.nr_entry =3D 0;
> +    for (insn =3D 0; insn < icount; insn++) {
> +        host_pc =3D start;
> +        if (insn !=3D 0) {
> +            host_pc +=3D tcg_ctx->gen_insn_end_off[insn - 1];
> +        }
> +        guest_pc =3D tcg_ctx->gen_insn_data[insn][0];
> +        rec.nr_entry +=3D append_debug_entry(raw, host_pc, guest_pc);
> +    }
> +
> +    /* Trailing debug_entry. */
> +    ent.addr =3D (uint64_t)start + size;
> +    ent.lineno =3D 0;
> +    ent.discrim =3D 0;
> +    g_array_append_vals(raw, &ent, sizeof(ent));
> +    g_array_append_vals(raw, "", 1);
> +    rec.nr_entry++;
> +
> +    /* Create header. */
> +    rec.p.id =3D JIT_CODE_DEBUG_INFO;
> +    rec.p.total_size =3D raw->len;
> +    rec.p.timestamp =3D get_clock();
> +    rec.code_addr =3D (uint64_t)start;
> +    memcpy(raw->data, &rec, sizeof(rec));
> +
> +    /* Flush. */
> +    fwrite(raw->data, raw->len, 1, jitdump);
> +    g_array_unref(raw);
> +}
> +
> +/* Write a JIT_CODE_LOAD jitdump entry. */
> +static void write_jr_code_load(void *start, size_t size,
> +                               const char *symbol, const char *suffix)
> +{
> +    static uint64_t code_index;
> +    struct jr_code_load rec;
> +    size_t suffix_size;
> +    size_t name_size;
> +
> +    name_size =3D strlen(symbol);
> +    suffix_size =3D strlen(suffix) + 1;
> +    rec.p.id =3D JIT_CODE_LOAD;
> +    rec.p.total_size =3D sizeof(rec) + name_size + suffix_size + size;
> +    rec.p.timestamp =3D get_clock();
> +    rec.pid =3D getpid();
> +    rec.tid =3D gettid();
> +    rec.vma =3D (uint64_t)start;
> +    rec.code_addr =3D (uint64_t)start;
> +    rec.code_size =3D size;
> +    rec.code_index =3D code_index++;
> +    fwrite(&rec, sizeof(rec), 1, jitdump);
> +    fwrite(symbol, name_size, 1, jitdump);
> +    fwrite(suffix, suffix_size, 1, jitdump);
> +    fwrite(start, size, 1, jitdump);
> +}
> +
> +void perf_report_code(void *start, size_t size, int icount, uint64_t pc)
> +{
> +    char suffix[32] =3D "";
> +    char symbol_buf[32];
> +    const char *symbol;
> +    target_ulong offset;
> +
> +    /* Symbolize guest PC. */
> +    if (perfmap || jitdump) {
> +        if (!debuginfo_get_symbol(pc, &symbol, &offset)) {
> +            snprintf(symbol_buf, sizeof(symbol_buf), "subject-%"PRIx64, =
pc);
> +            symbol =3D symbol_buf;
> +            offset =3D 0;
> +        }
> +        if (offset !=3D 0) {
> +            snprintf(suffix, sizeof(suffix), "+0x%"PRIx64, (uint64_t)off=
set);
> +        }
> +    }
> +
> +    /* Emit a perfmap entry if needed. */
> +    if (perfmap) {
> +        flockfile(perfmap);
> +        fprintf(perfmap, "%"PRIxPTR" %zx %s%s\n",
> +                (uintptr_t)start, size, symbol, suffix);
> +        funlockfile(perfmap);
> +    }
> +
> +    /* Emit jitdump entries if needed. */
> +    if (jitdump) {
> +        flockfile(jitdump);
> +        write_jr_code_debug_info(start, size, icount);
> +        write_jr_code_load(start, size, symbol, suffix);
> +        funlockfile(jitdump);
> +    }
> +}
> +
> +void perf_exit(void)
> +{
> +    if (perfmap) {
> +        fclose(perfmap);
> +        perfmap =3D NULL;
> +    }
> +
> +    if (jitdump) {
> +        fclose(jitdump);
> +        jitdump =3D NULL;
> +    }
> +}
> diff --git a/accel/tcg/perf.h b/accel/tcg/perf.h
> new file mode 100644
> index 0000000000..df54be9ccd
> --- /dev/null
> +++ b/accel/tcg/perf.h
> @@ -0,0 +1,28 @@
> +/*
> + * Linux perf perf-<pid>.map and jit-<pid>.dump integration.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ACCEL_TCG_PERF_H
> +#define ACCEL_TCG_PERF_H
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +/* Start writing perf-<pid>.map. */
> +void perf_enable_perfmap(void);
> +
> +/* Start writing jit-<pid>.dump. */
> +void perf_enable_jitdump(void);
> +
> +/* Add information about TCG prologue to profiler maps. */
> +void perf_report_prologue(void *start, size_t size);
> +
> +/* Add information about JITted guest code to profiler maps. */
> +void perf_report_code(void *start, size_t size, int icount, uint64_t pc);
> +
> +/* Stop writing perf-<pid>.map and/or jit-<pid>.dump. */
> +void perf_exit(void);
> +
> +#endif
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4ed75a13e1..b9e8d8066f 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -62,6 +62,7 @@
>  #include "tb-hash.h"
>  #include "tb-context.h"
>  #include "internal.h"
> +#include "perf.h"
>=20=20
>  /* #define DEBUG_TB_INVALIDATE */
>  /* #define DEBUG_TB_FLUSH */
> @@ -1492,6 +1493,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>      tb->tc.size =3D gen_code_size;
>=20=20
> +    perf_report_code(gen_code_buf, gen_code_size, tb->icount, tb->pc);
> +

I think the recent code re-factoring means this needs updating. If its
the guest pc I think that is already in a local variable.

>  #ifdef CONFIG_PROFILER
>      qatomic_set(&prof->code_time, prof->code_time + profile_getclock() -=
 ti);
>      qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
> diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
> index a65fb7b1c4..63e42b0426 100644
> --- a/docs/devel/tcg.rst
> +++ b/docs/devel/tcg.rst
> @@ -188,3 +188,23 @@ memory areas instead calls out to C code for device =
emulation.
>  Finally, the MMU helps tracking dirty pages and pages pointed to by
>  translation blocks.
>=20=20
> +Profiling JITted code
> +---------------------
> +
> +The Linux ``perf`` tool will treat all JITted code as a single block as
> +unlike the main code it can't use debug information to link individual
> +program counter samples with larger functions. To overcome this
> +limitation you can use the ``-perfmap`` or the ``-jitdump`` option to ge=
nerate
> +map files. ``-perfmap`` is lightweight and produces only guest-host mapp=
ings.
> +``-jitdump`` additionally saves JITed code and guest debug information (=
if
> +available); its output needs to be integrated with the ``perf.data`` file
> +before the final report can be viewed.

I think this needs to be a bit clearer. Does jitdump only make sense if
the guest has debug information. Running:

  perf record -k 1 ./qemu-system-aarch64 -jitdump -monitor none \
    -display none -chardev stdio,id=3Doutput  \
    -M virt -cpu max -display none \
    -semihosting-config enable=3Don,target=3Dnative,chardev=3Doutput \
    -kernel tests/tcg/aarch64-softmmu/memory
  perf inject -j -i perf.data -o perf.data.jitted
  perf report -i perf.data.jitted

gives me pretty much the same report as the -perfmap. I think this is
because we only properly look at the guest elf data for linux-user?

> +
> +.. code::
> +
> +  perf record $QEMU -perfmap $REMAINING_ARGS
> +  perf report
> +
> +  perf record -k 1 $QEMU -jitdump $REMAINING_ARGS
> +  perf inject -j -i perf.data -o perf.data.jitted
> +  perf report -i perf.data.jitted
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 20894b633f..5928c14dfc 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -19,6 +19,7 @@
>  #include "qemu/selfmap.h"
>  #include "qapi/error.h"
>  #include "target_signal.h"
> +#include "accel/tcg/debuginfo.h"
>=20=20
>  #ifdef _ARCH_PPC64
>  #undef ARCH_DLINFO
> @@ -3261,6 +3262,8 @@ static void load_elf_image(const char *image_name, =
int image_fd,
>          load_symbols(ehdr, image_fd, load_bias);
>      }
>=20=20
> +    debuginfo_report_elf(image_name, image_fd, load_bias);
> +
>      mmap_unlock();
>=20=20
>      close(image_fd);
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index fa6ef0b9b4..607b6da9fc 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "accel/tcg/perf.h"
>  #include "exec/gdbstub.h"
>  #include "qemu.h"
>  #include "user-internals.h"
> @@ -38,4 +39,5 @@ void preexit_cleanup(CPUArchState *env, int code)
>  #endif
>          gdb_exit(code);
>          qemu_plugin_user_exit();
> +        perf_exit();
>  }
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a17fed045b..4290651c3c 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -53,6 +53,7 @@
>  #include "signal-common.h"
>  #include "loader.h"
>  #include "user-mmap.h"
> +#include "accel/tcg/perf.h"
>=20=20
>  #ifdef CONFIG_SEMIHOSTING
>  #include "semihosting/semihost.h"
> @@ -423,6 +424,16 @@ static void handle_arg_abi_call0(const char *arg)
>  }
>  #endif
>=20=20
> +static void handle_arg_perfmap(const char *arg)
> +{
> +    perf_enable_perfmap();
> +}
> +
> +static void handle_arg_jitdump(const char *arg)
> +{
> +    perf_enable_jitdump();
> +}
> +
>  static QemuPluginList plugins =3D QTAILQ_HEAD_INITIALIZER(plugins);
>=20=20
>  #ifdef CONFIG_PLUGIN
> @@ -493,6 +504,10 @@ static const struct qemu_argument arg_table[] =3D {
>      {"xtensa-abi-call0", "QEMU_XTENSA_ABI_CALL0", false, handle_arg_abi_=
call0,
>       "",           "assume CALL0 Xtensa ABI"},
>  #endif
> +    {"perfmap",    "QEMU_PERFMAP",     false, handle_arg_perfmap,
> +     "",           "Generate a /tmp/perf-${pid}.map file for perf"},
> +    {"jitdump",    "QEMU_JITDUMP",     false, handle_arg_jitdump,
> +     "",           "Generate a jit-${pid}.dump file for perf"},
>      {NULL, NULL, false, NULL, NULL, NULL}
>  };
>=20=20
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index de4320af05..7171dc60be 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -22,6 +22,7 @@ linux_user_ss.add(files(
>    'uname.c',
>  ))
>  linux_user_ss.add(rt)
> +linux_user_ss.add(libdw)
>=20=20
>  linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
>  linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
> diff --git a/meson.build b/meson.build
> index b686dfef75..be625efcc5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1631,6 +1631,12 @@ if libbpf.found() and not cc.links('''
>    endif
>  endif
>=20=20
> +# libdw
> +libdw =3D dependency('libdw',
> +                   method: 'pkg-config',
> +                   kwargs: static_kwargs,
> +                   required: false)
> +
>  #################
>  # config-host.h #
>  #################
> @@ -1897,6 +1903,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_di=
splay)
>  config_host_data.set('CONFIG_CFI', get_option('cfi'))
>  config_host_data.set('CONFIG_SELINUX', selinux.found())
>  config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
> +config_host_data.set('CONFIG_LIBDW', libdw.found())
>  if xen.found()
>    # protect from xen.version() having less than three components
>    xen_version =3D xen.version().split('.') + ['0', '0']
> @@ -3937,6 +3944,7 @@ summary_info +=3D {'libudev':           libudev}
>  # Dummy dependency, keep .found()
>  summary_info +=3D {'FUSE lseek':        fuse_lseek.found()}
>  summary_info +=3D {'selinux':           selinux}
> +summary_info +=3D {'libdw':             libdw}
>  summary(summary_info, bool_yn: true, section: 'Dependencies')
>=20=20
>  if not supported_cpus.contains(cpu)
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 95b998a13b..b0c64c4a31 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4799,6 +4799,26 @@ SRST
>      Enable synchronization profiling.
>  ERST
>=20=20
> +#ifdef CONFIG_TCG
> +DEF("perfmap", 0, QEMU_OPTION_perfmap,
> +    "-perfmap        generate a /tmp/perf-${pid}.map file for perf\n",
> +    QEMU_ARCH_ALL)
> +SRST
> +``-perfmap``
> +    Generate a map file for Linux perf tools that will allow basic profi=
ling
> +    information to be broken down into basic blocks.
> +ERST
> +
> +DEF("jitdump", 0, QEMU_OPTION_jitdump,
> +    "-jitdump        generate a jit-${pid}.dump file for perf\n",
> +    QEMU_ARCH_ALL)
> +SRST
> +``-jitdump``
> +    Generate a dump file for Linux perf tools that maps basic blocks to =
symbol
> +    names, line numbers and JITted code.
> +ERST
> +#endif
> +
>  DEFHEADING()
>=20=20
>  DEFHEADING(Generic object creation:)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b464da25bc..40e371a0c2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -96,6 +96,9 @@
>  #include "fsdev/qemu-fsdev.h"
>  #endif
>  #include "sysemu/qtest.h"
> +#ifdef CONFIG_TCG
> +#include "accel/tcg/perf.h"
> +#endif
>=20=20
>  #include "disas/disas.h"
>=20=20
> @@ -2900,6 +2903,14 @@ void qemu_init(int argc, char **argv)
>              case QEMU_OPTION_DFILTER:
>                  qemu_set_dfilter_ranges(optarg, &error_fatal);
>                  break;
> +#ifdef CONFIG_TCG
> +            case QEMU_OPTION_perfmap:
> +                perf_enable_perfmap();
> +                break;
> +            case QEMU_OPTION_jitdump:
> +                perf_enable_jitdump();
> +                break;
> +#endif
>              case QEMU_OPTION_seed:
>                  qemu_guest_random_seed_main(optarg, &error_fatal);
>                  break;
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 612a12f58f..cd1ccf2bff 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -61,6 +61,7 @@
>  #include "exec/log.h"
>  #include "tcg/tcg-ldst.h"
>  #include "tcg-internal.h"
> +#include "accel/tcg/perf.h"
>=20=20
>  #ifdef CONFIG_TCG_INTERPRETER
>  #include <ffi.h>
> @@ -749,6 +750,7 @@ void tcg_prologue_init(TCGContext *s)
>  #endif
>=20=20
>      prologue_size =3D tcg_current_code_size(s);
> +    perf_report_prologue(s->code_gen_ptr, prologue_size);
>=20=20
>  #ifndef CONFIG_TCG_INTERPRETER
>      flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),


--=20
Alex Benn=C3=A9e

