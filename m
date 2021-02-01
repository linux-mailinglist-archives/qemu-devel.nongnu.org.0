Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87B30A556
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:30:39 +0100 (CET)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WTe-0005Yp-K3
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6WMf-0007rL-72
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:23:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6WMY-0003Ii-Ns
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612174995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aJMOuyPSvjfhIQ04b1GIIwOFY3oexeLpV4TNKMqWiI=;
 b=Ig9VYT4nOehZv3vos89PLHQiUROwoBFC3GmOZTOLmVThxFAUppqdK+garDjTQuXq860h03
 lrTezMa/Wgvnz3t79nhbKzpQ/MBpxYN6NqIV5V6x/cRJQ5DB3sUgr5QrZIaMFqXkdgNx7v
 R7ZmsQJ8c6YaiTcdlNQ7r4gphhHRWow=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-5H_lgdZ6OUa5L-aaIvuvQw-1; Mon, 01 Feb 2021 05:23:14 -0500
X-MC-Unique: 5H_lgdZ6OUa5L-aaIvuvQw-1
Received: by mail-wm1-f70.google.com with SMTP id f6so237924wmj.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 02:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5aJMOuyPSvjfhIQ04b1GIIwOFY3oexeLpV4TNKMqWiI=;
 b=De2LdFSAB4ffPjuZGO9SRXC30xi3yp4DNWlshzEjSeygSs/VGSRHktiuxhQ7AZUv4S
 SDAV9qbb7KJmYp+2q2SSmaFbMRATac62FStmUYU6Y313UxaxgFmBSCyi995vyn65eF5J
 onb6QtUBuJvEUMuNwX7IQkuvwQNlkMSRBRVMEbIsrGMnBwpTpju2OgtyGAYL/GVTylAI
 EMorcsUkvPt8iuuXUQuIePPj2LWCawEUzPvjJWpNCPkk5rDVdDMY2GbDePHXUoHnNaGp
 VEIA5I7ARUNBfMvc8IiJO+e9Df3a+1qb5Jqt2MBilTtqQZjfaZJ1gIyPScsxhobMIzVB
 fFqw==
X-Gm-Message-State: AOAM531O08RM72fk6MlM1EeZf39o+5Uqz/1s/f7SNWlEHFui2BuPUeLJ
 ZAdrpb68n7LyAXNzAJJzR4dAxXBxq0cQF2dyoRoeSjcniyEtV/63ZjOoMaYQj1BzmXibjCuwQvm
 1kHpkaOS+gq0KXfg=
X-Received: by 2002:adf:8b47:: with SMTP id v7mr1554764wra.133.1612174993018; 
 Mon, 01 Feb 2021 02:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRiU0yK4wM7pHxMScsrUEJgrMLA/P5aBurhjGx5cZ0jxtB++LorBC//x8+uxwvN9hX5go09A==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr1554744wra.133.1612174992844; 
 Mon, 01 Feb 2021 02:23:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x9sm4234865wmb.14.2021.02.01.02.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:23:12 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
 <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
Date: Mon, 1 Feb 2021 11:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 10:18, Philippe Mathieu-Daudé wrote:
> FYI using 'imply FSDEV_9P' instead I get:
> 
> /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
> `xen_be_register_common':
> hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

Ok, so then we have the case of a file (hw/xen/xen-legacy-backend.c) 
brought in by CONFIG_XEN.  In that case this patch is incorrect...

> The function is:
> 
>    void xen_be_register_common(void)
>    {
>        xen_set_dynamic_sysbus();
> 
>        xen_be_register("console", &xen_console_ops);
>        xen_be_register("vkbd", &xen_kbdmouse_ops);
>    #ifdef CONFIG_VIRTFS
>        xen_be_register("9pfs", &xen_9pfs_ops);
>    #endif
>    #ifdef CONFIG_USB_LIBUSB
>        xen_be_register("qusb", &xen_usb_ops);
>    #endif
>    }
> 
> The object is compiled using:
> 
> -- >8 --
> -#ifdef CONFIG_VIRTFS
> +#ifdef CONFIG_FSDEV_9P
>       xen_be_register("9pfs", &xen_9pfs_ops);
>   #endif
> ---

... and this is the best fix, together with:

- a "#include CONFIG_DEVICES" at the top (to get CONFIG_FSDEV_9P)

- moving xen-legacy-backend.c from softmmu_ss to specific_ss (to get 
CONFIG_DEVICES)

- changing "select" to "imply" in accel/Kconfig (otherwise the patch has 
no effect)

But really, doing nothing and just dropping this patch is perfectly fine.

Paolo


