Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21402F0994
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 20:56:50 +0100 (CET)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kygpV-0005GZ-SR
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 14:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kygoA-0004Ck-CI
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:55:26 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kygo8-0000xv-Mx
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:55:26 -0500
Received: by mail-ej1-x632.google.com with SMTP id q22so21854843eja.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 11:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/EM89EUv+PB2w1BDJKeAgJS8aHkWG3TS7mJXDTfkls=;
 b=Felei3Vm4UtLJAfaxXyQHvFY+V+xHLKAr/6zFhEKHxsDHeJJCN45wucCRLenERRY2k
 Bu0IJi706bDIk3KDB1yiMIFjsGLNvxt1auOK+zcTGNTwNTabEGUbyiHhbIoaK4PZe0qT
 4juj8Hq9PAixXXWYR0JSdjoLirf8rbjqMhDkw9Fib0HY/oZxuPYPAz9ZiN6VWhGWvexB
 0McZUFtXbCkvQVWVPRh6deJ+9/yEgT6wR0LPZYBu1U5fLsVK9Ah56u52XmdLgomUzIeO
 91EiBCImMMQUAwStlrdJnECme3kk2RfRp/0mBmVDoReXNTCfzd1vtfzXQ5JiEOGQH1Nc
 1TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/EM89EUv+PB2w1BDJKeAgJS8aHkWG3TS7mJXDTfkls=;
 b=nzOXlOVqSBDVOHo/xb9x8M6QNdAA0k7zciVvRxoCGNcCwdV1xWbUH/uA3uH8fNiHnH
 fEJ9QELDbr1c/JPbqRRdMoyQxkEY5KiwYKHik/Iz8Jj2SKeHTtFosdoxEjhmTa4I4uI2
 ylisf3sNQYzp8Wv6xQ7VTKezy+z1O0aiEdKHB45/7em4JtiMRRyIApY5yeCYChhmGXpQ
 tMiaakdydjNztwnByFBsNrSWQ+s2WTLNommjPz3P0QwxU4plVMPEKiC0l1o+WTr3lkrp
 CskRRLQxLA36HzOo3TQJ1YFBCUh3UIWNO+sqYZHvb3LJT9ZwQrqG+pPeyIkRs9f+Vkck
 yN8w==
X-Gm-Message-State: AOAM531ABHRJx9eVlVDzVRx/aErQyf2B6KgkrymOIrsjxYRfPRmElydQ
 2Zr66QSHH+qFT04M5B3N7s8qS/tsoWX16kPciVO7oA==
X-Google-Smtp-Source: ABdhPJz1KYgo/b18rREjFV+ot+aE46rI5bxn7s9vDnp2jSFgYL7Eu9vfFz6AUrSMJn/f4ybLE+8XxTqOkW0CwMO9hE0=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr8866806ejr.482.1610308523021; 
 Sun, 10 Jan 2021 11:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
 <20201218060114.3591217-23-alistair.francis@wdc.com>
In-Reply-To: <20201218060114.3591217-23-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Jan 2021 19:55:11 +0000
Message-ID: <CAFEAcA-FF0SC-LSWUxwDdQ_vutYEB=1UMB1nua2BEQm+_E8SdA@mail.gmail.com>
Subject: Re: [PULL 22/23] hw/riscv: Use the CPU to determine if 32-bit
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 06:01, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> Instead of using string compares to determine if a RISC-V machine is
> using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
> us having to maintain a list of CPU names to compare against.
>
> This commit also fixes the name of the function to match the
> riscv_cpu_is_32bit() function.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com

Hi; coverity points out a probably-unintentional inefficiency here
(CID 1438099, CID 1438100, CID 1438101):

> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -33,28 +33,16 @@
>
>  #include <libfdt.h>
>
> -bool riscv_is_32_bit(MachineState *machine)
> +bool riscv_is_32bit(RISCVHartArrayState harts)

The RISCVHartArrayState type is 824 bytes long. That's a very
big type to be passing by value. You probably wanted to pass a
pointer to it instead. Similarly for the arguments to
riscv_calc_kernel_start_addr() and riscv_setup_rom_reset_vec().

thanks
-- PMM

