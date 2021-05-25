Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A439093E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:51:22 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llc9B-0006rO-AU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llc7g-00060N-FV
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llc7c-0005dD-9H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621968583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtBXhjUSde+9eTCB+v6qZ1Ev2YEYRoJeuwp8mX/7E6s=;
 b=gfXdFh2NOhQkevj9awmmbvluVGHwUSWgfgUfsOq7npevgN/0f7yuScGqdG3ySjnSwFHGgv
 Kckoc0TT+cfcPFC8mcGz4oZW2/S8x39d+3G8GEJbfQz+uEkeZQtqkV9NC/Hy6yJpRkfV33
 u1yrUj8yLI+Ws9Xmaf5mXFiTf9FIU88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-18jZywFPPKWMCIJpKnMC6A-1; Tue, 25 May 2021 14:49:40 -0400
X-MC-Unique: 18jZywFPPKWMCIJpKnMC6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF402192CC44
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:49:33 +0000 (UTC)
Received: from work-vm (ovpn-115-40.ams2.redhat.com [10.36.115.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE50A100EBAF;
 Tue, 25 May 2021 18:49:18 +0000 (UTC)
Date: Tue, 25 May 2021 19:49:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2 0/7] virtiofsd: Few cleanups in virtio_send_data_iov()
Message-ID: <YK1Gq663KZxQPlVI@work-vm>
References: <20210518213538.693422-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518213538.693422-1-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, ckuehl@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> This is V2 of the patches. Changes since V1 are.
> 
> - Took care of coding style issue.
> - Got rid of label "err" completely in last patch. (Dave, Connor). 
> - Captured Reviewed-by tags from Connor and David.
> 
> Code in virtio_send_data_iov() little twisted and complicated. This
> patch series just tries to simplify it a bit to make it little easier
> to read this piece of code.

Queued

> Thanks
> Vivek
> 
> 
> Vivek Goyal (7):
>   virtiofsd: Check for EINTR in preadv() and retry
>   virtiofsd: Get rid of unreachable code in read
>   virtiofsd: Use iov_discard_front() to skip bytes
>   virtiofsd: get rid of in_sg_left variable
>   virtiofsd: Simplify skip byte logic
>   virtiofsd: Check EOF before short read
>   virtiofsd: Set req->reply_sent right after sending reply
> 
>  tools/virtiofsd/fuse_virtio.c | 81 +++++++++++------------------------
>  1 file changed, 25 insertions(+), 56 deletions(-)
> 
> -- 
> 2.25.4
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


