Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD262500C8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 17:20:56 +0200 (CEST)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAEHH-00018I-Hg
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 11:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAEGK-0000gV-Sr
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:19:56 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:41037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAEGJ-0002rv-3y
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:19:56 -0400
Received: by mail-ej1-x642.google.com with SMTP id b17so4123690ejq.8
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vgGUKNCRiiB/LIaT6+hiI9qaLZZspUDzP5zz8bp0l8Q=;
 b=gcOxDxQ/BEq3dHnjvCljZ6ap0dsbZzp9QzzEKhd1Z1uapN/RzgM0+ZLX5cr7ob+WeR
 VDU/QPL572nJCKfgohsybffTD6VzZloTJDZL6SirkdboDDjb7a/SlUUInedsSipExODZ
 TJMyVh5dHqQGajYUwtAxKPNNwQCh8FDEgCj/5GXsSaGdNcgVuB8dZiQtEpyli7lpErYx
 GgANBdBnV7KppzwlkrbTKPzHcc/IzVVr4K8pcmiMCkXCG48avML+ztvXTeNnc50TIVjI
 hId8NxCLARdHCMbDCNai2+IujqwSfWSdU/g4+8+burR7FwjxW786aaFdtgvv0O7dIpj/
 3zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vgGUKNCRiiB/LIaT6+hiI9qaLZZspUDzP5zz8bp0l8Q=;
 b=WyBEE5ztnR9GGrXdwyqmmDVFHJsjGWtSpnhaW7kqv2IkakEqNp3XgxeqLA0O/4x4ee
 JBDKE1TCaxHbjSPezi6cWXHvLQVKGY2i1arlXfSv/KYU/ltlG6iuRsQH79qznKxj6pO2
 FiATWO1kf6JTZ9HO+5TvMm6j71EStVUj/jxrKqCZwshazNGb4FwTCk4zVyl3noFgnjjT
 9J4PSBXasgzQjIXQfC9cPMoeIz/Hvqh6rq5PBS8LoPhvPbDJJZRfk0/TImbGK0sQqxAQ
 NYvs1wxb9Z/acIhXnSFIDIeXpeIhqH8EvRMkNepjzaD4cqbypIwEJ/ACnVHGjEii7aRq
 S12Q==
X-Gm-Message-State: AOAM53044dxj5BgD1k2xZ5oGFjWokwzXqk+Qwp3ewwgHs95JV/WVDuO7
 RPdSDxxN49ws9ehsHEHQW3/POcdE22MLwAAVVunxhQ==
X-Google-Smtp-Source: ABdhPJxJlXP2zyTDD2nVzo01wuW/B0cK4X9zJWX55z7ijDr8dJlLR6rgPJT6InvDSiJV8IhamQQLLxu6HWQTOlfJjOI=
X-Received: by 2002:a17:906:68da:: with SMTP id
 y26mr5884217ejr.250.1598282393097; 
 Mon, 24 Aug 2020 08:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200806130340.17316-1-f4bug@amsat.org>
 <bc283986-6f08-fb1c-2219-9b4af64eaaa0@amsat.org>
In-Reply-To: <bc283986-6f08-fb1c-2219-9b4af64eaaa0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 16:19:41 +0100
Message-ID: <CAFEAcA_XP+XbsfE3XhyrB=yO7iaz69j_rydanao1abVz8jaPKg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 0/4] hw/char/serial: Use the Clock API to feed the
 UART reference clock
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Aug 2020 at 21:00, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/6/20 3:03 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > This series improve tracing of multiple UART device in the same
> > chipset, and allow to use the Clock API to feed each device with
> > an (updatable) input clock.
> >
> > Based-on: <20200730165900.7030-1-philmd@redhat.com>
> > "hw/char: Remove TYPE_SERIAL_IO"
> >
> > Philippe Mathieu-Daud=C3=A9 (4):
> >   hw/char/serial: Replace commented DPRINTF() by trace event
> >   hw/char/serial: Remove old DEBUG_SERIAL commented code
> >   hw/char/serial: Let SerialState have an 'id' field
> >   hw/char/serial: Use the Clock API to feed the UART reference clock
> >
> >  include/hw/char/serial.h |  4 +++
> >  hw/char/serial.c         | 55 +++++++++++++++++++++++-----------------
> >  hw/char/trace-events     |  5 ++--
> >  3 files changed, 39 insertions(+), 25 deletions(-)
> >
>
> ping? Should I resend with the typo from patch 4 fixed?

Which tree are you expecting the patches to go in via ?

thanks
-- PMM

