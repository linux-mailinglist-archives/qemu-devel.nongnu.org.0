Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925C3AFF99
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:49:21 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvc5v-00088n-MJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvc4c-000728-Ck
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:47:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvc4Y-0005rn-Fk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:47:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so1734164wma.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RymQF2WTXlijVTM5JaqAG2T/Ff+bYS4O1MoYm8GOKSA=;
 b=Xe5yjCLHcNf7rgNPzcW75dt2uU0c3VJXbG5xaTrNYjFdS1teAmMQmCv9pgH7OuW/wm
 2Ybffe9msjskys0FXjLoNvt1fkZuUA4LehyXB2ZTZX8iGdBYovAum4wrNGP6fWo8u1rU
 /oIE1kSH7QcqTwqvodD6eSL14BMZZ/BzS7dJFbgUwtmFi3u7C8kGCX7rHIJd9fXyQ8kG
 OFUG4ec7bSzw6DNkrtgzIePyQUmoLIPGt7s3IScxUyRMrvVgmLR419qeWPFUpJl+hTX5
 yC/I3S8QSfe8kakQB3cvk2DJBDOkMd4BQSuZFfOpWoc421z+qCsAQu93c3aZT/Tyj6An
 25kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RymQF2WTXlijVTM5JaqAG2T/Ff+bYS4O1MoYm8GOKSA=;
 b=jCtPBMy0/W5DTO8rv9bo5loXM95012ejR7UNQ5XBZqqWQUrsI4MH5WPRJuM2iiN6K+
 qq6WUbABWhe60wBytxlB09ipK4++5dmcR58D8X56X8paWclrDbkqygN9fmvAYComGIRN
 z6x5U5pnK7ie0kJj7VKoKPc5Ev423AGkhmmOzN4cVavtWEM0jPa0DKrUhtZ7TwxjREVF
 dL+6Hrwn6kO0yCwvEsnUtxZcDkZOkSL90rfnNkhuw5H6LPYNZo1+s2UdGkWqUARGKfeq
 AaDu1Z3y9+o8XZe5se/aJC1p1IZpYz73KpyzeMclsn/ESsaLSC+ftnlqj2uwj//rewbV
 PYlQ==
X-Gm-Message-State: AOAM533K10ttNTroeX6V5rBcSrgtB4kWCDtYU4+k4U34Oi2gv4PKSg2W
 dNxAgDWZmjqM2B8lorw7x49Hig==
X-Google-Smtp-Source: ABdhPJztn6qjwHWVGW4T20tFc/qECXDaEaJV2Snu6VO45itN1LXBB2xbjYXpZPk+v/aAb66yewlEUQ==
X-Received: by 2002:a05:600c:4f09:: with SMTP id
 l9mr3342304wmq.114.1624351672073; 
 Tue, 22 Jun 2021 01:47:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c74sm1647336wme.11.2021.06.22.01.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:47:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5012A1FF7E;
 Tue, 22 Jun 2021 09:47:50 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-2-erdnaxe@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v2 1/2] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Tue, 22 Jun 2021 09:37:50 +0100
In-reply-to: <20210618091101.2802534-2-erdnaxe@crans.org>
Message-ID: <871r8uthe1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre Iooss <erdnaxe@crans.org> writes:

> Log instruction execution and memory access to a file.
> This plugin can be used for reverse engineering or for side-channel analy=
sis
> using QEMU.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  MAINTAINERS               |   1 +
>  contrib/plugins/Makefile  |   1 +
>  contrib/plugins/execlog.c | 123 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 contrib/plugins/execlog.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd29042..65942d5802 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2974,6 +2974,7 @@ F: include/tcg/
>=20=20
>  TCG Plugins
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +R: Alexandre Iooss <erdnaxe@crans.org>
>  S: Maintained
>  F: docs/devel/tcg-plugins.rst
>  F: plugins/
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index b9d7935e5e..51093acd17 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
>  VPATH +=3D $(SRC_PATH)/contrib/plugins
>=20=20
>  NAMES :=3D
> +NAMES +=3D execlog
>  NAMES +=3D hotblocks
>  NAMES +=3D hotpages
>  NAMES +=3D howvec
> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
> new file mode 100644
> index 0000000000..995c4477f9
> --- /dev/null
> +++ b/contrib/plugins/execlog.c
> @@ -0,0 +1,123 @@
> +/*
> + * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
> + *
> + * Log instruction execution with memory access.
> + *
> + * License: GNU GPL, version 2 or later.
> + *   See the COPYING file in the top-level directory.
> + */
> +#include <glib.h>
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +
> +/* Store last executed instruction on each vCPU */
> +GString **last_exec;
> +
> +/**
> + * Add memory read or write information to current instruction log
> + */
> +static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
> +                     uint64_t vaddr, void *udata)
> +{
> +    if (qemu_plugin_mem_is_store(info)) {
> +        g_string_append(last_exec[cpu_index], ", store");
> +    } else {
> +        g_string_append(last_exec[cpu_index], ", load");
> +    }
> +
> +    /* If full system emulation log physical address and device name
>  */

The comment and logic implies that we might be running in user-mode but...

> +    struct qemu_plugin_hwaddr *hwaddr =3D qemu_plugin_get_hwaddr(info, v=
addr);
> +    if (hwaddr) {
> +        uint64_t addr =3D qemu_plugin_hwaddr_phys_addr(hwaddr);
> +        const char *name =3D qemu_plugin_hwaddr_device_name(hwaddr);
> +        g_string_append_printf(last_exec[cpu_index], ", 0x%08"PRIx64", %=
s",
> +                               addr, name);
> +    } else {
> +        g_string_append_printf(last_exec[cpu_index], ", 0x%08"PRIx64, va=
ddr);
> +    }
> +}
> +
> +/**
> + * Log instruction execution
> + */
> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
> +{
> +    /* Print previous instruction in cache */
> +    if (last_exec[cpu_index]->str) {
> +        qemu_plugin_outs(last_exec[cpu_index]->str);
> +        qemu_plugin_outs("\n");
> +    }
> +
> +    /* Store new instruction in cache */
> +    /* vcpu_mem will add memory access information to last_exec */
> +    g_string_printf(last_exec[cpu_index], "%u, ", cpu_index);
> +    g_string_append(last_exec[cpu_index], (char *)udata);
> +}
> +
> +/**
> + * On translation block new translation
> + *
> + * QEMU convert code by translation block (TB). By hooking here we can t=
hen hook
> + * a callback on each instruction and memory access.
> + */
> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> +{
> +    struct qemu_plugin_insn *insn;
> +    uint64_t insn_vaddr;
> +    uint32_t insn_opcode;
> +    char *insn_disas;
> +
> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
> +    for (size_t i =3D 0; i < n; i++) {
> +        /*
> +         * `insn` is shared between translations in QEMU, copy needed da=
ta here.
> +         * `output` is never freed as it might be used multiple times du=
ring
> +         * the emulation lifetime.
> +         * We only consider the first 32 bits of the instruction, this m=
ay be
> +         * a limitation for CISC architectures.
> +         */
> +        insn =3D qemu_plugin_tb_get_insn(tb, i);
> +        insn_vaddr =3D qemu_plugin_insn_vaddr(insn);
> +        insn_opcode =3D *((uint32_t *)qemu_plugin_insn_data(insn));
> +        insn_disas =3D qemu_plugin_insn_disas(insn);
> +        char *output =3D g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s=
\"",
> +                                       insn_vaddr, insn_opcode, insn_dis=
as);
> +
> +        /* Register callback on memory read or write */
> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
> +                                         QEMU_PLUGIN_CB_NO_REGS,
> +                                         QEMU_PLUGIN_MEM_RW, NULL);
> +
> +        /* Register callback on instruction */
> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
> +                                               QEMU_PLUGIN_CB_NO_REGS, o=
utput);
> +    }
> +}
> +
> +/**
> + * Install the plugin
> + */
> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> +                                           const qemu_info_t *info, int =
argc,
> +                                           char **argv)
> +{
> +    int i;
> +
> +    /* Initialize instruction cache for each vCPU */
> +    last_exec =3D calloc(info->system.max_vcpus, sizeof(GString *));
> +    for (i =3D 0; i < info->system.max_vcpus; i++) {
> +        last_exec[i] =3D g_string_new(NULL);
> +    }

We only allocate last_exec for system.max_vcpus here. You need to check
the system_emulation bool before using that information and error out if
it's not system emulation.

> +
> +    /* Register translation block callback */
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +
> +    return 0;
> +}

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

