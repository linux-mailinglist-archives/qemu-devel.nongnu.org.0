Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87176FD708
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:32:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdNG-0005zT-Nj; Wed, 10 May 2023 02:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwdNA-0005t3-TZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwdN8-0001fQ-O6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683700341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4VzuCWyA2xvS1HN2TBBCW4/ujsnoD6jY/1nCw9uvKbU=;
 b=aFYjP3bt/TIA07zJYg86JkqDbkPnGHfIAfI0UbCANajX18z6GUzXTSKO8lAv3UdUjiHSw8
 fY7E/zPwBsWbz81qIRBXV6wbcpvKu2qdz24gs8QKyYVXbUmCQJdCf4dRKWhoA6bRQsZCWQ
 bf/iaZOxPvbzPZYtF/s7uIpwzjj79zU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-3CIk56JsPSK1Ka34m4KZ6g-1; Wed, 10 May 2023 02:32:14 -0400
X-MC-Unique: 3CIk56JsPSK1Ka34m4KZ6g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 585D3385054E;
 Wed, 10 May 2023 06:32:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEAA6492C13;
 Wed, 10 May 2023 06:32:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B722121E6924; Wed, 10 May 2023 08:32:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: css_clear_io_interrupt() error handling
References: <87fs87ny6e.fsf@pond.sub.org> <873547dwn0.fsf@redhat.com>
 <20230509193637.678780aa.pasic@linux.ibm.com>
Date: Wed, 10 May 2023 08:32:12 +0200
In-Reply-To: <20230509193637.678780aa.pasic@linux.ibm.com> (Halil Pasic's
 message of "Tue, 9 May 2023 19:36:37 +0200")
Message-ID: <874jokae8j.fsf@pond.sub.org>
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

> On Mon, 08 May 2023 11:01:55 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Mon, May 08 2023, Markus Armbruster <armbru@redhat.com> wrote:
>> 
>> > css_clear_io_interrupt() aborts on unexpected ioctl() errors, and I
>> > wonder whether that's appropriate.  Let's have a closer look:
>
> Just for my understanding, was there a field problem with this code,
> or is it more a theoretical (i.e. no know crashes)?

Inspection.  I stumbled over it while cleaning up use of &error_abort.

>> >
>> >     static void css_clear_io_interrupt(uint16_t subchannel_id,
>> >                                        uint16_t subchannel_nr)
>> >     {
>> >         Error *err = NULL;
>> >         static bool no_clear_irq;
>> >         S390FLICState *fs = s390_get_flic();
>> >         S390FLICStateClass *fsc = s390_get_flic_class(fs);
>> >         int r;
>> >
>> >         if (unlikely(no_clear_irq)) {
>> >             return;
>> >         }
>> >         r = fsc->clear_io_irq(fs, subchannel_id, subchannel_nr);
>> >         switch (r) {
>> >         case 0:
>> >             break;
>> >         case -ENOSYS:
>> >             no_clear_irq = true;
>> >             /*
>> >             * Ignore unavailability, as the user can't do anything
>> >             * about it anyway.
>> >             */
>> >             break;
>> >         default:
>> >             error_setg_errno(&err, -r, "unexpected error condition");
>> >             error_propagate(&error_abort, err);
>> >         }
>> >     }
>> >
>> > The default case is abort() with a liberal amount of lipstick applied.
>> > Let's ignore the lipstick and focus on the abort().
>
> Nod.
>
>> >
>> > fsc->clear_io_irq ist either qemu_s390_clear_io_flic() order
>> > kvm_s390_clear_io_flic().
>
> Right.
>
>> >
>> > Only kvm_s390_clear_io_flic() can return non-zero: -errno when ioctl()
>> > fails.
>
> Agreed, this is the case right now. This was not the case when the code
> was written qemu_s390_clear_io_flic() used to be missing functionality
> and always returned -ENOSYS.

I see.

>> > The ioctl() is KVM_SET_DEVICE_ATTR for KVM_DEV_FLIC_CLEAR_IO_IRQ with
>> > subchannel_id and subchannel_nr.  I.e. we assume that this can only fail
>> > with ENOSYS, und crash hard when the assumption turns out to be wrong.
>
> Yes this is the assumption and the current behavior.
>
>> >
>> > Is this error condition a programming error?  I figure it can be one
>> > only if the ioctl()'s contract promises us it cannot fail in any other
>> > way unless we violate preconditions.
>
> AFAIK and AFAIR it is indeed only possible in case of a programming error
> somewhere, and this was almost certainly my intention with this code. 
>
> For example if the future implementer of a meaningful
> qemu_s390_clear_io_flic() was to decide to use a multitude of error
> codes, the implementer would also have to touch this and handle those
> accordingly to avoid crashes.
>
>
> On the ioctl() is KVM_SET_DEVICE_ATTR for KVM_DEV_FLIC_CLEAR_IO_IRQ I'm
> afraid there is no really authoritative contract, and the current
> implementation, the documentation under Documentation/virt/kvm in
> the Linux source tree and this code in QEMU are the de-facto contract. 
>
> linux/Documentation/virt/kvm/api.rst says
> """
> 4.81 KVM_HAS_DEVICE_ATTR
> ------------------------
>
> :Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
>              KVM_CAP_VCPU_ATTRIBUTES for vcpu device
>              KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device
> :Type: device ioctl, vm ioctl, vcpu ioctl
> :Parameters: struct kvm_device_attr
> :Returns: 0 on success, -1 on error
>
> Errors:
>
>   =====   =============================================================
>   ENXIO   The group or attribute is unknown/unsupported for this device
>           or hardware support is missing.
>   =====   =============================================================
>
> Tests whether a device supports a particular attribute.  A successful
> return indicates the attribute is implemented.  It does not necessarily
> indicate that the attribute can be read or written in the device's
> current state.  "addr" is ignored.
> """
>
> and we do check for availability and cover that via -ENOSYS.

Yes, kvm_s390_flic_realize() checks and sets ->clear_io_supported
accordingly, and kvm_s390_clear_io_flic() returns -ENOSYS when it's
false.

Doc on the actual set:

  4.80 KVM_SET_DEVICE_ATTR/KVM_GET_DEVICE_ATTR
  --------------------------------------------

  :Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
               KVM_CAP_VCPU_ATTRIBUTES for vcpu device
               KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device (no set)
  :Type: device ioctl, vm ioctl, vcpu ioctl
  :Parameters: struct kvm_device_attr
  :Returns: 0 on success, -1 on error

  Errors:

    =====   =============================================================
    ENXIO   The group or attribute is unknown/unsupported for this device
            or hardware support is missing.
    EPERM   The attribute cannot (currently) be accessed this way
            (e.g. read-only attribute, or attribute that only makes
            sense when the device is in a different state)
    =====   =============================================================

    Other error conditions may be defined by individual device types.

  Gets/sets a specified piece of device configuration and/or state.  The
  semantics are device-specific.  See individual device documentation in
  the "devices" directory.  As with ONE_REG, the size of the data
  transferred is defined by the particular attribute.

  ::

    struct kvm_device_attr {
          __u32	flags;		/* no flags currently defined */
          __u32	group;		/* device-defined */
          __u64	attr;		/* group-defined */
          __u64	addr;		/* userspace address of attr data */
    };


kvm_s390_flic_realize() sets ->fd is to refer to the KVM_DEV_TYPE_FLIC
it creates.  I guess that means ENXIO and EPERM should never happen.

> For KVM_DEV_FLIC_CLEAR_IO_IRQ is just the following error code
> documented in linux/Documentation/virt/kvm/devices/s390_flic.rst
> which is to my knowledge the most authoritative source.
> """
> .. note:: The KVM_DEV_FLIC_CLEAR_IO_IRQ ioctl will return EINVAL in case a
>           zero schid is specified
> """
> but a look in the code will tell us that -EFAULT is also possible if the
> supplied address is broken.

Common behavior.

> To sum it up, there is nothing to go wrong with the given operation, and
> to my best knowledge seeing an error code on the ioctl would either
> indicate a programming error on the client side (QEMU messed it up) or
> there is something wrong with the kernel.

Abort on "QEMU messed up" is proper.  Abort on "something wrong with the
kernel" less so.  More on that below.

>> > Is the error condition fatal, i.e. continuing would be unsafe?
>
> If the kernel is broken, probably. It is certainly unexpected.
>
>> >
>> > If it's a fatal programming error, then abort() is appropriate.
>> >
>> > If it's fatal, but not a programming error, we should exit(1) instead.
>
> It might not be a QEMU programming error. I really see no reason why
> would a combination of a sane QEMU and a sane kernel give us another
> error code than -ENOSYS.
>
>> >
>> > If it's a survivable programming error, use of abort() is a matter of
>> > taste.  
>
> The fact that we might have failed to clear up some interrupts which we
> are obligated to clean up by the s390 architecture is not expected to
> have grave consequences. 

Good to know.

>> From what I remember, this was introduced to clean up a potentially
>> queued interrupt that is not supposed to be delivered, so the worst
>> thing that could happen on failure is a spurious interrupt (same as what
>> could happen if the kernel flic doesn't provide this function in the
>> first place.) My main worry would be changes/breakages on the kernel
>> side (while the QEMU side remains unchanged).
>
> Agreed. And I hope anybody changing the kernel would test the new error
> code and notice the QEMU crashes. This was my intention in the first
> place.
>
>> So, I think we should continue to log the error in any case; but I don't
>> have a strong opinion as to whether we should use exit(1) (as I wouldn't
>> consider it a programming error) or just continue. Halil, your choice :)
>
> Neither do I have a strong opinion. I think a hard crash is easier to
> spot than a warning message (I mean both in CI and in case of manual
> testing). But it is a trade-off. Just carrying on without checking error
> codes is in my opinion not really likely to get us in the pickle either.
> I don't think the function preformed is essential. Especially not for a
> Linux guest. For me this is really an 'assert' situation. Is there a
> QEMU way of dealing with that?

My concern is unnecessary hard crashes in production, risking data loss.

When continuing would be unsafe, we should terminate the process.

When termination is due to programming error in the program itself, we
should use abort() to tell the user they need to get developers
involved, and also to produce a core dump for developers.

When it's due to programming error outside the program itself, say in
the kernel, I'd rather exit(1).  Reasonable people can differ in opinion
there.

What to do when a programming error is recoverable?

Developers testing the program may prefer to abort().  Users using the
program will very much prefer to recover.

assert() lets you code both behaviors controlled by macro NDEBUG.
Requires disciplined use of assert().  Not the case for QEMU; code
routinely (and tacitly!) relies on NDEBUG being off.  The consensus
among QEMU developers is that friends don't let friends compile QEMU
with NDEBUG.

My final argument against aborting on this particular error is local
consistency.  I see 14 calls of ioctl() in this file.

One handles all errors silently: kvm_s390_flic_realize()'s probe of
KVM_DEV_FLIC_CLEAR_IO_IRQ.  Okay.

Two complain to stderr and continue: flic_enable_pfault(),
flic_disable_wait_pfault().  One complains via trace and continues:
kvm_s390_flic_reset().

Aside: why the difference?  Also, consider warn_report() or
info_report() for complaining to stderr, and consider to show
strerror(errno).

One reports an error to stderr and fails: kvm_flic_ais_pre_save().
Okay.

Aside: I suspect reporting to stderr is wrong, because some of its
callers use the Error API.  Not this code's fault, the callback you're
implementing doesn't have an Error ** parameter.

One sets an Error and fails: kvm_s390_flic_realize().  Okay.

The remainder return -errno.  I lack the time to follow their call chain
to examine how failure is handled.  But one of them caught my eye, or
rather its caller did:

    static int __get_all_irqs(KVMS390FLICState *flic,
                              void **buf, int len)
    {
        int r;

        do {
            /* returns -ENOMEM if buffer is too small and number
             * of queued interrupts on success */
            r = flic_get_all_irqs(flic, *buf, len);
            if (r >= 0) {
                break;
            }
            len *= 2;
            *buf = g_try_realloc(*buf, len);
            if (!buf) {
                return -ENOMEM;
            }
        } while (r == -ENOMEM && len <= KVM_S390_FLIC_MAX_BUFFER);

        return r;
    }

This treats *all* ioctl() errors as if they were -ENOMEM.  Feels sloppy
to me.

Back to my consistency argument.  None of the other ioctl() failures I
inspected leads to abort().  The failures that seem most similar to me
complain to stderr or trace, then continue.  Shouldn't this one, too?


