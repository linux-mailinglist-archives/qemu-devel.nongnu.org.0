Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6494EE24C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:05:32 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na12v-0001DH-5Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:05:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1na0y2-0004Ss-4R
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:00:26 -0400
Received: from [2607:f8b0:4864:20::1130] (port=39896
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1na0xx-0006MG-Ei
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:00:22 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e5827a76f4so10533937b3.6
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IyQ+Zj0p2PL7TDfbf0Ayp0ykKaVWx9zxybE2X5cgZT0=;
 b=hRFtj2s7OsOf61Q+PqufVs7t95SRnPhEXVamONHZ9ZeMOKkZMT5issHAb3YXooghsH
 l0hpz51MlCejuZZyMQq3gUoTvTo95W4yJW7b2EDTNUQBKUHBq1LpJ5UaGnyldbqFTSk+
 JB4fsut/M9ajd/SpbLvAu/vS8xxKagLtn2DKJdIiCVFHW1+Vq8fPZMHP19tDkmyS921H
 nYvLaIpHOu0nS5ws+Y15YNorXDkob+ScDrA9jjGhQQuJ+eVU6sTKpaTSyBS8pfZ+lTK9
 IZ+TFUFtejfxaolVTUe+UC+MldjGBt+xlDOvVx9RTpSu2PQyWrR27aqrtxj6e7Va0nWK
 zz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IyQ+Zj0p2PL7TDfbf0Ayp0ykKaVWx9zxybE2X5cgZT0=;
 b=RlvSjfuQwF4aJE4snpJ+UwhEGop4ovVTLTQK25kjLM+Lm82vpx8ULh8TN0i5UsELD/
 qw4h7dNI7duEweqqG8JO8nEyy31DqwD1i0QGHY1SLma7aN7uWLR2fhKpgEFukPCWc6hk
 H4gTKDbcueIJXhmpQYkQ/s/galvcDBYZp39RPWiPo1WoR+I+G+QPP+Pf7GviD1cWp6qe
 IJUqKLzDrLL1/FfOctY0kDv0aXc4pK9NOnOHfJmM2n7bAM1aiVNx8bz+h5pn+Ay9AWZg
 Ya2nQccxoKpd5QoOFTeitAjte0MTpMJRCccaoqlae4vUK0i1+kV0o6rtueFc9k849TY5
 VN9A==
X-Gm-Message-State: AOAM530hmUyL53DV2FuvYUBvSGrcalSaF263w3gzHX1MGTlfKRKn4uZW
 kUmlAlC07wO2TCb1AJkNb1DX7gv75qWNZh3IL2916w==
X-Google-Smtp-Source: ABdhPJyLIYruJL9y3DAu9YCIlmxHLqtGCg/U0o+ulhbGLbGNwbMJ9DZdelJoBVHuao9YRG99/tXWlW3YAiRupwzqEpE=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr6687316ywb.257.1648756818538; Thu, 31 Mar
 2022 13:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220331182651.887-1-wwcohen@gmail.com>
In-Reply-To: <20220331182651.887-1-wwcohen@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 21:00:07 +0100
Message-ID: <CAFEAcA9Ab_+8K-RcJeCFAmGkeu6xqL-dsAQuTETqRhCM6ncZmA@mail.gmail.com>
Subject: Re: [PATCH v2] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
To: Will Cohen <wwcohen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, fabianfranz.oss@gmail.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, keno@juliacomputing.com, reactorcontrol@icloud.com,
 philippe.mathieu.daude@gmail.com, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 19:27, Will Cohen <wwcohen@gmail.com> wrote:
>
> The patch set adding 9p functionality to darwin introduced an issue
> where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
> though the referenced constant is needed in 9p.h. This commit fixes that
> issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
> XATTR_SIZE_MAX, to also be in 9p.c.
>
> Additionally, this commit moves the location of the system headers
> include in 9p.c to occur before the project headers.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
> Fixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")
>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
>  hw/9pfs/9p.h | 18 ------------------
>  2 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index dcaa602d4c..b9152c7882 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -16,6 +16,11 @@
>   * https://wiki.qemu.org/Documentation/9p
>   */
>
> +#ifdef CONFIG_LINUX
> +#include <linux/limits.h>
> +#else
> +#include <limits.h>
> +#endif
>  #include "qemu/osdep.h"

osdep.h must always be the first include line in any .c file.

thanks
-- PMM

