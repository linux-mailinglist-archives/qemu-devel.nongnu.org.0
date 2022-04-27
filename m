Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C25118A6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:10:56 +0200 (CEST)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiNZ-000696-EU
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njiKc-0003Iv-LM
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njiKZ-0004Xu-2a
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651068464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A48WKQOZH93RaFnDp57xmMAWZN7HO+WP+vXOeJemu2E=;
 b=KyqSo0wfSEAWwhpwp511ErOprkn+YNVfq4ornVHGRazwnTUFpNuRNbAxronchG0qXmtxJn
 opTFZKrwZKZy1ciD4TR+c2kasSVuozflECRaLF9eHBzKHwQ57uQjdP5NuctjgDREeur6cp
 DdZb6dQbtj/VrFDbi3in6ezFXqqwjGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-dkEbbfgdMjaI1FPyvBbVzg-1; Wed, 27 Apr 2022 10:07:43 -0400
X-MC-Unique: dkEbbfgdMjaI1FPyvBbVzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1799385A5A8;
 Wed, 27 Apr 2022 14:07:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9830940CFD05;
 Wed, 27 Apr 2022 14:07:42 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:07:40 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] coroutine-lock: qemu_co_queue_next is a
 coroutine-only qemu_co_enter_next
Message-ID: <20220427140740.cjwkhlbluh2ynzw3@redhat.com>
References: <20220427130830.150180-1-pbonzini@redhat.com>
 <20220427130830.150180-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427130830.150180-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Wed, Apr 27, 2022 at 03:08:28PM +0200, Paolo Bonzini wrote:
> qemu_co_queue_next is basically the same as qemu_co_enter_next but
> without a QemuLockable argument.  That's perfectly fine, but only
> as long as the function is marked coroutine_fn.  If used outside
> coroutine context, qemu_co_queue_wait will attempt to take the lock
> and that is just broken: if you are calling qemu_co_queue_next outside
> coroutine context, the lock is going to be a QemuMutex which cannot be
> taken twice by the same thread.
> 
> The patch adds the marker and reimplements qemu_co_queue_next in terms of
> qemu_co_enter_next_impl, to remove duplicated code and to clarify that the
> latter also works in coroutine context.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h   |  7 ++++---
>  util/qemu-coroutine-lock.c | 21 +++++++--------------
>  2 files changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


