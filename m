Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B5360FE2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:09:51 +0200 (CEST)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4Yv-0005Mx-Um
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX4Tk-0002JU-9v
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX4Th-000137-U2
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618502665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pr0Garrs95FpJMcGKKxXEef8NWB03hN4mxkp2JzawKg=;
 b=EUDKlf3K1+ZZBVoguqaOguksEHYD1seEYyunbTQJYZExaNA5z+08LvhbZZGNl4lf0gaDRi
 gNVf9n6pF6oTnwZHNsgTMmRi1PgF5DnGCDpGW9aCoxX4ffyo4wUJtKb9mAthNAje82LdRp
 2h0JQfXLf+WiDYWkGjDDxlfsZ4wmQTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-EiaFpxA3PJaXaSJZgDXVNg-1; Thu, 15 Apr 2021 12:04:19 -0400
X-MC-Unique: EiaFpxA3PJaXaSJZgDXVNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55075814256
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 16:04:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 831D910016DB;
 Thu, 15 Apr 2021 16:04:16 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:04:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YHhj/bo883jJ9ocy@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415154402.28424-1-vkuznets@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
> When a migration blocker is added nothing is reported to the user,
> inability to migrate such guest may come as a late surprise. As a bare
> minimum, we can print a warning. To not pollute the output for those, who
> have no intention to migrate their guests, introduce '--no-migration'
> option which both block the migration and eliminates warning from

I wonder how this is actually going to work in practice ?

At the time libvirt starts a guest, it has no idea whether the guest
is likely to need migration 3, 6, 12, 24 months in to the future.

IOW, we can't use a --no-migration flag and will be stuck with these
warnings no mtter what.

Is it possible to query the migration blockers via QMP ?

Libvirt recently introduced a new API 'virDomainGetMessages' which
lets us report a list of human targetted message strings against
a guest. We use it for reporting when an operation has tainted
a guest, and also use it for reporting when a deprecated QEMU
feature is used.  We could use it to report any migration
blockers that exist.

These are visible from 'virsh dominfo $guestname' and could also
be displayed by a mgmt application.

NB, the messages are intentionally declared opaque strings, so
mgmt apps shouldn't try to parse them. They merely know whether
the count is non-zero for any given message class.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


