Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9556BFA06
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 13:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdVb7-0006k0-G2; Sat, 18 Mar 2023 08:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVb5-0006g1-IE
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVb4-0005sa-5R
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679142221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hzFXSbM/mxeUDM3zd0YEmbrJsn7mOmKK23YxzZj5AUk=;
 b=QUSImN8oWTsf1xLCbtxfgily+fzjdPDqAfhDWiR3X+zk9F20/VJ9S5E+q0qtNQa1rlaA0G
 uuJAxfvdtwV5H8hi7kxu/iVohcsdxhVDEnTwaLQe0WMgXqyy4Yx0bYNzMYl5KN1ZbNrRXO
 /JKYBdru/BtS+VnFzRvh0tV6H1J2n5M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-ImY6nqhpPLi7p7VkskETmw-1; Sat, 18 Mar 2023 08:23:36 -0400
X-MC-Unique: ImY6nqhpPLi7p7VkskETmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B118C8533DC;
 Sat, 18 Mar 2023 12:23:35 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C87F6492B00;
 Sat, 18 Mar 2023 12:22:46 +0000 (UTC)
Date: Sat, 18 Mar 2023 07:22:45 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 3/4] util/iov: Remove qemu_iovec_init_extended()
Message-ID: <20230318122245.oxqi7awd5e654f6u@redhat.com>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317175019.10857-4-hreitz@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 17, 2023 at 06:50:18PM +0100, Hanna Czenczek wrote:
> bdrv_pad_request() was the main user of qemu_iovec_init_extended().
> HEAD^ has removed that use, so we can remove qemu_iovec_init_extended()
> now.
> 
> The only remaining user is qemu_iovec_init_slice(), which can easily
> inline the small part it really needs.
> 
> Note that qemu_iovec_init_extended() offered a memcpy() optimization to
> initialize the new I/O vector.  qemu_iovec_concat_iov(), which is used
> to replace its functionality, does not, but calls qemu_iovec_add() for
> every single element.  If we decide this optimization was important, we
> will need to re-implement it in qemu_iovec_concat_iov(), which might
> also benefit its pre-existing users.
> 
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/qemu/iov.h |  5 ---
>  util/iov.c         | 79 +++++++---------------------------------------
>  2 files changed, 11 insertions(+), 73 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


