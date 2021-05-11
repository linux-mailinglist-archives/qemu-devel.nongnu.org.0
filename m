Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB89637A9DF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:51:00 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTiu-0007Wj-1Y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgThX-0006Z7-O7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgThS-0000AI-AD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620744568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sK89xM0IJpifEl5nJO0LrHw28zaa90RKXG5Ozyo+9NA=;
 b=Q9c4DNePuj6Q2YNW4j17cISONwgHz9MBmgRZsYv4Vb5CxHMwE1la2FPWn2Yr4EP39HOJMb
 jVHMXQvaZeuDyV6SOVdwmj5Y0ng57I6jt4c9pQKYfIKJ4Tc9jWnEN958Y/yTWf8XP1D3sI
 P9dSSjv7JMuOvlw0ipZ81CaeLpaeGn4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-SQwad5PWOwikj4joQ-6qEw-1; Tue, 11 May 2021 10:49:27 -0400
X-MC-Unique: SQwad5PWOwikj4joQ-6qEw-1
Received: by mail-qv1-f72.google.com with SMTP id
 c20-20020a0cf2d40000b02901e8759f1f5eso5096937qvm.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sK89xM0IJpifEl5nJO0LrHw28zaa90RKXG5Ozyo+9NA=;
 b=n3COfxAbBKEA+LDcwc4mmX5cBeIzTsBKST6gTZ1RmWLuArAyemBW7lV2Fs2mrhDa9T
 JCHe41yRDFySDDl8B7n6+cB0TVpXJzTo04Y8ajxIf9I9Fb5xiZDS0kYi4/DS4eYSQa8r
 tp2AQtx3tAGv3ztE8OwcJPZCLEuAtnRW75tAua9xTlislvUM6ccZEo1oI0szcJ6qp1Uk
 ZqGkVvb/FHnN/ew0rtmYLxKe+df+VrnxGEatzxTL+nHjt27vgEsbmtGHyAv9GOqvTsB5
 9yovhn/9a1auQPrI6tF0UnIX5RErQJdXGBOK14Rk9bkRALt6MzWxCYP8xQun4jo/oIwL
 QX3A==
X-Gm-Message-State: AOAM530QO8uQxO4+UVkq7/SsPVeefZustm1MsTNx7Xf2fEWFtjxItUIR
 PTdC4MuNTvQAC7TUFv5T4it79Oa+KebJDkCvtqFeUefNG81gTQgCk8nnmzH+M1lS7NPQ9xrUKQG
 LZyZfUKMLgG9T8DU=
X-Received: by 2002:a05:620a:2a0f:: with SMTP id
 o15mr7237406qkp.295.1620744566679; 
 Tue, 11 May 2021 07:49:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4kb0sbCk8RoX36mgYeXs6qO+ZFWTiKfRQIfvbaE3YAJhFIYVluBL/QqwriBOoPmGZyMrLbQ==
X-Received: by 2002:a05:620a:2a0f:: with SMTP id
 o15mr7237375qkp.295.1620744566335; 
 Tue, 11 May 2021 07:49:26 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id v65sm14768708qkc.125.2021.05.11.07.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:49:25 -0700 (PDT)
Date: Tue, 11 May 2021 10:49:23 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
Message-ID: <20210511144923.GA238488@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
 <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
 <20210511125409.GA234533@horse>
MIME-Version: 1.0
In-Reply-To: <20210511125409.GA234533@horse>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 08:54:09AM -0400, Vivek Goyal wrote:
> On Tue, May 11, 2021 at 02:31:14PM +0200, Miklos Szeredi wrote:
> > On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
> > >
> > > Honor the expected behavior of syncfs() to synchronously flush all data
> > > and metadata on linux systems. Simply loop on all known submounts and
> > > call syncfs() on them.
> > 
> > Why not pass the submount's root to the server, so it can do just one
> > targeted syncfs?
> > 
> > E.g. somehting like this in fuse_sync_fs():
> > 
> > args.nodeid = get_node_id(sb->s_root->d_inode);
> 
> Hi Miklos,
> 
> I think current proposal was due to lack of full understanding on my part.
> I was assuming we have one super block in client and that's not the case
> looks like. For every submount, we will have another superblock known
> to vfs, IIUC. That means when sync() happens, we will receive ->syncfs()
> for each of those super blocks. And that means file server does not
> have to keep track of submounts explicitly and it will either receive
> a single targeted SYNCFS (for the case of syncfs(fd)) or receive
> multile SYNCFS calls (one for each submount when sync() is called).

Tried sync() with submounts enabled and we are seeing a SYNCFS call
only for top level super block and not for submounts.

Greg noticed that it probably is due to the fact that iterate_super()
skips super blocks which don't have SB_BORN flag set. 

Only vfs_get_tree() seems to set SB_BORN and for our submounts we
are not calling vfs_get_tree(), hence SB_BORN is not set. NFS seems
to call vfs_get_tree() and hence SB_BORN must be set for submounts.

Maybe we need to modify virtio_fs_get_tree() so that it can deal with
mount as well as submounts and then fuse_dentry_automount() should
probably call vfs_get_tree() and that should set SB_BORN and hopefully
sync() will work with it. Greg is planning to give it a try.

Does it sound reasonable.

Thanks
Vivek


