Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED3C500126
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 23:24:48 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nekTn-0003Te-8g
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 17:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nekRT-0002EN-Fn
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nekRR-00072m-Sq
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649884940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=444zVcWrS4T4rb/bOk+YDDIst9fH0jEt6W0Oz5Y5LkY=;
 b=iuwoBv+pQ5T3Y0YFqqjusDtn9sD/iv7nPg+Q/LYG36YmgNq318/L+FbeCeQK7N4JngrgIg
 8zPVrDXrF10kbhq+R2ORP6QYs/0JADYygC1egTBXwOzzsU+yttDwTOizTN/KBpfQ2ZGP5L
 lBZ7u1A/T4IT/3qfbi8OWoSC9wY6zFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-qVlxpUqaPYGdIp35zZ8Xkw-1; Wed, 13 Apr 2022 17:22:19 -0400
X-MC-Unique: qVlxpUqaPYGdIp35zZ8Xkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A951C04B50
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 21:22:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3493F4047780;
 Wed, 13 Apr 2022 21:22:19 +0000 (UTC)
Date: Wed, 13 Apr 2022 16:22:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 8/8] nbd: document what is protected by the
 CoMutexes
Message-ID: <20220413212217.d4pfps7kmu6uc6to@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-9-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Tue, Apr 12, 2022 at 09:42:04PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 8954243f50..8297da7e89 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -82,12 +82,18 @@ typedef struct BDRVNBDState {
>      NBDClientRequest requests[MAX_NBD_REQUESTS];
>      QEMUTimer *reconnect_delay_timer;
>  
> +    /* Protects sending data on the socket.  */
>      CoMutex send_mutex;
> +
> +    /*
> +     * Protects receiving reply headers from the socket, as well as the
> +     * fields reply, requests[].receiving and requests[].reply_possible
> +     */
>      CoMutex receive_mutex;
> +    NBDReply reply;
>  
>      QEMUTimer *open_timer;
>  
> -    NBDReply reply;
>      BlockDriverState *bs;

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


