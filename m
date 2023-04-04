Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968036D64D7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNW-0002RZ-VZ; Tue, 04 Apr 2023 10:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjhNT-0002RA-JT
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjhNS-0001Ql-3e
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680617473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HphMZYeMqSKjRWmBr3igtf7gd+FvuLXWtMKO431yyCI=;
 b=fyDYxxcTKZomKDlVUjKAQ1I4vR7QA4jdL/KE/u+cLpmePsW+AAmgHkU8IV1WK/0p9gGYGA
 i1jxIsH9eZbcbfHsC37/d1Iv1VjxScgrcnrlUFt3u7mvzv6MYp1Dbxg0x33Xf4VKzElGam
 oFZ8CcU0/GB9dnoUIZkmaLeuzvJZLd4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Hyol0QFKPiCessVmXxY8vw-1; Tue, 04 Apr 2023 10:11:11 -0400
X-MC-Unique: Hyol0QFKPiCessVmXxY8vw-1
Received: by mail-qt1-f200.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so22094472qtj.14
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HphMZYeMqSKjRWmBr3igtf7gd+FvuLXWtMKO431yyCI=;
 b=nR3TaTaThDy5kBMSef6CLcxfz8LinB/AXEiYKr3kVsyB00jdJeGfSBurrufygpFj7w
 tfU5UEO6XNC61d3g+bLD8WqWaqUZBtB1VFP9M3jVFqzE3HX22fBWkPnmECxf4+xsHbmA
 GcMM6sCNRmNnkBKz3kyn1FUPLbbucHxg7Od6WR4Cx8Exhz1RdVrrO5bQyt1FhXt2N5Md
 V4jfi4/L8N0YUiMRYmN3Hzx5f9vrjtxrSqAAq5jvUiVYt6Nmpkb9o0mWT/2q4EnuRrxE
 0p9b5AG75/G/ldMJb41GsMDLRmAbgWmUoG4F8bnN1x8qhEpMiKcR5XjsXWNFU0q+7ZgT
 ajbw==
X-Gm-Message-State: AAQBX9fxi7zl/1EHIoWCZX2SN5B3TKcZWNpNCtuhGAvbJZojaOuZeLXg
 Z05r592AiJAdEvbrgG2rh6uDdAM0Vlez+R5KjahL9H22fzKUIsbTQBMTygoRSeQudeGSjyFov55
 jJ3SGshUb+qu01mg=
X-Received: by 2002:a05:6214:509e:b0:532:141d:3750 with SMTP id
 kk30-20020a056214509e00b00532141d3750mr3566883qvb.2.1680617469946; 
 Tue, 04 Apr 2023 07:11:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnIBlpyXGtrHCIURwft9KwP5pzK2TRkyQ++zMAtV1DvqENmMldQNZVtb9xSlh9w72CVMYmQQ==
X-Received: by 2002:a05:6214:509e:b0:532:141d:3750 with SMTP id
 kk30-20020a056214509e00b00532141d3750mr3566832qvb.2.1680617469518; 
 Tue, 04 Apr 2023 07:11:09 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 r17-20020ac85211000000b003e37e0a3d89sm3268482qtn.42.2023.04.04.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:11:08 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:10:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
Message-ID: <ZCwv87m1Gs5TjGVr@x1n>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
 <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Hi, Paolo!

On Tue, Apr 04, 2023 at 03:32:38PM +0200, Paolo Bonzini wrote:
> On 2/16/23 17:18, huangy81@chinatelecom.cn wrote:
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 9b26582655..47483cdfa0 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
> >       uint32_t ring_size = s->kvm_dirty_ring_size;
> >       uint32_t count = 0, fetch = cpu->kvm_fetch_index;
> > +    /*
> > +     * It's possible that we race with vcpu creation code where the vcpu is
> > +     * put onto the vcpus list but not yet initialized the dirty ring
> > +     * structures.  If so, skip it.
> > +     */
> > +    if (!cpu->created) {
> > +        return 0;
> > +    }
> > +
> 
> Is there a lock that protects cpu->created?
> 
> If you don't want to use a lock you need to use qatomic_load_acquire
> together with
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index fed20ffb5dd2..15b64e7f4592 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -525,7 +525,7 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
>  /* signal CPU creation */
>  void cpu_thread_signal_created(CPUState *cpu)
>  {
> -    cpu->created = true;
> +    qatomic_store_release(&cpu->created, true);
>      qemu_cond_signal(&qemu_cpu_cond);
>  }

Makes sense.

When looking at such a possible race, I also found that when destroying the
vcpu we may have another relevant issue, where we flip "vcpu->created"
after destroying the vcpu.  IIUC it means the same issue can occur when
vcpu unplugged?

Meanwhile I think the memory ordering trick won't play there, because
firstly to do that we'll need to update created==false:

-    kvm_destroy_vcpu(cpu);
     cpu_thread_signal_destroyed(cpu);
+    kvm_destroy_vcpu(cpu);

And even if we order the operations we still cannot assume the data is safe
to access even if created==true.

Maybe we'd better need (unfortunately) a per-vcpu mutex to protect both
cases?

Thanks,

-- 
Peter Xu


