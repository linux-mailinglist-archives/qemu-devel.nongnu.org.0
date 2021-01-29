Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877C308DF6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:05:00 +0100 (CET)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a0p-0002ui-Mo
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Zxm-00010B-2C
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Zxf-0004HX-Lk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611950502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX+ykdl9ts6jQuVV/cBxZAvPSn3+goydXU0pGt7Dz5o=;
 b=SaDJXSPZtBAoy+J8xSpqhrgU3jWWQw38kv1mfALhyZjiopCEHF6J8wtj/Zh7A6jZIZH/TS
 wtznDYqhJKNgEIysh9YE2YqPGvheWb8r7hbhGP+wH3JmKFVF5Ei5K6TMSH/zWzBIfQH9dO
 hd8699LUEGznLWH53mO6xQ+G0wNPlEE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-o6r-OtkpP8ameWUj3AEkFg-1; Fri, 29 Jan 2021 15:01:40 -0500
X-MC-Unique: o6r-OtkpP8ameWUj3AEkFg-1
Received: by mail-ej1-f71.google.com with SMTP id z2so4441887ejf.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XX+ykdl9ts6jQuVV/cBxZAvPSn3+goydXU0pGt7Dz5o=;
 b=W+nNoUOsEdYmRSL+BGIn2qwAe5jTsTbc04EWqYPZckDc1GobQdRacumcWGsSRIAikM
 PEBvco31OkpI/4K+zTjMyzA7Zvf7VGEFCBIqsnws07vpseGCvbxgTJTXUfoekiYBPKei
 MdhBYDv752QyJzw3DZxwE4qwDobPEgZDHaMTaNGBS/c+agyB5I3mPQwIbUxaz2JVCyJ/
 +et1XqwrMXKEsnb/ixeuNlNGBvkJ8Erk6v6gyfSNxe6wW9HtP/RZClj+pAj1iNmMWOcp
 tTvHmV5sq6nRfI8fTBDcuN+PzemHIJSlpVwYiYnw6QMU+phlsO2Z4FJI6GbrRPS2/vgI
 itZw==
X-Gm-Message-State: AOAM533x+UhPqvUvgmUVKUVb2mNtk9y/XAdfdevdl+Oz/C2VkXOOnHqq
 nWYGQ29hzEAGEcW3uF6cESAcFyyfYco+zOt6zflkN8uF/HZJPko+ca0Pk2Xb63mfRkpO39kF+Vu
 PsU277vrlM9emBcE=
X-Received: by 2002:a05:6402:558:: with SMTP id
 i24mr7147869edx.141.1611950499654; 
 Fri, 29 Jan 2021 12:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVNI8v1QDdEme3HQH7Sas86efflD76xf+vmPDm8tutllEho3ZH2nSFtDKX2fvmwWqwPC+JVw==
X-Received: by 2002:a05:6402:558:: with SMTP id
 i24mr7147830edx.141.1611950499408; 
 Fri, 29 Jan 2021 12:01:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a22sm5083124edv.67.2021.01.29.12.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:01:38 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-4-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <036c1da5-894f-0111-4169-b5e904367eae@redhat.com>
Date: Fri, 29 Jan 2021 21:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
> xenpv machine requires USB, IDE_PIIX and PCI:
> 
>    /usr/bin/ld:
>    libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>    hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>    hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>    hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>    hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/Kconfig     | 1 +
>   hw/xen/Kconfig | 6 ++++++
>   2 files changed, 7 insertions(+)
>   create mode 100644 hw/xen/Kconfig
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4b..f2a95591d94 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -39,6 +39,7 @@ source usb/Kconfig
>   source virtio/Kconfig
>   source vfio/Kconfig
>   source watchdog/Kconfig
> +source xen/Kconfig
>   
>   # arch Kconfig
>   source arm/Kconfig
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> new file mode 100644
> index 00000000000..15944144a17
> --- /dev/null
> +++ b/hw/xen/Kconfig
> @@ -0,0 +1,6 @@
> +config XEN_PV
> +    bool
> +    depends on XEN
> +    select PCI
> +    select USB
> +    select IDE_PIIX
> 

Since you're hacking around you can also "select ISA_BUS" here, but the 
right solution would be to have a "config XEN_FV" and leave 
hw/i386/xen/xen_platform.c out of XEN_PV.

Paolo


