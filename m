Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF9E31FDEC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:35:47 +0100 (CET)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9gv-0008RG-1u
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lD9fY-0007z6-64
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:34:20 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lD9fS-0003zu-ET
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7obl6Fp+/DjgBAh+ym2fyHr0OgVa5nDHOGYUXxF5LCg=; b=DqfAJMC05AjUecUVmkxv1zAw9q
 r8h+EKukE8S2pxoOFKBn2CuSgV21HF4EmoeIIZroA78zWGWRIt4mRmS9JaNJfvpbtBiWj4m1IPg/E
 +/T8j/H0FXF6IZN35fgs4GZDSMMSmsdtt/W1iv4ZHseuHlYiw2x5oZV115v4dZWMek4+tBy7bNvW2
 O3Vbw07MAJ6MM52oGKxnJjtUPvSyvXCwqB2Zq6hL7jjBqklcC/+8RBBMi/ICwi9CJGO+K4NywoS9y
 Ic6tG4x9JjVdVBg/Q4A7ButVQKkH3CK+HkHg25qho8y6sQO6F7Qr8umSJu11vQ9NA1AwzVDsE5vms
 ppQvLLBWQOduuh5gcpUm/K/niCjMFTOw0CFPAPzXton+bPwlYOxXRzxgV0IzMK3dFS0StD8sV9+TL
 BcT+o9bRw6dyS25NMwv8Oxl4xO1xdawB1+i76dn8XHqh/E7BjBR+nOHL/yHamI/3fhhcQKUel0710
 k6daK+vTKv2mWA/Yb175XVYJNJd1ESNVgtdOl+ROp8tFa6quaJL8F4W2OFyt3CEjhA621pLMXAZcR
 k3OQCBOYh7C1ixQ3/vn31LAimZ7KfmMjQhNyOjYdmP0skAoj8hZ+bPRtLxGowD6ff3Y1FtDOmo4TS
 rMAf/es031cmoI+cU3fyZh54xQuJEiTRdXaEog6c8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vivek Goyal <vgoyal@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Date: Fri, 19 Feb 2021 18:33:46 +0100
Message-ID: <2709384.cAWMFGR5kF@silver>
In-Reply-To: <20210219160848.GB3270@redhat.com>
References: <20200918213436.GA3520@redhat.com> <17216624.eqST2d0sUl@silver>
 <20210219160848.GB3270@redhat.com>
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

On Freitag, 19. Februar 2021 17:08:48 CET Vivek Goyal wrote:
> On Fri, Sep 25, 2020 at 10:06:41AM +0200, Christian Schoenebeck wrote:
> > On Freitag, 25. September 2020 00:10:23 CEST Vivek Goyal wrote:
> > > In my testing, with cache=none, virtiofs performed better than 9p in
> > > all the fio jobs I was running. For the case of cache=auto  for virtiofs
> > > (with xattr enabled), 9p performed better in certain write workloads. I
> > > have identified root cause of that problem and working on
> > > HANDLE_KILLPRIV_V2 patches to improve WRITE performance of virtiofs
> > > with cache=auto and xattr enabled.
> > 
> > Please note, when it comes to performance aspects, you should set a
> > reasonable high value for 'msize' on 9p client side:
> > https://wiki.qemu.org/Documentation/9psetup#msize
> 
> Hi Christian,
> 
> I am not able to set msize to a higher value. If I try to specify msize
> 16MB, and then read back msize from /proc/mounts, it sees to cap it
> at 512000. Is that intended?

9p server side in QEMU does not perform any msize capping. The code in this
case is very simple, it's just what you see in function v9fs_version():

https://github.com/qemu/qemu/blob/6de76c5f324904c93e69f9a1e8e4fd0bd6f6b57a/hw/9pfs/9p.c#L1332

> $ mount -t 9p -o trans=virtio,version=9p2000.L,cache=none,msize=16777216
> hostShared /mnt/virtio-9p
> 
> $ cat /proc/mounts | grep 9p
> hostShared /mnt/virtio-9p 9p
> rw,sync,dirsync,relatime,access=client,msize=512000,trans=virtio 0 0
> 
> I am using 5.11 kernel.

Must be something on client (guest kernel) side. I don't see this here with
guest kernel 4.9.0 happening with my setup in a quick test:

$ cat /etc/mtab | grep 9p
svnRoot / 9p rw,dirsync,relatime,trans=virtio,version=9p2000.L,msize=104857600,cache=mmap 0 0
$ 

Looks like the root cause of your issue is this:

struct p9_client *p9_client_create(const char *dev_name, char *options)
{
	...
	if (clnt->msize > clnt->trans_mod->maxsize)
		clnt->msize = clnt->trans_mod->maxsize;

https://github.com/torvalds/linux/blob/f40ddce88593482919761f74910f42f4b84c004b/net/9p/client.c#L1045

Best regards,
Christian Schoenebeck



