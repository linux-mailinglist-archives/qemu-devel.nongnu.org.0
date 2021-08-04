Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0CB3DFFC7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:03:29 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBEgK-00043O-3X
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mBEdh-0001or-Hy
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mBEde-0002Rz-39
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628074833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hGKcRav4QXDhh+3w7z8GI7/Sl6TzrnwCRmF3sd7ZTM=;
 b=WagzYDI/EAtO4XUtVgBGe5tUSq4yjarQyprf63x8olb6fXayVDIqPPds3uvtV7WpsNjFU/
 o02/E0AmlVIWLecbHfGUGehAjs2BF86akHyvzIxNVqoIu6fJUZ/QLowM1XTcD4qypqJFG4
 ypKSOpfUqjD8AIV6wD2n+AFQjfph7PA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204--EgrugYYObKCoEs4kJiCow-1; Wed, 04 Aug 2021 07:00:32 -0400
X-MC-Unique: -EgrugYYObKCoEs4kJiCow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD451074661;
 Wed,  4 Aug 2021 11:00:31 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F07421F;
 Wed,  4 Aug 2021 11:00:12 +0000 (UTC)
Date: Wed, 4 Aug 2021 13:00:09 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
Message-ID: <YQpzOcQGXlrOh/0h@angien.pipo.sk>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <YQlRzOzXOxeBLb0B@redhat.com>
 <13d07f4b-9659-4576-1757-a7d75f7e16c2@redhat.com>
 <YQptN0CLpV5MN5kb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YQptN0CLpV5MN5kb@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 12:34:31 +0200, Kevin Wolf wrote:
> We could in theory keep allowing redundant completion requests when the
> completion mode doesn't conflict, but I don't see the point of that.

I don't see either. Especially since ...



> Unless libvirt can actually issue multiple completion requests (again,
> this includes both (block-)job-complete and non-force block-job-cancel
> for mirror) for the same block job - Peter, I hope it doesn't?

... the regular job completion code in libvirt which is meant for user
interaction (qemuDomainBlockJobAbort) has the following interlock:

    if (job->state == QEMU_BLOCKJOB_STATE_ABORTING ||
        job->state == QEMU_BLOCKJOB_STATE_PIVOTING) {
        virReportError(VIR_ERR_OPERATION_INVALID,
                       _("block job on disk '%s' is still being ended"),
                       disk->dst);
        goto endjob;
    }

.. the other two uses of blockjobs are internal for handling migration
with non shared storage and there we also issue exactly one cancel
request and backup jobs were we too make sure to cancel it just once.

As of such it's okay to forbid the case you are mentioning.


