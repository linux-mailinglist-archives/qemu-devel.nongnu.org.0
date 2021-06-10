Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182343A2DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:06:47 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLKY-00036S-5t
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrLI9-0000Zj-Il
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrLI4-0006rL-3M
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623333850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jsT63Ix6jEnXnT+1jAmW+4KyGK5RwpN6nVbid4d/AOY=;
 b=d7U6edf755/rwJfxzTn9F550UY+pJJpZxpf+wf3fH2sRmvTNaFm8Ptr8Bubmi6r0gEOAqp
 Ri9Y/oMNTiA/lCq+1knNuoZvhQzD4lcN1B1zrzWFeHqS95UEQI0wfH4MlhhpXc464dZg2C
 BKDTjn/z8+HjZjjtelNr+WBBn1yf2bA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-hQnjt5NgMMSkWbb7Mbg07Q-1; Thu, 10 Jun 2021 10:04:07 -0400
X-MC-Unique: hQnjt5NgMMSkWbb7Mbg07Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7397A18D6A2F;
 Thu, 10 Jun 2021 14:04:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7305E19D7C;
 Thu, 10 Jun 2021 14:04:02 +0000 (UTC)
Date: Thu, 10 Jun 2021 09:04:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
Message-ID: <20210610140400.s5bprikdunfkc5uh@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
 <CAMRbyys9kwJyg3AiowZwFg8uK1pHVPcKOJNckX0h0KUmNQZaMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyys9kwJyg3AiowZwFg8uK1pHVPcKOJNckX0h0KUmNQZaMg@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 04:16:27PM +0300, Nir Soffer wrote:
> On Thu, Jun 10, 2021 at 2:52 AM Nir Soffer <nsoffer@redhat.com> wrote:
> >
> > On Wed, Jun 9, 2021 at 9:01 PM Eric Blake <eblake@redhat.com> wrote:
> 
> I posted a work in progress patch implementing support for
> qemu:joint-allocaition
> in oVirt:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115197
> 
> The most important part is the nbd client:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115197/1/daemon/ovirt_imageio/_internal/nbd.py
> 
> With this our tests pass with qemu-nbd build with Eric patch:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115197/1/daemon/test/client_test.py

Note that you _don't_ have to use qemu:joint-allocation; you could get
the same information by using the already-existing
qemu:allocation-depth.  But your patch DOES make it obvious that it
was a lot simpler to use a single context (the bulk of your tweak is
trying an additional NBD_OPT_SET_META_CONTEXT), than it would be to
handle parallel contexts (where you would have to tweak your
NBD_CMD_BLOCK_STATUS handler to cross-correlate information).

> 
> We may need to use qemu:joint-allocation only for qcow2 images, and
> base:allocation
> for raw images, because allocation depth reporting is not correct for
> raw images. Since

Allocation depth (aka how deep in the backing chain is data allocated)
IS correct for raw images (the raw image IS the source of all data);
it is just not useful.

> we control the qemu-nbd in both cases this should not be an issue. But
> it would be
> better if allocation depth would work for any kind of image, and we always use
> qemu:joint-allocation.

Maybe the thing to do is improve the documentation and try to avoid
ambiguous terminalogy; in qemu:allocation-depth, a return of depth 0
should be called "absent", not "unallocated".  And in libnbd, a
base:allocation of 0 should be "data" or "normal", not "allocated".
But I don't see how qemu will ever advertise an allocation depth of 0
for a raw image, because raw images have no backing chain to defer to.
If you are trying to recreate a sparse raw image, then you really do
want to pay attention to NBD_STATE_HOLE and NBD_STATE_ZERO, as those
are more accurate pictures of the properties of extents within the raw
file.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


