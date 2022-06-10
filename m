Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E954679A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:48:47 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzf0H-0002kW-T9
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzexb-0001vA-VX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:46:00 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzexa-0002rB-ER
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:45:59 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id t1so964870ybd.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+eTKlGq8wkW835wkOCFVqMRhkJdrl1m3jhHyUajUK8=;
 b=rOw20KjqrYhUTNxah59fW0sZzQXLx70oRKQIBh8G8eAMmEALjpPSt+ZXNEneFmZG77
 dsfgExWQckalffxRjMyYqZ1ZOkjfC3TPJzUv3MMUXylkmKNe/UmYLijsm/4ZwRNw6rvn
 cFjetyW17BQCZzUIu/NJzB5ebQsXqtxEyRwJOel0EYxNgCAQwWDI//2TLLqS6L948i0G
 DZzwfFp4PwywFJVKgK1y0PNUWed7owC2ANZVygnZgNhn8aoAaJy2GNizyDsYKzpdMC48
 SIGbuD9KLA4WlLkRTX7uMTK0z04q7WffrzotGU/MIABZWmb25cux6OpyVA/k9cUK97Qa
 wcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+eTKlGq8wkW835wkOCFVqMRhkJdrl1m3jhHyUajUK8=;
 b=sH+XW/AGVatk9VWTmQsPwtsu2nu3bYSaV81Oqd2k37b+RLRBSvw4XZ52g6UJhLtanY
 2TLvvIGBKSDykbJWezOC8p4emmsscGMuGR7NF1lOSMTk9tkXQquzzBB3HOI14Ec9ugVS
 a95UtILyvHonVR6qq8SYzcTQw4pxulha0aGill855pFXrFaSdaKxBZWXF8R3z1oyO7Sp
 jg+DKmN9jEWgE1SdFC9RyBHbpGiF6N4LrhRV7c2hplrWJ9+/LRHyGEFZyHvkWc7UUHCW
 Qc272HP7s8BM2Sucdj/NtJsZbK4foUN0V2q6ynhKtdwlKujzZAWS43uO6J2t07Q2XRxM
 yKLQ==
X-Gm-Message-State: AOAM533AasWVkSH3GLIw6JSOSaiVDl1HOYbrhI8tsXrGgEGJC9khnd0N
 ONP3XZGdgdiBhMBy3r3RDhBs4OcEPXHawFd0giLftA==
X-Google-Smtp-Source: ABdhPJwfJvG2VIsmwP9XOblFcY5DnLJL4d7nQ07F/0XGy+ZEYiNUBQPkxYe9vIX9rXgmi2ulSDJWst7sbIZ1cMR57R0=
X-Received: by 2002:a25:b94:0:b0:663:e6e7:c5 with SMTP id
 142-20020a250b94000000b00663e6e700c5mr16794888ybl.85.1654868757302; 
 Fri, 10 Jun 2022 06:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220609122852.21140-1-hreitz@redhat.com>
In-Reply-To: <20220609122852.21140-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 14:45:46 +0100
Message-ID: <CAFEAcA9S9tXNsgn4u0AYe2_Vt0n0oESYPLJmL+VmzcTBffg4hw@mail.gmail.com>
Subject: Re: [PATCH] qsd: Do not use error_report() before monitor_init
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Jun 2022 at 15:26, Hanna Reitz <hreitz@redhat.com> wrote:
>
> error_report() only works once monitor_init_globals_core() has been
> called, which is not the case when parsing the --daemonize option.  Use
> fprintf(stderr, ...) instead.
>
> Fixes: 2525edd85fec53e23fda98974a15e3b3c8957596 ("qsd: Add --daemonize")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index c104817cdd..0890495c40 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -286,7 +286,11 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
>              }
>          case OPTION_DAEMONIZE:
>              if (os_set_daemonize(true) < 0) {
> -                error_report("--daemonize not supported in this build");
> +                /*
> +                 * --daemonize is parsed before monitor_init_globals_core(), so
> +                 * error_report() does not work yet
> +                 */
> +                fprintf(stderr, "--daemonize not supported in this build\n");
>                  exit(EXIT_FAILURE);
>              }
>              break;

Is it worth making error_report() have code for "called in early startup
before monitor was initialized" that falls back to "just print to stderr"?
Having our standard error reporting function not be usable everywhere is
kind of surprising...

-- PMM

