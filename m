Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F387D6FC9F1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:10:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOyL-00026L-Ey; Tue, 09 May 2023 11:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOyI-00025h-8N
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:09:46 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOyE-00062g-WB
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:09:45 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc5197d33so11341484a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683644980; x=1686236980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yuP6Nqn9mJTNOPU0Dnc8yj52myNrmRS59kymFA9fyP8=;
 b=TgFn7EeNyiRJ8CYMeZxGPt35djp+kfYNjaSIL4umBg4QlkEkKeYCweEmM3mDe7wDwP
 JtCMqeyw9eehlpOlVdTIm1PCN0aQqT7FYGyCbPiPVHpljFAjFdnjcQLe8bVr5rJJ9DtO
 GmR2GpmOTHGyTI4bo2AD5u2w2UkGX8a6Ma9B7vG5mQq/IUZmL+h8YXPWc/5m8XtqLMZQ
 m6zfTwhGh9zI/I2tGpt5l91KKyVa/P537ndY/2YdZeUtNvzf+rAS/ah05S76/VFwf3Of
 /3yr2MCv9qwvOi9dhtoa6MVX5G7fuwGbNbcHHALkG1trTsHMPGIEhWprwMYsbArEUkDK
 4ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683644980; x=1686236980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuP6Nqn9mJTNOPU0Dnc8yj52myNrmRS59kymFA9fyP8=;
 b=fZGBcBT/537qoCDphF8X7r60UnW2xCXNxSNOixkDmr9uiINuVlvb+uUolzC8E93mbc
 rsxRfZjYqct5BlVkI0oy/1uSvwA2fOWiuzXFM9tdLV0y0v7d6jAJWy9z2Oe46FwOa6Iu
 KyT60JUJzLmHKVhbs3L9iO3CYWCH30uzh9Hc3rfj5TQMQVvVBx4aO3g7lhXyBGzSXTyx
 yM1pmdVRQDk+AkYOcS9j4taUWE39t5K7Rc/Nyw/3+FTgiVQNxIax+YkPSfOL+C+twimM
 tC4SngcD8CVjTUVSplm17IphZPhQ755b417IDg2KysN9So5+bsL9KFikQ6YoNxxVBY9+
 Pimg==
X-Gm-Message-State: AC+VfDwKtKToltEraw5a9/51F559XAM+v3unatA8/Aa7BN73d3Jn/01z
 vfET1h+49rknv5vK2sK9gqBiHZkSCaq7ifWqxBLnZA==
X-Google-Smtp-Source: ACHHUZ7C6epciNC4EGrHIOLw7c740yHULxj07iC3YZnNGcZvii53xDIgahUrlZ1av1UNuF8nq3sKtvA4Mv29iOV2C6E=
X-Received: by 2002:aa7:c548:0:b0:50b:b7f5:3128 with SMTP id
 s8-20020aa7c548000000b0050bb7f53128mr10431201edr.12.1683644980086; Tue, 09
 May 2023 08:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230509142639.253947-1-pbonzini@redhat.com>
In-Reply-To: <20230509142639.253947-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 16:09:29 +0100
Message-ID: <CAFEAcA9Czv2nVqb3sApAda-aru8Pco7vkyN48YCjYa92105WzA@mail.gmail.com>
Subject: Re: [PATCH] target/i386: fix operand size for VCOMI/VUCOMI
 instructions
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, ricky@rzhou.org, 
 Gabriele Svelto <gsvelto@mozilla.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 9 May 2023 at 15:27, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Compared to other SSE instructions, VUCOMISx and VCOMISx are different:
> the single and double precision versions are distinguished through a
> prefix, however they use no-prefix and 0x66 for SS and SD respectively.
> Scalar values usually are associated with 0xF2 and 0xF3.
>
> Because of these, they incorrectly perform a 128-bit memory load instead
> of a 32- or 64-bit load.  Fix this by writing a custom decoding function.
>
> I tested that the reproducer is fixed and the test-avx output does not
> change.
>
> Reported-by: Gabriele Svelto <gsvelto@mozilla.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1637
> Fixes: f8d19eec0d53 ("target/i386: reimplement 0x0f 0x28-0x2f, add AVX", 2022-10-18)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Worth
Cc: qemu-stable@nongnu.org
also? We have real-world reports of guests falling over on this.

thanks
-- PMM

