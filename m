Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225836EEE2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:28:03 +0200 (CEST)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcASI-0003De-H1
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lcAIS-0003o4-8T
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lcAIP-0003WR-DB
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619716666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9f0rZVQf1diPevuokX4ABEJ2HpC9lZbwiTJDjh6jHao=;
 b=h4tK/836y9jrQE7HmyUzf4pElDB7Kg1IDk2VtDkVzt6nuqn0DUo5dQnY5VlVtV8LZW4jMQ
 bymtsnzdvDeZY3EoE5W7HkuXheLyniu6ypx5X/iEnaPFbhFQNSUCTagk+oC+I36ws5QD3u
 NM67g7rKPuYcEEBgM8dzG4aSjztip78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-J8uFrdAcOMqi0IiJ3tjV9g-1; Thu, 29 Apr 2021 13:17:42 -0400
X-MC-Unique: J8uFrdAcOMqi0IiJ3tjV9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53BB519253C5;
 Thu, 29 Apr 2021 17:17:41 +0000 (UTC)
Received: from localhost (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C35AA4EF63;
 Thu, 29 Apr 2021 17:17:33 +0000 (UTC)
Date: Thu, 29 Apr 2021 18:17:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: libnbd thread-local errors and dlclose (was: Re: [ANNOUNCE] libblkio
 v0.1.0 preview release)
Message-ID: <20210429171732.GX26415@redhat.com>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <20210429142259.GR26415@redhat.com>
 <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
 <20210429150038.GT26415@redhat.com> <YIrL5kE+0ULVN2lK@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YIrL5kE+0ULVN2lK@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 philmd@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 04:08:22PM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 29, 2021 at 04:00:38PM +0100, Richard W.M. Jones wrote:
> > On Thu, Apr 29, 2021 at 03:41:29PM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Apr 29, 2021 at 03:22:59PM +0100, Richard W.M. Jones wrote:
> > > > libvirt originally, and now libnbd, keep a per-thread error message
> > > > (stored in thread-local storage).  It's a lot nicer than having to
> > > > pass &errmsg to every function.  You can just write:
> > > > 
> > > >  if (nbd_connect_tcp (nbd, "remote", "nbd") == -1) {
> > > >    fprintf (stderr,
> > > >             "failed to connect to remote server: %s (errno = %d)\n",
> > > >             nbd_get_error (), nbd_get_errno ());
> > > >    exit (EXIT_FAILURE);
> > > >  }
> > > > 
> > > > (https://libguestfs.org/libnbd.3.html#ERROR-HANDLING)
> > > > 
> > > > It means you can extend the range of error information available in
> > > > future.  Also you can return a 'const char *' and the application
> > > > doesn't have to worry about lifetimes, at least in the common case.
> > > 
> > > Thanks for sharing the idea, I think it would work well for libblkio
> > > too.
> > > 
> > > Do you ignore the dlclose(3) memory leak?
> > 
> > I believe this mechanism in libnbd ensures there is no leak in the
> > ordinary shared library (not dlopen/dlclose) case:
> > 
> > https://gitlab.com/nbdkit/libnbd/-/blob/f9257a9fdc68706a4079deb4ced61e1d468f28d6/lib/errors.c#L35
> > 
> > However I'm not sure what happens in the dlopen case, so I'm going to
> > test that out now ...
> 
> pthread_key destructors are a disaster waiting to happen with
> dlclose, if the dlclose happens while non-main threads are
> still running. When those threads exit, they'll run the
> destructor which points to a function that is no longer
> resident in memory.

While libnbd had a memory leak there, now fixed by:

https://gitlab.com/nbdkit/libnbd/-/commit/026d281c57dd95485cc9bf829918b5efd9e32ddb

I don't actually think we have the bug you're describing.  We have a
destructor (errors_free()) which runs on dlclose, which deletes the
thread-local storage key, so the destructor will not run after the
library has been unloaded.

I added a test for this which works fine for me:

https://gitlab.com/nbdkit/libnbd/-/commit/831d142787aba4f5b638418e02cf7e0f2a051565

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


