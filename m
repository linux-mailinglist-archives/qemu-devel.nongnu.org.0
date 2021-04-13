Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DB35DDE9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:40:57 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHPc-0006XM-JN
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWHLu-00052I-L1
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWHLr-0004nL-9z
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618313820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ouz9QDO9yC5AgiJ383t7hfQc3eOz5OrU83of1Kj6lxo=;
 b=U+z2a7hItROBK3hgmgybNlhdct/8xeCF0EjmA06qJZlXf6LfCfR6zhn0N2Qw6MtQq/uZny
 CTGgk17HSNkhwKLdeuyYH/XFAJQGynX0VUBH+gzPNfq+ZrhWr+keaGUDNTCp7tTJ0mQgUv
 qpfbMM9PLlX+MahOHO2PRLG6/3yR8cM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-Jcc9dtBvPoGs8hZUtX6QAw-1; Tue, 13 Apr 2021 07:36:58 -0400
X-MC-Unique: Jcc9dtBvPoGs8hZUtX6QAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6C884BA4D;
 Tue, 13 Apr 2021 11:36:57 +0000 (UTC)
Received: from work-vm (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E37053CC7;
 Tue, 13 Apr 2021 11:36:46 +0000 (UTC)
Date: Tue, 13 Apr 2021 12:36:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: fix features handling
Message-ID: <YHWCSwKBZlvJL5th@work-vm>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> > Make virtio-fs take into account server capabilities.
> > 
> > Just returning requested features assumes they all of then are implemented
> > by server and results in setting unsupported configuration if some of them
> > are absent.
> > 
> > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > ---
> >  hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index ac4fc34b36..6cf983ba0e 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -24,6 +24,14 @@
> >  #include "monitor/monitor.h"
> >  #include "sysemu/sysemu.h"
> >  
> > +static const int user_feature_bits[] = {
> > +    VIRTIO_F_VERSION_1,
> > +    VIRTIO_RING_F_INDIRECT_DESC,
> > +    VIRTIO_RING_F_EVENT_IDX,
> > +    VIRTIO_F_NOTIFY_ON_EMPTY,
> > +    VHOST_INVALID_FEATURE_BIT
> > +};
> 
> Please add:
> 
> VIRTIO_F_RING_PACKED
> VIRTIO_F_IOMMU_PLATFORM
> 
> QEMU's virtiofsd does not enable either of these for now, but it's worth
> allowing the vhost-user device backend to participate in negotiation so
> that this can change in the future (or alternative virtiofsd
> implementations can support these features).

OK, so:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


and queued, I'll add those extra 2 lines.  We seem pretty inconsistent
about all the different vhost-user devices.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


