Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B18D6D044C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:06:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phr2O-0002Fv-04; Thu, 30 Mar 2023 08:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phr2M-0002FW-39
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:05:50 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phr2I-0005f5-Pj
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:05:49 -0400
Received: by mail-ed1-x536.google.com with SMTP id b20so75536094edd.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680177943;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TZevAMUZOBxteHCpXJ4dCZZXpJfYwkoEfu59Ck8wpME=;
 b=A/pCjkTYQATpaqK2MnZMQdsbBYYf1K5ODLG46G2GILAKSlkUQbIb1i0eP4WArF14U9
 vn/ezERrFfZI+OPEwpp5317sb8T4b2kXQ76FgGHOONZYDY7FhnjjIpravM0Y4NvSlgkG
 JUlbhHwF5XEqG1OCXsDDs1VDumeperunMCwxCVPZiixOAwECBiE8fj6qhfiyqFX8AlhO
 c5LmVZkx2Z7WURPKQcAZiqEzDEuOPFx4ju36O3swHeQxmBE8GOHprysKfRmhH+gvdxPi
 byDuFA1dFHb0Dxk+bygy+o0xIISnwOtGrMrMt6YG6KTSpFpMY1qXjDJM4t4SGC97W+x8
 JViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177943;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZevAMUZOBxteHCpXJ4dCZZXpJfYwkoEfu59Ck8wpME=;
 b=myXPipHe/8I3S+3ZAONWeQatDj+AIsIvwzojW0J9jJI6HJRc/9f60p8M4zKCxlBL7m
 dsgW+qD+9Cubs1QDfmhK13l3KhcJSLvcu9NJVir13lisM+ttTs1TEVbxfMhrDfStiUhQ
 mOCucfXUh2PyjHH6WjXbgj5Di2R4vmwUXoOdUnLG1ILlmvz9MDk3B0ez4oc+kMzeYiiP
 vUPOGDwVCn8DSmmIB4+UeT1T87mUkSzauoboztArivIt+jCPL9ACxP7qYlhET/vMKZ5t
 SzoIig81BjHAI0doC8mN69is0wwmyZNuNBzNg/9kKtRZ5ohOGCueoypJzL7dOpMUbIJn
 x2+A==
X-Gm-Message-State: AAQBX9cB7h4KgE9hgsaM7qvYdiEV/uywkV1Z4XdqblXZeENVnune+oPO
 TQFeI1CmOOo80NbgL0PGcxU7jy8FeefZtsuouzKvCg==
X-Google-Smtp-Source: AKy350bPJRS7YWu6/DxVKPyUvk05p+n0qr46Gu5PNW43b7zCuy1fDl3M+ixwry+86qq4XAASueJKX6oBNAPfpQDRtDU=
X-Received: by 2002:a50:9e4b:0:b0:502:3c99:417f with SMTP id
 z69-20020a509e4b000000b005023c99417fmr8677292ede.6.1680177942767; Thu, 30 Mar
 2023 05:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230330120319.36069-1-pbonzini@redhat.com>
In-Reply-To: <20230330120319.36069-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 13:05:32 +0100
Message-ID: <CAFEAcA8n5c5k=9UV_aOA5FojiOE+N3EstFYADQeHxNaDcjPW4A@mail.gmail.com>
Subject: Re: [PATCH] lasi: fix RTC
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 30 Mar 2023 at 13:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Migrate rtc_ref (which only needs to be 32-bit because it is summed to
> a 32-bit register) and drop the write-only field rtc from LasiState.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/misc/lasi.c         | 2 +-
>  include/hw/misc/lasi.h | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/lasi.c b/hw/misc/lasi.c
> index 23a7634a8c3a..5d07bc801a84 100644
> --- a/hw/misc/lasi.c
> +++ b/hw/misc/lasi.c
> @@ -204,6 +204,7 @@ static const VMStateDescription vmstate_lasi = {
>          VMSTATE_UINT32(iar, LasiState),
>          VMSTATE_UINT32(errlog, LasiState),
>          VMSTATE_UINT32(amr, LasiState),
> +        VMSTATE_UINT32(rtc_ref, LasiState),
>          VMSTATE_END_OF_LIST()
>      }

This is a migration compat break -- the commit message should
explain why this is OK to do (and the version number should
probably be bumped too).

>  };

thanks
-- PMM

