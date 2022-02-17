Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1934B9958
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:40:58 +0100 (CET)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKaTJ-0007RB-O5
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:40:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaNP-0003NN-43
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaNN-00024Z-D5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645079688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV6UXN+541B30iOPLTrUAKDN58iId+G+U3Zxat5qAUE=;
 b=VMkl548VylkTsYZhjRHhnI21buCOe3yS1t4mCeUxHdkBiCPvYbT0WXppXbPgEqE850tGAc
 DkL/QBJEyhs0C29Q5wawJhWywCTchrX71yhNV5BwdFysTL9Db4H8ohYziY8soyNjWQjRp4
 OnDCBSUYodiQmPw0cN3gq/NDcTP8KpE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-TG-5rMy4M2-9dprikqfKew-1; Thu, 17 Feb 2022 01:34:47 -0500
X-MC-Unique: TG-5rMy4M2-9dprikqfKew-1
Received: by mail-wm1-f70.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso1244351wms.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NV6UXN+541B30iOPLTrUAKDN58iId+G+U3Zxat5qAUE=;
 b=BAtbYPh09rESssiF0+w2F+pzsi84dfiesGuJfxHa/L0BXXhZTccDT8AZz17wHDkeBV
 31M1pmrePGCTLgcKrcuibme4FF+OjELyc+WsbR4Nbf7mQYWu27Sr1ddQlSPpbuCqDnfc
 sJar6FPqKci0X0wVkMh96vbs6yN0zoU/2PSDHiTyMJMMsoMRis0JQd0oUNEMT3W0zcDO
 Bq6rU7ri7Hs5euo/f38BXEMAftQGDkTY8NpDgwOYb4NHqhwvoKfCW79mgq/htD2BhZhm
 hMkEk4WoHkYhSs1t50/ALVabfzZqrcOObZkFnyWRbvi6+m5UgpDnMqW6I70CEYBcen3v
 SIug==
X-Gm-Message-State: AOAM5318eRoIizsb8GzMc7zIL3NjpvvuWBQ5Mcefbp5dbNPKIjGdf3vw
 oAd34iHfymIHJXvwTa4OZFhlMlQE4x1Q+SgnhJKlkAoNAF3M8N6K6Ghreg8jsOeKlWV9N0tWWaL
 dzTsJuXHHW+UtCOA=
X-Received: by 2002:adf:f846:0:b0:1d9:3079:a02f with SMTP id
 d6-20020adff846000000b001d93079a02fmr1100314wrq.62.1645079685880; 
 Wed, 16 Feb 2022 22:34:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztEfbYsv9TVi4+TcEesQ9o0e5ItqAaq6hLJOPEsEgIvPc44YpIa0YLBTSy3inzDQSON55tzA==
X-Received: by 2002:adf:f846:0:b0:1d9:3079:a02f with SMTP id
 d6-20020adff846000000b001d93079a02fmr1100309wrq.62.1645079685693; 
 Wed, 16 Feb 2022 22:34:45 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id x10sm163602wmj.17.2022.02.16.22.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 22:34:44 -0800 (PST)
Date: Thu, 17 Feb 2022 01:34:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 4/7] hw/isa/piix4: Pass PIIX4State as opaque parameter
 for piix4_set_irq()
Message-ID: <20220217013433-mutt-send-email-mst@kernel.org>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-5-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220216224519.157233-5-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:45:16PM +0100, Bernhard Beschow wrote:
> Passing PIIX4State rather than just the qemu_irq allows for resolving
> the global piix4_dev variable.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/isa/piix4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 179968b18e..caa2002e2c 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -57,7 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>  static void piix4_set_irq(void *opaque, int irq_num, int level)
>  {
>      int i, pic_irq, pic_level;
> -    qemu_irq *pic = opaque;
> +    PIIX4State *s = opaque;
>      PCIBus *bus = pci_get_bus(piix4_dev);
>  
>      /* now we change the pic irq level according to the piix irq mappings */
> @@ -71,7 +71,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>                  pic_level |= pci_bus_get_irq_level(bus, i);
>              }
>          }
> -        qemu_set_irq(pic[pic_irq], pic_level);
> +        qemu_set_irq(s->isa[pic_irq], pic_level);
>      }
>  }
>  
> @@ -319,7 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>                                 NULL, 0, NULL);
>      }
>  
> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
>  
>      return dev;
>  }
> -- 
> 2.35.1
> 
> 
> 


