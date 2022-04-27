Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCD5118AA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:13:47 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiQM-0001YU-NZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njiPA-0008Ug-RB
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njiP8-0005M7-7a
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651068748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=alYk1o0hvpBGudL8VeMJxZMkLFpt+8mHicyjnFzkwgI=;
 b=EXoSd2vwUsZ5tMjcVle/WCoocZjLxOI+DXwME82vndly7ncHyX7vxHtYi10JkeQIPLViUI
 23KQbbvUVZW3nRycWFPPYg+9A66j6eHMPMPdIZTEHXs8EolAR90RCHNVrY7JGUeFJg4zrS
 ncdO50Ky55YK95QD0jGKfJ4xu2QQHFE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-rilEnFidPD2URglObw-2bQ-1; Wed, 27 Apr 2022 10:12:27 -0400
X-MC-Unique: rilEnFidPD2URglObw-2bQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ED9A380451C;
 Wed, 27 Apr 2022 14:12:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54D340D282F;
 Wed, 27 Apr 2022 14:12:26 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:12:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] coroutine-lock: introduce qemu_co_queue_enter_all
Message-ID: <20220427141225.ep46hl6wqsayb6n5@redhat.com>
References: <20220427130830.150180-1-pbonzini@redhat.com>
 <20220427130830.150180-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427130830.150180-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 03:08:29PM +0200, Paolo Bonzini wrote:
> Because qemu_co_queue_restart_all does not release the lock, it should
> be used only in coroutine context.  Introduce a new function that,
> like qemu_co_enter_next, does release the lock, and use it whenever
> qemu_co_queue_restart_all was used outside coroutine context.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h   | 13 +++++++++++++
>  ui/console.c               |  2 +-
>  util/qemu-coroutine-lock.c |  7 +++++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index c23d41e1ff..e5954635f6 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -234,6 +234,19 @@ void qemu_co_queue_restart_all(CoQueue *queue);
>      qemu_co_enter_next_impl(queue, QEMU_MAKE_LOCKABLE(lock))
>  bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock);
>  
> +/**
> + * Empties the CoQueue, waking the waiting coroutine one at a time.  Unlike

maybe s/coroutine/coroutine(s)/

> + * qemu_co_queue_all, this function releases the lock during aio_co_wake
> + * because it is meant to be used outside coroutine context; in that case, the
> + * coroutine is entered immediately, before qemu_co_enter_all returns.
> + *
> + * If used in coroutine context, qemu_co_enter_all is equivalent to
> + * qemu_co_queue_all.
> + */
> +#define qemu_co_enter_all(queue, lock) \
> +    qemu_co_enter_all_impl(queue, QEMU_MAKE_LOCKABLE(lock))
> +void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock);
> +

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


