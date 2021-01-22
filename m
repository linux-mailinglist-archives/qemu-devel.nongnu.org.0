Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFD53004DD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:07:29 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2x60-0000dG-8O
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x3A-0007B6-OD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:04:35 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x38-00036O-Ie
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:04:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id a10so7796406ejg.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPqkB2inCyRDsgVqNysnSw/veEsPoyzxCNm4XEt/C4M=;
 b=F3BeFxqWKwwjwBJO2selV3VSh0tMWeIkyiFFHZ4TU/QA1JmsDZxtD+yqfnby9EKXZV
 2m4kFvi/8U7xZ69S3Gr2y81h13H8AL0nEsE/WiOswX23UkzQ6r15YHkt0CNAP7LP433j
 kF307Q92UIW1/lkjmEIdFz1+Ldn9KY10ZGsAZOzm5Rp7XB7DMtWph45lJb+PJ5Nitpgd
 f6bDYh9GCLShdrYswrKqzH5w8G6z9+b4+YgtXSh0ELAi17tISU9+yhrgRgqquCYIIs2N
 J+qqNKIaHHV1J3DQVrb+WAkJ9o/kyTFUlYmvvyYABxALDJA+S9a8XMapZLvg6u6Z4UIP
 dIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPqkB2inCyRDsgVqNysnSw/veEsPoyzxCNm4XEt/C4M=;
 b=NESghzcIIIFUhlrc8cOP07MiKY7rMR0nN0LInlXBgBQN4SU1B4yyDubpZbonEMr62l
 Irm/s1XzggEVKa0eoCkf1IBIwRH/QjP8PT1NZY1vLSqBPpbHiZXdwN3JRpZFoHCHw+5s
 9DaKUz0gKgPgagcfFwIvt7aJSEeLBEfsOk6rGxu3vVO0kGLwy9txcip9IVzJy5u8rMGY
 wGIDOtKL6CvkeKs+96MBlBlld50mlGL1q6yEOaTt0f6JsVrcOvQ8pqI+kJubONPwLa8o
 5WvSHP2tdvISfIyU3L64L8wgtZ36UEpZyGYCwIqJsfIObltz8W+5Zey6AuFWOx0zJtXg
 yvUQ==
X-Gm-Message-State: AOAM532oEbxfK0QfJNkPzXMiCz1Udgj6jsq3PiOTf6yYlJM+21eJ4pDo
 THfj7Utln9529T3WtXPppK7WuVycfVK9s+fL2rkH4UpKMW0=
X-Google-Smtp-Source: ABdhPJxQ5sCrGyAJf6PvFwa00e/xu19CcNEf/RPtND/Z9oydDbLr9W22yv97cb8I4PtE7OQE1ouQvyG+IqUaSz1MSUk=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3004933ejv.4.1611324268754; 
 Fri, 22 Jan 2021 06:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-22-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:04:17 +0000
Message-ID: <CAFEAcA_6x8K6ALT52UAgndgaWh+TpD0V=T0AkFpAyJ8WXXE+-w@mail.gmail.com>
Subject: Re: [PATCH v3 21/21] tests/tcg/aarch64: Add mte smoke tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/mte.h           | 53 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-1.c         | 25 +++++++++++++++
>  tests/tcg/aarch64/mte-2.c         | 42 ++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-3.c         | 47 +++++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-4.c         | 42 ++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  6 ++++
>  tests/tcg/configure.sh            |  4 +++
>  7 files changed, 219 insertions(+)
>  create mode 100644 tests/tcg/aarch64/mte.h
>  create mode 100644 tests/tcg/aarch64/mte-1.c
>  create mode 100644 tests/tcg/aarch64/mte-2.c
>  create mode 100644 tests/tcg/aarch64/mte-3.c
>  create mode 100644 tests/tcg/aarch64/mte-4.c
>
> diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
> new file mode 100644
> index 0000000000..038d33ab6c
> --- /dev/null
> +++ b/tests/tcg/aarch64/mte.h
> @@ -0,0 +1,53 @@
> +#include <assert.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <stdio.h>

All new files need the usual copyright-and-license header comment,
please.

thanks
-- PMM

