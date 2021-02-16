Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55931CBF9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:32:44 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1P9-0008FN-DP
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC1Mz-0007Io-FT
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC1Mi-0002Oj-Fe
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613485811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IcCWr0s/bPaPuguZPvG0GJkUB30AMmCaO5YHfQpN1s=;
 b=FLTfa+vyZRsKsZRrm2Qyn72/8eW9fkUMRKz7mB8OR5m+Do6Nt1W4xORbsUG9POh8sKIY3e
 uQHgn9z1QjH8Kj+dng/q7WpnQmaHa1oqAHOyyYdCXomXQ5ofCW4JpzG4nuESkUcTbbOCYK
 jcqocGz/fSF+VOZKZ+zELZ+ICVnVz4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-5Dj8wnfqOQqp_HxJd2qUEg-1; Tue, 16 Feb 2021 09:30:09 -0500
X-MC-Unique: 5Dj8wnfqOQqp_HxJd2qUEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5660AC290;
 Tue, 16 Feb 2021 14:30:07 +0000 (UTC)
Received: from gondolin (ovpn-113-145.ams2.redhat.com [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E389F2C01F;
 Tue, 16 Feb 2021 14:30:05 +0000 (UTC)
Date: Tue, 16 Feb 2021 15:30:03 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
Message-ID: <20210216153003.16b05725.cohuck@redhat.com>
In-Reply-To: <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216124757.4eb664e9.cohuck@redhat.com>
 <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 15:21:45 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 16/02/2021 12.47, Cornelia Huck wrote:
> > On Tue, 16 Feb 2021 12:00:56 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> According to the virtio specification, a memory barrier should be
> >> used before incrementing the idx field in the "available" ring.
> >> So far, we did not do this in the s390-ccw bios yet, but recently
> >> Peter Maydell saw problems with the s390-ccw bios when running
> >> the qtests on an aarch64 host (the bios panic'ed with the message:
> >> "SCSI cannot report LUNs: response VS RESP=09"), which could
> >> maybe be related to the missing memory barriers. Thus let's add
> >> those barriers now. Since we've only seen the problem on TCG so far,
> >> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
> >> in the TCG translate code.
> >>
> >> (Note: The virtio spec also talks about using a memory barrier
> >> *after* incrementing the idx field, but if I understood correctly
> >> this is only required when using notification suppression - which
> >> we don't use in the s390-ccw bios here)
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   pc-bios/s390-ccw/virtio-net.c | 1 +
> >>   pc-bios/s390-ccw/virtio.c     | 1 +
> >>   pc-bios/s390-ccw/virtio.h     | 2 ++
> >>   3 files changed, 4 insertions(+)
> >>
> >> diff --git a/pc-bios/s390-ccw/virtio-net.c b/pc-bios/s390-ccw/virtio-net.c
> >> index 2fcb0a58c5..25598a7a97 100644
> >> --- a/pc-bios/s390-ccw/virtio-net.c
> >> +++ b/pc-bios/s390-ccw/virtio-net.c
> >> @@ -127,6 +127,7 @@ int recv(int fd, void *buf, int maxlen, int flags)
> >>   
> >>       /* Mark buffer as available to the host again */
> >>       rxvq->avail->ring[rxvq->avail->idx % rxvq->num] = id;
> >> +    virtio_mb();
> >>       rxvq->avail->idx = rxvq->avail->idx + 1;
> >>       vring_notify(rxvq);
> >>   
> >> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> >> index ab49840db8..fb9687f9b3 100644
> >> --- a/pc-bios/s390-ccw/virtio.c
> >> +++ b/pc-bios/s390-ccw/virtio.c
> >> @@ -154,6 +154,7 @@ void vring_send_buf(VRing *vr, void *p, int len, int flags)
> >>   
> >>       /* Chains only have a single ID */
> >>       if (!(flags & VRING_DESC_F_NEXT)) {
> >> +        virtio_mb();  
> > 
> > I think you need to also need barriers for changes to the buffers, as
> > the spec talks about "manipulating the descriptor table".  
> 
> Which paragraph in the virtio spec are you refering to here? I can't find 
> that part right now...

Step 4 in "2.7.13 Supplying Buffers to The Device":

"The driver performs a suitable memory barrier to ensure the device
sees the updated descriptor table and available ring before the next
step."

> 
> >>           vr->avail->idx++;
> >>       }
> >>   }
> >> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> >> index 19fceb6495..6ac65482a9 100644
> >> --- a/pc-bios/s390-ccw/virtio.h
> >> +++ b/pc-bios/s390-ccw/virtio.h
> >> @@ -271,6 +271,8 @@ struct VirtioCmd {
> >>   };
> >>   typedef struct VirtioCmd VirtioCmd;
> >>   
> >> +#define virtio_mb()  asm volatile("bcr 14,0" : : : "memory")  
> > 
> > The bios is built for z900, so you probably need a bcr15 here?  
> 
> I thought about that, too, but for TCG, it currently should not matter since 
> both, 14 and 15, end up with the same code in op_bc() in 
> target/s390x/translate.c. And on a real host, we've never seen this problem 
> to occur, so it should not matter there, too. But if you prefer (e.g. in 
> case somebody tweaks the TCG implementation one day), I can also switch to 
> bcr15 instead.

OK, if they are both implemented with the same code, it should not
really matter. We don't run on any hardware that doesn't support bcr14
anyway.


