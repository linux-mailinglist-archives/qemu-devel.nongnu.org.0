Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68E20CFC5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 17:42:46 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpvvh-0004Iv-I9
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 11:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jpvuI-0003PL-Ax
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:41:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22719
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jpvuF-0004hq-Es
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593445274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FN6IQuSjKdpjy/d+UT0a03n55FN0SkUz5mdWRzX69g=;
 b=OB/DFPqzgl8YKJu1cWGc822h62+yvbpJb9hcnZ5w7bSYbR13dPJBVuhhHBC3nDfw5uRmvk
 DjccqJ+CYn8rU/To+bKKJQNPZznB9HsOvz/hPGLPrNuq5WoRHQ7scheXfxaJohwl08bAfn
 J4gdj9eGxpS2YlsvoYig0GUyrCnPccw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-PVbP2JHnMzGFZlfLfEep-A-1; Mon, 29 Jun 2020 11:41:09 -0400
X-MC-Unique: PVbP2JHnMzGFZlfLfEep-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40480800C60;
 Mon, 29 Jun 2020 15:41:08 +0000 (UTC)
Received: from work-vm (ovpn-114-210.ams2.redhat.com [10.36.114.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7705D9C9;
 Mon, 29 Jun 2020 15:41:06 +0000 (UTC)
Date: Mon, 29 Jun 2020 16:41:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: Properly quitting qemu immediately after failing migration
Message-ID: <20200629154104.GK2908@work-vm>
References: <0dce6c63-4b83-8b1a-6d00-07235f637997@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0dce6c63-4b83-8b1a-6d00-07235f637997@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Max Reitz (mreitz@redhat.com) wrote:
> Hi,
> 
> In an iotest, I’m trying to quit qemu immediately after a migration has
> failed.  Unfortunately, that doesn’t seem to be possible in a clean way:
> migrate_fd_cleanup() runs only at some point after the migration state
> is already “failed”, so if I just wait for that “failed” state and
> immediately quit, some cleanup functions may not have been run yet.

Yeh this is hard; I always take the end of migrate_fd_cleanup to be the
real end.
It always happens on the main thread I think (it's done as a bh in some
cases).

> This is a problem with dirty bitmap migration at least, because it
> increases the refcount on all block devices that are to be migrated, so
> if we don’t call the cleanup function before quitting, the refcount will
> stay elevated and bdrv_close_all() will hit an assertion because those
> block devices are still around after blk_remove_all_bs() and
> blockdev_close_all_bdrv_states().
> 
> In practice this particular issue might not be that big of a problem,
> because it just means qemu aborts when the user intended to let it quit
> anyway.  But on one hand I could imagine that there are other clean-up
> paths that should definitely run before qemu quits (although I don’t
> know), and on the other, it’s a problem for my test.

'quit' varies - there are a lot of incoming failures that just assert;
very few of them cause a clean exit (I think there are more clean ones
after Peter's work on restartable postcopy a year or two ago).

I do see the end of migrate_fd_cleanup calls the notifier list; but it's
not clear to me that it's alwyas going to see the first transition to
'failed' at that point.

> I tried working around the problem for my test by waiting on “Unable to
> write” appearing on stderr, because that indicates that
> migrate_fd_cleanup()’s error_report_err() has been reached.  But on one
> hand, that isn’t really nice, and on the other, it doesn’t even work
> when the failure is on the source side (because then there is no
> s->error for migrate_fd_cleanup() to report).
> 
> In all, I’m asking:
> (1) Is there a nice solution for me now to delay quitting qemu until the
> failed migration has been fully resolved, including the clean-up?

In vl.c, I added a call to migration_shutdown in qemu_cleanup - although
that seems to be mostly about cleaning up the *outgoing* side; you could
add some incoming cleanup there.

> (2) Isn’t it a problem if qemu crashes when you issue “quit” via QMP at
> the wrong time?  Like, maybe lingering subprocesses when using “exec”?

Yeh that should be cleaner, but isn't.

Dave

> 
> Thanks,
> 
> Max
> 



--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


