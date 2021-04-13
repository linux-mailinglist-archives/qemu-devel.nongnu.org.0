Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C878A35E030
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:37:28 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJEN-0001Dl-Po
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lWJCs-0008PT-3s
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lWJCo-000337-Mc
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618320949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vKIIpiLJN+6xQi9vZuYDxAi/GM8MC2+O1PPARPGg4RY=;
 b=bKeMvEjP2gzKb3B3YBtVLqSbExrKwiCkqKUO3/sCV8L1vO+mvNS6edDObf7DTyDR3Hepeh
 cV1H5JFKPLnuVfWkZDPRrjCPS21lW3zxi9XfTVM6kXOZyW/BtUS0ZVO5jv0CxPQflFegpb
 UW/DiG6lex6L7pd/v5vBc4T6MhsVZQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-T-emTFj8OHSYmfhsX69yXQ-1; Tue, 13 Apr 2021 09:35:47 -0400
X-MC-Unique: T-emTFj8OHSYmfhsX69yXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0694819251B1;
 Tue, 13 Apr 2021 13:35:45 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-152.rdu2.redhat.com [10.10.116.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10591614FA;
 Tue, 13 Apr 2021 13:35:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9B4D922054F; Tue, 13 Apr 2021 09:35:34 -0400 (EDT)
Date: Tue, 13 Apr 2021 09:35:34 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
Message-ID: <20210413133534.GA1235549@redhat.com>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

On Tue, Apr 13, 2021 at 09:47:14AM +0100, Stefan Hajnoczi wrote:
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

Hi Stefan,

What about

VIRTIO_F_ANY_LAYOUT

I see this one is currently set in requested_features. IIUC, qemu will
assume that device supports VIRTIO_F_ANY_LAYOUT if we don't reset it.

And I see two more flags.

VIRTIO_F_ORDER_PLATFORM
VIRTIO_F_SR_IOV

Should this be part of user_feature_bits[] too?

Thanks
Vivek

> 
> QEMU's virtiofsd does not enable either of these for now, but it's worth
> allowing the vhost-user device backend to participate in negotiation so
> that this can change in the future (or alternative virtiofsd
> implementations can support these features).



> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


