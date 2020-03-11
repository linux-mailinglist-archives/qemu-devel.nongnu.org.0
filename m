Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AF2180E33
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 03:55:04 +0100 (CET)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBrWR-0007qv-LL
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 22:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <longpeng2@huawei.com>) id 1jBrVl-0007Nx-ME
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 22:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1jBrVk-0002Vp-Im
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 22:54:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35314 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1jBrVk-0002RP-7g
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 22:54:20 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7226A57F43097B6090E1;
 Wed, 11 Mar 2020 10:54:14 +0800 (CST)
Received: from [10.173.228.124] (10.173.228.124) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 11 Mar
 2020 10:54:12 +0800
Subject: Re: [PATCH] vfio/pci: Use defined memcpy() behavior
To: Alex Williamson <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>
References: <158386047731.30997.5580377889283866404.stgit@gimli.home>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <9487f777-20ab-2257-b03a-f99382b0bfec@huawei.com>
Date: Wed, 11 Mar 2020 10:54:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <158386047731.30997.5580377889283866404.stgit@gimli.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.228.124]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/11 1:15, Alex Williamson wrote:
> vfio_rom_read() relies on memcpy() doing the logically correct thing,
> ie. safely copying zero bytes from a NULL pointer when rom_size is
> zero, rather than the spec definition, which is undefined when the
> source or target pointers are NULL.  Resolve this by wrapping the
> call in the condition expressed previously by the ternary.
> 
> Additionally, we still use @val to fill data based on the provided
> @size regardless of mempcy(), so we should initialize @val rather
> than @data.
> 
> Reported-by: Longpeng <longpeng2@huawei.com>
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/vfio/pci.c |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5e75a95129ac..b0799cdc28ad 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -859,16 +859,17 @@ static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
>          uint16_t word;
>          uint32_t dword;
>          uint64_t qword;
> -    } val;
> -    uint64_t data = 0;
> +    } val = { 0 };
> +    uint64_t data;
>  
'val.qword' won't be used, maybe we could drop it silently.

Reviewed-by: Longpeng <longpeng2@huawei.com>

>      /* Load the ROM lazily when the guest tries to read it */
>      if (unlikely(!vdev->rom && !vdev->rom_read_failed)) {
>          vfio_pci_load_rom(vdev);
>      }
>  
> -    memcpy(&val, vdev->rom + addr,
> -           (addr < vdev->rom_size) ? MIN(size, vdev->rom_size - addr) : 0);
> +    if (addr < vdev->rom_size) {
> +        memcpy(&val, vdev->rom + addr, MIN(size, vdev->rom_size - addr));
> +    }
>  
>      switch (size) {
>      case 1:
> 
> .
> 
---
Regards,
Longpeng(Mike)

