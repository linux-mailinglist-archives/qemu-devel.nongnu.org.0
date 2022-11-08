Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B6621951
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRQ2-0005fi-0C; Tue, 08 Nov 2022 11:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1osRQ0-0005fW-Ha
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1osRPy-00072b-Qh
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667924741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jQy74ZlfgTAGdlikZL4pyUPBXZ8/ebOOwzW3CX4iwk=;
 b=YMFtIxavRISVyaWvagEdaK0sG8RXtwk8352bLolj9MCsV9rGEPPSlU08A6sq2YsZnYBjHX
 4EQFspiufX65jF5fqNBB4jUvBt/u/cPpyHnIYQOzUJqZDgB6GvARNJwJSXlI5ztM/g9/KL
 sxqHQD7drQWQmTYmNWgB2aKUA4XlKnc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-qbCmLE-SPwuQpO4uHN7rxw-1; Tue, 08 Nov 2022 11:25:39 -0500
X-MC-Unique: qbCmLE-SPwuQpO4uHN7rxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso3233484wmh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4jQy74ZlfgTAGdlikZL4pyUPBXZ8/ebOOwzW3CX4iwk=;
 b=7lBmIN3OLjfpPuQuklxDjpKCV0zkFT5gEAQ75o3TMBHOwcSFBzx33EQZaAloamubEl
 phgZ+wnKBXsskdPA5WIWrwsI8Ybg1/0Bok5E2/hXm+TyLkFyw/Yjh6ItsS58HwdYnd/f
 sUpKpjQaUOZ8Fy3991a7JJhijvI4hxmliJladhIVji0utgsDAi6tuMY89iooWm9IXj7n
 Qrx01P+HjXEF7G6YPyyWY5G8sQuYlu+zG0epxhamt3msxSEKUvwRv3zeViNI6IhR8Kcj
 6q0nebmFhCJpMzOEWr5ACQW9daLHJiVJKNB3k6q0ul5cj3VnQpm2Lpr2hp2QZ++6bR2t
 7ZBA==
X-Gm-Message-State: ACrzQf0oEi8FsjnzOdU0hXAWq+3RbQBaHOuKiVRNhnXYd/velEZaFUwq
 bERMHEyOOgGnl8F82J65EMtReLQHTZXtgUkWi9TxCmqdQPpRrauolCp0ld/C+PR6Y3IU6F3okkV
 fpCeNMJ/jrBguiqI=
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id
 j30-20020a05600c1c1e00b003c6fa3c32a9mr47405724wms.203.1667924738607; 
 Tue, 08 Nov 2022 08:25:38 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4wN1CbSK2UwZVMADUtaPh0RFDoA7/DTsc453ktjQjnO9KW8VMErardGfZu4ufvb8J3cKZZ+Q==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id
 j30-20020a05600c1c1e00b003c6fa3c32a9mr47405704wms.203.1667924738384; 
 Tue, 08 Nov 2022 08:25:38 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h19-20020a05600c351300b003b4ff30e566sm34421532wmq.3.2022.11.08.08.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 08:25:37 -0800 (PST)
Message-ID: <8e3bd959-bf0b-9104-2ca2-b745c0d9ff48@redhat.com>
Date: Tue, 8 Nov 2022 17:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH 3/3] kvm: Atomic memslot updates
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>
References: <20221104151454.136551-1-eesposit@redhat.com>
 <20221104151454.136551-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221104151454.136551-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 16:14, Emanuele Giuseppe Esposito wrote:
> +    g_assert(qemu_mutex_iothread_locked());

Please add a comment here:

     /* Block further invocations of the ioctls outside the BQL.  */

> +    CPU_FOREACH(cpu) {
> +        qemu_lockcnt_lock(&cpu->in_ioctl_lock);
> +    }
> +    qemu_lockcnt_lock(&kvm_in_ioctl_lock);
>   
> -    kvm_set_phys_mem(kml, section, false);
> -    memory_region_unref(section->mr);
> +    /* Inhibiting happens rarely, we can keep things simple and spin here. */

Not making it spin is pretty easy.  You can add a qemu_event_set to 
kvm_set_in_ioctl() and kvm_cpu_set_in_ioctl(), and here something like:

     if (in_kvm_ioctls()) {
         qemu_event_reset(&kvm_in_ioctl_event);
         if (in_kvm_ioctls()) {
             qemu_event_wait(&kvm_in_ioctl_event);
         }
     }

where in_kvm_ioctls() returns true if any (vCPU or KVM) lockcnt has a 
nonzero count.

Also please create a new header sysemu/accel-blocker.h and 
accel/blocker.c or something like that with all the functions, because 
this code can potentially be used by all KVM-like accelerators.

Paolo


