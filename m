Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93605429D0E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:22:45 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAFQ-0003BC-JT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maAEC-0001o4-L7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maAE8-0002UY-W3
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634016084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+POhhaUS8c1MDoSohBwHlpWHrfZPmIrrEI3K8C56x9A=;
 b=X3ek9K7M7xXZJa+r6Oj5apfEm66DvLlrhQ2e/s70b7HTP8PjGslnoZc+me/eFCmFF+kyql
 EvAXMJ8YWkRGVkEpq3GHEx+OeByR9dqAHn52B2O1Mtuc0lS9X5/CMkpofJH5O5odCneTHg
 aFKEFh91PbQ2hOOG1oSQ2RkqjB6CgaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-lrwp-bFkPjCSHcppSxp1XQ-1; Tue, 12 Oct 2021 01:21:21 -0400
X-MC-Unique: lrwp-bFkPjCSHcppSxp1XQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF5D811DCF;
 Tue, 12 Oct 2021 05:21:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 432DF19C79;
 Tue, 12 Oct 2021 05:21:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3A14113865F; Tue, 12 Oct 2021 07:21:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
Date: Tue, 12 Oct 2021 07:21:10 +0200
In-Reply-To: <20211001070603.307037-16-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 1 Oct 2021 09:05:58 +0200")
Message-ID: <87y26yg6nt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Initial version of shadow virtqueue that actually forward buffers. There
> are no iommu support at the moment, and that will be addressed in future
> patches of this series. Since all vhost-vdpa devices uses forced IOMMU,
> this means that SVQ is not usable at this point of the series on any
> device.
>
> For simplicity it only supports modern devices, that expects vring
> in little endian, with split ring and no event idx or indirect
> descriptors. Support for them will not be added in this series.
>
> It reuses the VirtQueue code for the device part. The driver part is
> based on Linux's virtio_ring driver, but with stripped functionality
> and optimizations so it's easier to review. Later commits add simpler
> ones.
>
> SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> retrieve its status (next available idx the device was going to
> consume) race-free. It can later reset the device to replace vring
> addresses etc. When SVQ starts qemu can resume consuming the guest's
> driver ring from that state, without notice from the latter.
>
> This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
> in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> commits.
>
> Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device)
> can be done in the future if an use case arises. At this moment we can
> just rely on reseting the full device.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json                      |   2 +-
>  hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++++-
>  hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
>  3 files changed, 337 insertions(+), 11 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index fe546b0e7c..1f4a55f2c5 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -86,7 +86,7 @@
>  #
>  # @name: the device name of the VirtIO device
>  #
> -# @enable: true to use the alternate shadow VQ notifications
> +# @enable: true to use the alternate shadow VQ buffers fowarding path

Uh, why does the flag change meaning half-way through this series?

>  #
>  # Returns: Error if failure, or 'no error' for success.
>  #

[...]


