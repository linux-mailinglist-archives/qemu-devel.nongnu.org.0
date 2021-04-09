Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392135A32D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:25:32 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtwp-0003Wp-1u
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnF-0006f5-1M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtn9-00032s-Qw
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSPV+5fOdd168GrVlIkk3nf2z9nRVEfdLZwN+fqkbPI=;
 b=QtuUSpG+BMpyxpe4xLpKMVYxzBLE225HbGfSmk8TEH6pdCmXwXTT3wI7DZ4LKlbEfE9Q2+
 4NznpziBRdfZ7U0UuJKwuFObkThb9oGsmm7DEeGJzXtQ8FMmUk6Vmn6DTDDal/R2cwZMgm
 s1qW9A6WzODf6gpuB7rTyf4f/qg6xb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-b4rL3Y5dPoiKC734BIL0OA-1; Fri, 09 Apr 2021 12:15:27 -0400
X-MC-Unique: b4rL3Y5dPoiKC734BIL0OA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D63687A83B;
 Fri,  9 Apr 2021 16:15:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DAB65C1D5;
 Fri,  9 Apr 2021 16:15:25 +0000 (UTC)
Date: Fri, 9 Apr 2021 18:15:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/4] job: Allow complete for jobs on standby
Message-ID: <YHB9nKI5x0D+nx5O@merkur.fritz.box>
References: <20210409120422.144040-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210409120422.144040-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2021 um 14:04 hat Max Reitz geschrieben:
> Hi,
> 
> We sometimes have a problem with jobs remaining on STANDBY after a drain
> (for a short duration), so if the user immediately issues a
> block-job-complete, that will fail.
> 
> (See also
> https://lists.nongnu.org/archive/html/qemu-block/2021-04/msg00215.html,
> which this series is an alternative for.)
> 
> Looking at the only implementation of .complete(), which is
> mirror_complete(), it looks like there is basically nothing that would
> prevent it from being run while mirror is paused.  Really only the
> job_enter() at the end, which we should not and need not do when the job
> is paused.
> 
> So make that conditional (patch 2), clean up the function on the way
> (patch 1, which moves one of its blocks to mirror_exit_common()), and
> then we can allow job_complete() on jobs that are on standby (patch 3).
> 
> Patch 4 is basically the same test as in
> https://lists.nongnu.org/archive/html/qemu-block/2021-04/msg00214.html,
> except some comments are different and, well, job_complete() just works
> on STANDBY jobs.
> 
> Patch 5 is an iotest that may or may not show the problem for you.  I’ve
> tuned the numbers so that on my machine, it fails about 50/50 without
> this series (i.e., the job is still on STANDBY and job_complete()
> refuses to do anything).
> 
> I’m not sure we want that iotest, because it does quite a bit of I/O and
> it’s unreliable, and I don’t think there’s anything I can do to make it
> reliable.

Thanks, applied patches 1-4 to the block branch.

Kevin


