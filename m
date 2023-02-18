Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9269BBD6
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 21:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTTmJ-00078L-Sv; Sat, 18 Feb 2023 15:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pTTlz-00075l-IL
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 15:25:32 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pTTlx-0006Ji-RF
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 15:25:31 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 q204-20020a4a33d5000000b0051fcc9bff19so115097ooq.12
 for <qemu-devel@nongnu.org>; Sat, 18 Feb 2023 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUC7V402GBjVvd7RKpxHh32NaGD9df0qenjggKaHLF4=;
 b=pAG1zt+uFbzonx12cWAr8G+1jS8e8VUwdv03nFw4asTJBFQjEBX8t9+RgTVJQBQ2Oh
 v+hnbEorboe5INALWJYbs9VUfdAktetRaVsy0FuFJGS0Hccjfo9ygXVBjpQX1q3ouz1Q
 HnpUopsZ0oexmLTvJWxYsEZpl+7eUvdaSfaPNDzGsV23avUfqDJ8+bst1z23ujjQ/AR8
 qgphVkrfHD7xhILjnGs6zgd1eQ32Wtcdnc05eAAXP+bmxGI1dJEc/QSR1HDg6utZLQmB
 3YCg1LoIKTXlUzM72T/9/qjNiGZEUUcfFh0N+9eGIw75s/eCX9xWIvxrrfvkTNBnl9Gq
 q/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KUC7V402GBjVvd7RKpxHh32NaGD9df0qenjggKaHLF4=;
 b=OSbvHsPwvUzZaWcM8xduhr7Q03wl36dfZ7BRp5S22QRHBi2T/5CGYaQg7CvXc3AGLw
 TwIYc6guk97mcEVfGJWqcTiI0NZgquFF37LLOu7YvuW7dS+dgX+kkWqZMDNhtIQ3fN7A
 AG7IzwXcNW+hHTkxnv0BL5/jX3actOyN0EiRcGf0oBg1V/PP3VKWUrjiP0Tx6iQ+mww3
 f0fWryOEYh5ncMAibm3LXhgTq79EVc3mLz3o8Kx/NJ7RCiixRFpY5NtROCDsKG1gVJcs
 DhjPWp/3n4ufKv1cm0Ed32fmKYTq+wdDmNRQ548mr27B+lwX4RU7j7nN4Yqh4ZuBORwJ
 RNPg==
X-Gm-Message-State: AO0yUKV2RIYb/B4M4o3K9Iq2ePtc3uvsFBPTPBD6rS0W8VtfAYrcVhGd
 n+kxBD1LVdu2wPGiNZsd3A==
X-Google-Smtp-Source: AK7set9sMTWTRUZmnqo4o/BU4szgM05OuRV4bx4qwDs6oJQEX6R5p1OYLeJvCZwYhMNmy2aN+jQNuA==
X-Received: by 2002:a4a:952d:0:b0:517:70f7:2207 with SMTP id
 m42-20020a4a952d000000b0051770f72207mr2513269ooi.7.1676751915992; 
 Sat, 18 Feb 2023 12:25:15 -0800 (PST)
Received: from serve.minyard.net ([47.189.91.183])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a4ad89a000000b0051a6cb524b6sm2863885oov.2.2023.02.18.12.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 12:25:15 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:55c5:6aa7:18c:fb6b])
 by serve.minyard.net (Postfix) with ESMTPSA id 0A0711800BF;
 Sat, 18 Feb 2023 20:25:14 +0000 (UTC)
Date: Sat, 18 Feb 2023 14:25:12 -0600
From: Corey Minyard <minyard@acm.org>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 05/12] hw/i2c/smbus_ich9: Inline ich9_smb_init() and
 remove it
Message-ID: <Y/E0KN6slRJucBms@minyard.net>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213173033.98762-6-shentey@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 06:30:26PM +0100, Bernhard Beschow wrote:
> ich9_smb_init() is a legacy init function, so modernize the code.
> 
> Note that the smb_io_base parameter was unused.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/i386/ich9.h |  1 -
>  hw/i2c/smbus_ich9.c    | 13 +++----------
>  hw/i386/pc_q35.c       | 11 ++++++++---
>  3 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 05464f6965..52ea116f44 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -9,7 +9,6 @@
>  #include "qom/object.h"
>  
>  void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
> -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
>  
>  void ich9_generate_smi(void);
>  
> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> index d29c0f6ffa..f0dd3cb147 100644
> --- a/hw/i2c/smbus_ich9.c
> +++ b/hw/i2c/smbus_ich9.c
> @@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
>      pm_smbus_init(&d->qdev, &s->smb, false);
>      pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
>                       &s->smb.io);
> +
> +    s->smb.set_irq = ich9_smb_set_irq;
> +    s->smb.opaque = s;
>  }
>  
>  static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
> @@ -137,16 +140,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
>      adevc->build_dev_aml = build_ich9_smb_aml;
>  }
>  
> -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base)
> -{
> -    PCIDevice *d =
> -        pci_create_simple_multifunction(bus, devfn, true, TYPE_ICH9_SMB_DEVICE);
> -    ICH9SMBState *s = ICH9_SMB_DEVICE(d);
> -    s->smb.set_irq = ich9_smb_set_irq;
> -    s->smb.opaque = s;
> -    return s->smb.smbus;
> -}
> -
>  static const TypeInfo ich9_smb_info = {
>      .name   = TYPE_ICH9_SMB_DEVICE,
>      .parent = TYPE_PCI_DEVICE,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4af8474f31..85ba8ed951 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -316,10 +316,15 @@ static void pc_q35_init(MachineState *machine)
>      }
>  
>      if (pcms->smbus_enabled) {
> +        PCIDevice *smb;
> +
>          /* TODO: Populate SPD eeprom data.  */
> -        pcms->smbus = ich9_smb_init(host_bus,
> -                                    PCI_DEVFN(ICH9_SMB_DEV, ICH9_SMB_FUNC),
> -                                    0xb100);
> +        smb = pci_create_simple_multifunction(host_bus,
> +                                              PCI_DEVFN(ICH9_SMB_DEV,
> +                                                        ICH9_SMB_FUNC),
> +                                              true, TYPE_ICH9_SMB_DEVICE);
> +        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(smb), "i2c"));
> +
>          smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
>      }
>  
> -- 
> 2.39.1
> 
> 

