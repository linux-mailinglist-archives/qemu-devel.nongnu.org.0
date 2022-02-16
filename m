Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8464B8786
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:24:52 +0100 (CET)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJMZ-0005CL-KZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKJI1-0002TX-F3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKJHy-0006AB-N7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645014005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMe6HeKIaRVM/WYZxb220VJ2vwBLcnVqQSTLPKRSStw=;
 b=AlqGiFPhrCLT92YGB6Oprn7vSa74jFhK04VPKJ9glkxvwBcyeF+8tqVSbSx8XPnHVzZ/+w
 HhQ1pho2b9aJv/73WwXkuZhRnDuJiPco/fzpZaSRvTvYPrjuUH8WllfaKe64F0Ama7ktBZ
 BM1IFh9SR/tDgJ3e8aaEJY9PrDCxTXo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-uGWZv_nXPJi2Pe40peIbJQ-1; Wed, 16 Feb 2022 07:20:02 -0500
X-MC-Unique: uGWZv_nXPJi2Pe40peIbJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s22-20020adf9796000000b001e7e75ab581so989245wrb.23
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 04:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=yMe6HeKIaRVM/WYZxb220VJ2vwBLcnVqQSTLPKRSStw=;
 b=pD6zIOOMG03Hppyt822lO+pW/WlVYS8JvLFWQPVSGWxJbfKljgjSUFuqjEBrwZM9Fw
 Xj3WUY/HDixVQr0MGfcbtvc9aub4ujAE3u2W7nGVyuzSdRIHbnaS9DHG2i1Vl23W+ijV
 6UNfuWZRS3dlaY4+nP6cq9PvpIesvGZ2Q72QLcdvWnrZA/ZzGkHFbgH8za8syLgscYPt
 sMDA9rLzwNBbJXn00SwhlHj83u36dwQ4b/ZJYKgUI53EczALFpS1V7/5XKC0rFmqTwn6
 bNZfZEV/YUcKxZagAUqjGxUg1UPhM62tpIJ2h2XPOhJS9lEPgSisbivSsym3IV901BdE
 6uZw==
X-Gm-Message-State: AOAM533JTyogUBGXMhk5Z8znrUmoiBeouXdzJ3w9peAf7IbJMjNoSebr
 DAWFQEdMrVtDiGbVsH9s6vHrV+i3BC9lZS8yE3TAVJMkf+JDtEA8APt5ZHvqcra2n6SSRx5LvPd
 r++LYp+Brjcus80Y=
X-Received: by 2002:a05:600c:2301:b0:37b:de9e:226d with SMTP id
 1-20020a05600c230100b0037bde9e226dmr1392847wmo.78.1645014001110; 
 Wed, 16 Feb 2022 04:20:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+biquCviNjZcU2OSmwcKSzUzkqut8TDrfW9vid0JtSHASxLhsofy34jdZr2cU/4QjUD/IbA==
X-Received: by 2002:a05:600c:2301:b0:37b:de9e:226d with SMTP id
 1-20020a05600c230100b0037bde9e226dmr1392828wmo.78.1645014000867; 
 Wed, 16 Feb 2022 04:20:00 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id a10sm11514739wrt.59.2022.02.16.04.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 04:20:00 -0800 (PST)
Message-ID: <5cd206e3-f7f6-1fdb-10f9-26a7c12ec9b6@redhat.com>
Date: Wed, 16 Feb 2022 13:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-devel@nongnu.org
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <6001ed71ebe40c88e9d903bf0983884f522b2dea.1644302411.git.elena.ufimtseva@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC 1/8] ioregionfd: introduce a syscall and memory API
In-Reply-To: <6001ed71ebe40c88e9d903bf0983884f522b2dea.1644302411.git.elena.ufimtseva@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, jag.raman@oracle.com,
 john.levon@nutanix.com, philmd@redhat.com, cohuck@redhat.com,
 armbru@redhat.com, peterx@redhat.com, mst@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks straight forward to me.

[...]

>  
> +int kvm_set_ioregionfd(struct kvm_ioregion *ioregionfd)
> +{
> +    KVMState *s = kvm_state;
> +    int ret = -1;
> +
> +    ret = kvm_vm_ioctl(s, KVM_SET_IOREGION, ioregionfd);
> +    if (ret < 0) {
> +        error_report("Failed SET_IOREGION syscall ret is %d", ret);

Maybe print the textual representation via strerror(-ret).

> +    }
> +    return ret;
> +}
> +
>  static int do_kvm_destroy_vcpu(CPUState *cpu)
>  {
>      KVMState *s = kvm_state;
> @@ -1635,6 +1648,104 @@ static void kvm_io_ioeventfd_del(MemoryListener *listener,
>      }
>  }
>  
> +static void kvm_mem_ioregionfd_add(MemoryListener *listener,
> +                                   MemoryRegionSection *section,
> +                                   uint64_t data,
> +                                   int fd)
> +{
> +
> +    struct kvm_ioregion ioregionfd;
> +    int r = -1;
> +
> +    ioregionfd.guest_paddr = section->offset_within_address_space;
> +    ioregionfd.memory_size = int128_get64(section->size);
> +    ioregionfd.user_data = data;
> +    ioregionfd.read_fd = fd;
> +    ioregionfd.write_fd = fd;
> +    ioregionfd.flags = 0;
> +    memset(&ioregionfd.pad, 0, sizeof(ioregionfd.pad));
> +
> +    r = kvm_set_ioregionfd(&ioregionfd);
> +    if (r < 0) {
> +        fprintf(stderr, "%s: error adding ioregionfd: %s (%d)\n,",
> +                __func__, strerror(-r), -r);

Oh, you're actually printing the error again? Why error_report() above
and here fprintf?

[...]

>  void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>                                    AddressSpace *as, int as_id, const char *name)
>  {
> @@ -1679,6 +1790,12 @@ static MemoryListener kvm_io_listener = {
>      .priority = 10,
>  };
>  
> +static MemoryListener kvm_ioregion_listener = {
> +    .ioregionfd_add = kvm_io_ioregionfd_add,
> +    .ioregionfd_del = kvm_io_ioregionfd_del,
> +    .priority = 10,
> +};
> +
>  int kvm_set_irq(KVMState *s, int irq, int level)
>  {
>      struct kvm_irq_level event;
> @@ -2564,6 +2681,9 @@ static int kvm_init(MachineState *ms)
>      kvm_ioeventfd_any_length_allowed =
>          (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
>  
> +    kvm_ioregionfds_allowed =
> +        (kvm_check_extension(s, KVM_CAP_IOREGIONFD) > 0);
> +
>      kvm_state = s;
>  
>      ret = kvm_arch_init(ms, s);
> @@ -2585,6 +2705,12 @@ static int kvm_init(MachineState *ms)
>          s->memory_listener.listener.eventfd_add = kvm_mem_ioeventfd_add;
>          s->memory_listener.listener.eventfd_del = kvm_mem_ioeventfd_del;
>      }
> +
> +    if (kvm_ioregionfds_allowed) {
> +        s->memory_listener.listener.ioregionfd_add = kvm_mem_ioregionfd_add;
> +        s->memory_listener.listener.ioregionfd_del = kvm_mem_ioregionfd_del;
> +    }
> +
>      s->memory_listener.listener.coalesced_io_add = kvm_coalesce_mmio_region;
>      s->memory_listener.listener.coalesced_io_del = kvm_uncoalesce_mmio_region;
>  
> @@ -2594,6 +2720,12 @@ static int kvm_init(MachineState *ms)
>          memory_listener_register(&kvm_io_listener,
>                                   &address_space_io);
>      }
> +
> +    if (kvm_ioregionfds_allowed) {
> +        memory_listener_register(&kvm_ioregion_listener,
> +                                 &address_space_io);
> +    }
> +
>      memory_listener_register(&kvm_coalesced_pio_listener,
>                               &address_space_io);
>  

Why are we using a single memory listener for address_space_memory but
individual listeners for address_space_io?

IOW, wey don't we have &s->io_listener ?

-- 
Thanks,

David / dhildenb


