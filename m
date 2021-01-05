Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142872EA981
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:06:20 +0100 (CET)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwkAN-000583-5d
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwk8K-00044T-LE
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwk8J-0007bt-3c
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609844650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhEb6IKJxF+dezkTX0J1ddSOzu//0Q/wqITiikG7nr4=;
 b=KdcGJmQrS8eJ56iGEHYApeA0fW3MvPztuNZyvuNlGB6Ek0iTVGQZ7L9m0wgnEZ/62WTspV
 qtoEqVaLqpz2T9xyOhpbFnoeWRmAe8TfFatFUwHKTjtyPBeIHWF+kCAQNQXrl85t3CMeXW
 MUkNALo04pNrHyTeH94vZ46+J3kxWuk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-goYKokYwN72UCympUPM-3A-1; Tue, 05 Jan 2021 06:04:08 -0500
X-MC-Unique: goYKokYwN72UCympUPM-3A-1
Received: by mail-wm1-f69.google.com with SMTP id w204so1110100wmb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 03:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GhEb6IKJxF+dezkTX0J1ddSOzu//0Q/wqITiikG7nr4=;
 b=pm2Jtk0BUPKz/L39rWql1KhRUwTdfexbQ6gCg19fRMETeHAY2vvMf+DqiuGhvuvtmP
 4ezCYv7LaqFn9XraQUW7mEjs+3UZ/DFwdH7NmmcrHpcOdWs72npgXPBldyL7VfuBwqo6
 fSfg+i8nYUWhwKkS64berUgluwlGAkJz0QMkhTy+xEgg7TiPBKNirgzqPzNPxNapYecp
 T5LQfTlTNcZuAeCOnb4c5uLcx0/NLUT+P6URLJalIeRvEDiOdV1+Zym6dnDiQa5Bp+VY
 jwM2F44n73hL0kxVaHPBz0GwbmwPZOY7juWqRiuuFLEYYu/cecclQ5yLYVsMuR9V8Av4
 Atpw==
X-Gm-Message-State: AOAM5318I8EA3RyGrNOhBO8iBC+ZPBcnAWe3QiRCMIBRDVr3dMg/zV0l
 4bvE5siwQgY+x9ZzE4zDpg0mMI8PJ/QWdXHR9j6B0atUhr6PplU0EukiynlF15Rgn7DYSicmxkp
 bYlakUoL42rEHP60=
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr2930306wmd.41.1609844647056; 
 Tue, 05 Jan 2021 03:04:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+luF3HtXb3tmXQilpKjg5nQCMc2/ScSCWpGvXbf1EaUXosqbNxW7GVcFgUPouTEmChysjbw==
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr2930283wmd.41.1609844646804; 
 Tue, 05 Jan 2021 03:04:06 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s6sm104900465wro.79.2021.01.05.03.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 03:04:05 -0800 (PST)
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
To: qemu-devel@nongnu.org
References: <20201210172834.178052-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d4dcb51a-e738-33e0-fb7a-bad6cbe07ba0@redhat.com>
Date: Tue, 5 Jan 2021 12:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201210172834.178052-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 12/10/20 6:28 PM, Philippe Mathieu-Daudé wrote:
> Replace I/O write error reported with error_report() by
> qemu_log_mask(GUEST_ERROR) which allow filtering.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio-pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index f863f69ede4..094c36aa3ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -27,6 +27,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
> @@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>          virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>          break;
>      default:
> -        error_report("%s: unexpected address 0x%x value 0x%x",
> -                     __func__, addr, val);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: unexpected address 0x%x value 0x%x\n",
> +                      __func__, addr, val);
>          break;
>      }
>  }
> 


