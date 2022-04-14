Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB7501C1D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 21:42:26 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf5MH-0002sC-1I
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 15:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf5KJ-00020L-4U
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf5KG-0004Kb-KR
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649965219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNptREPHgezBQ51J63cmRitLfiFyjUwy4WvqiGAN4vs=;
 b=KmtpBZZzQCMQPjdiaCgdQssTdsOld6s/nbjWoyWMgW0C3lL3xcHUpbUbr+C7DTsP23lqpf
 BT2FtQJcIJ7CX91Q+6ASw0Ey4YlTfwN2cQlJuWh5NBdDi6QVAbHHbI8AuN5bIaF3rPNeOF
 FPGTfFPqgn8EyaH61p1pcOsbbv9JgqA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-yykV6aL4PMOX_KAUMaSu6w-1; Thu, 14 Apr 2022 15:40:16 -0400
X-MC-Unique: yykV6aL4PMOX_KAUMaSu6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 494F1833967;
 Thu, 14 Apr 2022 19:40:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13BC4404E4AE;
 Thu, 14 Apr 2022 19:40:15 +0000 (UTC)
Date: Thu, 14 Apr 2022 14:40:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 for-7.1 7/9] nbd: move s->state under requests_lock
Message-ID: <20220414194013.o6vks7fa5cxvuii4@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-8-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220414175756.671165-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-34-be16c3
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
Cc: v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 07:57:54PM +0200, Paolo Bonzini wrote:
> Remove the confusing, and most likely wrong, atomics.  The only function
> that used to be somewhat in a hot path was nbd_client_connected(),
> but it is not anymore after the previous patches.
> 
> The same logic is used both to check if a request had to be reissued
> and also in nbd_reconnecting_attempt().  The former cases are outside
> requests_lock, while nbd_reconnecting_attempt() does have the lock,
> therefore the two have been separated in the previous commit.
> nbd_client_will_reconnect() can simply take s->requests_lock, while
> nbd_reconnecting_attempt() can inline the access now that no
> complicated atomics are involved.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 78 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 41 insertions(+), 37 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


