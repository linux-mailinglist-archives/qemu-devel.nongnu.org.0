Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C78681E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcz7-0003b4-6Z; Mon, 30 Jan 2023 17:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMcyv-0003XB-Q0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMcyt-00019m-SS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675119030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CaQ4NsvzTG+F9uKFidI0wp1ovvgOq0J88OgpthQ+xW0=;
 b=BVVXOHe9U7X5YnMT9Bc9XEGd/lCtoZHI1rwvm1OD2O4MHmxta7kqhDiQlGB2J9JhjX4ZdO
 PNYDWrwuzTKzOYHEcZ7bRf68/GX5YTmCL/Kc8zSjva9yvIwU/dHIFx85PndtKRk0/GVDRh
 yBwhtJy6gvmcSYZ3dPnW3G3tMX+gNlw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-MWXJ8DKXN6uAKSF4RBH2Bw-1; Mon, 30 Jan 2023 17:50:29 -0500
X-MC-Unique: MWXJ8DKXN6uAKSF4RBH2Bw-1
Received: by mail-qk1-f198.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so7944140qki.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaQ4NsvzTG+F9uKFidI0wp1ovvgOq0J88OgpthQ+xW0=;
 b=cAzUJpKURjX2DaaHSika7dnQgYV/QWQZnhwPPHRNAF4AYmNbvwKWn9gS8JYmoYEjFn
 J86ByrFrkZb7jZbMFgHg4eDV5Boj8Psq2Xca1ziohwfpUbux9KF+9XmWkZO0EKVQMDEt
 J5YsBOoT8KDi73LN2/yp/Lc9Ykuyb9fkll0PoNYxuY7U0ziI62RlihearqSZUE52XNuX
 TAfxwaL/tUPWc5ScyYBS6ISn9Nux3qOOENkQ9XNBlyE/MR03HjsHekpuAsNU8SdSQcjx
 syMosENXocaD66T4/ehXuR17HQcY51KfnnJSZQsbKfvfPVzXTCube0TtqQpS2ij9M2ke
 idWg==
X-Gm-Message-State: AFqh2krV7xCgJZbxQt+3UNQhgpSLwn9Lg+ZZW4M5GNpJ9AnWKgfQ5FMc
 nAD5JpYl281fxFi4csT2eZYI5QCI+RJMCwAakIZ+JbN0Z8avUAX/5Dt38eHedCa2M2Tqx9vKD0S
 hUYybeM7UWsMop64=
X-Received: by 2002:a05:622a:1b1e:b0:3b5:87db:f979 with SMTP id
 bb30-20020a05622a1b1e00b003b587dbf979mr18357615qtb.5.1675119028755; 
 Mon, 30 Jan 2023 14:50:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXto9MkX58mYuCcBPdte9Op51Lr3rRYXAwFjBnZXezg+obVqqC7SnCO9JJurfRGI5xRbSMCHaA==
X-Received: by 2002:a05:622a:1b1e:b0:3b5:87db:f979 with SMTP id
 bb30-20020a05622a1b1e00b003b587dbf979mr18357602qtb.5.1675119028454; 
 Mon, 30 Jan 2023 14:50:28 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 z13-20020ac86b8d000000b003995f6513b9sm8780537qts.95.2023.01.30.14.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 14:50:27 -0800 (PST)
Date: Mon, 30 Jan 2023 17:50:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 15/21] migration: Teach qemu about minor faults and
 doublemap
Message-ID: <Y9hJshP8p9S0FaZF@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-16-peterx@redhat.com>
 <87k014pocv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k014pocv.fsf@secure.mitica>
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

On Mon, Jan 30, 2023 at 06:45:20AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > When a ramblock is backed by hugetlbfs and the user specified using
> > double-map feature, we trap the faults on these regions using minor mode.
> > Teach QEMU about that.
> >
> > Add some sanity check on the fault flags when receiving a uffd message.
> > For minor fault trapped ranges, we should always see the MINOR flag set,
> > while when using generic missing faults we should never see it.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> 
> 
> > -    if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_COPY))) {
> 
> Does qemu have a macro to do this bitmap handling?

Not yet that's suitable.  It's open coded like this in many places of
postcopy.  One thing close enough is bitmap_test_and_clear() but too heavy.

> 
> >  {
> >      MigrationIncomingState *mis = opaque;
> >      struct uffd_msg msg;
> > +    uint64_t address;
> >      int ret;
> >      size_t index;
> >      RAMBlock *rb = NULL;
> > @@ -945,6 +980,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
> >      }
> >  
> >      while (true) {
> > +        bool use_minor_fault, minor_flag;
> 
> I think that something on the lines of:
>            bool src_minor_fault, dst_minor_fault;
> 
> will make things simpler.  Reviewing, I have to go back to definition
> place to know which is which.

These two values represents "what we expect" and "what we got from the
message", so the only thing is I'm not sure whether src/dst matches the
best here.

How about "expect_minor_fault" and "has_minor_fault" instead?

> 
> >          ram_addr_t rb_offset;
> >          int poll_result;
> >  
> > @@ -1022,22 +1058,37 @@ static void *postcopy_ram_fault_thread(void *opaque)
> >                  break;
> >              }
> >  
> > -            rb_offset = ROUND_DOWN(rb_offset, migration_ram_pagesize(rb));
> > -            trace_postcopy_ram_fault_thread_request(msg.arg.pagefault.address,
> > -                                                qemu_ram_get_idstr(rb),
> > -                                                rb_offset,
> > -                                                msg.arg.pagefault.feat.ptid);
> > -            mark_postcopy_blocktime_begin(
> > -                    (uintptr_t)(msg.arg.pagefault.address),
> > -                                msg.arg.pagefault.feat.ptid, rb);
> > +            address = ROUND_DOWN(msg.arg.pagefault.address,
> > +                                 migration_ram_pagesize(rb));
> > +            use_minor_fault = postcopy_use_minor_fault(rb);
> > +            minor_flag = !!(msg.arg.pagefault.flags &
> > +                            UFFD_PAGEFAULT_FLAG_MINOR);
> >  
> > +            /*
> > +             * Do sanity check on the message flags to make sure this is
> > +             * the one we expect to receive.  When using minor fault on
> > +             * this ramblock, it should _always_ be set; when not using
> > +             * minor fault, it should _never_ be set.
> > +             */
> > +            if (use_minor_fault ^ minor_flag) {
> > +                error_report("%s: Unexpected page fault flags (0x%"PRIx64") "
> > +                             "for address 0x%"PRIx64" (mode=%s)", __func__,
> > +                             (uint64_t)msg.arg.pagefault.flags,
> > +                             (uint64_t)msg.arg.pagefault.address,
> > +                             use_minor_fault ? "MINOR" : "MISSING");
> > +            }
> > +
> > +            trace_postcopy_ram_fault_thread_request(
> > +                address, qemu_ram_get_idstr(rb), rb_offset,
> > +                msg.arg.pagefault.feat.ptid);
> > +            mark_postcopy_blocktime_begin(
> > +                    (uintptr_t)(address), msg.arg.pagefault.feat.ptid, rb);
> >  retry:
> >              /*
> >               * Send the request to the source - we want to request one
> >               * of our host page sizes (which is >= TPS)
> >               */
> > -            ret = postcopy_request_page(mis, rb, rb_offset,
> > -                                        msg.arg.pagefault.address);
> > +            ret = postcopy_request_page(mis, rb, rb_offset, address);
> 
> This is the only change that I find 'problematic'.
> On old code, rb_offset has been ROUND_DOWN, on new code it is not.
> On old code we pass msg.arg.pagefault.address, now we use
> ROUND_DOW(msg.arg.pagefault.address, mighration_ram_pagesize(rb)).

Thanks for spotting such a detail even for a RFC series. :)

It's actually rounded down to target psize, here since we're in postcopy we
should require target psize equals to host psize (or I bet it won't really
work at all).  So the relevant rounddown was actually done here:

            rb = qemu_ram_block_from_host(
                     (void *)(uintptr_t)msg.arg.pagefault.address,
                     true, &rb_offset);

In which there's:

    *offset = (host - block->host);
    if (round_offset) {
        *offset &= TARGET_PAGE_MASK;
    }

So when I rework that chunk of code I directly dropped the ROUND_DOWN()
because I find it duplicated.

> 
> >              if (ret) {
> >                  /* May be network failure, try to wait for recovery */
> >                  postcopy_pause_fault_thread(mis);
> > @@ -1694,3 +1745,13 @@ void *postcopy_preempt_thread(void *opaque)
> >  
> >      return NULL;
> >  }
> > +
> > +/*
> > + * Whether we should use MINOR fault to trap page faults?  It will be used
> > + * when doublemap is enabled on hugetlbfs.  The default value will be
> > + * false, which means we'll keep using the legacy MISSING faults.
> > + */
> > +bool postcopy_use_minor_fault(RAMBlock *rb)
> > +{
> > +    return migrate_hugetlb_doublemap() && qemu_ram_is_hugetlb(rb);
> > +}
> 
> Are you planing using this function outside postocpy-ram.c?  Otherwise
> if you move up its definition you can make it static and drop the header
> change.

Yes, it'll be further used in ram.c later in the patch "migration: Rework
ram discard logic for hugetlb double-map" right below.

Thanks,

-- 
Peter Xu


