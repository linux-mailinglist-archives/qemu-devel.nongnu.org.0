Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522CA679E56
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:13:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLuk-0002F7-3b; Tue, 24 Jan 2023 11:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKLui-0002Al-N3
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:48 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKLuh-0003s7-3Z
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:48 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x4so11540757pfj.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d/92yOfPC4quQ0Hjjdafz7RrLaQ9Cr/2dayimzGP+m4=;
 b=VV5GTAwEo16SgQUcigaADg3meFOjdJphHrDViP2i4CJXrOKWBOOOGNJCRN9qYNaWN3
 lOrzL0IM2mws4V6s+8ltVdnLSauZINhBMpMI/XbqHqiDkWgi9BMu+7/uqjt32J0ZdcBx
 jhZL+Yq3Bw7W7hSoaLZSbO2OaQqKyueYDNQXixH9NntCMq+vp/D6RLg96o1Bfc1cbgCX
 4xr+e98LGI0k1xbvzM7dmBXPtM5EEHP/mxV8AyM2WJoz3bRpZSIkd3sj6ztRqxcVHHmB
 cAjSOk1NdtjCFbbzSD2GM8SREq8Djd7h/8V6aTopsqjA5fCQUm4MlFNPreQLR58j2HQt
 /2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/92yOfPC4quQ0Hjjdafz7RrLaQ9Cr/2dayimzGP+m4=;
 b=YqPR8umP40oF+udtPkbbgXVfHDqL1zRaavT4Ed9SXDjPbwbR6Xixpf92zZxJ4bMpet
 jQrv3nRhCVMDqGIX21dMpNd6K67efPpoSvMDg7qYHcfLNgAQ0tue71/VJO2LO9Ktw74y
 xMwdiU8ukVj3L+e/O2ol2/5/0JT9G+qbLbuZg764Og2B1iuXBDyRBh1V9VLg9s+kpSMj
 /iV5n8ld8goLUb3s51wRkJy2yPotatJ6RmjGoqPcbYCEloP4TeOMJOK74R7be4Hex53/
 Er8bGEspS9BWGo10zZ5qUZIyWybePWxzfIPc3TKLbrKSX4VbXSSchrb0uJN4oTLKa+O5
 f1yw==
X-Gm-Message-State: AFqh2kq4aX27KrOcTRhumLCQAcAciph4m9sQQHeuUv6dKuKiDpqW8irw
 reU4FCwno9GoJYoC4x8x1JLEky43j162D/Cym8jCew==
X-Google-Smtp-Source: AMrXdXvQ7xLfJE7QLJmqKZ4GkFnqznDBO3boAwjSFpfc8/Oz2rKhdhbcNCuy9GIb8xliwIKmDxGl+6x9R1GPKI3Twa4=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr3194053pfb.26.1674576764642; Tue, 24
 Jan 2023 08:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20221201103312.70720-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221201103312.70720-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 16:12:33 +0000
Message-ID: <CAFEAcA9sj838rCyPrxAOncXKmdOftZeM16rKiXB5ww7dSYY0tA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Propagate errno when writing list
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 1 Dec 2022 at 10:33, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Before this change, write_kvmstate_to_list() and
> write_list_to_kvmstate() tolerated even if it failed to access some
> register, and returned a bool indicating whether one of the register
> accesses failed. However, it does not make sen not to fail early as the
> the callers check the returned value and fail early anyway.
>
> So let write_kvmstate_to_list() and write_list_to_kvmstate() fail early
> too. This will allow to propagate errno to the callers and log it if
> appropriate.

(Sorry this one didn't get reviewed earlier.)

I agree that all the callers of these functions check for
failure, so there's no major benefit from doing the
don't-fail-early logic. But is there a reason why we should
actively make this change?

In particular, these functions form part of a family with the
similar write_cpustate_to_list() and write_list_to_cpustate(),
and it's inconsistent to have the kvmstate ones return
negative-errno while the cpustate ones still return bool.
For the cpustate ones we *do* rely in some places on
the "don't fail early" behaviour. The kvmstate ones do the
same thing I think mostly for consistency.

So unless there's a specific reason why changing these
functions improves behaviour as seen by users, I think
I favour retaining the consistency.

thanks
-- PMM

