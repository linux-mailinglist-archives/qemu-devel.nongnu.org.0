Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2012F4BE1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:01:41 +0100 (CET)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfmO-0004Ow-6v
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzfjX-0002lZ-P7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:58:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzfjV-00082N-3U
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFqzKVBV4XP+LTcaF695DNq86ue+iL+85jnsWlwWHxM=;
 b=ZiPXvOgDx8DcLqPSSQeKAfB4kmulTwQQWF2dXewo76TR6zRFFzPTZHjXv4DmKYdBSm28CQ
 mxQn+vf7ucTYNoCECFQkp1K4EUprDggRyUTJL6mXpcWRFSh8LRf/twqD2d7QHlhKZkXAvQ
 cDPRQms/6XiCXstRJZRwKY2lBo2v6qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-XSR25_fUP-Cyh-RBcNWIsw-1; Wed, 13 Jan 2021 07:58:36 -0500
X-MC-Unique: XSR25_fUP-Cyh-RBcNWIsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA21CE642;
 Wed, 13 Jan 2021 12:58:35 +0000 (UTC)
Received: from gondolin (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A613E5C253;
 Wed, 13 Jan 2021 12:58:27 +0000 (UTC)
Date: Wed, 13 Jan 2021 13:58:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] vfio-ccw: Implement request notifier
Message-ID: <20210113135825.7aedbb72.cohuck@redhat.com>
In-Reply-To: <20210104202057.48048-1-farman@linux.ibm.com>
References: <20210104202057.48048-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  4 Jan 2021 21:20:54 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Conny, et al,
> 
> Here is an updated (final?) version of the QEMU series for the vfio-ccw
> request notifier now that the kernel code landed upstream [1]. The actual
> meat (patch 3) is identical to its counterpart in v2 [2].
> 
> Earlier versions didn't use update-linux-headers.sh; they just carried a
> dummy patch with the define that was needed to work, without the noise.
> Here, I have run the script properly and patch 2 is its output.
> 
> Of course it wasn't that simple, as a change on the kernel side of
> things breaks the script and causes processing to end prematurely as
> cp_portable() takes its error exit. So I am adding a small patch to
> the front of this series to accommodate that, and hopefully isn't
> goofed up too badly. :)
> 
> [1] https://lore.kernel.org/kvm/20201216123701.00517b52@omen.home/
> [2] https://lore.kernel.org/qemu-devel/20201120181526.96446-1-farman@linux.ibm.com/
> 
> Eric Farman (3):
>   update-linux-headers: Include const.h
>   Update linux headers to 5.11-rc2
>   vfio-ccw: Connect the device request notifier
> 
>  hw/vfio/ccw.c                                 |  40 +++-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
>  include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
>  include/standard-headers/linux/const.h        |  36 ++++
>  include/standard-headers/linux/ethtool.h      |   2 +-
>  include/standard-headers/linux/fuse.h         |  30 ++-
>  include/standard-headers/linux/kernel.h       |   9 +-
>  include/standard-headers/linux/pci_regs.h     |  16 ++
>  include/standard-headers/linux/vhost_types.h  |   9 +
>  include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
>  include/standard-headers/linux/virtio_ids.h   |  44 +++--
>  linux-headers/asm-arm64/kvm.h                 |   3 -
>  linux-headers/asm-generic/unistd.h            |   6 +-
>  linux-headers/asm-mips/unistd_n32.h           |   1 +
>  linux-headers/asm-mips/unistd_n64.h           |   1 +
>  linux-headers/asm-mips/unistd_o32.h           |   1 +
>  linux-headers/asm-powerpc/unistd_32.h         |   1 +
>  linux-headers/asm-powerpc/unistd_64.h         |   1 +
>  linux-headers/asm-s390/unistd_32.h            |   1 +
>  linux-headers/asm-s390/unistd_64.h            |   1 +
>  linux-headers/asm-x86/kvm.h                   |   1 +
>  linux-headers/asm-x86/unistd_32.h             |   1 +
>  linux-headers/asm-x86/unistd_64.h             |   1 +
>  linux-headers/asm-x86/unistd_x32.h            |   1 +
>  linux-headers/linux/kvm.h                     |  56 +++++-
>  linux-headers/linux/userfaultfd.h             |   9 +
>  linux-headers/linux/vfio.h                    |   1 +
>  linux-headers/linux/vhost.h                   |   4 +
>  scripts/update-linux-headers.sh               |   5 +-
>  30 files changed, 501 insertions(+), 53 deletions(-)
>  create mode 100644 include/standard-headers/linux/const.h
> 

Thanks, applied.


