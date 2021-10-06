Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8E4248C2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 23:20:05 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYEKa-0002fi-5Y
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 17:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYEJC-0001EC-9F
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYEIu-0001ex-9b
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633555098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRbeT+5+y+6xRnAeD70E3cPHJpMfw47kA9wFQ+KMDRs=;
 b=gvcRgRGv6Jq8lk6VXPl1l9sMQApettEcypKYO0wTDML/rQjSm3B49DGgPvL5OiKvgKo1oV
 qmjejk7XrnIsob8RDkV20SHCmjRULOGCseFdYrtgzxs/F2lq9Y5cANPwW4/YhUurIie3jc
 Si9iFfRSCkwZX7JC1LTWLl2MmT6bm7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-R1jSIUPFNwaJMsKDtd61eA-1; Wed, 06 Oct 2021 17:18:13 -0400
X-MC-Unique: R1jSIUPFNwaJMsKDtd61eA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6456F5074D;
 Wed,  6 Oct 2021 21:18:11 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 823935D9CA;
 Wed,  6 Oct 2021 21:18:10 +0000 (UTC)
Date: Wed, 6 Oct 2021 16:18:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 07/13] job: Do not soft-cancel after a job is done
Message-ID: <20211006211808.duu2iaibyj6coxv2@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
 <20211006151940.214590-8-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006151940.214590-8-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 06, 2021 at 05:19:34PM +0200, Hanna Reitz wrote:
> The only job that supports a soft cancel mode is the mirror job, and in
> such a case it resets its .cancelled field before it leaves its .run()
> function, so it does not really count as cancelled.
> 
> However, it is possible to cancel the job after .run() returns and
> before job_exit() (which is run in the main loop) is executed.  Then,
> .cancelled would still be true and the job would count as cancelled.
> This does not seem to be in the interest of the mirror job, so adjust
> job_cancel_async() to not set .cancelled in such a case, and
> job_cancel() to not invoke job_completed_txn_abort().
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  job.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


