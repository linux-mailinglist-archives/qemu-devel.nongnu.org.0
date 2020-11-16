Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C354E2B4FEA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:37:54 +0100 (CET)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejNx-0000PM-QL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kej78-00077Q-KH
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kej76-0002hx-BN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87N2fOWBMq4MeR6quFKqkLJAD5Tb46Nh0TjUUpmG4tk=;
 b=WMuroXxwn07ThApYS2Q+Lo0WoRA4pTwpLlsCzjnasvrOiVJ797bUZwXrxsuWbCED9oC3ZW
 WljvZX/tyCk4d4Mec5kw7VtG8bm09Hz62N1w4mxzKLgYjv2OCbq7536hRz0hdPFoO9gFSE
 Iycbl9rDYaUcAm6cdjNEZdr4Qe1JYx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-3-lUYUmBMuKUt1Kq22nAGg-1; Mon, 16 Nov 2020 13:20:24 -0500
X-MC-Unique: 3-lUYUmBMuKUt1Kq22nAGg-1
Received: by mail-wm1-f69.google.com with SMTP id v131so86799wma.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=87N2fOWBMq4MeR6quFKqkLJAD5Tb46Nh0TjUUpmG4tk=;
 b=AVAU4wUd8iJX0NY/xo39TvvM0eccnpIGf/vC+jxQiPCbS+GglUs3a1+VBnfAHg2WUt
 NXVXCvdz6sy4jj1IVWkQvne/+ita2CSRMRVsaco1b8wTHV8PogX1X41BXDoKVcVu7bdG
 QAGnl0u9OxjC/Ls1Wt9KumZ7df+MLMixzHhi4ctXLOSn2RxDxnSArc6IvlQ24Q6juR6M
 KOFHwuJGy+nwadZD9HW7sUsMRtQfh/MAMxaIhyhf7+fDS5hSLuJ3j2X7giIDjxYUlaqv
 VvpCfRTMobtlc1VGpFApVXj0D1tbtq+ICv9JeNFvsD4CReLep/YGoWaHcuZXBW3+RTrQ
 lJkA==
X-Gm-Message-State: AOAM531PFO/IwGeDRYkWgwjsJ+M1cZO7YLp+ylATCd4VKGWyk5ydfSHi
 P+UjX7VVBdhhWBb/czxI47qa/ssfuxUFMTAV7Cdk8Su7iC776oOvpuB5nUw2ENEmu95NVmJ2NAH
 X/ALMN6Y6xYc2FU0=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr22142605wrt.150.1605550823463; 
 Mon, 16 Nov 2020 10:20:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqddBurgjp0xhzcEjtVHnPvMUjONPtOGltLwAWU935PsZ6MsyqDJIkaO2V/0lGnSi3SuCcJg==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr22142584wrt.150.1605550823282; 
 Mon, 16 Nov 2020 10:20:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y4sm183153wmj.2.2020.11.16.10.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:20:22 -0800 (PST)
Subject: Re: [PATCH] util/vfio-helpers.c: Use ram_block_discard_disable() in
 qemu_vfio_open_pci()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20201116105947.9194-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <996cb0a2-f0ce-32bb-efcc-64da9964c518@redhat.com>
Date: Mon, 16 Nov 2020 19:20:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116105947.9194-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 11:59, David Hildenbrand wrote:
> Currently, when using "nvme://" for a block device, like
>      -drive file=nvme://0000:01:00.0/1,if=none,id=drive0 \
>      -device virtio-blk,drive=drive0 \
> 
> VFIO may pin all guest memory, and discarding of RAM no longer works as
> expected. I was able to reproduce this easily with my
>      01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
>              NVMe SSD Controller SM981/PM981/PM983
> 
> Similar to common VFIO, we have to disable it, making sure that:
> a) virtio-balloon won't discard any memory ("silently disabled")
> b) virtio-mem and nvme:// run mutually exclusive
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   stubs/ram-block.c   |  6 ++++++
>   util/vfio-helpers.c | 14 ++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/stubs/ram-block.c b/stubs/ram-block.c
> index 73c0a3ee08..108197683b 100644
> --- a/stubs/ram-block.c
> +++ b/stubs/ram-block.c
> @@ -1,6 +1,7 @@
>   #include "qemu/osdep.h"
>   #include "exec/ramlist.h"
>   #include "exec/cpu-common.h"
> +#include "exec/memory.h"
>   
>   void *qemu_ram_get_host_addr(RAMBlock *rb)
>   {
> @@ -29,3 +30,8 @@ int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
>   {
>       return 0;
>   }
> +
> +int ram_block_discard_disable(bool state)
> +{
> +    return 0;
> +}
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index c469beb061..2bec48e163 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -16,6 +16,7 @@
>   #include "qapi/error.h"
>   #include "exec/ramlist.h"
>   #include "exec/cpu-common.h"
> +#include "exec/memory.h"
>   #include "trace.h"
>   #include "qemu/error-report.h"
>   #include "standard-headers/linux/pci_regs.h"
> @@ -494,8 +495,20 @@ QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp)
>       int r;
>       QEMUVFIOState *s = g_new0(QEMUVFIOState, 1);
>   
> +    /*
> +     * VFIO may pin all memory inside mappings, resulting it in pinning
> +     * all memory inside RAM blocks unconditionally.
> +     */
> +    r = ram_block_discard_disable(true);
> +    if (r) {
> +        error_setg_errno(errp, -r, "Cannot set discarding of RAM broken");
> +        g_free(s);
> +        return NULL;
> +    }
> +
>       r = qemu_vfio_init_pci(s, device, errp);
>       if (r) {
> +        ram_block_discard_disable(false);
>           g_free(s);
>           return NULL;
>       }
> @@ -837,4 +850,5 @@ void qemu_vfio_close(QEMUVFIOState *s)
>       close(s->device);
>       close(s->group);
>       close(s->container);
> +    ram_block_discard_disable(false);
>   }
> 

Queued, thanks.

Paolo


