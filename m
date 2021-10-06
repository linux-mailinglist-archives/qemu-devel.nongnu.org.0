Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED27423B57
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:16:38 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3yX-0007Km-Iy
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mY3vr-0005pd-3Y
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mY3vp-00058o-Hq
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BECcZUCAGMep+whlUisrU7fulE9mw4zRy9eJJZW+/n0=;
 b=e7VEch9W3XvDswY2TfUHiy7Itfl70bfC74f9kal2/FQ1AHn88bDTO42Ero4EH7GV5UV9yy
 EjqqBHExLNw7SnmEYWxjDqxeGVBCHTluaPp4MYdxX9AMXYlQafD+0WuywCdjuFgaQoSTEr
 DcSbvHdh9B3LTQVEFjK5QqWp7VaT68k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Nx9lqvL7MEqHQKJ-9FBbkw-1; Wed, 06 Oct 2021 06:13:48 -0400
X-MC-Unique: Nx9lqvL7MEqHQKJ-9FBbkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FF4D1006AA2;
 Wed,  6 Oct 2021 10:13:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4725FC13;
 Wed,  6 Oct 2021 10:13:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
In-Reply-To: <20211004151408-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <875yuc3ln2.fsf@redhat.com>
 <20211004110537-mutt-send-email-mst@kernel.org>
 <87wnms23hn.fsf@redhat.com>
 <20211004151408-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 06 Oct 2021 12:13:14 +0200
Message-ID: <87sfxezcjp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 04, 2021 at 05:50:44PM +0200, Cornelia Huck wrote:
>> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> > On Mon, Oct 04, 2021 at 04:33:21PM +0200, Cornelia Huck wrote:
>> >> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >> 
>> >> > On Mon, Oct 04, 2021 at 02:19:55PM +0200, Cornelia Huck wrote:
>> >> >> 
>> >> >> [cc:qemu-devel]
>> >> >> 
>> >> >> On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >> >> 
>> >> >> > ok so that's a QEMU bug. Any virtio 1.0 and up
>> >> >> > compatible device must use LE.
>> >> >> > It can also present a legacy config space where the
>> >> >> > endian depends on the guest.
>> >> >> 
>> >> >> So, how is the virtio core supposed to determine this? A
>> >> >> transport-specific callback?
>> >> >
>> >> > I'd say a field in VirtIODevice is easiest.
>> >> 
>> >> The transport needs to set this as soon as it has figured out whether
>> >> we're using legacy or not.
>> >
>> > Basically on each device config access?
>> 
>> Prior to the first one, I think. It should not change again, should it?
>
> Well yes but we never prohibited someone from poking at both ..
> Doing it on each access means we don't have state to migrate.

Yes; if it isn't too high overhead, that's probably the safest way to
handle it.

>
>> >
>> >> I guess we also need to fence off any
>> >> accesses respectively error out the device if the driver tries any
>> >> read/write operations that would depend on that knowledge?
>> >> 
>> >> And using a field in VirtIODevice would probably need some care when
>> >> migrating. Hm...
>> >
>> > It's just a shorthand to minimize changes. No need to migrate I think.
>> 
>> If we migrate in from an older QEMU, we don't know whether we are
>> dealing with legacy or not, until feature negotiation is already
>> done... don't we have to ask the transport?
>
> Right but the only thing that can happen is config access.

Checking on each config space access would be enough then.

> Well and for legacy a kick I guess.

I think any driver that does something that is not config space access,
status access, or feature bit handling without VERSION_1 being set is
neccessarily legacy? Does that really need special handling?


