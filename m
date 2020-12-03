Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776A2CD9F6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 16:18:21 +0100 (CET)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkqNA-0005YY-4S
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 10:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkqKq-0004G7-8M
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkqKj-0006JU-8b
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607008548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KEVzSR0/WjCxJZaMxPdW09tk7To83KQ0mBTy+N/F97s=;
 b=RMIk+BICDJ1nza/nR1dgcFTBUDDYekoElFE4wXJ996jjomAYcrz3bxwbYoPorWNlPBYKIR
 GVYR3/Tj5Mel3hLyDeVqAD0hRxK4e8Mx8CZCJiL7LperrBdvOgDFhvB30d/+2M0eckVQvg
 lC0veH5neEoaG5NY4vNuOaEVLP1UXXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ICkpsGwgMG6zc1QnKm4T4g-1; Thu, 03 Dec 2020 10:15:44 -0500
X-MC-Unique: ICkpsGwgMG6zc1QnKm4T4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF73D9CC0E;
 Thu,  3 Dec 2020 15:15:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F187718A2F;
 Thu,  3 Dec 2020 15:15:33 +0000 (UTC)
Date: Thu, 3 Dec 2020 16:15:32 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201203151532.GA5409@merkur.fritz.box>
References: <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
MIME-Version: 1.0
In-Reply-To: <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Am 03.12.2020 um 12:11 hat Paolo Bonzini geschrieben:
> On 02/12/20 18:35, Kevin Wolf wrote:
> > > Could we have an intermediate state that doesn't require any
> > > duplication and thus have no separate code paths that could
> > > diverge?
> > 
> > The one requirement we have for an intermediate state is that it
> > supports both interfaces: The well-know create/set properties/realize
> > dance, and a new DeviceClass method, say .create(), that takes the
> > configuration in parameters instead of relying on previously set
> > properties.
> > 
> > I assumed two separate implementations of transferring the configuration
> > into the internal state. On second thought, this assumption is maybe
> > wrong.
> > 
> > You can implement the new method as wrapper around the old way: It could
> > just set all the properties and call realize. Of course, you don't win
> > much in terms of improving the class implementation this way, but just
> > support the new interface, but I guess it can be a reasonable
> > intermediate step to resolve complicated dependencies etc.
> 
> I sketched something at https://wiki.qemu.org/Features/QOM-QAPI_integration.
> 
> The main difference with what we discussed so far is that it doesn't subsume
> the complete/realize step, only the setting of properties.  The idea is that
> user_creatable_add_type does the following:
> 
> - calls an oc->configure method on every superclass of the object
> 
> - takes what's left of the input visitor and uses it to set properties
> 
> - then calls ucc->complete
> 
> So in the end the only new step is the first.  If the first two steps are
> bundled in a new function object_configure, they can be reused for devices,
> machines and accelerators.
> 
> The QAPI code generator can also easily wrap them into a C API for QOM
> object creation.
> 
> I glossed completely over the generation of properties within the QAPI code
> generator.  Making properties read-only (or, in the field-properties world,
> having a default allow_set of "return false") is already a nice improvement
> over

I don't think this is an intermediate state like Eduardo wants to have.
Creating the object, then setting properties, then realize [1] will fail
after your change. But keeping it working was the whole point of the
exercise.

I'm also not really sure why you go from RngEgdOptions to QObject to a
visitor, only to reconstruct RngEgdOptions at the end. I think the class
implementations should have a normal C interface without visitors and we
should be able to just pass the existing RngEgdOptions object (or the
individual values for its fields for 'boxed': false).

Kevin

[1] Or complete for ucc, but the number of these is small enough that we
    don't really need any intermediate state, except maybe as a proof of
    concept for the later qdev conversion.


