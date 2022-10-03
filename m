Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06975F3107
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:17:47 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLKM-0007cJ-PK
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofL64-0007TP-JB
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:03:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofL62-00044y-Kk
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:03:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so16641815wrp.11
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=yLwSwJJPueYvAqx6uVkPALY3KBGjmQuCH7c6hjnnb7k=;
 b=w2SshreiBOtP2DpK3XC8cp+avv9nVXQ0GHdWmKsHA0qCpgxFP0sqrJn1D4IJI9sXzl
 2u9F6XbTolWcqClGZhYCTUV+yPrX8IWtf19PffhSKBXoU3A74wAAAsXg+Guvr7xMjh3k
 SpRgIkGIXzQX4+Zx9tIR/QBuVMhEDjnfPLpL0PYSaIHjV0D92wbWUPx3U18s7xq2M8ha
 S6cRUE93pVyQD0p2fC+YFv9OL3YyD/4uHe+P9ykhBzN4gt/TfJrWCqmfc0kpgM4XO572
 c8UEINeX7zEISoH+18TdMHVJLjE+JgtxbQnKQ/WmVu33leZ82DI5y3XqRnGHn54B5USd
 UnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=yLwSwJJPueYvAqx6uVkPALY3KBGjmQuCH7c6hjnnb7k=;
 b=A6qh1DErqqJda+Yoz4ND6LrMXZlqYbLVSoWVYKu0qphglURj7+Lj1BZaZpxxehxDOF
 //6IBuY0TQ4XM0pQoHX21PmMWeZPhubWiDrE5If8SSfaVeeh5a02unfhhVfKEZvDYOFv
 YU8exip5KTsUxmyHYWrS34JgfBNtaozGmgCFL3vXKiBxTg6dIMu55LrVGvH/5PmWOsqZ
 qMx9Vu5AW0Np2BA40hlBuXimAMBi7rBp9XIKcdoNAkEpJM8oc89EfS+tUoqi3yhSLuvk
 ZWV02cRmUcmzrodHJDMNHSVTsCx60J/+Lr+3amar6Tgizrw6j/ToM7ki3QvKZvgTnGFT
 MaRw==
X-Gm-Message-State: ACrzQf22CRSx5lczs2xPqNZJj3jaBp3mbkzQi9VSgPYZF9XE3vitRi7L
 xwIPt9hAhKjq+SARfxSj1t8W+g==
X-Google-Smtp-Source: AMsMyM5AjAowFbgAvADI9zQBcxxgdqxqzk0eqnrOjFmRI1bqcchUSNyYvBAt8VlBtjmI9z/Cm9JzvA==
X-Received: by 2002:a5d:6c6f:0:b0:22e:46ad:c3d6 with SMTP id
 r15-20020a5d6c6f000000b0022e46adc3d6mr1109980wrz.677.1664802174999; 
 Mon, 03 Oct 2022 06:02:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003a84375d0d1sm17306173wmq.44.2022.10.03.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 06:02:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3CF81FFB7;
 Mon,  3 Oct 2022 14:02:52 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-16-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 15/18] include/hw/core: Create struct CPUJumpCache
Date: Mon, 03 Oct 2022 13:57:19 +0100
In-reply-to: <20220930212622.108363-16-richard.henderson@linaro.org>
Message-ID: <877d1hnjpf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Wrap the bare TranslationBlock pointer into a structure.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tb-hash.h       |  1 +
>  accel/tcg/tb-jmp-cache.h  | 24 ++++++++++++++++++++++++
>  include/exec/cpu-common.h |  1 +
>  include/hw/core/cpu.h     | 15 +--------------
>  include/qemu/typedefs.h   |  1 +
>  accel/tcg/cpu-exec.c      | 10 +++++++---
>  accel/tcg/cputlb.c        |  9 +++++----
>  accel/tcg/translate-all.c | 28 +++++++++++++++++++++++++---
>  hw/core/cpu-common.c      |  3 +--
>  plugins/core.c            |  2 +-
>  trace/control-target.c    |  2 +-
>  11 files changed, 68 insertions(+), 28 deletions(-)
>  create mode 100644 accel/tcg/tb-jmp-cache.h
>
> diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
> index 0a273d9605..83dc610e4c 100644
> --- a/accel/tcg/tb-hash.h
> +++ b/accel/tcg/tb-hash.h
> @@ -23,6 +23,7 @@
>  #include "exec/cpu-defs.h"
>  #include "exec/exec-all.h"
>  #include "qemu/xxhash.h"
> +#include "tb-jmp-cache.h"
>=20=20
>  #ifdef CONFIG_SOFTMMU
>=20=20
> diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
> new file mode 100644
> index 0000000000..2d8fbb1bfe
> --- /dev/null
> +++ b/accel/tcg/tb-jmp-cache.h
> @@ -0,0 +1,24 @@
> +/*
> + * The per-CPU TranslationBlock jump cache.
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ACCEL_TCG_TB_JMP_CACHE_H
> +#define ACCEL_TCG_TB_JMP_CACHE_H
> +
> +#define TB_JMP_CACHE_BITS 12
> +#define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
> +
> +/*
> + * Accessed in parallel; all accesses to 'tb' must be atomic.
> + */
> +struct CPUJumpCache {
> +    struct {
> +        TranslationBlock *tb;
> +    } array[TB_JMP_CACHE_SIZE];
> +};
> +
> +#endif /* ACCEL_TCG_TB_JMP_CACHE_H */

When I saw this I wondered if...

> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index d909429427..c493510ee9 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -38,6 +38,7 @@ void cpu_list_unlock(void);
>  unsigned int cpu_list_generation_id_get(void);
>=20=20
>  void tcg_flush_softmmu_tlb(CPUState *cs);
> +void tcg_flush_jmp_cache(CPUState *cs);

this helper and ....

<snip>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 3a63113c41..63ecc15236 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
<snip>

.. this one should be moved into accel/tcg/tb-jmp-cache.c so we can keep
all the jmp cache stuff nicely contained (and cut down the grab bag of
content to translate-all a bit)?

>=20=20
> +/*
> + * Called by generic code at e.g. cpu reset after cpu creation,
> + * therefore we must be prepared to allocate the jump cache.
> + */
> +void tcg_flush_jmp_cache(CPUState *cpu)
> +{
> +    CPUJumpCache *jc =3D cpu->tb_jmp_cache;
> +
> +    if (likely(jc)) {
> +        for (int i =3D 0; i < TB_JMP_CACHE_SIZE; i++) {
> +            qatomic_set(&jc->array[i].tb, NULL);
> +        }
> +    } else {
> +        /* This should happen once during realize, and thus never race. =
*/
> +        jc =3D g_new0(CPUJumpCache, 1);
> +        jc =3D qatomic_xchg(&cpu->tb_jmp_cache, jc);
> +        assert(jc =3D=3D NULL);
> +    }
> +}
> +
<snip>

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

