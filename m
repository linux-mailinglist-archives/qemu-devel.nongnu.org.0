Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64D3205F7
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 16:39:58 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDUMP-0006Qg-3Q
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 10:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lDULY-0005yg-5v
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 10:39:04 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:48347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lDULV-0001Sj-Mc
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 10:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qgF4p9o9bWi4rh7lgbhXkq3ftTbSLR/UJniF++kdCf4=; b=bDpkHjww1lT1V6hwOTnION5nNy
 ZR0To6UTdZa3NRStyCHPVPYy/mdPOpWPJzaTXk4Zhlfriw1BIKIJEG6i5eWlNYirem/9KP4plNmyn
 UBqzkQ2TM7nUdHhHpEpbXh3T6fdzQwoFhjNooXr7yu5yJciqbODWdLVPZcESurinwrX9njJGNjI1K
 7bLi+8uxQ9afqcL42U6j1DK4FyENQ+2W27aECBsoLa/8pZ+CAwJPZn/0HOoUYPA3kzUG1sGloVFbj
 onAFyUg5yxpiyD099n74U4tXJn1WnWbPTAyKbAkGwGBMVOzzIK/PwPp4zNLwRiH3aKq8v2kZSlMn8
 jAA3ZsxaerPg2yCHrboO6uUg/AQKIl0uTUajhCEsCM6IQGrcKO3TIh+0J9WrJgiPYqOzN9Ms4Njbe
 ZgvsOG3LVxbUNxEIOC3MxiHyTlKKL44AHxnh5hBGQUeBzhXhNXt9+QqbUP4Ry0W8SG4i/haNXyfHN
 Wxeh5mfMZ9t+fBQh0y/OqYXn1OKPXOIdyuiQBhBQruhMUd46tKyNLptflZypCf0+ZKcJuN2GOgPAD
 4no8S2VuZBKnivSnH1xFVNSZBpzC1BilJlidCNmxLLUJAsVt61yJu1GLNU/2sszW9lnX+FPW1FJlo
 kIZxvq51oKyK5zMrm0sYigY2y27AT9Qw4ak+G1d20=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vivek Goyal <vgoyal@redhat.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Date: Sat, 20 Feb 2021 16:38:35 +0100
Message-ID: <2337260.PURPEL5hZR@silver>
In-Reply-To: <20210219190112.GC3270@redhat.com>
References: <20200918213436.GA3520@redhat.com> <2709384.cAWMFGR5kF@silver>
 <20210219190112.GC3270@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 19. Februar 2021 20:01:12 CET Vivek Goyal wrote:
> On Fri, Feb 19, 2021 at 06:33:46PM +0100, Christian Schoenebeck wrote:
> > On Freitag, 19. Februar 2021 17:08:48 CET Vivek Goyal wrote:
> > > On Fri, Sep 25, 2020 at 10:06:41AM +0200, Christian Schoenebeck wrote:
> > > > On Freitag, 25. September 2020 00:10:23 CEST Vivek Goyal wrote:
> > > > > In my testing, with cache=none, virtiofs performed better than 9p in
> > > > > all the fio jobs I was running. For the case of cache=auto  for
> > > > > virtiofs
> > > > > (with xattr enabled), 9p performed better in certain write
> > > > > workloads. I
> > > > > have identified root cause of that problem and working on
> > > > > HANDLE_KILLPRIV_V2 patches to improve WRITE performance of virtiofs
> > > > > with cache=auto and xattr enabled.
> > > > 
> > > > Please note, when it comes to performance aspects, you should set a
> > > > reasonable high value for 'msize' on 9p client side:
> > > > https://wiki.qemu.org/Documentation/9psetup#msize
> > > 
> > > Hi Christian,
> > > 
> > > I am not able to set msize to a higher value. If I try to specify msize
> > > 16MB, and then read back msize from /proc/mounts, it sees to cap it
> > > at 512000. Is that intended?
> > 
> > 9p server side in QEMU does not perform any msize capping. The code in
> > this
> > case is very simple, it's just what you see in function v9fs_version():
> > 
> > https://github.com/qemu/qemu/blob/6de76c5f324904c93e69f9a1e8e4fd0bd6f6b57a
> > /hw/9pfs/9p.c#L1332> 
> > > $ mount -t 9p -o trans=virtio,version=9p2000.L,cache=none,msize=16777216
> > > hostShared /mnt/virtio-9p
> > > 
> > > $ cat /proc/mounts | grep 9p
> > > hostShared /mnt/virtio-9p 9p
> > > rw,sync,dirsync,relatime,access=client,msize=512000,trans=virtio 0 0
> > > 
> > > I am using 5.11 kernel.
> > 
> > Must be something on client (guest kernel) side. I don't see this here
> > with
> > guest kernel 4.9.0 happening with my setup in a quick test:
> > 
> > $ cat /etc/mtab | grep 9p
> > svnRoot / 9p
> > rw,dirsync,relatime,trans=virtio,version=9p2000.L,msize=104857600,cache=m
> > map 0 0 $
> > 
> > Looks like the root cause of your issue is this:
> > 
> > struct p9_client *p9_client_create(const char *dev_name, char *options)
> > {
> > 
> > 	...
> > 	if (clnt->msize > clnt->trans_mod->maxsize)
> > 	
> > 		clnt->msize = clnt->trans_mod->maxsize;
> > 
> > https://github.com/torvalds/linux/blob/f40ddce88593482919761f74910f42f4b84
> > c004b/net/9p/client.c#L1045
> That was introduced by a patch 2011.
> 
> commit c9ffb05ca5b5098d6ea468c909dd384d90da7d54
> Author: Venkateswararao Jujjuri (JV) <jvrao@linux.vnet.ibm.com>
> Date:   Wed Jun 29 18:06:33 2011 -0700
> 
>     net/9p: Fix the msize calculation.
> 
>     msize represents the maximum PDU size that includes P9_IOHDRSZ.
> 
> 
> You kernel 4.9 is newer than this. So most likely you have this commit
> too. I will spend some time later trying to debug this.
> 
> Vivek

As the kernel code sais trans_mod->maxsize, maybe its something in virtio on
qemu side that does an automatic step back for some reason. I don't see
something in the 9pfs virtio transport driver (hw/9pfs/virtio-9p-device.c on
QEMU side) that would do this, so I would also need to dig deeper.

Do you have some RAM limitation in your setup somewhere?

For comparison, this is how I started the VM:

~/git/qemu/build/qemu-system-x86_64 \
-machine pc,accel=kvm,usb=off,dump-guest-core=off -m 2048 \
-smp 4,sockets=4,cores=1,threads=1 -rtc base=utc \
-boot strict=on -kernel /home/bee/vm/stretch/boot/vmlinuz-4.9.0-13-amd64 \
-initrd /home/bee/vm/stretch/boot/initrd.img-4.9.0-13-amd64 \
-append 'root=svnRoot rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,msize=104857600,cache=mmap console=ttyS0' \
-fsdev local,security_model=mapped,multidevs=remap,id=fsdev-fs0,path=/home/bee/vm/stretch/ \
-device virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=svnRoot \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-nographic

So the guest system is running entirely and solely on top of 9pfs (as root fs)
and hence it's mounted by above's CL i.e. immediately when the guest is
booted, and RAM size is set to 2 GB.

Best regards,
Christian Schoenebeck



