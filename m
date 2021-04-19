Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62842364A17
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:50:49 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYys-0008U4-2y
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYYw2-0007wY-De
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYYvz-0005Fb-U6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618858066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DM19RkQz2BKsH3+TOjdHN0V9WXnnXwh7XYbIfe0Cp74=;
 b=OMDdd4kqfLWqaVHThiRfQd6+LrlKBiMQld55w0r9qklRSRLWLkoURmsb+7l1JnoBHMdwN/
 j1AvA0QroFqgBYAv4xpmfaqRtY4/ddocDJv10Lr8jS9N3Xlg7L4qUUlrAwe8LkiscVXcdB
 THGzml0lgRf5gTdkuhABbWM7tAT7qg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-lv3O0RWpNCa7PgftVd84yg-1; Mon, 19 Apr 2021 14:47:39 -0400
X-MC-Unique: lv3O0RWpNCa7PgftVd84yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01BB19251A2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 18:47:38 +0000 (UTC)
Received: from work-vm (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BDC10027C4;
 Mon, 19 Apr 2021 18:47:37 +0000 (UTC)
Date: Mon, 19 Apr 2021 19:47:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH3QRs7VUapXZaTj@work-vm>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
 <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
 <YH2509yA7qkYFJ0p@work-vm> <YH26x8TkpT5zsgst@redhat.com>
 <YH27H6VmKGXdA4H7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YH27H6VmKGXdA4H7@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Apr 19, 2021 at 06:15:56PM +0100, Daniel P. Berrangé wrote:
> > On Mon, Apr 19, 2021 at 06:11:47PM +0100, Dr. David Alan Gilbert wrote:
> > > * Eduardo Habkost (ehabkost@redhat.com) wrote:
> > > > I would make live migration policy an enum, just to make sure
> > > > we are explicit about the requirements:
> > > > 
> > > > - UNKNOWN: this is the current state in QEMU 6.0, where we don't
> > > >   really know what the user expects.
> > > >   This can be the default on existing versioned machine types,
> > > >   just for compatibility.
> > > >   I suggest making this print warnings for every migration
> > > >   blocker (like this patch does).
> > > >   I suggest deprecating this behavior as soon as we can.
> > > > 
> > > > - PREFERRED: try to make the VM migratable when possible, but
> > > >   don't print a warning or error out if migration is blocked.
> > > >   This seems to be the behavior expected by libvirt today.
> > > > 
> > > > - NOT_NEEDED: live migration is not needed, and QEMU is free to
> > > >   enable features that block live migration or change guest ABI.
> > > >   We can probably make this the default on machine types that
> > > >   never supported live migration.
> > > 
> > > I suggest you could do this by adding:
> > >   -warn-none-migratable
> > >   -no-warn-none-migratable
> > > 
> > > and then argue about defaults another time.
> > 
> > If we're going to add new args, lets at least future proof our
> > approach with an extensible option that we can wire into QMP
> > too later
> > 
> >   -migratable  none|preferred|required 
> > 
> > and letting us add extra key/value pairs to tune it if desired.
> 
> Having said that, we potentially don't need a dedicated arg if we
> just make  'migratable=none|preferred|required' be a property of
> the machine type and hook everything off that

I think my only difficulty with that is that I don't find any of those
3 words 'obvious'.

Dave

> > 
> > > > - REQUIRED: live migration is required, and adding a migration
> > > >   blocker would be a fatal error.
> > > >   This is already implemented by --only-migratable.
> > > >   I suggest making this the default on versioned machine types
> > > >   after a few releases, and after deprecating UNKNOWN.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


