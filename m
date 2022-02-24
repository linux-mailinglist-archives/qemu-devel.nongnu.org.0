Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202714C2CF3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:27:55 +0100 (CET)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNE9y-0003nk-80
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNE7n-0002is-RZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:25:40 -0500
Received: from [2607:f8b0:4864:20::b31] (port=45974
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNE7k-0008IK-3B
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:25:39 -0500
Received: by mail-yb1-xb31.google.com with SMTP id g6so3738220ybe.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vyDGyW/NXfqLIjC1WzN0Ar/TYLrZ09tcsez/yWwu874=;
 b=CEnyKn0gygVuk2jLKONBs8a122NU2vu3Rl1cNd/9pRLD/04312NIGfwb19lxBCK/iM
 YtK40cD02Dqyb/y0wvLpMKOJGMvk3akGnUComBdcvIC0SEXkRaIsZKVC/ce61pNE1XcS
 qYft+XGbTBaJzPb4lbT0bbJPR+LoITgtzQSfNxviHb/lajxnz2k+wOlaMy7eJHhUV21k
 rKhLZheZsKBkSE9e1dZPz9iGCfN4Kw0ohLuaL0ZNaitBF8CkFyoxLCIU+l7sosUxMzc0
 fymv+5cdpcOX9dzTDhFxMQ7ObzRwNcVwFPEJFCdApqBGAutRrFvxyIQVyqqlCbFfgoN2
 2MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vyDGyW/NXfqLIjC1WzN0Ar/TYLrZ09tcsez/yWwu874=;
 b=7opnFUgb1oiDIePn3FPqvfLviqXvPlhpRQpnHKv4uMlJKADt/mx1W9lx6Ldz8AtD8T
 zbtYNacEECGpiW5OipDfK5n7ZHm5xwwRTKSG70NIql8mxrBIV7c0HAGBmOPf5gFx9IYT
 fxdvQ6G3Elt13EGAAIgslKhN/CRG7DLdQOHyvUYY1CXkUgguWjU7H5LC7ZbXk7/6HsRs
 fM4d2cVMd/HhVbBGTL/rnxYd0Gta7NvFeETG+9Ma8MuDio/vGTQeIg9Vra8P4SN9h3jh
 9n8w65496xn5DRl5qRFx7FUsIShYvchR2pYIAAQpBYxYW/zZKIB88pN/PFlmTvxgyUGJ
 c7IA==
X-Gm-Message-State: AOAM531XJ6Er/K6BAJ0ZjSe8LyJqYZl+E3edYxobzs9x7tr1i/1LquAA
 AzIXXsYuPleWCz7+5qpe9jl7T1DV+XcOjoFDbAGHGg==
X-Google-Smtp-Source: ABdhPJzClNRy/p3/eLApnIlqfaVmI0yhCRD9iKpsCqmeX+B4Ny45TU7JsETqrdlDLgzBvj8QuZsjUpseoVgo4lEr3os=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr2429006ybc.85.1645709129260; Thu, 24
 Feb 2022 05:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213035753.34577-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 13:25:18 +0000
Message-ID: <CAFEAcA8_VgsR=Bcn1wxxaLotxQH3sumYMt1=3NxwHcdQFLPYqA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Support the latest PSCI on TCG and HVF. A 64-bit function called from
> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> they do not implement mandatory functions.

>  /* PSCI v0.2 return values used by TCG emulation of PSCI */
>
>  /* No Trusted OS migration to worry about when offlining CPUs */
>  #define QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED        2
>
> -/* We implement version 0.2 only */
> -#define QEMU_PSCI_0_2_RET_VERSION_0_2                       2
> +#define QEMU_PSCI_VERSION_0_1                     0x00001
> +#define QEMU_PSCI_VERSION_0_2                     0x00002
> +#define QEMU_PSCI_VERSION_1_1                     0x10001

Just noticed that there's a minor issue with this change -- it
deletes the definition of QEMU_PSCI_0_2_RET_VERSION_0_2, but
it is still used below:

>
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,

here ^^  which means that this breaks compilation on Arm hosts.

I'll squash in the fix:

--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -98,8 +98,11 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES,
PSCI_1_0_FN_PSCI_FEATURES);
 #define QEMU_PSCI_VERSION_1_1                     0x10001

 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
-MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
+/* We don't bother to check every possible version value */
+MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2,
                (PSCI_VERSION_MAJOR(0) | PSCI_VERSION_MINOR(2)));
+MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1,
+               (PSCI_VERSION_MAJOR(1) | PSCI_VERSION_MINOR(1)));

 /* PSCI return values (inclusive of all PSCI versions) */
 #define QEMU_PSCI_RET_SUCCESS                     0

thanks
-- PMM

