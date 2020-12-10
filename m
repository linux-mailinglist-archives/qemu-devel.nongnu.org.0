Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34392D5EB9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:56:37 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNMy-0005ho-TW
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNKs-0004lh-SS
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:54:26 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNKq-0008GN-K3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:54:26 -0500
Received: by mail-il1-x142.google.com with SMTP id 2so5539352ilg.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tFPSuEw5e4pj1irmJoWUQHCXuxgSTo2RlsusyGmz6NI=;
 b=u8YDiqaB6sVVctjnQZi62wW/KjlO3tqENPYqwwpyd6WwV+L5BdS9fSqCQiGNRV2Ag4
 UYHO28SRJduJphoiI1NiYKepZ1+Db97cVWjxJZ6NRpG7fWajKSsvEKtF6broegPabN7t
 3E3a707SRZpYvmhFQB896NIIJquEJXjoZySB26CxKVuwPGsyudnZoC2ltH8Rq20tOue2
 lsqFLTK9X2oH3uhqwRCl8hPtOZS8h7Irg+kGAElvFJjmUNlvfDsY+dfQmx0qMBOSPP2r
 veZFSSLEfNJgcshK1OJHsPAg+LgzhIrpKXAbHP1K7HQ0ZzkjZXMZxjcrJpuRGxcWy4pd
 JWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFPSuEw5e4pj1irmJoWUQHCXuxgSTo2RlsusyGmz6NI=;
 b=ediKKKRxQPkL3hKxwlAbIP4ej35uSuE9hVnLVGXOwwM4S8L1YanqDFWiGgYiMkI3gw
 +f5lXxN9LSQWI9zwjj7utk1zs+YjTjwUP+q4uWeA2sLa3xq896YK4a4nfd0L4K1eNvd4
 y2nb7jbJbqFmo7WnqjZHtVruqkLmZJlR43Ny3z2P/R7/DW2JoOCvWi3ph0iSbouE1FIp
 wOl+gLZQJNNaH0ISNEDMnr9JIt4LA/i/ogXhH0Ipn1xnD3oXeMJCY/l2TAXMMzksTZyk
 QLfAF191T6yRk5uSmfSNTybfdOdN7vVrA2E+mvs1XoxIL4BoMA8msi9Y+jCrNjmCgRT/
 pNSA==
X-Gm-Message-State: AOAM533Whp7hQ287JhtQl39ZT3z7ePho3A+cvBuZ5v+Flqq1w/9O5Vb9
 BJPgyX7zSO94mdtFC9BZTxiPngex908TXDd93NY=
X-Google-Smtp-Source: ABdhPJw4HorVpPsggfJ++ILOt1o60c7tg2yQ2tBH7cI4rM7L2ijhuBOQrsg6yaJSjl+NiRdUEN/6N0JasYddPAlWdds=
X-Received: by 2002:a92:c112:: with SMTP id p18mr9756416ile.89.1607612063416; 
 Thu, 10 Dec 2020 06:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-8-david@redhat.com>
In-Reply-To: <20201208163950.29617-8-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Dec 2020 15:54:12 +0100
Message-ID: <CAM9Jb+gOvCqW2rcz++SG1VZV0PoaZqx-_fE5X54PFttD-+1X_w@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x142.google.com
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

> We have users in migration context that don't hold the BQL (when
> finishing migration). To prepare for further changes, use a dedicated mutex
> instead of atomic operations. Keep using qatomic_read ("READ_ONCE") for the
> functions that only extract the current state (e.g., used by
> virtio-balloon), locking isn't necessary.
>
> While at it, split up the counter into two variables to make it easier
> to understand.
>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
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
>  softmmu/physmem.c | 70 ++++++++++++++++++++++++++---------------------
>  1 file changed, 39 insertions(+), 31 deletions(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3027747c03..448e4e8c86 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3650,56 +3650,64 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
>      }
>  }
>
> -/*
> - * If positive, discarding RAM is disabled. If negative, discarding RAM is
> - * required to work and cannot be disabled.
> - */
> -static int ram_block_discard_disabled;
> +static unsigned int ram_block_discard_requirers;
> +static unsigned int ram_block_discard_disablers;
> +static QemuMutex ram_block_discard_disable_mutex;
> +
> +static void ram_block_discard_disable_mutex_lock(void)
> +{
> +    static gsize initialized;
> +
> +    if (g_once_init_enter(&initialized)) {
> +        qemu_mutex_init(&ram_block_discard_disable_mutex);
> +        g_once_init_leave(&initialized, 1);
> +    }
> +    qemu_mutex_lock(&ram_block_discard_disable_mutex);
> +}
> +
> +static void ram_block_discard_disable_mutex_unlock(void)
> +{
> +    qemu_mutex_unlock(&ram_block_discard_disable_mutex);
> +}
>
>  int ram_block_discard_disable(bool state)
>  {
> -    int old;
> +    int ret = 0;
>
> +    ram_block_discard_disable_mutex_lock();
>      if (!state) {
> -        qatomic_dec(&ram_block_discard_disabled);
> -        return 0;
> +        ram_block_discard_disablers--;
> +    } else if (!ram_block_discard_requirers) {
> +        ram_block_discard_disablers++;
> +    } else {
> +        ret = -EBUSY;
>      }
> -
> -    do {
> -        old = qatomic_read(&ram_block_discard_disabled);
> -        if (old < 0) {
> -            return -EBUSY;
> -        }
> -    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
> -                             old, old + 1) != old);
> -    return 0;
> +    ram_block_discard_disable_mutex_unlock();
> +    return ret;
>  }
>
>  int ram_block_discard_require(bool state)
>  {
> -    int old;
> +    int ret = 0;
>
> +    ram_block_discard_disable_mutex_lock();
>      if (!state) {
> -        qatomic_inc(&ram_block_discard_disabled);
> -        return 0;
> +        ram_block_discard_requirers--;
> +    } else if (!ram_block_discard_disablers) {
> +        ram_block_discard_requirers++;
> +    } else {
> +        ret = -EBUSY;
>      }
> -
> -    do {
> -        old = qatomic_read(&ram_block_discard_disabled);
> -        if (old > 0) {
> -            return -EBUSY;
> -        }
> -    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
> -                             old, old - 1) != old);
> -    return 0;
> +    ram_block_discard_disable_mutex_unlock();
> +    return ret;
>  }
>
>  bool ram_block_discard_is_disabled(void)
>  {
> -    return qatomic_read(&ram_block_discard_disabled) > 0;
> +    return qatomic_read(&ram_block_discard_disablers);
>  }
return value won't be bool?
>
>  bool ram_block_discard_is_required(void)
>  {
> -    return qatomic_read(&ram_block_discard_disabled) < 0;
> +    return qatomic_read(&ram_block_discard_requirers);
same here.
>  }
> --
Apart from query above, looks good.
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

