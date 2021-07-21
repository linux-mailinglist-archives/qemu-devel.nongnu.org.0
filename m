Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AE3D1337
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:03:48 +0200 (CEST)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EhH-00062k-4g
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Ede-00037c-BV
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Eda-0001jG-4u
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626883196;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=j7zH2LDBctMOCpWMDNHTrhHf2CPCNJnl53ztOEz1gow=;
 b=i61144ABw93kT23sjznNDX0ltU6FGnlSGfDoRN9gxiQ1tVvp+dD3YwXPx5VjUe3m+BqHnP
 JjcPgGbRiQfCJlbZBbtiRRbWxs/AIyRvQy26l8tThjbE64TkO8auZEzfjdv9biEjtZkKS1
 qbvAsEB5BncUAe4igBPFjJkPeLxzUAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-moe5dbhpN5e0WHb1uVmc1Q-1; Wed, 21 Jul 2021 11:59:51 -0400
X-MC-Unique: moe5dbhpN5e0WHb1uVmc1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33DD10919BF;
 Wed, 21 Jul 2021 15:57:55 +0000 (UTC)
Received: from redhat.com (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 614977E464;
 Wed, 21 Jul 2021 15:57:50 +0000 (UTC)
Date: Wed, 21 Jul 2021 16:57:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Message-ID: <YPhD+7YFY7IbHn+n@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-3-peterx@redhat.com>
 <YPfu9N98PyTp7AKX@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPfu9N98PyTp7AKX@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 10:55:00AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > We have a logic in await_return_path_close_on_source() that we will explicitly
> > shutdown the socket when migration encounters errors.  However it could be racy
> > because from_dst_file could have been reset right after checking it but before
> > passing it to qemu_file_shutdown() by the rp_thread.
> > 
> > Fix it by shutdown() on the src file instead.  Since they must be a pair of
> > qemu files, shutdown on either of them will work the same.
> > 
> > Since at it, drop the check for from_dst_file directly, which makes the
> > behavior even more predictable.
> 
> So while the existing code maybe racy, I'm not sure that this change
> keeps the semantics; the channel may well have dup()'d the fd's for the
> two directions, and I'm not convinced that a shutdown() on one will
> necessarily impact the other; and if the shutdown doesn't happen the
> rp_thread might not exit, and we might block on the koin.

My understanding is that 'shutdown' operation affects the state of
the socket connection. An FD is merely the way a socket is exposed
to userspace. Thus if you have multiple FDs all pointing to the same
underlying socket (thanks to dup()), then I expect that the effects
of 'shutdown' will apply equally to all of the FD copies.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


