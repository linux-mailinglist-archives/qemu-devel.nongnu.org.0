Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD691424A02
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 00:44:36 +0200 (CEST)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYFeN-0008Hk-AX
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 18:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYFd3-0007Yz-KZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 18:43:13 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYFd2-00085W-Cg
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 18:43:13 -0400
Received: by mail-io1-xd34.google.com with SMTP id 134so4555414iou.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wB2P8hed2rlLuRMqKW2m1CNyPSKIOseKy08zMLQr+Rc=;
 b=Qckaql3uccO9n2hIhbHbYGru4VxuzD/6kBRMdE4/+YA2UHG+L0+3UXH8jXnsWtQKIp
 G+6WYoIFEPAz87NwovMkvksmVkWtlzjV9lQ3kZ7n4cVj2ksBQMWZZTOQ0s7TM7lukUfP
 WzBHWUcbGYDMuAt8I8POO88NF6h05TRfnRqbL4JDz1JIx1cfie+q8+J00bYChY6g2/hP
 kyY1qi08ltyceXwx5NMTg490Nk9zY60+jNJRs9YpVjs9B0sV30HZc1ZwwWzw/s20v0dG
 56e6eCF/g78ZWxsiKucg3isI5cc/VJUJZawEyodB7MxrcfnELEQJCuT5Iv5143HIeohE
 Cmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wB2P8hed2rlLuRMqKW2m1CNyPSKIOseKy08zMLQr+Rc=;
 b=h4mzS1ur3VMrBwBmuVJE6pN9aG7ErpsmGI8q/uiYCGy8tvwVpcfPClInJL/Qm7thwP
 /rkR2XIZasy6kcCqtogTaeDGGxbL1Z1y+S2ivX4/FWRjT0EJNxUFu0yQFxFQ5wNRcc25
 ktahI9gpkOjV0gOwlZ+VJwDAdyC3VaamiAZev8BpDkWuoeAKYHnR8KwoaxZ4CDyJLgqT
 MokpmCFV9CLsnUto81HkgVQk2TEC6rM+9NtglcxwaVLYJAuZjDZnPeWlg6pUvrht2Vhu
 ZdcQst8kUwxG3jNi+PP1QcyYoJp8VtP6tCn8aOJM7N9H4MDDeLQHJHndsBxwNHVnps8D
 A8iw==
X-Gm-Message-State: AOAM530UAOI1auEFkclBa1zvOWzg0NDXKd0r+rMA8TO5b3KMxcgXEm54
 4VeQhKFusrmvtreOzpyLZ0KyWXd9d/FO88KWEJU=
X-Google-Smtp-Source: ABdhPJw3Fr5sTvAh12Zui7HdLwtfN2xFdRXq4GdVWoeFuuKsJt2P9RJkZRGlBCdSjxAZ5nzcsm5sEYLie8hQamwmFL0=
X-Received: by 2002:a02:3407:: with SMTP id x7mr289208jae.18.1633560191201;
 Wed, 06 Oct 2021 15:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
 <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 08:42:45 +1000
Message-ID: <CAKmqyKNCnWSDw8JdRtvZQXaGJ337snkZ6BKboM6DjK2yoX8KBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Use dup_const_tl in orc.b to
 legalise truncation of constant
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 4, 2021 at 7:44 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> We need to use the newly introduced dup_const_tl in orc.b to legalise
> the truncation (to target_long) of the constant generated with dup_const.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, I have applied this.

I squashed it into the original commit to ensure there are no build regressions.

Alistair

