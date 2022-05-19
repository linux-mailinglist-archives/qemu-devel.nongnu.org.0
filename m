Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4252DAA3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:52:08 +0200 (CEST)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrjNe-0003o5-R4
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nrjLb-0001vI-EU
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nrjLZ-0002Ur-To
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652978997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1K/1Y82TQhVYsOzAx3lwxurCz15d/9wdaJIG2gbjOfQ=;
 b=QjB11NPvaCFz2JUfwZbjTW1cH1attw1j3/5WhNe7QqP3y58TAC2XnJWcX2khri+V3h8O1O
 fGw/gMlLOTSothK199sB8i3uliw20Ki2kho+I1opt+95NPkXe3nCOPVwqftIIchQMK5i5O
 EU8dgri+aslQk8Hbh/szW47f9d1HjtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-Qxe4uAgRMniLH7IjGgL1ng-1; Thu, 19 May 2022 12:49:48 -0400
X-MC-Unique: Qxe4uAgRMniLH7IjGgL1ng-1
Received: by mail-wr1-f71.google.com with SMTP id
 w20-20020adfd1b4000000b0020cbb4347e6so1761882wrc.17
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 09:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1K/1Y82TQhVYsOzAx3lwxurCz15d/9wdaJIG2gbjOfQ=;
 b=hK9yvt/Yuv6cXIlAMvplcCtOZjbaVUcWTfjfDJ1bh5mG7w7puXsLzqgfj6BMWQvjcJ
 /kiSJtfOns+JsParu0rUlWZwH9wBtScGzsKIi5t5W21nL/KQYRaZfdON9Y8MfISCfNhe
 cSgM3mAhQzCisDQUhc9//+BAQiAB2lSHNnAQEBRbZFfZDFw3dxUpGTj6mmQQuhUbN/f9
 F13vbkDvfcQrZG8olxl4YaFmIEhJ3KZCvHkvP8JzQQEKW/J23h6kj5M84ONpAGgg0C8o
 QueRYZuEFxa36LDGQb4adqQ0OX9AJlzAWwMkKXPjea5CHue09KXLn2pMC5FjN9sKxX9v
 EFfQ==
X-Gm-Message-State: AOAM5324lNf56N8Kgbz++OYXNCWXG/abvJb0B2Axntty/3K0h5fI+Si6
 W7aGDTtmST2FxjUr0QwztYqRaVZ4MBdDR30kLttHOkQeAXhnExk1ZSxWMZKn7ExFU6apvJ9C4vN
 y9P6nz0sIt5DI8UY=
X-Received: by 2002:a1c:4c17:0:b0:397:2d36:7241 with SMTP id
 z23-20020a1c4c17000000b003972d367241mr4026430wmf.10.1652978986790; 
 Thu, 19 May 2022 09:49:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJDoI+mzBo4RWhq4xLzMKEqY+keAKfdwWh0pS9N4OjT0Wjgzo1sIFgo8bb0IM215ZuQgQIBA==
X-Received: by 2002:a1c:4c17:0:b0:397:2d36:7241 with SMTP id
 z23-20020a1c4c17000000b003972d367241mr4026414wmf.10.1652978986537; 
 Thu, 19 May 2022 09:49:46 -0700 (PDT)
Received: from redhat.com ([151.81.230.224]) by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c338400b00394708a3d7dsm60453wmp.15.2022.05.19.09.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:49:45 -0700 (PDT)
Date: Thu, 19 May 2022 12:49:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wenliang Wang <wangwenliang.1995@bytedance.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH] hw/pci/pcie.c: Fix invalid PCI_EXP_LNKCAP setting
Message-ID: <20220519124909-mutt-send-email-mst@kernel.org>
References: <1652971559-22126-1-git-send-email-wangwenliang.1995@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652971559-22126-1-git-send-email-wangwenliang.1995@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 19, 2022 at 10:45:59PM +0800, Wenliang Wang wrote:
> pcie_cap_fill_slot_lnk() wrongly set PCI_EXP_LNKCAP when slot speed
> and width is not set, causing strange downstream port link cap
> (Speed unknown, Width x0) and pcie devices native hotplug error on Linux:
> 
> [    3.545654] pcieport 0000:02:00.0: pciehp: link training error: status 0x2000
> [    3.547143] pcieport 0000:02:00.0: pciehp: Failed to check link status
> 
> We do not touch PCI_EXP_LNKCAP when speed=0 or width=0, as pcie_cap_v1_fill()
> already do the default setting for us.
> 
> Signed-off-by: Wenliang Wang <wangwenliang.1995@bytedance.com>


do we need machine type compat dance with this?
can you check whether this affects cross version
migration please?

> ---
>  hw/pci/pcie.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 68a62da..c82e7fc 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -92,6 +92,11 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
>          return;
>      }
>  
> +    /* Use default LNKCAP setting */
> +    if (s->speed == 0 || s->width == 0) {
> +        return;
> +    }
> +
>      /* Clear and fill LNKCAP from what was configured above */
>      pci_long_test_and_clear_mask(exp_cap + PCI_EXP_LNKCAP,
>                                   PCI_EXP_LNKCAP_MLW | PCI_EXP_LNKCAP_SLS);
> -- 
> 2.7.4


