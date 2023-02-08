Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640F68FA1E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsfa-000646-Mk; Wed, 08 Feb 2023 17:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsfY-00063i-M9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsfW-0002On-OK
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894318;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VtncLkVhV3SIC8Nz+x9ocZVQvWlPQiZzKxUZvG1SMgY=;
 b=AjUYCylEdiD4q5ZCw+pkkcR+hJyNanAm9BEIbhO1do98qA0Ium1fqWFvYuQ4VpC2iC9XRU
 QpArTSR2u2hbVXDjWWrUC7zeb6BCmtrWmN1VQ+DROIexFxNV8bg/h7798RILkYj6Lw2tWc
 oL8LtfpAhqmaIMtwSB+vCI9GdP4NKxk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-s2atDO4ePwKuO4pRtaErHA-1; Wed, 08 Feb 2023 17:11:56 -0500
X-MC-Unique: s2atDO4ePwKuO4pRtaErHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020adff185000000b002c3e68f9d6fso2216661wro.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VtncLkVhV3SIC8Nz+x9ocZVQvWlPQiZzKxUZvG1SMgY=;
 b=gROmJdDhYIoYLXp/HHcgNaWET0gMAO5hCx1kFTvIElG+f2gNm1ZpCo7vA4TruvMy8y
 z7zWrdO6bUBJq4S6SkXfCMzDZh/PeSZVZgftsxjvVzaUuqbCOyqT5v6r2v6Gz3JWo7da
 LzJGU0Oc5TzkNgQzKiDTxy53QUzjE0+d8WJbPlSxSZbuIGWGUGZ0AXzyIWYpad8DSuIO
 D3uTL1jkpcn2C3Cyy7pakT8BMkUpFxb2MO3aeqE1Kj6JO+F6s5vlA0QvMTR+FZtPpS7D
 micXiYc9GptSPvJ6qo+5ck8iiID6nrlvmnXAglMK4863eJnzhK688ehRDMxEvUpVKbg3
 8f5A==
X-Gm-Message-State: AO0yUKVnyMVsf+m/y2zRCq0U7Uk0MwMykBh6tAencYhSY/+JL+ZZtKqJ
 9WqR8iDGCSbbm8ucMtNwX+axM2n0FOt3VA6KFPqNEVvH6S3P3w048i2O0LSIXLyE/eDIkVp5g1b
 1v9UBJAroFADaJM8=
X-Received: by 2002:a05:600c:511e:b0:3df:9858:c038 with SMTP id
 o30-20020a05600c511e00b003df9858c038mr3550017wms.13.1675894315484; 
 Wed, 08 Feb 2023 14:11:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9SB59kBTl2gxSWhtr8cERRDQwq5rZHtmGVOG4cLxL5L57qLbsN6pEpENaO95p9xBSZB5SfaA==
X-Received: by 2002:a05:600c:511e:b0:3df:9858:c038 with SMTP id
 o30-20020a05600c511e00b003df9858c038mr3549994wms.13.1675894315173; 
 Wed, 08 Feb 2023 14:11:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b9-20020adfe649000000b002c408c96f3fsm124619wrn.84.2023.02.08.14.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:11:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 6/8] kvm: Add helper kvm_dirty_ring_init()
In-Reply-To: <20230206112010.99871-7-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:08 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-7-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:11:53 +0100
Message-ID: <87bkm39592.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gavin Shan <gshan@redhat.com> wrote:
> Due to multiple capabilities associated with the dirty ring for different
> architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
> arm64 separately. There will be more to be done in order to support the
> dirty ring for arm64.
>
> Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
> the code looks a bit clean.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 73 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 46 insertions(+), 27 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9ec117c441..399ef0f7e6 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1476,6 +1476,49 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
>      return 0;
>  }
>  
> +static int kvm_dirty_ring_init(KVMState *s)
> +{
> +    uint64_t ring_bytes;
> +    int ret;
> +
> +    /*
> +     * Read the max supported pages. Fall back to dirty logging mode
> +     * if the dirty ring isn't supported.
> +     */
> +    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
> +    if (ret <= 0) {
> +        warn_report("KVM dirty ring not available, using bitmap method");
> +        s->kvm_dirty_ring_size = 0;
> +        return 0;
> +    }
> +
> +    ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
> +    if (ring_bytes > ret) {
> +        error_report("KVM dirty ring size %" PRIu32 " too big "
> +                     "(maximum is %ld).  Please use a smaller value.",
> +                     s->kvm_dirty_ring_size,
> +                     (long)ret / sizeof(struct kvm_dirty_gfn));
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
> +    if (ret) {
> +        error_report("Enabling of KVM dirty ring failed: %s. "
> +                     "Suggested minimum value is 1024.", strerror(-ret));
> +        ret = -EIO;
> +    }
> +
> +out:
> +    if (ret) {
> +        s->kvm_dirty_ring_size = 0;
> +    } else {
> +        s->kvm_dirty_ring_bytes = ring_bytes;
> +    }
> +
> +    return ret;
> +}

If you split it, you don't need the goto.

static int kvm_dirty_ring_init(KVMState *s)
{
    s->kvm_dirty_ring_size = 0;
    /*
     * Read the max supported pages. Fall back to dirty logging mode
     * if the dirty ring isn't supported.
     */
    int ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
    if (ret <= 0) {
        warn_report("KVM dirty ring not available, using bitmap method");
        return 0;
    }

    uint64_t ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
    if (ring_bytes > ret) {
        error_report("KVM dirty ring size %" PRIu32 " too big "
                     "(maximum is %ld).  Please use a smaller value.",
                     s->kvm_dirty_ring_size,
                     (long)ret / sizeof(struct kvm_dirty_gfn));
        return -EINVAL;
    }

    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
    if (ret) {
        error_report("Enabling of KVM dirty ring failed: %s. "
                     "Suggested minimum value is 1024.", strerror(-ret));
        return -EIO;
    }

    s->kvm_dirty_ring_bytes = ring_bytes;
    return ret;
}



> +
>  static void kvm_region_add(MemoryListener *listener,
>                             MemoryRegionSection *section)
>  {
> @@ -2545,33 +2588,9 @@ static int kvm_init(MachineState *ms)
>       * dirty logging mode
>       */
>      if (s->kvm_dirty_ring_size > 0) {
> -        uint64_t ring_bytes;
> -
> -        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
> -
> -        /* Read the max supported pages */
> -        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
> -        if (ret > 0) {
> -            if (ring_bytes > ret) {
> -                error_report("KVM dirty ring size %" PRIu32 " too big "
> -                             "(maximum is %ld).  Please use a smaller value.",
> -                             s->kvm_dirty_ring_size,
> -                             (long)ret / sizeof(struct kvm_dirty_gfn));
> -                ret = -EINVAL;
> -                goto err;
> -            }
> -
> -            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
> -            if (ret) {
> -                error_report("Enabling of KVM dirty ring failed: %s. "
> -                             "Suggested minimum value is 1024.", strerror(-ret));
> -                goto err;
> -            }
> -
> -            s->kvm_dirty_ring_bytes = ring_bytes;
> -         } else {
> -             warn_report("KVM dirty ring not available, using bitmap method");
> -             s->kvm_dirty_ring_size = 0;
> +        ret = kvm_dirty_ring_init(s);
> +        if (ret < 0) {
> +            goto err;
>          }
>      }


