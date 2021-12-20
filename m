Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFC47B4A5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:03:33 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOys-0001sD-3t
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mzOJZ-0002VS-1Z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mzOJW-0002cE-Cp
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640028433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBBNmdJ+hYD9A7BDilPuVcxWSjHHkAam+1eqnmuDNGk=;
 b=DVgwyZfnsv6AytrjFesGhYjTtVK+IRaF/h1k31456RCwdIM5XJJ2Q5HWFxvmHrmWu8aHzl
 XXfZm45pTu5X5Tcj8Ilccv1Ved8hTvlk7GZJd9hJ6bLq/Z3+m/DHw4ct2lTJE/8zj2xym6
 lSjzDykJ0H1rdmq+tXA/Fpf6W4nbRbM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-VGSMIwjCNN-TwDoPX7oIoQ-1; Mon, 20 Dec 2021 14:27:10 -0500
X-MC-Unique: VGSMIwjCNN-TwDoPX7oIoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n31-20020a05600c3b9f00b0034440f99123so2285792wms.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CBBNmdJ+hYD9A7BDilPuVcxWSjHHkAam+1eqnmuDNGk=;
 b=7Or3UJKlcc+U5zjQTC9ZQ0eTA81sVpYINEkXDSFa2orf3TKh7FUWGrUhKb9V0oUnZh
 kBhdWEeqebHyNACiLOhFj21SxX5OvtwA4FAtMquJuSo4DVQozwriEwjvVwtM2jrK6u7Y
 QoszbzQC+9wkie1Ns1nH5BLxe5k/BPAhCM7Q3RaAA4XpOjzaBQsM5/LBDZ60jw+Kvzwn
 M/CRY6KMeri01sEYMraldCmJPXZi8bx1nTcOJBHfJOdVJOUow0x/c7AMpW8o9GzBRUPN
 SyWNf9/gUirn0JOPv1jmtlIc2WYKQ8bsDgRnxR6bVBKggakE3tD+ACU8jKTAm8cZXvvt
 DJPw==
X-Gm-Message-State: AOAM533HuF8lzp5qAAtVoGwLQEwtP9LtMwoZ5vCvuWjslqKjILZoBe4Q
 S5/NCDzPth51lVtGezXexXZuCNqfuj+fvfEGNvLM4xwMUhNUfv3xsh30lrztYVDTgIj8durGilg
 bJXsE0J7ajBsqV4s=
X-Received: by 2002:a05:6000:1564:: with SMTP id
 4mr14047943wrz.9.1640028429059; 
 Mon, 20 Dec 2021 11:27:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDpWir+uds090RWAqLp2YfBHUC9ySJjmkhQgBQg2qVip/Z/gjAsl4aMkgywNrbCkQ3koHweA==
X-Received: by 2002:a05:6000:1564:: with SMTP id
 4mr14047918wrz.9.1640028428754; 
 Mon, 20 Dec 2021 11:27:08 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6403.dip0.t-ipconnect.de. [91.12.100.3])
 by smtp.gmail.com with ESMTPSA id
 bd19sm213067wmb.23.2021.12.20.11.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:27:08 -0800 (PST)
Message-ID: <f68ee065-2f0f-0947-ed0c-9243a7e14ff7@redhat.com>
Date: Mon, 20 Dec 2021 20:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC] MAINTAINERS: split out s390x sections
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211220115419.308463-1-cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211220115419.308463-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.12.21 12:54, Cornelia Huck wrote:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> As discussed offlist. Some notes:
> - The new sections have inherited the maintainers of the sections
>   they have been split out of (except where people had already
>   volunteered). That's easy to change, obviously, and I hope that
>   the cc: list already contains people who might have interest in
>   volunteering for some sections.
> - I may not have gotten the F: patterns correct, please double check.
> - I'm also not sure about where in the MAINTAINERS file the new
>   sections should go; if you have a better idea, please speak up.
> - Also, if you have better ideas regarding the sections, please
>   speak up as well :)
> - Pull requests will probably continue the same way as now (i.e.
>   patches picked up at the top level and then sent, except for some
>   things like tcg which may go separately.) Not sure if it would
>   make sense to try out the submaintainer pull request model again,
>   I don't think it made life easier in the past, and now we have
>   the b4 tool to pick patches easily anyway. It might be a good
>   idea to check which of the tree locations should stay, or if we
>   want to have new ones.
> 
> ---
>  MAINTAINERS | 86 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a8d1bdf727d..d1916f075386 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -297,7 +297,6 @@ M: David Hildenbrand <david@redhat.com>
>  S: Maintained
>  F: target/s390x/
>  F: target/s390x/tcg
> -F: target/s390x/cpu_models_*.[ch]
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/
> @@ -396,16 +395,10 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
>  F: target/s390x/kvm/
> -F: target/s390x/ioinst.[ch]
>  F: target/s390x/machine.c
>  F: target/s390x/sigp.c
> -F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
>  F: hw/s390x/pv.c
>  F: include/hw/s390x/pv.h
> -F: hw/intc/s390_flic.c
> -F: hw/intc/s390_flic_kvm.c
> -F: include/hw/s390x/s390_flic.h
>  F: gdb-xml/s390*.xml
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
> @@ -1529,12 +1522,8 @@ S390 Virtio-ccw
>  M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
> -F: hw/char/sclp*.[hc]
> -F: hw/char/terminal3270.c
>  F: hw/s390x/
>  F: include/hw/s390x/
> -F: hw/watchdog/wdt_diag288.c
> -F: include/hw/watchdog/wdt_diag288.h
>  F: configs/devices/s390x-softmmu/default.mak
>  F: tests/avocado/machine_s390_ccw_virtio.py
>  T: git https://github.com/borntraeger/qemu.git s390-next
> @@ -1559,6 +1548,80 @@ F: hw/s390x/s390-pci*
>  F: include/hw/s390x/s390-pci*
>  L: qemu-s390x@nongnu.org
>  
> +S390 channel subsystem
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/ccw-device.[ch]
> +F: hw/s390x/css.c
> +F: hw/s390x/css-bridge.c
> +F: include/hw/s390x/css.h
> +F: include/hw/s390x/css-bridge.h
> +F: include/hw/s390x/ioinst.h
> +F: target/s390x/ioinst.c
> +L: qemu-s390x@nongnu.org
> +
> +3270 device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Odd fixes
> +F: include/hw/s390x/3270-ccw.h
> +F: hw/char/terminal3270.c
> +F: hw/s390x/3270-ccw.c
> +L: qemu-s390x@nongnu.org
> +
> +diag 288 watchdog
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/watchdog/wdt_diag288.c
> +F: include/hw/watchdog/wdt_diag288.h
> +L: qemu-s390x@nongnu.org
> +
> +S390 CPU models
> +M: David Hildenbrand <david@redhat.com>
> +S: Maintained
> +F: target/s390x/cpu_features*.[ch]
> +F: target/s390x/cpu_models.[ch]
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage key device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-keys.h
> +F: hw/390x/s390-skeys*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage attribute device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-attributes.h
> +F: hw/s390/s390-stattrib*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 SCLP-backed devices
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: include/hw/s390x/event-facility.h
> +F: include/hw/s390x/sclp.h
> +F: hw/char/sclp*.[hc]
> +F: hw/s390x/event-facility.c
> +F: hw/s390x/sclp*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 floating interrupt controller
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: David Hildenbrand <david@redhat.com>
> +S: Supported
> +F: hw/intc/s390_flic.c
> +F: hw/intc/s390_flic_kvm.c
> +F: include/hw/s390x/s390_flic.h
> +L: qemu-s390x@nongnu.org
> +
>  X86 Machines
>  ------------
>  PC
> @@ -1957,6 +2020,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/virtio-ccw*.[hc]
>  F: hw/s390x/vhost-vsock-ccw.c
> +F: hw/s390x/vhost-user-fs-ccw.c
>  T: git https://gitlab.com/cohuck/qemu.git s390-next
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


