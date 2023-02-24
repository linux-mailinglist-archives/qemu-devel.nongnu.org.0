Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297F6A1F84
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVao7-0002A9-Jq; Fri, 24 Feb 2023 11:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVanz-00028o-Vk
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVanx-0002Hd-57
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677255616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJW/EXOxmnZz4vHwD1mY/jJwFJ+C7BJzLUrUS+1Zjfg=;
 b=awfzIowfnFRHL2s3NH27/zunI708jFAIXo06kLmpc/1zW/297kZjB0UUKO9OI6SPy33DJM
 pntZNEwB87VLyQ7I6Nqls6gbEHaFEtxMmRJ6buVVapWBwL4VemDvnkbXn3i4A+sGuoXp+j
 dnv8fj67HlZL2V0fhkU3eVrH6kPAfcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-B63KPoEvPv6Nq8l7TBYYFw-1; Fri, 24 Feb 2023 11:20:13 -0500
X-MC-Unique: B63KPoEvPv6Nq8l7TBYYFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k6-20020adfc706000000b002c716981a1fso989032wrg.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 08:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJW/EXOxmnZz4vHwD1mY/jJwFJ+C7BJzLUrUS+1Zjfg=;
 b=ZHxL6ul9bFJ7P+yqksSN6O2qEixpFYTGsTxBo4hpB0plfiwCxRYK/ddE/IOfsWwkxC
 T6kFSx+NHyBdLBroMEZ5J8bcpWl6CeZqUHf10JcqaFuRCxR8KzzO/tWBDmPtDD9JfbRB
 hQvyoqlZiVrUKNndYDwrm5ARx/YQDr4O7dYAS2OaJNrthiMWgfH7MrJOZXSYUEuHTrK1
 BtXSMpzGy/rtbuCuHc2kJgPeDOWaMN4xdn4yIf9bhK2WXTZ4SIPs+bgw4p2hdS2YW7/x
 0w07ltHarhrXlJ6PhylTWRobctN12AdNzIKJqLmJ8dyadoFVk1tqN8PtQ9G7/FbojAH5
 B8bA==
X-Gm-Message-State: AO0yUKUVWQ8UcxpY+XpiWuHUO5SFP8rdxb3Pxi15ibx6HYhVWbYDrs9r
 D0Q8t3AZLageww+73HL6YSqr76pK6oRlJMP3ANF854autaEnwk+TyKJYRmmxKLJqG72mKwQxJnP
 JiHIhL3ARxAMW8X8=
X-Received: by 2002:a05:600c:4b28:b0:3c6:e61e:ae71 with SMTP id
 i40-20020a05600c4b2800b003c6e61eae71mr13008310wmp.1.1677255612274; 
 Fri, 24 Feb 2023 08:20:12 -0800 (PST)
X-Google-Smtp-Source: AK7set98yP7DQ/Aik8IhLPAc9RNtu0EJW66irKTXhFrqa8HukRcv/O94qYeqfG22WHMmm7Xbjk2wsQ==
X-Received: by 2002:a05:600c:4b28:b0:3c6:e61e:ae71 with SMTP id
 i40-20020a05600c4b2800b003c6e61eae71mr13008293wmp.1.1677255611945; 
 Fri, 24 Feb 2023 08:20:11 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a05600c2f1a00b003eae73ee4a1sm3428647wmn.17.2023.02.24.08.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:20:11 -0800 (PST)
Date: Fri, 24 Feb 2023 11:20:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
Message-ID: <20230224111920-mutt-send-email-mst@kernel.org>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126211740.66874-8-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 26, 2023 at 10:17:37PM +0100, Bernhard Beschow wrote:
> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> index 54a1246a9d..f9974c2a77 100644
> --- a/hw/isa/piix.c
> +++ b/hw/isa/piix.c
> @@ -345,9 +345,14 @@ static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
>  
>      /* IDE */
>      qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
> +    qdev_prop_set_bit(DEVICE(&d->ide), "user-created", false);
>      if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
>          return;
>      }
> +    qdev_connect_gpio_out(DEVICE(&d->ide), 0,
> +                          qdev_get_gpio_in(DEVICE(&d->pic), 14));
> +    qdev_connect_gpio_out(DEVICE(&d->ide), 1,
> +                          qdev_get_gpio_in(DEVICE(&d->pic), 15));
>  

OK, but I think we should prefix this with "x-" so we don't commit
to this as a stable API.


>      /* USB */
>      if (d->has_usb) {
> -- 
> 2.39.1


