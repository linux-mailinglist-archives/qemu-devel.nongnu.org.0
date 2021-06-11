Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB53A4969
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:21:27 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrmic-0007Bk-6O
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lrmh1-0006Tr-FA
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lrmgx-00054E-Oo
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623439182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HJs2pBk4fyhpTmXQar/oHoVA9CwXlSOQDuk3HUZfhA=;
 b=Jv4ihW1emsFLsRoXgofhAQmAX76YqZHsQPuvJZRbhP2ixPQfEGtkfAiP10tF3K0ItkwH8X
 3xLGCOMWKAeNEfA2tzfVxxlyGEOQLkRiC9Yw8ZUfEYMqBVZgds8aT1lLWktELkOCeO9C4V
 Zz80jYWdoOCFW1SYYN6GwmBKKsb5Xz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-jadmyzQZNDqv1In34UwIQQ-1; Fri, 11 Jun 2021 15:19:40 -0400
X-MC-Unique: jadmyzQZNDqv1In34UwIQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A8E100C618
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 19:19:39 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-174.rdu2.redhat.com [10.10.116.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31CC419714;
 Fri, 11 Jun 2021 19:19:26 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A023322054F; Fri, 11 Jun 2021 15:19:25 -0400 (EDT)
Date: Fri, 11 Jun 2021 15:19:25 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/9] virtiofsd: Allow using file handles instead of
 O_PATH FDs
Message-ID: <20210611191925.GA767764@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609155551.44437-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:55:42PM +0200, Max Reitz wrote:
> Hi,
> 
> v1 cover letter for an overview:
> https://listman.redhat.com/archives/virtio-fs/2021-June/msg00033.html

Hi Max,

What's the impact of these patches on performance? Just trying to 
get some idea what to expect. Performance remains more or less
same or we expect a hit.

Thanks
Vivek

> 
> In v2, I (tried to) fix the bug Dave found, which is that
> get_file_handle() indiscriminately opened the given dirfd/name
> combination to get an O_RDONLY fd without checking whether we’re
> actually allowed to open dirfd/name; namely, we don’t allow ourselves to
> open files that aren’t regular files or directories.
> 
> So that openat(.., O_RDONLY) is changed to an openat(..., O_PATH), and
> then check the file type with the statx() we’re doing anyway.  If the
> file is OK to open, we reopen it O_RDONLY with the help of
> /proc/self/fd, like we always do.
> 
> (This only affects patch 8.)
> 
> 
> git-backport-diff against v1:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/9:[----] [--] 'virtiofsd: Add TempFd structure'
> 002/9:[----] [--] 'virtiofsd: Use lo_inode_open() instead of openat()'
> 003/9:[----] [--] 'virtiofsd: Add lo_inode_fd() helper'
> 004/9:[----] [--] 'virtiofsd: Let lo_fd() return a TempFd'
> 005/9:[----] [--] 'virtiofsd: Let lo_inode_open() return a TempFd'
> 006/9:[----] [--] 'virtiofsd: Add lo_inode.fhandle'
> 007/9:[----] [--] 'virtiofsd: Add inodes_by_handle hash table'
> 008/9:[0045] [FC] 'virtiofsd: Optionally fill lo_inode.fhandle'
> 009/9:[----] [--] 'virtiofsd: Add lazy lo_do_find()'
> 
> 
> Max Reitz (9):
>   virtiofsd: Add TempFd structure
>   virtiofsd: Use lo_inode_open() instead of openat()
>   virtiofsd: Add lo_inode_fd() helper
>   virtiofsd: Let lo_fd() return a TempFd
>   virtiofsd: Let lo_inode_open() return a TempFd
>   virtiofsd: Add lo_inode.fhandle
>   virtiofsd: Add inodes_by_handle hash table
>   virtiofsd: Optionally fill lo_inode.fhandle
>   virtiofsd: Add lazy lo_do_find()
> 
>  tools/virtiofsd/helper.c              |   3 +
>  tools/virtiofsd/passthrough_ll.c      | 836 +++++++++++++++++++++-----
>  tools/virtiofsd/passthrough_seccomp.c |   2 +
>  3 files changed, 694 insertions(+), 147 deletions(-)
> 
> -- 
> 2.31.1
> 
> 


