Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2235A594
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 20:15:56 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUvfe-0002yE-SM
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 14:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUvdy-0002XX-DG
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:14:10 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUvdv-0007z9-Lk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:14:09 -0400
Received: by mail-ed1-x536.google.com with SMTP id e7so7570968edu.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dZvw0q+uJx8j1zBnJsxuizGMoCOoPu81txC0S1HoHMs=;
 b=LJerMJ1ebVayadGH5C0EbSmwMXn6A6NRvBZXrjnMl5UgBRYHJ6tFmGtD0d4NNa9MEX
 hIZhknICMfUAeWGZ8tqQl6V4p660ukI4hqlm3QSVsfnaGHJUuou7B7iCXthc0gY8D/P1
 ixMp8gzIXwNHfQGAHLLs4NjIXS5BwJ5C92oh6t9wOdzqeg5XrRseZO4C5CW0sXHc2flD
 CZANMlDg8o0BGATZzFPHHmDyw8X3P1p26GHTt8tQGH33ydyGV/qiTHAgbPPgbsQLJRZE
 +Qq94Slry3oJyoIDkzfKgjPjKMblXOQL2O2QbxIvDA2wXjYyGLAcHcihSWznpFrqxUO4
 9fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dZvw0q+uJx8j1zBnJsxuizGMoCOoPu81txC0S1HoHMs=;
 b=TEFh6PPO9F2KKxLW33bQp8KkPioC2QWvVr82xZ0OUjoB83bo6biu87nrzhcRV5X2WU
 qs340s4ozLphjXAO5M7Q8FyuSYSTdDnPOUM0HHG+9gTC83rY94rjYRWuh2S1parkrKsu
 hOYbT+0CafWkK32Y63pASdK4xjDEXcIOcoHV9puNAwpG0Xx84D2M3cZqY1EVnLrrlkKQ
 JghFnrgn8lVm9eKGn/LMZhPGAVZREj6sw1BZ4l5GKVgp78qLrd/53ZeHwBhFJriPJ9A1
 aX6kD8dUlWfYWKtONPKT/MACPXhwqVSIAHtTY4t1yc0SOvEeaQRiw3ZYDZ1k98KKdQaq
 NeSw==
X-Gm-Message-State: AOAM530slMOr17RDSZaOGY/1N72hgyyB/C4frTjXIxcMiue2l7AtPxHZ
 6sekM5ExdwSVqv+5KPj9wjbZqGXlK9/+tLrqXQWXmtRlpwR/0xJb
X-Google-Smtp-Source: ABdhPJxLb11j1v6aGGEKTZK1YRIaMfjdepMux2wxCcj2VszUFyBtZFt6Sufh8CX4ef2MXTzTP7u1lGrlpvKIFbOf1+A=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr18658850edt.36.1617992045841; 
 Fri, 09 Apr 2021 11:14:05 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 19:13:24 +0100
Message-ID: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
Subject: Resetting non-qdev children in a 3-phase reset device
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I wanted to convert the hw/misc/mps2-scc.c device from old-style
to 3-phase reset as a prerequisite for another change to the device,
but I ran into a problem because currently it has some TYPE_DEVICE
QOM child objects, the LEDs. Because TYPE_DEVICE don't live in the
qbus hierarchy, the device resets them manually in its DeviceClass::reset
method:

    for (i = 0; i < ARRAY_SIZE(s->led); i++) {
        device_cold_reset(DEVICE(s->led[i]));
    }

This makes converting to 3-phase reset awkward. The obvious "natural"
approach would be to say "in this device's phase X, invoke phase X
for these objects", but we have no API for that. (The functions which
would do it, resettable_phase_enter() etc, are static inside resettable.c.)

Ignoring the phasing and trying to just call device_cold_reset() in
the 'enter' phase results in an assertion failure, because we trip
the assert(!enter_phase_in_progress) in resettable_assert_reset(),
which doesn't expect us to be triggering a reset inside a reset.

Ideally one would want to be able to add the LEDs to the list of
things which are children of this object for purposes of reset
(so they are iterated as part of the resettable_child_foreach()
logic and their phases are automatically invoked at the right point).
But for a subclass of DeviceState that's device_reset_child_foreach()
and it only iterates any qbus children of this device.

Any clever ideas?

Maybe some mechanism for marking "these things which are my
QOM children I want to be reset when I am reset (so make them
reset children of me and don't reset them as part of the
qbus-tree-walking)" would be useful. I do think that in a
lot of cases we want to be doing something closer to "reset
along the QOM tree". I really do need to spend some time working
out what the right thing with reset is and how we might get
from where we are now to there...

thanks
-- PMM

