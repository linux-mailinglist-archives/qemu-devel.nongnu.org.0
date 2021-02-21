Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC1320B52
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:21:23 +0100 (CET)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqXy-0004zy-7T
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDqWT-0003ws-OP
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 10:19:49 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDqWQ-0004br-MI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 10:19:49 -0500
Received: by mail-ed1-x52e.google.com with SMTP id q10so18768927edt.7
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3OO76eD9GG8cyNnTCv/4npaCM8tdHppYxn/MW39wtA=;
 b=oEyNc5lk0HpyeyCCI5az2IfK5H+d6yA1O9LI4KYjf0lzmer6gNHa2P9rtacJmMO7g2
 QyxNP5GD5IXK5OJ6yxPAxtU5tLpVFjvvEiouXunmmyMSr21SkEmW2kKXlwrnA4jqvQx0
 cG4zn1fqodhuz92JTdUS2o5rX6cEDtJhZUAj9jvEY98LZF5vIb0B0kCfUkbCA8vko2gL
 eXdPA1dduTDIti6TeBsoVPn7rd27uHaHjjqhEf9TMcVmvQi5agI3AAvDtvTf43il4BxW
 nastp8lgKOeM8DkLi7cT7Q76ANzSoqz850VCyVrvyopPIz+Bi0rIJ2OTcsZuJPmbsCtO
 m7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3OO76eD9GG8cyNnTCv/4npaCM8tdHppYxn/MW39wtA=;
 b=SSmNLy0QbFVtLSx5ATmXrpQc+nikhr9WXcpmgULQUHmZy4SaDFsIt5qCtXEzBb99oz
 w4gG18Ry3KWQ2nOMDa4DOEbnlDILlK8glHv3ETy8U3EHOEopQ0UsT7yt6wDnahHechvs
 uho5N0uaB/AqHlUX/ik+yW1urjo1g9jXT06A+tmc3XeBipXztVWGe0Pzk2jljMQMIbS/
 ItSN9bplxDVIHAF8ZqHwv0Uh1/VjYBHW5B7BbFkUquQQ/M6Hcwpsyt4p5WOJWWMx9CLe
 tmi8mU9VGKEqXDC0Tui7NEk8ZjVC/HrpcsVAY+DAPV2iZHlFMTejDMnRkaxHMRkI99yx
 G9Nw==
X-Gm-Message-State: AOAM531JPHje2u2i/R2zusNUi4uPcyUoeLsTJItLqifvh8TIUt/bDI2K
 gxuKBkzRWLmYyaxNy+VZup1RCMWChGJTiNaQEuj8Bw==
X-Google-Smtp-Source: ABdhPJzi2fS5h976bQr1VW6wGadZ5j3g2clcMWRJ46mBQHdsEEGvvOp8K0dJZFzPV2D+7B3ZAL5n5T+z8Wdfn6NdOYQ=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr19079078edc.146.1613920784908; 
 Sun, 21 Feb 2021 07:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20210221150430.6223-1-zpmarvel@gmail.com>
In-Reply-To: <20210221150430.6223-1-zpmarvel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 15:19:33 +0000
Message-ID: <CAFEAcA8BB=ka9nPv9-okHhHwXOAbfbaXs9OFn4bNkbU+b-H+FQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: fix receiving multiple chars
To: Zack Marvel <zpmarvel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 15:04, Zack Marvel <zpmarvel@gmail.com> wrote:
>
> When using the GTK UI with libvte, multicharacter keystrokes are not
> sent correctly (such as arrow keys). This is not an issue for e.g. the
> SDL UI because qemu_chr_be_write is called with len=1 for each character
> (SDL sends more than once keystroke).
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1407808
>
> Signed-off-by: Zack Marvel <zpmarvel@gmail.com>

> @@ -300,7 +300,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
>
>  static void pl011_receive(void *opaque, const uint8_t *buf, int size)
>  {
> -    pl011_put_fifo(opaque, *buf);
> +    for (int i = 0; i < size; i++) {
> +        pl011_put_fifo(opaque, buf[i]);
> +    }
>  }

I think this is a bug in whatever is on the other end
of the chardev connection. The pl011 can_receive routine
only ever returns 0 or 1, so it is an error for the
code calling its receive function to ever pass a
size that is greater than 1.

thanks
-- PMM

