Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CF3BF735
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:06:15 +0200 (CEST)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Pz4-0004uf-49
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Pv1-0001UE-B4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:02:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Pux-0005dP-UF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:02:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id s15so7393735edt.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2xjEtS9XFA46j+PnwJ2As4MyqtHrw657zveARqgVb0=;
 b=jgLGw+EMKU0ZnoQdI+3CFClH0YmXIQ+U4G1SxaOIZZ9qnI7GH1i+ohre7i/IY08WZ3
 L2+rxbdL0eNoDCEkazSc5IhN6mkS8LDn6l/+0piM6LaSwvbUsBDc7GecepPGAOiRhxmI
 rBLaSDivulfqhM86WmzH5X2VIpzGgZPJaaD8D4e/WmADNvgkNFICBbmn2lKQebCjV2Ej
 Ql1dRSkWHcky2r5I3ZmX7KiOW2xPtQLoVy9hSQ5TOGFbQUfRsqfNWOsefipFlniRvYsL
 5qHBqJ2mdwzynbbvDzwVj3MEwwgbaXkSL0kuibh2rE4ZXaSp4fBWXtq5/yTf10nBngKU
 VNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2xjEtS9XFA46j+PnwJ2As4MyqtHrw657zveARqgVb0=;
 b=S9sJUEJLCWHipSnKOe1geWHHLHIRSX1uJRkGweO1eCOOEDQMsymK0ifZ0SCMcKZ1t6
 RF7iyUIzQpSHsUjpZCzJWFQ649963JCDY1P0h8OLGVVZyspkfxG9f/u6MvWTQ9G922KJ
 /f1UGUfoM8WQWweoioMn/swaFe2JybGJpo+DM6oapCaOPj/n6fj2Yp+7OsBRyiRukqv8
 sqal7xbE7xyGXxiVmgL7Dbe85DZPa2czLaB/yEjrbWQDorJbv3tSE1AJonek9XSXW0al
 GmeGi86dCmeOXbmjFKabqdmbGBMJYFd5yljmqtN/4gcb2Ly3jS0VCWRrITUrgPKthWrA
 9zeA==
X-Gm-Message-State: AOAM5330tnmaXEQMDt0bAg93L3VG9ht6jlMxB4BdC7cVzDNKK7ge4uP0
 bhT+WhY1eJMyZcLpbwyCWcXEwNGhk/tF1koeYyoeUA==
X-Google-Smtp-Source: ABdhPJwHuzOuyHf7DCvW34gdi2twnPSDxmNYfHMKUV/KHpmQdczUFq68P9fDjEhWZECZcKaVX30yyBtbMazDDcR9cxY=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr35698510edt.100.1625734918726; 
 Thu, 08 Jul 2021 02:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210708054601.9484-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210708054601.9484-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:01:20 +0100
Message-ID: <CAFEAcA9tjQXMpfJ9MfDWXLOeezh8hfEaDpc0girQ7hEn2XK_Ww@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not perform unsafe cast of argv
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 06:46, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 9f72844b079..68a6302184a 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1888,12 +1888,12 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>      exit(status);
>  }
>
> -int main (int argc, const char * argv[]) {
> +int main (int argc, char **argv) {
>      QemuThread thread;
>
>      COCOA_DEBUG("Entered main()\n");
>      gArgc = argc;
> -    gArgv = (char **)argv;
> +    gArgv = argv;
>
>      qemu_sem_init(&display_init_sem, 0);
>      qemu_sem_init(&app_started_sem, 0);
> --
> 2.30.1 (Apple Git-130)

Why do you consider this cast "unsafe" ? If it's unsafe, then
all we've done is move the unsafety from the cast upwards to the
function prototype. I think what we're really doing here is fixing
the broken prototype of 'main', which should not have 'const'
because that's not how the C standard defines it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
for the code change; you might want to adjust the commit message.

thanks
-- PMM

