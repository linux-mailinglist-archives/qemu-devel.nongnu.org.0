Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FF3CB51E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:16:51 +0200 (CEST)
Received: from localhost ([::1]:44744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4JxU-0001tj-V9
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4Jvn-00007v-Dj
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4Jvl-0002KT-62
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626426888;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZtIq4WHEhsItahKc+Q4fON6pBjomgpsZmK4vkpQBg9I=;
 b=cRN1x6chSSyj0An353nMmX1YJNjLvuBJ8lxHwzPCDj6807kqgCvdpel9O8VcG+h1T/4myB
 9QhD9qH8IRyheFbc1CkDiOVzJMVL/mUCJKfCAKB4HhUYxSb0ZGnUlyL6V89QJ3bR6+Jrcu
 +RABT7OF6hzYzYrwEolD4UQYLTig730=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-A7KPktYQPEGV6i3m_xkoFA-1; Fri, 16 Jul 2021 05:14:38 -0400
X-MC-Unique: A7KPktYQPEGV6i3m_xkoFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AECA81005547;
 Fri, 16 Jul 2021 09:14:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2180C1981C;
 Fri, 16 Jul 2021 09:14:29 +0000 (UTC)
Date: Fri, 16 Jul 2021 10:14:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
Message-ID: <YPFN83pKBt7F97kW@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <871r7yd4gf.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thuth@redhat.com, ehabkost@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 david@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16, 2021 at 10:54:08AM +0200, Cornelia Huck wrote:
> On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > We need a s390x dedicated SMP parsing to handle s390x specificities.
> >
> > In this patch we only handle threads, cores and sockets for
> > s390x:
> > - do not support threads, we always have 1 single thread per core
> > - the sockets are filled one after the other with the cores
> >
> > Both these handlings are different from the standard smp_parse
> > functionement and reflect the CPU topology in the simple case
> > where all CPU belong to the same book.
> >
> > Topology levels above sockets, i.e. books, drawers, are not
> > considered at this stage and will be introduced in a later patch.
> >
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> >  hw/s390x/s390-virtio-ccw.c | 42 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index e4b18aef49..899d3a4137 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -582,6 +582,47 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
> >      return newsz;
> >  }
> >  
> > +/*
> > + * In S390CCW machine we do not support threads for now,
> > + * only sockets and cores.
> > + */
> > +static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
> 
> It seems you based this on an older version of the code? The current
> signature of this function since 1e63fe685804 ("machine: pass QAPI
> struct to mc->smp_parse") is
> 
> void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
> 
> That affects your parsing, and also lets you get rid of the ugly exit(1)
> statements.
> 
> > +{
> > +    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
> > +    unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
> > +    unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
> > +
> > +    if (opts) {
> > +        if (cpus == 0 || sockets == 0 || cores == 0) {
> 
> This behaviour looks different from what we do for other targets: if you
> specify the value as 0, a value is calculated from the other values;
> here, you error out. It's probably not a good idea to differ.

I increasingly worry that we're making a mistake by going down the
route of having custom smp_parse implementations per target, as this
is showing signs of inconsistent behaviour and error reportings. I
think the differences / restrictions have granularity at a different
level that is being tested in many cases too.

Whether threads != 1 is valid will likely vary depending on what
CPU model is chosen, rather than what architecture is chosen.
The same is true for dies != 1. We're not really checking this
closely even in x86 - for example I can request nonsense such
as a 25 year old i486 CPU model with hyperthreading and multiple
dies

  qemu-system-x86_64 -cpu 486 -smp 16,cores=4,dies=2,threads=2

In this patch, there is no error reporting if the user specifies
dies != 1 or threads != 1 - it just silently ignores the request
which is not good.

Some machine types may have constraints on CPU sockets.

This can of course all be handled by custom smp_parse impls, but
this is ultimately going to lead to alot of duplicated and
inconsistent logic I fear.

I wonder if we would be better off having machine class callback
that can report topology constraints for the current configuration,
along lines of

     smp_constraints(MachineState *ms,
                     int *max_sockets,
                     int *max_dies,
                     int *max_cores,
                     int *max_threads)

And then have only a single smp_parse impl that takes into account
these constraints, to report errors / fill in missing fields / etc ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


