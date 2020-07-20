Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42A2259FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 10:26:13 +0200 (CEST)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxR7k-0008Ub-DO
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 04:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jxR6c-0007iN-8H
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 04:25:02 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27438
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jxR6a-0001gA-Na
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 04:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595233499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49GZ6We9Ef+Cwest0ZEcgIIXf9t8GN+9skXH3jVyZe8=;
 b=Kvw4LzUUsvuyfFk9P14W5U2IkO+XUEYtZHS7Cuw+0rIVzxU6OQ24oikWX7R9saM627matw
 kXSD5MXDhdwbAXiHdHbqWau188FzACB1QGx1uukeYu0YM5ie6erjXmgc8I4jS2pEhxXj6Z
 68ymmJJrkX+ptMOYi/3Xwbb2kW+tUWU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-WwzogC8qNkWjjRx8F949rw-1; Mon, 20 Jul 2020 04:24:57 -0400
X-MC-Unique: WwzogC8qNkWjjRx8F949rw-1
Received: by mail-wr1-f72.google.com with SMTP id i10so11810904wrn.21
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=49GZ6We9Ef+Cwest0ZEcgIIXf9t8GN+9skXH3jVyZe8=;
 b=aeOphpo1V71RUxFWgVq/3fz/vziatcLXz4YJdn7hfFkSbZcfWNeOS2WWSE7OWKdPBY
 0mA4WoaEi6sdrl7CdtFW/ahR3Soa3uuTIyTxiFUgeY+IugSaJb6ML2vvaOWKV1mAbuPq
 csrd/6/EcwKMWMMD+EvAYFQj6Zp6ozsZHNUK3Z7laW6mn/xrTSD5lch1XqUxVXDaSu8I
 0UrUixdUJdTN08c023fZTkcYOg2NDjYPTLU1X0gp58F6c1tQgLJMUx7rn0mIPyHVhgIV
 2zjDEfM9jAflZgDuCCksMuUI2AK0YvvK/6pGYpdWI5eVTAexKW2wc6dpoCjRlwt58XAR
 AYGw==
X-Gm-Message-State: AOAM531h7dDkx9EJ3hKaLkxBE02JhHXGmXN5BYM56JY5RTq0O9fQbw2M
 +goqGKhqGO7JpSUPYPx8epIBxKB9vIiFTHRD8YlrzPXa+dIMZ9Mt/8ex6WZn6Y3ya8GPdSG6u6z
 IEura2CVWAuvXcok=
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr20169861wru.22.1595233495425; 
 Mon, 20 Jul 2020 01:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp0aRrUKNx8xfrtCs5OgdEeWEa75/VyhKvlZqt3XMwqfltiapnxqe+w6yjy9Le8Z88lX79zw==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr20169830wru.22.1595233495124; 
 Mon, 20 Jul 2020 01:24:55 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id j16sm32466556wrt.7.2020.07.20.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:24:54 -0700 (PDT)
Date: Mon, 20 Jul 2020 10:24:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kenta Ishiguro <kentaishiguro@slowstart.org>
Subject: Re: [PATCH] hw/i386/kvm/ioapic.c: fix typo in error message
Message-ID: <20200720082437.sbuylue5l5co4yyu@steredhat>
References: <20200717123514.15406-1-kentaishiguro@slowstart.org>
MIME-Version: 1.0
In-Reply-To: <20200717123514.15406-1-kentaishiguro@slowstart.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 21:45:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Cc qemu-trivial@nongnu.org

On Fri, Jul 17, 2020 at 09:35:14PM +0900, Kenta Ishiguro wrote:
> Fix a typo in an error message for KVM_SET_IRQCHIP ioctl:
> "KVM_GET_IRQCHIP" should be "KVM_SET_IRQCHIP".
> 
> Signed-off-by: Kenta Ishiguro <kentaishiguro@slowstart.org>
> ---
>  hw/i386/kvm/ioapic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index 4ba8e47251..c5528df942 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -97,7 +97,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
>  
>      ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
>          abort();
>      }
>  }
> -- 
> 2.17.1
> 
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


