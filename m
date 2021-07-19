Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF3E3CDF83
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:53:37 +0200 (CEST)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VaK-0000RL-NO
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5VZF-0007wa-7N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5VZB-0007Qy-LF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626709945;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opqJo/oQaROxOQ4tP+4YjSba58IuzrLi4fNcxScD+QA=;
 b=djJRLOJkIGXFwGPgQkgEN2LgNIHkFO+wq2pZrI1WSHnDichcwqefoYzfsmhFQggeEso0Cj
 VIlYLu9+OLbX5WWx6bioF0djdofDXeEh1sLae6LPA05j+YmFl75/rBykJOqBe1PT0+1SPf
 CtsQ26+T9lZ3/ziCKyOEjOP3JeUHxP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-i2zr_LLkNDmJ8G4qsV2NdA-1; Mon, 19 Jul 2021 11:52:14 -0400
X-MC-Unique: i2zr_LLkNDmJ8G4qsV2NdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AE9E802E61;
 Mon, 19 Jul 2021 15:52:13 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B57B60877;
 Mon, 19 Jul 2021 15:52:05 +0000 (UTC)
Date: Mon, 19 Jul 2021 16:52:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
Message-ID: <YPWfol5y2pdK9mtC@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com> <YPFN83pKBt7F97kW@redhat.com>
 <e4865ad6-f8ec-e7ba-66ef-9c95334ba9b3@linux.ibm.com>
 <87fswa9un2.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fswa9un2.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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

On Mon, Jul 19, 2021 at 05:43:29PM +0200, Cornelia Huck wrote:
> (restored cc:s)
> 
> On Fri, Jul 16 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > On 7/16/21 11:14 AM, Daniel P. Berrangé wrote:
> >> I increasingly worry that we're making a mistake by going down the
> >> route of having custom smp_parse implementations per target, as this
> >> is showing signs of inconsistent behaviour and error reportings. I
> >> think the differences / restrictions have granularity at a different
> >> level that is being tested in many cases too.
> >> 
> >> Whether threads != 1 is valid will likely vary depending on what
> >> CPU model is chosen, rather than what architecture is chosen.
> >> The same is true for dies != 1. We're not really checking this
> >> closely even in x86 - for example I can request nonsense such
> >> as a 25 year old i486 CPU model with hyperthreading and multiple
> >> dies
> >> 
> >>    qemu-system-x86_64 -cpu 486 -smp 16,cores=4,dies=2,threads=2
> 
> Now that's what I'd call an upgrade :)
> 
> >> 
> >> In this patch, there is no error reporting if the user specifies
> >> dies != 1 or threads != 1 - it just silently ignores the request
> >> which is not good.
> >
> > yes, I should change this
> >
> >> 
> >> Some machine types may have constraints on CPU sockets.
> >> 
> >> This can of course all be handled by custom smp_parse impls, but
> >> this is ultimately going to lead to alot of duplicated and
> >> inconsistent logic I fear.
> >> 
> >> I wonder if we would be better off having machine class callback
> >> that can report topology constraints for the current configuration,
> >> along lines ofsmp_constraints(MachineState *ms,
> >> 
> >>       smp_constraints(MachineState *ms,
> >>                       int *max_sockets,
> >>                       int *max_dies,
> >>                       int *max_cores,
> >>                       int *max_threads)
> >
> > I find the idee good, but what about making it really machine agnostic 
> > by removing names and using a generic
> >
> > 	smp_constraints(MachineState *ms,
> > 			int *nb_levels,
> > 			int *levels[]
> > 			);
> >
> > Level can be replaced by another name like container.
> > The machine could also provide the level/container names according to 
> > its internal documentation.
> 
> In theory, this could give us more flexibility; however, wouldn't
> that still mean that the core needs to have some knowledge of the
> individual levels? We also have the command line parsing to consider,
> and that one uses concrete names (which may or may not make sense,
> depending on what machine you are trying to configure), and we'd still
> have to map these to 'levels'.

Yeah, we need to deal with names in several places, so I don't think
abstracting it in one place is desirable, as it introduces the need
to convert between the two and potentially obscures the semantics.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


