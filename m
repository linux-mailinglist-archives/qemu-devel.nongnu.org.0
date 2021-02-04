Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD8930FC00
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:53:49 +0100 (CET)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jlE-0006kK-Il
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7j9O-0000P5-ES
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7j9L-0004DX-Bc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612462476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vKs3yxMRSawS/BuMxww/Z2fbdYp872rK33a1wy+J8k=;
 b=WaQhaLwZbQb/kcs4lGQCJSyDq2w4DKBDHwap6Lexd9uc4Bxj9EB84xpNReP4a4VWon+aaD
 bJ5bHtYIrYw9dLE0Tx+hLZElKRfRqwy3iVQk5HsNWJBEmmGFW4B9/GxPsotmsv2BnibjK7
 nAVB4e5bluhQicQXaNMYCHuOutG+1XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-08HjSpltMDmrSROZyZVTrA-1; Thu, 04 Feb 2021 13:14:35 -0500
X-MC-Unique: 08HjSpltMDmrSROZyZVTrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4EC1800D41;
 Thu,  4 Feb 2021 18:14:34 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4976060BE2;
 Thu,  4 Feb 2021 18:14:21 +0000 (UTC)
Date: Thu, 4 Feb 2021 18:14:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210204181417.GN3039@work-vm>
References: <20210204150208.367837-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204150208.367837-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 Greg Kurz <groug@kaod.org>, Alex Xu <alex@alxu.ca>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> v4:
>  * Patch 1: Return positive errno if openat(2) fails in lo_do_open() [Greg]
>  * Patch 3: Return -fd instead or -errno after lo_inode_open() in lo_do_open() [Greg]
>  * Patch 3: Use De Morgan's Law to simplify the boolean expression in lo_create() [Vivek]
>  * Patch 3: Add missing errno = -truncfd after lo_inode_open() call in lo_setattr
> v3:
>  * Restructure lo_create() to handle externally-created files (we need
>    to allocate an inode for them) [Greg]
>  * Patch 1 & 2 refactor the code so that Patch 3 can implement the CVE fix
> v3:
>  * Protect lo_create() [Greg]
> v2:
>  * Add doc comment clarifying that symlinks are traversed client-side
>    [Daniel]
> 
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
> 
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
> 
> This patch series fixes this issue by introducing the lo_inode_open() function
> to check the file type before opening it. This is a short-term solution because
> it does not prevent a compromised virtiofsd process from opening device nodes
> on the host.
> 
> This issue was diagnosed on public IRC and is therefore already known
> and not embargoed.
> 
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517

Queued

> Stefan Hajnoczi (3):
>   virtiofsd: extract lo_do_open() from lo_open()
>   virtiofsd: optionally return inode pointer from lo_do_lookup()
>   virtiofsd: prevent opening of special files (CVE-2020-35517)
> 
>  tools/virtiofsd/passthrough_ll.c | 224 ++++++++++++++++++++-----------
>  1 file changed, 148 insertions(+), 76 deletions(-)
> 
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


