Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1F68B8FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOy9P-0000kx-93; Mon, 06 Feb 2023 04:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOy8w-0000dW-3R; Mon, 06 Feb 2023 04:50:40 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOy8s-0004fM-1E; Mon, 06 Feb 2023 04:50:32 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a10so3947565edu.9;
 Mon, 06 Feb 2023 01:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VnAxM9hjSRFkzLal9oZWpwOVho46OWIT02qW++wmOAo=;
 b=LXqixfUBJyzvKh8NN7bxBwLmjmA/fO5oPRsARlYczGuUfq3fUGZ0WneE2J0ZI5zKia
 Dw6ZFypnw9TFd7eVq21W5uZk442ZA+ZzH/tLjf5cEnz1PODn7GglGznIb3SfWlc/637g
 ne6hiQztCHJoV9pWV9XSi9X9qyIHz3/S3etp/e6X2Zosj/OWCq+eSzsAFOYpMgJxERb5
 TmzlBY25WPFCD+xbmAvHM5dj7A7nB0ZwplgA/GkL/OU87Weq4auYhNQGhjCxWsdBL7T3
 rf8oa71DOb+SMgU/r+jFufFSO/ZCcE5qan8avVJSXCS008N9A+7zJdHYegVcfvOFwZIg
 Tceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnAxM9hjSRFkzLal9oZWpwOVho46OWIT02qW++wmOAo=;
 b=D7h4FVaDV5zhilpvsCd8fR0ykia/hjoNyOkNKUrPS8gpCf8hq6YtnOQNd0YuQDMueL
 XXtEqv/eM4lpPrtbyBS+gPYek4JHpBZjDu0EVtLl70spy/yT9MqhKhfNfm+PQuw3+z28
 q7a//+lL31JO36WRfVEOHqfBqgJDhh7eYYxxcZtvAcTaPhN6uQcNJsqA6Nr1DIVMKf7E
 EqDhoQPFZrsKcin2Hi6FtifTMq2b6a5jArF+vyP8OUcGAwLROJh0IbXcUbElT7u1k/Wj
 yVhR5DfmVoOnMWX5zOKSeaKYowE7q+SHElzjpOOF/YBVfY33N/BVVU2NGaCmUCRhIXj2
 E+6g==
X-Gm-Message-State: AO0yUKWKI8B+Ipe8IUaAMQvwb/72ocBU4tv5dgTIUPzemI6aVYraEb6q
 fOpAHE0+rbE7exfeNUSNlkhfmmDfmyi07V3BLrs=
X-Google-Smtp-Source: AK7set8l4/+qCb6ZctLm5DDjoKcXyDcIFtnoCiJJXNkHj0Le7hScysleRDG1ONDVe9Iwm5/1xEIm87X+32YMPHzVxio=
X-Received: by 2002:a50:d5c9:0:b0:4a2:121d:1d3d with SMTP id
 g9-20020a50d5c9000000b004a2121d1d3dmr5803333edj.82.1675677027648; Mon, 06 Feb
 2023 01:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-4-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-4-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 17:50:16 +0800
Message-ID: <CAEUhbmWmr7JpjQodHPNQQistvHMvm4PZAS3Yy1j38CapBEE54w@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/riscv/virt: Add memmap pointer to RiscVVirtState
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> memmap needs to be exported outside of virt.c so that
> modules like acpi can use it. Hence, add a pointer field
> in RiscVVirtState structure and initialize it with the
> memorymap.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c         | 2 ++
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

