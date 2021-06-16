Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237453A95E3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:18:41 +0200 (CEST)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRh2-0003KD-6J
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ltRed-0000an-Sd; Wed, 16 Jun 2021 05:16:11 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ltRea-00064t-Je; Wed, 16 Jun 2021 05:16:11 -0400
Received: by mail-yb1-xb35.google.com with SMTP id b13so2045539ybk.4;
 Wed, 16 Jun 2021 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RKMxNqJlp/wL3Ci3OVZFZonSOCKW2U/aI92g/aE7M8E=;
 b=labNN5+L4lKIxFE2641zp2JcsqMHhmq/8FYTuo92GXy/aJjcOra8tFQDqIYrZQUiPD
 D4ee+jwQQdp5OsZoBUD04Kl8YsMECgWZjp5LQ2/CTAe1CTxUTxH8knrYuA1GIvwHotCT
 v0aDgGHEmYEgcnmLpuc5kyMFN324pZZ1gNgoEmjuQxKP1tt848cG/xUFpGoW9gJKM4Gj
 ZV05riwAgSnsvkWPeHH7Ge98ZaDxwdXhfTrEE9b/dfBr1H4dh2B3oUbIhohWhOFBHm84
 GsFl0NRQlDiOlkZJWo00pyDJHYDdpQlJYzuuWNwUnzhT52e51eb/mW7fBu++ZXFjScwD
 CZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RKMxNqJlp/wL3Ci3OVZFZonSOCKW2U/aI92g/aE7M8E=;
 b=HndRFPdiz/krZTQqe+6x32FyeE14muc6WdNQwk4FdV8fPAP4ydGTxD1dSHaiB8SqvI
 Af57dAAxbHr/P7rJlMIY93bd2a86TWz69L3/z+fP69XcoeEgtxUjMfSspcIYCm5aPuFy
 YsW74Nw2sbGEzvvOdeVeFGQ+sHlGV2owvAYhfo/8td4lo+NHdMnWrRywxChDTr5yE426
 zsIY1c5zWYxysFj4BbwdU0lpoIxb4kcUUrv3kVoEYCzUOfqpOfviEwQfg5p9zD0VHhBO
 eTqWk5tUUGdGc0KNO3n5KXgxU1b/YBeQxtB0EoC7Np624EK5OBZrHgV6n9qS2CBvva4B
 PC5g==
X-Gm-Message-State: AOAM532kWnCFT1VVKmBmhWk/WBWUAdxcaX5hRoK/arHAmuiSFUnWB9TD
 CgOwv8Fu3XIkKVj9ljyKTHJl6ddHOjR71MTjoXrqLGXQYKM=
X-Google-Smtp-Source: ABdhPJzRj7OAAIsp1JIWtFxrawafQDYfbnnm+IMSOGj2TjvHrljS3wuYfRhaSFuRxRZrvxbEHlrJmiJHJwtA0DEg3bg=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr4855158ybn.152.1623834967340; 
 Wed, 16 Jun 2021 02:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210616064334.53398-1-lukas.juenger@greensocs.com>
 <20210616064334.53398-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210616064334.53398-3-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Jun 2021 17:15:56 +0800
Message-ID: <CAEUhbmVuDEv6fcAQRrQAB5rtxQFhLuC0Gi=+S9ok+hp-KJ=9MA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hw/char: QOMify sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 mark.burton@greensocs.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 2:44 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> This QOMifies the SiFive UART model. Migration and reset have been
> implemented.
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  include/hw/char/sifive_uart.h |  11 ++--
>  hw/char/sifive_uart.c         | 114 +++++++++++++++++++++++++++++++---
>  2 files changed, 109 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

