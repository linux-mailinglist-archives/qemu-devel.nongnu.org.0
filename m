Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BCF501C20
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 21:43:28 +0200 (CEST)
Received: from localhost ([::1]:34162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf5NH-0004Qy-OY
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 15:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf5MH-0003Pm-WF
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf5MG-0004dP-GF
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649965343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yqg4Br7v1Yb+mZY/0TD86JXuPQuSjYAJH8WaNXosoGU=;
 b=ifGXEa7+USzNKSU57/DO+sxeSAm/1o7PdEzBQxWwpTrESTj836mKun65ODNbI7+lyDxLum
 EnJlB4Q9TL3Lviu3YLdBlMBjgZUUhZgh3DNnWEepiOyN3+csGldLIeJLBX1+iodancMqnF
 QDyLSww//BHNteTXCveVfiqGwZBUnHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-qyWvVRk3OL6Xle0v-2n8bg-1; Thu, 14 Apr 2022 15:42:19 -0400
X-MC-Unique: qyWvVRk3OL6Xle0v-2n8bg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44ABD899EC4;
 Thu, 14 Apr 2022 19:42:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6B2D111F3B0;
 Thu, 14 Apr 2022 19:42:18 +0000 (UTC)
Date: Thu, 14 Apr 2022 14:42:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 for-7.1 8/9] nbd: take receive_mutex when reading
 requests[].receiving
Message-ID: <20220414194217.ts4plyn2s45xirau@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-9-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220414175756.671165-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-34-be16c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 07:57:55PM +0200, Paolo Bonzini wrote:
> requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
> Read it under the same mutex as well.  Waking up receivers on errors happens
> after each reply finishes processing, in nbd_co_receive_one_chunk().
> If there is no currently-active reply, there are two cases:
> 
> * either there is no active request at all, in which case no
> element of request[] can have .receiving = true
> 
> * or nbd_receive_replies() must be running and owns receive_mutex;
> in that case it will get back to nbd_co_receive_one_chunk() because
> the socket has been shutdown, and all waiting coroutines will wake up
> in turn.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


