Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6D83A442F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:38:29 +0200 (CEST)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriIm-0007iD-UT
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lriHr-0006zl-9L
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lriHn-0005p2-0S
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623422246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNOa4XfwvdKj+arbQZyXVrd9APXEfN5wMP29gSLYgwE=;
 b=FqfX0SYdeL524irRRTMq86RmsOQ+RTInnWQOOEtd4L/TehgqzKmUBWcdfki07/rZhPMR+s
 VYmGm2rgkjBKq/lF9Kb5mNex0CD51zaCdMsGHTvymGeN8W+DzasydnYZ79aCja05EQ0Qqw
 WGtCdMDe+ekHJeIsX9RKWmueT4tYICw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-IwsAQEOpNYawf8Pm_IE6rg-1; Fri, 11 Jun 2021 10:37:25 -0400
X-MC-Unique: IwsAQEOpNYawf8Pm_IE6rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEF581084F44;
 Fri, 11 Jun 2021 14:37:23 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F455D9E2;
 Fri, 11 Jun 2021 14:37:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/1] vfio-ccw: Keep passthrough sense data intact
In-Reply-To: <aba83201997c64ee11af5f1a5ca2ac2c76731a17.camel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210610202011.391029-1-farman@linux.ibm.com>
 <20210610202011.391029-2-farman@linux.ibm.com> <87lf7gzxbh.fsf@redhat.com>
 <87fsxozoq4.fsf@redhat.com>
 <aba83201997c64ee11af5f1a5ca2ac2c76731a17.camel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 16:37:16 +0200
Message-ID: <87a6nwzcv7.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11 2021, Eric Farman <farman@linux.ibm.com> wrote:

> On Fri, 2021-06-11 at 12:21 +0200, Cornelia Huck wrote:
>> On Fri, Jun 11 2021, Cornelia Huck <cohuck@redhat.com> wrote:
>> 
>> > On Thu, Jun 10 2021, Eric Farman <farman@linux.ibm.com> wrote:
>> > > diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>> > > index bed46f5ec3..29234daa27 100644
>> > > --- a/hw/s390x/css.c
>> > > +++ b/hw/s390x/css.c
>> > > @@ -1661,7 +1661,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB
>> > > *target_irb, int *irb_len)
>> > >          }
>> > >          /* If a unit check is pending, copy sense data. */
>> > >          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
>> > > -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
>> > > +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
>> > > +            (sch->sense_data[0] != 0)) {
>> > >              int i;
>> > >  
>> > >              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF |
>> > >              SCSW_FLAGS_MASK_ECTL;
>> 
>> This function is where we build the esw/ecw...
>> 
>> > > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> > > index 139a3d9d1b..a4dc4acb34 100644
>> > > --- a/hw/vfio/ccw.c
>> > > +++ b/hw/vfio/ccw.c
>> > > @@ -371,12 +371,6 @@ static void
>> > > vfio_ccw_io_notifier_handler(void *opaque)
>> > >      copy_scsw_to_guest(&s, &irb.scsw);
>> > >      schib->scsw = s;
>> > >  
>> > > -    /* If a uint check is pending, copy sense data. */
>> > > -    if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
>> > > -        (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
>> 
>> ...and here we actually do have the esw/ecw provided by the hardware.
>> 
>> > If I'm reading the PoP correctly, turning on concurrent sense only
>> > means
>> > that we may have sense data already available, but not that it's
>> > guaranteed.
>
> Agreed.
>
>> >  Would it be enough to look at the relevant bit in the erw
>> > and only copy sense data if it is actually set (here and/or above)?
>
> Do we have the hardware ERW in the css_do_tsch routine?
>
> Oh, but we have SCSW, and POPS says if ERW.S is set, SCSW.E is set. So
> that would make this a pretty simple change then.

Nod, that looks good.

>
>> 
>> Maybe the root of the problem is that we actually try to build the
>> esw
>> ourselves? If we copy it from the irb received by the hardware, we
>> should already have the correct data, I think.
>
> Yeah, that's part of the problem. As you note above, the PMCW.CSENSE
> bit only says if concurrent sense is possible, not that it was actually
> stored in the IRB.
>
> I (mistakenly) thought that removing this hunk would get the whole IRB
> copied over, but I see now that css_do_tsch_get_irb() only copies the
> SCSW, and builds the ESW/ECW based off sch->sense_data.

Might be a good idea to go over what we pass through vs. what we
emulate for vfio-ccw devices, in case we have more conditions like
this. We probably should not overwrite information that we can just move
guestward.

>
>> 
>> > > -        memcpy(sch->sense_data, irb.ecw, sizeof(irb.ecw));
>> > > -    }
>> > > -
>> > >  read_err:
>> > >      css_inject_io_interrupt(sch);
>> > >  }


