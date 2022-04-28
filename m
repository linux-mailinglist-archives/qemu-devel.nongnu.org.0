Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C0513F09
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:26:01 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDWK-0002cr-8H
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDO7-0005zA-Ih
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDO5-0007kM-TD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yD/EUcTo3Ha9EuHCyRzn0+z1M0pitEiXF4Ir4GX56PI=;
 b=YVOR33H8FtqL9FKFN4SaHQQwaCLcFsdb2cF7rbn9iQjZVUtlvf/R4UAwMl3CnSwgdv3TCa
 bSxbSIpdQ7l4mL2I7UkG7KzSsYXyqacK+QrrzBZ7I9a/7yDYHMxYM49SzmqnbMJl3Gkce/
 xdUME6adO81HAWe2OqbTNFFuaxMU3AM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-LczINcpaMgivsP7pUCek6Q-1; Thu, 28 Apr 2022 19:17:28 -0400
X-MC-Unique: LczINcpaMgivsP7pUCek6Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 s24-20020a05640217d800b00425e19e7deaso3497126edy.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yD/EUcTo3Ha9EuHCyRzn0+z1M0pitEiXF4Ir4GX56PI=;
 b=x9RpbFVlyrHsF1xD5xl5X4pS7t8+1B1RQGGBEgAH3N5UeQcC91ZutYjx51maQdEpX5
 2qsk2741TeQ1zrzW20rKiXjk01M2OpDA5szwZd66wbbGgVzspXE/xTWaktar/KU12UcN
 WUQICt8THdYEhowTfelGnZIBhV8WplnozeW+IO1DMC/jRDPUSB0VaVA+L0QBfldXl5FQ
 /XQlVe2eV/da1q4hedQJcgaS0ev5455oiZQ8fhoxPmoLkCIytwrzLkG6qR/Hmk3Zf7Nr
 295NKA1hK22ELHP1pqZO2SHkSmdh9LdepFDz0ZTlBzXldlW8Cn2Pd5u3Jt0y0c8RFyMm
 9EcQ==
X-Gm-Message-State: AOAM53384KybTwGppcujQyPsYClST+LLJK/92QXON34AS67oBJJWuKaX
 9jrRefsSfQv3vnwjswvpMxMc3rJbcdoa2vLMPFh7HCGm5XrhUcPp5zrcB6Gcw4ezSGHxMUKbj7J
 Et6Af88pArPSBnwc=
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id
 h3-20020a17090619c300b006ec0c7bed28mr33051015ejd.612.1651187846426; 
 Thu, 28 Apr 2022 16:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg8d6h2e7ktwZdlAl0hAXUDGExGAmFuyCHoHl5tjpYoOyxoJ7WRCzjF6RL4qpwOSgQQD1EIg==
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id
 h3-20020a17090619c300b006ec0c7bed28mr33051009ejd.612.1651187846198; 
 Thu, 28 Apr 2022 16:17:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 e2-20020a056402330200b0042617ba638fsm2272629eda.25.2022.04.28.16.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:17:25 -0700 (PDT)
Message-ID: <92020dd6-a5bb-4d23-ab05-d6ef63608df4@redhat.com>
Date: Fri, 29 Apr 2022 01:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/6] virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-5-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:35, Stefan Hajnoczi wrote:
> virtio_scsi_handle_ctrl_vq() is only called from hw/scsi/virtio-scsi.c
> now and its return value is no longer used. Remove the function
> prototype from virtio-scsi.h and drop the return value.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/virtio/virtio-scsi.h | 1 -
>   hw/scsi/virtio-scsi.c           | 5 +----
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 5957597825..44dc3b81ec 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -152,7 +152,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
>   
>   void virtio_scsi_common_unrealize(DeviceState *dev);
>   bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq);
> -bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq);
>   void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req);
>   void virtio_scsi_free_req(VirtIOSCSIReq *req);
>   void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index aa03a713d8..eefda16e4b 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -460,16 +460,13 @@ static void virtio_scsi_handle_ctrl_req(VirtIOSCSI *s, VirtIOSCSIReq *req)
>       }
>   }
>   
> -bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
> +static void virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
>   {
>       VirtIOSCSIReq *req;
> -    bool progress = false;
>   
>       while ((req = virtio_scsi_pop_req(s, vq))) {
> -        progress = true;
>           virtio_scsi_handle_ctrl_req(s, req);
>       }
> -    return progress;
>   }
>   
>   /*

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


