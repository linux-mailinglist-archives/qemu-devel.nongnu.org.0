Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DED31CEBF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:13:08 +0100 (CET)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3uN-0003oL-Gy
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC3gX-0004Iv-Cc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC3gV-00016H-7t
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613494725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VkoFqbeqW0Ce8WD3I3NCJ0NWg1imnzbFdGCROhKOe/4=;
 b=EABtCq/MKzD6fbAVbH7WxBgQIDLlub5qRRUDvqRAjdeGit5sJx0xuttUuBmO39TTJPUkep
 jq1BRXLRyXvcf0vkLIvNZFBNKe4vhRAYX/K/MElFxbZoMo9576OIXWUOXbpi03kxSVoxYm
 PChQulYNs/9bGfQ1lMSs7wvYsS6UYpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-qmoCFiF-N7qL3Yd8e6ALLA-1; Tue, 16 Feb 2021 11:58:44 -0500
X-MC-Unique: qmoCFiF-N7qL3Yd8e6ALLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B4B6874981;
 Tue, 16 Feb 2021 16:58:43 +0000 (UTC)
Received: from work-vm (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA05A6F450;
 Tue, 16 Feb 2021 16:58:35 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:58:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 0/2] viritofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
Message-ID: <YCv5uRWyJcMMLwjy@work-vm>
References: <20210208224024.43555-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210208224024.43555-1-vgoyal@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> This is V3 of the patches. V2 had been posted here.
> 
> https://listman.redhat.com/archives/virtio-fs/2020-November/msg00084.html
> 
> These patches add support for FUSE_HANDLE_KILLPRIV_V2. This is basically
> a feature file server can opt-in. And with xattr enabled, this improves
> write performance many fold. Ran following fio command while virtiofsd is
> running with options "-o cache=auto" and "-o xattr".

Queued

> fio libaio random writes
> ------------------------
> fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=/mnt/virtiofs/random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randwrite
> 
> Without patches:
>  WRITE: bw=84.6MiB/s (88.7MB/s), 84.6MiB/s-84.6MiB/s (88.7MB/s-88.7MB/s), io=4096MiB (4295MB), run=48436-48436msec
> 
> With patches:
>   WRITE: bw=273MiB/s (286MB/s), 273MiB/s-273MiB/s (286MB/s-286MB/s), io=4096MiB (4295MB), run=15003-15003msec
> 
> So with these patches, for this particular workload, there is roughly
> more than 200% improvement.
> 
> fio psync random writes
> -----------------------
> Even, single queue depth writes with ioengine=psync, how significant
> improvement. Performance jumps from roughly 35MiB/s to 70MiB/s.
> 
> fio --ioengine=psync --name=test --filename=/mnt/virtiofs/random_read_write.fio --bs=4k --size=4G --readwrite=randwrite
> 
> Without patches:
>   WRITE: bw=35.0MiB/s (36.7MB/s), 35.0MiB/s-35.0MiB/s (36.7MB/s-36.7MB/s), io=4096MiB (4295MB), run=116932-116932msec
> 
> With patches:
>  WRITE: bw=69.9MiB/s (73.3MB/s), 69.9MiB/s-69.9MiB/s (73.3MB/s-73.3MB/s), io=4096MiB (4295MB), run=58596-58596msec
> 
> In V3 I rebased these patches to latest upstream. There were few
> conflicts due to recent security fixes from Stefan. Resolved these
> conflicts.
> 
> Thanks
> Vivek
> 
> Vivek Goyal (2):
>   virtiofsd: Save error code early at the failure callsite
>   viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
> 
>  tools/virtiofsd/fuse_common.h    | 15 ++++++
>  tools/virtiofsd/fuse_lowlevel.c  | 11 +++-
>  tools/virtiofsd/fuse_lowlevel.h  |  1 +
>  tools/virtiofsd/passthrough_ll.c | 93 ++++++++++++++++++++++++++++----
>  4 files changed, 108 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.4
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


