Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD66A9A40
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:08:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6zp-0001Ff-7K; Fri, 03 Mar 2023 10:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY6zn-0001FV-Ip
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:06:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY6zl-0002Wk-R0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:06:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id g3so2593225wri.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCVdx42zdZpycCwwaJFuENDJn1zBemHvwL/O96jZd0U=;
 b=uj4Lku4UZnF7n1G7osCw2Hd8X+GPgfaXKZDJtXuBPlLcIdKMSiPXYS8Gn/tOAfzkYw
 qUFC/ktsmPKraCmoABQb01RToxI/X4vIcNobIpPIZ6VYFq+CxhYy8ipg8E/fnT4FyV37
 rbP0t6El17kgO7nwDlcqGjoPA1JdWVz7N1Ns2GbwYwQIdLqwfGKodiiuV8spOE3cfieu
 g2ZF3EeZLUmgR6rNeMespIdakXwjBEKNtg9nRGOjhnYaJ09+JnL+Oc+jem821Cfn2qPq
 Y09/k8EHTWhyEE4nub80kUAqwOI5O6m930iUUMV/sYcpAHxWxtsnPVJdDPBoaxLkVTOo
 Mgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WCVdx42zdZpycCwwaJFuENDJn1zBemHvwL/O96jZd0U=;
 b=a23YMt5qIFT8kxWZm5uJe6I/ahuTA1+LO59U5l1b3jddc0+LBb/b3IWc3b4HPQW2NC
 oYdsv10bYpJn2sGrrE6sPw82RQFau0EczvT8+EfSbPcIlBMYePjmW55QA2LYJMnioQr4
 I/LlSDlUy8VOeCj37HSUcbgwDuQ3gv4u7nlldrTCPKm4IqcxhzloHE7xinOwIHoFiEWN
 4YfRCJMVEvuonSWWhU83BSx+/a7V75mhD7nfQwHNHh5KjFr0cwEJ1lA2XkUFSn//Gmrh
 DUzi2SRP0SdsLnB+XnqF/de0Y8P9qKkxtlRTvo2Tql//VMexxkakBZdl8onLiskxSC1J
 aTng==
X-Gm-Message-State: AO0yUKWdOe1/9eAHAWPICKsR9VnFcsxUcFvRfQ2Gwu1JkX0C1fXRp5n1
 fW8U8pHmtdyBnoQINKCdLrFyXQ==
X-Google-Smtp-Source: AK7set9l5IDFWg1oNL4OrKD/AY0YLTLBQebB93rPpxcOcsZXFvmf2TVpUhRWYva+9h1bA3F1o2oFQg==
X-Received: by 2002:a5d:5042:0:b0:2cd:bc79:5444 with SMTP id
 h2-20020a5d5042000000b002cdbc795444mr1426345wrt.2.1677856012149; 
 Fri, 03 Mar 2023 07:06:52 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm2447723wrw.37.2023.03.03.07.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 07:06:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 741921FFB7;
 Fri,  3 Mar 2023 15:06:51 +0000 (GMT)
References: <5c50db42136d4a908b261c66b132b043@yadro.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2] TCG plugin API extension to read guest memory
 content by an address
Date: Fri, 03 Mar 2023 14:56:29 +0000
In-reply-to: <5c50db42136d4a908b261c66b132b043@yadro.com>
Message-ID: <87cz5p98ms.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Mikhail Tyutin <m.tyutin@yadro.com> writes:

> TCG plugin API extension to read guest memory content. qemu_plugin_vcpu_r=
ead_phys_mem()
>
> function can be used by TCG plugin inside of qemu_plugin_vcpu_mem_cb_t ca=
llback to adjust
>
> received address according to internal memory mappings and read content o=
f guest memory.
>
> Works for both user-level and system-level emulation modes.
>
>=20=20
>
> What's new in v2:
>
> * Increment QEMU_PLUGIN_VERSION instead of custom define
>
> * Example of qemu_plugin_vcpu_read_phys_mem() usage in memtrace.c
>
> * Use cpu_memory_rw_debug() to get memory content in both user-level and
>
>   system-level emulation modes
>
>=20=20
>
> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
>
> Signed-off-by: Aleksey Titov <a.titov@yadro.com>

Not sure what happened with the formatting of this patch, I think there
is an html part getting in the way.

>
> ---
>
> contrib/plugins/Makefile     |  1 +
>
> contrib/plugins/memtrace.c   | 76 ++++++++++++++++++++++++++++++++++++
>
> include/qemu/qemu-plugin.h   | 18 ++++++++-
>
> plugins/api.c                | 16 ++++++++
>
> plugins/qemu-plugins.symbols |  1 +
>
> 5 files changed, 111 insertions(+), 1 deletion(-)
>
> create mode 100644 contrib/plugins/memtrace.c
>
>=20=20
>
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>
> index 23e0396687..cf27554616 100644
>
> --- a/contrib/plugins/Makefile
>
> +++ b/contrib/plugins/Makefile
>
> @@ -21,6 +21,7 @@ NAMES +=3D lockstep
>
> NAMES +=3D hwprofile
>
> NAMES +=3D cache
>
> NAMES +=3D drcov
>
> +NAMES +=3D memtrace
>
>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>
> diff --git a/contrib/plugins/memtrace.c b/contrib/plugins/memtrace.c
>
> new file mode 100644
>
> index 0000000000..16c1553f47
>
> --- /dev/null
>
> +++ b/contrib/plugins/memtrace.c
>
> @@ -0,0 +1,76 @@
>
> +/*
>
> + * Copyright (C) 2023, Mikhail Tyutin <m.tyutin@yadro.com>
>
> + *
>
> + * Log all memory accesses including content of the access.
>
> + *=20
>
> + * License: GNU GPL, version 2 or later.
>
> + *   See the COPYING file in the top-level directory.
>
> + */
>
> +
>
> +#include <glib.h>
>
> +
>
> +#include <qemu-plugin.h>
>
> +
>
> +
>
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>
> +
>
> +
>
> +static void vcpu_mem_access(uint32_t vcpuIndex, qemu_plugin_meminfo_t me=
mInfo,
>
> +                            uint64_t vaddr, void *userdata)
>
> +{
>
> +    unsigned size =3D 1 << qemu_plugin_mem_size_shift(memInfo);
>
> +    char* memContent =3D g_malloc(size);
>
> +    unsigned i;
>
> +    GString* logLine =3D g_string_new(NULL);
>
> +
>
> +    qemu_plugin_vcpu_read_phys_mem(vcpuIndex, vaddr, memContent,
> size);

So the problem with this approach is the memory value you read here may not=
 be
the same as the value that was read by the instruction. This could
because of a few reasons:

  - an mmio write changes underlying memory layout
  - another thread changes memory after the access

I think a better way to get this information would be to register a new
type of call-back which can duplicate the value in the store/load and
pass it directly to the callback. It might even be worth just fixing up
the existing callback and breaking compatibility rather than having two
callback types?

We didn't do this originally as we were being cautious about any
attempts to use plugins to workaround the GPL for doing HW emulation -
however I don't think adding the memory values to the callbacks greatly
increases that risk.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

