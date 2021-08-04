Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FAC3E0778
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:21:29 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLWC-0003LF-1k
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBK8F-0001R0-BT
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBK87-0003gv-MZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628095949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CTInP5fMDULxBxsU3464/Y9aNsk1S8l6QQBMxYt7rn4=;
 b=PvF1LIFoaNTabWTie4dMtL44BWRaNZHJxAgqWX8btLO/PkbAMsx+RU/9CPMfVziEuR/mw4
 xRmgBeGjrpnUrcrDsjXrSSHsWIn0W1Y3CHktMo4DDKEZeUfIx9UZWmu4zzwRXIFHMbAcmX
 VClgtawfAO1m35WLSEModPpsvOZWnGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-vIIv2YiiPNmbe6Ogd-4IQg-1; Wed, 04 Aug 2021 12:52:28 -0400
X-MC-Unique: vIIv2YiiPNmbe6Ogd-4IQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A638030D7;
 Wed,  4 Aug 2021 16:52:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4813D17B4F;
 Wed,  4 Aug 2021 16:52:17 +0000 (UTC)
Date: Wed, 4 Aug 2021 18:52:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <YQrFv9P5/tGPEaH8@redhat.com>
References: <20210729091029.65369-1-f.ebner@proxmox.com>
 <YQfnxLROKL/JUKyF@redhat.com>
 <20210804145048.awmlthlwlv3vcohu@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210804145048.awmlthlwlv3vcohu@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fabian Ebner <f.ebner@proxmox.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.08.2021 um 16:50 hat Stefano Garzarella geschrieben:
> On Mon, Aug 02, 2021 at 02:40:36PM +0200, Kevin Wolf wrote:
> > Am 29.07.2021 um 11:10 hat Fabian Ebner geschrieben:
> > > Linux SCSI can throw spurious -EAGAIN in some corner cases in its
> > > completion path, which will end up being the result in the completed
> > > io_uring request.
> > > 
> > > Resubmitting such requests should allow block jobs to complete, even
> > > if such spurious errors are encountered.
> > > 
> > > Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
> > > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> > > Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> > > ---
> > > 
> > > Changes from v1:
> > >     * Focus on what's relevant for the patch itself in the commit
> > >       message.
> > >     * Add Stefan's comment.
> > >     * Add Stefano's R-b tag (I hope that's fine, since there was no
> > >       change code-wise).
> > > 
> > >  block/io_uring.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/block/io_uring.c b/block/io_uring.c
> > > index 00a3ee9fb8..dfa475cc87 100644
> > > --- a/block/io_uring.c
> > > +++ b/block/io_uring.c
> > > @@ -165,7 +165,21 @@ static void luring_process_completions(LuringState *s)
> > >          total_bytes = ret + luringcb->total_read;
> > > 
> > >          if (ret < 0) {
> > > -            if (ret == -EINTR) {
> > > +            /*
> > > +             * Only writev/readv/fsync requests on regular files or host block
> > > +             * devices are submitted. Therefore -EAGAIN is not expected but it's
> > > +             * known to happen sometimes with Linux SCSI. Submit again and hope
> > > +             * the request completes successfully.
> > > +             *
> > > +             * For more information, see:
> > > +             * https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
> > > +             *
> > > +             * If the code is changed to submit other types of requests in the
> > > +             * future, then this workaround may need to be extended to deal with
> > > +             * genuine -EAGAIN results that should not be resubmitted
> > > +             * immediately.
> > > +             */
> > > +            if (ret == -EINTR || ret == -EAGAIN) {
> > >                  luring_resubmit(s, luringcb);
> > >                  continue;
> > >              }
> > 
> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > 
> > Question about the preexisting code, though: luring_resubmit() requires
> > that the caller calls ioq_submit() later so that the request doesn't
> > just sit in a queue without getting any attention, but actually gets
> > submitted to the kernel.
> > 
> > In the call chain ioq_submit() -> luring_process_completions() ->
> > luring_resubmit(), who takes care of that?
> 
> Mmm, good point.
> There should be the same problem with ioq_submit() ->
> luring_process_completions() -> luring_resubmit_short_read() ->
> luring_resubmit().
> 
> Should we schedule a BH for example in luring_resubmit() to make sure that
> ioq_submit() is invoked after a resubmission?

Or just loop in ioq_submit() after calling luring_process_completions()
if new requests were added to the queue?

Kevin


