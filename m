Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903526605FC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 18:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqsy-0003pg-2c; Fri, 06 Jan 2023 12:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDqsq-0003pC-Ih
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:52:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDqsm-0002JK-TI
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:52:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1601620wmp.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 09:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HnyoifuyELUwYaNAdqBYiUrkCS0s7vpW2hOHw7nNO0=;
 b=sFM5yOAFeYEPyF+6AU39e4x5qHpY5sBRp6gjLOPY7Un5gTEZKJuhEVqbcvy65EJNbk
 egC7DnpQyJxQQpASOisvvEYFkTqjI9sJEb610+7TmCtEKIF7fZ0Q9JsISH8ooBv3Y2Ga
 EqxAVQD0mp1TVIhgYBrmDRQKZTf8PzZtRt1GK+Cg6iU3YsK5tCzyGOkCDhP/eWfSHlrK
 qJP2jS1RR4EJkB86pTuE5HNsMAkiESy+XEMesQOvGnUgu34lVtF/vRw9FL3TXRDef0Ma
 dKNLf2CWuzs+8YsFztY1KnJlwNwW2H2kno8wOEzSsxJscusAjUoNjJ5MoxJOOfDZG5dY
 pY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9HnyoifuyELUwYaNAdqBYiUrkCS0s7vpW2hOHw7nNO0=;
 b=oYbmNu7tNPbh2hYGh7VkuIAbzzhehpz5qWoVxXOk13x0dp1vlxH1a/ckDhDWdf8/EC
 ccryMAaYiXrV/g6iQMJns7pyWknzAkzPL5u++dsC/rDUhNef1WtbP4wTUMfxhFNJSDtg
 Xa+M7mhPCLn9dULoaW+LQrKgRTSKnKnZjjuamrFbIetyK55aeWmNTepfvZeFyfBEnBam
 56UFqmEwWhzlb3SVU3Szy1S+LhV9aQczHeBKCyQYNLEXb5JsIZxU/p8aK8OJi0U6r8XQ
 MIYKjgpNRd/NDtnx6VX7YWY7rVzTZuFF7+Ts/7sKzrWhi1ay4OVG+KWfSLYv16fM6Rk+
 cBUA==
X-Gm-Message-State: AFqh2kpMJr1ZhKZWBRBFxnSYodr5zm7q2ofPCPXsqDfbFESf1J7fem4T
 EPbEu4fdXfDmlhgTbXg6fZKkfQ==
X-Google-Smtp-Source: AMrXdXsOD5ct7LRVS9pb21xSAhg2ciETOMh2PuuTgxNyAUWqIpSrTNL79QyZ61/OegUQ2xUEW0q56Q==
X-Received: by 2002:a7b:c3c1:0:b0:3c7:1359:783b with SMTP id
 t1-20020a7bc3c1000000b003c71359783bmr39896919wmj.1.1673027513747; 
 Fri, 06 Jan 2023 09:51:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm2952527wmq.42.2023.01.06.09.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:51:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E31131FFB7;
 Fri,  6 Jan 2023 17:51:52 +0000 (GMT)
References: <20221114161321.3364875-1-iii@linux.ibm.com>
 <20221114161321.3364875-2-iii@linux.ibm.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, "Vanderson M . do
 Rosario" <vandersonmr2@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] tcg: add perfmap and jitdump
Date: Fri, 06 Jan 2023 17:31:08 +0000
In-reply-to: <20221114161321.3364875-2-iii@linux.ibm.com>
Message-ID: <87r0w7o8jr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
> Message-Id: <20221012051846.1432050-2-iii@linux.ibm.com>
> ---
>  accel/tcg/debuginfo.c     |  99 +++++++++++
>  accel/tcg/debuginfo.h     |  52 ++++++
>  accel/tcg/meson.build     |   2 +
>  accel/tcg/perf.c          | 334 ++++++++++++++++++++++++++++++++++++++
>  accel/tcg/perf.h          |  28 ++++
>  accel/tcg/translate-all.c |   8 +
>  docs/devel/tcg.rst        |  23 +++
>  hw/core/loader.c          |   5 +
>  include/tcg/tcg.h         |   4 +-
>  linux-user/elfload.c      |   3 +
>  linux-user/exit.c         |   2 +
>  linux-user/main.c         |  15 ++
>  linux-user/meson.build    |   1 +
>  meson.build               |   8 +
>  qemu-options.hx           |  20 +++
>  softmmu/vl.c              |  11 ++
>  tcg/region.c              |   2 +-
>  tcg/tcg.c                 |   2 +
>  18 files changed, 616 insertions(+), 3 deletions(-)
>  create mode 100644 accel/tcg/debuginfo.c
>  create mode 100644 accel/tcg/debuginfo.h
>  create mode 100644 accel/tcg/perf.c
>  create mode 100644 accel/tcg/perf.h
>
> diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
> new file mode 100644
> index 00000000000..c312db77146
> --- /dev/null
> +++ b/accel/tcg/debuginfo.c
> @@ -0,0 +1,99 @@
> +/*
> + * Debug information support.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/lockable.h"
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
> +                          unsigned long long load_bias)
> +{
> +    QEMU_LOCK_GUARD(&lock);
> +
> +    if (dwfl =3D=3D NULL) {
> +        dwfl =3D dwfl_begin(&dwfl_callbacks);
> +    } else {
> +        dwfl_report_begin_add(dwfl);
> +    }
> +
> +    if (dwfl =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    dwfl_report_elf(dwfl, image_name, image_name, image_fd, load_bias, t=
rue);
> +    dwfl_report_end(dwfl, NULL, NULL);
> +    return true;
> +}
> +
> +bool debuginfo_get_symbol(unsigned long long address,
> +                          const char **symbol, unsigned long long *offse=
t)
> +{
> +    Dwfl_Module *dwfl_module;
> +    GElf_Off dwfl_offset;
> +    GElf_Sym dwfl_sym;
> +
> +    QEMU_LOCK_GUARD(&lock);
> +
> +    if (dwfl =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    dwfl_module =3D dwfl_addrmodule(dwfl, address);
> +    if (dwfl_module =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    *symbol =3D dwfl_module_addrinfo(dwfl_module, address, &dwfl_offset,
> +                                   &dwfl_sym, NULL, NULL, NULL);
> +    if (*symbol =3D=3D NULL) {
> +        return false;
> +    }
> +    *offset =3D dwfl_offset;
> +    return true;
> +}
> +
> +bool debuginfo_get_line(unsigned long long address,
> +                        const char **file, int *line)
> +{
> +    Dwfl_Module *dwfl_module;
> +    Dwfl_Line *dwfl_line;
> +
> +    QEMU_LOCK_GUARD(&lock);
> +
> +    if (dwfl =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    dwfl_module =3D dwfl_addrmodule(dwfl, address);
> +    if (dwfl_module =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    dwfl_line =3D dwfl_module_getsrc(dwfl_module, address);
> +    if (dwfl_line =3D=3D NULL) {
> +        return false;
> +    }
> +    *file =3D dwfl_lineinfo(dwfl_line, NULL, line, 0, NULL, NULL);
> +    return true;
> +}
> diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
> new file mode 100644
> index 00000000000..d41d9d8d9b4
> --- /dev/null
> +++ b/accel/tcg/debuginfo.h
> @@ -0,0 +1,52 @@
> +/*
> + * Debug information support.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ACCEL_TCG_DEBUGINFO_H
> +#define ACCEL_TCG_DEBUGINFO_H
> +
> +#if defined(CONFIG_TCG) && defined(CONFIG_LIBDW)
> +/*
> + * Load debuginfo for the specified guest ELF image.
> + * Return true on success, false on failure.
> + */
> +bool debuginfo_report_elf(const char *image_name, int image_fd,
> +                          unsigned long long load_bias);
> +
> +/*
> + * Find a symbol name associated with the specified guest PC.
> + * Return true on success, false if there is no associated symbol.
> + */
> +bool debuginfo_get_symbol(unsigned long long address,
> +                          const char **symbol, unsigned long long *offse=
t);
> +
> +/*
> + * Find a line number associated with the specified guest PC.
> + * Return true on success, false if there is no associated line number.
> + */
> +bool debuginfo_get_line(unsigned long long address,
> +                        const char **file, int *line);
> +#else
> +static inline bool debuginfo_report_elf(const char *image_name, int imag=
e_fd,
> +                                        unsigned long long load_bias)
> +{
> +    return false;
> +}
> +
> +static inline bool debuginfo_get_symbol(unsigned long long address,
> +                                        const char **symbol,
> +                                        unsigned long long *offset)
> +{
> +    return false;
> +}
> +
> +static inline bool debuginfo_get_line(unsigned long long address,
> +                                      const char **file, int *line)
> +{
> +    return false;
> +}
> +#endif
> +
> +#endif
> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
> index 75e1dffb4df..f916110f651 100644
> --- a/accel/tcg/meson.build
> +++ b/accel/tcg/meson.build
> @@ -1,5 +1,6 @@
>  tcg_ss =3D ss.source_set()
>  tcg_ss.add(files(
> +  'perf.c',

I think this needs to be:

tcg_ss.add(when: 'CONFIG_LINUX', if_true: files('perf.c'))

as otherwise we break non-Linux builds. This might needs some ifdef
CONFIG_LINUX checks on the call (or a static inline stub).

See https://gitlab.com/stsquad/qemu/-/jobs/3566180347

>    'tcg-all.c',
>    'cpu-exec-common.c',
>    'cpu-exec.c',
> @@ -12,6 +13,7 @@ tcg_ss.add(files(
>  tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
>  tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
>  tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
> +tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
>  specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
>=20=20
>  specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
> diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
> new file mode 100644
> index 00000000000..c7283406162
> --- /dev/null
> +++ b/accel/tcg/perf.c
> @@ -0,0 +1,334 @@
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
> +void perf_report_prologue(const void *start, size_t size)
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
> +static int append_debug_entry(GArray *raw, const void *host_pc,
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
> +static void write_jr_code_debug_info(const void *start, size_t size,
> +                                     int icount)
> +{
> +    GArray *raw =3D g_array_new(false, false, 1);
> +    struct jr_code_debug_info rec;
> +    struct debug_entry ent;
> +    target_ulong guest_pc;
> +    const void *host_pc;
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
> +static void write_jr_code_load(const void *start, size_t size,
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

This causes a failure on some of the CI builds:

  ../accel/tcg/perf.c: In function =E2=80=98write_jr_code_load=E2=80=99:
  ../accel/tcg/perf.c:276:15: error: implicit declaration of function =E2=
=80=98gettid=E2=80=99; did you mean =E2=80=98getgid=E2=80=99? [-Werror=3Dim=
plicit-function-declaration]
       rec.tid =3D gettid();
                 ^~~~~~
                 getgid
  ../accel/tcg/perf.c:276:15: error: nested extern declaration of =E2=80=98=
gettid=E2=80=99 [-Werror=3Dnested-externs]

We also have to deal with this in log_thread_id() - see CONFIG_GETTID.

CI Failures:

  https://gitlab.com/stsquad/qemu/-/pipelines/740305827/failures

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
> +void perf_report_code(const void *start, size_t size, int icount, uint64=
_t pc)
> +{
> +    char suffix[32] =3D "";
> +    char symbol_buf[32];
> +    const char *symbol;
> +    unsigned long long offset;
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
> index 00000000000..68c80ac2fd9
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

I don't think these are needed here. osdep should have bought them in so
you can drop them here.

> +
> +/* Start writing perf-<pid>.map. */
> +void perf_enable_perfmap(void);
> +
> +/* Start writing jit-<pid>.dump. */
> +void perf_enable_jitdump(void);
> +
> +/* Add information about TCG prologue to profiler maps. */
> +void perf_report_prologue(const void *start, size_t size);
> +
> +/* Add information about JITted guest code to profiler maps. */
> +void perf_report_code(const void *start, size_t size, int icount, uint64=
_t pc);
> +
> +/* Stop writing perf-<pid>.map and/or jit-<pid>.dump. */
> +void perf_exit(void);
> +
> +#endif
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ac3ee3740cb..2e1a6dc004e 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -62,6 +62,7 @@
>  #include "tb-hash.h"
>  #include "tb-context.h"
>  #include "internal.h"
> +#include "perf.h"
>=20=20
>  /* make various TB consistency checks */
>=20=20
> @@ -884,6 +885,13 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>      tb->tc.size =3D gen_code_size;
>=20=20
> +    /*
> +     * For TARGET_TB_PCREL, attribute all executions of the generated
> +     * code to its first mapping.
> +     */
> +    perf_report_code(tcg_splitwx_to_rx(gen_code_buf), gen_code_size,
> +                     tb->icount, pc);
> +
>  #ifdef CONFIG_PROFILER
>      qatomic_set(&prof->code_time, prof->code_time + profile_getclock() -=
 ti);
>      qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
> diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
> index a65fb7b1c44..fa479414ddc 100644
> --- a/docs/devel/tcg.rst
> +++ b/docs/devel/tcg.rst
> @@ -188,3 +188,26 @@ memory areas instead calls out to C code for device =
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
> +
> +.. code::
> +
> +  perf record $QEMU -perfmap $REMAINING_ARGS
> +  perf report
> +
> +  perf record -k 1 $QEMU -jitdump $REMAINING_ARGS
> +  perf inject -j -i perf.data -o perf.data.jitted
> +  perf report -i perf.data.jitted
> +
> +Note that qemu-system generates mappings only for ``-kernel`` files in E=
LF
> +format.
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 0548830733e..55dbe2e1993 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -61,6 +61,7 @@
>  #include "hw/boards.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/runstate.h"
> +#include "accel/tcg/debuginfo.h"
>=20=20
>  #include <zlib.h>
>=20=20
> @@ -503,6 +504,10 @@ ssize_t load_elf_ram_sym(const char *filename,
>                           clear_lsb, data_swab, as, load_rom, sym_cb);
>      }
>=20=20
> +    if (ret !=3D ELF_LOAD_FAILED) {
> +        debuginfo_report_elf(filename, fd, 0);
> +    }
> +
>   fail:
>      close(fd);
>      return ret;
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index d84bae6e3f5..cd237cdaeff 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -639,10 +639,10 @@ extern TCGv_env cpu_env;
>  bool in_code_gen_buffer(const void *p);
>=20=20
>  #ifdef CONFIG_DEBUG_TCG
> -const void *tcg_splitwx_to_rx(void *rw);
> +const void *tcg_splitwx_to_rx(const void *rw);
>  void *tcg_splitwx_to_rw(const void *rx);
>  #else
> -static inline const void *tcg_splitwx_to_rx(void *rw)
> +static inline const void *tcg_splitwx_to_rx(const void *rw)
>  {
>      return rw ? rw + tcg_splitwx_diff : NULL;
>  }
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 20894b633f5..5928c14dfc9 100644
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
> index fa6ef0b9b44..607b6da9fc4 100644
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
> index a17fed045bf..4290651c3cf 100644
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
> index de4320af053..7171dc60be2 100644
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
> index cf3e517e56d..2a736dcf7e6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1642,6 +1642,12 @@ if libbpf.found() and not cc.links('''
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
> @@ -1911,6 +1917,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_di=
splay)
>  config_host_data.set('CONFIG_CFI', get_option('cfi'))
>  config_host_data.set('CONFIG_SELINUX', selinux.found())
>  config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
> +config_host_data.set('CONFIG_LIBDW', libdw.found())
>  if xen.found()
>    # protect from xen.version() having less than three components
>    xen_version =3D xen.version().split('.') + ['0', '0']
> @@ -3970,6 +3977,7 @@ summary_info +=3D {'libudev':           libudev}
>  # Dummy dependency, keep .found()
>  summary_info +=3D {'FUSE lseek':        fuse_lseek.found()}
>  summary_info +=3D {'selinux':           selinux}
> +summary_info +=3D {'libdw':             libdw}
>  summary(summary_info, bool_yn: true, section: 'Dependencies')
>=20=20
>  if not supported_cpus.contains(cpu)
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b231..99dd7f0e584 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4844,6 +4844,26 @@ SRST
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
> index 5115221efe4..6ae3d874679 100644
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
> @@ -2926,6 +2929,14 @@ void qemu_init(int argc, char **argv)
>              case QEMU_OPTION_DFILTER:
>                  qemu_set_dfilter_ranges(optarg, &error_fatal);
>                  break;
> +#ifdef CONFIG_TCG

Probably CONFIG_TCG and CONFIG_LINUX

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
> diff --git a/tcg/region.c b/tcg/region.c
> index 88d6bb273f1..af334c5c61d 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -83,7 +83,7 @@ bool in_code_gen_buffer(const void *p)
>  }
>=20=20
>  #ifdef CONFIG_DEBUG_TCG
> -const void *tcg_splitwx_to_rx(void *rw)
> +const void *tcg_splitwx_to_rx(const void *rw)
>  {

This constification should be a separate patch as its not related.

>      /* Pass NULL pointers unchanged. */
>      if (rw) {
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 436fcf6ebd2..e2151a93001 100644
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
Virtualisation Tech Lead @ Linaro

