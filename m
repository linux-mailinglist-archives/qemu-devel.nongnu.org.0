Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20915286A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:13:41 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbTg-0001X0-S3
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqbRw-0000A5-Td
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqbRv-0002Kx-0T
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652710309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PeDz/i24vuBNodi9Nsniz+YebC590vDMgeTaJafMdPQ=;
 b=fPlvGlgZpbJsiBtT6s82JlyoSEkmIAsNloWd9MSusobITaxuY36W6s8Z1OqVYRaQtaQqZw
 lLcGsxJl+ZubUz8vCQcepKGcXaTdyGfmdwVzAHGf5A8WJMFq93y4dUxaNVraDfL2sXKerP
 VfEHGehfdrSCrFDy0uIEYccj9aVFIsU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-VXOZnQEFMwiwKol1M_9OuQ-1; Mon, 16 May 2022 10:11:48 -0400
X-MC-Unique: VXOZnQEFMwiwKol1M_9OuQ-1
Received: by mail-io1-f72.google.com with SMTP id
 m22-20020a0566022e9600b0065dd0511560so7588280iow.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PeDz/i24vuBNodi9Nsniz+YebC590vDMgeTaJafMdPQ=;
 b=qclP+oDMcRiYgX0beROfk8D5X3ShOAd1scXWiXAzwlViYazdk2PlJ9yZFD6XQSFlGh
 7sIwKHkcMdJIlCn84cIvt14TvNWF9RYn6/e1uU6mG0CDvLyTst08WacJ9iQgYBQME6GA
 I8N4W+FeyzMA65i56M3kEBQ6E/pSg1swNU+uAsqof0HNjlK1E4hs5PvmzZkY1n7H76TF
 vdzmBBm20Die7LNOKLmjPVpXZXv3kHGAxfhjix4dXhVcJZBMJDe57u6ZH9NUBzDqM+Lr
 KBzFP3ZICrfs/TsF0vNUi7CkORc20/xQWcqjeIOT6WivtaseLV6k6OmXWMA9GCGrC2CK
 9Qig==
X-Gm-Message-State: AOAM532KUi58p44MXU8n66boH2tNEZTm1rJa4YZUbFrARuE+wIbEV+mK
 hlUP9yhs5RwakTJEHNirTJM3xJuXTlh8cL7PQi7XS5ORv4NP5tB26XnGXrkMC2PuXP3Dqr+NJdO
 QrteWc80dJmuO1O8=
X-Received: by 2002:a05:6602:3c9:b0:65a:f371:a65b with SMTP id
 g9-20020a05660203c900b0065af371a65bmr7765381iov.21.1652710307813; 
 Mon, 16 May 2022 07:11:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8H8lxSRWuUB94Rxr8MEHLmmEgsJ2M6Ecdjb2owQGPcE5lSqoSEDt0aW9/kuNJbLuIaoqxCw==
X-Received: by 2002:a05:6602:3c9:b0:65a:f371:a65b with SMTP id
 g9-20020a05660203c900b0065af371a65bmr7765368iov.21.1652710307537; 
 Mon, 16 May 2022 07:11:47 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a056e02110e00b002cf846fe476sm2588469ilk.77.2022.05.16.07.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 07:11:46 -0700 (PDT)
Date: Mon, 16 May 2022 10:11:45 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 13/21] migration: Postcopy recover with preempt enabled
Message-ID: <YoJboZoJdPwWpeFe@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-14-peterx@redhat.com>
 <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Hi, Manish,

On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
> 
> On 26/04/22 5:08 am, Peter Xu wrote:
> LGTM,
> Peter, I wanted to give review-tag for this and ealier patch too. I am new
> to qemu
> review process so not sure how give review-tag, did not find any reference
> on
> google too. So if you please let me know how to do it.

It's here:

https://git.qemu.org/?p=qemu.git;a=blob;f=docs/devel/submitting-a-patch.rst;hb=HEAD#l492

Since afaict QEMU is mostly following what Linux does, you can also
reference to this one with more context:

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

But since you're still having question regarding this patch, no rush on
providing your R-bs; let's finish the discussion first.

[...]

> > +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
> > +{
> > +    trace_postcopy_pause_fast_load();
> > +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
> 
> I may have misunderstood synchronisation here but very very rare chance,
> 
> as both threads are working independently is it possible qemu_sem_post on
> 
> postcopy_pause_sem_fast_load is called by main thread even before we go
> 
> to qemu_sem_wait in next line, causing some kind of deadlock. That's should
> 
> not be possible as i understand it requires manually calling
> qmp_migration_recover
> 
> so chances are almost impossible. Just wanted to confirm it.

Sorry I don't quite get the question, could you elaborate?  E.g., when the
described deadlock happened, what is both main thread and preempt load
thread doing?  What are they waiting at?

Note: we have already released mutex before waiting on sem.

> 
> > +    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);
> 
> Just wanted to confirm why postcopy_pause_incoming is not called here
> itself.

postcopy_pause_incoming() is only used in the main ram load thread, while
this function (postcopy_pause_ram_fast_load) is only called by the preempt
load thread.

> 
> Is it based on assumption that if there is error in any of the channel it
> will
> 
> eventually be paused on source side, closing both channels, resulting
> 
> postcopy_pause_incoming will be called from main thread on destination?

Yes.

> 
> Usually it should be good to call as early as possible. It is left to main
> 
> thread default path so that we do not have any synchronisation overhead?

What's the sync overhead you mentioned? What we want to do here is simply
to put all the dest QEMU migration threads into a halted state rather than
quitting, so that they can be continued when necessary.

> 
> Also Peter, i was trying to understand postcopy recovery model so is use
> case
> 
> of qmp_migrate_pause just for debugging purpose?

Yes.  It's also a way to cleanly stop using the network (comparing to force
unplug the nic ports?) for whatever reason with a shutdown() syscall upon
the socket.  I just don't know whether there's any real use case of that in
reality.

Thanks,

-- 
Peter Xu


