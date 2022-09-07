Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97145AFBEB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 07:47:25 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVnuG-0005VK-BN
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 01:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVnq8-0003kx-Cz
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 01:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVnq4-0000jG-S4
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 01:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662529378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZKFY12xEs8YQsBDwsJqwTuA78FIgzDoxMZokMfMEok=;
 b=GlIrUM/PbELPn8zxxPK++tyTYlfKNuzr/YaJj6FeJ9RbQYuz6MIbsJihHiWY3vqmMMB8oV
 em8zqamr74tS48zxKxLUBWKThVfok0cCx1EPukEA54PjUEUA79egkCjzOEP71uiQwkYVgJ
 5QHfehDzJAB6cL6fvHuLLLyPLk5rGKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-RpcjtLHhOOyHy8O6bFDehw-1; Wed, 07 Sep 2022 01:42:56 -0400
X-MC-Unique: RpcjtLHhOOyHy8O6bFDehw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9999D101A58E
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 05:42:56 +0000 (UTC)
Received: from [10.64.54.128] (vpn2-54-128.bne.redhat.com [10.64.54.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E104010E4D;
 Wed,  7 Sep 2022 05:42:54 +0000 (UTC)
Subject: Re: [PATCH] KVM: use store-release to mark dirty pages as harvested
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>
References: <20220902001936.108645-1-pbonzini@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <dd8eec63-e4a0-0b1d-1978-58bc33da8257@redhat.com>
Date: Wed, 7 Sep 2022 15:42:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220902001936.108645-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.752, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/22 10:19 AM, Paolo Bonzini wrote:
> The following scenario can happen if QEMU sets more RESET flags while
> the KVM_RESET_DIRTY_RINGS ioctl is ongoing on another host CPU:
> 
>      CPU0                     CPU1               CPU2
>      ------------------------ ------------------ ------------------------
>                                                  fill gfn0
>                                                  store-rel flags for gfn0
>                                                  fill gfn1
>                                                  store-rel flags for gfn1
>      load-acq flags for gfn0
>      set RESET for gfn0
>      load-acq flags for gfn1
>      set RESET for gfn1
>      do ioctl! ----------->
>                               ioctl(RESET_RINGS)
>                                                  fill gfn2
>                                                  store-rel flags for gfn2
>      load-acq flags for gfn2
>      set RESET for gfn2
>                               process gfn0
>                               process gfn1
>                               process gfn2
>      do ioctl!
>      etc.
> 
> The three load-acquire in CPU0 synchronize with the three store-release
> in CPU2, but CPU0 and CPU1 are only synchronized up to gfn1 and CPU1
> may miss gfn2's fields other than flags.
> 
> The kernel must be able to cope with invalid values of the fields, and
> userspace *will* invoke the ioctl once more.  However, once the RESET flag
> is cleared on gfn2, it is lost forever, therefore in the above scenario
> CPU1 must read the correct value of gfn2's fields.
> 
> Therefore RESET must be set with a store-release, that will synchronize
> with KVM's load-acquire in CPU1.
> 
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 136c8eaed3..7c8ce18bdd 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -728,7 +728,23 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
>   {
> -    gfn->flags = KVM_DIRTY_GFN_F_RESET;
> +    /*
> +     * Use a store-release so that the CPU that executes KVM_RESET_DIRTY_RINGS
> +     * sees the full content of the ring:
> +     *
> +     * CPU0                     CPU1                         CPU2
> +     * ------------------------------------------------------------------------------
> +     *                                                       fill gfn0
> +     *                                                       store-rel flags for gfn0
> +     * load-acq flags for gfn0
> +     * store-rel RESET for gfn0
> +     *                          ioctl(RESET_RINGS)
> +     *                            load-acq flags for gfn0
> +     *                            check if flags have RESET
> +     *
> +     * The synchronization goes from CPU2 to CPU0 to CPU1.
> +     */
> +    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
>   }
>   
>   /*
> 


