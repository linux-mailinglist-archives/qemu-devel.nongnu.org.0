Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F22D4B20
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:58:35 +0100 (CET)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5be-0007Xy-VV
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Uu-0003gs-HS
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:47:39 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:38946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Us-0003bJ-C1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:47:31 -0500
Received: by mail-io1-xd41.google.com with SMTP id d9so2690696iob.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bD066L+lOJtg/6w6zGLCpLKRpTcjSACPVIk4cCFkpzA=;
 b=dgh3a4j/jkYy+queigdzESoPAyt88gixWmaUXmrkmOVDeMnFGczTNTsnN9U9I2Mnv4
 aw7wwrdPBOK3mNuuEhV8CWVKJq57JEdMUjHE/ASWCm021xjVS2Q4uuKHESqG43vNv/jJ
 ylLKnf1Y/tH4f4ter6+7Ti/BMRSPCutGpuipYn0yhvHCzKviqqkL9jI/yYKCEyz7HuLl
 oB4UuNuN1t3QfAjYnG84Jy0VZsR2n0/JeYTa0YbFh6bJ//zJeimPEh2MYSCsuV8ClJku
 60+h/KAjbgm0Ns7KsXdsuHNXGk4I3H7YQQEDf6rwzhU2KeyHMx48uL1UwHvNeiaRURnS
 Q0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bD066L+lOJtg/6w6zGLCpLKRpTcjSACPVIk4cCFkpzA=;
 b=Rm435aARuAC5sSgbkBOSR38N7hMB29ttvp1u8LDy1NTxutqxmedsyoJ8TP0zeFyNX1
 IKftZkyXVa1bldOr/wsi4/BjRbARwSTp81hdyRERQabccNMWxkcDYuUVbUlHQqBS7N8q
 aM19eELZ17JPpR9yNbtYkl9BXVAUk1J25DjjUYvV2fq1N/YXqu+Zc2BkY3FZC+7RVca2
 exgVaxrcDi+o4clr9NtXhSjronjxTjw7saf5dmFjw380O9m3piERAiyjDCd008Zd4LGU
 HJyf6+/7JsxXp+7O+nuPsDklrCCfGg/U6mGz8L8raGlJ0KDmSusIfe0UmQoq6d556+mH
 KhVQ==
X-Gm-Message-State: AOAM533zGoniAKCmzvoD/ndQ2s/TXI4Ec/UthkYmkd8z5Z+DZMcR8FV0
 GYhyqn4cSvBo8smRYlkcaPIJhHC2ur9JoLImYJU=
X-Google-Smtp-Source: ABdhPJw1zXBxGZQJplnJ5+xY9JMw2pH2KEtt5Fa224Tp8vHfX4EkAESImp37RrZP/uLMZKuUv1pVmLP2w/uc7082Dpc=
X-Received: by 2002:a05:6602:228c:: with SMTP id
 d12mr4695359iod.67.1607539648942; 
 Wed, 09 Dec 2020 10:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-9-david@redhat.com>
In-Reply-To: <20201208163950.29617-9-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 19:47:17 +0100
Message-ID: <CAM9Jb+gkw4PnCaKmvw1OV97p_WkOU=ep9v4ENfmn7pzYNbWq4A@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd41.google.com
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We want to separate the two cases whereby we discard ram
> - uncoordinated: e.g., virito-balloon
> - coordinated: e.g., virtio-mem coordinated via the RamDiscardMgr
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h | 18 +++++++++++++--
>  softmmu/physmem.c     | 54 ++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 64 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 30d4fcd2c0..3f0942aa5b 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2804,6 +2804,12 @@ static inline MemOp devend_memop(enum device_endian end)
>   */
>  int ram_block_discard_disable(bool state);
>
> +/*
> + * See ram_block_discard_disable(): only disable unccordinated discards,
s/unccordinated/uncoordinated
> + * keeping coordinated discards (via the RamDiscardMgr) enabled.
> + */
> +int ram_block_uncoordinated_discard_disable(bool state);
> +
>  /*
>   * Inhibit technologies that disable discarding of pages in RAM blocks.
>   *
> @@ -2813,12 +2819,20 @@ int ram_block_discard_disable(bool state);
>  int ram_block_discard_require(bool state);
>
>  /*
> - * Test if discarding of memory in ram blocks is disabled.
> + * See ram_block_discard_require(): only inhibit technologies that disable
> + * uncoordinated discarding of pages in RAM blocks, allowing co-existance with
> + * technologies that only inhibit uncoordinated discards (via the
> + * RamDiscardMgr).
> + */
> +int ram_block_coordinated_discard_require(bool state);
> +
> +/*
> + * Test if any discarding of memory in ram blocks is disabled.
>   */
>  bool ram_block_discard_is_disabled(void);
>
>  /*
> - * Test if discarding of memory in ram blocks is required to work reliably.
> + * Test if any discarding of memory in ram blocks is required to work reliably.
>   */
>  bool ram_block_discard_is_required(void);
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 448e4e8c86..7a4f3db1b4 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3650,8 +3650,14 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
>      }
>  }
>
> +/* Require any discards to work. */
>  static unsigned int ram_block_discard_requirers;
> +/* Require only coordinated discards to work. */
> +static unsigned int ram_block_coordinated_discard_requirers;
> +/* Disable any discards. */
>  static unsigned int ram_block_discard_disablers;
> +/* Disable only uncoordinated disards. */
s/disards/discards
> +static unsigned int ram_block_uncoordinated_discard_disablers;
>  static QemuMutex ram_block_discard_disable_mutex;
>
>  static void ram_block_discard_disable_mutex_lock(void)
> @@ -3677,10 +3683,27 @@ int ram_block_discard_disable(bool state)
>      ram_block_discard_disable_mutex_lock();
>      if (!state) {
>          ram_block_discard_disablers--;
> -    } else if (!ram_block_discard_requirers) {
> -        ram_block_discard_disablers++;
> +    } else if (ram_block_discard_requirers ||
> +               ram_block_coordinated_discard_requirers) {
> +        ret = -EBUSY;
>      } else {
> +        ram_block_discard_disablers++;
> +    }
> +    ram_block_discard_disable_mutex_unlock();
> +    return ret;
> +}
> +
> +int ram_block_uncoordinated_discard_disable(bool state)
> +{
> +    int ret = 0;
> +
> +    ram_block_discard_disable_mutex_lock();
> +    if (!state) {
> +        ram_block_uncoordinated_discard_disablers--;
> +    } else if (ram_block_discard_requirers) {
>          ret = -EBUSY;
> +    } else {
> +        ram_block_uncoordinated_discard_disablers++;
>      }
>      ram_block_discard_disable_mutex_unlock();
>      return ret;
> @@ -3693,10 +3716,27 @@ int ram_block_discard_require(bool state)
>      ram_block_discard_disable_mutex_lock();
>      if (!state) {
>          ram_block_discard_requirers--;
> -    } else if (!ram_block_discard_disablers) {
> -        ram_block_discard_requirers++;
> +    } else if (ram_block_discard_disablers ||
> +               ram_block_uncoordinated_discard_disablers) {
> +        ret = -EBUSY;
>      } else {
> +        ram_block_discard_requirers++;
> +    }
> +    ram_block_discard_disable_mutex_unlock();
> +    return ret;
> +}
> +
> +int ram_block_coordinated_discard_require(bool state)
> +{
> +    int ret = 0;
> +
> +    ram_block_discard_disable_mutex_lock();
> +    if (!state) {
> +        ram_block_coordinated_discard_requirers--;
> +    } else if (ram_block_discard_disablers) {
>          ret = -EBUSY;
> +    } else {
> +        ram_block_coordinated_discard_requirers++;
>      }
>      ram_block_discard_disable_mutex_unlock();
>      return ret;
> @@ -3704,10 +3744,12 @@ int ram_block_discard_require(bool state)
>
>  bool ram_block_discard_is_disabled(void)
>  {
> -    return qatomic_read(&ram_block_discard_disablers);
> +    return qatomic_read(&ram_block_discard_disablers) ||
> +           qatomic_read(&ram_block_uncoordinated_discard_disablers);
>  }
>
>  bool ram_block_discard_is_required(void)
>  {
> -    return qatomic_read(&ram_block_discard_requirers);
> +    return qatomic_read(&ram_block_discard_requirers) ||
> +           qatomic_read(&ram_block_coordinated_discard_requirers);
>  }

How to differentiate if we have both un-coordinated & coordinated
cases together?

