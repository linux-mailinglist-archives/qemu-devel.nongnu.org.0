Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0E383B73
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:37:38 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihBR-0001DL-Nr
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lih67-0004qp-Tw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lih5x-0004j7-2d
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621272714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1N4O5QPSEAAxi8EDJ9ASesmuFIrCasJZ96IgjshBUI=;
 b=MeLwQlqEQ8XvgZLHJs+4vswHoawPDtp2qiLcBR7PbGY9lBvy1djsuhBIPUw8TCyiCsOk6t
 6rHjCOTyjfQItmqeZI5vAWPNVJyAWorjwSZn5CJLtjALEJSOcfyyWxeYJ9zipKPR8bt0+C
 ZX/TnaXT27rjcFl7Tm8hJ0qBwPF35to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-S2BaY_xuPzSkfpBFjVrnEQ-1; Mon, 17 May 2021 13:31:50 -0400
X-MC-Unique: S2BaY_xuPzSkfpBFjVrnEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 856F8100747B;
 Mon, 17 May 2021 17:31:49 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-115-195.ams2.redhat.com
 [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A05B5C1D1;
 Mon, 17 May 2021 17:31:48 +0000 (UTC)
Date: Mon, 17 May 2021 19:31:45 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH RFC] vfio-ccw: forward halt/clear errors
Message-ID: <20210517193145.5a13ae1c.cohuck@redhat.com>
In-Reply-To: <12fd64d4d368230b69f47a6ed67049b67553717b.camel@linux.ibm.com>
References: <20210511151129.77051-1-cohuck@redhat.com>
 <12fd64d4d368230b69f47a6ed67049b67553717b.camel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 16:19:15 -0400
Eric Farman <farman@linux.ibm.com> wrote:

> On Tue, 2021-05-11 at 17:11 +0200, Cornelia Huck wrote:
> > hsch and csch basically have two parts: execute the command,
> > and perform the halt/clear function. For fully emulated
> > subchannels, it is pretty clear how it will work: check the
> > subchannel state, and actually 'perform the halt/clear function'
> > and set cc 0 if everything looks good.
> > 
> > For passthrough subchannels, some of the checking is done
> > within QEMU, but some has to be done within the kernel. QEMU's
> > subchannel state may be such that we can perform the async
> > function, but the kernel may still get a cc != 0 when it is
> > actually executing the instruction. In that case, we need to
> > set the condition actually encountered by the kernel; if we
> > set cc 0 on error, we would actually need to inject an interrupt
> > as well.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > Stumbled over this during the vfio-ccw kernel locking discussions.
> > 
> > This is probably a corner case, and I'm not sure how I can actually
> > get this path excercised, but it passes my smoke tests.  
> 
> I'll see if I can hammer my way into some of this.

Thanks, that would be cool.

> 
> > 
> > Not sure whether this is the way to go.   
> 
> I think it seems reasonable.
> 
> > The unit exceptions in the
> > halt/clear error paths also seem slightly fishy.  
> 
> It is peculiar. Looking at the old POPS references, the unit exception
> states that the --device-- detected something unusual, not really the
> subchannel (which is how vfio-ccw is behaving). But, providing some
> indication that something went seriously wrong is good. Which I guess
> was the point of the UE code, even though it's obviously set up to be
> generated after a failure on the START.

Yes, I had copied it over when I wired up halt/clear.

> 
> I guess at the least, we need to clean up the FCTL based on the
> function that failed, rather than only cleaning up the START function.

Makes sense.

> The UE itself may just be an extra "hey this is busted" indicator.

It still feels a bit odd, but I'm not sure that there's a better
alternative.

> 
> > 
> > ---
> >  hw/s390x/css.c | 34 ++++++++++++++++++++++++++++++----
> >  hw/vfio/ccw.c  |  4 ++--
> >  2 files changed, 32 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> > index bed46f5ec3a2..ce2e903ca25a 100644
> > --- a/hw/s390x/css.c
> > +++ b/hw/s390x/css.c
> > @@ -1206,23 +1206,49 @@ static void
> > sch_handle_start_func_virtual(SubchDev *sch)
> >  
> >  }
> >  
> > -static void sch_handle_halt_func_passthrough(SubchDev *sch)
> > +static IOInstEnding sch_handle_halt_func_passthrough(SubchDev *sch)
> >  {
> >      int ret;
> >  
> >      ret = s390_ccw_halt(sch);
> >      if (ret == -ENOSYS) {
> >          sch_handle_halt_func(sch);
> > +        return IOINST_CC_EXPECTED;  
> 
> This is the fallback, so makes sense. You could fold it into the switch
> table, but since that's for "stuff from the kernel" versus -ENOSYS says
> "there's no way to call the kernel" I guess this is fine too.

Yes, that was the reason I kept that separate. (I don't expect it to be
a heavily exercised path nowadays anyway.)

> 
> > +    }
> > +    /*
> > +     * Some conditions may have been detected prior to starting the
> > halt
> > +     * function; map them to the correct cc.
> > +     */
> > +    switch (ret) {
> > +    case -EBUSY:
> > +        return IOINST_CC_BUSY;
> > +    case -ENODEV:
> > +    case -EACCES:
> > +        return IOINST_CC_NOT_OPERATIONAL;
> > +    default:
> > +        return IOINST_CC_EXPECTED;
> >      }
> >  }

(...)

> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index e752c845e9e4..39275a917bd2 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -199,7 +199,7 @@ again:  
> 
> // This is for CLEAR
> 
> >      case 0:
> >      case -ENODEV:
> >      case -EACCES:
> > -        return 0;
> > +        return ret;
> >      case -EFAULT:
> >      default:
> >          sch_gen_unit_exception(sch);
> > @@ -240,7 +240,7 @@ again:  
> 
> // This is for HALT
> 
> >      case -EBUSY:
> >      case -ENODEV:
> >      case -EACCES:
> > -        return 0;
> > +        return ret;  
> 
> Aside: How could we get EACCES for either HALT or CLEAR? I only see
> that set in the normal request path, if we got a CC3 on the SSCH.

We should only get -ENODEV, which basically indicates cc3 on the kernel
side. For start, the kernel distinguishes between "you didn't specify a
path in the orb that's actually available" and "device not
operational", but we map everything to cc 3 in QEMU (and I don't think
there's anything else we could do with that information anyway.)

> 
> Can we scrub them, or do we need to update kernel
> Documentation/s390/vfio-ccw.rst ? :)

We could remove them, or log something if they come up unexpectedly;
but their presence does not really hurt, either.


