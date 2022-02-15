Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B24B6B3F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:35:19 +0100 (CET)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJw74-0007wN-F8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJw4j-0006qw-3j
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:32:53 -0500
Received: from [2a00:1450:4864:20::433] (port=38756
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJw4f-0004p0-WC
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:32:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id d27so27782541wrb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e6qgJLfjvPJ7GEp9mmG7Qw9Vy/KV+MFTTnVuM91jcyE=;
 b=GzAKjOn3UdeOWGZDH1vN8HiNggDWCC9AY3qvZmh3YwJebKOQFN9gl1wq01evzZDkzS
 oEh3S8poQD8Qzg8gruIWC8qay4rHfG2QeG0WOeEkIb7dnNMKwY051Gae5vb2lDjiIPsY
 WyF+1M7wLj5hn3tjwnS7d8JnAS1DrOTHumk1svPm+O7lL9kLJpLx97UQCL+mlDcoWkhg
 CpSQuQP5ERXTFnNP6ej6vu74YSbqwvo9f27e4EHhBsb2fkW9dQnHMw8P/x/UrOmDz0wk
 YfBwDiLLbO2dUs4qobL1SQgBwvJRZlvfTJwG2BwgJGynVgbss24/oHHkIwSw4ELa9ZVL
 LrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6qgJLfjvPJ7GEp9mmG7Qw9Vy/KV+MFTTnVuM91jcyE=;
 b=CAB1UzLlg6Txu50L7nP9ag8ueAr0ioYCb+c2IuFcZLdCwNqNrD36+aftkFZkUI568v
 +dnUyKGjyNLmY08v+TUHWdeP74uDLIkKF/lG510dL9BlD628BG8GMzCZOYKuUBfDsT7E
 5fpzfsvt37I5rVuDddtg+yZVB7cfKH0/DyvQ+eOmv9r9U0Ijx7n8P0FQnDCbKx+QC6zZ
 7t5rKHCB6yV7DJ5K2x9kVWlyL2TVCINb+wqoZpDK5eLN9tudVK3xlB8NgR6jUrlCn4Js
 8GnFYzkCyBO/xtsUKEnksHJXrtabH3bqyV4tBT42teek19Sh5sP843ihq6FpGzgG+x/I
 V/+A==
X-Gm-Message-State: AOAM532w4874AUXNNlYkmYS0Sunzct4OB5ogOvPV942EAHAbuQ0+jo2y
 0D1UtH6PF04uevPadM2keJx2rbRKOJulsytCM05srg==
X-Google-Smtp-Source: ABdhPJwtouEEVoIbDICmCJDG7D1dXXWYy7FCpN5NUch1cRtg1Y0jMYdFhX1+ZMQhMTLyPi3EPtP9s9gjy/oQ6RaLyTs=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr2915371wrs.521.1644924768415; 
 Tue, 15 Feb 2022 03:32:48 -0800 (PST)
MIME-Version: 1.0
References: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
In-Reply-To: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 11:32:36 +0000
Message-ID: <CAFEAcA9P7DyYqBCLeTMRSTiw2jYMfQ97vs_u+55nCdov7LDdrw@mail.gmail.com>
Subject: Re: qdev instance_init vs realize split
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 10:32, Damien Hedde <damien.hedde@greensocs.com> wrote:
> I'm wondering if there are rules or convention about what we put in the
> instance_init() vs realize() for simple devices ? (For complex ones we
> generally have no choice to put everything in realize())
>
> For example we can declare irqs and mmios in instance_init() or
> realize() if they do not depend on some property.

We don't, unfortunately, have a clear set of conventions for this.
We really ideally ought to write some up, because the question
keeps coming up. There are a few absolute rules:
 * things that can fail must be done in realize
 * things that depend on property values must be done in realize
 * things that affect the simulation must be done in realize
 * if you do something that needs a corresponding manual deinit
   step in instance_init then you must provide an instance_finalize
   even if the device would otherwise be "create once, lasts for
   entire simulation" as many of our devices are

But in many cases actions can be done in either method, and we
end up with devices being inconsistent and people wondering whether
there's a reason for it.

I vaguely think it would be good to get into the habit of writing
all our devices to have the full lifecycle code including supporting
init-realize-unrealize-finalize, but on the other hand that implies
a bunch of code (unrealize) which is never executed or tested...
I also suspect we have a bunch of buggy code in realize methods
which isn't correctly undoing things it has done already in the
error-exit-from-realize case.

> This is not a big deal, but given how works the help message generation
> in the monitor, there are difference if the device is user-creatable.
>
> If we leave irqs and mmios declaration in the instance_init(). They
> appear in the help message.
>  > (qemu) device_add ibex-timer,help
>  > ibex-timer options:
>  >   ibex-timer[0]=<child<memory-region>>
>  >   sysbus-irq[0]=<link<irq>>
>  >   timebase-freq=<uint32> -  (default: 10000)
>
> If we delay the declaration in realize(), we only have the declared
> qdev-properties (which is maybe more what we expect at this point):
>
>  > (qemu) device_add ibex-timer,help
>  > ibex-timer options:
>  >   timebase-freq=<uint32> -  (default: 10000)

This seems to me to be a problem with the help message generation.
IRQ and MMIO properties shouldn't be being presented to the user
whether we set them up in instance-init or realize: there is nothing
the user can usefully do with them.

thanks
-- PMM

