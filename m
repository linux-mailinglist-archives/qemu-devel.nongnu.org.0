Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DC3A6CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:06:49 +0200 (CEST)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsq2y-0007ey-PH
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lsq0z-0006aI-Vw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:04:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lsq0y-0003FP-0R
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:04:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a20so15357475wrc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XyUV3CH93sVmCz7IB0DN2Siu9ndCL+ilB3KBxMcWmjE=;
 b=qqkGnYO89F29trcbug77AECNXTeQ0y30NkNOKpm4HVZFKCULBrDv+cnapPSPuIix6W
 QlobXdvU8Q5cIDaN/A6FPi+JH97rZvm2JDNXC+IkFMt5L9zl4xoLTdEo90RTYJ9v+i8q
 HKotD2Y+8eIE3E/jGXQgrSOJYYeSnmX/4ZxpfI7L9yIaxxP2HUhTtoQrGP4Lu7oqJ7Ik
 PCXCiLrPCmp0ODAdwGioT4KqE6S35NOjt5UE26LTxoKFvCW2aiR2q4MVg71vs/BpyjgH
 xXi0vnXrl05f28dFl04Q86haALIODO5Xr8/JkYK9xShMIW06F4yAHDjC/Y8yMvXgUBa2
 Z7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XyUV3CH93sVmCz7IB0DN2Siu9ndCL+ilB3KBxMcWmjE=;
 b=fjxFj1goyf3CKBTROcL1DucG3bCO9u+5Nbu4JqRvVxicIBek2ypbCpqQlsFTkR3Cnc
 D/XNRAVlww96G3UXmp0sFoFgHTwTyJSHvzaOCrsnOp3LoQLYXsTOLH1X2B7TUh/1buUL
 ZyqaaX195IQ+iy/BHCLMqMBOGr3HXIHxtjWg2YULTr3CsqvR4duAM7z9nRmX9oo34VTw
 ALQUSEi8SSPLZxGxCpaddQdNrO3xh5Vr8nNLIWQ4CUNIN6BTf9Kt1GLS0tEl1H/MPS92
 Qkaek4w4W4lzcZpaD86ShLUisqqod8KWRlMUQpY/iTKinicP8DbzEjlVocLW23Kl9A3o
 zu2A==
X-Gm-Message-State: AOAM531aq2A8RPbJm7fpjJ97izkuT7F65Mo4riyThRJEvMq0IisJFumi
 9ySTCPL/vaQBGVJBLuS5P50=
X-Google-Smtp-Source: ABdhPJxvEKozg3C4kXMHF7D2Gf3u21bc3ycEbfWBNtUbbstpxcGm74FhJvkdYbzr0ETJXJ4k1lam0g==
X-Received: by 2002:a05:6000:2c4:: with SMTP id
 o4mr19805011wry.267.1623690280835; 
 Mon, 14 Jun 2021 10:04:40 -0700 (PDT)
Received: from [192.168.1.7] ([102.41.174.214])
 by smtp.gmail.com with ESMTPSA id w13sm13324986wmi.48.2021.06.14.10.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 10:04:40 -0700 (PDT)
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction execution
 and memory access
To: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210614090116.816833-1-erdnaxe@crans.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com>
Date: Mon, 14 Jun 2021 19:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614090116.816833-1-erdnaxe@crans.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 14/06/2021 11:01, Alexandre Iooss wrote:
> Log instruction execution and memory access to a file.
> This plugin can be used for reverse engineering or for side-channel analysis
> using QEMU.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>   MAINTAINERS               |   1 +
>   contrib/plugins/Makefile  |   1 +
>   contrib/plugins/execlog.c | 112 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 114 insertions(+)
>   create mode 100644 contrib/plugins/execlog.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd29042..65942d5802 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2974,6 +2974,7 @@ F: include/tcg/
>   
>   TCG Plugins
>   M: Alex BennÃ©e <alex.bennee@linaro.org>
> +R: Alexandre Iooss <erdnaxe@crans.org>
>   S: Maintained
>   F: docs/devel/tcg-plugins.rst
>   F: plugins/
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index b9d7935e5e..51093acd17 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
>   VPATH += $(SRC_PATH)/contrib/plugins
>   
>   NAMES :=
> +NAMES += execlog
>   NAMES += hotblocks
>   NAMES += hotpages
>   NAMES += howvec
> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
> new file mode 100644
> index 0000000000..80716e8eed
> --- /dev/null
> +++ b/contrib/plugins/execlog.c
> @@ -0,0 +1,112 @@
> +/*
> + * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
> + *
> + * Log instruction execution and memory access to a file.
> + * You may pass the output filename as argument.
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
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> +
> +/* Execution trace buffer */
> +FILE *output;

Is there a reason for using a regular FILE * instead of using 
`qemu_plugin_outs()`?

I don't see a benefit and since there's an API for logging I guess it's 
better to use it instead

> +
> +/**
> + * Log memory read or write
> + */
> +static void vcpu_mem(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
> +                     uint64_t vaddr, void *udata)
> +{
> +    struct qemu_plugin_hwaddr *hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
> +    if (!hwaddr) {
> +        return;
> +    }

So you just reject all memory accesses in user mode? I think that it 
equally useful

to log only the virtual address of a memory access in user-mode 
emulation? However, we better

wait for Alex's opinion on all this since he had remarks about 
introducing a new ad-hoc

tracing format...

> +
> +    /* Add data to execution log */
> +    const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
> +    uint64_t addr = qemu_plugin_hwaddr_phys_addr(hwaddr);
> +    if (qemu_plugin_mem_is_store(info)) {
> +        fprintf(output, "mem: %s store at 0x%08lx\n", name, addr);
> +    } else {
> +        fprintf(output, "mem: %s load at 0x%08lx\n", name, addr);
> +    }
> +}
> +
> +/**
> + * Log instruction execution
> + */
> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
> +{
> +    char *insn_disas = (char *)udata;
> +
> +    /* Add data to execution log */
> +    fprintf(output, "insn: %s\n", insn_disas);
> +}
> +
> +/**
> + * On translation block new translation
> + *
> + * QEMU convert code by translation block (TB). By hooking here we can then hook
> + * a callback on each instruction and memory access.
> + */
> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> +{
> +    size_t n = qemu_plugin_tb_n_insns(tb);
> +    for (size_t i = 0; i < n; i++) {
> +        /* insn is shared between translations in QEMU, copy needed data here */
> +        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
> +        char *insn_disas = qemu_plugin_insn_disas(insn);
> +
> +        /* Register callback on memory read or write */
> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
> +                                         QEMU_PLUGIN_CB_NO_REGS,
> +                                         QEMU_PLUGIN_MEM_RW, NULL);
> +
> +        /* Register callback on instruction */
> +        qemu_plugin_register_vcpu_insn_exec_cb(
> +            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_R_REGS, insn_disas);
> +    }
> +}
> +
> +/**
> + * On plugin exit, close output file
> + */
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +    fclose(output);
> +}
> +
> +/**
> + * Install the plugin
> + */
> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> +                                           const qemu_info_t *info, int argc,
> +                                           char **argv)
> +{
> +    /* Parse arguments to get output name and open for writing */
> +    char *filename = "execution.log";
> +    if (argc > 0) {
> +        filename = argv[0];
> +    }
> +    output = fopen(filename, "w");
> +    if (output == NULL) {
> +        qemu_plugin_outs("Cannot open output file for writing.\n");

Here, I think that it's more logical to output error messages to stderr 
since

logging can be redirected to a file so QEMU will error but the error message

would be written to the log file.

> +        return -1;
> +    }
> +
> +    /* Register translation block and exit callbacks */
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> +
> +    return 0;
> +}


Thanks,

Mahmoud


