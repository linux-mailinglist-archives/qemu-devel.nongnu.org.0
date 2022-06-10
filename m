Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D563546832
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:22:35 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfWy-0001dG-Uh
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nzfUc-0000LP-6d
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nzfUY-0007mN-WA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654870801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cKDs5iOL4X/dPtT6xnr6+p+pn/CvFfT4LRn964xXIBM=;
 b=a3Gcm4UnnFQeRAzb2/FiUlnaskcGl6PjmeybB6l+frSHPmk14Sx3mi6l1CvCV4GU7HxjoG
 JOD1VbCctKYiduGtEeB515ukMxycUqTBvzqlpC5Wy9NeybrshKDk/MY5VVZ7pJx/+bDV5y
 xxkm47rwkD288zEeEmhMb9KM5HYXw0A=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-mmsQLgXCM7-eYx_wv0Zemw-1; Fri, 10 Jun 2022 10:20:00 -0400
X-MC-Unique: mmsQLgXCM7-eYx_wv0Zemw-1
Received: by mail-il1-f198.google.com with SMTP id
 g8-20020a92cda8000000b002d15f63967eso19635401ild.21
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cKDs5iOL4X/dPtT6xnr6+p+pn/CvFfT4LRn964xXIBM=;
 b=oEoGl6G/7qhDJlpWnrDdijaJZAhxlQ6YvMm8sTU7slaXEYSTsYypUs44SeR8A+dGYj
 joNUXQyb6k7hU3qmhxYOv6H5jEDW1+6mIIU8lw1cUfWwZgOHgAmzexFPPpmLqNzr8QML
 ZnaVMQJaE290RRqzT1Khs6zXN+aWeJEJ/81gwPZQcfzMNqK80ERV8Otk7G0ILSI+Thhh
 o9MNOlDSOhQ3lUlfYPNqbYtVCCxaHmRD0uDj2ZTPWUPot2fkQLh7h0nAMnWnBIoPV+zu
 FyB1nV2bVcTDlQS8rQOtLNu/2fjgH/OeetlaXbmyOrsCvIEGp/7NVrkGMmDxHCw7SV3l
 c5Tw==
X-Gm-Message-State: AOAM5333eGYaJTYwUGsHOaqPue5nwBHYn77IpbkC2cW6F6ufPQcrrWkO
 qD65ahrcya+fKv5QSqmxILaYzoGGDjp1d58u+fnXUktdPKlgFvD6sqAFV2nye4PjhUcyKnc9Tb0
 nsY3Qb9JtioNtvJM=
X-Received: by 2002:a05:6602:1654:b0:669:c4e4:156e with SMTP id
 y20-20020a056602165400b00669c4e4156emr625519iow.154.1654870799430; 
 Fri, 10 Jun 2022 07:19:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQNmaqHnpzkae9sZaamplwsyBRLkz/81C0IuErnIKMENW/VHLXHQHew8nDyfMgaWueckajkw==
X-Received: by 2002:a05:6602:1654:b0:669:c4e4:156e with SMTP id
 y20-20020a056602165400b00669c4e4156emr625498iow.154.1654870799099; 
 Fri, 10 Jun 2022 07:19:59 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a026f48000000b0032b3a781776sm10825876jae.58.2022.06.10.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 07:19:58 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:19:57 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFC 4/5] cpu: Allow cpu_synchronize_all_post_init() to
 take an errp
Message-ID: <YqNTDSV4P05pb+9l@xz-m1.local>
References: <20220607230645.53950-1-peterx@redhat.com>
 <20220607230645.53950-5-peterx@redhat.com>
 <YqDW2AZDb3buF9YQ@work-vm> <YqJf5WlSyK2o2xJg@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YqJf5WlSyK2o2xJg@xz-m1.local>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 09, 2022 at 05:02:29PM -0400, Peter Xu wrote:
> On Wed, Jun 08, 2022 at 06:05:28PM +0100, Dr. David Alan Gilbert wrote:
> > > @@ -2005,7 +2005,17 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
> > >      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
> > >       * in migration.c
> > >       */
> > > -    cpu_synchronize_all_post_init();
> > > +    cpu_synchronize_all_post_init(&local_err);
> > > +    if (local_err) {
> > > +        /*
> > > +         * TODO: a better way to do this is to tell the src that we cannot
> > > +         * run the VM here so hopefully we can keep the VM running on src
> > > +         * and immediately halt the switch-over.  But that needs work.
> > 
> > Yes, I think it is possible; unlike some of the later errors in the same
> > function, in this case we know no disks/network/etc have been touched,
> > so we should be able to recover.
> > I wonder if we can move the postcopy_state_set(POSTCOPY_INCOMING_RUNNING)
> > out of loadvm_postcopy_handle_run to after this point.
> > 
> > We've already got the return path, so we should be able to signal the
> > failure unless we're very unlucky.
> 
> Right.  It's just that for the new ACK we may need to modify the return
> path protocol for sure, because none of the existing ones can notify such
> an information.
> 
> One idea is to reuse MIG_RP_MSG_RESUME_ACK, it was only used for postcopy
> recovery before to do the final handshake with offload=1 only (which is
> defined as MIGRATION_RESUME_ACK_VALUE).  We could try to fill in the
> payload with some !1 value, to tell the source that we NACK the migration
> then src fails the migration as long as possible?
> 
> That seems to be even compatibile with one old qemu migrating to a new qemu
> scenario, because when the old qemu notices the MIG_RP_MSG_RESUME_ACK
> message with !1 payload, it'll mark the rp bad:

Oh it won't be compatible..  The clean way to do this is we need to modify
the src qemu to halt in postcopy_start() to wait for that ack before
continue.  That may need another cap/param to enable.

The thing is I'm not very sure whether this will be worth it.

Non-compatible migrations should be rare on put register failures.  For the
issue I was working on, it was actually a kernel bug that triggered it but
it's just hard to figure out where's wrong.  With properly working kernels
and matching hosts they should just not really heppen.  I'm worried adding
too much complexity could over-engineer things without much benefits.
  
In that case, I'd think it proper if we start with what this patchset
provides, which at least allows us to fail in a crystal clear way?

> 
>   if (migrate_handle_rp_resume_ack(ms, tmp32)) {
>       mark_source_rp_bad(ms);
>       goto out;
>   }
> 
>   static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
>   {
>       trace_source_return_path_thread_resume_ack(value);
>   
>       if (value != MIGRATION_RESUME_ACK_VALUE) {
>           error_report("%s: illegal resume_ack value %"PRIu32,
>                        __func__, value);
>           return -1;
>       }
>       ...
>   }
> 
> If it looks generally good, I can try with such a change in v2.
> 
> Thanks,
> 
> -- 
> Peter Xu

-- 
Peter Xu


