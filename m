Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5173F6335
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:50:09 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZch-0003Bc-2l
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZWG-0007XM-HJ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:43:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZWE-0007z8-Gk
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:43:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id u3so45673680ejz.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjfo48GRlIIPVBF6fn2AyHht503GaHc7npUBq6d3kfY=;
 b=Rh5+ns7hDj9HapmxHMGOfYqxc/tlijfLf7HlhtjWWMXagH7U/d3X/UQ3A8M211UlbD
 P5JLJcX6dUDyvvd0sHg1yL1eU3+ENxzh6goW1mHoNROcT1m5lsvPyV/tBEo0fOx4aSet
 +XoqqiWigg45brwvQVjRuZpmlt/0JMKQDvPMOD2U1eal25bIZcVcjeKwH+0+RkAFovea
 Gcqh0+pS+snqlCgJSX6m6StAnNEIIZ/URx9HuSj0SAqnXG5dMWlNDH7TOkQ1H/DjJHXS
 GYR2FQhcNDWZrLcnF4aXcYiKabkDgYhfUG73n+3whdd/lIiFCYaS7mv52Q/U73yQuxTd
 /Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjfo48GRlIIPVBF6fn2AyHht503GaHc7npUBq6d3kfY=;
 b=OUWL/KsCqRjIAZgSqUoPFxOboQXyXpAsMBKq0/aKPjI9FkLrdYyUVh/Ywrxh/usG4F
 wHsfYZFPBx936f5D2j1+rsydcWlcBmX11LZO/9W+1/nWM6tjDi3YRK3m32Tcuh/Kj94F
 Zy6VRxOCbn+YGDHe8FvLu+2qYkNMxeVNDq1Tzn1VZ98sgKnmceGBcSs1ghT9ierNTwJd
 afWLDtHWy52Z3oer0bs0AuedxPTVPsS2qnYcJPMsVuzMgsVtl6XGZLLveChgeeU4dDbv
 hgql+r+q52BwfjgA4K9FEUf/wx8QrxH+VJZeveXMtMDnt8dQhPc6xU3MtU9se+ddD2K3
 GIVw==
X-Gm-Message-State: AOAM530Lw2iCSFRJwavIG0rSH/T9FnINF1bCHIcwJ44f5JaH9GL4jV7z
 BHtuOmhrwoiNvxDMyu8SPf4K4vFcHWic50v2Py4CZg==
X-Google-Smtp-Source: ABdhPJxf6OP2mz18FE0SMJE193CsN96KTvrCmp1qiCxqH4W1XPwjYImWeQFqn/gALIn34gZg5KIG6EQWLT2nGOyFGO0=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr42463635ejz.250.1629823400946; 
 Tue, 24 Aug 2021 09:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-21-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:42:33 +0100
Message-ID: <CAFEAcA-5k9uw1mfRC65XcmShYRUDy6YN58RfzBVsFz1gWAi_pg@mail.gmail.com>
Subject: Re: [PATCH v2 20/30] linux-user/microblaze: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

