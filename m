Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7C37AA81
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:20:03 +0200 (CEST)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUB0-0007Af-6m
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgU7s-0004ID-Gy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgU7p-0007sy-1p
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620746192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ofC0rBi4DPPTj74xp81sP5GGpV+ugu6+KkhMIEvk3x4=;
 b=QVMUru55BGaags89wlea8hAtJ76iONgOtdtfjQDyDZ1DA7HDMLw5psfg5L2WfYkBk0C6qv
 JZb4kDpoD0Jn4KbsQ4ZJSvonJ2SvSodLUn0ydqFOw2wp4jIfdfuwqlN04n5vZFFEbH+cqJ
 Oeo00AWBVaVz+SHQ3StYgI5h2ba+Y1A=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-ZIX8lk4CMeyGOWPE3TEyCQ-1; Tue, 11 May 2021 11:16:29 -0400
X-MC-Unique: ZIX8lk4CMeyGOWPE3TEyCQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 y18-20020a0cd9920000b02901c32e3e18f7so15755225qvj.15
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ofC0rBi4DPPTj74xp81sP5GGpV+ugu6+KkhMIEvk3x4=;
 b=RVnVVLmfI8Y/QfXxyOH01PD+7mOs3MKookbQjhL5Pubrg2aL7CV/uw23kTJPOskt09
 XSRLAaRr7wu2GG6oGLRewash7dVd/Q9gZ+onwEM4bsDD5+ilrhtm2jDzzWWFPRGpnYen
 sEaOheNW1bINp66t1HJF4w6RzW//IiNJAZGEL5ldtzSbHmOZJSLnI+c/C03WsBgHp80N
 7zPSiKko8qOgJa8OxIsJ+1ekCgF41Tm2Rn/wi33PHshyBYEZLRDWrrQpW7gmierd9a56
 n8q2bjgFoTW7KCMsTjsuHDOi8E9Pl5lOq+SEHb0/EvwA0rljgwCB8aJyr6LwaNRx6/6w
 FgVQ==
X-Gm-Message-State: AOAM5314c2WWurMPP15Luel/TTbJzKng2MgNUjUYUSM+cn1ViOEYQmSy
 1AJ7lj+cA5ftwhQrY8adIEQJuoBBtuEieOrlsvopCsFCxS0bneNHEeyR0NwC915f8QpU6yn136b
 9bAVTBBUNm+RthAw=
X-Received: by 2002:a0c:c447:: with SMTP id t7mr30058991qvi.60.1620746189187; 
 Tue, 11 May 2021 08:16:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4aJlekwQNcRyqocU4BWwi3mAVhpr5Mu7ViTGISYvK4QWRRRcGQUhLMl9d/MYz4rhlALi3FQ==
X-Received: by 2002:a0c:c447:: with SMTP id t7mr30058966qvi.60.1620746188974; 
 Tue, 11 May 2021 08:16:28 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id b7sm12579971qte.80.2021.05.11.08.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:16:28 -0700 (PDT)
Date: Tue, 11 May 2021 11:16:26 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
Message-ID: <20210511151626.GC238488@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
 <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
 <20210511125409.GA234533@horse> <20210511144923.GA238488@horse>
 <CAOssrKeSBnDTa3SF0y49ZuoFMJPr1iq6KqzPCkXYmNsRxXP7vQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKeSBnDTa3SF0y49ZuoFMJPr1iq6KqzPCkXYmNsRxXP7vQ@mail.gmail.com>
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

On Tue, May 11, 2021 at 05:08:42PM +0200, Miklos Szeredi wrote:
> On Tue, May 11, 2021 at 4:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Tue, May 11, 2021 at 08:54:09AM -0400, Vivek Goyal wrote:
> > > On Tue, May 11, 2021 at 02:31:14PM +0200, Miklos Szeredi wrote:
> > > > On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
> > > > >
> > > > > Honor the expected behavior of syncfs() to synchronously flush all data
> > > > > and metadata on linux systems. Simply loop on all known submounts and
> > > > > call syncfs() on them.
> > > >
> > > > Why not pass the submount's root to the server, so it can do just one
> > > > targeted syncfs?
> > > >
> > > > E.g. somehting like this in fuse_sync_fs():
> > > >
> > > > args.nodeid = get_node_id(sb->s_root->d_inode);
> > >
> > > Hi Miklos,
> > >
> > > I think current proposal was due to lack of full understanding on my part.
> > > I was assuming we have one super block in client and that's not the case
> > > looks like. For every submount, we will have another superblock known
> > > to vfs, IIUC. That means when sync() happens, we will receive ->syncfs()
> > > for each of those super blocks. And that means file server does not
> > > have to keep track of submounts explicitly and it will either receive
> > > a single targeted SYNCFS (for the case of syncfs(fd)) or receive
> > > multile SYNCFS calls (one for each submount when sync() is called).
> >
> > Tried sync() with submounts enabled and we are seeing a SYNCFS call
> > only for top level super block and not for submounts.
> >
> > Greg noticed that it probably is due to the fact that iterate_super()
> > skips super blocks which don't have SB_BORN flag set.
> >
> > Only vfs_get_tree() seems to set SB_BORN and for our submounts we
> > are not calling vfs_get_tree(), hence SB_BORN is not set. NFS seems
> > to call vfs_get_tree() and hence SB_BORN must be set for submounts.
> >
> > Maybe we need to modify virtio_fs_get_tree() so that it can deal with
> > mount as well as submounts and then fuse_dentry_automount() should
> > probably call vfs_get_tree() and that should set SB_BORN and hopefully
> > sync() will work with it. Greg is planning to give it a try.
> >
> > Does it sound reasonable.
> 
> Just setting SB_BORN sounds much simpler.  What's the disadvantage?

I was little hesitant to set it directly because no other filesystem
seems to be doing it. Hence I assumed that VFS expects filesystems to
not set SB_BORN.

But I do agree that setting SB_BORN in automount code is much simpler
solution.

Thanks
Vivek


