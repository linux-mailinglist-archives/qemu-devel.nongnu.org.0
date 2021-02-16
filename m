Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD0731C6F8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:49:55 +0100 (CET)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBv7J-0000xF-TX
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBv6R-0000WJ-Pn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBv6O-00028x-JJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613461734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu6GNZPxX6IxEBlGz0I9+x5RuUB9u7M8014RUfkpivI=;
 b=eBh/10AuHO63YDHV1rbBbuJ51qQwC7pjqmMrKoZdpizzQzsVcmbsdjs6tFMXXtUWwp0ehL
 TwwfsroCce7tyvNZtT9yAu0dsrRmyUjz152WF1U5eMtpKfszLiqctc2AaBJ6EUAr2qslVn
 KcWlC7gGfpVT5SeQAhBTPf+n0myt28Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-f3niHfhBMWyuVff7CIdzxQ-1; Tue, 16 Feb 2021 02:48:52 -0500
X-MC-Unique: f3niHfhBMWyuVff7CIdzxQ-1
Received: by mail-wr1-f72.google.com with SMTP id w16so12857443wrl.15
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mu6GNZPxX6IxEBlGz0I9+x5RuUB9u7M8014RUfkpivI=;
 b=DjzgJHICOT3BMK1awGDVU2+aa1LmNIHUI/sk571DaQ9wpy9yAzcQgeFSK9sTA9s6Bn
 erpRvS9+aN9fc3LFUIMzWnqWs189x+irxTefxyuLnEOUH7wXxCigrmgGwJBNXZNAPzBm
 xAvt5MNDVMU6rg7hRgkTUZd6e1eud31CUjAGZRmJBQR9/Dr2nc3M/CVHyLDTUrCBhWwt
 wETsRi6LhP3GhstT+hSYESAclg8PpfwscD1PHghPqGCJOQZAbny+TGQTTfTdUsDE3965
 5ynrhLmOnSsEhpiMjppoUNr3/zJQSXQt/ZP8aDfR7M2og4t6pWFn3ygEVcpiIHjohtr9
 ghhQ==
X-Gm-Message-State: AOAM531qs8gQtTFWxIT+q8CIRtAv4ARc8T0puFToBtl1F+w9azEabjwk
 BKRan3HwE36ZdeN55iv8RagBog+QJkIMItNF0cC+fJ8rmggizA8v948Qt7uUlHCE2HiFXoeTybF
 0Aq+O7sLrkMjFNAo=
X-Received: by 2002:a05:600c:4c19:: with SMTP id
 d25mr2112392wmp.181.1613461730976; 
 Mon, 15 Feb 2021 23:48:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXPNj3jLWCz1bgKIOIExrt6rCuqs9MuaV4qKCUiFlxri5rTjEO4g+ljUxIPYePREq1ZdrA+g==
X-Received: by 2002:a05:600c:4c19:: with SMTP id
 d25mr2112376wmp.181.1613461730810; 
 Mon, 15 Feb 2021 23:48:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t9sm22133057wrw.76.2021.02.15.23.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:48:50 -0800 (PST)
Subject: Re: [PATCH] virtio-pci: add check for vdev in virtio_pci_isr_read
To: Yuri Benditovich <yuri.benditovich@daynix.com>, mst@redhat.com,
 qemu-devel@nongnu.org
References: <20210216052917.5712-1-yuri.benditovich@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f6321f4-c336-5635-1b83-c021bbd81a84@redhat.com>
Date: Tue, 16 Feb 2021 08:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216052917.5712-1-yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yan@daynix.com, Julia Suvorova <jusual@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yuri,

On 2/16/21 6:29 AM, Yuri Benditovich wrote:
> https://bugzilla.redhat.com/show_bug.cgi?id=1743098

Maybe add backtrace in patch description?

(gdb) bt
#0  0xc5bbdf0d in virtio_pci_notify_write (opaque=0x55b6c6dff170,
addr=0, val=<...>, size=<...>)
    at hw/virtio/virtio-pci.c:1360
#1  0xc59fe596 in memory_region_write_accessor (mr=<...>, addr=<...>,
value=<...>, size=<...>, shift=<...>, mask=<...>, attrs=...)
    at memory.c:530
#2  0xc59fc9e6 in access_with_adjusted_size (addr=addr@entry=0,
value=..., size=size@entry=2, access_size_min=<...>,
access_size_max=<...>, access_fn=<memory_region_write_accessor>,
mr=0x55b6c6df7cd0, attrs=...)
    at memory.c:597
#3  0xc5a0084a in memory_region_dispatch_write (mr=0x55b6c6df7cd0,
addr=0, data=<...>, size=2, attrs=...)
    at memory.c:1474
#4  0xc59aebbc in flatview_write (fv=0x7f1abc0407c0, addr=<...>,
attrs=..., buf=<...>, len=<...>)
    at exec.c:3099
#5  0xc59b3243 in address_space_write (as=<...>, addr=<...>, attrs=...,
buf=<...>, len=<...>)
    at exec.c:3265
#6  0xc5a0f878 in kvm_cpu_exec (cpu=<...>)
    at accel/kvm/kvm-all.c:2004
#7  0xc59ec21e in qemu_kvm_cpu_thread_fn (arg=0x55b6c6bdddd0)
    at cpus.c:1215
#8  0x00007f1adb4732de in start_thread (arg=<...>) at pthread_create.c:486
#9  0x00007f1adb1a4133 in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

> There is missing check for vdev in this procedure.
> QEMU crash happens in it in hot unplug flow.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  hw/virtio/virtio-pci.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 094c36aa3e..2f19301267 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1364,7 +1364,13 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
>  {
>      VirtIOPCIProxy *proxy = opaque;
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    uint64_t val = qatomic_xchg(&vdev->isr, 0);
> +    uint64_t val = 0;

       uint64_t val;

> +
> +    if (vdev == NULL) {
> +        return val;

           return 0;

> +    }
> +
> +    val = qatomic_xchg(&vdev->isr, 0);
>      pci_irq_deassert(&proxy->pci_dev);
>  
>      return val;
> 

This pattern is present in other functions of this file.

Can you fix them too, or add an assert() if it is unlikely
to happen?

Thanks,

Phil.


