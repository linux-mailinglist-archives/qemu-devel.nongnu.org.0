Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF82FB9BB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:46:47 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sHO-00040S-Mb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sF9-0003Bj-KM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:44:27 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sF7-0005AB-0g
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:44:27 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g24so21752594edw.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EA58k9tfPX3EEWyK8qdAFAKO95ay95QMtRgA3gez5Nc=;
 b=qyFYaSYVPvAKznHuDxQbnlHaO2SZHGhFR21yLguwdpCIqJ6i3jZO4MtxWMNeR9xvOh
 1tiYkXuXk6gbeVEO1x7DqW32V6d+nj/NAGVdOHdxBCBfSPtvJ6PonrdwUkARsGCfrPq3
 Y546MEM6sHNw3po0xew3WXjzh0CiZ/xz+YIDfKuHfba1WyacZrE8A34O1p7XI7ZOph+s
 N84Q7jDJEy3nsFzP8JWpuV7kZBsN+BJn0MyyzhWkghHHCSy9pj5ShTZE6/BqEhz1CKvp
 RbYLfBA5Ac/8ed+rTMQ392WpzHneq1XGBP8FIFvOorE+jFaLAkzrXflmrJhG5df5FaOD
 WKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EA58k9tfPX3EEWyK8qdAFAKO95ay95QMtRgA3gez5Nc=;
 b=UIkqv3+l6FzDNiI0bIHYSkrJ4z4Xi455wVtykBby6AW+JBgpOtufWrjgxuQssWHpFQ
 Aj0+2ej44BOVZeM5FGTFghy19Dt4IsjsTBTZXM1Kc41+qU94LGb44ioUK422w2W1m3Ys
 6Ws4DrZ2vSIoSu26+NBTqDN0wnLjst3igLa/2VKE9daLZdKBkN9i7dh4cVpWnQWsYhzc
 LgmvV81rS1sreogu+STFzjxlC8tftWh16HABCUU8w3yYyjgiCZouFV1JferCasOsR7YZ
 3IbZb7IwsyhDxv/5scihlkJVrHVWl12Wo5FfgrlW1qdi9n+wEwwEiVT/vbEQWljx3LUJ
 WTFQ==
X-Gm-Message-State: AOAM531+zJEPsgaQMlh/VGLPEU27XFDvYhOkGX7tYjvpcasDXsYSTFnk
 8krrYlvo62OKNrqft11vtI6OJLhF8iQ7Dsu8/AB5ww==
X-Google-Smtp-Source: ABdhPJweztjQDJ9EHJ752ydPlaSEHK04NpH94IxA1VsqimDs1JNOOHbbwnSDkGtmFeFiSvN7XvdkNPECk8bLrRNm9tA=
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr3794229edb.146.1611067463856; 
 Tue, 19 Jan 2021 06:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-6-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:44:12 +0000
Message-ID: <CAFEAcA_CQMTAB=4rzy95zvW1Fk2BX2Va4q5vWvs+qH+O=F1pVQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] tcg/aarch64: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-con-str.h | 24 +++++++++++++++
>  tcg/aarch64/tcg-target.h         |  1 +
>  tcg/aarch64/tcg-target.c.inc     | 51 +++++---------------------------
>  3 files changed, 33 insertions(+), 43 deletions(-)
>  create mode 100644 tcg/aarch64/tcg-target-con-str.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

