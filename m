Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D080D3648F2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:19:31 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXYY-00054m-Ug
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXWb-0003fF-Ar
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXWZ-0001V3-FZ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618852646;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAKZ9MQoHBN2UjEBQf17RiyxOdcggKK4IvUc3hiqPL8=;
 b=BcpDd+ZIv4HX9vXcA4uPmzyBUvxpquJyB1nNM41PVOMR3Kldxz1+6p0hhapYXYHa5kisNQ
 JKKzC8ZE+RUBiwJZrOkSb7N6E7v0bQ+dhUA1gd8ytct5u7NE7wgzrlL4lhV1iDszwh0VIn
 QGPCX9OvyzHagryNzDDD5ZpgYjOwIgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-N5eK1w5TOwaftFDm64dDNA-1; Mon, 19 Apr 2021 13:17:25 -0400
X-MC-Unique: N5eK1w5TOwaftFDm64dDNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4880D102C863
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 17:17:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81E5F5D9CC;
 Mon, 19 Apr 2021 17:17:22 +0000 (UTC)
Date: Mon, 19 Apr 2021 18:17:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH27H6VmKGXdA4H7@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
 <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
 <YH2509yA7qkYFJ0p@work-vm> <YH26x8TkpT5zsgst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YH26x8TkpT5zsgst@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 06:15:56PM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 19, 2021 at 06:11:47PM +0100, Dr. David Alan Gilbert wrote:
> > * Eduardo Habkost (ehabkost@redhat.com) wrote:
> > > I would make live migration policy an enum, just to make sure
> > > we are explicit about the requirements:
> > > 
> > > - UNKNOWN: this is the current state in QEMU 6.0, where we don't
> > >   really know what the user expects.
> > >   This can be the default on existing versioned machine types,
> > >   just for compatibility.
> > >   I suggest making this print warnings for every migration
> > >   blocker (like this patch does).
> > >   I suggest deprecating this behavior as soon as we can.
> > > 
> > > - PREFERRED: try to make the VM migratable when possible, but
> > >   don't print a warning or error out if migration is blocked.
> > >   This seems to be the behavior expected by libvirt today.
> > > 
> > > - NOT_NEEDED: live migration is not needed, and QEMU is free to
> > >   enable features that block live migration or change guest ABI.
> > >   We can probably make this the default on machine types that
> > >   never supported live migration.
> > 
> > I suggest you could do this by adding:
> >   -warn-none-migratable
> >   -no-warn-none-migratable
> > 
> > and then argue about defaults another time.
> 
> If we're going to add new args, lets at least future proof our
> approach with an extensible option that we can wire into QMP
> too later
> 
>   -migratable  none|preferred|required 
> 
> and letting us add extra key/value pairs to tune it if desired.

Having said that, we potentially don't need a dedicated arg if we
just make  'migratable=none|preferred|required' be a property of
the machine type and hook everything off that

> 
> > > - REQUIRED: live migration is required, and adding a migration
> > >   blocker would be a fatal error.
> > >   This is already implemented by --only-migratable.
> > >   I suggest making this the default on versioned machine types
> > >   after a few releases, and after deprecating UNKNOWN.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


