Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE447BDEE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 11:12:21 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzc84-00081G-Io
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 05:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzc5i-0006Mr-79
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzc5g-0006bB-Cd
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640081391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AIc0XoMHX0Tt9/88qj8N4gV/ohZcpc/pOcIwCyLveE=;
 b=cVBjRmJcoq4ySux5LvuSvMc8NTc2mOo/DlL6zvvvzZJz4ASWQGWL6o3ZndtBAdFulMBNMI
 o9Hlb77MZJoerYs/YkJmSikr84ZwKQqZqAgidPAa+EnoYkGtyXpwbTO3kgPXbpAdwvpEKI
 ouiTM57/5HDVA20ZtWVXEkAIQ9yOHHI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-YkhU90QPPo6PPyH87xzSlQ-1; Tue, 21 Dec 2021 05:09:43 -0500
X-MC-Unique: YkhU90QPPo6PPyH87xzSlQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so2675492wmb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 02:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=1AIc0XoMHX0Tt9/88qj8N4gV/ohZcpc/pOcIwCyLveE=;
 b=S7aNhUoEOIsHQJPq0dKMMTXx9DBSmCh2jZllW6yOqzo514Lfqpfncf1D1ZSujP/Ptk
 wuYWv6vD66jOiotlVuj8YdRvnfB+j4hdZ6dAaWYz9JYJhxh8mRF1ZZDbAZbMRxaN00aj
 IbwvmUUO9Odskc24EfEi6X/7e02rMm/nECfgZugWyXKoqSjE02Ij0XFh9RNRv3SYwCw5
 e/qPrTdqzg0kZLAHZHZpHMe1XuCRID1l7EdaXwhAjPQf0fHA4prni7YzifrL4FD1vUam
 Zkch/BCIEFzgEqZmTEhFHg88KXPhRKyTCD9iMNrG7UQ+m6DvnULBdDNXZ86xPzjev7SV
 0BAw==
X-Gm-Message-State: AOAM533CgQDDU8LQfcMLOnrbSkDrczSYfxH46Ri1WxpZGR0U9QmWrvet
 cY+kJq5BZXvcDlkp9EdL5LQvFZMfB9ArwwPYUldNQ3Gk0Y+ASRceI9lK4iUYdpWRa8RUMfoCM8r
 nA2247BJ51a8rMwI=
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr1985640wma.190.1640081381823; 
 Tue, 21 Dec 2021 02:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHN9a+OlSKR5oUdpVQrkmFU4jqdMBiGT6toLh9onZYQSEZ/D1BLk5Hha9Y2csnbk5N71wpxQ==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr1985603wma.190.1640081381402; 
 Tue, 21 Dec 2021 02:09:41 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id 1sm7771248wry.33.2021.12.21.02.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 02:09:40 -0800 (PST)
Message-ID: <894b455c-6366-8cce-e11a-637d5f3d80e8@redhat.com>
Date: Tue, 21 Dec 2021 11:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211220115419.308463-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH RFC] MAINTAINERS: split out s390x sections
In-Reply-To: <20211220115419.308463-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 12.54, Cornelia Huck wrote:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> As discussed offlist. Some notes:
> - The new sections have inherited the maintainers of the sections
>    they have been split out of (except where people had already
>    volunteered). That's easy to change, obviously, and I hope that
>    the cc: list already contains people who might have interest in
>    volunteering for some sections.
> - I may not have gotten the F: patterns correct, please double check.
> - I'm also not sure about where in the MAINTAINERS file the new
>    sections should go; if you have a better idea, please speak up.
> - Also, if you have better ideas regarding the sections, please
>    speak up as well :)
> - Pull requests will probably continue the same way as now (i.e.
>    patches picked up at the top level and then sent, except for some
>    things like tcg which may go separately.) Not sure if it would
>    make sense to try out the submaintainer pull request model again,
>    I don't think it made life easier in the past, and now we have
>    the b4 tool to pick patches easily anyway. It might be a good
>    idea to check which of the tree locations should stay, or if we
>    want to have new ones.
> 
> ---
>   MAINTAINERS | 86 ++++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 75 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a8d1bdf727d..d1916f075386 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -297,7 +297,6 @@ M: David Hildenbrand <david@redhat.com>
>   S: Maintained
>   F: target/s390x/
>   F: target/s390x/tcg
> -F: target/s390x/cpu_models_*.[ch]
>   F: hw/s390x/
>   F: disas/s390.c
>   F: tests/tcg/s390x/
> @@ -396,16 +395,10 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: target/s390x/kvm/
> -F: target/s390x/ioinst.[ch]
>   F: target/s390x/machine.c
>   F: target/s390x/sigp.c
> -F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
>   F: hw/s390x/pv.c
>   F: include/hw/s390x/pv.h
> -F: hw/intc/s390_flic.c
> -F: hw/intc/s390_flic_kvm.c
> -F: include/hw/s390x/s390_flic.h
>   F: gdb-xml/s390*.xml
>   T: git https://github.com/borntraeger/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
> @@ -1529,12 +1522,8 @@ S390 Virtio-ccw
>   M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
> -F: hw/char/sclp*.[hc]
> -F: hw/char/terminal3270.c
>   F: hw/s390x/
>   F: include/hw/s390x/
> -F: hw/watchdog/wdt_diag288.c
> -F: include/hw/watchdog/wdt_diag288.h
>   F: configs/devices/s390x-softmmu/default.mak
>   F: tests/avocado/machine_s390_ccw_virtio.py
>   T: git https://github.com/borntraeger/qemu.git s390-next
> @@ -1559,6 +1548,80 @@ F: hw/s390x/s390-pci*
>   F: include/hw/s390x/s390-pci*
>   L: qemu-s390x@nongnu.org
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

I'm a little bit torn between putting the s390x-related devices here in the 
"Machine" section (which should rather be used for machines and not for 
devices), or in the more generic "Devices" section later in the MAINTAINERS 
file. We already have vfio-ccw and vfio-ap in the "Devices" section, so 
maybe we should put the other s390x-related devices there as well? (maybe 
with a "s390x" prefix so that they show up in the same spot if we sort them 
alphabetically?)

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

The above two lines could be shortened to:

F: hw/intc/s390_flic*.c

> +F: include/hw/s390x/s390_flic.h
> +L: qemu-s390x@nongnu.org
> +
>   X86 Machines
>   ------------
>   PC
> @@ -1957,6 +2020,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/virtio-ccw*.[hc]
>   F: hw/s390x/vhost-vsock-ccw.c
> +F: hw/s390x/vhost-user-fs-ccw.c
>   T: git https://gitlab.com/cohuck/qemu.git s390-next
>   T: git https://github.com/borntraeger/qemu.git s390-next
>   L: qemu-s390x@nongnu.org

I'm also fine with this patch without further modifications, so:

Acked-by: Thomas Huth <thuth@redhat.com>


