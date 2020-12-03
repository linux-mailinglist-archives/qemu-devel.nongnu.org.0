Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838182CDCB0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:50:05 +0100 (CET)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksk0-0008G5-6H
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksdh-0003l9-Hf
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:43:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksde-0001u2-Vl
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607017409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AX266fy2BM0NugE8uybLXpkUQ6BueHlAhCxyLqGEE9w=;
 b=hsELMeCqN0qEbl86Bz9oqgbjsq9CF6x+hfg5vW07ulmLM6jHhERbyZOj43IcOkYViY0/iA
 pZ/9oSlaCftw9akuukPjlmly8+ZNkBwsskTjaNnUOSs2J0G6MX+dSwbS4hC7xjY+PEak6r
 e58xIxVg+YSmJdTi94URqtZD0ITD814=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-bm8o0uKGMeKGqwVVzNKa5g-1; Thu, 03 Dec 2020 12:43:27 -0500
X-MC-Unique: bm8o0uKGMeKGqwVVzNKa5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D6D10054FF;
 Thu,  3 Dec 2020 17:43:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA27100239A;
 Thu,  3 Dec 2020 17:43:18 +0000 (UTC)
Date: Thu, 3 Dec 2020 18:43:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201203174316.GC5409@merkur.fritz.box>
References: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
 <20201203151532.GA5409@merkur.fritz.box>
 <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.12.2020 um 17:50 hat Paolo Bonzini geschrieben:
> On 03/12/20 16:15, Kevin Wolf wrote:
> > I don't think this is an intermediate state like Eduardo wants to have.
> > Creating the object, then setting properties, then realize [1] will fail
> > after your change. But keeping it working was the whole point of the
> > exercise.
> 
> With the sample code, you must remove object_class_property_set calls at the
> same time as you remove the setters.  Usually that'd be when you convert to
> QAPI and oc->configure, but it doesn't have to be that way if there are good
> reasons not to do so.

Okay, thanks, I think I understand now.

So I assume that in the common case, we'll never have the state that you
describe, but we'll want to directly skip to QAPI generated code. But
it's good to know that we can make smaller steps if we need to in more
complicated cases.

> Also, it still allows you to do so one class at a time, and I *think* the
> presence of subclasses or superclasses doesn't matter (only whether
> properties are still writable).  We can use chardevs (see ChardevCommon in
> qapi/char.json) to validate that before tackling devices.

Yes, it looks like it should be working.

> (In fact, this means that your series---plus -object and object_add
> conversion---would be good, pretty much unchanged, as a first step.  The
> second would be adding oc->configure and object_configure, and converting
> all user-creatable objects to oc->configure.  The third would involve QAPI
> code generation).

I think I'd want to do step 2 and 3 combined, because converting
user-creatable objects to oc->configure means manually writing the
configure function that will be generated from QAPI in step 3. Writing
code just to throw it away isn't my favourite pastime.

> > I'm also not really sure why you go from RngEgdOptions to QObject to a
> > visitor, only to reconstruct RngEgdOptions at the end.
> 
> The two visits are just because you cannot create an input visitor directly
> on C data. I stole that from your patch 18/18 actually, just with
> object_new+object_configure instead of user_creatable_add_type.
> 
> But I wouldn't read too much in the automatically-generated *_new functions
> since they are already in QAPI code generator territory. Instead the basic
> object_configure idea can be applied even without having automatic code
> generation.

Yes, I was just wondering why we're going through visitors at all. But
this is what provides the compatibility with the old property system, so
it makes sense if you need an intermediate step.

> > I think the class
> > implementations should have a normal C interface without visitors and we
> > should be able to just pass the existing RngEgdOptions object (or the
> > individual values for its fields for 'boxed': false).
> 
> Sure, however that requires changes to the QAPI code generator which was
> only item (3) in your list list.  Until then you can already work with a
> visitor interface:
> 
>   void rng_egd_configure(Object *obj, Visitor *v, Error **errp)
>   {
>       RngEgd *s = RNG_EGD(obj);
>       s->config = g_new0(MemoryBackendOptions, 1);
>       visit_type_MemoryBackendOptions(v, NULL, &s->config, errp);
> 
>       s->config->share = (s->config->has_share
>                           ? s->config->share : false);
>       ...
>   }
> 
> but if you had a QAPI description
> 
>   { 'object': 'RngEgd',
>     'qom-type': 'rng-egd',
>     'configuration': 'RngEgdOptions',
>     'boxed': true
>   }
> 
> the QAPI generator could produce the oc->configure implementation. Similar
> to commands, that implementation would be an unmarshaling wrapper that calls
> out to the natural C interface:
> 
>   void qapi_RngEgd_configure(Object *obj, Visitor *v, Error **errp);
>   {
>       Error *local_err = NULL;
>       g_autoptr(MemoryBackendOptions) *config =
>           g_new0(MemoryBackendOptions, 1);
>       visit_type_MemoryBackendOptions(v, NULL, &s->config, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
>           return;
>       }
>       qom_rng_egd_configure(RNG_EGD(obj), config, errp);
>   }
> 
>   void qom_rng_egd_configure(RngEng *s,
>                              RngEgdOptions *config,
>                              Error **errp)
>   {
>       config->share = (config->has_share
>                        ? config->share : false);
>       ...
>       s->config = QAPI_CLONE(RngEgdOptions, config);
>   }

Yes, exactly.

Kevin


