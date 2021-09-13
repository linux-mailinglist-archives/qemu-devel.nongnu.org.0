Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1F4087A1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:55:02 +0200 (CEST)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhjx-0007S4-W3
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhfe-00054f-ML
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:50:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhfb-0006ZG-54
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:50:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so13376932wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08eP+0Wy8C9Y+icNfsIYmS8byb2MUuvsGf1B8iV7bY4=;
 b=Ho2WrG7ybyiqDfTEsZp6zIeD0BieVFY/5J/lSfoV/4YUXDevlLzf0GQTLwayNUt3tw
 RQJD/9mit8Aa3bj+mpLzXINzy9i/1IyFA6H0rSt+wvqXCNskW2QQBQ9JwyTmCp/kmNEx
 6FFtrJqsyU/8FPuMLFvwqfmWR4ipCJIwPw+VQk8sZPTMkEiUaPJHeMufXXcueWQF6IH9
 d5LWsAI+1xkIdsJGJnOQBmxQfg3CDxBGwWlvW36zV3NPpz5HfHhD8vmt+lVi5v3Ud4WE
 Bve2HIDQuXks4cD+edvslbx+tY7ZT78k8D5yLDRSQp7ErEscnCoSeXxQS0V8mWbB+WHY
 mTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08eP+0Wy8C9Y+icNfsIYmS8byb2MUuvsGf1B8iV7bY4=;
 b=wT/1UNVDP86Gl/00l1zLGGD9KnIBEUwfXa0E34NBDVq8oa6SuNy3n3IfHVrKHDdAsc
 MNJq23toVz90tU37IWz0ZNuJFNy5yv5rfpMRiDvYR0IFFNpKIvkdGv615J/fEdRrBboL
 Gx3dKJL2uRhuDbL5yvyajw0kNw97BjED9TlImrAwj92+W3se2yfslug6aqWI5Hexd0LU
 XJKu+zkK95lyXGgK9zmC7NvH+ghqYCvXP4yf6a14HdEG4CIVh7d/BleSMihkSJSaELmJ
 rAyF9Mhwskuxa6SL/ZhO7p+pEIGVhYPVGmdJ2uJBxGTjTET//NabJp7Vqqw4Zn8RQ0Ts
 4IeA==
X-Gm-Message-State: AOAM530Xq+d9KSeUoZn+FfxjpjrcbIzCWKqvncczhwqysSOboJ0f8KX9
 0Ah3WlXFHSaFN8VjF/FeCn8LnsgJAU+9eqIREUBZ3Q==
X-Google-Smtp-Source: ABdhPJxcAWNjLiDG/t64nXFnEalO1Fhb1FEnvMLjfgZxJzNLYY21KboBfSj59YURiQNirBbiOelCn6UYSjEVzFwFRJE=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr10993767wrq.263.1631523029493; 
 Mon, 13 Sep 2021 01:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-2-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:49:39 +0100
Message-ID: <CAFEAcA_fVeTv9Hj6cuf9KMVf3x76rnMVXqTt9hGT7wcW_iKQfg@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] arm: Move PMC register definitions to cpu.h
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 00:07, Alexander Graf <agraf@csgraf.de> wrote:
>
> We will need PMC register definitions in accel specific code later.
> Move all constant definitions to common arm headers so we can reuse
> them.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/cpu.h    | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c | 44 --------------------------------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)

Do these need to be in cpu.h, or would target/arm/internals.h
be good enough? (Lots of files all over the codebase include
cpu.h, so if the only users of these defines and functions are
in target/arm, internals.h is better.)

-- PMM

