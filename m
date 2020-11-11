Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F592AF5C3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:06:27 +0100 (CET)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsde-0007vC-96
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsY6-00058i-71
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:00:42 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsY3-0001jQ-48
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:00:41 -0500
Received: by mail-ej1-x641.google.com with SMTP id 7so3475493ejm.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSpQgY8RPpCUDE0FaB35TKt9/mG17cZNz3XZmf1OAmI=;
 b=McrajkfRsp2Q7X6qJqwxIg0MdvbqROIILOP9z5/3hRg9GRVzFCJVNovUar+gvutmLl
 Xdg6782Y6+dzmmKhv1wI73FPzSJyilaHI9IA7Jukp0BcsR0hOg/U8jScJJieaqc6GDzS
 2siXpEzkdKoXBg+16JJuII3Wia6sfImbFdc1seuAwd9ylQ5CupBz8FiFK51GBQxhieCg
 LPHIj7WNbR6fmwCqr4emQueMcutUW2py8J5Fh2qBXdjukq4DJhuEYV0SZsSRj9KmVrZK
 5GdPprU6sHPAW+nUhERswSz2XBreSDxFca2YcGTl6OB/g6hhngBFCJD140QYzQ2OxjYm
 6hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSpQgY8RPpCUDE0FaB35TKt9/mG17cZNz3XZmf1OAmI=;
 b=TROYS1W+vQBilj8P3Zydzx6GLHCHVQO2KeDfWCI0e5S+I4H0kq90MVonAxAzqSIguB
 zN+XU886peNRDfU2zU/o0lwjVGQaE2wCzrE5uYJ6w+W2m46Gzn/muqDXI8OwjkWyHJdU
 VollWN50jEIYnHJsO6TO/j5u04V1BNdsHtCO6RfK4S6rR/hZJj01+2M4F2FjFUYaONGV
 mrf6cnILYfUXpsqPtMyVEuzsNm29efZxQXW4yQDMWRljJMG0jsIALpsvZw33iVBlGUf9
 w5IAFdwWR5YSSC+FrCHrPiULuvP/uVn3W/2zvVhwmGdDqQf8UirzhgbtcqR8GUZeQutP
 AaNQ==
X-Gm-Message-State: AOAM533t06jh2rcYHhiuc5QsrUV4NqeXR86VZzw2xXnzAIwMEMUvJOc6
 4+rKt0+ZRoGUNFX92Xa1OF96J2mOrMB061UtBdeXnQ==
X-Google-Smtp-Source: ABdhPJwPf4k61GADIjEDYi6y1MS+QIuwqteBsT3fZAi9yZ3aLKsPB77Xdss6nl3H+Xr2xPrOsWiL04wJYHJB/9Z7gXU=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr16146938ejq.407.1605110437117; 
 Wed, 11 Nov 2020 08:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20201111143440.112763-1-drjones@redhat.com>
 <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
In-Reply-To: <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 16:00:25 +0000
Message-ID: <CAFEAcA9pYcXZ9LF=76N1OxF=UgYkiF+Z549vq9xWpS52qV7cLg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
To: Miroslav Rezanina <mrezanin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 15:05, Miroslav Rezanina <mrezanin@redhat.com> wrote:
>
> ----- Original Message -----
> > From: "Andrew Jones" <drjones@redhat.com>
> > To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> > Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com, "Miroslav Rezanina" <mrezanin@redhat.com>
> > Sent: Wednesday, November 11, 2020 3:34:40 PM
> > Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> >
> > The removal of the selection of A15MPCORE from ARM_VIRT also
> > removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.

>
> Problems with missing dependencies solved by this patch.
>
> Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

This is the second of this kind of "missing select" bug I've
seen recently. I don't suppose there's some kind of testing
we could add to 'make check' that automatically catches them?

thanks
-- PMM

