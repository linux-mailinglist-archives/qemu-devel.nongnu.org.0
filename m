Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13043F1CF6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:38:22 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGk7a-0000XN-0Q
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk4L-0005hz-3G
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:35:01 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk4H-0003RG-S4
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:35:00 -0400
Received: by mail-ej1-x634.google.com with SMTP id gr13so13785202ejb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=18Tb7MoSIA1ImV1Fqhg/yKHgkrLDyZjZl15Ve8rcVEk=;
 b=doLSY6vd58XBe7FTbRTTF52Z7YJ/X24vcz+GY26yUM8Vm05VGWGPq6juZPTZ0AEUCn
 V5OIC+bqVge/+xQapzze/lcEM630vcIXbmxI5lYr3JdSMZdJV4G6mpmmpEmE0U7n6JdU
 YnJw9TQuEQZ3r7IKcEE7dRMPrhVczxerVJPb6BdoO29aPJm5XCudHx7sDhcLouuGmh8b
 3JzgQlPhURZ+9WWpweUg8Xbstj1untC+0bwIGW4wPsASS0vwDgoooBGbpuYSF1Gc1AfF
 PCZjXrXOhRX2wwul4vfzLs7DpLB5+5k0RN8D6NwbR4EXAO3hr+85MZ9YVAQCOPfH+xHX
 TXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=18Tb7MoSIA1ImV1Fqhg/yKHgkrLDyZjZl15Ve8rcVEk=;
 b=eszyILZeuDWFY+0miv4ZV5aNc+7eofr/TXiHCjvRbi8bRDWmO0sYP9o7HZBk59AYLv
 GR4MDMcizhjos58xtbNh7kxq9cGx6zX4xb0nhXM3vNj0v6UbPnU7dagya1F5+fr0BM99
 lgJnMoPqUhzzlEQJd02cUYVdXwzWnTW4+nQPf+zpwybn5zGV4kw0/nmqGELapEfVmsiS
 myUdFTUR07r2o8ssQqk27gNij/dbJrNpeCx4T9fPbG6IzxXs/CoEXIzFfPsFw6C87OQz
 +1ebog0wiBdmt6GynolWVvYsD+v73svkma0z4AaFyvV+yiEBIMO0rDCtUIM64eZDztEF
 0OAQ==
X-Gm-Message-State: AOAM531C3v2gaDrJ4Kak1awwIYrfW+0IEfWyWOK5ReqjBezBHDUUW7Ut
 Gg98UzIhqXyKMjWqWXdvxiIxLugup2pprOqM/BKqYGMeBB4=
X-Google-Smtp-Source: ABdhPJxKrh09nVGTM+tt08WXvI2mMWIoyC3vdVzy2mIK3p9z3zFgkx0PZOOCSE0HxnyA+mwiNookVb4oQP/y+91ORtY=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16802051ejn.56.1629387294792; 
 Thu, 19 Aug 2021 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-9-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:34:08 +0100
Message-ID: <CAFEAcA9+ztfx1Cti_3qPenx9+dpXKH5NOpvt6_=Om-5T6pAsfQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/66] target/mips: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/cpu_loop.c        | 20 ++++++++++++++++----
>  target/mips/cpu.c                 |  2 +-
>  target/mips/tcg/op_helper.c       |  3 +--
>  target/mips/tcg/user/tlb_helper.c | 23 +++++++++++------------
>  4 files changed, 29 insertions(+), 19 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

