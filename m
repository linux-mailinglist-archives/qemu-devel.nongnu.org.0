Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793D42110D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:04 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOhH-0004w8-3J
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXOXW-0001Xn-S1
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXOXT-0002IO-Hc
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633356113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3/hKPNiynaaU9fk28u8RuIbHNMqGoTYSy4MgVsqQOc=;
 b=HEUDh0rVhB5mTOOjCoJ42y//AlILvoNaCiH3Qwpf8TtQx9ZvjWSLJ+kpJSDAzlWz5RfWSn
 KzeyB36jEwJSceZ9tLDM/xpU6EQHm8IMg9PF3JPZasbjLxgq7YzaqZZxcQPUkIIQE0OU/5
 zjG5gnRSPPfXY60WHTOvn7z0KR7cnYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-JGKMR30HNx2pR5dhLG7nHg-1; Mon, 04 Oct 2021 10:01:51 -0400
X-MC-Unique: JGKMR30HNx2pR5dhLG7nHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 944351023F56;
 Mon,  4 Oct 2021 14:01:50 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A57B5D9DE;
 Mon,  4 Oct 2021 14:01:25 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 0FF0B220BDB; Mon,  4 Oct 2021 10:01:25 -0400 (EDT)
Date: Mon, 4 Oct 2021 10:01:24 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 02/13] virtiofsd: fuse.h header file changes for lock
 notification
Message-ID: <YVsJNDJxsy1NAhHE@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-3-vgoyal@redhat.com>
 <YVr+oqwYRx11MBug@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVr+oqwYRx11MBug@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 02:16:18PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:26AM -0400, Vivek Goyal wrote:
> > This change comes from fuse.h kernel header file udpate. Hence keeping
> > it in a separate patch.
> 
> QEMU syncs include/standard-headers/linux/ from linux.git. Please
> indicate the status of this fuse.h change:
> - Is it already in a Linux release?
> - Or is it already in linux.git?
> - Or is it awaiting review from the kernel FUSE maintainer?

This is awaiting review from kernel FUSE maintainer.

I have posted kernel patches here.

https://lore.kernel.org/linux-fsdevel/20210930143850.1188628-1-vgoyal@redhat.com/

Vivek

> 
> We need to wait for the kernel change to get into linux.git before
> merging this patch in QEMU. This ensures that QEMU uses actual released
> kernel interfaces that are guaranteed to be stable.
> 
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  include/standard-headers/linux/fuse.h | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
> > index cce105bfba..0b6218d569 100644
> > --- a/include/standard-headers/linux/fuse.h
> > +++ b/include/standard-headers/linux/fuse.h
> > @@ -181,6 +181,8 @@
> >   *  - add FUSE_OPEN_KILL_SUIDGID
> >   *  - extend fuse_setxattr_in, add FUSE_SETXATTR_EXT
> >   *  - add FUSE_SETXATTR_ACL_KILL_SGID
> > + *  7.35
> > + *  - add FUSE_NOTIFY_LOCK
> >   */
> >  
> >  #ifndef _LINUX_FUSE_H
> > @@ -212,7 +214,7 @@
> >  #define FUSE_KERNEL_VERSION 7
> >  
> >  /** Minor version number of this interface */
> > -#define FUSE_KERNEL_MINOR_VERSION 33
> > +#define FUSE_KERNEL_MINOR_VERSION 35
> >  
> >  /** The node ID of the root inode */
> >  #define FUSE_ROOT_ID 1
> > @@ -521,6 +523,7 @@ enum fuse_notify_code {
> >  	FUSE_NOTIFY_STORE = 4,
> >  	FUSE_NOTIFY_RETRIEVE = 5,
> >  	FUSE_NOTIFY_DELETE = 6,
> > +	FUSE_NOTIFY_LOCK = 7,
> >  	FUSE_NOTIFY_CODE_MAX,
> >  };
> >  
> > @@ -912,6 +915,12 @@ struct fuse_notify_retrieve_in {
> >  	uint64_t	dummy4;
> >  };
> >  
> > +struct fuse_notify_lock_out {
> > +	uint64_t	unique;
> > +	int32_t		error;
> > +	int32_t		padding;
> > +};
> > +
> >  /* Device ioctls: */
> >  #define FUSE_DEV_IOC_MAGIC		229
> >  #define FUSE_DEV_IOC_CLONE		_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
> > -- 
> > 2.31.1
> > 



