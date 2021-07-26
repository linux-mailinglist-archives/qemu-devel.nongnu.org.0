Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831E3D68CD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:40:04 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88KQ-0007D4-MR
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m88JV-0006Ok-63
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m88JR-00009L-IK
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627335540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMDtVcleQq6s0YU4e2AEJ+pVl+IDzEQoC8YG6Lp9CTM=;
 b=S4SZVBFrb0SL/tLHeHJpPSoPNO8rZI6CAcXVZcAL94nSjBzHWHzmsztfF9fBEW7o6Wov7Z
 8jh5Eh/wl7+AN4/LJnCojaBnLYZQANRmbj35GGhSvqpMBktsXqFVleG4W3vTLuPqWvTyVG
 zhF4ElvMPZCyIzZSI+0gEiyHqc7DrNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-KytFabGTNUyLzQq0qer5WA-1; Mon, 26 Jul 2021 17:38:57 -0400
X-MC-Unique: KytFabGTNUyLzQq0qer5WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35DC4871805;
 Mon, 26 Jul 2021 21:38:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87AEC60C5F;
 Mon, 26 Jul 2021 21:38:55 +0000 (UTC)
Date: Mon, 26 Jul 2021 16:38:53 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 4/7] jobs: Give Job.force_cancel more meaning
Message-ID: <20210726213853.n7pp5sklriztmn7g@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-5-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-5-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-647-5d4e008
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 04:46:10PM +0200, Max Reitz wrote:
> We largely have two cancel modes for jobs:
> 
> First, there is actual cancelling.  The job is terminated as soon as
> possible, without trying to reach a consistent result.
> 
> Second, we have mirror in the READY state.  Technically, the job is not
> really cancelled, but it just is a different completion mode.  The job
> can still run for an indefinite amount of time while it tries to reach a
> consistent result.
> 
> We want to be able to clearly distinguish which cancel mode a job is in
> (when it has been cancelled).  We can use Job.force_cancel for this, but
> right now it only reflects cancel requests from the user with
> force=true, but clearly, jobs that do not even distinguish between
> force=false and force=true are effectively always force-cancelled.
> 
> So this patch has Job.force_cancel signify whether the job will
> terminate as soon as possible (force_cancel=true) or whether it will
> effectively remain running despite being "cancelled"
> (force_cancel=false).
> 
> To this end, we let jobs that provide JobDriver.cancel() tell the
> generic job code whether they will terminate as soon as possible or not,
> and for jobs that do not provide that method we assume they will.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/qemu/job.h | 11 ++++++++++-
>  block/backup.c     |  3 ++-
>  block/mirror.c     | 24 ++++++++++++++++++------
>  job.c              |  6 +++++-
>  4 files changed, 35 insertions(+), 9 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


