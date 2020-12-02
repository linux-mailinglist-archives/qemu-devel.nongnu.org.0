Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87E2CBDFD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:12:09 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRvT-0000Nq-P1
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkRuB-0008MY-5y
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkRu8-0002uu-Gs
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606914643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQW1ed4lBYv2BxF6IRINz4BF1yJlh7UK3ivTPvBHgc0=;
 b=EEvbhXq1A+oEj8g2yOTlR+TTp/U0R49bZB2vqk6DRDsUPDJIjRbZ9kMBAnBpW1EAYHqETc
 m3HyK80QYtrFGlH8YUaRrj5I7dGufiI9kVZE6ewGhhGt6VpgPHcoqu3/Yc1igD7rKxa/by
 u0EGrNy6H7c8NU7dn0KbJkqiL0YH6FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-faKFYk6iOSKySyk7w7PaNg-1; Wed, 02 Dec 2020 08:10:42 -0500
X-MC-Unique: faKFYk6iOSKySyk7w7PaNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2026B101AFB4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 13:10:41 +0000 (UTC)
Received: from work-vm (unknown [10.33.36.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466945D9C6;
 Wed,  2 Dec 2020 13:10:40 +0000 (UTC)
Date: Wed, 2 Dec 2020 13:10:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
Message-ID: <20201202131037.GF3226@work-vm>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
 <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 20/11/20 16:34, Igor Mammedov wrote:
> > >       qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> > > -    if (!strcmp(uri, "defer")) {
> > > -        deferred_incoming_migration(errp);
> > > -    } else if (strstart(uri, "tcp:", &p) ||
> > > -               strstart(uri, "unix:", NULL) ||
> > > -               strstart(uri, "vsock:", NULL)) {
> > considering the last hunk does won't call qmp_migrate_incoming
> > if 'defer' was used, wouldn't we will lose QAPI event here?
> > not sure how important it to users,
> 
> Hmm yeah that's true.  That might even be considered a bugfix (no setup is
> done until the "real" migrate-incoming command), but I can also add the
> event manually in qemu_init.
> 
> (Libvirt doesn't use the SETUP case of the event but that's of course only
> part of the story).

I'm more worried about how this stops a repeated 'migrate incoming'
or a 'migrate_incoming' that's issued following a qemu that's been
started with -incoming tcp:... but which a socket hasn't yet connected
to.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


