Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C157CB6B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:08:37 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVut-00050V-Fv
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVqv-0000ny-Bv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:04:29 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVqs-0003Nj-KL
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:04:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8A661E5C
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 13:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A0FC3411E
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 13:04:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ioIXFEr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658408663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v47kBFe6w8xIh0bf9a+YcDZc4eg8BcrnOgH0uI+MYtQ=;
 b=ioIXFEr8+XGUFLHyQETdsbAUynmjeeVRjl+XqEtsMqOVfCQll8ghG3s6t8YpRQYzIvPtpu
 rrH8sUH1It7xk3QgVcY03qfvTrOgxm9nQPQnQPZ2OmBIUqO00Z2t50UcuwYjxGCeopsJu7
 CiCGMVG8lkjgzRoqVmpD8MSNzK0A0h4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f415fc31
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 21 Jul 2022 13:04:23 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e5so1178787qts.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 06:04:22 -0700 (PDT)
X-Gm-Message-State: AJIora/44v11mXK6p0qwx7Stp6w4sDiT0AWlVIkM+FSklhlOenuZsG1M
 yU3X+SA57oqNWz7qIwcusEEHG9JBEbANAhHTvco=
X-Google-Smtp-Source: AGRyM1tBM+2JapyZhBEKuGuFTQVWPMr3wkJTo9I/Kfu70GqHercmbtlupm6iwklvstGzAoey1JJ47CQZn7isGTtX0Z0=
X-Received: by 2002:a05:622a:1191:b0:31f:106a:670a with SMTP id
 m17-20020a05622a119100b0031f106a670amr2116321qtk.288.1658408661670; Thu, 21
 Jul 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9r8F4-ji6--PikVzSjT-rPiwqkUrK0rBtxtbYNnr8x0Lw@mail.gmail.com>
 <20220721125636.446842-1-Jason@zx2c4.com>
 <50f168a6-1351-dd5d-67f0-e222f9547071@redhat.com>
In-Reply-To: <50f168a6-1351-dd5d-67f0-e222f9547071@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jul 2022 15:04:10 +0200
X-Gmail-Original-Message-ID: <CAHmME9rOHHy94-yajn2vTs-cBHUq2w=Zds8GAqK-XobWYRCayQ@mail.gmail.com>
Message-ID: <CAHmME9rOHHy94-yajn2vTs-cBHUq2w=Zds8GAqK-XobWYRCayQ@mail.gmail.com>
Subject: Re: [PATCH v7] hw/i386: pass RNG seed via setup_data entry
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Paolo,

On Thu, Jul 21, 2022 at 3:00 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 7/21/22 14:56, Jason A. Donenfeld wrote:
> > Tiny machines optimized for fast boot time generally don't use EFI,
> > which means a random seed has to be supplied some other way. For this
> > purpose, Linux (=E2=89=A55.20) supports passing a seed in the setup_dat=
a table
> > with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> > specialized bootloaders. The linked commit shows the upstream kernel
> > implementation.
> >
> > At Paolo's request, we don't pass these to versioned machine types =E2=
=89=A47.0.
> >
> > Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
> > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Eduardo Habkost <eduardo@habkost.net>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> LGTM.

Thanks for the Ack. Do you want to pick this up or will Michael?

Also, I assume this now is the working patch, rather than your 4
parter that potentially bifurcates this discussion?

Jason

