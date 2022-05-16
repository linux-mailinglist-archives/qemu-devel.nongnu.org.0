Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880D528A3D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:25:36 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdXL-0001Mf-Hz
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqd7Y-0005cr-59
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqd7T-0003c0-8S
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mD/DZXYbG4B/XZHdQifGl2bOM9SmSG0BoouHcPU5Wv8=;
 b=fJ4WXIRGeQGak5tNC1Xvw+FKX/uNkPDuvR6zR2Oh6f5dPyoo6A7Fxm17fl7lKoa+I/CSBp
 yin+csCdMIgWQWlgm4qaYh/H9ewdHJiLcgZFol/NgG1/WE7QNZyiNYMeWu4vJrA0JhZlRf
 KBwmHX6DE8NMj+NMIlBSR6OHLIhlBAQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-EUbpmaaQNEyabkb1UIA-JA-1; Mon, 16 May 2022 11:58:49 -0400
X-MC-Unique: EUbpmaaQNEyabkb1UIA-JA-1
Received: by mail-il1-f197.google.com with SMTP id
 h13-20020a056e021b8d00b002d128cb1b7dso1160675ili.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mD/DZXYbG4B/XZHdQifGl2bOM9SmSG0BoouHcPU5Wv8=;
 b=8IzD31hhWKqiAf7uNHmdRjjhlE2rA3Zi+UceXblsshyhvo479SaWlTzsSe9fQX+gV6
 comHAEdfNat1B+VAS4nyniuSPWydlf4BfYJbuWlQ09jACQe8q6bzNnAXCvgKeH9vfFvp
 ftOu6XEHGY8bbUyXG/PfTogefgMrucGOPs8gh2Z4hl4oKTPFTbHbI5G7W4qxqB5qHvF1
 Khl4CUWpZYuyIVRdGIX2XoG4xDeLqLZs0kn3Gdsg9Wu/ekG1L2KsX30N+SnvM3FLWaO4
 GWTZ2oMLRbyO5KXnhTEhCGAz4XlwZ38nr0aRPPQUjUDnAN0qCKYMFxVjNuZlsTtZiIjY
 s7Lw==
X-Gm-Message-State: AOAM5300h82+nyLWSbo3dYmXf0Qb6V/IfaCGNSQ5hfLm252LSf2n5e61
 zD4sdDKbeksVXN5n7vAb0qYDoasaCFVBqY1a+FKycKCOf69wr1WCnLDHHS1FO7l92OIQbVAEp0F
 23NFRuj7MK0JAHWI=
X-Received: by 2002:a05:6e02:1a44:b0:2cf:d085:949a with SMTP id
 u4-20020a056e021a4400b002cfd085949amr9525365ilv.131.1652716728413; 
 Mon, 16 May 2022 08:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1xxzrcvGY1f0sNKo496sRtpv7oeU9QgIe+MSbS0TK38GoO6eeiJMynyvlyhdi+QF+eF+f6w==
X-Received: by 2002:a05:6e02:1a44:b0:2cf:d085:949a with SMTP id
 u4-20020a056e021a4400b002cfd085949amr9525347ilv.131.1652716728102; 
 Mon, 16 May 2022 08:58:48 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a02cc97000000b0032b7884915asm2910092jap.175.2022.05.16.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:58:47 -0700 (PDT)
Date: Mon, 16 May 2022 11:58:45 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 13/21] migration: Postcopy recover with preempt enabled
Message-ID: <YoJ0tQ/o9soa3NiF@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-14-peterx@redhat.com>
 <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
 <YoJboZoJdPwWpeFe@xz-m1.local>
 <85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 08:21:23PM +0530, manish.mishra wrote:
> 
> On 16/05/22 7:41 pm, Peter Xu wrote:
> > Hi, Manish,
> > 
> > On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
> > > On 26/04/22 5:08 am, Peter Xu wrote:
> > > LGTM,
> > > Peter, I wanted to give review-tag for this and ealier patch too. I am new
> > > to qemu
> > > review process so not sure how give review-tag, did not find any reference
> > > on
> > > google too. So if you please let me know how to do it.
> > It's here:
> > 
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&e=
> > 
> > Since afaict QEMU is mostly following what Linux does, you can also
> > reference to this one with more context:
> > 
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&e=
> > 
> > But since you're still having question regarding this patch, no rush on
> > providing your R-bs; let's finish the discussion first.
> > 
> > [...]
> > 
> > > > +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
> > > > +{
> > > > +    trace_postcopy_pause_fast_load();
> > > > +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
> > > I may have misunderstood synchronisation here but very very rare chance,
> > > 
> > > as both threads are working independently is it possible qemu_sem_post on
> > > 
> > > postcopy_pause_sem_fast_load is called by main thread even before we go
> > > 
> > > to qemu_sem_wait in next line, causing some kind of deadlock. That's should
> > > 
> > > not be possible as i understand it requires manually calling
> > > qmp_migration_recover
> > > 
> > > so chances are almost impossible. Just wanted to confirm it.
> > Sorry I don't quite get the question, could you elaborate?  E.g., when the
> > described deadlock happened, what is both main thread and preempt load
> > thread doing?  What are they waiting at?
> > 
> > Note: we have already released mutex before waiting on sem.
> 
> What i meant here is deadlock could be due the reason that we infinately wait
> 
> on qemu_sem_wait(&mis->postcopy_pause_sem_fast_load), because main
> 
> thread already called post on postcopy_pause_sem_fast_load after recovery
> 
> even before we moved to qemu_sem_wait(&mis->postcopy_pause_sem_fast_load)
> 
> in next line. Basically if we miss a post on postcopy_pause_sem_fast_load.
> 
> This is nearly impossibily case becuase it requires full recovery path to be completed
> 
> before this thread executes just next line. Also as recovery needs to be called manually,
> 
> So please ignore this.

Yes the migration state has a dependency.

The other more obvious reason it won't happen is that sem is number based
and it remembers.  Please try below:

    sem_t *sem = sem_open("test", O_CREAT);
    sem_post(sem);
    sem_wait(sem);

And sem_wait() will return immediately because post() already set it to 1.

> 
> Basically i wanted to check if we should use something like
> 
> int pthread_cond_wait(pthread_cond_t *restrict cond,
>                    pthread_mutex_t *restrict mutex);
> 
> so that there is no race between releasing mutex and calling wait.

Yes I think condvar should also work here but it should be stricter.

Thanks,

-- 
Peter Xu


