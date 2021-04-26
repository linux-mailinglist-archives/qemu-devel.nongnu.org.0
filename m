Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D955136B42A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:35:28 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1OZ-0006va-V7
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb1Lq-0005pg-Ss
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb1Lo-0002JH-Il
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619443954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mSZ2gXT4lsGprxb52cGb3p/ETNv0Po5qG+u8IyKWmc=;
 b=hg6ETWfbELIOXD2EAbI3qArrQRpW5OTZ0MG/BVxfZHKjNwM8F56Chmtmhl+tOsAqOZwr9s
 sXpAcD8+gPvKU5q9vs/XA8HJLSxAdigZM7lfXFnI/teSwlAg4K6W6ncVVCLmEIHnVjlhv9
 CNsKCKt7nwKdm4AW7PA4srWfx9IpPA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-iXK-HB9BMO-6RcN-8L6UEw-1; Mon, 26 Apr 2021 09:32:31 -0400
X-MC-Unique: iXK-HB9BMO-6RcN-8L6UEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74AD7802B5B;
 Mon, 26 Apr 2021 13:32:30 +0000 (UTC)
Received: from [10.36.112.156] (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742DB10027A5;
 Mon, 26 Apr 2021 13:32:23 +0000 (UTC)
Subject: Re: [PATCH] make vfio and DAX cache work together by skipping virtio
 fs cache section during vfio memory region add
To: Edge NFV <edgenfv@gmail.com>
References: <20210426054513.132980-1-edgenfv@gmail.com>
 <20210426054513.132980-2-edgenfv@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <027ed12c-c5ec-6e5e-64d4-831424a35285@redhat.com>
Date: Mon, 26 Apr 2021 15:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426054513.132980-2-edgenfv@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2021 07:45, Edge NFV wrote:
> Signed-off-by: Edge NFV <edgenfv@gmail.com>

You must use your real name for a patch submission:

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

And CC: maintainer of the file:

$ ./scripts/get_maintainer.pl -f hw/vfio/common.c
Alex Williamson <alex.williamson@redhat.com> (supporter:VFIO)
qemu-devel@nongnu.org (open list:All patches CC here)

If you want to submit it to qemu-trivial, don't send a separate mail, but cc: also
qemu-trivial.

Thanks,
Laurent

> ---
>  hw/vfio/common.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ae5654fcdb..83e15bf7a3 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                  int128_get64(int128_sub(section->size, int128_one())));
>          return;
>      }
> +    
> +    /* Do not add virtio fs cache section */                  
> +    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {
> +        trace_vfio_listener_region_add_skip(
> +                section->offset_within_address_space,
> +                section->offset_within_address_space +
> +                int128_get64(int128_sub(section->size, int128_one())));
> +        return;
> +    }  
>  
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=
> 


