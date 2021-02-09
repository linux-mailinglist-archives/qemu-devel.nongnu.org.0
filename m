Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD6315399
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:16:58 +0100 (CET)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VhB-00043i-OT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9VeG-0001vM-Ut
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9VeE-0006z0-JF
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612887233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuisdI+PPEnAlDv2vwvrweoiB88cL497k0m9hlhWf1E=;
 b=hDloWH3pUj3WugJHaiCPexONLeAvReU9Y8lH72w/1Hw6RDaABWe81iwhNnp59UTbBLmX/R
 BcVFtA9slVTuwTB0MMUW6mTvzLS5COtiXgwdNn+qoQFHTu2VNFcCuNukO1+a0eoC3pudu3
 kq9R5ncE3iZw+AwS8qIoCmOGapLtYAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-jaDg_at7NEuiQWM8cuq1OQ-1; Tue, 09 Feb 2021 11:13:52 -0500
X-MC-Unique: jaDg_at7NEuiQWM8cuq1OQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017AB1020C20;
 Tue,  9 Feb 2021 16:13:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EF5119C78;
 Tue,  9 Feb 2021 16:13:47 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:13:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
Message-ID: <20210209161343.GT1166421@redhat.com>
References: <20210209152759.209074-1-eblake@redhat.com>
 <20210209152759.209074-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209152759.209074-2-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, rjones@redhat.com,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 09:27:58AM -0600, Eric Blake wrote:
> Our default of a backlog of 1 connection is rather puny; it gets in
> the way when we are explicitly allowing multiple clients (such as
> qemu-nbd -e N [--shared], or nbd-server-start with its default
> "max-connections":0 for unlimited), but is even a problem when we
> stick to qemu-nbd's default of only 1 active client but use -t
> [--persistent] where a second client can start using the server once
> the first finishes.  While the effects are less noticeable on TCP
> sockets (since the client can poll() to learn when the server is ready
> again), it is definitely observable on Unix sockets, where on Unix, a
> client will fail with EAGAIN and no recourse but to sleep an arbitrary
> amount of time before retrying if the server backlog is already full.
> 
> Since QMP nbd-server-start is always persistent, it now always
> requests a backlog of SOMAXCONN; meanwhile, qemu-nbd will request
> SOMAXCONN if persistent, otherwise its backlog should be based on the
> expected number of clients.
> 
> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> CC: qemu-stable@nongnu.org
> ---
>  blockdev-nbd.c |  7 ++++++-
>  qemu-nbd.c     | 10 +++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


