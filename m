Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AB68B28C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 00:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOnzj-00054k-Dk; Sun, 05 Feb 2023 18:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pOnzh-00054W-E8
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:00:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pOnzf-0002rk-KL
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675638016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L25MYkhdOnpiKzOfCj2Fc4Isn4qfpaZ97kTX546Q7Gk=;
 b=KylSytOdZsaHJFkye0FfmMZRogTAae3e/xiFK1Ipx/CLeKVv+VqzWFxhfuqQ2rc3VQ/Lof
 nHHaDiMYhR4Oq7SMozJPJWE1ZKSaJo7YqAhl1DF45D/XSvhApgZQ8GRnbrkjg44c+O8iMy
 EgDUuZxrUZ14K8GFv4dFJDd5XZZ1TuU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244--HhXANfIM1Oo9SOZegauQw-1; Sun, 05 Feb 2023 18:00:15 -0500
X-MC-Unique: -HhXANfIM1Oo9SOZegauQw-1
Received: by mail-qt1-f199.google.com with SMTP id
 hf20-20020a05622a609400b003abcad051d2so5487223qtb.12
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 15:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L25MYkhdOnpiKzOfCj2Fc4Isn4qfpaZ97kTX546Q7Gk=;
 b=tckJR8G68S8VKYU7SrGpbSeJQOcDt45Yt14xPacXUWCMv9c6ISUT6T5rcEtS2IoUAN
 A1xlrGND/b3NLc7niJkGhci55JdsK/Ze+WV6ABthCeKME9zTFpkXBc5DGSgrVGb3TQWl
 /r+fo8mxO3tMLwVUL2kmD+1VrOpH0KExcpkJ8a6v6Rfr3gPGiZ6NhnuOzG8Yprvfz4aQ
 FU++NPxDU2AvZZl6ILK0DmHb1eywFDNgiKBSNNcO8WymRItNloS7eEGB8/dV6Ju4OYTT
 sxvfz3xHOxDvz6WS2bU10+vSB7XPLBft1VDwz6PjJWx1F1JNLM1oOnxf7kgPshvEOouZ
 8Ykg==
X-Gm-Message-State: AO0yUKWikGaw87eaP4EzX6O8y9n8kS4lI9rVc2uCSO69HIrUYBJy7Y2U
 cUcnPoSC5Pu+UiMFQ6WfnoX0LksRa1Vcze66kwgK6l52yJ8dhtzcggYL2C7eLXPJYkW9WSzZD9a
 /s0d/FgFHf+i8UfU=
X-Received: by 2002:ac8:7d88:0:b0:3b8:4951:57bb with SMTP id
 c8-20020ac87d88000000b003b8495157bbmr37173167qtd.5.1675638014936; 
 Sun, 05 Feb 2023 15:00:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+vei0r5v9I+XS3lU2LE63bGGw51er76Uk+g/N8dKlfckc70VFkzkFmLRp/RY19A1j9LI8Bgg==
X-Received: by 2002:ac8:7d88:0:b0:3b8:4951:57bb with SMTP id
 c8-20020ac87d88000000b003b8495157bbmr37173122qtd.5.1675638014581; 
 Sun, 05 Feb 2023 15:00:14 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 z20-20020ac87f94000000b003b9b8ec742csm6173057qtj.14.2023.02.05.15.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 15:00:13 -0800 (PST)
Date: Sun, 5 Feb 2023 18:00:12 -0500
From: Peter Xu <peterx@redhat.com>
To: Weinan Liu <liu-weinan@qq.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] KVM: dirty ring: check if vcpu is created before
 dirty_ring_reap_one
Message-ID: <Y+A0/GhNplVb5Mnj@x1n>
References: <tencent_C41A2B79E7EEC277A95730BB7B1C94EDEB06@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_C41A2B79E7EEC277A95730BB7B1C94EDEB06@qq.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Hi, Weinan,

On Sun, Feb 05, 2023 at 06:45:45AM +0000, Weinan Liu wrote:
> Failed to assert '(dirty_gfns && ring_size)' in kvm_dirty_ring_reap_one if
> the vcpu has not been finished to create yet. This bug occasionally occurs
> when I open 200+ qemu instances on my 16G 6-cores x86 machine. And it must
> be triggered if inserting a 'sleep(10)' into kvm_vcpu_thread_fn as below--
> 
>  static void *kvm_vcpu_thread_fn(void *arg)
>  {
>      CPUState *cpu = arg;
>      int r;
> 
>      rcu_register_thread();
> 
> +    sleep(10);
>      qemu_mutex_lock_iothread();
>      qemu_thread_get_self(cpu->thread);
>      cpu->thread_id = qemu_get_thread_id();
>      cpu->can_do_io = 1;
> 
> where dirty ring reaper will wakeup but then a vcpu has not been finished
> to create.
> 
> Signed-off-by: Weinan Liu <liu-weinan@qq.com>
> ---
>  accel/kvm/kvm-all.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 7e6a6076b1..0070ad72b8 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1416,6 +1416,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>           */
>          sleep(1);
>  
> +        /* ensure kvm_init_vcpu is finished, so cpu->kvm_dirty_gfns is ok */
> +        if (!phase_check(PHASE_MACHINE_READY)) {
> +            continue;
> +        }
> +

Here's an old patch for this:

https://lore.kernel.org/all/20220927154653.77296-1-peterx@redhat.com/

IMHO that one will be more straightforward and self contained than this
one.  What do you think?

When posting new patches, please also remember to copy maintainers.  For
this one, it's:

$ ./scripts/get_maintainer.pl -f accel/kvm/kvm-all.c 
Paolo Bonzini <pbonzini@redhat.com> (supporter:Overall KVM CPUs)

Thanks,

-- 
Peter Xu


