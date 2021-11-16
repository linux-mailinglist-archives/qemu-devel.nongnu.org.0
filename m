Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67705453A29
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:28:30 +0100 (CET)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn485-0003A1-2W
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:28:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn46V-0002SR-SF
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:26:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn46R-0003aH-P4
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637090806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjTUQUvYFIZrBseCxbvqYZ8rT7pnNQNFMcq8gYLBJvg=;
 b=hnM/6sn3Q4trIhDE0o6GIpQb1OLdSnqB33U52v8MQm1YhtWurj1b/E/L8ubOFU/jyFWyTj
 vXde6y1b9zG9DX7Q5qEmXdgj6ggiXmOpv+7Q8ma/t5QmpXNS0DIh2THztrZrrFrtTScO7A
 2AxBgMvvDT8OnOlE08xiKpWkw810Nz4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-xTTq2XFkOwy1NPPETJvNqA-1; Tue, 16 Nov 2021 14:26:44 -0500
X-MC-Unique: xTTq2XFkOwy1NPPETJvNqA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m8-20020a056402510800b003e29de5badbso18124102edd.18
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjTUQUvYFIZrBseCxbvqYZ8rT7pnNQNFMcq8gYLBJvg=;
 b=TYHSKZoAMPhckg5dWwwOo+v5jLRwsivLKOIF1Ufk/FBV8AE40W8T0Ex7bA/Nd59iro
 cqKDaQ3huA9tTUmAI3EytnNaNHmMyEN59Dtg33NuCr8LiEjVxTir46E5vsqTSdtOnKjJ
 vsbaNBQYCGUeX/xsuQXf25xab2Q2LUPiTToj115fCiG6kqofU5OGOtmhenqS1+pEXmgE
 m9wrDxkIr8JOxcWtsyCmQTFX0TWsjyFgTttqfjR9yYDFoAuT0iztATw5CLymW3lqsAda
 KircH+J9JRS2+x+I9+h7XkESDP0ipF0p5uET5hp65iw8Fu/4uJFB2csjdC7DhM5mT4Bx
 xb/Q==
X-Gm-Message-State: AOAM532jEnaMG1ZVCSqVUoosb586qTfapR+w+bVftHPS36b9/lgfWI0G
 JvnweZ2wcWgSIUiXfpqV1G441JEKzAwxkNxKxqeqW0wjk1T5Rr49HiDOkMycl3M9KtqgiEFowjd
 NpUg0GSzllCaSwPA=
X-Received: by 2002:aa7:c347:: with SMTP id j7mr13406342edr.272.1637090803336; 
 Tue, 16 Nov 2021 11:26:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeqFNsOPhLoyiF3hZeJU38AcG2/RnkULxbFdQy2ReXpaqnTufD4cRGVRrgz53Br/tUhFWtoQ==
X-Received: by 2002:aa7:c347:: with SMTP id j7mr13406302edr.272.1637090803139; 
 Tue, 16 Nov 2021 11:26:43 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id my2sm5566871ejc.109.2021.11.16.11.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:26:42 -0800 (PST)
Date: Tue, 16 Nov 2021 20:26:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: turn off power_controller_present when acpi
 hotplug is enabled
Message-ID: <20211116202641.463bd07a@redhat.com>
In-Reply-To: <20211116090433.3212549-1-kraxel@redhat.com>
References: <20211116090433.3212549-1-kraxel@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 10:04:33 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Disable power control for pcie slots in case acpi hotplug is enabled
> (6.2+ only for compatibility reasons).  This makes sure we don't get
> unpleasant surprises with pci devices not being functional due to slot
> power being turned off.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/pc_q35.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index e1e100316d93..869ca4c130f0 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -247,9 +247,16 @@ static void pc_q35_init(MachineState *machine)
>                                                   "x-keep-pci-slot-hpc",
>                                                   NULL);
>  
> -    if (!keep_pci_slot_hpc && acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> -                                   "false", true);
> +    if (acpi_pcihp) {
> +        if (keep_pci_slot_hpc) {
> +            /* 6.2+ default: acpi-hotplug=on native-hotplug=on power-ctrl=off */
> +            object_register_sugar_prop(TYPE_PCIE_SLOT, COMPAT_PROP_PCP,
> +                                       "false", true);

that will also turn off COMPAT_PROP_PCP on ports attached to PXBs,
where ACPI hotplug is not used and native one is active.
So question is if it's expected behavior?

> +        } else {
> +            /* 6.1 default: acpi-hotplug=on native-hotplug=off */
> +            object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> +                                       "false", true);
> +        }
>      }
>  
>      /* irq lines */


