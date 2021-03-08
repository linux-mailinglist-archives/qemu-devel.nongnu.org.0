Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40C33150B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:42:43 +0100 (CET)
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJty-0000Lv-6N
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJJhb-0002ww-QY; Mon, 08 Mar 2021 12:29:56 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:42377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJJhX-0005gE-2U; Mon, 08 Mar 2021 12:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1615224590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qx692fbHiRL4L6T+MZfu9C8g3d1iJXU8ETMMmyC4JAk=;
 b=TF3M6HBETa3LRZZRf6S5s84nWcIA1zjivUSfJZFQPInOEGVCb6ig2XAt
 LyyT65jBTMe/MFpQh1SU4lTquSQzEJRpxumTzaN68dRyebC0kfT2Usy6d
 0JhR03TCZriBrejPEs/iZHQqQHXbOrvot16vzDqAP09BvS7V/xyb4H7tf w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: j20KibSo3L8aG0dbglfkza8MpIL91Sk0L4AOpy/JSV8rb0P6eO/qFqdpeft2WyX7Gm8rqtfH0w
 +E16GcrD3X9FLrloQJJvApoXQXmmSvVZvW6uHtVTHlYFX0SiICk/06GkLDyR1hJQRRUYppN+zw
 WE3dm19Wv6Q4dOtqQ/gIdOp/rhZbPb49nJNTtKKeKSBkf/ur68+YrBTDr+T2eY4f3OcXKBAlbN
 XUjo5LlEcTmDelLt1tIYGcyxGSt7m4CyWjcnINYLXBlAkcXVGPD+o0zFYesd3WFAsSu3Z9U3jA
 5Uo=
X-SBRS: 4.0
X-MesageID: 38785020
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; d="scan'208";a="38785020"
Date: Mon, 8 Mar 2021 17:29:40 +0000
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Maxim
 Levitsky <mlevitsk@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
 <qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
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

On Mon, Mar 08, 2021 at 03:38:49PM +0100, Paolo Bonzini wrote:
> On 08/03/21 15:32, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Whenever a Xen block device is detach via xenstore, the image
> > associated with it remained open by the backend QEMU and an error is
> > logged:
> >      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> > 
> > This happened since object_unparent() doesn't immediately frees the
> > object and thus keep a reference to the node we are trying to free.
> > The reference is hold by the "drive" property and the call
> > xen_block_drive_destroy() fails.
> > 
> > In order to fix that, we call drain_call_rcu() to run the callback
> > setup by bus_remove_child() via object_unparent().
> > 
> > Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > CCing people whom introduced/reviewed the change to use RCU to give
> > them a chance to say if the change is fine.
> 
> If nothing else works then I guess it's okay, but why can't you do the
> xen_block_drive_destroy from e.g. an unrealize callback?

I'm not sure if that's possible.

xen_block_device_create/xen_block_device_destroy() is supposed to be
equivalent to do those qmp commands:
    blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
    device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2

But I tried to add a call xen_block_drive_destroy from
xen_block_unrealize, but that still is called too early, it's called
before object_property_del_all() which would delete "drive" and call
release_drive() which would free the node.

So, no, I don't think we can use an unrealized callback.

I though of trying to delete the "drive" property ahead of calling
object_unparent() but I didn't figure out how to do so and it's maybe
not possible.

So either drain_call_rcu or adding call_rcu(xen_block_drive_destroy)
seems to be the way, but since xen_block_drive_destroy uses
qmp_blockdev_del, it seems better to drain_call_rcu.

Cheers,

-- 
Anthony PERARD

