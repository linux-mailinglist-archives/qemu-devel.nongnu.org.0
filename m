Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A03F1B98
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:28:53 +0200 (CEST)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj2K-0004H6-TS
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGizN-0006WN-Bn
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:25:49 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGizJ-00025n-Ey
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:25:49 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b10so13278650eju.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BxHpTsx7fHyGxR3bMEq8sHGo/95EZYvobZqECuQcetY=;
 b=ehJN3+5jsWBuJrI65SDJ/Ojay/xGFTzmCtWr24kLXs4jLnlpPHqUZUbwKwUGmqogzO
 3MmDRlJignhNPwoSO1Ywkz4b511TeiZTNi4NEP5yygj/MlPb9bPBnU8Yp3T95xXoWpK0
 Qq/cpPKX7u/Dt63TjWbi/s+GnaN1U4pEQhFkt1Y/s7q+3j1yfqjjVZsDVeSL1mzD544/
 CMW8MQCS0YaW8oPXdrsknRY/C1ppaW3qsKyr0bnorHmPhz2jULhh6V5MZvmLnTTc8qwL
 5z01YU9VmcXt2tXwoHHrmQ/kMQ0mkAXRLtM2UroIQdcmEMQqrHTv9mkKKNGJtC7p7jMl
 CCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BxHpTsx7fHyGxR3bMEq8sHGo/95EZYvobZqECuQcetY=;
 b=e36n1xUV9VxpiyTaedD+1pPGJpIjJjP7bXBsPBE+G2Roz8Po/3kbnkVjUk8TrZACDj
 dvf7zEYmxGsWm2v0tr9VgpRp003rppjcGc8tzxl9w7Ybnr8J7lS8VjgWvJyTL0y5xN2O
 Ah5wWiBqXa/Nqqi2I2Q8nehrR35EwYXOfZfTk+7C01acw8C+mTyPcqMKBoCVlQknjYuV
 NBOFwG+Iszx08Us6rBnJbC2F6NreTRqgUMmqUlKAECwIBswqLj4hvz0ndxMzX9TV/c2r
 Fu2ca/JU8sw7E6Wo5sQt1+llIiLWTQdOBC8pC2Sx3pnI9lORDaxOF+SlEPZrk/Wi3svY
 nOig==
X-Gm-Message-State: AOAM532dHzOcpsa7zJEiyq1BizG8vSnr+WcogPijZG4LB12dwzgRdSEY
 iH15K5fdM0Fn0GSnhT0K/WiQrMI6xleZxUXUdRygGA==
X-Google-Smtp-Source: ABdhPJxu12EXNFjSEo5iWGC89QxcwYezcHdEiC65qtF0w1Ix67GwaVBuvJzRlT3LYQPvv9Am0ogzEDuIbUloL8gkpsk=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16461222ejn.56.1629383143590; 
 Thu, 19 Aug 2021 07:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-3-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:24:57 +0100
Message-ID: <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
Subject: Re: [PATCH 2/6] memory: Introduce address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Introduce address_space_create(). In is similar to
> address_space_init() but returns a pointer to a heap
> allocated  AddressSpace.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/memory.h | 14 ++++++++++++++
>  softmmu/memory.c      | 10 ++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317f..b353a48c25f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryReg=
ion *mr,
>   */
>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char=
 *name);
>
> +/**
> + * address_space_create: Create and initializes an address space
> + *
> + * @root: a #MemoryRegion that routes addresses for the address space
> + * @name: an address space name.  The name is only used for debugging
> + *        output.
> + *
> + * Returns pointer to initialized #AddressSpace.
> + *
> + * The caller is responsible for releasing the pointer returned
> + * with address_space_destroy() after use.
> + */
> +AddressSpace *address_space_create(MemoryRegion *root, const char *name)=
;
> +

I'm not really a fan of this as an API -- almost always I think
devices would do better to have an AddressSpace foo field in
their device struct and call address_space_init() on that.
Hiding the heap allocation inside this function makes it harder
to notice it during code review, I think.

thanks
-- PMM

