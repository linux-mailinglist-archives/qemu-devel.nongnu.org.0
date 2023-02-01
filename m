Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816F686E6F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:55:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIGb-000433-1o; Wed, 01 Feb 2023 13:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIGZ-0003zx-79
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIGX-0003dc-KJ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675277729;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rDyH3sRfqXzBimm65gbBpe6BrVhCDeN4WXcGGWhdGiA=;
 b=evb9M2eg7sJoyVuThQ6lDXPIjFZT9SQ09Yg78j59qbHB3UtGMr+4Mglm7L+3JwonDB6Ue9
 Dtf2jHsTfH9k4Xzw44lGzHZLCp4dXYR+HDqgXbSYN6f2OdmaLi+sE2xneziOrBQ20nWyT+
 /2g5gGG6nUrPIUsNYSrqkfUTuEeGID8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-enefEokWPO-_BsArRarV4Q-1; Wed, 01 Feb 2023 13:55:27 -0500
X-MC-Unique: enefEokWPO-_BsArRarV4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso1421582wmb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDyH3sRfqXzBimm65gbBpe6BrVhCDeN4WXcGGWhdGiA=;
 b=xs0OIWHwADP3wF1qOqfUJJLNDk26Ix3bpET9SmwFRaF58+8bIJ++Ou9J+MWFtuUlOp
 eL0j/21f4pNGgGCSmbHkdKvreXV7ggQ9gtt4KD8Fur868SMpXZDwm7+hasFDGULwRD/z
 a89TKE3wAyKlEJE5wOVO6PaUKSI7ZPMTbanQj9GxbVlbZGBlR/JwF4irAp7oKw6PpB9S
 0JJ7DU+WQhqBy8IZUpzZGCOcDx0SWF81sh/CACTidlgxowgqhFZLsYZo8OaaEUEN2LKV
 QfpAZjPx+pa1pKOefAyZyvfHxpjtnDnby/m4qkR+5P2GEBfPmi45EArg4YLWDAPGG9cG
 7aDw==
X-Gm-Message-State: AO0yUKWskoTwoiVRp074/ed+dwVrOMYYtWL/eLpy2gwTQuvRwzNC2GON
 uL47I2Ks+PbgvUD8Ul4c80rv0Ko7vLsYA56tOxYu/nDJbf9ddy+isuPClzUmJkzvkT0wPPh6qMo
 OXfIX0Dn5nC+lc/Y=
X-Received: by 2002:a05:600c:4f41:b0:3dc:53da:329b with SMTP id
 m1-20020a05600c4f4100b003dc53da329bmr3056247wmq.17.1675277726744; 
 Wed, 01 Feb 2023 10:55:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+9e1HryMjDxZVIjryJjdC3fUCR/q9fFiysoxa7FVBHh4TkucYXY25QCrBJFOjvyqcvGTaB+A==
X-Received: by 2002:a05:600c:4f41:b0:3dc:53da:329b with SMTP id
 m1-20020a05600c4f4100b003dc53da329bmr3056235wmq.17.1675277726547; 
 Wed, 01 Feb 2023 10:55:26 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u2-20020a7bc042000000b003dd8feea827sm2470933wmc.4.2023.02.01.10.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:55:25 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 15/21] migration: Teach qemu about minor faults and
 doublemap
In-Reply-To: <Y9hJshP8p9S0FaZF@x1n> (Peter Xu's message of "Mon, 30 Jan 2023
 17:50:26 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-16-peterx@redhat.com>
 <87k014pocv.fsf@secure.mitica> <Y9hJshP8p9S0FaZF@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 19:55:24 +0100
Message-ID: <87zg9xw6zn.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> On Mon, Jan 30, 2023 at 06:45:20AM +0100, Juan Quintela wrote:
>> Peter Xu <peterx@redhat.com> wrote:
>> > When a ramblock is backed by hugetlbfs and the user specified using
>> > double-map feature, we trap the faults on these regions using minor mode.
>> > Teach QEMU about that.
>> >
>> > Add some sanity check on the fault flags when receiving a uffd message.
>> > For minor fault trapped ranges, we should always see the MINOR flag set,
>> > while when using generic missing faults we should never see it.
>> >
>> > Signed-off-by: Peter Xu <peterx@redhat.com>
>> 
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> 
>> 
>> 
>> > -    if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_COPY))) {
>> 
>> Does qemu have a macro to do this bitmap handling?
>
> Not yet that's suitable.  It's open coded like this in many places of
> postcopy.  One thing close enough is bitmap_test_and_clear() but too heavy.
>
>> 
>> >  {
>> >      MigrationIncomingState *mis = opaque;
>> >      struct uffd_msg msg;
>> > +    uint64_t address;
>> >      int ret;
>> >      size_t index;
>> >      RAMBlock *rb = NULL;
>> > @@ -945,6 +980,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>> >      }
>> >  
>> >      while (true) {
>> > +        bool use_minor_fault, minor_flag;
>> 
>> I think that something on the lines of:
>>            bool src_minor_fault, dst_minor_fault;
>> 
>> will make things simpler.  Reviewing, I have to go back to definition
>> place to know which is which.
>
> These two values represents "what we expect" and "what we got from the
> message", so the only thing is I'm not sure whether src/dst matches the
> best here.
>
> How about "expect_minor_fault" and "has_minor_fault" instead?

Perfect with me.

>> >              /*
>> >               * Send the request to the source - we want to request one
>> >               * of our host page sizes (which is >= TPS)
>> >               */
>> > -            ret = postcopy_request_page(mis, rb, rb_offset,
>> > -                                        msg.arg.pagefault.address);
>> > +            ret = postcopy_request_page(mis, rb, rb_offset, address);
>> 
>> This is the only change that I find 'problematic'.
>> On old code, rb_offset has been ROUND_DOWN, on new code it is not.
>> On old code we pass msg.arg.pagefault.address, now we use
>> ROUND_DOW(msg.arg.pagefault.address, mighration_ram_pagesize(rb)).
>
> Thanks for spotting such a detail even for a RFC series. :)
>
> It's actually rounded down to target psize, here since we're in postcopy we
> should require target psize equals to host psize (or I bet it won't really
> work at all).  So the relevant rounddown was actually done here:
>
>             rb = qemu_ram_block_from_host(
>                      (void *)(uintptr_t)msg.arg.pagefault.address,
>                      true, &rb_offset);
>
> In which there's:
>
>     *offset = (host - block->host);
>     if (round_offset) {
>         *offset &= TARGET_PAGE_MASK;
>     }
>
> So when I rework that chunk of code I directly dropped the ROUND_DOWN()
> because I find it duplicated.

Ok.

>
>> 
>> >              if (ret) {
>> >                  /* May be network failure, try to wait for recovery */
>> >                  postcopy_pause_fault_thread(mis);
>> > @@ -1694,3 +1745,13 @@ void *postcopy_preempt_thread(void *opaque)
>> >  
>> >      return NULL;
>> >  }
>> > +
>> > +/*
>> > + * Whether we should use MINOR fault to trap page faults?  It will be used
>> > + * when doublemap is enabled on hugetlbfs.  The default value will be
>> > + * false, which means we'll keep using the legacy MISSING faults.
>> > + */
>> > +bool postcopy_use_minor_fault(RAMBlock *rb)
>> > +{
>> > +    return migrate_hugetlb_doublemap() && qemu_ram_is_hugetlb(rb);
>> > +}
>> 
>> Are you planing using this function outside postocpy-ram.c?  Otherwise
>> if you move up its definition you can make it static and drop the header
>> change.
>
> Yes, it'll be further used in ram.c later in the patch "migration: Rework
> ram discard logic for hugetlb double-map" right below.

Aha.

Thanks.


