Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2FA4010CE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:18:25 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMuqd-00066n-P1
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMuoo-0004X3-Jp
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:16:30 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMuom-0002gV-Um
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:16:30 -0400
Received: by mail-oi1-f181.google.com with SMTP id p2so5772603oif.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 09:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7OEJHRO/GHX7tp7Zqt6jYWFw09DGS7KRDgcMdEZ/yY=;
 b=Z6ibWvTXKIjcW23W3WFW4Rr8cJxTNwCQiQpqCNFUELJKdasxihDmHOvi/hdCVkUYWr
 6uEBW4jEPe7VfEocAytuSbjSSdimXszsw4n68LlW61j+guiOKsHiAIVSijc/p6THLSdz
 WMEwUuKbtOHS9DA+17OBc40VNthQ8JBliAi2B1u63aH6QaAN3WBJxFIgt7rfY/sTnBE1
 Kbc8ohqVjJsMy/JFzIHkj57CTFzN7icF/5OEnGsxLbcKF2SQDEcY4Xa6egDPE2p6PU6Y
 79otSnVj2TGWyey/eQ+6LeLQTNey/Az+K56TSpch/v9YY+GAIKunW2vWs1Q0HW0voHFy
 KAlg==
X-Gm-Message-State: AOAM5320vNPPwFotyCE2SIeWdRsim0PTH++x4czmFjcTPry6173vrBiq
 eN5qU74418LZmVVIMummTwfUZfTpw6zCDmlKIQk=
X-Google-Smtp-Source: ABdhPJwcuETEwA+m/1GRj32IXM1a5mpuf7q6g6KAj30clf/b+ryC8QhtzvLF1Is4fQofNLwjeW7+hics2oRkCo5SHkw=
X-Received: by 2002:aca:4589:: with SMTP id s131mr5931811oia.121.1630858587967; 
 Sun, 05 Sep 2021 09:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
In-Reply-To: <20210905154049.7992-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 5 Sep 2021 18:16:16 +0200
Message-ID: <CAAdtpL65YJAKt8D-frvyWH-YiaKJg6qsO+2QFi=0=a4RRhh_uw@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Bin Meng <bmeng.cn@gmail.com>, Prasad J Pandit <pjp@fedoraproject.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.181;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing PJP for https://www.mail-archive.com/qemu-devel@nongnu.org/msg730311.html

On Sun, Sep 5, 2021 at 5:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> {read,write}_with_attrs might be missing, and the codes currently do
> not validate them before calling, which will cause segment fault.
>
> Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  softmmu/memory.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..b97ffd4ba7 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1426,12 +1426,14 @@ static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
>                                           mr->ops->impl.max_access_size,
>                                           memory_region_read_accessor,
>                                           mr, attrs);
> -    } else {
> +    } else if (mr->ops->read_with_attrs) {
>          return access_with_adjusted_size(addr, pval, size,
>                                           mr->ops->impl.min_access_size,
>                                           mr->ops->impl.max_access_size,
>                                           memory_region_read_with_attrs_accessor,
>                                           mr, attrs);
> +    } else {
> +        return MEMTX_ERROR;
>      }
>  }
>
> @@ -1506,13 +1508,15 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>                                           mr->ops->impl.max_access_size,
>                                           memory_region_write_accessor, mr,
>                                           attrs);
> -    } else {
> +    } else if (mr->ops->write_with_attrs) {
>          return
>              access_with_adjusted_size(addr, &data, size,
>                                        mr->ops->impl.min_access_size,
>                                        mr->ops->impl.max_access_size,
>                                        memory_region_write_with_attrs_accessor,
>                                        mr, attrs);
> +    } else {
> +        return MEMTX_ERROR;
>      }
>  }
>
> --
> 2.25.1
>

