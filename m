Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075E3314DC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:29:20 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJh1-0000X5-Gx
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lJJJA-0004Ix-J0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lJJJ3-00030O-9c
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615223071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLqXlfo0i50oZbTtaunH9YBdlgpiZGEKE8MYrCG8kKg=;
 b=Y8QpJg5Wsyj4wSo3yuW4xjr9wTQMo6EGMgTzwco29/KQ0TkXWKuw7rZrUQhSBXLAlYEAaJ
 hiqqCpIKaDNGyA/2PfA4FzzxpxNwkc3RGkE8IgaxNP/cuN3hSjQBp2KHEs8swoSZtrBUCC
 N+/vxPmaPPnFRoFAjs7ki/HQnZw7qLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-ony9R26rNsyUQWDwAFaJfQ-1; Mon, 08 Mar 2021 12:04:28 -0500
X-MC-Unique: ony9R26rNsyUQWDwAFaJfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F0C61074644
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 17:04:27 +0000 (UTC)
Received: from work-vm (ovpn-113-237.ams2.redhat.com [10.36.113.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B60671002EF0;
 Mon,  8 Mar 2021 17:04:08 +0000 (UTC)
Date: Mon, 8 Mar 2021 17:04:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave commands for
 mapping
Message-ID: <YEZZBlojfa6PH3Wb@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
 <20210211103203.GH247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211103203.GH247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:07PM +0000, Dr. David Alan Gilbert (git) wrote:
> > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> > index d6085f7045..1deedd3407 100644
> > --- a/docs/interop/vhost-user.rst
> > +++ b/docs/interop/vhost-user.rst
> > @@ -1432,6 +1432,26 @@ Slave message types
> >  
> >    The state.num field is currently reserved and must be set to 0.
> >  
> > +``VHOST_USER_SLAVE_FS_MAP``
> > +  :id: 6
> > +  :equivalent ioctl: N/A
> > +  :slave payload: fd + n * (offset + address + len)
> 
> I'm not sure I understand this notation. '+' means field concatenation?
> Is 'fd' a field or does it indicate file descriptor passing?
> 
> I suggest using a struct name instead of informal notation so that the
> payload size and representation is clear.
> 
> The same applies for VHOST_USER_SLAVE_FS_UNMAP.
> 
> > +  :master payload: N/A
> > +
> > +  Requests that the QEMU mmap the given fd into the virtio-fs cache;
> 
> s/QEMU mmap the given fd/given fd be mmapped/
> 
> Please avoid mentioning QEMU specifically. Any VMM should be able to
> implement this spec.
> 
> The same applies for VHOST_USER_SLAVE_FS_UNMAP.

OK, I've changed this to:

+``VHOST_USER_SLAVE_FS_MAP``
+  :id: 6
+  :equivalent ioctl: N/A
+  :slave payload: ``struct VhostUserFSSlaveMsg``
+  :master payload: N/A
+
+  Requests that an fd, provided in the ancillary data, be mmapped
+  into the virtio-fs cache; multiple chunks can be mapped in one
+  command.
+  A reply is generated indicating whether mapping succeeded.
+
+``VHOST_USER_SLAVE_FS_UNMAP``
+  :id: 7
+  :equivalent ioctl: N/A
+  :slave payload: ``struct VhostUserFSSlaveMsg``
+  :master payload: N/A
+
+  Requests that the range in the virtio-fs cache is unmapped;
+  multiple chunks can be unmapped in one command.
+  A reply is generated indicating whether unmapping succeeded.
+

(Although it'll get a little more complicated as I rework for
Chirantan's comment)

Dave

> > +  multiple chunks can be mapped in one command.
> > +  A reply is generated indicating whether mapping succeeded.
> > +
> > +``VHOST_USER_SLAVE_FS_UNMAP``
> > +  :id: 7
> > +  :equivalent ioctl: N/A
> > +  :slave payload: n * (address + len)
> > +  :master payload: N/A
> > +
> > +  Requests that the QEMU un-mmap the given range in the virtio-fs cache;
> > +  multiple chunks can be unmapped in one command.
> > +  A reply is generated indicating whether unmapping succeeded.


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


