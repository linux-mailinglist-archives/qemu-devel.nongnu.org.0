Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C814004D4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:25:06 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDs8-0001cz-1x
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMDOY-0007Bo-6S
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMDOW-000848-0Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJ87W9Y5fLSb2YV9eD2eZFkuEGe7HuZymG5zmpU9kcw=;
 b=FOyC0v7fXwUWl34LwyKzeHXQetUBEOQRTMKpYw2hFgkkRRTqn6SaviXcaMIqDPu+kgHj0f
 nSJ7axdJgBUCrZM+5wqwarYwRWpcNAsuEzYW3/1ADFC9QyoLNt1qHVdxFzrjEk6cmcWxH1
 fuGVLmhKALd5zmi0g5ZUa8zUqhEVfsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-IKBO3MCzOGuO-n_hwXkl1A-1; Fri, 03 Sep 2021 13:54:23 -0400
X-MC-Unique: IKBO3MCzOGuO-n_hwXkl1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C098835DE2;
 Fri,  3 Sep 2021 17:54:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D30B75C1C5;
 Fri,  3 Sep 2021 17:54:21 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:54:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 5/5] block/nbd: check that received handle is valid
Message-ID: <20210903175420.7lky6d6kw7r3gsqg@redhat.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <20210902103805.25686-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902103805.25686-6-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rkagan@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 01:38:05PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> If we don't have active request, that waiting for this handle to be
> received, we should report an error.

If we don't have an active request waiting for this handle to be received,

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

[I'm still taking my time going through 4/5, but hopefully that
doesn't impact my quicker review here]

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


