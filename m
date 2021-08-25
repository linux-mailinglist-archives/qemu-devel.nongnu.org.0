Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F93F70BE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:55:38 +0200 (CEST)
Received: from localhost ([::1]:58232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInl3-0006aE-I9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mInjw-0005tJ-Us
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:54:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mInjv-0003gX-Aj
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629878066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NOJNv/Kz4Y/j+VwgbbdbmkcOajUAKszuB3pinQWhbC8=;
 b=UwD0F9qJIAY8VRLee2BaWWN/x65X0YCubxCL6xS3AvKE7NLGe5dr5eDchU9CRHMhDIc9R1
 R/r/SQ78lVk8pDRsOz7L2WIvcJ3JOBt+NpgrGr7iwJmfIiX+tPlOir4su/D+wc3+Ac6AZi
 AdVnb2Z5mNOAND3ow3d9jXJz/6/ge8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-KS6DdbR8NJmY4o8vM-8Mag-1; Wed, 25 Aug 2021 03:54:24 -0400
X-MC-Unique: KS6DdbR8NJmY4o8vM-8Mag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CE2C100E422
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:54:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C3B69CB8;
 Wed, 25 Aug 2021 07:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8E3C11380A9; Wed, 25 Aug 2021 09:54:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/2] dump-guest-memory: Add blocker for migration
References: <20210824152721.79747-1-peterx@redhat.com>
Date: Wed, 25 Aug 2021 09:54:12 +0200
In-Reply-To: <20210824152721.79747-1-peterx@redhat.com> (Peter Xu's message of
 "Tue, 24 Aug 2021 11:27:19 -0400")
Message-ID: <87zgt66jtn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Gibson <dgibson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> Both dump-guest-memory and live migration have vm state cached internally.
> Allowing them to happen together means the vm state can be messed up.  Simply
> block live migration for dump-guest-memory.
>
> One trivial thing to mention is we should still allow dump-guest-memory even if
> -only-migratable is specified, because that flag should majorly be used to
> guarantee not adding devices that will block migration by accident.  Dump guest
> memory is not like that - it'll only block for the seconds when it's dumping.

I recently ran into a similarly unusual use of migration blockers:

    Subject: -only-migrate and the two different uses of migration blockers
     (was: spapr_events: Sure we may ignore migrate_add_blocker() failure?)
    Date: Mon, 19 Jul 2021 13:00:20 +0200 (5 weeks, 1 day, 20 hours ago)
    Message-ID: <87sg0amuuz.fsf_-_@dusky.pond.sub.org>

    We appear to use migration blockers in two ways:

    (1) Prevent migration for an indefinite time, typically due to use of
    some feature that isn't compatible with migration.

    (2) Delay migration for a short time.

    Option -only-migrate is designed for (1).  It interferes with (2).

    Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
    adds a migration blocker on realize, and deletes it on unrealize.  With
    -only-migrate, device realize fails.  Works as designed.

    Example for (2): spapr_mce_req_event() makes an effort to prevent
    migration degrate the reporting of FWNMIs.  It adds a migration blocker
    when it receives one, and deletes it when it's done handling it.  This
    is a best effort; if migration is already in progress by the time FWNMI
    is received, we simply carry on, and that's okay.  However, option
    -only-migrate sabotages the best effort entirely.

    While this isn't exactly terrible, it may be a weakness in our thinking
    and our infrastructure.  I'm bringing it up so the people in charge are
    aware :)

https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg04723.html

Downthread there, Dave Gilbert opined

    It almost feels like they need a way to temporarily hold off
    'completion' of migratio - i.e. the phase where we stop the CPU and
    write the device data;  mind you you'd also probably want it to stop
    cold-migrates/snapshots?


