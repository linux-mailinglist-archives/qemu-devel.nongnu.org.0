Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4B5E7040
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 01:35:30 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obVj7-0005JK-38
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 19:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1obVhj-0002at-97
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 19:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1obVhf-0002GM-KQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 19:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663889637;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3cN65n/MRLRcZzndBEiA9XrYNwR372HXCt6AkpbhHk=;
 b=fmu4ffvGAX42CVhB0eH8lmzi2E+DKROaX4TuVnoJEH7xyKnJ89acbNQiXHnPGNGnlUx1I3
 LNDHBIekZUbOxg98j7olFaeDoy9l4LEZodB+sWcXGp1Cmpj8JjYHsW3L9DvQI6BCj50FSZ
 kmKSEkGOER72mlAfxONtaOIJ9BDZ/YQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-QS-VsLhWNHCCc510_jkb0w-1; Thu, 22 Sep 2022 19:33:56 -0400
X-MC-Unique: QS-VsLhWNHCCc510_jkb0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230DF29AA388;
 Thu, 22 Sep 2022 23:33:56 +0000 (UTC)
Received: from [10.64.54.126] (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C16240C6EC3;
 Thu, 22 Sep 2022 23:33:54 +0000 (UTC)
Subject: Re: [PATCH] KVM: dirty ring: Add memory barrier when marking pfn
 collected
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220922213522.68861-1-peterx@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3965dfdb-0c38-f28d-8e99-df16aea482aa@redhat.com>
Date: Fri, 23 Sep 2022 09:33:52 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220922213522.68861-1-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 7:35 AM, Peter Xu wrote:
> Following commit 4802bf910eee9, add the other missing barrier when marking
> the PFN as collected.  This will also be required just like 4802bf910eee9
> on weak ordering architectures like aarch64.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 136c8eaed3..60a044048e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -728,7 +728,11 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
>   {
> -    gfn->flags = KVM_DIRTY_GFN_F_RESET;
> +    /*
> +     * Write the flags after reading the entry.  Should pair with another
> +     * smp_load_acquire() in KVM when reset dirty rings.
> +     */
> +    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
>   }
>   
>   /*
> 


