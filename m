Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D93B42C8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:59:32 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkUd-0003u2-8h
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkSo-0001q8-Ns
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:57:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkSl-00074d-LZ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:57:38 -0400
Received: by mail-ed1-x529.google.com with SMTP id s6so12982482edu.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0kJ2o5ve40Q+LEaLQfjI3pVB91S8+tSBhZeiIUy454=;
 b=kUsVBelKUNBKrAUiutZOAQnagZeP90XxQB+MMspRWK0/6LSgXX3DREvfpAavKmdJmW
 Lzg5S1MzNiSCesFI75cNvi9aeUJ3cfxrt+bxH1rvkF8D/sp7V0Rvd8Tn5c+Nt1mKuzsy
 OqBJaOCxTuPRJKNayDrlRVzcvnrbGiIVY8cHy9Y3odJvU3oz7KMl4Tsg+43eBGle7gE0
 XgUELCtM1eE/+8hwMTQ4TFEGfrYReyB/5mW0vi/jNiFSMYJP79QUxo2JN71bc64o4Cne
 KCCiSD7/ea+f90f5nXkNTzM0WcYCRhjjXP1T2grWO+Mu9Gl1etcooP7rGpgzO6+CkDnk
 eJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0kJ2o5ve40Q+LEaLQfjI3pVB91S8+tSBhZeiIUy454=;
 b=NhQITxyqH6AoJgutFQfJL7nn0TyjrLvThGgQQq8Pl0fqNfQ9N7pKcuOyYNSi1zn+rI
 utWKVUTer7E1e+qzK9DnjKKBnWuAETFzrmqeTzcYoH7kJa80MXyjPK9LlMnMNLEVmyPj
 bw87FMM6PHqdwQ23cmthDy9c4O0D8Gm/HO3gLMonNv+auwKbAHFD35K1/omUGDZWQnfl
 9XAiYuYqGZ8aHiWXbvZdpr6Qwjsfh0qKYVKiJjkNQoP4BFKZCXmZiLac65XWZvW/nqBZ
 g0NlfLDlFImZGUvVajBDWA/Ro/iBWS14q1chIirHUZACDEZT6rWNeFaRE2Nz6p7EjK5q
 7z5g==
X-Gm-Message-State: AOAM532zjFMCVsf6OaA8bswqOmYrTNAilsi1G7VOFV9ZAnAUY8L+Tcmj
 +baZYp1gQdRtS9duzN2XGiTzpu9+ui1ySySP42Zklw==
X-Google-Smtp-Source: ABdhPJygdlgUjFH/XuJZolf2R/tcMoGQgDr464V5P0h0byo0k+vyljgxDsLcenr6zFAp4OQYhQXEBUM+Q4sUoz9LRqc=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr13790595edt.100.1624622253738; 
 Fri, 25 Jun 2021 04:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-3-maxim.uvarov@linaro.org>
In-Reply-To: <20210625111842.3790-3-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 12:56:57 +0100
Message-ID: <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> qemu has 2 type of functions: shutdown and reboot. Shutdown
> function has to be used for machine shutdown.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/gpio/gpio_pwr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> index 7714fa0dc4..dbaf1c70c8 100644
> --- a/hw/gpio/gpio_pwr.c
> +++ b/hw/gpio/gpio_pwr.c
> @@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
>  static void gpio_pwr_shutdown(void *opaque, int n, int level)
>  {
>      if (level) {
> -        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>      }
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

