Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19737A731
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:55:42 +0200 (CEST)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRvI-0003Fd-UC
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgRu2-0001JD-9o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgRtx-0004gD-Us
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620737655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGTthDek+mgAIu+TrlsM9VBHH27BgvbYkw1Rgv4OG9k=;
 b=JBM6+Q5W5E9Xp/MSeeXdA3dOaO95cpkHdD2GIWSHPIKoCEvDu1ir3YmQlW544LEU1i7Xc3
 km43o4XZjWGFD66I5M08MhwL4bTKMwnPp7C9KNvhER0wF8IjC344rPuFnv6pGBm8p71/3k
 tEzggoEsNXhJbjV/6szNR/gfDymvnbs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-Ndn0_XlZNeC_xECOhhQ5lQ-1; Tue, 11 May 2021 08:54:13 -0400
X-MC-Unique: Ndn0_XlZNeC_xECOhhQ5lQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a24-20020a05620a1038b02902fa6ba180ffso2561426qkk.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xGTthDek+mgAIu+TrlsM9VBHH27BgvbYkw1Rgv4OG9k=;
 b=AWiVtDlay4Z5B+L6Y7pWatUzlky9QYcRacMQlXN7rvMGOk41CmGHmGAHu/sTevI7A0
 O7gMOsN6Ue4O2Jjgmw2HTVu5UQ8VnKjytl1Uh3zvk04XfSYbpaiH8aBoQINZOq2vKAWi
 wwpe5Wm3bbyJ9SNwPlvY+ujXkijW5QqfL9rK0agoMyazeAIVRaGXwUJpAC0R+R5CFrN7
 O9ykCER4w+4v8i7dM3sWCdklgH0bweX/imBFy8AAREizq7r2dlVAccCADDYJhm/dUCEs
 4q2LD5JLrrqV7vFiy+oDDOinE+YsxxWsnX8uPs8LT+mnLxF4fMon2EOCMjnoZ6FJSaH2
 BrvA==
X-Gm-Message-State: AOAM532mo4YNNqbh2QkdOKvPsa/4VM2uuB7UE/BOCBiSLYv+NpEVopcl
 o1WAWOUJnNxL1uLyH1WXSeWtgKJcuiAYzF5z1FLUyqaVNwzD9mBfYWskt3SIEBYmtCqUAgFHRyQ
 CVs72xOob8A6NbPo=
X-Received: by 2002:a37:30c:: with SMTP id 12mr27885328qkd.355.1620737652700; 
 Tue, 11 May 2021 05:54:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX36zytDMmof9gcYi2iwZA9ESzFYj/iyjY2FDVlY2VOPgCImoEWzpYb+2ZnCVJY8xiSf2PtA==
X-Received: by 2002:a37:30c:: with SMTP id 12mr27885231qkd.355.1620737651581; 
 Tue, 11 May 2021 05:54:11 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id 25sm2827573qky.16.2021.05.11.05.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 05:54:11 -0700 (PDT)
Date: Tue, 11 May 2021 08:54:09 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
Message-ID: <20210511125409.GA234533@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
 <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

On Tue, May 11, 2021 at 02:31:14PM +0200, Miklos Szeredi wrote:
> On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > Honor the expected behavior of syncfs() to synchronously flush all data
> > and metadata on linux systems. Simply loop on all known submounts and
> > call syncfs() on them.
> 
> Why not pass the submount's root to the server, so it can do just one
> targeted syncfs?
> 
> E.g. somehting like this in fuse_sync_fs():
> 
> args.nodeid = get_node_id(sb->s_root->d_inode);

Hi Miklos,

I think current proposal was due to lack of full understanding on my part.
I was assuming we have one super block in client and that's not the case
looks like. For every submount, we will have another superblock known
to vfs, IIUC. That means when sync() happens, we will receive ->syncfs()
for each of those super blocks. And that means file server does not
have to keep track of submounts explicitly and it will either receive
a single targeted SYNCFS (for the case of syncfs(fd)) or receive
multile SYNCFS calls (one for each submount when sync() is called).

If that's the case, it makes sense to send nodeid of the root dentry
of superblock and file server can just call syncfs(inode->fd).

Thanks
Vivek


