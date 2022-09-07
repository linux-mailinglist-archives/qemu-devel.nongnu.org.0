Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7B5AF905
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 02:39:24 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVj6A-0002DO-Ne
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 20:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVj4U-0000pD-Bz
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 20:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVj4Q-0008Lr-Nd
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 20:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662511053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujYUFDIZHPb4wRPDmrZTH8RFd8hhR/xta7lWVNix4Bc=;
 b=I8FTMBQiKaQ4/gQISeOCMkUVotcrPeX+TZLsCzwyVmms/q4klkTuADBuewvIpGA+PPT18k
 mlp8ScVGrDzrKqhV7RF6BvwLMvcujKuvnxLc+WHyK2vr2QUbJSe1FLi59Sep7tKf5DETT6
 GtFKgRSy79ILc7bKOnhXEEvr8n+sbaY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-rMR4SbM-NqKjoZAS0DrzRw-1; Tue, 06 Sep 2022 20:37:30 -0400
X-MC-Unique: rMR4SbM-NqKjoZAS0DrzRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D20F51C05158;
 Wed,  7 Sep 2022 00:37:29 +0000 (UTC)
Received: from [10.64.54.128] (vpn2-54-128.bne.redhat.com [10.64.54.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3E8492C3B;
 Wed,  7 Sep 2022 00:37:27 +0000 (UTC)
Subject: Re: [PATCH v2] KVM: dirty ring: add missing memory barrier
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Xu <peterx@redhat.com>
References: <20220827082218.214001-1-pbonzini@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <f088257f-77e1-98dd-fbea-5590d25ea37a@redhat.com>
Date: Wed, 7 Sep 2022 10:37:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220827082218.214001-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.752, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 8/27/22 6:22 PM, Paolo Bonzini wrote:
> The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
> the read of the fields are not ordered after the read of the flag,
> QEMU might see stale values.
> 
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 8d81ab74de..136c8eaed3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -719,7 +719,11 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
>   
>   static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   {
> -    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
> +    /*
> +     * Read the flags before the value.  Pairs with barrier in
> +     * KVM's kvm_dirty_ring_push() function.
> +     */
> +    return qatomic_load_acquire(&gfn->flags) == KVM_DIRTY_GFN_F_DIRTY;
>   }
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
> 


