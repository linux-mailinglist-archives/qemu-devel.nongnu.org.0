Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3566FF16F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:21:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5IK-0007ay-1K; Thu, 11 May 2023 08:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px5IF-0007aK-88
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px5I1-0005NW-4F
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683807656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARnG+axgBmiC1DtpAy32O6pmXSJyufxeMqHD7El9x4c=;
 b=g5DFIXxjr5ZVaZYWLs11FvpghckFSYdlDZfFn8s+66F8PjTcWJa1kEN1NljUy2/OMRCLdH
 rld58CPPMBLnjv5Xlm0m2jija99bFTuL88RW/NltYUoVAtqZ0fg3Gs8+Xv6znjvg9YcfBS
 Wos2fgNfBYMWalPx9rLPjPKCSRub75g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-ctaFLZnuOmSa55gVBw_AaA-1; Thu, 11 May 2023 08:20:53 -0400
X-MC-Unique: ctaFLZnuOmSa55gVBw_AaA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC4813825BA3;
 Thu, 11 May 2023 12:20:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D919492C13;
 Thu, 11 May 2023 12:20:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 27B7821F9816; Thu, 11 May 2023 14:20:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: css_clear_io_interrupt() error handling
References: <87fs87ny6e.fsf@pond.sub.org> <873547dwn0.fsf@redhat.com>
 <20230509193637.678780aa.pasic@linux.ibm.com>
 <874jokae8j.fsf@pond.sub.org>
 <20230511034355.0b916dcb.pasic@linux.ibm.com>
Date: Thu, 11 May 2023 14:20:51 +0200
In-Reply-To: <20230511034355.0b916dcb.pasic@linux.ibm.com> (Halil Pasic's
 message of "Thu, 11 May 2023 03:43:55 +0200")
Message-ID: <87r0rnjbz0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Halil Pasic <pasic@linux.ibm.com> writes:

> On Wed, 10 May 2023 08:32:12 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Halil Pasic <pasic@linux.ibm.com> writes:
>> 
>> > On Mon, 08 May 2023 11:01:55 +0200
>> > Cornelia Huck <cohuck@redhat.com> wrote:
>> >  
>> >> On Mon, May 08 2023, Markus Armbruster <armbru@redhat.com> wrote:
> [..]
>> > and we do check for availability and cover that via -ENOSYS.  
>> 
>> Yes, kvm_s390_flic_realize() checks and sets ->clear_io_supported
>> accordingly, and kvm_s390_clear_io_flic() returns -ENOSYS when it's
>> false.
>> 
>> Doc on the actual set:
>
> Right. Sorry for the misinformation.

No problem!  With the clue you provided, the exact match was easy to
find :)

>>   4.80 KVM_SET_DEVICE_ATTR/KVM_GET_DEVICE_ATTR
>>   --------------------------------------------
>> 
>>   :Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
>>                KVM_CAP_VCPU_ATTRIBUTES for vcpu device
>>                KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device (no set)
>>   :Type: device ioctl, vm ioctl, vcpu ioctl
>>   :Parameters: struct kvm_device_attr
>>   :Returns: 0 on success, -1 on error
>> 
>>   Errors:
>> 
>>     =====   =============================================================
>>     ENXIO   The group or attribute is unknown/unsupported for this device
>>             or hardware support is missing.
>>     EPERM   The attribute cannot (currently) be accessed this way
>>             (e.g. read-only attribute, or attribute that only makes
>>             sense when the device is in a different state)
>>     =====   =============================================================
>> 
>>     Other error conditions may be defined by individual device types.
>> 
>>   Gets/sets a specified piece of device configuration and/or state.  The
>>   semantics are device-specific.  See individual device documentation in
>>   the "devices" directory.  As with ONE_REG, the size of the data
>>   transferred is defined by the particular attribute.
>> 
>>   ::
>> 
>>     struct kvm_device_attr {
>>           __u32	flags;		/* no flags currently defined */
>>           __u32	group;		/* device-defined */
>>           __u64	attr;		/* group-defined */
>>           __u64	addr;		/* userspace address of attr data */
>>     };
>> 
>> 
>> kvm_s390_flic_realize() sets ->fd is to refer to the KVM_DEV_TYPE_FLIC
>> it creates.  I guess that means ENXIO and EPERM should never happen.
>
> I agree.
>
>> 
>> > For KVM_DEV_FLIC_CLEAR_IO_IRQ is just the following error code
>> > documented in linux/Documentation/virt/kvm/devices/s390_flic.rst
>> > which is to my knowledge the most authoritative source.
>> > """
>> > .. note:: The KVM_DEV_FLIC_CLEAR_IO_IRQ ioctl will return EINVAL in case a
>> >           zero schid is specified
>> > """
>> > but a look in the code will tell us that -EFAULT is also possible if the
>> > supplied address is broken.  
>> 
>> Common behavior.
>>
>
> Makes sense, just that I did not find it in the interface
> description/documentation.
>  
>> > To sum it up, there is nothing to go wrong with the given operation, and
>> > to my best knowledge seeing an error code on the ioctl would either
>> > indicate a programming error on the client side (QEMU messed it up) or
>> > there is something wrong with the kernel.  
>> 
>> Abort on "QEMU messed up" is proper.  Abort on "something wrong with the
>> kernel" less so.  More on that below.
>> 
>
> I think I understand where are you coming from. IMHO it boils down
> to how broken the kernel is.
>
>> >> > Is the error condition fatal, i.e. continuing would be unsafe?  
>> >
>> > If the kernel is broken, probably. It is certainly unexpected.
>> >  
>> >> >
>> >> > If it's a fatal programming error, then abort() is appropriate.
>> >> >
>> >> > If it's fatal, but not a programming error, we should exit(1) instead.  
>> >
>> > It might not be a QEMU programming error. I really see no reason why
>> > would a combination of a sane QEMU and a sane kernel give us another
>> > error code than -ENOSYS.
>> >  
>> >> >
>> >> > If it's a survivable programming error, use of abort() is a matter of
>> >> > taste.    
>> >
>> > The fact that we might have failed to clear up some interrupts which we
>> > are obligated to clean up by the s390 architecture is not expected to
>> > have grave consequences.   
>> 
>> Good to know.
>> 
>> >> From what I remember, this was introduced to clean up a potentially
>> >> queued interrupt that is not supposed to be delivered, so the worst
>> >> thing that could happen on failure is a spurious interrupt (same as what
>> >> could happen if the kernel flic doesn't provide this function in the
>> >> first place.) My main worry would be changes/breakages on the kernel
>> >> side (while the QEMU side remains unchanged).  
>> >
>> > Agreed. And I hope anybody changing the kernel would test the new error
>> > code and notice the QEMU crashes. This was my intention in the first
>> > place.
>> >  
>> >> So, I think we should continue to log the error in any case; but I don't
>> >> have a strong opinion as to whether we should use exit(1) (as I wouldn't
>> >> consider it a programming error) or just continue. Halil, your choice :)  
>> >
>> > Neither do I have a strong opinion. I think a hard crash is easier to
>> > spot than a warning message (I mean both in CI and in case of manual
>> > testing). But it is a trade-off. Just carrying on without checking error
>> > codes is in my opinion not really likely to get us in the pickle either.
>> > I don't think the function preformed is essential. Especially not for a
>> > Linux guest. For me this is really an 'assert' situation. Is there a
>> > QEMU way of dealing with that?  
>> 
>> My concern is unnecessary hard crashes in production, risking data loss.
>> 
>
> Nod.
>
>> When continuing would be unsafe, we should terminate the process.
>> 
>> When termination is due to programming error in the program itself, we
>> should use abort() to tell the user they need to get developers
>> involved, and also to produce a core dump for developers.
>> 
>
> So let us  assume we see a -EFAULT in that switch-case. It might be
> a broken QEMU or a broken kernel that is the root cause. I guess
> we would decide it is QEMU.
>
>> When it's due to programming error outside the program itself, say in
>> the kernel, I'd rather exit(1).  Reasonable people can differ in opinion
>> there.
>
> How it is better? Wouldn't both abruptly terminate the guest.

Note the context: when continuing would be unsafe.

>> What to do when a programming error is recoverable?
>> 
>> Developers testing the program may prefer to abort().  Users using the
>> program will very much prefer to recover.
>> 
>> assert() lets you code both behaviors controlled by macro NDEBUG.
>> Requires disciplined use of assert().  
>
> Exactly the reason I have said 'assert' situation. But IMHO assert does
> not fit because with NDEBUG it does literally nothing and thus remains
> silent.

Yes.  More on that below.

>> Not the case for QEMU; code
>> routinely (and tacitly!) relies on NDEBUG being off.  The consensus
>> among QEMU developers is that friends don't let friends compile QEMU
>> with NDEBUG.
>
> Can you expand on this? I do understand the words, but I don't
> understand the background and the reason why?

If you're confident your release builds are basically free of errors,
checking assertions would be a waste, so you compile with NDEBUG.  We
are not confident, so we don't.

You seem to have a different thing in mind, namely something like

    if (oopsie(!good)) {
        recovery code
    }

where oopsie() always logs, and optionally crashes[*].  This can be
useful, although testing the recovery code is hard, which doesn't
exactly inspire confidence.  Anyway, we're not using this technique in
QEMU.

>> My final argument against aborting on this particular error is local
>> consistency.  I see 14 calls of ioctl() in this file.
>
> This file is hw/intc/s390_flic_kvm.c, right?

Yes.  Should've said that.

>                                              But the lipsticked
> abort() is called in hw/s390x/css.c in function css_clear_io_interrupt().

Right.  One step up a call chain.

>> One handles all errors silently: kvm_s390_flic_realize()'s probe of
>> KVM_DEV_FLIC_CLEAR_IO_IRQ.  Okay.
>> 
>> Two complain to stderr and continue: flic_enable_pfault(),
>> flic_disable_wait_pfault().  One complains via trace and continues:
>> kvm_s390_flic_reset().
>> 
>> Aside: why the difference?  Also, consider warn_report() or
>> info_report() for complaining to stderr, and consider to show
>> strerror(errno).
>> 
>> One reports an error to stderr and fails: kvm_flic_ais_pre_save().
>> Okay.
>> 
>> Aside: I suspect reporting to stderr is wrong, because some of its
>> callers use the Error API.  Not this code's fault, the callback you're
>> implementing doesn't have an Error ** parameter.
>> 
>> One sets an Error and fails: kvm_s390_flic_realize().  Okay.
>> 
>> The remainder return -errno.  I lack the time to follow their call chain
>> to examine how failure is handled.  But one of them caught my eye, or
>> rather its caller did:
>> 
>>     static int __get_all_irqs(KVMS390FLICState *flic,
>>                               void **buf, int len)
>>     {
>>         int r;
>> 
>>         do {
>>             /* returns -ENOMEM if buffer is too small and number
>>              * of queued interrupts on success */
>>             r = flic_get_all_irqs(flic, *buf, len);
>>             if (r >= 0) {
>>                 break;
>>             }
>>             len *= 2;
>>             *buf = g_try_realloc(*buf, len);
>>             if (!buf) {
>>                 return -ENOMEM;
>>             }
>>         } while (r == -ENOMEM && len <= KVM_S390_FLIC_MAX_BUFFER);
>> 
>>         return r;
>>     }
>> 
>> This treats *all* ioctl() errors as if they were -ENOMEM.  Feels sloppy
>> to me.
>> 
>> Back to my consistency argument.  None of the other ioctl() failures I
>> inspected leads to abort().  
>
> I believe a failure of fsc->register_io_adapter() can lead to an abort
> in css_register_io_adapters(), as the errp passed in is &error_abort.

Yes, one of its two call chains passes &error_abort.

>> The failures that seem most similar to me
>> complain to stderr or trace, then continue.  Shouldn't this one, too?
>
> My intention was to reify the assumption that the member clear_io_irq()
> of any implementation of S390FLICStateClass is either telling us that
> this operation is not available by returning -ENOSYS, or it should
> do the job. This 'if not available return -ENOSYS is to my best knowledge
> locally consistent.
>
> The function kvm_s390_clear_io_flic() sits in 
> hw/intc/s390_flic_kvm.c handles unexpected errors which as we discussed
> are most likely either due to a programming error in QEMU or a programming
> error in the kernel by returning the -errno. Which is IMHO locally consistent.
>
> I did not check in detail , but I do agree from remembrance that most most of the
> call chains most likely will not lead to an abort on an unexpected failure of the
> ioctl(). 

Plausible.

> So in the end I do buy your argument that css_clear_io_interrupt() is
> not consistent with its environment. But is the more prevalent practice
> actually better? If we indeed ever happened to hit the case in
> question, I would prefer to have a dump, and try to figure out
> based on that if QEMU messed up, over not having one unless it is at
> a cost of an important wrokload. As I have said I have no strong
> opinion. 

"Always crash & dump core" is the current behavior for this particular
unexpected error, and possibly some related ones.

> Just logging a warning and carrying on is from my perspective
> also a sane thing to do. I even agree, if this situation were to happen
> in a production environment, I would prefer not bringing down the guest.

Current behavior for other related unexpected errors.

> But on the other hand, that abort() can be seen as a means of reducing
> the probability of seeing the situation in production by increasing the
> chance to catch the hypothetical bug before it ships. In the end I'm
> fine either way. 
>
> In my opinion the best way to deal with such situations would be to
> abort() in test/development and log a warning in production. Of course

Understand, but...

> assert() wouldn't give me that, and it wouldn't be locally consistent at
> all.

... nothing behaves like that so far.

Let's try to come to a conclusion.  We can either keep the current
behavior, i.e. abort().  Or we change it to just print something.

If we want the latter: fprintf() to stderr, warn_report(), or trace
point?

You are the maintainer, so the decision is yours.

I could stick a patch into a series of error-related cleanup patches I'm
working on.


[*] I'm rather fond of the trick to have oopsie() fork & crash.


