Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C342C241ACB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 14:08:20 +0200 (CEST)
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5T4l-0000QI-Sz
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 08:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1k5T45-0008Qf-E4
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:07:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:55240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1k5T43-0002px-Id
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:07:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3731AF13;
 Tue, 11 Aug 2020 12:07:44 +0000 (UTC)
Message-ID: <e75b3cd527bae4c6762af17a0a32f57c61191274.camel@suse.com>
Subject: Re: [PATCH v2] virtio-rng: return available data with O_NONBLOCK
From: Martin Wilck <mwilck@suse.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Aug 2020 14:07:23 +0200
In-Reply-To: <20200811071726-mutt-send-email-mst@kernel.org>
References: <20200715133255.10526-1-mwilck@suse.com>
 <20200811071726-mutt-send-email-mst@kernel.org>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-08-11 at 07:26 -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 15, 2020 at 03:32:55PM +0200, mwilck@suse.com wrote:
> >  drivers/char/hw_random/virtio-rng.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/char/hw_random/virtio-rng.c
> > b/drivers/char/hw_random/virtio-rng.c
> > index 79a6e47b5fbc..984713b35892 100644
> > --- a/drivers/char/hw_random/virtio-rng.c
> > +++ b/drivers/char/hw_random/virtio-rng.c
> > @@ -59,6 +59,20 @@ static int virtio_read(struct hwrng *rng, void
> > *buf, size_t size, bool wait)
> >  	if (vi->hwrng_removed)
> >  		return -ENODEV;
> >  
> > +	/*
> > +	 * If the previous call was non-blocking, we may have got some
> > +	 * randomness already.
> > +	 */
> > +	if (vi->busy && completion_done(&vi->have_data)) {
> > +		unsigned int len;
> > +
> > +		vi->busy = false;
> > +		len = vi->data_avail > size ? size : vi->data_avail;
> > +		vi->data_avail -= len;
> 
> I wonder what purpose does this line serve: busy is false
> which basically means data_avail is invalid, right?
> A following non blocking call will not enter here.

Well, I thought this is just how reading data normally works. But
you're right, the remainder will not be used. I can remove the line, or
reset data_avail to 0 at this point. What do you prefer?

Regards,
Martin



