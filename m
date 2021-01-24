Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F76301EDF
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:10:02 +0100 (CET)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3me1-0007Pq-0K
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l3mcg-0006xW-9e
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:08:38 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:38769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l3mcd-0001sQ-4s
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:08:37 -0500
Received: by mail-qv1-xf33.google.com with SMTP id n14so581990qvg.5
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SR5BnCujM+qA178b3+b17D6mBhhKgLZL65y5SU7GbOo=;
 b=tlIaHu1AO4s7l4BKzU3tgfwk0kUtz5idEC4XP2ndNmebZ42ZTGh491aLei0WBJVAyv
 5KcL5/9hS4JEBO9pUw0FrIOCjBmxrnT5f7JbBfRyxkn6FthTCQh+yQr9lRZT8qmL2Zaj
 E8fOH1lQGsIyPv8X0u3HwaGGPxoIszfKdDwrYr1sToYHZyGwm/7bpbj2GeLg5dbXEzl7
 AKxiZqZJoYPZwreGSnugMLUJCDEqa6iiriqMv2CYkmDxDQdmRjUTBFrHG9ey7Z37UZ6n
 c/Kd2YK4Eu7NeISfRTHIHikv/w9FRBcVZaZ0QBOjAfxNVnZdJLIG+gCQ8hKNW4zfR/ub
 k87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SR5BnCujM+qA178b3+b17D6mBhhKgLZL65y5SU7GbOo=;
 b=q79RO3CAjkEWqdGOu8WIyDM+n+rEZ9NaiEJQhdKo0a7zn/R4nFwosq22YJBWXgQYeq
 jozVcr4mcUsdobl2ZRHgwxjtQlgpQsv1VZZxqzeESXiHAkB+U2oHpTtiI5ZIYskuLUeK
 oFxCUqwr8cs9RX7qB2qzfdtUbr7RUsjsc9ZJ2evMGhkKVXj1x87a56A+3YzVj7+2HzqJ
 Ppp+IncsUqrwyvIh1TxG5u4n/iBn6jCOLZ3TJaoLz0cy9PBlcdXWZ2We45v0VYsjcxGc
 oxn/G6w3V80WjZtMa+0qOCvp2Emm0OFjtz5UfSpsIxWeiBLl+70zSXfDEH3xFajoU6if
 CSEw==
X-Gm-Message-State: AOAM533IR+k7oN9g/Kon2ydxppa0XIw0dHHLlrgwV6i++Y+0EkoVr1kA
 n8FIuhz5cn7+48MGp7Kwnvk=
X-Google-Smtp-Source: ABdhPJzh/Ks31diGJ0clHPgEduai58Wn1+gXIyWG5kTdFg07m/ocQTSGBsniPzF5JJbbdmxBYjAlyg==
X-Received: by 2002:a0c:8e85:: with SMTP id x5mr4135403qvb.11.1611522512623;
 Sun, 24 Jan 2021 13:08:32 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id k14sm5781640qtj.40.2021.01.24.13.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 13:08:31 -0800 (PST)
Date: Sun, 24 Jan 2021 14:08:29 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Yang Weijiang <weijiang.yang@intel.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
Message-ID: <20210124210829.GA2238365@ubuntu-m3-large-x86>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113090430.26394-1-weijiang.yang@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=natechancellor@gmail.com; helo=mail-qv1-xf33.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 05:04:30PM +0800, Yang Weijiang wrote:
> QEMU option -cpu max(max_features) means "Enables all features supported by
> the accelerator in the current host", this looks true for all the features
> except guest max physical address width, so add this patch to enable it.
> 
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>  target/i386/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb..b5943406f7 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>                  warned = true;
>              }
>  
> -            if (cpu->host_phys_bits) {
> +            if (cpu->host_phys_bits || cpu->max_features) {
>                  /* The user asked for us to use the host physical bits */
>                  cpu->phys_bits = host_phys_bits;
>                  if (cpu->host_phys_bits_limit &&
> -- 
> 2.17.2
> 
> 

Hi,

This patch as commit 5a140b255d ("x86/cpu: Use max host physical address
if -cpu max option is applied") prevents me from using '-cpu host' while
booting an i386_defconfig kernel.

$ qemu-system-i386 \
-append console=ttyS0 \
-cpu host \
-display none \
-enable-kvm \
-initrd rootfs.cpio \
-kernel bzImage \
-serial mon:stdio
qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)

Am I expected to pass "-cpu host,host-phys-bits=false" now or did this
do something unexpected?

Cheers,
Nathan

