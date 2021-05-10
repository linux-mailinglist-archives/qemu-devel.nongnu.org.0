Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7B3792A2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:26:00 +0200 (CEST)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7nD-0003uB-GJ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lg7kx-0001BF-GY
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lg7ku-0003l4-In
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620660215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HEsq+mKfHbrLIQJZ3PB+piJEt4vmZq1oRCUhNybdLs=;
 b=BUMY4jqeUGfqczd1EJAqY9Pn974AWRJu9KbXFWol8KRcrocYOdLtGjQHahFmfugSbG4lWn
 cc9l3JUMt+WF8k8YhF5OVeqKPFmP49V4pWOTeyNtxf9Rik/xAkTbG3uBjpwhiUA2CsrzHg
 E0PZSQitDoVCmKmW0qb/GQ7kvgUowh0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-0z1JodkXN-C3VHiUshBFiQ-1; Mon, 10 May 2021 11:23:27 -0400
X-MC-Unique: 0z1JodkXN-C3VHiUshBFiQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 p133-20020a37428b0000b02902de31dd8da3so11932651qka.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8HEsq+mKfHbrLIQJZ3PB+piJEt4vmZq1oRCUhNybdLs=;
 b=tJcgApDmc7nwnYSiS2Zz7/oNP9IJJO36fIb0PNLD5Pr1nsEnvLfLh2WQfxkr8djNbs
 Wl16xv1C7+QCDua/HnwYwRdEO1JGXwfEw+8KEvjvrJoo0KvIsAAU1LODheZBNkKsC8in
 WewC/f/W9fxDAecUXNrUV/BG72L1UrTLBLPo7nQhihko8BdPDCSAZIzxITcE3AXeRIxk
 yxsDMPedZlB+f1/Iv6du7fLy3327/4tyF/8hCxyeeAMyhp1QKXv4sHB2kExKsgt1N+UZ
 D8Y1xnJkXMlLQPGQVTVr34IGQ1D2UsqP4XEDYOum4hfVWphOmPUCG3QLrGVAvOq3LVNo
 /68w==
X-Gm-Message-State: AOAM530yWoqbF68i0RiCNGTsx71H4a0PXAVN+Lf2hpYYfGqOZXaZUo9D
 MgIISOEDUevjJh3eF2xbfYnARuNLAmkmd2D7Yv9ODp/JMQ+ysOKpc3jR0lNDlW/402pMpAaqy2k
 nTlNZ0jSPBvkE/sA=
X-Received: by 2002:a37:a54f:: with SMTP id o76mr9169466qke.193.1620660207319; 
 Mon, 10 May 2021 08:23:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxlgp7ZM64XjLvlgKO4NH6o63QHSZfQbjtf1zo5dbNpa3BA3YKO/G+IrKOJ5D+nqS4Yb9BMg==
X-Received: by 2002:a37:a54f:: with SMTP id o76mr9169442qke.193.1620660207083; 
 Mon, 10 May 2021 08:23:27 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id k18sm11648657qkg.53.2021.05.10.08.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:23:26 -0700 (PDT)
Date: Mon, 10 May 2021 11:23:24 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <20210510152324.GB150402@horse>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
 <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: virtio-fs@redhat.com, groug@kaod.org,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 10:05:09AM +0100, Stefan Hajnoczi wrote:
> On Thu, May 06, 2021 at 12:02:23PM -0400, Vivek Goyal wrote:
> > On Thu, May 06, 2021 at 04:37:04PM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Apr 28, 2021 at 12:01:00PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > > From: Vivek Goyal <vgoyal@redhat.com>
> > > > 
> > > > If qemu guest asked to drop CAP_FSETID upon write, send that info
> > > > to qemu in SLAVE_FS_IO message so that qemu can drop capability
> > > > before WRITE. This is to make sure that any setuid bit is killed
> > > > on fd (if there is one set).
> > > > 
> > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > 
> > > I'm not sure if the QEMU FSETID patches make sense. QEMU shouldn't be
> > > running with FSETID because QEMU is untrusted. FSETGID would allow QEMU
> > > to create setgid files, thereby potentially allowing an attacker to gain
> > > any GID.
> > 
> > Sure, its not recommended to run QEMU as root, but we don't block that
> > either and I do regularly test with qemu running as root.
> > 
> > > 
> > > I think it's better not to implement QEMU FSETID functionality at all
> > > and to handle it another way.
> > 
> > One way could be that virtiofsd tries to clear setuid bit after I/O
> > has finished. But that will be non-atomic operation and it is filled
> > with perils as it requires virtiofsd to know what all kernel will
> > do if this write has been done with CAP_FSETID dropped.
> > 
> > > In the worst case I/O requests should just
> > > fail, it seems like a rare case anyway:
> > 
> > Is there a way for virtiofsd to know if qemu is running with CAP_FSETID
> > or not. If there is one, it might be reasonable to error out. If we
> > don't know, then we can't fail all the operations.
> > 
> > > I/O to a setuid/setgid file with
> > > a memory buffer that is not mapped in virtiofsd.
> > 
> > With DAX it is easily triggerable. User has to append to a setuid file
> > in virtiofs and this path will trigger.
> > 
> > I am fine with not supporting this patch but will also need a reaosonable
> > alternative solution.
> 
> One way to avoid this problem is by introducing DMA read/write functions
> into the vhost-user protocol that can be used by all device types, not
> just virtio-fs.
> 
> Today virtio-fs uses the IO slave request when it cannot access a region
> of guest memory. It sends the file descriptor to QEMU and QEMU performs
> the pread(2)/pwrite(2) on behalf of virtiofsd.
> 
> I mentioned in the past that this solution is over-specialized. It
> doesn't solve the larger problem that vhost-user processes do not have
> full access to the guest memory space (e.g. DAX window).
> 
> Instead of sending file I/O requests over to QEMU, the vhost-user
> protocol should offer DMA read/write requests so any vhost-user process
> can access the guest memory space where vhost's shared memory mechanism
> is insufficient.
> 
> Here is how it would work:
> 
> 1. Drop the IO slave request, replace it with DMA read/write slave
>    requests.
> 
>    Note that these new requests can also be used in environments where
>    maximum vIOMMU isolation is needed for security reasons and sharing
>    all of guest RAM with the vhost-user process is considered
>    unacceptable.
> 
> 2. When virtqueue buffer mapping fails, send DMA read/write slave
>    requests to transfer the data from/to QEMU. virtiofsd calls
>    pread(2)/pwrite(2) itself with virtiofsd's Linux capabilities.

Can you elaborate a bit more how will this new DMA read/write vhost-user
commands can be implemented. I am assuming its not a real DMA and just
sort of emulation of DMA. Effectively we have two processes and one
process needs to read/write to/from address space of other process.

We were also wondering if we can make use of process_vm_readv()
and process_vm_write() syscalls to achieve this. But this atleast
requires virtiofsd to be more priviliged than qemu and also virtiofsd
needs to know where DAX mapping window is. We briefly discussed this here.

https://lore.kernel.org/qemu-devel/20210421200746.GH1579961@redhat.com/

Vivek


