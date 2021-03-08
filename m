Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E43316D2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:57:40 +0100 (CET)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJL4V-0004NT-S5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJKPJ-0003U2-RB; Mon, 08 Mar 2021 13:15:07 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:2025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJKPH-0008K0-Cx; Mon, 08 Mar 2021 13:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1615227303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rZ4SkJ8X/hZwpDyh0viVcvZuGzds7uuy62Q7Mz9ot+U=;
 b=LxcFpBiW9MSeI4fGLPJffHHztn4JQtJ7IAjILbk6e9xhZ5afXAKvA/iU
 MlvXFMRL7sy89XiI6fA8PSbsTElgTALyEOsgJtSZG1RV3GqO0XKR5/I2p
 z7hfsePrSxetM5sQ4Cu1CI3zudjvi9BdnsLWRCn/dm+GUfD8uFG8CJdr9 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0Lwi/BiZvEKSYUpO4VUtOzP8Xl9lnKx28tjjXCjF5Mijex70y0RpnhpPGpQ+jJbw1UBVxbqUL/
 XTUO1MnMS5llggK97NFZoFvhT14AdgR5KQJfgW3sADiRXBzolZoJK8SSIrtGx/xnUwBIY+YVLn
 4JOQyle+GUEQi99v/XqgGV203q88/oUrwDz0s4LKmbT6vAKQiTTPFDgfKImR/Bn5x87yNnGlPB
 OBil9M77fkt/slfs6gCzYRFrYjgICVc9/32WlgNQsr4S49V3poUN9OBa5fD47yEndne28W+NKR
 DpI=
X-SBRS: 4.0
X-MesageID: 38789155
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; d="scan'208";a="38789155"
Date: Mon, 8 Mar 2021 18:14:56 +0000
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, "Maxim
 Levitsky" <mlevitsk@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
 <qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
 <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
 <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Mon, Mar 08, 2021 at 06:37:38PM +0100, Paolo Bonzini wrote:
> On 08/03/21 18:29, Anthony PERARD wrote:
> > > If nothing else works then I guess it's okay, but why can't you do the
> > > xen_block_drive_destroy from e.g. an unrealize callback?
> > 
> > I'm not sure if that's possible.
> > 
> > xen_block_device_create/xen_block_device_destroy() is supposed to be
> > equivalent to do those qmp commands:
> >      blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
> >      device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
> > 
> > But I tried to add a call xen_block_drive_destroy from
> > xen_block_unrealize, but that still is called too early, it's called
> > before object_property_del_all() which would delete "drive" and call
> > release_drive() which would free the node.
> 
> Can you use blockdev_mark_auto_del?  Then you don't have to call
> xen_block_drive_destroy at all.

There is no legacy_dinfo, so blockdev_mark_auto_del doesn't work.

-- 
Anthony PERARD

