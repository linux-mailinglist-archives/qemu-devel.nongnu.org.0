Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59D501B82
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 21:03:44 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf4kp-000788-0y
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 15:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf4jq-0006Tj-9p
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nf4jm-00075f-J0
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 15:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649962956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R0CTBtC1TDwWSA9oy5YxSPRZf5hN5aJsgYGMbpiLh0M=;
 b=elXWA3kvNeTR1taTJL6z7JN9/gOFd0EXaaxLBgqolE7+U/GPwlBv1nlwuqgDeI7dg1hVzj
 uspeqI7lAmSVOaoGc61DXWN3h7tp3VlfsasrujCpo2Qqd+H0dSlNrPEaX21Mpe8h3mRmyJ
 JUue+BE4dxhjVgdX/7YiDcE/57WM2WE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-JVKycYUYPjya8gYJiYbgnA-1; Thu, 14 Apr 2022 15:02:33 -0400
X-MC-Unique: JVKycYUYPjya8gYJiYbgnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 125AB811E7A;
 Thu, 14 Apr 2022 19:02:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6182026985;
 Thu, 14 Apr 2022 19:02:32 +0000 (UTC)
Date: Thu, 14 Apr 2022 14:02:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 for-7.1 1/9] nbd: safeguard against waking up invalid
 coroutine
Message-ID: <20220414190231.hxyryofsovbnmi2k@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220414175756.671165-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-34-be16c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Thu, Apr 14, 2022 at 07:57:48PM +0200, Paolo Bonzini wrote:
> The .reply_possible field of s->requests is never set to false.  This is
> not a problem as it is only a safeguard to detect protocol errors,
> but it's sloppy.  In fact, the field is actually not necessary at all,
> because .coroutine is set to NULL in NBD_FOREACH_REPLY_CHUNK after
> receiving the last chunk.  Thus, replace .reply_possible with .coroutine
> and move the check before deciding the fate of this request.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Ah, indeed nicer than the v1 approach.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


