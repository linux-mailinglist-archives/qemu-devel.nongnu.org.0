Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C2442A66E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:50:04 +0200 (CEST)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIAN-0004yx-Jt
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maI98-0004HN-E2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maI96-0003hL-Pw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634046524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6Q/hlnT7SUSXbJPb9yIf58DKoWrTsiqekTPcluee7g=;
 b=GFgG+JsH9SrXXaYn3P7uwR/y8AZx2YHLk9yzSI1kHNY03kIJhXxHKJZMjJFc3bq33tUFnJ
 fz7LjNnXZTpD7jy2+ruZZWQQBfUqta6DC37NkgZjYlq9gqzo64floGquaoWlrqLF5oAe3a
 6plvRGfQNfF9ek/2sNYlj13TjW7KWws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-FHOsvxvPMcePLQrwgWN2QQ-1; Tue, 12 Oct 2021 09:48:43 -0400
X-MC-Unique: FHOsvxvPMcePLQrwgWN2QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8645C11B4725;
 Tue, 12 Oct 2021 13:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A25BF2AF99;
 Tue, 12 Oct 2021 13:48:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B523113865F; Tue, 12 Oct 2021 15:48:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
 <87y26yg6nt.fsf@dusky.pond.sub.org>
 <CAJaqyWcqLWAUEOyaenYYzXDhU=rh1+inr_o3C-3th8Pz0BjOpg@mail.gmail.com>
Date: Tue, 12 Oct 2021 15:48:17 +0200
In-Reply-To: <CAJaqyWcqLWAUEOyaenYYzXDhU=rh1+inr_o3C-3th8Pz0BjOpg@mail.gmail.com>
 (Eugenio Perez Martin's message of "Tue, 12 Oct 2021 15:28:01 +0200")
Message-ID: <87lf2y5p7i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Tue, Oct 12, 2021 at 7:21 AM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>>
>> > Initial version of shadow virtqueue that actually forward buffers. The=
re
>> > are no iommu support at the moment, and that will be addressed in futu=
re
>> > patches of this series. Since all vhost-vdpa devices uses forced IOMMU=
,
>> > this means that SVQ is not usable at this point of the series on any
>> > device.
>> >
>> > For simplicity it only supports modern devices, that expects vring
>> > in little endian, with split ring and no event idx or indirect
>> > descriptors. Support for them will not be added in this series.
>> >
>> > It reuses the VirtQueue code for the device part. The driver part is
>> > based on Linux's virtio_ring driver, but with stripped functionality
>> > and optimizations so it's easier to review. Later commits add simpler
>> > ones.
>> >
>> > SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
>> > retrieve its status (next available idx the device was going to
>> > consume) race-free. It can later reset the device to replace vring
>> > addresses etc. When SVQ starts qemu can resume consuming the guest's
>> > driver ring from that state, without notice from the latter.
>> >
>> > This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
>> > in VirtIO, and is implemented in qemu VirtIO-net devices in previous
>> > commits.
>> >
>> > Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device)
>> > can be done in the future if an use case arises. At this moment we can
>> > just rely on reseting the full device.
>> >
>> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> > ---
>> >  qapi/net.json                      |   2 +-
>> >  hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++++=
-
>> >  hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
>> >  3 files changed, 337 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index fe546b0e7c..1f4a55f2c5 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -86,7 +86,7 @@
>> >  #
>> >  # @name: the device name of the VirtIO device
>> >  #
>> > -# @enable: true to use the alternate shadow VQ notifications
>> > +# @enable: true to use the alternate shadow VQ buffers fowarding path
>>
>> Uh, why does the flag change meaning half-way through this series?
>>
>
> Before this patch, the SVQ mode just makes an extra hop for
> notifications. Guest ones are now received by qemu via ioeventfd, and
> qemu forwards them to the device using a different eventfd. The
> reverse is also true: the device ones will be received by qemu by
> device call fd, and then qemu will forward them to the guest using a
> different irqfd.
>
> This intermediate step is not very useful by itself, but helps for
> checking that that part of the communication works fine, with no need
> for shadow virtqueue to understand vring format. Doing that way also
> produces smaller patches.
>
> So it makes sense to me to tell what QMP command does exactly at every
> point of the series. However I can directly document it as "use the
> alternate shadow VQ buffers forwarding path" from the beginning.
>
> Does this make sense, or will it be better to write the final
> intention of the command?
>
> Thanks!

Working your explanation into commit messages and possibly comments
should do.


