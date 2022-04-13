Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7F500118
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 23:23:02 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nekS4-0001oT-LT
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 17:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nekQ5-0000uX-Qi
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nekQ2-0006Wt-GB
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649884851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eo7soLgNqY3FsisArXeO6IUaS9JrhHqY98keJZQC8ls=;
 b=eFJLcLKbI+wfAI5lImsGlUWa6vsG8YeRefuHMfaXUpsumtpeylw9H+LboCYZjOZnIi0A4g
 ERwtgivvcpE0xdWpqwV5Wp7JzeV+UyKMWHr63I0dk6CuXJH5vJVRoKnlCc9lvveG4OzqU1
 CpuInRF2i+oC5IB7GucRqVE/FE/YDSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-_kQYghzyN42KhZRN5Zuj8Q-1; Wed, 13 Apr 2022 17:20:50 -0400
X-MC-Unique: _kQYghzyN42KhZRN5Zuj8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF970185A7BA
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 21:20:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A73E8400E870;
 Wed, 13 Apr 2022 21:20:49 +0000 (UTC)
Date: Wed, 13 Apr 2022 16:20:47 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 7/8] nbd: take receive_mutex when reading
 requests[].receiving
Message-ID: <20220413212047.37tyumtxoxf5wsbl@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-8-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Tue, Apr 12, 2022 at 09:42:03PM +0200, Paolo Bonzini wrote:
> requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
> Read it under the same mutex as well.  Waking up receivers on errors happens
> after each reply finishes processing, in nbd_co_receive_one_chunk().
> If there is no currently-active reply, there are two cases:
> 
> * either there is no active request at all, in which case no
> element of request[] can have .receiving = true
> 
> * or nbd_receive_replies() must be running and waiting for receive_mutex;
> in that case it will get back to nbd_co_receive_one_chunk() because
> the socket has been shutdown, and all waiting coroutines will wake up
> in turn.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


