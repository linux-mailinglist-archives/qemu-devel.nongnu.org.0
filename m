Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7A509DDB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:43:16 +0200 (CEST)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUHL-0004Dq-Cm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU27-0001G4-L3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:27:31 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:41826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU25-0001sW-V9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:27:31 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id w20so1729964ybi.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5IeXp5BZ/Lq4abNTc4ertLKWbmpOp/1JUq40+2cF+gE=;
 b=i2p+boBMkO66POGkuC0CeoLBjnidpcdbEG1pfZUlSDRvEQqmtHVRMTPajMFspTfS+c
 S+lKAGWJcwUjBq9HniCRhOwgf/4wRc4bDX/9PkAuC+aMaFwgxgTsI5ObfcQgOzOlnsqz
 /6jmZv5lt3i5AlJk1HiTOgMToF0ZjW66NprradlYulsjwi7QRLakkXLQVG+IH4C+2tAk
 t+jL7E8PRQcf1SmRNcgMVkha7RpqerV2Mm6l+y8lKqpoF0TZsraPcZ3iroLJU4p/+xkb
 vEEsz3oyecX4XY7YlLm+EK1vsZJKppBMyv4kes88lqMUb6HZanNpbiMpB58ifYyS/7fy
 IfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IeXp5BZ/Lq4abNTc4ertLKWbmpOp/1JUq40+2cF+gE=;
 b=MiNrhL+j0w/VjfPnI9ubha4qXsmSaDn17wqjA4iXFZgcTS0V8Xn0LzAfuAt9x6zhZQ
 axosA+GKGl8bpnsQb/0vf9ZatePAHbjRlJ7UCW/sbK8w3Zrq9DWumw/g2sCgEl2oKE+d
 p0CKi17rRv6hqZltRDDA9dwZ2WGUWL/qoFdiHQIxgDv9N7zu5rqmpytrCR9tiEKU9eY1
 U8nMNfvbP/q+0wdH3Ty7IyCKVvMz1JKn31/WsrdP5acuONe8lHxnuyU710h+bGDxUjIq
 JNCXc0gTUMoaQFyPk/i6C5WMOP9PFNku7rWI47fvkzNQq7Oyyxr873KvwJTdLNbSW0ae
 +wVA==
X-Gm-Message-State: AOAM533POdnIrZ9iz4gFNJNqgM5zC5NA4dy+ekFDbEAJln2XhlLNK8wy
 4Y9WIaIVMGNbXygjZNQyVf99nkZ8o7nNa9Thp2GzCw==
X-Google-Smtp-Source: ABdhPJxY7a1Zt643Zlf3S70JVLS8+GSLk9mx1sx106cIIb7XOx5oKd4Uep7wHYL1/BveGu5edPT9GkswnI8jnWVIF24=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr10662950ybs.39.1650536848803; Thu, 21
 Apr 2022 03:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220413231456.35811-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20220413231456.35811-1-heinrich.schuchardt@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:27:17 +0100
Message-ID: <CAFEAcA-1Tbx8GkAH8aKGy_n9z=OHpCF_wJYMBsbMwSoyEtsx9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: impact of gic-version on max CPUs
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Apr 2022 at 00:15, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Describe that the gic-version influences the maximum number of CPUs.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  docs/system/arm/virt.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Applied to target-arm.next, thanks. I tweaked the punctuation a
bit to use a full stop instead of a hyphen.

-- PMM

