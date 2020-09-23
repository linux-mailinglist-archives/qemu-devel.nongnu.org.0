Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3427583C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 14:50:55 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL4EY-00063z-JK
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 08:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL48j-0001IU-C1
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 08:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL48h-0007BU-EZ
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 08:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600865090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zhUb9o8dmSTPl1fvZJjR7IlhrbCzI/VzKj45MO8cQo=;
 b=B22RWWq4TKFqV3ObXx/ZttU0I7fjorV2PwWhM0lAUbA0mWO2gKXpZiGzF/M+ln+0WAuZ3h
 zfRPhev6ixs2ua59pJdPWMrap3MgtYw7zqxgV9XvJRSNHPmUGzsDqDfHXlt0nx/MYE5t6R
 BsdYUKK0LFAQ5uYHJP6PShmgupiQ68M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-No5UDhvYPDOZSxmXNwpZmw-1; Wed, 23 Sep 2020 08:44:49 -0400
X-MC-Unique: No5UDhvYPDOZSxmXNwpZmw-1
Received: by mail-wr1-f71.google.com with SMTP id g6so8799108wrv.3
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 05:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2zhUb9o8dmSTPl1fvZJjR7IlhrbCzI/VzKj45MO8cQo=;
 b=JYIPhCsU089xT5rN/bxCUH08ON7FZyZ2bQKlgt9pYiLbe7zXcyaWXrDX3tELmv1nhk
 p0PQNe6M0oZHa980kIXYfEJ3Jo/gVrsnImmX9iP8Vq7oW4g2R9IwZ3bxrMWKeRyr8VCs
 QmCza750AxDiSVgtGw0Y+4HEl6nFqoXgD2cQFXxYSFnpx5KS+kJrCkiya4cuxc9smyrf
 TYA3lehx9hGNL/Qj+REGdin7276wnXtq+Ti2ajphnuQ7oZbj2fImW7MAMjQghMHjL8px
 00bQvkonmoglJqkCjn9XXSXTLMXisi0Tr8Zvg/22nqkGT9r8VDLP7gKW3X359eG2jaUC
 ljLQ==
X-Gm-Message-State: AOAM531qK8zSK1NhFOdARWPi9UAFHR7p/BGnOLqO6bvSHEcJBpnGronq
 lx9GaZRgCSEd/rzeHNlfpYWiwQ/NewcvHNdlHCk8XSgvsd6AkhJ4s3ZqVuQTyOWwTr8fngAmAcV
 /ijfxZJPK6ayv2Nc=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr6181417wmc.148.1600865087989; 
 Wed, 23 Sep 2020 05:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyILtNWqnwQPNgzbrGn9kDtMaRXs25v9O+ykJGDejagoPmt1CBv53o2UpYfKbNOtsCDbmuZgw==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr6181406wmc.148.1600865087769; 
 Wed, 23 Sep 2020 05:44:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:15f1:648d:7de6:bad9?
 ([2001:b07:6468:f312:15f1:648d:7de6:bad9])
 by smtp.gmail.com with ESMTPSA id w7sm441258wmc.43.2020.09.23.05.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 05:44:46 -0700 (PDT)
Subject: Re: [PATCH] kvm: Correct documentation of kvm_irqchip_*()
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200922203612.2178370-1-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d42b6ba7-34cc-4d48-96c3-6d676fde24cb@redhat.com>
Date: Wed, 23 Sep 2020 14:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922203612.2178370-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/20 22:36, Eduardo Habkost wrote:
> When split irqchip support was introduced, the meaning of
> kvm_irqchip_in_kernel() changed: now it only means the LAPIC is
> in kernel.  The PIC, IOAPIC, and PIT might be in userspace if
> irqchip=split was set.  Update the doc comment to reflect that.
> 
> While at it, remove the "the user asked us" part in
> kvm_irqchip_is_split() doc comment.  That macro has nothing to do
> with existence of explicit user-provided options.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/sysemu/kvm.h | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 5bbea538830..23fce48b0be 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -51,23 +51,22 @@ extern bool kvm_msi_use_devid;
>  /**
>   * kvm_irqchip_in_kernel:
>   *
> - * Returns: true if the user asked us to create an in-kernel
> - * irqchip via the "kernel_irqchip=on" machine option.
> + * Returns: true if an in-kernel irqchip was created.
>   * What this actually means is architecture and machine model
> - * specific: on PC, for instance, it means that the LAPIC,
> - * IOAPIC and PIT are all in kernel. This function should never
> - * be used from generic target-independent code: use one of the
> - * following functions or some other specific check instead.
> + * specific: on PC, for instance, it means that the LAPIC
> + * is in kernel.  This function should never be used from generic
> + * target-independent code: use one of the following functions or
> + * some other specific check instead.
>   */
>  #define kvm_irqchip_in_kernel() (kvm_kernel_irqchip)
>  
>  /**
>   * kvm_irqchip_is_split:
>   *
> - * Returns: true if the user asked us to split the irqchip
> - * implementation between user and kernel space. The details are
> - * architecture and machine specific. On PC, it means that the PIC,
> - * IOAPIC, and PIT are in user space while the LAPIC is in the kernel.
> + * Returns: true if the irqchip implementation is split between
> + * user and kernel space.  The details are architecture and
> + * machine specific.  On PC, it means that the PIC, IOAPIC, and
> + * PIT are in user space while the LAPIC is in the kernel.
>   */
>  #define kvm_irqchip_is_split() (kvm_split_irqchip)
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


