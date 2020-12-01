Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C662CAABD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:31:09 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAQe-0004vB-HQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkAOb-0004Ox-Py
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkAOY-00042A-Fy
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606847335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=njg6IPctWBElVVsNVOr/xGIC1RDnU/exymoUsbJohWY=;
 b=DKuawUdJBhzR2IZqSYm2jonw0K9oWKZRV3ilK5u9aC6BywgAmIXQDqw0PUatfldCrlM6ul
 B9ujfxnmx9NzjZ8IzRYu1HKXpm/jm9mg7rn+RzACcrYFtvbIOLtIFSbqVYURjJNyWNLOtV
 NzGPl6KzY4vfduDtJgnQ2sz3Y/CMKoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-2ao4uNAYN5mCAf1BiJKX-w-1; Tue, 01 Dec 2020 13:28:53 -0500
X-MC-Unique: 2ao4uNAYN5mCAf1BiJKX-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4860A9A22D;
 Tue,  1 Dec 2020 18:28:52 +0000 (UTC)
Received: from localhost (ovpn-117-173.rdu2.redhat.com [10.10.117.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61F4210013BD;
 Tue,  1 Dec 2020 18:28:45 +0000 (UTC)
Date: Tue, 1 Dec 2020 13:28:43 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201201182843.GM2271382@habkost.net>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
MIME-Version: 1.0
In-Reply-To: <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 06:16:14PM +0100, Paolo Bonzini wrote:
> On 01/12/20 17:20, Kevin Wolf wrote:
[...]
> > BlockdevOptions is about external interfaces, not about
> > implementation details. Same thing as QOM properties are external
> > interfaces, not implementation details. There may be fields in the
> > internal state that correspond 1:1 to the externally visible QAPI
> > type/QOM property, but it's not necessarily the case.
> 
> Right.  It may well be that we decide that, as a result of this series,
> QOM's property interface is declared essentially a failed experiment.  I
> wouldn't be surprised, and that's why I want to understand better where we
> want to go.
> 
> For example, Eduardo is focusing specifically on external interfaces that
> correspond 1:1 to the internal implementation.  If we decide that
> non-1:1-mappings and checks on mandatory properties are an important part of
> QOM, that may make large parts of his work moot.  [...]

Whatever we decide, my first and biggest worry is to have a
reasonable migration path for any new API.

We could describe in detail what's the API we _want_, but we also
need a reasonable migration path for the code we already _have_.
If a new API that requires manual conversion of existing devices,
it will probably coexist with the existing qdev property API for
years.

(Note that I haven't read this whole thread yet.)

>                                            [...]  If we decide that most QOM
> objects need no properties at all, then we don't want to move more
> qdev-specific stuff from to QOM.

I don't understand what "move more qdev-specific stuff to QOM"
means.  I consider the QOM field property API valuable even if we
decide the only user of the API will be legacy qdev code, because
it separates the core mechanism (that's code that already
existed) from qdev-specific policies.

> 
> > QAPI is already here and it's going to stay. QOM doesn't have to
> > duplicate input validation that existing code can already perform.
> > 
> > I'm not sure which complexity you think I'm introducing: QAPI is already
> > there. I'm adding the schema, which you agree is valuable documentation,
> > so we want to have it either case. The actual change to QOM that we have
> > in this series is this:
> 
> The complexity is that properties used to be split in two places, and now
> they're split in three places.
> 
> It may very well be that this is a good first step to at least have classes
> described in the QAPI schema.  But since _in the short term_ there are
> things that the series makes worse (and has a risk of bringing things out of
> sync), I'd like to understand the long term plan and ensure that the QAPI
> maintainers are on board with it.
> 
> Can you at least add a comment to all UserCreatable classes that says "if
> you add a property, remember to modify ... as well in the QAPI schema"?
> 
> > > Are there any validation bugs that you're fixing?  Is that
> > > something that cannot be fixed elsewhere, or are you papering over bad QOM
> > > coding?  (Again, I'm not debating that QOM properties are hard to write
> > > correctly).
> > 
> > Yes, I found bugs that the QAPI schema would have prevented. They were
> > generally about not checking whether mandatory propertes are actually
> > set.
> 
> Okay, I found your series at
> https://patchew.org/QEMU/20201130105615.21799-1-kwolf@redhat.com/ too, good
> to know.
> 
> So that's another useful thing that can be chalked to this series at least
> if -object and object_add are converted (and also, another thing against QOM
> properties and 1:1 mappings between configuration schema and run-time
> state).
> 
> Paolo
> 

-- 
Eduardo


