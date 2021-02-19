Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18631FF29
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 20:02:43 +0100 (CET)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDB34-0006nh-Jm
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 14:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lDB1s-0006J3-Dp
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 14:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lDB1p-0003Eh-HV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 14:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613761284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vr08sIKaM5Dhn//7h90nko3kT6pBXSEUeZ9JzYbo8ZY=;
 b=d5q/gdhHjd6jhPctzXOWTjZckbivymRHHn+0w/1lod1zUgDKNDbcfLzLf4jEaUOGhXXtBB
 4jXuZFFUizjzsUihA30QDrQIHJvaXXsre4SRwWB3jXLIakSkUlj2ZqoHm81sep7pSsyDjQ
 azsp+sRP6SAXU4i14VPN5PHLhRnl9q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-v-FzocWLNkyU3boUJcz5sQ-1; Fri, 19 Feb 2021 14:01:20 -0500
X-MC-Unique: v-FzocWLNkyU3boUJcz5sQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2D6D51D8;
 Fri, 19 Feb 2021 19:01:18 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-220.rdu2.redhat.com [10.10.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0D1D60C05;
 Fri, 19 Feb 2021 19:01:12 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2DA8822054F; Fri, 19 Feb 2021 14:01:12 -0500 (EST)
Date: Fri, 19 Feb 2021 14:01:12 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Message-ID: <20210219190112.GC3270@redhat.com>
References: <20200918213436.GA3520@redhat.com> <17216624.eqST2d0sUl@silver>
 <20210219160848.GB3270@redhat.com> <2709384.cAWMFGR5kF@silver>
MIME-Version: 1.0
In-Reply-To: <2709384.cAWMFGR5kF@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
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
Cc: "cdupontd@redhat.com" <cdupontd@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 06:33:46PM +0100, Christian Schoenebeck wrote:
> On Freitag, 19. Februar 2021 17:08:48 CET Vivek Goyal wrote:
> > On Fri, Sep 25, 2020 at 10:06:41AM +0200, Christian Schoenebeck wrote:
> > > On Freitag, 25. September 2020 00:10:23 CEST Vivek Goyal wrote:
> > > > In my testing, with cache=none, virtiofs performed better than 9p in
> > > > all the fio jobs I was running. For the case of cache=auto  for virtiofs
> > > > (with xattr enabled), 9p performed better in certain write workloads. I
> > > > have identified root cause of that problem and working on
> > > > HANDLE_KILLPRIV_V2 patches to improve WRITE performance of virtiofs
> > > > with cache=auto and xattr enabled.
> > > 
> > > Please note, when it comes to performance aspects, you should set a
> > > reasonable high value for 'msize' on 9p client side:
> > > https://wiki.qemu.org/Documentation/9psetup#msize
> > 
> > Hi Christian,
> > 
> > I am not able to set msize to a higher value. If I try to specify msize
> > 16MB, and then read back msize from /proc/mounts, it sees to cap it
> > at 512000. Is that intended?
> 
> 9p server side in QEMU does not perform any msize capping. The code in this
> case is very simple, it's just what you see in function v9fs_version():
> 
> https://github.com/qemu/qemu/blob/6de76c5f324904c93e69f9a1e8e4fd0bd6f6b57a/hw/9pfs/9p.c#L1332
> 
> > $ mount -t 9p -o trans=virtio,version=9p2000.L,cache=none,msize=16777216
> > hostShared /mnt/virtio-9p
> > 
> > $ cat /proc/mounts | grep 9p
> > hostShared /mnt/virtio-9p 9p
> > rw,sync,dirsync,relatime,access=client,msize=512000,trans=virtio 0 0
> > 
> > I am using 5.11 kernel.
> 
> Must be something on client (guest kernel) side. I don't see this here with
> guest kernel 4.9.0 happening with my setup in a quick test:
> 
> $ cat /etc/mtab | grep 9p
> svnRoot / 9p rw,dirsync,relatime,trans=virtio,version=9p2000.L,msize=104857600,cache=mmap 0 0
> $ 
> 
> Looks like the root cause of your issue is this:
> 
> struct p9_client *p9_client_create(const char *dev_name, char *options)
> {
> 	...
> 	if (clnt->msize > clnt->trans_mod->maxsize)
> 		clnt->msize = clnt->trans_mod->maxsize;
> 
> https://github.com/torvalds/linux/blob/f40ddce88593482919761f74910f42f4b84c004b/net/9p/client.c#L1045

That was introduced by a patch 2011.

commit c9ffb05ca5b5098d6ea468c909dd384d90da7d54
Author: Venkateswararao Jujjuri (JV) <jvrao@linux.vnet.ibm.com>
Date:   Wed Jun 29 18:06:33 2011 -0700

    net/9p: Fix the msize calculation.

    msize represents the maximum PDU size that includes P9_IOHDRSZ.


You kernel 4.9 is newer than this. So most likely you have this commit
too. I will spend some time later trying to debug this.

Vivek


