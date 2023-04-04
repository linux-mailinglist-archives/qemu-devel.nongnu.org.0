Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B16D6905
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:38:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjeh-0004Vr-FG; Tue, 04 Apr 2023 12:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjjef-0004VU-Ul
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjjee-0008I1-4z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680626224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJNAJQQ9X2YChZd6JEwZ50ZSjpfkd7MSEcVmC9EKK6Q=;
 b=VE5c6KBrefmy3Td6wQwF4Bt0N0A54CfCweLhTLShqjiSFv2L94dr2v9DxRuEDEz7GJnPIZ
 0XZw5KQX8v792wfx6pPul2fxuPCjPcbZIkhLYJJ652ZWmW/Wzzg+20BoZoNkwCM2qzVoUq
 eaZZ4wjPcUvDukeapugv6bQb8eqS8Ds=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-KJ5h9sdQOEqlbXdMI8_9CA-1; Tue, 04 Apr 2023 12:37:02 -0400
X-MC-Unique: KJ5h9sdQOEqlbXdMI8_9CA-1
Received: by mail-qt1-f200.google.com with SMTP id
 s23-20020a05622a1a9700b003e6578904c3so3977281qtc.17
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680626222; x=1683218222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJNAJQQ9X2YChZd6JEwZ50ZSjpfkd7MSEcVmC9EKK6Q=;
 b=JYNZcfUYS1PXx7pbM1oU+qLLmg21rsiVESEgGKQ2QuJoxefwlajp645mm9DGD1PkHi
 7k6zT91zVK6/Bg6SBClr8MPfSx4Ur47QIY6YUY/W26xezGOcHCicILKuGYWQsamZ8YLy
 OfWcQfz8cxhtMHQpfyOGX4p/1zlgXV/FZoWtnlYo3A398rLDievXyn4Qnu5wG3//IF8u
 QnSIRilJkJcIDKVzIH4JThGorxSJ7zYT3XgvXHJBe5Ep7RYE7nGhAFIiiKjgQCNxLnnk
 FltlyIDfC5p8EtznqUWH1RiP5B/6bLpOSufTYzC8wjkt6NVgEK0V58wToZroXn/EQb60
 K5Tw==
X-Gm-Message-State: AAQBX9dVBRijCcPO5+tMH5Z4fYcWmNyUYfEid7c5qJWoG0KGXL6k47LD
 ArzWw/JXXRArmDEfqduSoTOlBmB630LI6perABQxXsvd08wU9ixUQuc9z6dwr2XFvhQgO3AU8+R
 heJOytWCo4cXdxVQ=
X-Received: by 2002:a05:622a:1984:b0:3b8:6c6e:4949 with SMTP id
 u4-20020a05622a198400b003b86c6e4949mr1085939qtc.4.1680626222027; 
 Tue, 04 Apr 2023 09:37:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZU1M4DAQ0R+jnA8lnwyEhI0qyKtpFoOo0snPbFrx5fIOLTyYOVM3FMvEyv0h3/Pw6bfJsy2w==
X-Received: by 2002:a05:622a:1984:b0:3b8:6c6e:4949 with SMTP id
 u4-20020a05622a198400b003b86c6e4949mr1085900qtc.4.1680626221713; 
 Tue, 04 Apr 2023 09:37:01 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 g66-20020a37b645000000b007486cc8a3f8sm1599289qkf.23.2023.04.04.09.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:37:01 -0700 (PDT)
Date: Tue, 4 Apr 2023 12:36:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Hyman <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
Message-ID: <ZCxSHwgRglKNglCP@x1n>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
 <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com>
 <ZCwv87m1Gs5TjGVr@x1n>
 <CABgObfZtW2YSFS-g4grBWHiuaYM1z6zsAUKm332qFtLv+uFGWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfZtW2YSFS-g4grBWHiuaYM1z6zsAUKm332qFtLv+uFGWg@mail.gmail.com>
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

On Tue, Apr 04, 2023 at 06:08:41PM +0200, Paolo Bonzini wrote:
> Il mar 4 apr 2023, 16:11 Peter Xu <peterx@redhat.com> ha scritto:
> 
> > Hi, Paolo!
> >
> > On Tue, Apr 04, 2023 at 03:32:38PM +0200, Paolo Bonzini wrote:
> > > On 2/16/23 17:18, huangy81@chinatelecom.cn wrote:
> > > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > > index 9b26582655..47483cdfa0 100644
> > > > --- a/accel/kvm/kvm-all.c
> > > > +++ b/accel/kvm/kvm-all.c
> > > > @@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState
> > *s, CPUState *cpu)
> > > >       uint32_t ring_size = s->kvm_dirty_ring_size;
> > > >       uint32_t count = 0, fetch = cpu->kvm_fetch_index;
> > > > +    /*
> > > > +     * It's possible that we race with vcpu creation code where the
> > vcpu is
> > > > +     * put onto the vcpus list but not yet initialized the dirty ring
> > > > +     * structures.  If so, skip it.
> > > > +     */
> > > > +    if (!cpu->created) {
> > > > +        return 0;
> > > > +    }
> > > > +
> > >
> > > Is there a lock that protects cpu->created?
> > >
> > > If you don't want to use a lock you need to use qatomic_load_acquire
> > > together with
> > >
> > > diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> > > index fed20ffb5dd2..15b64e7f4592 100644
> > > --- a/softmmu/cpus.c
> > > +++ b/softmmu/cpus.c
> > > @@ -525,7 +525,7 @@ void qemu_cond_timedwait_iothread(QemuCond *cond,
> > int ms)
> > >  /* signal CPU creation */
> > >  void cpu_thread_signal_created(CPUState *cpu)
> > >  {
> > > -    cpu->created = true;
> > > +    qatomic_store_release(&cpu->created, true);
> > >      qemu_cond_signal(&qemu_cpu_cond);
> > >  }
> >
> > Makes sense.
> >
> > When looking at such a possible race, I also found that when destroying the
> > vcpu we may have another relevant issue, where we flip "vcpu->created"
> > after destroying the vcpu.  IIUC it means the same issue can occur when
> > vcpu unplugged?
> >
> > Meanwhile I think the memory ordering trick won't play there, because
> > firstly to do that we'll need to update created==false:
> >
> > -    kvm_destroy_vcpu(cpu);
> >      cpu_thread_signal_destroyed(cpu);
> > +    kvm_destroy_vcpu(cpu);
> >
> > And even if we order the operations we still cannot assume the data is safe
> > to access even if created==true.
> >
> 
> Yes, this would need some kind of synchronize_rcu() before clearing
> created, and rcu_read_lock() when reading the dirty ring.
> 
> (Note that synchronize_rcu can only be used outside BQL. The alternative
> would be to defer what's after created=false using call_rcu().
> 
> Maybe we'd better need (unfortunately) a per-vcpu mutex to protect both
> > cases?
> 
> 
> If RCU can work it's obviously better, but if not then yes. It's per-CPU so
> it's only about the complexity, not the overhead.

Oh.. I just noticed that both vcpu creation and destruction will require
BQL, while right now dirty ring reaping also requires BQL (taken at all
callers of kvm_dirty_ring_reap()).. so I assume even the current patch will
be race-free already?

I'm not sure whether it's ideal, though, I think having BQL at least makes
sure there's no concurrent memory updates so the slot IDs will be solid
during the dirty ring reaping, but I can't remember the details.  However
that seems to be a separate topic to be discussed..

Thanks,

-- 
Peter Xu


