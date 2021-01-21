Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA612FF190
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:16:28 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dZL-0001ly-Qy
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l2dLh-0006RJ-8o
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:02:21 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l2dLd-0008M4-K2
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8NgRgSXDQdw7h9/G/RQBFOBdU5NXlbOjmRqUgK8ocUc=; b=Ti2hWel3hl8+J5LtnKjrvZej41
 GZeqgIlmqmLZMmDUo8u/m1Ciy8Y4mhWIxDzZDh0mH1LlYxcR48md/5K6FQ0FyMIuD6Zx4E41F7kyM
 23UJ/jnZq84wht1bhspkH0BB0yn8R1rpXw69S1QGTtnNnxYXusTNNLqDeH32ZeA3HDow/RbbzY6wZ
 dOMcqr9TqaqQ2yK8ZGQUQlnC65XA4ULqQQMqyqMy70drccnfZ6wpzUHd4Xlthp0+pxrMvcVQrb7Oh
 K1CPg8iJYqnsgJDl00gwmviSEqC+ppfX41pkG9H+hcgsmFENwHFldu4rqneHqmo7g3AHNwhhjqIXw
 A7kP4H9i+46PRbIe+VbOWQ4hQGQRM3VSuSHSInRdy9tDlVq6hmS7swEMuI0Mr43Duw6UUec61ANfo
 t0hVWLvdNgEeFFLy6CAPrM2b6Qr8G2Gc0C2ZbcoOu82b88xZ+jyFilZFyVPcFmFwGR5VWtFQhs6hN
 Un2w98FvfQrXa//CiJw6w6d9Wl2lHM5yl/sXfJ/dgcNoUlvGTpIMI+7Vm96ixkCX1Z5FedzFUXw+C
 VBGpNrBHvICcEYa7hW6R8cYCHOjMh9+TFJ8x56zyndFO6iyyKnZji/oz/cBOm1wcf6C8gEXrfCXI7
 Z3kHIVA2/g1JYgUfW4OaBubdp5fykDFMtM/DsMLRw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] 9pfs: Improve unreclaim loop
Date: Thu, 21 Jan 2021 18:02:05 +0100
Message-ID: <2741984.nYWCrkLCat@silver>
In-Reply-To: <20210121173455.45cbe7a7@bahia.lan>
References: <20210118142300.801516-1-groug@kaod.org>
 <1978739.Uc7ZUDHExb@silver> <20210121173455.45cbe7a7@bahia.lan>
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 21. Januar 2021 17:34:55 CET Greg Kurz wrote:
> > > +
> > > +    /*
> > > +     * v9fs_reopen_fid() can yield : a reference on the fid must be
> > > held
> > > +     * to ensure its pointer remains valid and we can safely pass it to
> > > +     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
> > > +     * we must keep a reference on the next fid as well. So the logic
> > > here
> > > +     * is to get a reference on a fid and only put it back during the
> > > next
> > > +     * iteration after we could get a reference on the next fid. Start
> > > with +     * the first one.
> > > +     */
> > > +    for (fidp->ref++; fidp; fidp = fidp_next) {
> > > +        if (fidp->path.size == path->size &&
> > > +            !memcmp(fidp->path.data, path->data, path->size)) {
> > > 
> > >              /* Mark the fid non reclaimable. */
> > >              fidp->flags |= FID_NON_RECLAIMABLE;
> > >              
> > >              /* reopen the file/dir if already closed */
> > >              err = v9fs_reopen_fid(pdu, fidp);
> > >              if (err < 0) {
> > > 
> > > +                put_fid(pdu, fidp);
> > > 
> > >                  return err;
> > >              
> > >              }
> > > 
> > > +        }
> > > +
> > > +        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> > > +
> > > +        if (fidp_next) {
> > > 
> > >              /*
> > > 
> > > -             * Go back to head of fid list because
> > > -             * the list could have got updated when
> > > -             * switched to the worker thread
> > > +             * Ensure the next fid survives a potential clunk request
> > > during +             * put_fid() below and v9fs_reopen_fid() in the next
> > > iteration. */
> > > -            if (err == 0) {
> > > -                goto again;
> > > -            }
> > > +            fidp_next->ref++;
> > 
> > Mmm, that works as intended if fidp_next matches the requested path.
> > However if it is not (like it would in the majority of cases) then the
> > loop breaks next and the bumped reference count would never be reverted.
> > Or am I missing something here?
> 
> Each iteration of the loop starts with an already referenced fidp.
> 
> The loop can only break if:
> 
> - v9fs_reopen_fid() fails, in which case put_fid(pdu, fidp) is called
>   on the error path above
> - end of list is reached, in which case the reference on fidp is
>   dropped just like in all previous iterations...

Ah yes, you're right. It's fine!

So just the  assert(fidp);  change then, and the log comment fixes would be 
nice to have. ;-) That's it.

> > >          }
> > > 
> > > +
> > > +        /* We're done with this fid */
> > > +        put_fid(pdu, fidp);
> 
> ... here.
> 
> > >      }
> > > 
> > > +
> > > 
> > >      return 0;
> > >  
> > >  }
> > 
> > Best regards,
> > Christian Schoenebeck

Best regards,
Christian Schoenebeck



