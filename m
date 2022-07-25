Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109D57FF81
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:06:49 +0200 (CEST)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxnM-0008E3-CC
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxl3-0005TW-EK
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:04:25 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxl1-00068g-F2
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:04:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j195so539455ybj.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjDXRmPf8hQtmla1dqHis+57C0Y7VxCvMTPZFieXnOw=;
 b=AJ0Pjru1Hpr305aIg6IOP434WZLWXK7yIr8u0//sB1G9isDnriYi1zFcEbre5KtGAL
 FRJINe5eBDPM48REPyKaoVi3ftjF+tTK22Oymd/B/lYfiOhJGZjrA2Iz2sbUcPCEbwPE
 QqYdp43AsXhjDhHm+rPPQTWIzuS2qU6PqwGxZeHSZCPo/6c74GTRLjpCN7QmZwgtRMAX
 rW50yuON5DvKIuGmyK6w6squkRSPM7WOI6M8g2RQSp08tsfj8pmuZYVBYQcdmJzkihKb
 jmxNTlFOTTfvgGXaK71lIusgzecIOI0n1dGTBHuc0529L0xCJENgueQPXnz7QeA/TCMc
 0mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjDXRmPf8hQtmla1dqHis+57C0Y7VxCvMTPZFieXnOw=;
 b=UqrH0uKgxtgLrJjPE1GNTmgw7lEgmMJ4INxNFq3BJydKm4M3V83WsG8kNB8iJxg+y2
 ZkdogwUXiZ4HhO5ETCYpgXKnDHF/6jnv3kBc8fn4++rkMLVmAf0brpgQfNt/ZLXJX9Qx
 tpfSdRycEIm3Na5AHePI67gD0A20wfGehBUDroLAaml0O+Mkb3gaDNTKD8BfQk6Bflfl
 jFv8GriKVl90aK0PAlniBzuiG0qhfdmYXxdB36IDlIZU49dZ71GNydIgwfrBwl9C0rYr
 O7VKnt5j/nyUdK/on3lO/8+kftMgVcP8JkyqrLOI4bRXFvpbnLShPzZZrM9I66T759rQ
 Egyg==
X-Gm-Message-State: AJIora/1o5iDrTh1u8o/XC+FxUcjAvPnY609yiQ/GFJzCSaAupYLUMB+
 RJvfnn6pX7CudpKjgOcJ8G+CcmsOEUkIePpyADt8Vg==
X-Google-Smtp-Source: AGRyM1vvn5cr55zAB2VGddolZEj5oJbu1/3xZ7ESW9QXb38ldGTOwon9voaM3hmmfIPwQYpqmD/HHGLwUTP4ksQbZ+M=
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr8835003ybf.67.1658754261963; Mon, 25 Jul
 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220723111228.8611-1-alanjian85@outlook.com>
In-Reply-To: <20220723111228.8611-1-alanjian85@outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 14:03:42 +0100
Message-ID: <CAFEAcA_7RU8KH7GJxmSx9qCB+nkFkw2hQKDtfSABFc5aXa-3Fg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: Fix framebuffer allocation address
To: alanjian85 <alanjian85@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 alanjian85 <alanjian85@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Sat, 23 Jul 2022 at 12:15, alanjian85 <alanjian85@gmail.com> wrote:
>
> This patch fixes the dedicated framebuffer mailbox interface(marked as
> deprecated in official docs, but can still be fixed for emulation purposes)
> by removing unneeded offset to make it works like buffer allocate tag in
> bcm2835_property interface[1], some baremetal applications like the
> Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
> before this patch.
>
> [1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
> [2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html
>
> Signed-off-by: alanjian85 <alanjian85@outlook.com>

Thanks for this patch. Our submission rules require a full
personal name in the Signed-off-by line, not just a username.
We can't take the patch without this, I'm afraid.

> ---
>  hw/display/bcm2835_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Is there any difference between this patch and the one you
sent a few days previously?

https://patchew.org/QEMU/20220721081544.38228-1-alanjian85@outlook.com/

Generally if you're sending an updated version of patch it's helpful
to mark it as "[PATCH v2]" or whatever, and to include a note below
the '---' line that says what the changes are.

thanks
-- PMM

