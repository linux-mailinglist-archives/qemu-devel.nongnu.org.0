Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F92D775A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:04:41 +0100 (CET)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knj2E-00012H-On
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knizl-00086l-Nz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:02:05 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:43025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knizg-000119-N9
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:02:03 -0500
Received: by mail-ed1-x544.google.com with SMTP id q16so9422229edv.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MCYIbL2EDRXdRTAPhFPsO3odLF2/24IV0W6pyACZgoM=;
 b=vmv9k5eKuK0esblODAlqWnBsN5/Z4ncpNFs5W9EoGqgUQuZeWg+tpnRpdq2K94bGCo
 yb7rsy/cFVtphpC5Xe7PEFYbJbdYwwoS7KKZ7K9iofl6+qjyxmGuUiM3FyYj0Io2a0Zl
 BExIhXbjp+ws96/SjDrC34Ojzzn4R/BkeHtQLvnNIIuOXllXy0teHU4oJMtzvkEfIY7D
 EmfdrNi3hqhPdGoU4cYIDwU4EaLTxOFf4K44ZSKKNHmvSTBKzMJCeEsnUa+DhoYdHp9G
 c4eIiKv9rTBa832HRDAIlsHLzeCdrvevdPTQd+lKv2bzjROcSWB0dYRlHUiQo9Kyph53
 gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MCYIbL2EDRXdRTAPhFPsO3odLF2/24IV0W6pyACZgoM=;
 b=i5jrkUMNjJ8Zj62fjrK2huY9+vTcLozWwQhC+EpRFPToIfhu765AdjWZUM1uTtQ3M4
 iIdbOngZZ9KC8iJkrbmIdNasvfgA7dB3916VQoKVz7KGiL+7Mb6Nc79En48SmX1+a4dM
 UVIIMq6KHF9qzVNAfZC2jntAQGASxHFl7Q7E7TeHkbB8wLmW/3dt1qWvIrZZeOVqu7ov
 0v+NwDhj0VltP0NnEN5ciN3JXcwjzZHDwxjvNyxYWThWGVNWtOQvEvJPSwRVN6dZ3TB7
 TuDV1onaceiGIfgZe+Ot1+iIakaM5A2lMBy6XjZgbiFOWIqmybkqiQog6XiOiaF8U29T
 vUcA==
X-Gm-Message-State: AOAM530rttfaA+Ya5qTuu/W4SXehMIAMeY+3Dqg4b9zevsbwKBgc5FdK
 kPYpOzWJ1larEGiYhGM9IyFqSkZxvcATK468xbUZdA==
X-Google-Smtp-Source: ABdhPJx3gmJus7x3tGOA7WsWOGmHlJszsL6yTutY9k9sTKZtNBowSywlf3UHBPvKfsGSI85EnHPHCD6IdRDr/UJXUnE=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr11721762edv.100.1607695318915; 
 Fri, 11 Dec 2020 06:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <a958bd8d-81fc-a134-18c4-f54b49f38fa6@amsat.org>
In-Reply-To: <a958bd8d-81fc-a134-18c4-f54b49f38fa6@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:01:47 +0000
Message-ID: <CAFEAcA_21DMqRCZ2Tf-4CrK=rP2ENOFmSjOzBxCRqu-N_9oGKQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] clock: Get rid of clock_get_ns()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 13:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> (I also started to get rid of clock_get_hz() but, as you figured,
> this is not a trivial task).


Yeah; I haven't really looked at the users of clock_get_hz()
in detail to know whether it's really possible to remove it.
For the serial devices to some extent they really do want a
frequency to feed to the host serial baud-rate stuff...

Also, I have a timer device I'm working on which has a register
for "give number of ticks since simulation start" which should
thus read a value something like
 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)  / clock_ticks_to_ns(clk, 1);

and this also suffers from possible rounding issues (though not
to the same extent as ticks-to-ns since it's a division rather
than a multiplication). I'm wondering if we should have a clock API
for "convert a duration in nanoseconds to a tick count" directly
as well. Dunno whether that helps with the clock_get_hz() use
cases, or if it's orthogonal to that.

thanks
-- PMM

