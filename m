Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D212DABC9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:22:06 +0100 (CET)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8P5-0003zZ-UN
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kp8OB-0003Vo-58
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:21:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kp8O9-0000Hy-6c
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608031263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=47CChOcaKk2I0p//Zs2WEquZviLjfhXYzu/2qDyu5Pg=;
 b=C0XaxS014XLM6tXl0VtuA7Q1sBLbRpIl1RqcJjCucZZrZ3jfnPhz3yLCyZq5ftDcx8aVR1
 ZwB/qG1r0dVcEhG5IVTZ3OkNYDnFV9Sg6/njIZHaFHKCDOWpdHnmk9vFmrsEP6P0bXnw4U
 626s7bQVojPtHxwc7j0wqM0Q8WQWl1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-TR038aG4PTS3L2cwRQL2SA-1; Tue, 15 Dec 2020 06:21:00 -0500
X-MC-Unique: TR038aG4PTS3L2cwRQL2SA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80AB11922963;
 Tue, 15 Dec 2020 11:20:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-113-73.ams2.redhat.com
 [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C44619C44;
 Tue, 15 Dec 2020 11:20:51 +0000 (UTC)
Date: Tue, 15 Dec 2020 12:20:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
Message-ID: <20201215112049.sb6kq4elecm4g4zw@kamzik.brq.redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201215071948.23940-2-zhukeqian1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 03:19:47PM +0800, Keqian Zhu wrote:
> When handle dirty log, we face qemu_real_host_page_size and
> TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
> bitmap, and the second one is the granule of QEMU dirty bitmap.
> 
> Generally speaking, qemu_real_host_page_size >= TARGET_PAGE_SIZE,

Not just generally speaking, but must be. We have

    /*
     * On systems where the kernel can support different base page
     * sizes, host page size may be different from TARGET_PAGE_SIZE,
     * even with KVM.  TARGET_PAGE_SIZE is assumed to be the minimum
     * page size for the system though.
     */
    assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size);

at the top of kvm_init() to enforce it.

The comment also says TARGET_PAGE_SIZE is assumed to be the minimum,
which is more of a requirement than assumption. And, that requirement
implies that we require all memory regions and base addresses to be
aligned to the maximum possible target page size (in case the target
actually uses something larger).

Please remove 'Generally speaking' from the commit message. It
implies this change is based on an assumption rather than a rule.

(It'd be nice if we had these guest memory and TARGET_PAGE_SIZE
requirements better documented and in one place.)

> so misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap may waste
> memory. For example, when qemu_real_host_page_size is 64K and
> TARGET_PAGE_SIZE is 4K, this bugfix can save 93.75% memory.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index baaa54249d..c5e06288eb 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
>       * too, in most cases).
>       * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
>       * a hope that sizeof(long) won't become >8 any time soon.
> +     *
> +     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
> +     * And mem->memory_size is aligned to it (otherwise this mem can't
> +     * be registered to KVM).
>       */
> -    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
> +    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
>                                          /*HOST_LONG_BITS*/ 64) / 8;
>      mem->dirty_bmap = g_malloc0(bitmap_size);
>  }
> -- 
> 2.23.0
> 
>

Besides the commit message

Reviewed-by: Andrew Jones <drjones@redhat.com>


Thanks,
drew


