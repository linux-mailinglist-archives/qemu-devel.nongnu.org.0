Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA7E399573
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 23:34:10 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loYV7-0004oa-Pp
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 17:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYU5-00048F-2n
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYU3-0008Ty-Cj
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622669582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls8qZH0NOVSZiYkP04/s6ddUdOPoqMEiHzkkCNwV2ww=;
 b=VcNxBVWOrG0K3H0U/Y4ysMrs3HGpMa1dUyk0YVmshige/kW4g/RrO6b0HcthCjCyu2mHmR
 FzRtiuLokZvoV/7YrMa45oGYLwdnIcvrU03Kygru5vflW2N6eklRnlsIigk3l5hopvTnil
 cow2hO5SmX6GXUKPSiBCFGptjd7AX+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-pin0-uQJNiaHHxjNeMIeIg-1; Wed, 02 Jun 2021 17:33:00 -0400
X-MC-Unique: pin0-uQJNiaHHxjNeMIeIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3825A800D55;
 Wed,  2 Jun 2021 21:32:59 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2794619D7D;
 Wed,  2 Jun 2021 21:32:55 +0000 (UTC)
Date: Wed, 2 Jun 2021 16:32:53 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 10/10] nbd: move connection code from block/nbd to
 nbd/client-connection
Message-ID: <20210602213253.ggqomvo6nyhaiqdd@redhat.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210408140827.332915-11-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, rvkagan@yandex-team.ru,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 05:08:27PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We now have bs-independent connection API, which consists of four
> functions:
> 
>   nbd_client_connection_new()
>   nbd_client_connection_unref()
>   nbd_co_establish_connection()
>   nbd_co_establish_connection_cancel()
> 
> Move them to a separate file together with NBDClientConnection
> structure which becomes private to the new API.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hmm. I keep only Virtuozzo's copyright in a new file, as actually I've
> developed nbd-reconnection code. Still probably safer to save all
> copyrights. Let me now if you think so and I'll add them.

I trust git's version log better than what the file header itself
states.  But in this particular case (the new file has only functions
that you demonstrably contributed), I think you are okay in listing
only your own copyright, instead of carrying along everything else
from the file you split out of.  If anyone objects, we can always add
the details back in.  However, it may be good to include a disclaimer
in your commit message proper mentioning your choice in copyright on
the new file.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


