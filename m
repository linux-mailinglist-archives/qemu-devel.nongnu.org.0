Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4C373887
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:26:58 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEk5-0004NJ-QU
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leEig-0003Wf-58
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leEiR-0000Yq-EL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620210313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3vZ2wTOcRuHLmpVB9HK523QFD5KwYzLQYV9lGd0N/k=;
 b=I5cT5gdjAwmEq9PKuQcmIw2M7tnNtIwUBvZz2oRmgNj3YIxBvym1tR7YxiO9MWfXNkgNgW
 WL+C1fUIvJhjy24HwR1/iewuflGG4I8okI6PCaMTqPs2u/bj04PkUB9x2U3ZLQy/OrsgOf
 Bm0BhWBlNA07OA9MnMWu7ESTRRW6DPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-g1FNycl8P-uSGmC-1YYz3g-1; Wed, 05 May 2021 06:25:11 -0400
X-MC-Unique: g1FNycl8P-uSGmC-1YYz3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F31C835DE1;
 Wed,  5 May 2021 10:25:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D978E5D6D1;
 Wed,  5 May 2021 10:25:06 +0000 (UTC)
Date: Wed, 5 May 2021 12:25:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] block: Fix Transaction leaks
Message-ID: <YJJygRJXGUTBh0OD@merkur.fritz.box>
References: <20210503110555.24001-1-kwolf@redhat.com>
 <306a7acd-87a0-aa31-16cf-a0c00a281d6e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <306a7acd-87a0-aa31-16cf-a0c00a281d6e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.05.2021 um 08:56 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.05.2021 14:05, Kevin Wolf wrote:
> > These are two follow-up fixes for Vladimir's "block: update graph
> > permissions update". The bugs were reported by Coverity.
> > 
> > Kevin Wolf (2):
> >    block: Fix Transaction leak in bdrv_root_attach_child()
> >    block: Fix Transaction leak in bdrv_reopen_multiple()
> > 
> >   block.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> I'll rebase my "[PATCH 0/6] block permission updated follow-up" on top
> of this.

Ok, thanks. I've applied this to my block branch now.

Kevin


