Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3625E516
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 04:44:22 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEOBh-0007Iy-EN
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 22:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEOAY-0005ss-5w
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 22:43:10 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEOAU-0001mP-K7
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 22:43:09 -0400
Received: by mail-ot1-x342.google.com with SMTP id a2so7611853otr.11
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7tW4HnNXC7IOAGktO6AHOo51WyVj3X82+snAa41Zlqo=;
 b=tGhEEfel8vJQ5DSm6WN7bWck/wAWJh1ukUmn3xH3yuuFOHpQR+/5pdYJnl7som+scI
 C4XCUy0yK0+W2cLTMocpzBSrSrE507I949JCMO4uNRomKmpdda5phGttroVL9nzZAvYN
 VhYn4kAz9AlcqCfP0gJKJwn3Lq7gNKQOifBzRDps0UdpMPweF+qrNRvVoOeHEcL6H0LY
 TPMFlAO6SzVTPjWHYVB50StA5Okn1NceI/+Cidfc7TYQVfVytMQ9sRmBm6yyGt2CTWK+
 KHQlr0dMFvrpjw0Wxw0oNtVGWp1nXdTrMd3tIYJA/IZTVFgDzAuFilVhUSSAO8el1eKg
 azNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7tW4HnNXC7IOAGktO6AHOo51WyVj3X82+snAa41Zlqo=;
 b=NwlPe3D5jcK2/iXNs8xjbP04VT/D4KZ5X5136/Wo1CgjIjrZH6Y0XWO/UV92IBR2D3
 wDnvYbgVEZQn8R/QdK7+dx1QHf0lKzVobXri4hHx9BwpqOElMD/W8Gtr8A6OVjxk/KIN
 62kt3AYyW3PI/wPhyr90wPK1KP38saHAy270K/36N/zXkIiNkuyM7VkaChZeNNMsCnT9
 mvwI2PSGCcrTwfMqQTBDCX3Okz+tOVoPiGOTIWqK77U+MAXxU5p9ZY7hMuK/eXqNmP88
 wptHD9LJwjXmoGwnvZ0Mf6MVXyrP6j7TQH2tkBN+tms3ff0/IT7hdFeyllgsmDOKCr+N
 QP0g==
X-Gm-Message-State: AOAM532+EL12na+TF0SBQOmhvpTpWv4x4TogPAGsR1XLPOqnCiir6fIz
 oA7i13lugNLdDyj+cfu8jXl9EpKB7kjErIpcfik=
X-Google-Smtp-Source: ABdhPJwa6Cp9YHZLGr8upnuUFtIgXEAL4cpLofnworamLw6Yh/13hVkiOWq9p46cr4oLyMNzrMAN45sbE44pRk4RRos=
X-Received: by 2002:a05:6830:2302:: with SMTP id
 u2mr7337573ote.181.1599273785376; 
 Fri, 04 Sep 2020 19:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200904162620.657726-1-philmd@redhat.com>
 <20200904162620.657726-4-philmd@redhat.com>
In-Reply-To: <20200904162620.657726-4-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 5 Sep 2020 10:42:29 +0800
Message-ID: <CAKXe6S+3DonkF7OFpi2o15OtCrTT=FAFLsJ_BBHovyudvqxdLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pci: Let pci_dma_write() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
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
> pci_dma_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  include/hw/pci/pci.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index bb57525dffd..76826e240a9 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -824,8 +824,20 @@ static inline MemTxResult pci_dma_read(PCIDevice *de=
v, dma_addr_t addr,
>      return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
>  }
>
> -static inline int pci_dma_write(PCIDevice *dev, dma_addr_t addr,
> -                                const void *buf, dma_addr_t len)
> +/**
> + * pci_dma_write: Write to address space from PCI device.
> + *
> + * Return a MemTxResult indicating whether the operation succeeded
> + * or failed (eg unassigned memory, device rejected the transaction,
> + * IOMMU fault).
> + *
> + * @dev: #PCIDevice doing the memory access
> + * @addr: address within the #PCIDevice address space
> + * @buf: buffer with the data transferred
> + * @len: the number of bytes to write
> + */
> +static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
> +                                        const void *buf, dma_addr_t len)
>  {
>      return pci_dma_rw(dev, addr, (void *) buf, len, DMA_DIRECTION_FROM_D=
EVICE);
>  }
> --
> 2.26.2
>
>

