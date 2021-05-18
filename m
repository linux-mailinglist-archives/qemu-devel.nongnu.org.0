Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE338816E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:32:21 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6O4-0000AW-T1
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj68U-0001VL-FE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:16:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj68R-0000Mv-Mz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:16:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a25so12696525edr.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=82a6pjuSj0OdMQxIopcy+egrQTO7OH2e07Pz7wSnC+I=;
 b=XrEMKLAyiSiB40O5iUeTR8xMLYPoW4xVWQBKFN0d4Rg3mdHht3+xcE0m/FKhesp84L
 9NapDY3JZDRDtHW3vILWJmgyzeNEleZLIqBa043JTK7bRsKzFp4Cqt7sC0auaaGO385L
 dhvaCfOAWqTFydHhBrwShpUmh+Um7nX/tbyFgB7noMxl09RnGAUw1CcQ5UODl3bTMmPG
 VrFWuVVGRG3dWaRs66i2eeUJNY/5E7w+JMcOyufBasrov9efVHOOeNrwMHS7PB92H25n
 YlbfzdwNqkqqHc9Hk7TvYJo5FHh4B1XX38JiHYyWs/VuGljojGBmTNgXFKNbTnmiaj2F
 M4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=82a6pjuSj0OdMQxIopcy+egrQTO7OH2e07Pz7wSnC+I=;
 b=a+IIkeJT+MwY89cdeDMWPjDJM41se3pinE2mstVQOciayFkJUyQdRKUbaSK0AHSkql
 67bIaShqj8PRGxTj52TTCUzqMt85qkxtoI6t5OhKSBihbBQaL52zhq5GBuD5y5gFYmU7
 mPZt8OMSL26z/DVUORe33YAyRnwc7PJnFu64IabvuSBhfx38r5hOxKBgvcIUy8/EZ8y8
 yDj088qG3sZZtDYFiMKB8oQ2alvf5l6tSM/vzHCriWdXgV2eGLIiJ886bo3fZVnBujTw
 7AohJavovzjf5lmrYaXWyqm7k0/RJ+Q7XDceKbo4cTvGKN8STrYXjPVSG+B/t5IwssqM
 Ub9Q==
X-Gm-Message-State: AOAM532NFlPheRk4vQWxlUPXVYzCB4msE/wJnJLjOQftuTXj1z1B9fWP
 gNYtodWcUEaez8+RGGRKp+ZoE5q2c++ufE5H4ZEZyg==
X-Google-Smtp-Source: ABdhPJzPVI74T1AdP/KbnuBhuIj1+riP99OFvfff6RFtrvSr4Dhmidz8usumol7+4eDCm3Q26aXbfpiGJKylmnhiuug=
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr9104040edd.146.1621368967914; 
 Tue, 18 May 2021 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-15-philmd@redhat.com>
In-Reply-To: <20210518183655.1711377-15-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 21:15:51 +0100
Message-ID: <CAFEAcA80dcBqEeuSyMPEAC50SvArwU4Ac_zTgM_im0W8x=KPHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 14/25] qemu/bswap: Introduce load/store for aligned
 pointer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 19:38, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> When the pointer alignment is known to be safe, we can
> directly swap the data in place, without having to rely
> on the compiler builtin code.
>
> Load/store methods expecting aligned pointer use the 'a'
> infix. For example to read a 16-bit unsigned value stored
> in little endianess at an unaligned pointer:
>
>   val =3D lduw_le_p(&unaligned_ptr);
>
> then to store it in big endianess at an aligned pointer:
>
>   stw_be_ap(&aligned_ptr, val);

It sounded from the bug report as if the desired effect
was "this access is atomic". Nothing in the documentation here
makes that guarantee of the implementation -- it merely imposes
an extra requirement on the caller that the pointer alignment
is "safe" (which term it does not define...) and a valid
implementation would be to implement the "aligned" versions
identically to the "unaligned" versions...

Q: should the functions at the bottom of this stack of APIs
be using something from the atomic.h header? If not, why not?
Do we need any of the other atomic primitives ?

thanks
-- PMM

