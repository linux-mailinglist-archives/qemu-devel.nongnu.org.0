Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA42E885F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:05:01 +0100 (CET)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvn92-0005MJ-QO
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn6e-0003YU-7g
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:02:33 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn6c-0006hj-S6
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:02:32 -0500
Received: by mail-il1-f171.google.com with SMTP id v3so21733799ilo.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j16Wo5TQqHVNjFksbzxfHz2us1bp7Ok1cINPNfFgoOg=;
 b=ZHWyIqYMitrBiiFyONknJx0WieHIzOXEyc4najRwUvxi122sdpdTPljlOZdGS1cjXD
 mkiDaMo6oNNhYIya4Wn73zDAX8CQ0hXNcnDQRYy3LoUtvjDJrteFXoi89jpkEGsnu9Kq
 QEVsBlwyGwFLuB4+K3yJ0nwIldHHWJZOGBBJIJxj47Hx+ou2Wp7HyFChaltu7edS4a89
 Te7mMp0SXqC2DsQrmoUJnXDLSmY8BjBe4ptmfDuc7vuQrtkQCHOroH8S9NaXrE1GGNfN
 b78VNGpNEU7qDb17+LavntN1UVAxVtGGl/UZc+vwwhK3XIyZrv6QYoPDV9NWWwdLqf9a
 JGlg==
X-Gm-Message-State: AOAM5316vDm4kKyCcesrKH1nb1BqwaWivu5vrzvbTJA4Zhl+o5O0tlra
 jO0mNj7paPokoj8SVta2bejI8/r/yR0=
X-Google-Smtp-Source: ABdhPJzJNyOuX7lvng7EI4ZyC10aPf+28bVQqg6hHm3gTr3SUwDrWaMq6kQ8QwGiHsvIKZyrgddOKQ==
X-Received: by 2002:a92:c04f:: with SMTP id o15mr66037781ilf.31.1609617749944; 
 Sat, 02 Jan 2021 12:02:29 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id c15sm36674844ils.87.2021.01.02.12.02.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:02:29 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id m23so21505950ioy.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:02:29 -0800 (PST)
X-Received: by 2002:a02:6cd4:: with SMTP id w203mr28633258jab.89.1609617749725; 
 Sat, 02 Jan 2021 12:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-11-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-11-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:02:19 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAJK2dW71V+gDN-TaV2Nhx3L_v8onQ_hrZafLUy4qjHKg@mail.gmail.com>
Message-ID: <CA+E+eSAJK2dW71V+gDN-TaV2Nhx3L_v8onQ_hrZafLUy4qjHKg@mail.gmail.com>
Subject: Re: [PATCH v4 10/43] tcg: Adjust tcg_out_call for const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.171; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must change all targets at once, since all must match
> the declaration in tcg.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                    | 2 +-
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  tcg/arm/tcg-target.c.inc     | 2 +-
>  tcg/i386/tcg-target.c.inc    | 4 ++--
>  tcg/mips/tcg-target.c.inc    | 6 +++---
>  tcg/ppc/tcg-target.c.inc     | 8 ++++----
>  tcg/riscv/tcg-target.c.inc   | 6 +++---
>  tcg/s390/tcg-target.c.inc    | 2 +-
>  tcg/sparc/tcg-target.c.inc   | 4 ++--
>  tcg/tci/tcg-target.c.inc     | 2 +-
>  10 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

