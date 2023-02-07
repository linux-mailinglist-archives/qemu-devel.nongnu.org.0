Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06A68DFFD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:27:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSfb-0002bM-RV; Tue, 07 Feb 2023 13:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSfT-0002ZR-Ry
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSfR-000598-TZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675794368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63BdvnsubKO91fl3EcM1zEK38XI9sfdR9VcA/LGDkNc=;
 b=gbf98fWuOCcB1LQSDRIJkuOYm+ZgpxzlKBsbaAbuO929VM+2VpUwqZ0+x5Q+TkXTmofwfC
 gOMoyi7WnCxzuk5xktjWxhkgTn1cG9ZUa9M9CylRt9wMmoWTcZLU9Z525UvX2904N9CQ5t
 YVT3QqKZsioNKcHe3FdEbKbmKoufY34=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-26Bl9z8IO9WVo1xpkJUlbw-1; Tue, 07 Feb 2023 13:26:07 -0500
X-MC-Unique: 26Bl9z8IO9WVo1xpkJUlbw-1
Received: by mail-qt1-f197.google.com with SMTP id
 a24-20020ac84d98000000b003b9a4958f0cso9021369qtw.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63BdvnsubKO91fl3EcM1zEK38XI9sfdR9VcA/LGDkNc=;
 b=Zf36+RPad1Fbc/grSTryXmlAy27Lmq5lUBaIZDt17ioWBW6dogtnxSUe+ww4rng2v3
 2lKNHm2ZkbFCHMc3y4qYl1QUGfCNYYWIaSCbZqsBm42m1BHp8ik4uFkB3qfnkObdB1z+
 UcaUMnhLMwr5k3wq23REa2lmoSzxX2lDvHlEtkB893yNRQwZLioiTUCXjXgCtI/64Q8t
 2/xj8VvGo6sXn3gHYSC9kRHA+GMHCO7tLKBjBRuvY3wbh0mEIK/rrBBJmEw4N1RkABvR
 AoEobldrT8vKrSEEMuK4TaEJFV+Ld1GnzKpVTMiBon6zQ3TFzgG1oxanNRckoqNYuZD6
 zvUw==
X-Gm-Message-State: AO0yUKUp+B56V5K2CR6jzc7JcI0E2fPIcdzyWZGG6gqLcnY4kbGw3URt
 ocvrF5s+TLMyh7jHG7u2QHIna0TdV74ykokyxA3mYCn1zTdz0ds6gBNcs8Y1a3zRQ9PhIjQjOnZ
 1VgaZEnG/kYisbV2tobVBhMY=
X-Received: by 2002:a05:6214:1250:b0:568:df06:5216 with SMTP id
 r16-20020a056214125000b00568df065216mr6981504qvv.24.1675794366712; 
 Tue, 07 Feb 2023 10:26:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8bDoORPuJrj4yrLABwOPZY0rRZw7o5ZHECuJLNjdr506mi04mUxWpmxtqGq0xAwP0gFKvz3w==
X-Received: by 2002:a05:6214:1250:b0:568:df06:5216 with SMTP id
 r16-20020a056214125000b00568df065216mr6981474qvv.24.1675794366450; 
 Tue, 07 Feb 2023 10:26:06 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 u63-20020ae9d842000000b006fa22f0494bsm9877864qkf.117.2023.02.07.10.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:26:05 -0800 (PST)
Message-ID: <461ba038-31bf-49c4-758b-94ece36f136f@redhat.com>
Date: Tue, 7 Feb 2023 19:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 06/10] hw/arm: Select VIRTIO_BLK for virt machine
In-Reply-To: <20230206140809.26028-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
> 
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=n (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8dcc08b7ec..296d4f5176 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -33,6 +33,7 @@ config ARM_VIRT
>       select ACPI_HMAT
>       select VIRTIO_PCI
>       select VIRTIO_NET
> +    select VIRTIO_BLK

I'm a little bit torn here ... while it makes sense for me to add VIRTIO_NET 
so that you can run "qemu-system-aarch64 -M virt" without any additional 
arguments, this is now about fixing additional (convenience) CLI options 
that are optional ...

I assume we need those for some qtests? What about checking for virtio-blk 
in those tests instead?

  Thomas


