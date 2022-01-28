Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688D4A0005
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:23:45 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVuS-00074d-8D
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVkR-0008E9-TW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:13:23 -0500
Received: from [2a00:1450:4864:20::429] (port=40821
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVkQ-0006LZ-5D
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:13:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id s18so12411275wrv.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8MQBxnxP/orxcZqvX9P2x2YUFlWPRoe4GigdzLPgEU=;
 b=eVGhVzLsJ6xGVLq4Nf4GbEKT2dGLXx79pm/xm7DjvYea8wudj0YjQNN4l+PXnlXDnG
 wxJ/rXAhfxKrbzX5CXmjb8oFEvJh6r3VEupy2dxesZeIJLhjZi9laDtHw2dAFVyhjYvN
 f+AS+2HLtir8vRUve9JpCD9kloiECZG1N7syAupLs1tTyh17sTz6EciN9S2xG/U37A4q
 HlN5H1RC9wrCXXrKSLJVZXcPqfR3vdomZBTXdxym2UxngKePeqnu2YtH+5YJUafscwzG
 bG7BHnHRrv9taLm0mDdyBzI1sQ8u9UY3Iaiif3Gtafq4v6JxUnEmUt1bYZgDnVD64bsm
 t0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8MQBxnxP/orxcZqvX9P2x2YUFlWPRoe4GigdzLPgEU=;
 b=Ep13US1JFyxsNTI0Dv5IDhU4jWAxKGfOYLJdJXnhOod3AKgSQLOzxikiiNAJHydMCg
 UpmEE+hXEwSiVSVwJ43NkbRSUOGeyaTLeF1Lm9Gk2xKMgA/I/j19SBazweBfU+8ygDXB
 l9YmNFJ57vuL8YbFPGtasO2UAM2QTHOp2qyVNpEP8gsV6OIgtEJwKAJbDz8yQk1slJ56
 WtqKw3050tWUad0crBE321saLwHeiX+PeIPEPqg336MfsfZWrDYhfztzpWxulmI9ZM7E
 E0TXWzwawSgpgRf3pk/hqLr6O/ZVuqctCuT4uBG7iX53yG3CHpYKSSli+px0ZEAYGq+u
 k8Fw==
X-Gm-Message-State: AOAM533zCli6EmYrFZeLDvLIVIk+WIUXWiz/17fuPVidnw3AHRrG6qWA
 OMUzTy1bMp3e9Ral8RA/zGAyvqC8nRvhV4hhL4Rb6g==
X-Google-Smtp-Source: ABdhPJzoCtEkD+Oh9Lz3WFjhhuRQA2Vhn9RDHGtwKffLjCnbB87Xsn4o4iGD9Bdx5NIEHhxTdhIH/reZ0aCudakgn8o=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr8245891wrv.521.1643393598263; 
 Fri, 28 Jan 2022 10:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20220127063428.30212-1-richard.henderson@linaro.org>
 <20220127063428.30212-5-richard.henderson@linaro.org>
In-Reply-To: <20220127063428.30212-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 18:13:07 +0000
Message-ID: <CAFEAcA8Bj2uUHj-y10VfcH6RDdOhPBKeYfug2iVe1BfKpUUUrA@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/arm: Use CPTR_TFP with CPTR_EL3 in
 fp_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
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
Cc: yuzenghui@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 06:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the named bit rather than a bare extract32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ca916139e8..5610879680 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -13034,7 +13034,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>      }
>
>      /* CPTR_EL3 : present in v8 */
> -    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
> +    if (env->cp15.cptr_el[3] & CPTR_TFP) {
>          /* Trap all FP ops to EL3 */
>          return 3;
>      }
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

