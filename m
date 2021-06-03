Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6C39AC0F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:52:28 +0200 (CEST)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1louKJ-0000LL-Ql
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1louJK-0007xz-9n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1louJI-0007vR-6F
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622753483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpzWESzF1gQQyYQ7PGRsK6Kon8Tuf576jAteN/NSDQ4=;
 b=VkfDB+bcALgK/H3Y7UGDBmRMO8z4cKvaSieUVW+6j/4hG2W0ML0ZvG27dmZ92nVsRtRs7V
 PentH/iAUEGIUavdxRpAXwbsKLJ0B/YYZ3LZ+i1Y9eMJSDbLrqj9SKy+hUGo5jUcEJGxWn
 KPYh43Obg5oGu1OAMeSwwJtnVU6UfQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-afxFHCTqPyS898H5nWui3g-1; Thu, 03 Jun 2021 16:51:21 -0400
X-MC-Unique: afxFHCTqPyS898H5nWui3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7F2A343A5;
 Thu,  3 Jun 2021 20:51:19 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D6B60BD8;
 Thu,  3 Jun 2021 20:51:18 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:51:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 29/33] nbd/client-connection: add option for
 non-blocking connection attempt
Message-ID: <20210603205117.qtkcwwsj53l36o4n@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-30-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-30-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:09:07AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We'll need a possibility of non-blocking nbd_co_establish_connection(),
> so that it returns immediately, and it returns success only if
> connections was previously established in background.

only if a connection was

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     | 2 +-
>  block/nbd.c             | 2 +-
>  nbd/client-connection.c | 8 +++++++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


