Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13344C2A07
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:58:37 +0100 (CET)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBpT-0006og-PH
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:58:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBnv-0005Pu-NC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:56:59 -0500
Received: from [2607:f8b0:4864:20::b30] (port=39579
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBnu-0006jT-34
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:56:59 -0500
Received: by mail-yb1-xb30.google.com with SMTP id p19so2968173ybc.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V+mteYp8smG7CK1pUA3yB84tAiGlARxyitiYI39ACTk=;
 b=E+lGKwiw0ux37NgWg8fBqr/RoegK8xjMFa8Mv8pxbOKJpkn9Z4MqConobghQdXxgi8
 yJ3LC8/ApvR+eaLV4n9ZvfoGqfktcM6KjkROz3asZeZZR4iWprHsFqtk1NXEE5ynE49/
 oQzIHuOjQI/Bz20k0xaw1bOWfI1hKKCXL9WIRxNmXfr0yVD3i6EwEkcOsxKYm5EUpYL0
 7iqACZvazpsaRnbb/Yo99hWyeWMoOBRt6CZpPpkeUZndA5GzT5KwQr+GezS1zffeqgCf
 IF6Uu9Mx4EbqQRRfuxpN+/CE9UBOkDteoHZ749utPp6n1u6aszyhoQ2MJp7DqJ0u+qdC
 FaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V+mteYp8smG7CK1pUA3yB84tAiGlARxyitiYI39ACTk=;
 b=CLSAf5WJN9jxmoHbKLCLjqlMWEnlySLjMwqNgresWCvyjeQVmeUhc5dHOYsW5382pd
 ZR5MLD/aCUi8NJ4ueSxAX2pL5E3YiNmvDWZDi1UKnye1nTg5kwB/c+aYIovuOh+G4Grn
 //0c4Y0wpdmvyGpOwaxnOgw4ry858+cguy+tdDrrFs2Q0ATdKd55Mj/Y5rPXKofzVfv8
 bFMd8dUWCZ6QKQ+gFdZ2AaSE+0JET6ZcLWIJF3eDelE2AyKo1STNGyHY6EP80kzwfskW
 A077pks7EpjV2X5BUWASPkrxu/nYAOFjaNAQQgRdYqeHQv/+N9M3EGgPqdsKgI2RYZCL
 16Ag==
X-Gm-Message-State: AOAM533zRKXF0lDYhiqpYStpNTuRpmumAmx76raJpmee2R6aoCFiHld5
 0c9TCeuGpYckn78BpvETI8zO22zIBPxYlTC/PTCxCQ==
X-Google-Smtp-Source: ABdhPJwalkXjn7OPpxQzOMZJEVKXJoYRjvfpP2Ep4dz0IAUONZV0pcuWNn44KpcXueCbTWVQmfesxS2uS0H/hZNjrDU=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr1873180ybc.85.1645700216699; Thu, 24
 Feb 2022 02:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20220202164533.1283668-1-venture@google.com>
In-Reply-To: <20220202164533.1283668-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 10:56:45 +0000
Message-ID: <CAFEAcA8gV5_cAyh9UVuN06tj5+0QietF-aDMAbvY-eW3kmFy0A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i2c: flatten pca954x mux device
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, cminyard@mvista.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 17:57, Patrick Venture <venture@google.com> wrote:
>
> Previously this device created N subdevices which each owned an i2c bus.
> Now this device simply owns the N i2c busses directly.
>
> Tested: Verified devices behind mux are still accessible via qmp and i2c
> from within an arm32 SoC.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: explicitly create an incrementing name for the i2c busses (channels).
> ---

Applied to target-arm.next, thanks.

Apologies for not picking this up earlier, the v2 got lost in the
side-conversation about spam filtering. (Blame gmail for not
doing email threading properly if you like :-))

-- PMM

