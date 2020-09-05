Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6C25E514
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 04:43:27 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEOAo-0005gO-77
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 22:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEO9w-0005Bz-PB
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 22:42:32 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEO9u-0001aj-UY
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 22:42:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id a65so7632059otc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Kea3AsErUlytujuHN2AjjqqorwT+xurr8M3vpVxNPw=;
 b=Zu+m8Ss9hEnD8apYiu4OkDytLVl5F+XhT7pVEso43omTPxhG0veyHRkx/ix9rEO66C
 Ge43PexdKC0kXDV+DmA9I4uTy03n01cQtrmVSdsvIU6XaSgrUxSo/phbyS/M6kqk4ztA
 C2yXA39SvPEyaWc4Q06tvs0hPNVYn5QZdlaXfHVXpNSZBRyAdYQggmVGE/SQQImO9GAS
 Nkdqxp0gNgE7bcgt6Em5HYj4TdjRjk8s8VwygNvRxc3B8GCCS+EGr9vJ1StGiGHM83XM
 IksrNHD/LtF48uPz5IlrnoKejqhjEL8IkXetZYccaiAwzEDh5pV913P4rbllSUU9Y2du
 iXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Kea3AsErUlytujuHN2AjjqqorwT+xurr8M3vpVxNPw=;
 b=c95zSof33ZrUihgUXgGUxfdqmp4SQF6Xto33XthQ99rINld7cRA/KcUSgyLyYqcGrO
 nWG0R8yi2QfFjV19ZuHwQTMHDge8UZ8JN2Ef1qkmREFWQrRRDsna1FUp2A8VAPCHKYXU
 XySiiEAApHuJ4WPQyQOjs91cfPW1ZCvNgvQzOBmNkl+zIBKfQ3fUE2svQjSqgZHzA9Kn
 ZWOzW8LmT9/yt/DogyCJfjC/N9LSTNaL2f3/0Ydjy8tnZzP0F0c9hCoAd8flkkfKyBer
 jc1TV/AF6ITyIl4gv8OF7E2PpoCHpXFnNpSvJq/g9JvZSc6hm8ntSlbhIFa6ENuVo7mb
 9FVQ==
X-Gm-Message-State: AOAM530TBP37ggBROx5qs9CMww8r0c/x+VzZHURkrD1qM29p7EIJSXKe
 ywwUgBGi72dWDBg4CfQx2TVoxxitPgdfwm5/AJw=
X-Google-Smtp-Source: ABdhPJxTPPMcU0LIs6G9Wd7H/y3B1qv6a2kq3NP5jvgtXP7yKtuddcAwEtFILALDhlmkAk5xO97pacF28LGN2zWGzYU=
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr7411247oto.333.1599273749548; 
 Fri, 04 Sep 2020 19:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200904162620.657726-1-philmd@redhat.com>
 <20200904162620.657726-2-philmd@redhat.com>
In-Reply-To: <20200904162620.657726-2-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 5 Sep 2020 10:41:53 +0800
Message-ID: <CAKXe6SJ3dpoer-pA+5afMH4aVG89grnj_g6VEXYO2SwGdTLxWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pci: Let pci_dma_rw() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=
=9C=885=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=8812:26=E5=86=99=E9=81=
=93=EF=BC=9A
>
> dma_memory_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/pci/pci.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index a221dfb3b08..a85b0bc3c44 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -785,8 +785,22 @@ static inline AddressSpace *pci_get_address_space(PC=
IDevice *dev)
>      return &dev->bus_master_as;
>  }
>
> -static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> -                             void *buf, dma_addr_t len, DMADirection dir=
)
> +/**
> + * pci_dma_rw: Read from or write to an address space from PCI device.
> + *
> + * Return a MemTxResult indicating whether the operation succeeded
> + * or failed (eg unassigned memory, device rejected the transaction,
> + * IOMMU fault).
> + *
> + * @dev: #PCIDevice doing the memory access
> + * @addr: address within the #PCIDevice address space
> + * @buf: buffer with the data transferred
> + * @len: the number of bytes to read or write
> + * @dir: indicates the transfer direction
> + */
> +static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> +                                     void *buf, dma_addr_t len,
> +                                     DMADirection dir)
>  {
>      return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
>                           dir, MEMTXATTRS_UNSPECIFIED);

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> --
> 2.26.2
>
>

