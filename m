Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED62D184C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:16:51 +0100 (CET)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmL46-0002Du-1p
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmKvN-0005Y5-KB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:07:49 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmKvJ-00053l-RO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:07:49 -0500
Received: by mail-ed1-x541.google.com with SMTP id u19so14739624edx.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YU1OTdQVtH9pi2+c62xmm7Grsp524YGvGzt1l457Wss=;
 b=o5RPec6DmTcXj9dploLzTJjNObrokdddl1hOhJnqAlLao4ETwZzSwF4mfLIzuWpGBh
 sT+376cjQrGYqDH7Vco260soPQjkSPc728OKY/0egMh/m71WJNZRzws5p7rU+g9uESlu
 N/V0Sek8U0gDzj1EI8LSGt0597nUmuozdtZJBZOQgWCh3NJ++0R0KO02Tk5ABOh8V1dV
 H57WFWD9O5Y94F21mFqNe0Ul/C46LPc3vZl5xiw7re346v3O/vwcrTvGG2gi+yOLY9VU
 bgteNkgRdwgW+xh7pnBgDoOzdFVIOtHqlsHQUVRgS8sHNXsuwWzh1SWN2FFcs5qW0plW
 mItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YU1OTdQVtH9pi2+c62xmm7Grsp524YGvGzt1l457Wss=;
 b=lwSC1fZg4Y1p5TTBMt8pQfYuCEnqFeTblqXGHVisoP6uqlFXe/GvRrDO2MoBgRfx5p
 ZaXYhlb2xmKwxsFX/WJMuC6v1h2i55Kx5WJL1/ID3taZe1j0wz3Qg6Izi767iUQYfrKk
 KVGUEsKTOWbW5MQkZWOfLGrzD/wwLRfh9N3/rR8RcmPslPyR4Rw9j9ZcooraksQdmDJY
 D8RZu0h/OtEuAdUaWE1TntdoOacTggxmaZcT8zjjwttGYBF/m2tmlHMYhrn7Q9+pIJku
 yTUF/qmbzIwhgxV+KCKqhLSCUVRCl6HMdLh3EvRxnJq8+2CMKZja1gndbcYGoygGJ1SF
 MM9w==
X-Gm-Message-State: AOAM531HJsK0BI6PqQ1pz+W8Y9V57/Zkt3jeLNsAOujBTEP7sHks4HD0
 uo1ih4JRRnr3bQIxX/5hGMxP39t+446vFkrmEt1PMA==
X-Google-Smtp-Source: ABdhPJwBSQD7eZXavDfjmYPA/gVMe89enNX/U40M7X0z6pjK2PHnOZOKN+A/c3jisHvkHzL2WOJLM+ZDyQQK0OPP8lQ=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr20755543edr.251.1607364463839; 
 Mon, 07 Dec 2020 10:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
In-Reply-To: <20201207174916.GD1289986@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 18:07:32 +0000
Message-ID: <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 17:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
> arm_v7m_class_init() (used by cortex-* CPU models) overrides it.
> Those CPU models as "TCG CPUs" in the code, but I don't see what
> makes them TCG-specific.

They're TCG specific because the Arm Virtualization Extension
is for A-profile only and only supports virtualization of
A-profile CPUs. You can't accelerate an M-profile CPU with it.
(Similarly, you can't use the Virtualization Extension to
accelerate a pre-v7 CPU, which is why CPUs like the arm1176
are also TCG-only, and you can't use it to accelerate a CPU
which has TrustZone enabled.)

(M-profile CPUs override cc->do_interrupt() because their
exception and interrupt handling logic is totally different
to A-profile.)

> What exactly is the expected behavior
> if using, e.g., "-cpu cortex-m33 -accel kvm"?

It ought to print a useful error message telling you
that that CPU type isn't compatible with KVM.

As it happens, you get an assertion failure for cortex-m33:

$ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an505 -display none
qemu-system-aarch64: ../../softmmu/physmem.c:745:
cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()'
failed.
Aborted

because the M33 has TrustZone enabled (which is not compatible
with KVM) and we don't check that before we hit the assertion.
We should fix that :-)

If you try it with a non-TrustZone M-profile core like the M3 then
you do get a better error message:

$ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an385 -display none
qemu-system-aarch64: KVM is not supported for this guest CPU type
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
Invalid argument

If you try this with the "virt" board then you'll run into the
virt board's own sanity checking of CPU types instead:

$ ./build/all/qemu-system-aarch64 -accel kvm -M virt -cpu cortex-m33
-display none
qemu-system-aarch64: mach-virt: CPU type cortex-m33-arm-cpu not supported

All of that said, I think I agree with you -- we have this
indirect mechanism for invoking class methods on the CPU
object, why is it necessary for this KVM-specific code to
call the implementation function directly?

thanks
-- PMM

