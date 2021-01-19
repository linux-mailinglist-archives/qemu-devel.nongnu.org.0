Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A302FBBF8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:08:44 +0100 (CET)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tYh-0001gd-8G
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tAS-0004Rh-RL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:43:43 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tAP-00064K-02
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:43:40 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g3so9743860ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WbZO6mIcr5YwPvWpr6twVYAAqjV+IEMwMzO8tHWHouE=;
 b=vMbjvOv+GqqI8gpqrXsqbZMjB7SObhm/4SmRK3x1R5qq/FExdvQoy95ihNJlvi+Gi2
 m52PSd/4nEeTrZS2qnYrdewnatzyoM0+28wb3cw2vVk3ey4+5QTGr46q79tvwfxxcc0C
 apAyVrjTHozlT30vBWpdj5my/WbX+rUBCJxX0ehEVAAwWvMpGtnDspcf9oc+4dn925AE
 +aECin6HRZzGE0d9Ew0KwCeAk0UYBxhKTLVuVyAjsjpQ63re3XJwmNOj2+hAie+vOoqm
 8Fp9/r4+VvCE9hOF0Cgz/mqy00O34hpGih8YNYEQx5QeQErH+jas1kzPisFgxltYJcMG
 GR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WbZO6mIcr5YwPvWpr6twVYAAqjV+IEMwMzO8tHWHouE=;
 b=G3C1Zu1dtPsDMvfnfQKb38UTI4iMZKOn+4vJ77QG5jEp7azwx8H0QLIhtNHe7wHEVU
 RBIOQ/o0ZPb+nTsuoYlepw4oEZLH2u4YwC1etB7Hapzpz1v1oF9n38e9NDk+CpGAQpF1
 9elRMiXtQ05LrRFh+/pbkBMs+qNKO5byv9uSgD9h8/rw2Jw3VzvBboYzkKhuFGUVzIT7
 1Gv4L1w31OzAvwncHb9Yoa0kl2ROY8pqNGxMH6OILjiIsnrN+5iF2nyTSVH/2vGbzD4C
 ziEby6XMqGS5FK9X3DbV1mbTBQ1RaX9BePuGaB9Udh0KhLSt1flT6Uf2LmIlHeg9yypn
 Wbrg==
X-Gm-Message-State: AOAM532YrgCCQGgId8Viog0w5fbn5OqNnodLmg74bXM0CaNxRLKUDslO
 j0uNfvayGJNtFBH/WWrma5DKSmrReQ8smlRLnpJXT6YR8Ek=
X-Google-Smtp-Source: ABdhPJyoKGGgPnE5e8G5zMJGSGlJysDtYPCDU58NugzMudbM7usTyaIFNO6RdqXZl5kofsqWJrOD0LpvI5z8hskHh6A=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr3299299ejz.407.1611071015331; 
 Tue, 19 Jan 2021 07:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-20-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:43:24 +0000
Message-ID: <CAFEAcA8BW+z9TKNEosh0c0YAMQgD94qGDe8q8T5Sc85BWs4McQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/22] tcg/s390: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 15 Jan 2021 at 21:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

