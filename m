Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465842CEC5A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:41:22 +0100 (CET)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl8We-0006UY-1w
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kl8Vo-0005s8-GO
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:40:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kl8Vl-00015Y-RM
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607078424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jo2jqT1d/6fq0h6/2JrhApA16BGi4FCBjjlClP4m6jw=;
 b=abp4+wjmg8sW5hIYP6pLLiDSWSmEYd135VqXXXmbemOpn/XEJweqLjUFcjxBTDgc7lE9/I
 JBmsizBJgimIN+bAQY7nVLl6bVTEv2RK1WV/8dE+5esQxPjMcqUwVi4yYV1z9iYAlSiniy
 fE9qa9wrNbKA/Leargxc8pCANzSXbYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-ySk9CGeRMAeGShFsMaCpGg-1; Fri, 04 Dec 2020 05:40:20 -0500
X-MC-Unique: ySk9CGeRMAeGShFsMaCpGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D438015F3;
 Fri,  4 Dec 2020 10:40:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EAA56085A;
 Fri,  4 Dec 2020 10:40:17 +0000 (UTC)
Date: Fri, 4 Dec 2020 11:40:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] file-posix: check the use_lock
Message-ID: <20201204104016.GC4833@merkur.fritz.box>
References: <1607077703-32344-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1607077703-32344-1-git-send-email-fengli@smartx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lifeng1519@gmail.com, kyle@smartx.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.12.2020 um 11:28 hat Li Feng geschrieben:
> When setting the file.locking = false, we shouldn't set the lock.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>

This looks right to me, but can you add a test for this scenario to
iotest 182? This would both demonstrate the effect of the bug (I think
it would be that files are locked after reopen even with locking=off?)
and make sure that we won't have a regression later. Mentioning the
effect in the commit message would be good, too.

Kevin

>  block/file-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d5fd1dbcd2..806764f7e3 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
>      }
>  
>      /* Copy locks to the new fd */
> -    if (s->perm_change_fd) {
> +    if (s->perm_change_fd && s->use_lock) {
>          ret = raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, ~shared,
>                                     false, errp);
>          if (ret < 0) {
> -- 
> 2.24.3
> 


