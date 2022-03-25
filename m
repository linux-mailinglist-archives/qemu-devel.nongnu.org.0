Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470884E7559
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:47:09 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlDX-0003Dy-S2
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:47:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlCI-0002Nn-PJ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlCF-0002d1-T6
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648219547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VngRAVXuDxIppta8JR24FIdYFPvz0aIYDUpOkPrpxM=;
 b=NoBDBmLawXyhPz5I/Yzv6ppXQbu4qxaHXcAXE2PzM0UZ3OVUzr1ZHmp7nkoiCr1XwOp4zK
 7oGz/vZC0BJTnzLpGXBIqym90xVSl2YcbGkSVjQGXZCGXVWcocmXilHR+9EkwUdnxBmfWW
 cGMLjF5SWAfXYDEsOJCZ1/+IX0q/cAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-WAlpS55ePseobhGtuJhiVg-1; Fri, 25 Mar 2022 10:45:38 -0400
X-MC-Unique: WAlpS55ePseobhGtuJhiVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38C0C1801399;
 Fri, 25 Mar 2022 14:45:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C05F3111E3EA;
 Fri, 25 Mar 2022 14:45:23 +0000 (UTC)
Date: Fri, 25 Mar 2022 09:45:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
Message-ID: <20220325144516.aueecyzlstclsxra@redhat.com>
References: <20220324140907.17192-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324140907.17192-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 03:09:07PM +0100, Hanna Reitz wrote:
> When the stream block job cuts out the nodes between top and base in
> stream_prepare(), it does not drain the subtree manually; it fetches the
> base node, and tries to insert it as the top node's backing node with
> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
> the actual base node might change (because the base node is actually not
> part of the stream job) before the old base node passed to
> bdrv_set_backing_hd() is installed.
> 
...
> 
> Therefore, we need to keep the whole subtree drained in
> stream_prepare(), so that the graph modification it performs is
> effectively atomic, i.e. that the base node it fetches is still the base
> node when bdrv_set_backing_hd() sets it as the top node's backing node.
> 
> Verify this by asserting in said 030's test case that the base node is
> always the top node's immediate backing child when both jobs are done.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2:
> - Oops, the base can be NULL.  Would have noticed if I had ran all test
>   cases from 030, and not just test_overlapping_5()...
>   That means that keeping a strong reference to the base node must be
>   conditional, based on whether there even is a base node or not.
>   (I mean, technically we do not even need to keep a strong reference to
>   that node, given that we are in a drained section, but I believe it is
>   better style to do it anyway.)

I agree with the conclusion that we don't need a strong reference once
you fix the bigger problem of the lock-by-drain, but that it is better
style to include it anyway.

> ---
>  block/stream.c         | 15 ++++++++++++++-
>  tests/qemu-iotests/030 |  5 +++++
>  2 files changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


