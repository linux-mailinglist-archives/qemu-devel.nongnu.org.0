Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC737C010
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:27:40 +0200 (CEST)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgppr-000384-Qt
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpko-0005YE-RZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:22:27 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpkn-0007s2-4d
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:22:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v5so16222987edc.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3HH8/4O46IlqqyMZ1moKMle08K+rG3d6DKkJns2xvxU=;
 b=RjrUCzTDswM4zstKXTHfbTgdLU/WK5LVKVfXqIQnBDp3M/8BkZU6szGGKpVtNrD81g
 Ky0fTCXZlG51PY/ajraKL9TiEVuefuBLbBK/C1CPWscLfW4+LZvkRLnrPZ/S8mcIwcng
 j0ZZ4ppqnGXHDuc0DjtosgPOUnSsASrBV1gKL4wpNp7DKDLq7mbfhqAvywrkq7eWOh9D
 OBs8aja6PJ3QHj8VVOgVVnZLbls0XSrMrFwfLSMJmyb51rISPdVOoa70nssjo501Lg3b
 /iKbBEaYDQ2mApUPxnvOUI1145TuyKI1FytEqInLHtAbwma3HMKPpvh+yqqpJPGhXONV
 kK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3HH8/4O46IlqqyMZ1moKMle08K+rG3d6DKkJns2xvxU=;
 b=EgE911wh0uf/vXexvTp1RS37wWbMmE6Teexq6vPEEiqSkF9qFd2hRH+P4DxjpDrSLh
 23rxEQGV270z4/7sMxjjDPDe2OYUYmX3c+7lDvVE2NwLZm1og8Dkb9cdp4yxUXI1fQyz
 ou5Cu1EyjapOCwZlsY5X6Y24fPFPe9sYRL4jU8Ukq6+GwFBpKpspsFf3ciZI3fn05dC5
 qcHp91COL2wdh/1FGXiGQhJBwuJHWcPz6MVEFRftwIid5dc8hMjou05a3v39ZrFPNMs+
 hcfU45e9LsNTHMG1OHzJwtuT93k05ag9Cbzu4DpVfzgS/vaHfSZmQ8XeI/2rSaeYMcq3
 oOHQ==
X-Gm-Message-State: AOAM531A123Xh+LF76opS8Jm3RYrB1sPnIZ97UYFEwIgI6FA/54DNiO+
 nWMyHp92PwdHSZg5mTbIu46IJDMS2p/uoHzjgSLBOA==
X-Google-Smtp-Source: ABdhPJz+ekimH/FvWDqmkCBmEVWmrA2OAVIl/sMtdX45cOxgT7LtHLZShXG32OOwq+WcxwGBjaEHkMTrpNCcyR5qGLw=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43278753edt.36.1620829343379; 
 Wed, 12 May 2021 07:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-35-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 15:21:09 +0100
Message-ID: <CAFEAcA_jBHGAB2xL5zJnz_Rix_sF+ge7d65ZfwPN6F5DaN=yRA@mail.gmail.com>
Subject: Re: [PATCH v6 34/82] target/arm: Implement SVE2 saturating
 multiply-add long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Fri, 30 Apr 2021 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++++
>  target/arm/sve.decode      | 14 ++++++++++
>  target/arm/sve_helper.c    | 30 +++++++++++++++++++++
>  target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 112 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

