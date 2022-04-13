Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18234FF716
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 14:50:07 +0200 (CEST)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1necRi-0007DX-JJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 08:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1necPz-0006GF-4f
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1necPu-0001x2-A8
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649854090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xh0KOoAvqdMWh4QNbXy+NqMiWzBjeK5iB+A6sCsmo8k=;
 b=UiUpPYQtVRAvW98Qf0dbpjJQuHle/BgnFNH1lwmrgmwxsT0bLP190n6rK6132Cb916BvpJ
 r4kAVf+CyZDTshmuhhVADZx0GBBKe0UkQ4TXLZJ7oIrG4yDh+ZJrTTk9BCkGxg4DQGJFEk
 MIrnBja6yYHOyObPtiQXltclu5cvZWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-pZILa09WNEKXLRMMi_Sb9Q-1; Wed, 13 Apr 2022 08:48:09 -0400
X-MC-Unique: pZILa09WNEKXLRMMi_Sb9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 516D980418A
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 12:48:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A9DA2166BA4;
 Wed, 13 Apr 2022 12:48:04 +0000 (UTC)
Date: Wed, 13 Apr 2022 07:48:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 3/8] nbd: remove peppering of nbd_client_connected
Message-ID: <20220413124802.yvwub3ivse625ssx@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 09:41:59PM +0200, Paolo Bonzini wrote:
> It is unnecessary to check nbd_client_connected() because every time
> s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
> and all coroutines are resumed.
> 
> The only case where it was actually needed is when the NBD
> server disconnects and there is no reconnect-delay.  In that
> case, nbd_receive_replies() does not set s->reply.handle and
> nbd_co_do_receive_one_chunk() cannot continue.  For that one case,
> check the return value of nbd_receive_replies().
> 
> As to the others:
> 
> * nbd_receive_replies() can put the current coroutine to sleep if another
> reply is ongoing; then it will be woken by nbd_channel_error() called
> by the ongoing reply.  Or it can try itself to read a reply header and
> fail, thus calling nbd_channel_error() itself.
> 
> * nbd_co_send_request() will write the body of the request and fail
> 
> * nbd_reply_chunk_iter_receive() will call nbd_co_receive_one_chunk()
> and then nbd_co_do_receive_one_chunk(), which will handle the failure as
> above; or it will just detect a previous call to nbd_iter_channel_error()
> via iter->ret < 0.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


