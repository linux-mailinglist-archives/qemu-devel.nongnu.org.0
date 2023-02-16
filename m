Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01A699A5D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:43:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKs-0005z8-KO; Thu, 16 Feb 2023 11:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShKq-0005tg-TJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:16 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShKp-0000cj-7a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:16 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 oa11-20020a17090b1bcb00b002341a2656e5so2705964pjb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6cf2TONYJflbiFEEl5WJe1blExFqws/U/3uWBMjqc+s=;
 b=NUWfy1rocbGn74j/gfx5Dj0tXRBoUqVWjvTkKSi4Xhs9WexdSddmh4veq1mw3LmjD9
 XHaERkSwLUynXzUANgaNFGkxUFh99sFTAK3qoFIo8kGDivp1gdytGxfMOQPFSO7BWSle
 r2ioMDtN9mbYfgLqhLG136XWrYtdZSCTKIJr3ITXMGg4O84+eVZ9V+HqCR9TfjY4FZ8J
 +I/eAN60zLOBe28bKWFZqenG2UtwLvSY/kpWL9ZAkyHmuObWJKnQMTMkmgEdX6z1NOuR
 sBstguzpoAoh1zO68r5r3UtKDKqy6Oc+kmwk6YGdMAQlU9IOmK4Z6cBCfoBUQhpENMrp
 Iacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cf2TONYJflbiFEEl5WJe1blExFqws/U/3uWBMjqc+s=;
 b=1IaaPe5/il7ZjbRhWwZDTtsDdO9V6IKYDzyTq6H5uxepHZWioGq5UhGnK4n3VyKVan
 BDgHk+1fLCYRs67f+xuOiJD2qeRDD+k2jX7GcyDk8km+HzLmrJfLHNwYUjG8eW7K3Exz
 XucrpM/icV0Vvt1MsUx5QdTpF3jmWVnzNEhRRLE1UFzco8DJASBV6VlfOen5GUCerIq6
 XLvHu+yl6uO2CfUxsnrEjvQ7xAE5HH2wEj4nPt/6GxxWlAVrvR7goBM3Fwa0WMaFxpQ4
 HLSGcSgxEk+A0mplIseXcRMRGNdTBaHrVG/rTHyhrvJ1IjC/YaY1WwdaB4Is6GDV2EBI
 wtpg==
X-Gm-Message-State: AO0yUKVGfYEbucDCKy7ZfGP1RWguCcdMowkl0tdK/5TTBo3U9/UqZFyr
 qJkyN9go/IuE2ljooKyvcEdmvkkd+QULhUz+Ar3B0awfqNiZQw==
X-Google-Smtp-Source: AK7set/jrt/swaNnkriI/mvkGhIZeGs+OkCzhZZejotcdBXfzWr0VxoCYS5W0h5jRZJUc1LKbUOa/Aqv+7ClFMuLHGE=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr774622pjb.92.1676565733887; Thu, 16 Feb
 2023 08:42:13 -0800 (PST)
MIME-Version: 1.0
References: <209f0f05-b982-eecd-f4e2-70da12e91892@yadro.com>
In-Reply-To: <209f0f05-b982-eecd-f4e2-70da12e91892@yadro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:42:02 +0000
Message-ID: <CAFEAcA_1V1W2XteGpuKHYMAgp9mkAz=ZR22S-XG8yF-QB7uXJA@mail.gmail.com>
Subject: Re: [PATCH] TCG plugin API extension to read guest memory content by
 an address
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "erdnaxe@crans.org" <erdnaxe@crans.org>, 
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Thu, 16 Feb 2023 at 16:18, Mikhail Tyutin <m.tyutin@yadro.com> wrote:
>
> TCG plugin API extension to read guest memory content. qemu_plugin_vcpu_read_phys_mem()
> function can be used by TCG plugin inside of qemu_plugin_vcpu_mem_cb_t callback to adjust
> received address according to internal memory mappings and read content of guest memory.
> Works for both user-level and system-level emulation modes.
>
> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
> Signed-off-by: Aleksey Titov <a.titov@yadro.com>

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

This is the wrong API to use, because "physical memory at
address X" can differ depending on what CPU you are and
what state that CPU is in.

> +#else
> +    CPUClass *cc;
> +    CPUState *cpu;
> +
> +    cpu = qemu_get_cpu(vcpu_index);
> +    cc = CPU_GET_CLASS(cpu);
> +    if (cc->memory_rw_debug) {
> +        cc->memory_rw_debug(cpu, addr, buf, len, false);
> +    } else {
> +        cpu_memory_rw_debug(cpu, addr, buf, len, false);
> +    }

These ones are a bit better.

> +#endif
> +}
> \ No newline at end of file

-- PMM

