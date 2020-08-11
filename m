Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B4241AEB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 14:23:31 +0200 (CEST)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5TJS-0003rM-S3
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 08:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1k5TIS-00033x-Tf
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:22:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:60836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1k5TIR-0004ci-5n
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:22:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 369CAAF31;
 Tue, 11 Aug 2020 12:22:46 +0000 (UTC)
Message-ID: <810451cf80032d131d5d3feb4fc8300549516f3d.camel@suse.com>
Subject: Re: [PATCH v2] virtio-rng: return available data with O_NONBLOCK
From: Martin Wilck <mwilck@suse.com>
To: Laurent Vivier <lvivier@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>
Date: Tue, 11 Aug 2020 14:22:24 +0200
In-Reply-To: <7affb721-9686-1262-b7cf-d9681646b602@redhat.com>
References: <20200715133255.10526-1-mwilck@suse.com>
 <7cfc4316-922b-8606-72ce-80205ef55572@redhat.com>
 <7affb721-9686-1262-b7cf-d9681646b602@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=mwilck@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 02:05:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Amit Shah <amit@kernel.org>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-08-11 at 14:02 +0200, Laurent Vivier wrote:
> 
> > >  drivers/char/hw_random/virtio-rng.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/char/hw_random/virtio-rng.c
> > > b/drivers/char/hw_random/virtio-rng.c
> > > index 79a6e47b5fbc..984713b35892 100644
> > > --- a/drivers/char/hw_random/virtio-rng.c
> > > +++ b/drivers/char/hw_random/virtio-rng.c
> > > @@ -59,6 +59,20 @@ static int virtio_read(struct hwrng *rng, void
> > > *buf, size_t size, bool wait)
> > >  	if (vi->hwrng_removed)
> > >  		return -ENODEV;
> > >  
> > > +	/*
> > > +	 * If the previous call was non-blocking, we may have got some
> > > +	 * randomness already.
> > > +	 */
> > > +	if (vi->busy && completion_done(&vi->have_data)) {
> > > +		unsigned int len;
> > > +
> > > +		vi->busy = false;
> > > +		len = vi->data_avail > size ? size : vi->data_avail;
> > > +		vi->data_avail -= len;
> 
> You don't need to modify data_avail. As busy is set to false, the
> buffer
> will be reused. and it is always overwritten by virtqueue_get_buf().
> And moreover, if it was reused it would be always the beginning.

Ok.

> 
> > > +		if (len)
> > > +			return len;
> > > +	}
> > > +
> > >  	if (!vi->busy) {
> > >  		vi->busy = true;
> > >  		reinit_completion(&vi->have_data);
> > > 
> 
> Why don't you modify only the wait case?
> 
> Something like:
> 
> 	if (!wait && !completion_done(&vi->have_data)) {
> 		return 0;
>         }
> 
> then at the end you can do "return min(size, vi->data_avail);".

Sorry, I don't understand what you mean. Where would you insert the
above "if" clause? Are you saying I should call
wait_for_completion_killable() also in the (!wait) case?

I must call check completion_done() before calling reinit_completion().
OTOH, if completion_done() returns false, I can't simply return 0, I
must at least start fetching new random data, so that a subsequent
virtio_read() call has a chance to return something.

Thanks,
Martin




