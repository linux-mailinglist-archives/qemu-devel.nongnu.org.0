Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7564A5558
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 03:43:49 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEj91-0002Zt-Hx
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 21:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEj6T-0001oD-A6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:41:09 -0500
Received: from [2607:f8b0:4864:20::d31] (port=41717
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEj6M-0001Vj-FY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:41:08 -0500
Received: by mail-io1-xd31.google.com with SMTP id q204so19447202iod.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 18:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3DydThek7VIXVeI67ZPaXT28ZXeDB7gaep/LoC9LB8=;
 b=oMfbS+pD3v4wP44zTFUCT5DHdnScED9OpfyOVkbNIKWY/C0iIegTgPikkN3TAF8gYA
 QYk31GAvu60pNAFzza9LRcc8lFRi3zPYQFUAYM1gZey6I6RNaLZ9U/ndUI/p5iaynpIk
 cT+6gQqPelQ7pEpvkju7Zm3OdXMueASqn24RVBc6N+24QV9bAQAQLYwNn7f3PF57PpED
 7B19SNnOvwUFoxkrkqT6or0wfatiE7TFqWcJXil9RPAr2qKvqOE3EXF0MGc2G14s0QEl
 PqPHeZMQKHN3l5yPl7rXNvDss0svXzMx2+K+AxZUKNXE/+ddBdBL1BqoethdArzPbid+
 SeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3DydThek7VIXVeI67ZPaXT28ZXeDB7gaep/LoC9LB8=;
 b=6uYmvY3itZ6EIZd5W3uTSmM+6LpI75jcUxZYW94vcPos+s88Y7SRv04XtoCKW9dvWp
 3KIj7TCOfJ5SoTJUMzglbV5m57OD4GxmM3hmwolrRZBh8UVXlm1RG1uGhArr9DPXg5qx
 9pIGqXoLFQCBDVNSGNTTsGGUAMr8n0h8SD/jZY3Yezb9AanWwZiu4+2ZfIiUd8wmNu1V
 TSrZqAvgGY0q/ztj66m/POjzXN1g8AG6yOi2hbpy2NztwlebHpEXIltWggyuzNV4gCH9
 +xe/VM4RhFQHe/feP54gnFU4L6B5yTetM4LQzNj5pEgf0ryu4PjJdjVTgbJuw1k+6Ou7
 kfcA==
X-Gm-Message-State: AOAM533u8bTcD4FjhhqjV4cE90nVtb15kt+syfbrO4irp1mZd5klLTTB
 n4IlTJZMFVABTkZFugqmYEuJ6RpxuZTrZ6rMJO4=
X-Google-Smtp-Source: ABdhPJydCLXULTlS38/gSNEfCUN4TtWFdT57ABzbyUxJIsMvC3Pj1hidz2bnr3xNGoNIvIiBHZINtYLUVWoQhyL5d4Q=
X-Received: by 2002:a02:9606:: with SMTP id c6mr11477760jai.169.1643683258929; 
 Mon, 31 Jan 2022 18:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 12:40:32 +1000
Message-ID: <CAKmqyKMhxEiCYw+=J=jvDOcj0uf-wrWbr6QuaDMp+tET8TOzhg@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] target/riscv: refactor (anonymous struct)
 RISCVCPU.cfg into 'struct RISCVCPUConfig'
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:03 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v4)
>
> Changes in v4:
> - use a typedef into 'RISCVCPUConfig' (instead of the explicit
>   'struct RISCVCPUConfig') to comply with the coding standard
>   (as suggested in Richard's review of v3)
>
> Changes in v3:
> - (new patch) refactor 'struct RISCVCPUConfig'
>
>  target/riscv/cpu.h | 78 ++++++++++++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 37 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 55635d68d5..1175915c0d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -303,6 +303,46 @@ struct RISCVCPUClass {
>      DeviceReset parent_reset;
>  };
>
> +struct RISCVCPUConfig {
> +    bool ext_i;
> +    bool ext_e;
> +    bool ext_g;
> +    bool ext_m;
> +    bool ext_a;
> +    bool ext_f;
> +    bool ext_d;
> +    bool ext_c;
> +    bool ext_s;
> +    bool ext_u;
> +    bool ext_h;
> +    bool ext_j;
> +    bool ext_v;
> +    bool ext_zba;
> +    bool ext_zbb;
> +    bool ext_zbc;
> +    bool ext_zbs;
> +    bool ext_counters;
> +    bool ext_ifencei;
> +    bool ext_icsr;
> +    bool ext_zfh;
> +    bool ext_zfhmin;
> +    bool ext_zve32f;
> +    bool ext_zve64f;
> +
> +    char *priv_spec;
> +    char *user_spec;
> +    char *bext_spec;
> +    char *vext_spec;
> +    uint16_t vlen;
> +    uint16_t elen;
> +    bool mmu;
> +    bool pmp;
> +    bool epmp;
> +    uint64_t resetvec;
> +};
> +
> +typedef struct RISCVCPUConfig RISCVCPUConfig;
> +
>  /**
>   * RISCVCPU:
>   * @env: #CPURISCVState
> @@ -320,43 +360,7 @@ struct RISCVCPU {
>      char *dyn_vreg_xml;
>
>      /* Configuration Settings */
> -    struct {
> -        bool ext_i;
> -        bool ext_e;
> -        bool ext_g;
> -        bool ext_m;
> -        bool ext_a;
> -        bool ext_f;
> -        bool ext_d;
> -        bool ext_c;
> -        bool ext_s;
> -        bool ext_u;
> -        bool ext_h;
> -        bool ext_j;
> -        bool ext_v;
> -        bool ext_zba;
> -        bool ext_zbb;
> -        bool ext_zbc;
> -        bool ext_zbs;
> -        bool ext_counters;
> -        bool ext_ifencei;
> -        bool ext_icsr;
> -        bool ext_zfh;
> -        bool ext_zfhmin;
> -        bool ext_zve32f;
> -        bool ext_zve64f;
> -
> -        char *priv_spec;
> -        char *user_spec;
> -        char *bext_spec;
> -        char *vext_spec;
> -        uint16_t vlen;
> -        uint16_t elen;
> -        bool mmu;
> -        bool pmp;
> -        bool epmp;
> -        uint64_t resetvec;
> -    } cfg;
> +    RISCVCPUConfig cfg;
>  };
>
>  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
> --
> 2.33.1
>
>

