Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9FC63483C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxZwE-0006Bk-NW; Tue, 22 Nov 2022 15:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxZwB-0006BH-F6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxZw9-0007Vi-RN
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669149128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzhqnF4vCDzlRUSZd6dEqRem4y2iAJ1HX5O0fiO4pKs=;
 b=V0rhRkviWSGqsELEwBrfSgguRvaxZi+ixKSAtxiRpE1r9gqo0f/OY/4KG4bF1P8rkOPfow
 bkygZjbadvueIWELDxEgmo01qn3iW7asfr6FCb8rmNosbKlnQGi2KLD/IlBfx3nJM2FYIM
 +X8llj+RszGUI/j5IT45ORKUEqoV5Vg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-E_5q4NraMoqReboaN20DJw-1; Tue, 22 Nov 2022 15:32:07 -0500
X-MC-Unique: E_5q4NraMoqReboaN20DJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i65-20020a1c3b44000000b003d02dc20735so232325wma.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzhqnF4vCDzlRUSZd6dEqRem4y2iAJ1HX5O0fiO4pKs=;
 b=AD7iLNUA+NnvtWlOuMxgBCQHCkaBYxVcbTBCr/Oqdre5ykMsTSPJzqEFCOTemkbj/s
 YBYDXaMBQA3qlKplZAB+7Gihx3IBpylBS1/3LOQU23kE+9iKt4O/nxN5iwYzgAKnHh0O
 2eRcorTgTBAlgU+0CgSH3SfsbBArxvutBAL34T1jhOM+x3EPweK5cd2CfCPy/MQ5kfOB
 5rgi9AMz4oKBqVhXj2Iwz1bTHt2GRjOIPVWdlCzg3keN/DCiJDpUvzHyoIXGEgaHrHEL
 rIF65jc+xPaNAi19fnrz/Mjy5ZutRjuenjroWg0vr2I+jXc8cHqHZ3MZ5OrOBUpSCjr5
 3t7Q==
X-Gm-Message-State: ANoB5pkEwUr5Z3sBgQHTljl7A2WtxoWPEqVAlqRB8bAfkzFQtJ/hSids
 beH3WjITepE4G7zQOdfzOzQb58bgwr2O7IitI5wilKWMssrFxrZ7aiz2x05zteSbeQe1rEl/MHR
 VpRSx7KiQfnnfpdw=
X-Received: by 2002:adf:f8ca:0:b0:241:c933:4b0e with SMTP id
 f10-20020adff8ca000000b00241c9334b0emr8541421wrq.48.1669149126222; 
 Tue, 22 Nov 2022 12:32:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5672TOaudLOiyKdX202SufQd4hX0k/0M5baMGfIlOMG48O0Zi5CSx3p8wZMIzV9QyivQfHOQ==
X-Received: by 2002:adf:f8ca:0:b0:241:c933:4b0e with SMTP id
 f10-20020adff8ca000000b00241c9334b0emr8541410wrq.48.1669149125995; 
 Tue, 22 Nov 2022 12:32:05 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 c18-20020adffb12000000b002365730eae8sm14621731wrr.55.2022.11.22.12.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:32:05 -0800 (PST)
Date: Tue, 22 Nov 2022 15:32:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, eperezma@redhat.com, eric.auger@redhat.com
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Message-ID: <20221122152944-mutt-send-email-mst@kernel.org>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122145349.86072-1-marcandre.lureau@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> warning") removed the warning on vfio_listener_region_add() path.
> 
> An error is reported for vhost-vdpa case:
> qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> 
> Skip the CRB device.
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=2141965
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..9d7206e4b8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -19,6 +19,7 @@
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-shadow-virtqueue.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "sysemu/tpm.h"
>  #include "exec/address-spaces.h"
>  #include "migration/blocker.h"
>  #include "qemu/cutils.h"
> @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>  {
>      Int128 llend;
>  
> +    if (TPM_IS_CRB(section->mr->owner)) {
> +        /* The CRB command buffer has its base address unaligned. */
> +        return true;
> +    }
> +

Quite a hack. We can't really keep adding dependency on random devices
to vhost. And would you add hacks like this to listeners?
Pls figure out what's special about this buffer.
Also if this section is unaligned then doesn't it break up
other aligned sections?


>      if ((!memory_region_is_ram(section->mr) &&
>           !memory_region_is_iommu(section->mr)) ||
>          memory_region_is_protected(section->mr) ||
> -- 
> 2.38.1


