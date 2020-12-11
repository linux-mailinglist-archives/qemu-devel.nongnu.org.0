Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5372D7772
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:11:13 +0100 (CET)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knj8a-0005sZ-VZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj6V-0004ZS-QF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:09:03 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj6Q-0003UM-Gy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:09:03 -0500
Received: by mail-ed1-x542.google.com with SMTP id cw27so9482276edb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fASzxpGQERGBEJEorDn1U1ciMr3DwPQBRnNJw5G3dxA=;
 b=bwN63vcthd3ceYDaJ/BzOaKw1qoR5ORpQtlhN5GtD6Pcb5rLPDFScTAOewyT2juD7e
 Ork7nxuU+tgJQs0UYFlRvfe5msj9i3zjUU5zxuYjAaW23VjFE1fkR8Kt8rVQ9flgH6dZ
 B8kH3wqUFWfqsf3eXWawxyFcF9iFy6vMpca29tkODqDcgbNGgJ4EXw3rYAjMKZwrxa0a
 5O8cjQheaoUvNe24mNWRb7+uhWgu4E9vX7A/SNUscd0Jl27yMaXqyKjEAv6ymuOWsiQw
 AO08jS9kG3Wy6p0PBWdwTICEKPTO6vhOU5k5QjF9PCh6tNlT777QZ0QKqFn7H5/OUxVu
 N1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fASzxpGQERGBEJEorDn1U1ciMr3DwPQBRnNJw5G3dxA=;
 b=ufuQsvguIYZ5PwqDC1dT7jNMGeBq8chnJyblFoFvlCDIcXvTx70JeNMVj+16loEumZ
 elHM2cqmSPPHBdfNOjNCCIuarKVoBBVOA5lMNOsSyPIp//Q4hLrG97gLS2zDaYreMjIv
 iK0VJwVjDwiefUxOoEtJwPAPe3qGEj34bDvBAkEN1vzQkTsbTN9srjjF+aXjHt0qBmMe
 JmoOqUOwFcKv2sJG1jDPX4jJ28K7X/PziR4kBsnJ7sqMNnMFqUcNcAP0I3pgeLAeklIo
 qeqG6SvroL7Ab0PpRen3Po8S5DEE9BOcIdaMSg/Qrm6I3KoXrj74cw4BNmvhMzRYMzh2
 229w==
X-Gm-Message-State: AOAM532ku36AY63tWIO3z9PVYwRhS25bN/dlh7wdfzrJOMbIH9/P8CsI
 di2rL8nwkdkIW0JFVKZd4r3e1vIcDhQh9XkAaayiehtRcEg=
X-Google-Smtp-Source: ABdhPJw1wqrHCYPijxDAFTV+Qc25K4o3GQ9FuOtraXski3+BjJ+9CD8HcHtZO2Ypc+YAZAAAb0R5Hy7dd6U+yzRYi/o=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr11851396edr.251.1607695736824; 
 Fri, 11 Dec 2020 06:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20201129203923.10622-1-peter.maydell@linaro.org>
In-Reply-To: <20201129203923.10622-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:08:45 +0000
Message-ID: <CAFEAcA8LHbfZHRvYAE7c7=nMt5xe1R8Qpc-B5riRFxd7NK-0Uw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve reporting of ROM blob overlap errors
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Nov 2020 at 20:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> (This was inspired by a conversation on IRC with a user.)
>
> We report an error if we detect that there's an overlap in guest
> memory between two ROM blobs, but the warning is pretty opaque.
> Currently it looks like this:
>
> rom: requested regions overlap (rom dtb. free=0x0000000000008000, addr=0x0000000000000000)
> qemu-system-aarch64: rom check and register reset failed
>
> which is pretty cryptic and also is missing information that we
> could fairly easily tell the user (like the name of both the ROMs
> involved in the overlap rather than just one of them...)
>
>
> After this patchset it looks like:
>
> qemu-system-aarch64: Some ROM regions are overlapping
> These ROM regions might have been loaded by direct user request or by default.
> They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
> Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.
>
> The following two regions overlap (in the cpu-memory-0 address space):
>   /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf ELF program header segment 0 (addresses 0x0000000000000000 - 0x0000000000008000)
>   dtb (addresses 0x0000000000000000 - 0x0000000000100000)
>
> The following two regions overlap (in the cpu-memory-0 address space):
>   /home/petmay01/linaro/qemu-misc-tests/bad-psci-call.axf ELF program header segment 1 (addresses 0x0000000040000000 - 0x0000000040000010)
>   /home/petmay01/linaro/qemu-misc-tests/bp-test.elf ELF program header segment 0 (addresses 0x0000000040000000 - 0x0000000040000020)
>

I'm going to take this series via target-arm.next.


thanks
-- PMM

