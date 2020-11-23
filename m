Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FD2C05BC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:26:42 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAvZ-00019E-Qx
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khAuY-0000UL-PB
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khAuW-0001bx-8C
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606134335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MoRclBtV3vswebd8NNlLmhdX94+bCoGjskyTQq3Jas=;
 b=X7PakYCtx0RF506oEylzepYga/WqXRYB1yt7EZwJagKGQ0t4QF0jUVVuXXZtzm4QTBp0Q0
 Pyxr07oFhWFCObqRQ1zUcXsxTB0S8h1+nz52qvFTOTQDkJ+uWZsLUsfZeLwEj/2aqWBO/+
 FSNB2a76qs6jUVVm0dCUfWP0dRiXT0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100--y0dp8OMPQGSIAPPioKj9A-1; Mon, 23 Nov 2020 07:25:30 -0500
X-MC-Unique: -y0dp8OMPQGSIAPPioKj9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAB368799F8;
 Mon, 23 Nov 2020 12:25:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-153.ams2.redhat.com [10.36.113.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CB8A5D6D3;
 Mon, 23 Nov 2020 12:25:27 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:25:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Quentin Grolleau <quentin.grolleau@ovhcloud.com>
Subject: Re: [raw] Guest stuck during live live-migration
Message-ID: <20201123122526.GC5317@merkur.fritz.box>
References: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
MIME-Version: 1.0
In-Reply-To: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Cc: qemu-block ]

Am 23.11.2020 um 10:36 hat Quentin Grolleau geschrieben:
> Hello,
> 
> In our company, we are hosting a large number of Vm, hosted behind Openstack (so libvirt/qemu).
> A large majority of our Vms are runnign with local data only, stored on NVME, and most of them are RAW disks.
> 
> With Qemu 4.0 (can be even with older version) we see strange  live-migration comportement:

First of all, 4.0 is relatively old. Generally it is worth retrying with
the most recent code (git master or 5.2.0-rc2) before having a closer
look at problems, because it is frustrating to spend considerable time
debugging an issue and then find out it has already been fixed a year
ago.

>     - some Vms live migrate at very high speed without issue (> 6 Gbps)
>     - some Vms are running correctly, but migrating at a strange low speed (3Gbps)
>     - some Vms are migrating at a very low speed (1Gbps, sometime less) and during the migration the guest is completely I/O stuck
> 
> When this issue happen the VM is completly block, iostat in the Vm show us a latency of 30 secs

Can you get the stack backtraces of all QEMU threads while the VM is
blocked (e.g. with gdb or pstack)?

> First we thought it was related to an hardware issue we check it, we comparing different hardware, but no issue where found there
> 
> So one of my colleague had the idea to limit with "tc" the bandwidth on the interface the migration was done, and it worked the VM didn't lose any ping nor being  I/O  stuck
> Important point : Once the Vm have been migrate (with the limitation ) one time, if we migrate it again right after, the migration will be done at full speed (8-9Gb/s) without freezing the Vm

Since you say you're using local storage, I assume that you're doing
both a VM live migration and storage migration at the same time. These
are separate connections, storage is migrated using a NBD connection.

Did you limit the bandwith for both connections, or if it was just one
of them, which one was it?

> It only happen on existing VM, we tried to replicate with a fresh instance with exactly the same spec and nothing was happening
> 
> We tried to replicate the workload inside the VM but there was no way to replicate the case. So it was not related to the workload nor to the server that hosts the Vm
> 
> So we thought about the disk of the instance : the raw file.
> 
> We also tried to strace -c the process during the live-migration and it was doing a lot of "lseek"
> 
> and we found this :
> https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html

This case is different in that it used qcow2 (which should behave much
better today).

It also used ZFS, which you didn't mention. Is the problematic image
stored on ZFS? If not, which filesystem is it?

> So i rebuilt Qemu with this patch and the live-migration went well, at high speed and with no VM freeze
> ( https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 )
> 
> Do you have a way to avoid the "lseek" mechanism as it consumes more resources to find the holes in the disk and don't let any for the VM ?

If you can provide the stack trace during the hang, we might be able to
tell why we're even trying to find holes.

Please also provide your QEMU command line.

At the moment, my assumption is that this is during a mirror block job
which is migrating the disk to your destination server. Not looking for
holes would mean that a sparse source file would become fully allocated
on the destination, which is usually not wanted (also we would
potentially transfer a lot more data over the networkj).

Can you give us a snippet from your strace that shows the individual
lseek syscalls? Depending on which ranges are queried, maybe we could
optimise things by caching the previous result.

Also, a final remark, I know of some cases (on XFS) where lseeks were
slow because the image file was heavily fragmented. Defragmenting the
file resolved the problem, so this may be another thing to try.

On XFS, newer QEMU versions set an extent size hint on newly created
image files (during qemu-img create), which can reduce fragmentation
considerably.

Kevin

> Server hosting the VM :
>     - Bi-Xeon hosts With NVME storage and 10 Go Network card
>     - Qemu 4.0 And Libvirt 5.4
>     - Kernel 4.18.0.25
> 
> Guest having the issue :
>     - raw image with Debian 8
> 
> Here the qemu img on the disk :
> > qemu-img info disk
> image: disk
> file format: raw
> virtual size: 400G (429496729600 bytes)
> disk size: 400G
> 
> 
> Quentin GROLLEAU
> 


