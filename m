Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF66FC903
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:30:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOLT-0005Rw-UA; Tue, 09 May 2023 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOLR-0005RM-Is
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:29:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOLP-00064t-UF
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:29:37 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so9224208a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642573; x=1686234573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ow33TceIB4jgP6+8+OoXouGJl3NIHZGJQepJGuh0FxQ=;
 b=o74zftUZHnEJD4TcBFZMjBTUCjpb8XfKtTmL+XHI59ehzvH+zVKC9Q/GMQalq96SKo
 OX6R/tqDfEbpULITPhfKDbju5966aNtRgw30IFDcvEJsbndBtv2oYzPL1YewlZ5KfnZg
 P2mnc90E98zHPSxbU6vqP1/iFxNBJvGJJ12m35yR/N17qV8UBdgqkZUPHWRcBa8yKAZv
 5NH70VFj521PL6x//HQB3TqPnsE0d3pT4MI4rUrh6jDuma/bfYCeuxmLLQVzwHHDV0dk
 xL4MnGrUQ/4ezh746KIAHzf4Wn9Vtaafi4SgRRM6VGnoPY6/j9gIvjI2eMnQ4xf2ah/h
 zIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642573; x=1686234573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ow33TceIB4jgP6+8+OoXouGJl3NIHZGJQepJGuh0FxQ=;
 b=JpMTvpe5BUHj8MaE6k9NP5NhJmzGczrfgLfoLvbxoT+gBm35llPhZ8VftT6dUh8F1P
 FCe31lo8sJMuCsgDdAf3ZCZCUyHVNMuuAfqfrf7R9xq3RvbR6rCWpHGkBjL/BmLHRWMk
 1M+9UpbrzkTbqQWvI4mkV7EsyZgEidP1KurGTqMyGw6f0r+DjSVCIfnMlz2Fucd+JYaF
 ALpRalXXIg+1dvAU0BIqNJS2YTwFWIX9vdQbwVeK+xnl9kVH3j7IZoOjIgRvoeAiilrR
 G8Ad7N61QleOspiTrynwILjqp0/iZSJ4Mj49yF59PiQjwC5HNzw7Bfycz0F4O9HBK3Ie
 Kicw==
X-Gm-Message-State: AC+VfDyFnw9iNIQipkdAyaOmdNYOca9kTaZuhVjibd1ND+iy88638CKd
 /Hu4EdyrBnKXcGMQJPP04Ap1O8J2iKaj3ARdeyzHhA==
X-Google-Smtp-Source: ACHHUZ5P0KBnnmb4GdjsZClIEaWah9OS9HMfGBmSkFY2G5Gi2yoVKTZl1OKSaT9FXAcBz2eR1g+Lcx9GaLeRlDlX3as=
X-Received: by 2002:a50:ee97:0:b0:504:b177:3ef3 with SMTP id
 f23-20020a50ee97000000b00504b1773ef3mr9742606edr.3.1683642573383; Tue, 09 May
 2023 07:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
 <20230403191600.43487-3-fcagnin@quarkslab.com>
 <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
 <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
In-Reply-To: <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:29:22 +0100
Message-ID: <CAFEAcA8RifuJamf04p+AXN457-bd-s6eyxOWjCzbssfuEcyfvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon
 hosts
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, qemu-arm@nongnu.org, 
 agraf@csgraf.de, pbonzini@redhat.com, alex.bennee@linaro.org, 
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Apr 2023 at 20:45, Francesco Cagnin
<francesco.cagnin@gmail.com> wrote:
>
> > Other than that, the structure of the patch looks OK, but
> > I think you need to identify the cause of the problems
> > with SMP setups that you mention in the cover letter,
> > since they suggest that there's a bug lurking in here
> > somewhere.
>
> In the current patch, in `hvf_arch_update_guest_debug()` I'm enabling
> exiting the guest on debug exceptions only for the vCPUs that have insert=
ed
> software/hardware breakpoint or are singlestepping. In SMP setups this lo=
gic
> looks flawed, since for example if vCPU #1 sets a software breakpoint and
> vCPU #2 hits it, the generated debug exception for vCPU #2 will not exit =
the
> guest and lead to panic for unexpected BRK. A possible fix is enabling
> exiting the guest on debug exceptions for all vCPUs (and not just the one=
s
> that have inserted breakpoints)=E2=80=94is this the way to go?

Yes, I think that makes sense. We treat breakpoints as
VM-wide (and writing a brk instruction into guest memory is
by definition VM-wide), so we should put all the vCPUs into
"we're debugging the VM mode", not just one.

> There's also a second analogous issue for which it feels like I'm missing
> something. If through GDB a software breakpoint is inserted from vCPU #1 =
and
> later vCPU #2 hits it, then when trying to resume execution after the hit
> GDB fails with 'Cannot remove breakpoints', due to
> `hvf_find_sw_breakpoint()` returning error because it (correctly) doesn't
> find any software breakpoint for vCPU #2 (queue
> `cpu->hvf->hvf_sw_breakpoints`). A possible fix seems to be modifying
> `hvf_find_sw_breakpoint()` so that it searches for the breakpoint on all
> vCPUs' queues; but I've skimmed through the analogous routines for TCG an=
d
> KVM and there's nothing resembling this fix, so I wonder why TCG and KVM
> don't fail on my example GDB scenario?

For KVM the sw breakpoint list is in cpu->kvm_state, and
we share a single kvm_state across every vCPU in the VM
(kvm_init_vcpu() initializes cpu->kvm_state to be a pointer
to the singleton global kvm_state).
Isn't cpu->hvf shared between vCPUs in the same way?

For TCG breakpoints are effectively always hw breakpoints,
regardless of whether gdb asks for a sw bp or a hw bp;
the code path is different from how KVM and HVF do things.

thanks
-- PMM

