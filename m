Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B49356ABF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:03:00 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5xb-00055i-Ng
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lU5wn-0004Va-84
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:02:09 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lU5wf-000193-KK
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:02:08 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so8719027otq.10
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=za16kTG1cVGjMQbsKKT5zr6PyamPPMULoUa4ewYf/WA=;
 b=WjBDyd/4lguKJH2X+BNdfyWBLsK9hy6P4h/Tt7J0SZliOb/024sh1+ENobxY+/Odwh
 /Lk4m1xFkNfFYCTLGQURv0xuI2hjzX40yg5GrYASEvq8Uqab98l/NQaXwfLde9bD2RQT
 6iwU6MyBrikYCZjsh0jOu1nu4iWRMp68KZ2btnyvuKcHqeedo9DUxPk9B5tZlCQFaV5u
 S0Y/4gBa7NcwHP1tLQilvpa4pHXMMbC4PgP1VTjjaH8wdgUZrUKqsqbD0kiSwo1Wsi5G
 ygvM4n1gywPl5VMN4DVM6KsMwM1VUUf3DmfObkuHYrHSL5aIM03v8D2KrrIh4YmjHmUZ
 kCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=za16kTG1cVGjMQbsKKT5zr6PyamPPMULoUa4ewYf/WA=;
 b=W7LYRC/CDunC7tLGwI84U+t60IPgscXqfDCLHOc9u/0lpzCcifjOS3bgcHmbWgXCLK
 eDw2GJZO7YaywZ7MR8I0NGJvvMSPUnPX6oU4xUo+82Y5E9tNlSK+X1t+vRZqryXqNUHF
 gr7pb9R5NH3dmTMP3qLEmJlpLaOJL0MGPqqHaWqx+5oT8ikyauf/vUrbY0UzA2HW65XL
 Tn5LtVED9WGZ8Kx9uVpebhuM/yhuCL1HV1NQk26Ka7jTLI4o67y3UMjSztLgzBUPYWqT
 IjUOBsyAo3kCXMrbZrpoSrqIA+uamUwHZcl64IAJ5LSqSz8nmGSZbHNWbS22qFOqvalL
 YIdg==
X-Gm-Message-State: AOAM532rI+MnIlH1/14sGEO7dMTIpHkdHMfzVqLpDKXjymPtk3hlTP4g
 9gejCKdwIYiKsqNwHpt47iH0XUkrB0pEelLfDWA=
X-Google-Smtp-Source: ABdhPJx/DhF9inZq1zuvLn8Ya8I1W+rN/Gz4wclBP73yCJTIou0M8QZIK0Yw84E71ASVqXZPhPdaR0XEyN1OOmflb0c=
X-Received: by 2002:a9d:6b13:: with SMTP id g19mr2441704otp.185.1617793314695; 
 Wed, 07 Apr 2021 04:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
In-Reply-To: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
From: Wanpeng Li <kernellwp@gmail.com>
Date: Wed, 7 Apr 2021 19:01:42 +0800
Message-ID: <CANRm+CySNYUZ_8eq_6SRiUB4q4W0QU8EkW1RAM+jtMZ26-PUEw@mail.gmail.com>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
To: mjt@tls.msk.ru
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=kernellwp@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 18:55, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Hi!
>
> It looks like this commit:
>
> commit 87fa7f3e98a1310ef1ac1900e7ee7f9610a038bc
> Author: Thomas Gleixner <tglx@linutronix.de>
> Date:   Wed Jul 8 21:51:54 2020 +0200
>
>      x86/kvm: Move context tracking where it belongs
>
>      Context tracking for KVM happens way too early in the vcpu_run()
>      code. Anything after guest_enter_irqoff() and before guest_exit_irqoff()
>      cannot use RCU and should also be not instrumented.
>
>      The current way of doing this covers way too much code. Move it closer to
>      the actual vmenter/exit code.
>
> broke kvm guest cpu time accounting - after this commit, when running
> qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
> elsewhere) is always 0.
>
> I dunno why it happened, but it happened, and all kernels after 5.9
> are affected by this.
>
> This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.

Thanks for the report. I have a patch here which can fix it.
https://lore.kernel.org/kvm/1617011036-11734-1-git-send-email-wanpengli@tencent.com/

    Wanpeng

