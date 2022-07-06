Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD091568C5E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 17:10:20 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o96fT-00030M-CK
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 11:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o96d9-0002G7-5U
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 11:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o96d5-0008My-Fj
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 11:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657120069;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnfjMvQh1Xpf7vJeCWTv01zfP9vpl71/fBVm0MhyEiI=;
 b=fpbpE3D4XkaC1TlR62GQlOy4eTLBi7A45JorKlqqCOUQIUeeOAb+h2VY+jsnr+gBq8yL78
 M+RTkdZpY5ap6YE4uocOTNZOMGBfRhNN8c/wiapBBU7BP2oDPBG2ISz7L2FXrSDEcsLIw4
 hnTlkacR/yrepK61Jq9McMgmHA4q/GM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-uSBpzpeqP0GPLorNSSJfow-1; Wed, 06 Jul 2022 11:07:47 -0400
X-MC-Unique: uSBpzpeqP0GPLorNSSJfow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5CAA9693A3
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 15:07:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 891042026D64;
 Wed,  6 Jul 2022 15:07:45 +0000 (UTC)
Date: Wed, 6 Jul 2022 16:07:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
Message-ID: <YsWlP0A7CrHVaPdg@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
 <YsRrHbNAZCjmQUcL@redhat.com>
 <CABJz62Pr+7tSGKLpe+OQfhmW_SwaVwdeS2=vmieTjAioiCdV7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62Pr+7tSGKLpe+OQfhmW_SwaVwdeS2=vmieTjAioiCdV7Q@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 09:53:43AM -0500, Andrea Bolognani wrote:
> On Tue, Jul 05, 2022 at 05:47:25PM +0100, Daniel P. Berrangé wrote:
> > On Tue, Jul 05, 2022 at 08:45:54AM -0700, Andrea Bolognani wrote:
> > > On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> > > > func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
> > > >     return s.EventTimestamp
> > > > }
> > >
> > > Does this even need a getter? The struct member is public, and Go
> > > code seems to favor direct member access.
> >
> > It satisfies the 'Event' interface, so you can fetch timestamp
> > without needing to know the specific event struct you're dealing
> > with.
> 
> Yeah but we're generating structs for all possible events ourselves
> and we don't really expect external implementations of this
> interface so I don't see what having this getter buys us over the
> guarantee, that we have by construction, that all events will have a
> public member with a specific name that contains the timestamp.

Code doesn't neccessarily want to deal with the per-event type
structs. It is credible to want to work with the abstract 'Event'
interface in places and being able to get the Timestamp from that,
without figuring out what specific event struct to cast it to first.

> > I don't think this kind of detail really needs to be exposed to
> > clients. Also parsing the same json doc twice just feels wrong.
> >
> > I think using the dummy union structs is the right approach, but
> > I'd just call it 'EventFromJSON' rather than 'UnmarshalJSON' to
> > make it clear this is different from a normal 'UnmarshalJSON'
> > method.
> 
> Fair point on avoiding parsing the JSON twice.
> 
> I still don't like the fact that we have to force clients to use a
> non-standard API, or that the API for events has to be different from
> that for unions. But Go won't let you add method implementations to
> an interface, so we're kinda stuck.

I think this specific case is out of scope for the "standard" JSON
APIs, and somewhere you'd expect APIs to do their own thing a layer
above, which is what we're doing here.

More importantly though what we're generating in terms of QAPI derived
APIs should be thought of as only the first step. Ultimately I would
not expect clients to be marshalling / unmarshalling these structs at
all. So from that POV I think the question of "non-standard" APIs is
largely irrelevant. 

Instead we would be providing a "QMPClient" type with APIs for sending/
receiving instances of the 'Command'/'Response' interfaces, along with
callback(s) that receives instances of the 'Event' interface.  Any JSON
marshalling is hidden behind the scenes as an internal imlp detail.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


