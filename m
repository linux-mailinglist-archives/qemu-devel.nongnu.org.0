Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AAE2B449C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:21:42 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeRx-0006fW-Mk
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keeL3-0001QT-Hv
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keeKx-00049S-G8
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605532465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuYlqJnW7nPMPk1/b6RL7B+pngaRQpLpr3GATB5YaZA=;
 b=K2j0R6/aWBzKTIRQ0rc7+dc7OwZHA34MfWFOP+xIOvz7zsM7BGUDvBWUJhQUE36MpBqBil
 HqQ0RB2tcKUvsiXGd5MumN7wos6XCJ0Mva3fQ/2+z4oEBrB6Egwe+SjGVKvatJYpDdgGqT
 LIPYgShZXKxuJaMab76bCDX1y1z2UWY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-DwRavy9lOje740XQvPP9rA-1; Mon, 16 Nov 2020 08:14:23 -0500
X-MC-Unique: DwRavy9lOje740XQvPP9rA-1
Received: by mail-wr1-f69.google.com with SMTP id l5so11065449wrn.18
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DuYlqJnW7nPMPk1/b6RL7B+pngaRQpLpr3GATB5YaZA=;
 b=UEiRljinLEBZ/kZgTjP1dBFCG9tVHgqhvkjzghDwRTXfiwAcv8vneIfhjZoM5eMxWN
 crNcOMM76/HHY5M1AvCV8hK8a9Cnl7hT7ZSvpHfoezY/L5zUZVvK581fj5SlgxeW93sx
 /t29Ax/5pVPZ60CxCVpVrZdUYWfbHgws35eZsKl4gsuw7syI7LUwIB9AopguS1I1zxV3
 6IXUzNIjww6ie+zTGKWF3uwmH974EQCGdlfuUisuG4SeYS548hAnprCmAipB6SIoVuXT
 CG6HjFLZkWqBwthiGfzlnbkvdUgZyYx12ohKtuIO5JrDyNj4Cvf9k/IaBjTIsG/v2e9n
 uEiA==
X-Gm-Message-State: AOAM531H51gYhXhD9aE3fqxxkBG5QgewTifBOSPdpB+g3klngHucaqrR
 j/MFsXkeqzzssEvL24Eq8VyEfrkdyuJ3WBWoEPH/9xDHEcKYekbRSlyY++gkQ5N1HiO+kFKhDJq
 l6VZwXelMNkYsBIw=
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr11942559wmf.76.1605532462754; 
 Mon, 16 Nov 2020 05:14:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLkF2JX3EmrbJ08jQ0ruYsQyRhDvAZtb1bsDOOnnS57dum6qBlIGUEFbW2ygYhpHmqGtYIRw==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr11942541wmf.76.1605532462593; 
 Mon, 16 Nov 2020 05:14:22 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t74sm20214224wmt.8.2020.11.16.05.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 05:14:21 -0800 (PST)
Subject: Re: [PATCH] util/vfio-helpers.c: Use ram_block_discard_disable() in
 qemu_vfio_open_pci()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20201116105947.9194-1-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1cbb9248-aaf1-ed15-643c-0be73f14f1a9@redhat.com>
Date: Mon, 16 Nov 2020 14:14:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116105947.9194-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

Is this aiming at 5.2?

On 11/16/20 11:59 AM, David Hildenbrand wrote:
> Currently, when using "nvme://" for a block device, like
>     -drive file=nvme://0000:01:00.0/1,if=none,id=drive0 \
>     -device virtio-blk,drive=drive0 \
> 
> VFIO may pin all guest memory, and discarding of RAM no longer works as
> expected. I was able to reproduce this easily with my
>     01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
>             NVMe SSD Controller SM981/PM981/PM983
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
>  stubs/ram-block.c   |  6 ++++++
>  util/vfio-helpers.c | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/stubs/ram-block.c b/stubs/ram-block.c
> index 73c0a3ee08..108197683b 100644
> --- a/stubs/ram-block.c
> +++ b/stubs/ram-block.c
> @@ -1,6 +1,7 @@
>  #include "qemu/osdep.h"
>  #include "exec/ramlist.h"
>  #include "exec/cpu-common.h"
> +#include "exec/memory.h"
>  
>  void *qemu_ram_get_host_addr(RAMBlock *rb)
>  {
> @@ -29,3 +30,8 @@ int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
>  {
>      return 0;
>  }
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
>  #include "qapi/error.h"
>  #include "exec/ramlist.h"
>  #include "exec/cpu-common.h"
> +#include "exec/memory.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
>  #include "standard-headers/linux/pci_regs.h"
> @@ -494,8 +495,20 @@ QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp)
>      int r;
>      QEMUVFIOState *s = g_new0(QEMUVFIOState, 1);
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
>      r = qemu_vfio_init_pci(s, device, errp);
>      if (r) {
> +        ram_block_discard_disable(false);
>          g_free(s);
>          return NULL;
>      }
> @@ -837,4 +850,5 @@ void qemu_vfio_close(QEMUVFIOState *s)
>      close(s->device);
>      close(s->group);
>      close(s->container);
> +    ram_block_discard_disable(false);
>  }
> 


