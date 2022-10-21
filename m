Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B3607BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 18:08:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oluSl-0002gO-4b; Fri, 21 Oct 2022 12:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSJ-0002YK-CU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:01:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluS7-0005U0-Qe
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:01:01 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f23so2741512plr.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z3+lgBUOUMk0VTZfcka40Z4LyTbdgXQZO/4d+Y/c9Fg=;
 b=eY67rfIukKseMquAziFC8G/7a48d7mbOgo3TQ/JZOPZrDRFArMoNvnihQ5MUizyvBD
 zODjFyLQg2+pyQDTKoBrsGq0HmQ8owOr7R34ic3puZBpd4d7RBp1MA0xAf2Vg8YzZgM0
 uNbi463Q5kc9Yf/1O8O45Gg8fyd9v36hlqWbSrHb+vBc/4yogVsyyrgSTw9guHK8ps8t
 DZJ+7M+sgN3wcObvpV4nVIy1uVOmAyGonyFojwv7MkSpRutdF3zF02e9M3HB6Wne9dFR
 mZZeaHYU6/cYOWkl7I1krtL9dCK8PN/slRf8E1sYciZI/kdE34kKGX0PZfakfJjx+eO8
 9SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3+lgBUOUMk0VTZfcka40Z4LyTbdgXQZO/4d+Y/c9Fg=;
 b=nTAqJvdOwiW8uV2EN2kT868A4iGzdUayF2GQROw//xZ1UNl5f6xzCZIY1TWJr6xfsf
 GLw8tNki0jPmgIegG9MxV+COshXMw+Wq0r0PW5vIEkBN7zBPD2yDTGlNYnaT3zNFim1w
 v1c35jKndoiPwVPnUj1moY1gVAjYrU2E1nYS7Vxo+86SMiduV+t8sKUPWPErd5qTyyXh
 05676exvXlwhWRIByAzQvHBctifm/g8WRcQTAPGa6oO/83/ZCtNrbSWI6y+IjHfHT6vy
 so4Q8VHES/mujp1TbvoHOtytlKSNDWpWh+i9Syd+XKWHT0i7gDUgjvveyCvREcCj9I+Q
 uQYg==
X-Gm-Message-State: ACrzQf1h33kT7+Bi8jjdVJO2wgbHm13AAIoZNKGA3cf6lJ6GX0irDq29
 081y4/C4a9f2oJiP5gc1pH7XAhaHcXgx7kLil6f0iA==
X-Google-Smtp-Source: AMsMyM5vnSUXXxCu6Q2oEX9BMGsnPN/oXhXoueunH3igeNLEvzkohffewajcyYCgAR+362NdGQR0y6TsrFBZUhjRGD4=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr19290833pll.19.1666368053045; Fri, 21
 Oct 2022 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
In-Reply-To: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 17:00:41 +0100
Message-ID: <CAFEAcA-H+OW+sMTTsb-sOKt_Gm0Fhg4iTbGHUYfVysNDqeYG=w@mail.gmail.com>
Subject: Re: [BUG] AArch64 boot hang with -icount and -smp >1 (iothread
 locking issue?)
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Oct 2022 at 16:48, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> Hello,
>
> I am encountering one or more bugs when using -icount and -smp >1 that I am
> attempting to sort out. My current theory is that it is an iothread locking
> issue.

Weird coincidence, that is a bug that's been in the tree for months
but was only reported to me earlier this week. Try reverting
commit a82fd5a4ec24d923ff1e -- that should fix it.

https://lore.kernel.org/qemu-devel/CAFEAcA_i8x00hD-4XX18ySLNbCB6ds1-DSazVb4yDnF8skjd9A@mail.gmail.com/
has the explanation.

thanks
-- PMM

