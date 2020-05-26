Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC41DBB9C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 19:36:02 +0200 (CEST)
Received: from localhost ([::1]:60204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbSdN-0007kl-0n
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 13:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1jbScS-0006rx-Nk
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:35:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1jbScR-0005UR-Ey
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:35:04 -0400
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A57D220709;
 Wed, 20 May 2020 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589996102;
 bh=I4OjoXpzqnyuXULuQZ/vUsj6Sj5E8T2qU9GYKKG5SE4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tcoEXJmIB0Ow4D2q5YDEJNtMp00t+gsF63QycBG73m8eTGXKbRggKlh7/xuR0Iyls
 ilgaClwSwh5udmz2UyOwwOLWo+MmasxEtl8oQCcQKh9+SlQoa65jsQFX7heX0luqRo
 p7Ol83sghNZ22bT5oc5/tgyWnO1s1l/N1YvKP/G0=
Date: Wed, 20 May 2020 10:35:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] xen/9pfs: yield when there isn't enough room on the
 ring
In-Reply-To: <14197604.KFEeGaIGOr@silver>
Message-ID: <alpine.DEB.2.21.2005201016280.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005191651130.27502@sstabellini-ThinkPad-T480s>
 <20200520014712.24213-2-sstabellini@kernel.org> <14197604.KFEeGaIGOr@silver>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 13:35:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, paul@xen.org,
 qemu-devel@nongnu.org, groug@kaod.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020, Christian Schoenebeck wrote:
> On Mittwoch, 20. Mai 2020 03:47:12 CEST Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Instead of truncating replies, which is problematic, wait until the
> > client reads more data and frees bytes on the reply ring.
> > 
> > Do that by calling qemu_coroutine_yield(). The corresponding
> > qemu_coroutine_enter_if_inactive() is called from xen_9pfs_bh upon
> > receiving the next notification from the client.
> > 
> > We need to be careful to avoid races in case xen_9pfs_bh and the
> > coroutine are both active at the same time. In xen_9pfs_bh, wait until
> > either the critical section is over (ring->co == NULL) or until the
> > coroutine becomes inactive (qemu_coroutine_yield() was called) before
> > continuing. Then, simply wake up the coroutine if it is inactive.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> 
> In general this patch makes sense to me, and much better and cleaner solution 
> than what we discussed before. Just one detail ...
> 
> >  hw/9pfs/xen-9p-backend.c | 28 ++++++++++++++++++++++------
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> > index fc197f6c8a..3939539028 100644
> > --- a/hw/9pfs/xen-9p-backend.c
> > +++ b/hw/9pfs/xen-9p-backend.c
> > @@ -37,6 +37,7 @@ typedef struct Xen9pfsRing {
> > 
> >      struct iovec *sg;
> >      QEMUBH *bh;
> > +    Coroutine *co;
> > 
> >      /* local copies, so that we can read/write PDU data directly from
> >       * the ring */
> > @@ -198,16 +199,18 @@ static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU
> > *pdu, g_free(ring->sg);
> > 
> >      ring->sg = g_new0(struct iovec, 2);
> > -    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, size);
> > +    ring->co = qemu_coroutine_self();
> > +    smp_wmb();
> > 
> > +again:
> > +    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, size);
> >      buf_size = iov_size(ring->sg, num);
> >      if (buf_size  < size) {
> > -        xen_pv_printf(&xen_9pfs->xendev, 0, "Xen 9pfs request type %d"
> > -                "needs %zu bytes, buffer has %zu\n", pdu->id, size,
> > -                buf_size);
> > -        xen_be_set_state(&xen_9pfs->xendev, XenbusStateClosing);
> > -        xen_9pfs_disconnect(&xen_9pfs->xendev);
> > +        qemu_coroutine_yield();
> > +        goto again;
> >      }
> > +    ring->co = NULL;
> > +    smp_wmb();
> > 
> >      *piov = ring->sg;
> >      *pniov = num;
> > @@ -292,6 +295,19 @@ static int xen_9pfs_receive(Xen9pfsRing *ring)
> >  static void xen_9pfs_bh(void *opaque)
> >  {
> >      Xen9pfsRing *ring = opaque;
> > +    bool wait;
> > +
> > +again:
> > +    wait = ring->co != NULL && qemu_coroutine_entered(ring->co);
> > +    smp_rmb();
> > +    if (wait) {
> > +        cpu_relax();
> > +        goto again;
> > +    }
> > +
> > +    if (ring->co != NULL) {
> > +        qemu_coroutine_enter_if_inactive(ring->co);
> 
> ... correct me if I am wrong, but AFAIK qemu_coroutine_enter_if_inactive() 
> will simply run the coroutine directly on caller's thread, it will not 
> dispatch the coroutine onto the thread which yielded the coroutine before.

Yes, that is correct. I thought it would be fine because the caller here
is a bh function so it should have no problems entering the coroutine.

But I am not that much of an expert on coroutines... Do you think there
could be issues?


> > +    }
> >      xen_9pfs_receive(ring);
> >  }
> 
> AFAICS you have not addressed the problem msize >> xen ringbuffer size, in 
> which case I would expect the Xen driver to loop forever. Am I missing 
> something or have you postponed addressing this?

Yes, I postponed addressing that issue because of a couple of reasons.

For starter strictly speaking it should not be required: msize cannot be
bigger than the ring, but it can be equal to the ring increasing the
chances of having to wait in QEMU. It should still be correct but the
performance might not be great.

The other reason is that I already have the patches for both QEMU and
Linux, but I am seeing a strange error setting order = 10. Order = 9
works fine. I would like to do a bit more investigation before sending
those patches.

