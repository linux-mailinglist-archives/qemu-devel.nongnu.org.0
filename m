Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979516718BA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5RZ-0002Bc-LX; Wed, 18 Jan 2023 05:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pI5RX-00028B-GY
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pI5RV-0008QV-7k
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674036791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRjJcGcIJeRz3HV0dfr6+yOWYOH/Jreqd5wo9IIEYVE=;
 b=UAFPPt53vlBRsW46tzoiZjMJrGnMhICrgvXlo2ffXn96JLmzy+rfWKUczFTaGJbCF5XM7A
 aJxAyql9eHfoXyXa+bMiExOMyfIiK44ca/HZzXiBSV1J+JMJgn/mzIpkFcuUhjkTLnGpkF
 PMWbw199wd1z0eCD94gDGIJYwUszFDE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-o1zxtAUiOwyqfo_iJDg-ng-1; Wed, 18 Jan 2023 05:13:09 -0500
X-MC-Unique: o1zxtAUiOwyqfo_iJDg-ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 j30-20020adfb31e000000b002be008be32cso2121927wrd.13
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRjJcGcIJeRz3HV0dfr6+yOWYOH/Jreqd5wo9IIEYVE=;
 b=KONfOtEu4rQE4k5ion2rVwXSBdLZDjKu5PZNsLUGxc2IoJ7A3YXEQ2QWZBviCbQb3Z
 qa3Qzdo28ieTQK5mMC3sSckwurbrCg7om1B9q8vHAbCkBiY1wdkXFYMvEFHCZJsDsZxb
 pkwKerJOmAtekK3vkpaegY5I6KCB/+5ZQnlstH88OcV1/dOXrSDiM7wCxQ+A87pbopoV
 ZX9ELXwgPh/BjRk405Bu1GqPWqH77Rh/YwckW6ghffnZb7/U0J1Zn2DSgyPBSG45ohAK
 u9asylbfiN0Wa6LE263CphhrYSgBKnAluCtnthyCo/3DypLDmh6ksKIyISh0I87GT1oY
 nJrA==
X-Gm-Message-State: AFqh2kqZ7464RXBEL2oU/2dB6wW0L9NkDUMPl3eZP0aJ4CMuD59Rh+8i
 pQ65E3sJQfZ3W05nZd3CvZ0hcu24O3g4t//Qv5uFl9OGEuB/QyiEBFiAcYTmZObu9quTEzO2HFH
 wy/7zsmJD/QCdPs4=
X-Received: by 2002:a05:600c:3ca0:b0:3da:fc15:740c with SMTP id
 bg32-20020a05600c3ca000b003dafc15740cmr6168761wmb.19.1674036788249; 
 Wed, 18 Jan 2023 02:13:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPeaEuZcdoxm8td8K7KjvHiWcT8LazBuqb1MG4N7vId7zMUQX+86m6izbLliR3bAA1shRznA==
X-Received: by 2002:a05:600c:3ca0:b0:3da:fc15:740c with SMTP id
 bg32-20020a05600c3ca000b003dafc15740cmr6168742wmb.19.1674036788038; 
 Wed, 18 Jan 2023 02:13:08 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 z4-20020a1cf404000000b003da2932bde0sm1700355wma.23.2023.01.18.02.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:13:07 -0800 (PST)
Date: Wed, 18 Jan 2023 05:13:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <20230118051230-mutt-send-email-mst@kernel.org>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> machine agnostic to the precise southbridge being used. 2/ will become
> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> the "Frankenstein" use of PIIX4_ACPI in PIIX3.

Looks ok to me.
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge through Xen tree.

> v2:
> - xen_piix3_set_irq() is already generic. Just rename it. (Chuck)
> 
> Testing done:
> None, because I don't know how to conduct this properly :(
> 
> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>           "[PATCH v4 00/30] Consolidate PIIX south bridges"
> 
> Bernhard Beschow (6):
>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>   hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>   hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>   hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>   hw/isa/piix: Resolve redundant k->config_write assignments
>   hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> 
>  hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>  hw/i386/xen/xen-hvm.c         |  2 +-
>  hw/isa/piix.c                 | 66 +----------------------------------
>  include/hw/southbridge/piix.h |  1 -
>  include/hw/xen/xen.h          |  2 +-
>  stubs/xen-hw-stub.c           |  2 +-
>  6 files changed, 35 insertions(+), 72 deletions(-)
> 
> -- 
> 2.39.0
> 


