Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D4314AF0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:57:54 +0100 (CET)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OqH-0001OG-3j
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9Ndj-0002R3-8t
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 02:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9Ndg-0000nw-Ni
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 02:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612856446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6x4u+opDx/MW3/qsSJsU9W6czMaXHqtZSx8UCL80p2Q=;
 b=OGFzZWIOdahK2wscYEdp8gocRutsn6AODriHoTeic2aNIhT2zWlnsF4OKKfA7R/duj2moI
 n39o1S4N4VfFeIa1cqiXub1zsbr2Bq1CDPvlRWAHxNyegxaV21crB7e6S6iDC7C5RrLTpz
 H4otMRotXale2NNU0IHXRJY4PTdSGhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-4Fs5i3gdPtO5SMqFC_vSPw-1; Tue, 09 Feb 2021 02:40:44 -0500
X-MC-Unique: 4Fs5i3gdPtO5SMqFC_vSPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F18491270;
 Tue,  9 Feb 2021 07:40:43 +0000 (UTC)
Received: from gondolin (ovpn-112-148.ams2.redhat.com [10.36.112.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 423A661F49;
 Tue,  9 Feb 2021 07:40:39 +0000 (UTC)
Date: Tue, 9 Feb 2021 08:40:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC] pvrdma: wean code off pvrdma_ring.h kernel header
Message-ID: <20210209084036.582311ad.cohuck@redhat.com>
In-Reply-To: <20210208132844-mutt-send-email-mst@kernel.org>
References: <20210122180029.575284-1-cohuck@redhat.com>
 <20210208132844-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 13:29:53 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jan 22, 2021 at 07:00:29PM +0100, Cornelia Huck wrote:
> > The pvrdma code relies on the pvrdma_ring.h kernel header for some
> > basic ring buffer handling. The content of that header isn't very
> > exciting, but contains some (q)atomic_*() invocations that (a)
> > cause manual massaging when doing a headers update, and (b) are
> > an indication that we probably should not be importing that header
> > at all.
> > 
> > Let's reimplement the ring buffer handling directly in the pvrdma
> > code instead. This arguably also improves readability of the code.
> > 
> > Importing the header can now be dropped.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> 
> Given it's a single struct that we need, this is a good fix.
> How about adding a comment explaining where it came from,
> just in case rdma guys decide to export this in uapi properly?

> > diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h
> > index 5f2a0cf9b9fa..d231588ce004 100644
> > --- a/hw/rdma/vmw/pvrdma_dev_ring.h
> > +++ b/hw/rdma/vmw/pvrdma_dev_ring.h
> > @@ -19,18 +19,23 @@
> >  
> >  #define MAX_RING_NAME_SZ 32
> >  

/* struct pvrdma_ring from drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h */

> > +typedef struct PvrdmaRingState {
> > +    int prod_tail; /* producer tail */
> > +    int cons_head; /* consumer head */
> > +} PvrdmaRingState;
> > +

I guess this can be folded in?


