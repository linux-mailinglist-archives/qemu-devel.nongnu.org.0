Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CB38F4F4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 23:32:56 +0200 (CEST)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llIBy-0001CY-Qo
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 17:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llIAN-0000NF-6D
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llIAK-0002KR-35
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621891870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ksUo6XhgqLHiJUJ62/N76nuao/KE9uMuqMaOiGVbYMg=;
 b=LdKxQ25XO79IZzVpOmweGABbDYEXH80ThaVU9oFKJqNNGfXNuU9lOZ+uIDx2fipttDJfDs
 tGQIUL7dJ5Wfn8CeHkPZciNGWJUw5eIvDueFRhhTwaSAWGxmB20r87VxbPchSC5VPDbQQb
 GbD7gh1fgBgdHJ2kt3LceIZTWD+yF88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-6GUIQqWYPAmwznB9O5t5xw-1; Mon, 24 May 2021 17:31:06 -0400
X-MC-Unique: 6GUIQqWYPAmwznB9O5t5xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0D3A501E0;
 Mon, 24 May 2021 21:31:04 +0000 (UTC)
Received: from redhat.com (ovpn-113-196.phx2.redhat.com [10.3.113.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3C45D9F0;
 Mon, 24 May 2021 21:31:03 +0000 (UTC)
Date: Mon, 24 May 2021 16:31:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 01/33] block/nbd: fix channel object leak
Message-ID: <20210524213101.72hdv7mlvklfk4gm@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:39AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Roman Kagan <rvkagan@yandex-team.ru>
> 
> nbd_free_connect_thread leaks the channel object if it hasn't been
> stolen.
> 
> Unref it and fix the leak.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  block/nbd.c | 1 +
>  1 file changed, 1 insertion(+)

Does nbd_yank() have a similar problem?

At any rate, this makes sense to me.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


