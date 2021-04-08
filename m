Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E077357F63
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:36:21 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUR5I-0004iG-LB
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR3o-00047d-GZ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:34:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR3m-0001vk-UC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:34:48 -0400
Received: by mail-ed1-x52d.google.com with SMTP id h10so1548071edt.13
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c3wkKnnyILhPw03agoIqnaAiGbLrsUZe3CC8Lzqa/M=;
 b=Yzp61gLZwKoPZy4u42keTQ65TY/Fn27ukxiP1Z+oHeMZD6v2SCcmuzEzfhU/EylOxC
 ltv/X18rV4tq2QWuuwJ8ILy1QFc6gzQtUVC1qUyqPryK2xHNH6lQZ5In9l0ZxEyXVYWY
 Ty5wrPWoP9Tu/aGwrzTg1bcB93CAKhO39cmOev3ER+WMaJCgnJryU+xBcY3xvuDD24bM
 iCtTGVAqQb9w5w4A+E0bzhtsPHbZUF3sYKlrhJlYsJucaQjTQR1XdvqkauOtO2e5tlUT
 mMEVRJOdF3g5LihQ8CLdiGB4SD/Ajy1QlZpKvr6IThnGdCWMv3Zh8mWlkvt9ZF73tIFn
 l2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c3wkKnnyILhPw03agoIqnaAiGbLrsUZe3CC8Lzqa/M=;
 b=sQlqXkkWN6kLhhq8Ae6WjcOR14CkO6XSHAsgGLsFeOAe/+tA+D4bK0ex7U+c8CLMV3
 eMpih5SpXa6mYCvsqQ0smOIYbwLv7NCA+sJG2ahibl1GxBAeJwOihWJjdSrHG6wfJQNI
 ycVgOnGYyGZgheoJIGVthh1sMbCooHfAuxJQhLjqKCgkmX76SCzlNCj9qI0Q+JcVQb1x
 JNS4h8WBd2N3r8GziMCZ12CdxTErfyN4fCZYwBx90uXIc4XjXAMuzAxFZPGO8hLj/QMB
 LNu+1y5LdlY5rkxASK8qDWrj3M1uh3YwnRVogoaZNUpLVj9gTn22KN9YNXZm3xfPZ7ow
 z+dw==
X-Gm-Message-State: AOAM532OhRcuqGSGX+RmuLjz2ueInhfjcUjrNCfOEe5S0t/PPKkpNfyN
 LXbHjOwHA72WGMOgc1qXF3mf2nz4GcMz4Wfj1VhBKA==
X-Google-Smtp-Source: ABdhPJy5uC+Mn5BM0URuKd74d0cq/fLFfTfCmffrI6HqFKCtZINudXN972Fds69lvw4gl+pCt7D/bZNM9ykSRC8XJms=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr10058948edt.36.1617874484821; 
 Thu, 08 Apr 2021 02:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210402100449.528-1-yuzenghui@huawei.com>
In-Reply-To: <20210402100449.528-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:34:04 +0000
Message-ID: <CAFEAcA9HzHAS+6g3HJMwUEfH4P-zqsnqX+fH2o5g77TxBk2zpQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned
 range of StreamIDs
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Apr 2021 at 11:05, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> In emulation of the CFGI_STE_RANGE command, we now take StreamID as the
> start of the invalidation range, regardless of whatever the Range is,
> whilst the spec clearly states that
>
>  - "Invalidation is performed for an *aligned* range of 2^(Range+1)
>     StreamIDs."
>
>  - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
>     aligning the range to its size."
>
> Take CFGI_ALL (where Range == 31) as an example, if there are some random
> bits in the StreamID field, we'll fail to perform the full invalidation but
> get a strange range (e.g., SMMUSIDRange={.start=1, .end=0}) instead. Rework
> the emulation a bit to get rid of the discrepancy with the spec.
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

