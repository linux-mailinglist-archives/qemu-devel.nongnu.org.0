Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0123314F3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:34:50 +0100 (CET)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJmL-0007sI-T1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJUB-0001px-Oj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:16:03 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJU9-0007oj-U7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:16:03 -0500
Received: by mail-ed1-x530.google.com with SMTP id m9so15841730edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqEAVHhKJIhXGbOs6NWemQDC8v4aBYn9Ws+uma5LFJA=;
 b=MzfyNzDIbYtNlrEqCez4tSnUyFzniUvt6I2lnpWOFSu1ye0hEP8h3+Uq5TO8rDocWX
 Usc5QjgC6gt9SLJVLD57kcMnchBLcfhb+0HD3AnSuJ5ghbtdGtFCi34/hkk9VQ+GEsii
 MWMlz7NiHBVGo4SDrz7AoorYijPBf0rYPUsTe5B1PYZ14Uvl8y7hW/UwMf8II7FH4yTw
 mbkjn4VYDst9WGBked3fGnXHzoN1S4llKjcUuEKh57g8/uXjha0JmN5UueONz/GfjsTf
 6ED1PtbWKqXgAg0eeLrnvTyupvPY8bbSh/jPHkhagvMa4uLk5+roNuECbQpD3E9FpUTa
 KpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqEAVHhKJIhXGbOs6NWemQDC8v4aBYn9Ws+uma5LFJA=;
 b=mIuVDVHjozyeIOOn61dgt/tkpA5Zo1kasFTIP9YMHKtTrV/7iCE/HRFQBvd8K5RZbC
 m9jJWJG42qPCudVc9nGAnOWIbPDgWZzhs92roSHRNkKFJb8lbUQI1x+EkrAQQYemYdSY
 tS2Adwm11293ZT8Jr3YvV8QAH7v3PkIV54R9LuUtjePzR/dy6uM+hEjb+oqu0A2S1CB7
 r5gr1p6SF7uhWJ2nBq1zXx1TdT1PAby6N8E6Wsw8w4A2BeNtZm9rILRNwd+EKQAXgpGA
 XJsV9rXJXnUnoto39MjlUZGGYgm7o2G5ot4arnIVMzZICuOXlEDm9oX709t3j46hPv/z
 +2IA==
X-Gm-Message-State: AOAM530sp9if+HxbOeig6qOOSMb0PsZUpAZP2AqzH1A1+PcbbzNvLHPC
 5Fz+TvV0FPfXmkTMKGQdxeJdnGJzNw1Ek47UrIlz8g==
X-Google-Smtp-Source: ABdhPJwuFX8JxjN37/aFf2S8mpTWWT+npl9XVAZJ5W9R7EfYFxE6y2ss/1vgYTfsV+shuggoIbHv/OXz68hybP/bNW0=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr22939974edr.52.1615223759740; 
 Mon, 08 Mar 2021 09:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
In-Reply-To: <20210303135254.3970-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 17:15:43 +0000
Message-ID: <CAFEAcA8BUZ_WFqY2RpcT-UX6f7Sa4fr2c9YG6Q3yTPem=ZRwfw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] hw/arm: zynqmp: Implement a CSU DMA model and
 connect it with GQSPI
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 13:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
>
> We added a Xilinx CSU DMA model and the implementation is based on
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> and the one in Edgar's branch.
>
> The DST part of the model is verified along with ZynqMP GQSPI model.



Applied to target-arm.next, thanks.

-- PMM

