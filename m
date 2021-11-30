Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D687463A32
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:36:22 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5B7-0003GG-02
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms594-0001HG-1E
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms591-0003SD-94
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638286450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKFYbhLdQGJr2SO9csc9LHK0gUIQZSC2TQo4L5B9BT8=;
 b=QSlsaE3dX/F9Rwv/fTESRUuTmS+UjcZVEtBJH9U9wObR7xILovULIA9E3LV5KuSpFMJTFs
 47l/5FBJ+s6V1vmHWOivig88aS1qZIj0CU1mS0b7H3K9eSFI4N7wUsDNLhL8udXdoYSw6K
 F8o50OTLJLnfse+2KBcSrp7K47dy+wM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-409-BS89ivW7P4uHOJ6gwsBobQ-1; Tue, 30 Nov 2021 10:34:08 -0500
X-MC-Unique: BS89ivW7P4uHOJ6gwsBobQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w18-20020a056402071200b003e61cbafdb4so17303138edx.4
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jKFYbhLdQGJr2SO9csc9LHK0gUIQZSC2TQo4L5B9BT8=;
 b=w51PpYqWD6LpUMKk0iq1bIBZNUz4yfh/f3kxMoXvcGczOanJ28h1L0fmwZHXNM43K9
 3FpVbt8fZWQxxbdM63HK/et+NmhyKUjALA1W1u+q/ztd8jsQDTbzu0xPxooAPMiqiB7l
 EtvtJmco8p3YwaPGvoddwW47ouEfUnQRRtjxx7uvvzCyeFWV+ONHA3gkdtJ5K9PFAbt0
 FNW1oMKXN4iYvXxOHOMWw93DjWif97H4PiXLyjZAVKLQJ6ef2tl8tqf8TkZGPwQdhQCn
 XYcn9GRxvtHG0AtrsKmRXv96mnf7QsFR6scVF2jhrA6AYIldsJPwBUGBIn5COm77gcGP
 2G3g==
X-Gm-Message-State: AOAM532L807ypFmpgtrdyi/EY/mO/XXBOp8hK0FXEkv017McFO8fOIqB
 eGodt2pMa7jjPr/k05GRrRo/mCVYQ0XM3R0iBPVLh76Ppe52MZkPk4Ki6qEJseBFdwfeb66BdJC
 yaHo2iqJ/XJoYlt8=
X-Received: by 2002:a17:907:7287:: with SMTP id
 dt7mr57099929ejc.292.1638286447094; 
 Tue, 30 Nov 2021 07:34:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3xYxvoDr89XXxrWsKbMNR98Kfc0C73/weAZXhOCupY8kEXlHuCcHtnihl/9Bq1TJzyxF1nQ==
X-Received: by 2002:a17:907:7287:: with SMTP id
 dt7mr57099908ejc.292.1638286446920; 
 Tue, 30 Nov 2021 07:34:06 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f16sm12642030edd.37.2021.11.30.07.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:34:06 -0800 (PST)
Message-ID: <318c242c-e0c5-09e2-6749-9d366cddafa0@redhat.com>
Date: Tue, 30 Nov 2021 16:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 3/3] virtio-mem: Set "unplugged-inaccessible=auto" for
 the 6.2 machine on x86
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-4-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211130092838.24224-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 10:28, David Hildenbrand wrote:
> Set the new default to "auto", keeping it set to "on" for compat

I believe you wanted to say: keeping it set to "off", because that's
what the patch does.

> machines. This property is only available for x86 targets.
> 
> TODO: once 6.2 was released and we have compat machines, target the next
>       QEMU release.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/i386/pc.c           | 1 +
>  hw/virtio/virtio-mem.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc..045ba05431 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_1[] = {
>      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
>      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
>      { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
> +    { "virtio-mem", "unplugged-inaccessible", "off" },
>  };
>  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
>  
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 1e57156e81..a5d26d414f 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -1169,7 +1169,7 @@ static Property virtio_mem_properties[] = {
>                       TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>  #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
>      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
> -                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
> +                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
>  #endif
>      DEFINE_PROP_END_OF_LIST(),
>  };
> 

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


