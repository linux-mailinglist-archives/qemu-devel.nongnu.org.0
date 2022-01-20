Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA03494BCC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:33:41 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUlA-00006t-8V
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAThq-000328-69
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAThj-00018k-My
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642670762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqZz85/IG7BHRltCLdVSx/dKoI5gjGnj3xzkewfCCn4=;
 b=G2qvSbQlkTeoyIaurimCG91WpJC/6U4sESS5pRD/XFTJY8L3aL+whqjH3A48cy/DfhGoHZ
 aLsj/jZKV/FAgHiNeHCKrp4riivZ+7PPig3qDoperH0277Znxd8Q2eN+F4fV9D5/SswNyC
 vhQi+GMQhRKzTk8aAZxu+BZG2xDGgZU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-68NoQUznNFOgTKWw4ohSBQ-1; Thu, 20 Jan 2022 04:26:01 -0500
X-MC-Unique: 68NoQUznNFOgTKWw4ohSBQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 i8-20020a17090a718800b001b35ee7ac29so3713603pjk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 01:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QqZz85/IG7BHRltCLdVSx/dKoI5gjGnj3xzkewfCCn4=;
 b=kZCPKURSP5q0fjdHDeO4wtb8pTkK2Kab3e6JtAjJD6oH57a572wEamnOZcxFW1nZ76
 NYpo0OT/mqOLxna7Ktw7GuydfYG6EAxiONm4fqv/xGWwCXLCUkPPgwvDJAPuPN1dOrhk
 Qj3G3gwROA0QbPwRe+PKT3T0NCzVvhqkJtw0A+aW0BY70gbTShcnMblomLriAisNjRKQ
 M5k2/LDgNEmyibNdOq8gcYQZyImHRiOHj0BHXLiUa+UmOED6990w6vR/cNpq9Er5TMYa
 f/SdBn5memiQA9uDQ6N+G9Zj4wVINhGJU7RqDKLKe7xBJQ2NOTZwlrb8U7sQGhpIF6YW
 MMyg==
X-Gm-Message-State: AOAM530ExHDAy3QlZrsk2nGI91RGRc9c66tEhNcXHzE293lgjes+v2rZ
 RGi2wEGum4tDya37aE48WacJ4nhXVwC5UciT1V8AjNhVJGVnjW/z0m/U/UEbKDAge1JDjb0Nju5
 RMlhjvNckTl5SJUo=
X-Received: by 2002:a05:6a00:a90:b0:4bd:320a:d579 with SMTP id
 b16-20020a056a000a9000b004bd320ad579mr35168204pfl.47.1642670760138; 
 Thu, 20 Jan 2022 01:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxig0Mcnxwg+qZc0ttv9Su4NJvzShyvmorlnhAqwMxEN3vT2Jr6Z5R45gXYeX+tlYvRH/U7Vg==
X-Received: by 2002:a05:6a00:a90:b0:4bd:320a:d579 with SMTP id
 b16-20020a056a000a9000b004bd320ad579mr35168173pfl.47.1642670759724; 
 Thu, 20 Jan 2022 01:25:59 -0800 (PST)
Received: from xz-m1.local ([94.177.118.145])
 by smtp.gmail.com with ESMTPSA id em22sm1964640pjb.23.2022.01.20.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:25:59 -0800 (PST)
Date: Thu, 20 Jan 2022 17:25:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <Yekqn90HOtFMWupM@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 04:26:09PM +0800, Hyman Huang wrote:
> Hi，Peter. I'm working on this problem and found the reason is kind of the
> same as i metioned in cover letter of v10, the following is what i posted:
> 
>   2. The new implementaion of throttle algo enlightened by Peter
>      responds faster and consume less cpu resource than the older,
>      we make a impressed progress.
> 
>      And there is a viewpoint may be discussed, it is that the new
>      throttle logic is "passive", vcpu sleeps only after dirty ring,
>      is full, unlike the "auto-converge" which will kick vcpu instead
>      in a fixed slice time. If the vcpu is memory-write intensive
>      and the ring size is large, it will produce dirty memory during
>      the dirty ring full time and the throttle works not so good, it
>      means the throttle depends on the dirty ring size.
> 
>      I actually tested the new algo in two case:
> 
>      case 1: dirty-ring-size: 4096, dirtyrate: 1170MB/s
>      result: minimum quota dirtyrate is 25MB/s or even less
>              minimum vcpu util is 6%
> 
>      case 2: dirty-ring-size: 65536, dirtyrate: 1170MB/s
>      result: minimum quota dirtyrate is 256MB/s
>              minimum vcpu util is 24%
> 
>      I post this just for discussion, i think this is not a big deal
>      beacase if we set the dirty-ring-size to the maximum value(65536),
>      we assume the server's bandwidth is capable of handling it.

My memory is that I tested your v10 (which has this wait-at-ring-full logic)
already and at that time it worked well.

It's possible that I just got lucky with v10, so that can happen with some
random conditions and so far we still don't know how to hit it.

However..

> 
> Currently, Qemu handle the vcpu KVM_EXIT_DIRTY_RING_FULL exit as the
> following:
> 
> 1. If one of the dirty-ring on a vcpu is full, vcpu thread returns to user
> space and qemu handle it.
> 
> 2. Qemu get the kvm_slots_lock and reap dirty-ring of all vcpus once for all
> by calling kvm_dirty_ring_reap, fill the dirty page bitmap of slot and reset
> dirty ring. Release the kvm_slots_lock finally.
> 
> The logic *reap and reset dirty ring of all vcpu after one vcpu's dirty ring
> is full* works fine and efficiently.
> 
> But this is not what dirtylimit want becasue some of the vcpu may loss
> chance to sleep and could not be throttled, though vcpu's dirty ring was
> full.
> 
> The latest test environment of you used a larger guest(20G, 40 cores),
> increasing the chances of missing sleep for vcpus and the throttle works not
> good as before.
> 
> I try a simple modification make the throttle works better as before:
> 
> +static void kvm_dirty_ring_reset_one(KVMState *s, CPUState *cpu)
> +{
> +    int ret;
> +    uint64_t total = 0;
> +
> +    kvm_slots_lock();
> +    total = kvm_dirty_ring_reap_one(s, cpu);
> +
> +    if (total) {
> +        ret = kvm_vm_ioctl(s, KVM_RESET_DIRTY_RINGS);
> +        assert(ret == total);
> +    }
> +
> +    kvm_slots_unlock();
> +}
> +
>  static void do_kvm_cpu_synchronize_kick(CPUState *cpu, run_on_cpu_data arg)
>  {
>      /* No need to do anything */
> @@ -2309,6 +2327,11 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
> 
>  static int kvm_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -2955,9 +2978,8 @@ int kvm_cpu_exec(CPUState *cpu)
>               * still full.  Got kicked by KVM_RESET_DIRTY_RINGS.
>               */
>              trace_kvm_dirty_ring_full(cpu->cpu_index);
> -            qemu_mutex_lock_iothread();
> -            kvm_dirty_ring_reap(kvm_state);
> -            qemu_mutex_unlock_iothread();
> +            kvm_dirty_ring_reset_one(kvm_state, cpu);
> +            dirtylimit_vcpu_execute(cpu);
>              ret = 0;
>              break;
>          case KVM_EXIT_SYSTEM_EVENT:
> 
> I drop the BQL to reduce the overhead of KVM_EXIT_DIRTY_RING_FULL exit
> handle. May be kvm_state could be protected by BQL, but i wonder if there
> can be a finer granularity lock.
> 
> How about this?

... I think what you explained makes sense to me.

Note that there's also the reaper thread running in the background that can
reap all the cores too.

It only runs once per second so it shouldn't bring a lot of differences, but
I'm also wondering whether we should also turn that temporarily off too when
dirtylimit is enabled - we can simply let it keep sleeping if dirtylimit is in
service.

Dropping BQL may not be safe, as it serializes the reaping with other possible
kvm memslot updates.  I don't know whether it's a must in the future to use BQL
for reaping the rings, but so far I'd say we can still stick with it.

Note that even if you don't take BQL you'll still need the slots_lock and so
far that's also global, so I don't see how it can help on vcpu concurrency
anyway even if we dropped one of them.

If to do this, could you not introduce kvm_dirty_ring_reset_one() but just let
it take one more CPUState* parameter?  Most of the codes you added should be
similar to kvm_dirty_ring_reap_locked(), and I wanted to keep the trace point
there (trace_kvm_dirty_ring_reap, though that needs another parameter too).

And that patch can be done on top of this patch, so it can be reviewed easier
outside of dirtylimit details.

Thanks,

-- 
Peter Xu


