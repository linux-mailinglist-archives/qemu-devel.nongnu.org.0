Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3593E306B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:37:44 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6b9-0008JZ-CT
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6aP-0007Vm-85
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6aN-0004x6-P9
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628282215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jlvCeVgJiXqQvYNqLKa27veWPrJmBk0maDpTfVzzPj0=;
 b=b2IqrtGGHeg9Gldv/ftHyQFsIp3qQukD4/sSidtBDlgu2GSK5PcdHcS+iTOsmhXHizGxis
 G5uFFFu4AW6brhZSZLwmt20FPwk9G3gBzhmT+XO+yfZqxnZZOJiZkvsyYQEdRAgSSqEdds
 grOExtoHDKLu+njFJEBJKAxtIBfpafg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-kkj88SlRMjORzDksAr81-w-1; Fri, 06 Aug 2021 16:36:52 -0400
X-MC-Unique: kkj88SlRMjORzDksAr81-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 241F4CC624;
 Fri,  6 Aug 2021 20:36:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC07F60C04;
 Fri,  6 Aug 2021 20:36:50 +0000 (UTC)
Date: Fri, 6 Aug 2021 15:36:49 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.2 v3 09/12] mirror: Check job_is_cancelled() earlier
Message-ID: <20210806203649.ahrrwvsjcit5wrnx@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-10-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210806093859.706464-10-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 06, 2021 at 11:38:56AM +0200, Max Reitz wrote:
> We must check whether the job is force-cancelled early in our main loop,
> most importantly before any `continue` statement.  For example, we used
> to have `continue`s before our current checking location that are
> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
> failing, force-cancelling the job would not terminate it.
> 
> Jobs can be cancelled while they yield, and once they are
> (force-cancelled), they should not generate new I/O requests.
> Therefore, we should put the check after the last yield before
> mirror_iteration() is invoked.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/mirror.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


