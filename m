Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B8699A29
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:35:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShDQ-0007d1-8B; Thu, 16 Feb 2023 11:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pShDO-0007cH-6A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:34:34 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pShDM-0006Hm-70
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:34:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r18so1977212wmq.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxyejCikzloPXB5+f4kgN4Fxz0UKVkFk6obGDBmqYhQ=;
 b=i2NfFadD0ZQPKhI/VtMRuSSi+e3tpXaCmVY4oj2kgwdPadeMSmnqO7pWgNAmPPvND6
 2Vt0jnNaRrLcuoJOFYUwVlVuNxpG2juxN2WkB0pRBWXIHGBgi7w28wcAJkUmTvLJeR0k
 LLkyeFl1a/xWLUc3Os/3Xjeav1BWu5yKLxTbUW5jRbI1NdvhyqgVnKxiqfi3K9IqPYCZ
 FyReL8TvJg8/PYYz6OEglUK30xVDLyt5j+6BXRNCXDO8uQ6DIUgzOAkpNaBt/+30vIeu
 If+tgQzhfO2KVJLZrKe1kRKUQbBEWNlbn8/P9sDp38a9PV5bBMc6t9weWPV5UMxPXx0r
 Gawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VxyejCikzloPXB5+f4kgN4Fxz0UKVkFk6obGDBmqYhQ=;
 b=Nc6cUEuhEhJIb9hJ4lTkJqlqvi4R8q2QN3kvCPaYg3EWW9MmYQ5cx+ceVnlqdBWusP
 q9zMRGrFmtvPCu/4wR/JKk6vhymhu5tLKKLf7sbtalBfjUHvAoThDPh5hoCUBvjj6y+E
 1nHf0GVBbYDRdwG7ZnhCs8Hoa4qTZ3OV2dAIZ5rWFrsKbmh3VhEe+uEahiqkIwaqvP3t
 TLkOVWESnCyKG67gE0m1Zv5bjJ7uUshzgnHNAqiBdh+vz3K6pHBe/6QVNdGDhy/33+wM
 nK09zYuc+Su7+b3Ef7H7KwPNjFvhsiTzlngk7kwAWLxKXJ0yTWGEeSj9p89J11dp2hmE
 Yu9w==
X-Gm-Message-State: AO0yUKUJXYgRkmY5KGDVfQIrMi6aPpNcKlW6n7mjBaAQtS+A9A2m7YN2
 XfdDW7YBhKpJLlAPvhd29djMlg==
X-Google-Smtp-Source: AK7set/Ipu4FKstBUz9MI0Pp4jeSp6SHhwMI+tZH6KH/WQ7KX8OL44WAe04boKKs14c6KgtxaazVPA==
X-Received: by 2002:a05:600c:1693:b0:3e2:668:3ec0 with SMTP id
 k19-20020a05600c169300b003e206683ec0mr4410956wmn.30.1676565270372; 
 Thu, 16 Feb 2023 08:34:30 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b003e21a8d30c9sm1069344wms.37.2023.02.16.08.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:34:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1D9F1FFB7;
 Thu, 16 Feb 2023 16:34:29 +0000 (GMT)
References: <209f0f05-b982-eecd-f4e2-70da12e91892@yadro.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [PATCH] TCG plugin API extension to read guest memory content
 by an address
Date: Thu, 16 Feb 2023 16:30:54 +0000
In-reply-to: <209f0f05-b982-eecd-f4e2-70da12e91892@yadro.com>
Message-ID: <8735758t7u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
> function can be used by TCG plugin inside of qemu_plugin_vcpu_mem_cb_t ca=
llback to adjust
> received address according to internal memory mappings and read content o=
f guest memory.
> Works for both user-level and system-level emulation modes.
>
> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
> Signed-off-by: Aleksey Titov <a.titov@yadro.com>
> ---
> QEMU_PLUGIN_READ_PHYS_MEM_ENABLED define below is to let plugins to check=
 if this API
> is available in Qemu build.
>
>   include/qemu/qemu-plugin.h   | 18 ++++++++++++++++++
>   plugins/api.c                | 20 ++++++++++++++++++++
>   plugins/qemu-plugins.symbols |  1 +
>   3 files changed, 39 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index d0e9d03adf..576597f601 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -625,4 +625,22 @@ uint64_t qemu_plugin_end_code(void);
>    */
>   uint64_t qemu_plugin_entry_code(void);
>=20=20=20
> +
> +#define QEMU_PLUGIN_READ_PHYS_MEM_ENABLED

We don't need this - we should update the plugin API version instead.

> +/**
> + * qemu_plugin_vcpu_read_phys_mem() - reads guest's memory content
> + *
> + * @vcpu_index: vcpu index
> + * @addr: guest's virtual address
> + * @buf: destination buffer to read data to
> + * @len: number of bytes to read
> + *
> + * Adjusts address according to internal memory mapping and reads
> + * content of guest memory.
> + */
> +void qemu_plugin_vcpu_read_phys_mem(unsigned int vcpu_index,
> +                                    uint64_t addr,
> +                                    void *buf,
> +                                    uint64_t len);
> +
>   #endif /* QEMU_QEMU_PLUGIN_H */
> diff --git a/plugins/api.c b/plugins/api.c
> index 2078b16edb..95753bce95 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -442,3 +442,23 @@ uint64_t qemu_plugin_entry_code(void)
>   #endif
>       return entry;
>   }
> +
> +void qemu_plugin_vcpu_read_phys_mem(unsigned int vcpu_index,
> +                                    uint64_t addr,
> +                                    void *buf,
> +                                    uint64_t len) {
> +#ifndef CONFIG_USER_ONLY
> +    cpu_physical_memory_rw(addr, buf, len, false);
> +#else
> +    CPUClass *cc;
> +    CPUState *cpu;
> +
> +    cpu =3D qemu_get_cpu(vcpu_index);
> +    cc =3D CPU_GET_CLASS(cpu);
> +    if (cc->memory_rw_debug) {
> +        cc->memory_rw_debug(cpu, addr, buf, len, false);
> +    } else {
> +        cpu_memory_rw_debug(cpu, addr, buf, len, false);
> +    }
> +#endif
> +}

I'm wary about this because what memory is the plugin going to be
looking at? There are certainly no guarantees the memory contain the
value that has just been loaded or stored by the instrumented
instruction.

I certainly prefer to see example plugins that use new APIs in the same
patch series to help in assessing if the API is useful or flawed for the
purpose its being suggested for.

> \ No newline at end of file
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index 71f6c90549..f0ce8c730f 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -42,4 +42,5 @@
>     qemu_plugin_tb_vaddr;
>     qemu_plugin_uninstall;
>     qemu_plugin_vcpu_for_each;
> +  qemu_plugin_vcpu_read_phys_mem;
>   };


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

