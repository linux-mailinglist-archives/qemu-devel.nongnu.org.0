Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB26FCCE4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:38:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRHm-0006uO-PZ; Tue, 09 May 2023 13:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pwRHi-0006u7-TB
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:37:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pwRHg-0004EA-Lo
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:37:58 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349HaUxd014681
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 17:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=uIJ7uEyCHtPw+MoYlDrLSX2jmAzqtpX8hQT800n5WC4=;
 b=jGmzv0vMjDZlAJ2jeUh09FL1U6GwKYBGNs7K/JFik5LLg3Esjhc5QhZY8LwPPqyLnt2j
 k5KabQ31ROyabBSfzMhGxCwTW9+BMx863/JuIj6r8m9MopRuLH3lm9YBmdWhcKvZfN6F
 3d4PTC5zRk8vssboq5wW74QTL6AwrN1iIJXVfrHJgQGewu4hHqHA/KnAseIk0dm9LSop
 RIbWHmeyosgd5DJJGt8TJqFBbtgJvzsOaEFTo5MIZnq2ejPaPb5cvYIz9lwcyVkvp9pC
 T+C3Oz5HsCDPEeGTXE9qr5IWcIVc9afksEpNAMAESp+VdwZ74x+3gTA5LYjqM+Hg1BDL wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qftjsg5cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 17:36:56 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349HanIY016888
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 17:36:49 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qftjsg4w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 17:36:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34926L2s022935;
 Tue, 9 May 2023 17:36:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh0kef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 17:36:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349Hadq312976686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 17:36:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 491742004F;
 Tue,  9 May 2023 17:36:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C3F72004B;
 Tue,  9 May 2023 17:36:39 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown
 [9.152.224.212])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 17:36:39 +0000 (GMT)
Date: Tue, 9 May 2023 19:36:37 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: css_clear_io_interrupt() error handling
Message-ID: <20230509193637.678780aa.pasic@linux.ibm.com>
In-Reply-To: <873547dwn0.fsf@redhat.com>
References: <87fs87ny6e.fsf@pond.sub.org>
	<873547dwn0.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tuodb6kvVBPixauFZtEbTNxVjnEoJc5Q
X-Proofpoint-ORIG-GUID: jrX1xejBzvnNMcClp6kJGdtO4MQriI7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090146
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 08 May 2023 11:01:55 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, May 08 2023, Markus Armbruster <armbru@redhat.com> wrote:
> 
> > css_clear_io_interrupt() aborts on unexpected ioctl() errors, and I
> > wonder whether that's appropriate.  Let's have a closer look:

Just for my understanding, was there a field problem with this code,
or is it more a theoretical (i.e. no know crashes)?

> >
> >     static void css_clear_io_interrupt(uint16_t subchannel_id,
> >                                        uint16_t subchannel_nr)
> >     {
> >         Error *err = NULL;
> >         static bool no_clear_irq;
> >         S390FLICState *fs = s390_get_flic();
> >         S390FLICStateClass *fsc = s390_get_flic_class(fs);
> >         int r;
> >
> >         if (unlikely(no_clear_irq)) {
> >             return;
> >         }
> >         r = fsc->clear_io_irq(fs, subchannel_id, subchannel_nr);
> >         switch (r) {
> >         case 0:
> >             break;
> >         case -ENOSYS:
> >             no_clear_irq = true;
> >             /*
> >             * Ignore unavailability, as the user can't do anything
> >             * about it anyway.
> >             */
> >             break;
> >         default:
> >             error_setg_errno(&err, -r, "unexpected error condition");
> >             error_propagate(&error_abort, err);
> >         }
> >     }
> >
> > The default case is abort() with a liberal amount of lipstick applied.
> > Let's ignore the lipstick and focus on the abort().

Nod.

> >
> > fsc->clear_io_irq ist either qemu_s390_clear_io_flic() order
> > kvm_s390_clear_io_flic().

Right.

> >
> > Only kvm_s390_clear_io_flic() can return non-zero: -errno when ioctl()
> > fails.

Agreed, this is the case right now. This was not the case when the code
was written qemu_s390_clear_io_flic() used to be missing functionality
and always returned -ENOSYS.

> >
> > The ioctl() is KVM_SET_DEVICE_ATTR for KVM_DEV_FLIC_CLEAR_IO_IRQ with
> > subchannel_id and subchannel_nr.  I.e. we assume that this can only fail
> > with ENOSYS, und crash hard when the assumption turns out to be wrong.

Yes this is the assumption and the current behavior.

> >
> > Is this error condition a programming error?  I figure it can be one
> > only if the ioctl()'s contract promises us it cannot fail in any other
> > way unless we violate preconditions.

AFAIK and AFAIR it is indeed only possible in case of a programming error
somewhere, and this was almost certainly my intention with this code. 

For example if the future implementer of a meaningful
qemu_s390_clear_io_flic() was to decide to use a multitude of error
codes, the implementer would also have to touch this and handle those
accordingly to avoid crashes.


On the ioctl() is KVM_SET_DEVICE_ATTR for KVM_DEV_FLIC_CLEAR_IO_IRQ I'm
afraid there is no really authoritative contract, and the current
implementation, the documentation under Documentation/virt/kvm in
the Linux source tree and this code in QEMU are the de-facto contract. 

linux/Documentation/virt/kvm/api.rst says
"""
4.81 KVM_HAS_DEVICE_ATTR
------------------------

:Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
             KVM_CAP_VCPU_ATTRIBUTES for vcpu device
             KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device
:Type: device ioctl, vm ioctl, vcpu ioctl
:Parameters: struct kvm_device_attr
:Returns: 0 on success, -1 on error

Errors:

  =====   =============================================================
  ENXIO   The group or attribute is unknown/unsupported for this device
          or hardware support is missing.
  =====   =============================================================

Tests whether a device supports a particular attribute.  A successful
return indicates the attribute is implemented.  It does not necessarily
indicate that the attribute can be read or written in the device's
current state.  "addr" is ignored.
"""

and we do check for availability and cover that via -ENOSYS.

For KVM_DEV_FLIC_CLEAR_IO_IRQ is just the following error code
documented in linux/Documentation/virt/kvm/devices/s390_flic.rst
which is to my knowledge the most authoritative source.
"""
.. note:: The KVM_DEV_FLIC_CLEAR_IO_IRQ ioctl will return EINVAL in case a
          zero schid is specified
"""
but a look in the code will tell us that -EFAULT is also possible if the
supplied address is broken.

To sum it up, there is nothing to go wrong with the given operation, and
to my best knowledge seeing an error code on the ioctl would either
indicate a programming error on the client side (QEMU messed it up) or
there is something wrong with the kernel.

> >
> > Is the error condition fatal, i.e. continuing would be unsafe?

If the kernel is broken, probably. It is certainly unexpected.

> >
> > If it's a fatal programming error, then abort() is appropriate.
> >
> > If it's fatal, but not a programming error, we should exit(1) instead.

It might not be a QEMU programming error. I really see no reason why
would a combination of a sane QEMU and a sane kernel give us another
error code than -ENOSYS.

> >
> > If it's a survivable programming error, use of abort() is a matter of
> > taste.  

The fact that we might have failed to clear up some interrupts which we
are obligated to clean up by the s390 architecture is not expected to
have grave consequences. 

> 
> From what I remember, this was introduced to clean up a potentially
> queued interrupt that is not supposed to be delivered, so the worst
> thing that could happen on failure is a spurious interrupt (same as what
> could happen if the kernel flic doesn't provide this function in the
> first place.) My main worry would be changes/breakages on the kernel
> side (while the QEMU side remains unchanged).

Agreed. And I hope anybody changing the kernel would test the new error
code and notice the QEMU crashes. This was my intention in the first
place.

> 
> So, I think we should continue to log the error in any case; but I don't
> have a strong opinion as to whether we should use exit(1) (as I wouldn't
> consider it a programming error) or just continue. Halil, your choice :)
> 

Neither do I have a strong opinion. I think a hard crash is easier to
spot than a warning message (I mean both in CI and in case of manual
testing). But it is a trade-off. Just carrying on without checking error
codes is in my opinion not really likely to get us in the pickle either.
I don't think the function preformed is essential. Especially not for a
Linux guest. For me this is really an 'assert' situation. Is there a
QEMU way of dealing with that?

Regards,
Halil




