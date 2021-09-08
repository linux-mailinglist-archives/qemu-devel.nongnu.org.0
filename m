Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A05403D87
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:22:17 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0L2-00087O-GY
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO0Jj-0006bs-JY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO0Jh-0004fC-FW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631118051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmzVOGmITu1GTwSD3igd6hXAycbp/67rlhISw5dhgBA=;
 b=HNPcJYzWwG183yqy8qk1jMe1CCsW3iCeojcDLjzI/G2rEMKrVEdOCnk5AVw610RdaickcR
 jiqoda4MipriNEQekx0wqaY1A69aQUZSArVMjdjAZPHdYSFrhwNlozG+6tYZ7ZQCldUemT
 BdJCZ7dz2gin4dyKpnMQ3ywmgKexZvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-zsR6qI0zMYazr713cXZJwA-1; Wed, 08 Sep 2021 12:20:48 -0400
X-MC-Unique: zsR6qI0zMYazr713cXZJwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CDD38145E6;
 Wed,  8 Sep 2021 16:20:47 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 304E31972E;
 Wed,  8 Sep 2021 16:20:47 +0000 (UTC)
Date: Wed, 8 Sep 2021 11:20:45 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 05/12] job: @force parameter for job_cancel_sync()
Message-ID: <20210908162045.32fbmtjgryunpr2w@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
 <20210907124245.143492-6-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210907124245.143492-6-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

On Tue, Sep 07, 2021 at 02:42:38PM +0200, Hanna Reitz wrote:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception,
> specifically the active commit job it runs.
> 
> As for job_cancel_sync_all(), all callers want it to force-cancel all
> jobs, because that is the point of it: To cancel all remaining jobs as
> quickly as possible (generally on process termination).  So make it
> invoke job_cancel_sync() with force=true.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/qemu/job.h                    | 10 ++---
>  block/replication.c                   |  4 +-
>  blockdev.c                            |  4 +-
>  job.c                                 | 18 ++++++--
>  tests/unit/test-blockjob.c            |  2 +-
>  tests/qemu-iotests/109.out            | 60 +++++++++++----------------
>  tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>  7 files changed, 50 insertions(+), 50 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


