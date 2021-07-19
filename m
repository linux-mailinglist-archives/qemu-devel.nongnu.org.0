Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC253CD4AA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:22:46 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SIH-00085D-9w
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SGA-0006Ap-5s
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:20:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SG7-0007oy-DA
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:20:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id h2so23687942edt.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w4iFpb2ewXSYAkA44+x0E8n76DCkPL6UDew1d5YywlU=;
 b=BJcrpljcfqegzkXe9xTZOz9bW3tYYR0SWrbe8QNRbhLhgD/+x20gATY2yjozF2bnw1
 SNOuZ1LNYc1rWZkCJwSal7j2vrzIzNy7b86quJxGbqW2ImfinEOdRb2aODI9keusvweO
 BAvr1nE/wEjZLvK92/caqJZ8fhmtU3XhCAW3m2GEzJ5yRn2PtQkC3xYHzKS51GxNp7JR
 EjZcbUr1tuLCmVbWMvX74KiC6GCkecJkjZ74irAKxu0WGW6xZ2jkxdJIFcDRzzk7C2AR
 zxrPGFBPIKYh90Dm38q6Di3S2q6TQH6gnXaiWkNUDj17lN/3RflkuEBgSvPCgysFpkvn
 hRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w4iFpb2ewXSYAkA44+x0E8n76DCkPL6UDew1d5YywlU=;
 b=aAgwDwp72mueJaFewc8odE7/pIMCz7WyqG13q3Hpf/cRpFjsaodStw0eUF+tdoc3hi
 G9SS/UJmjal/zElWHm/IdhvEF7eU+YNHLurVf8xQMXoTAgjsixzImRHtEtyCJSRsIue1
 BCjKDPXgy04BcxrcB23Qg8hDIA79iwhIXWerIytzP2f6/vgeykwq0R6uzGmxB395ZPt2
 wMjAkfwidC4z0jnsEJYhMB2dsCTzxIzIgudimIDGA6QIkudhc9/NEfwtTD8/iScv1Exf
 rsXHKKqJtBasLDjp3FZu4jOxHD4aUFY/31Oi3z9k+ixlq7FPPr9LU5rM+wzfXrhaHWAK
 P/dQ==
X-Gm-Message-State: AOAM533M0d+6Qa1ys4bIWV/GHaTQApK6LF6rjHcK4yh8YKIkQE8+X9nq
 PzePDSkeCokLCcymjhN2XPeofX3k0qOC3jVSPS6xgQ==
X-Google-Smtp-Source: ABdhPJyapwjzmbFVla6EhgPodImQlz2Cdvurjgbzlbz5JibpYRGNUiwjSLVL3tXhTiaJQOO0PZjj4HrLQYPuTmAjlDk=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr33538555eds.204.1626697229593; 
 Mon, 19 Jul 2021 05:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-7-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:19:49 +0100
Message-ID: <CAFEAcA_sTGQQYc+RgShg=h_S0F44x-xtGCxTNqQXHCxMi1ZFkw@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] accel/tcg: Fold EXTRA_ARGS into atomic_template.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All instances of EXTRA_ARGS are now identical.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h | 36 ++++++++++++++++++++----------------
>  accel/tcg/cputlb.c          |  1 -
>  accel/tcg/user-exec.c       |  1 -
>  3 files changed, 20 insertions(+), 18 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

