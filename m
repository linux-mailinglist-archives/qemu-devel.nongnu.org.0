Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFC3E2FC0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 21:17:39 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC5Le-00055x-1H
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 15:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC5KJ-0004Io-TP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC5KG-0007gq-C2
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628277370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3R/LyThbWidE8z1xmDUaWTES7IsInHC5Nl/uGRlAck=;
 b=QQFZcA1otBoFMd/ilfREdNYbdD0XyqUq5IrbxiPo0s6wgJEDH6XjLWcB47VxrIjQkpjPUy
 BuZE/Piu/XGhABVdy0TUYMBYUeZLl2+HHHonMB4V6inrzTA/55okbmaGjmmNbBHh+DZMa+
 mdab34+ZnnvUCJBH/gs9fPvnKxtMHZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-uy51rk3nPiWmoywZvG4pvg-1; Fri, 06 Aug 2021 15:16:08 -0400
X-MC-Unique: uy51rk3nPiWmoywZvG4pvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37206871803;
 Fri,  6 Aug 2021 19:16:07 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F11B1036D06;
 Fri,  6 Aug 2021 19:16:06 +0000 (UTC)
Date: Fri, 6 Aug 2021 14:16:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.2 v3 01/12] job: Context changes in
 job_completed_txn_abort()
Message-ID: <20210806191604.le6nsksvueq5b3tn@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-2-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210806093859.706464-2-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06, 2021 at 11:38:48AM +0200, Max Reitz wrote:
> Finalizing the job may cause its AioContext to change.  This is noted by
> job_exit(), which points at job_txn_apply() to take this fact into
> account.
> 
> However, job_completed() does not necessarily invoke job_txn_apply()
> (through job_completed_txn_success()), but potentially also
> job_completed_txn_abort().  The latter stores the context in a local
> variable, and so always acquires the same context at its end that it has
> released in the beginning -- which may be a different context from the
> one that job_exit() releases at its end.  If it is different, qemu
> aborts ("qemu_mutex_unlock_impl: Operation not permitted").

Is this a bug fix that needs to make it into 6.1?

> 
> Drop the local @outer_ctx variable from job_completed_txn_abort(), and
> instead re-acquire the actual job's context at the end of the function,
> so job_exit() will release the same.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  job.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

The commit message makes sense, and does a good job at explaining the
change.  I'm still a bit fuzzy on how jobs are supposed to play nice
with contexts, but since your patch matches the commit message, I'm
happy to give:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


