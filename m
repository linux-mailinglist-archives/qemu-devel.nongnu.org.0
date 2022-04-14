Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D7501B9B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 21:12:52 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf4td-0002kS-Q0
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 15:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf4sY-0001z5-BC
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf4sT-000057-9q
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649963495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2PItmVSAdj3GQlsqGnw4IZVonCW1qTHQTwarTBo77c=;
 b=IWiDqZ6piRBFw1b5xcrw9zuI8tn6v10GRDglkzWes18WRaOMKQeCIEfDinjlqqughrWaCu
 yaHQRz4e0ylO4el4SYgDrpCTTpi/S2eUoya4ZxcO3x3VEfEooC5MZLG3AEKX4tgYrpZ6iX
 P0/VbcNkiKJfo+aR0G2uVkYh++uCI90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-nO2PR4q3OcOf8nIeWzSUIw-1; Thu, 14 Apr 2022 15:11:34 -0400
X-MC-Unique: nO2PR4q3OcOf8nIeWzSUIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6EFE1C09050;
 Thu, 14 Apr 2022 19:11:32 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BDE2111D3D2;
 Thu, 14 Apr 2022 19:11:32 +0000 (UTC)
Date: Thu, 14 Apr 2022 14:11:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 for-7.1 4/9] nbd: keep send_mutex/free_sema handling
 outside nbd_co_do_establish_connection
Message-ID: <20220414191130.xob7cplk5yp4r6b4@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220414175756.671165-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-34-be16c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 07:57:51PM +0200, Paolo Bonzini wrote:
> Elevate s->in_flight early so that other incoming requests will wait
> on the CoQueue in nbd_co_send_request; restart them after getting back
> from nbd_reconnect_attempt.  This could be after the reconnect timer or
> nbd_cancel_in_flight have cancelled the attempt, so there is no
> need anymore to cancel the requests there.
> 
> nbd_co_send_request now handles both stopping and restarting pending
> requests after a successful connection, and there is no need to
> hold send_mutex in nbd_co_do_establish_connection.  The current setup
> is confusing because nbd_co_do_establish_connection is called both with
> send_mutex taken and without it.  Before the patch it uses free_sema which
> (at least in theory...) is protected by send_mutex, after the patch it
> does not anymore.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/coroutines.h |  4 +--
>  block/nbd.c        | 66 ++++++++++++++++++++++------------------------
>  2 files changed, 33 insertions(+), 37 deletions(-)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index b293e943c8..8f6e438ef3 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -59,7 +59,7 @@ int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
>                                          QEMUIOVector *qiov, int64_t pos);
>  
>  int coroutine_fn
> -nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
> +nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);

Long line; probably worth wrapping.  But that's cosmetic; I could do
it while applying to my tree.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


