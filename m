Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECD429D0D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:22:09 +0200 (CEST)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAEq-000242-Tu
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maACw-0000dG-Jt
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maACt-0001Zm-PS
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634016005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+ZJmqqBpwmBV7kE/yHD+vlJCnr0q9w2Fhr/B7zLW98=;
 b=NBSki6N9yPgGhJoKJy87ozJ1RfTpv2/SG07yz1hC8hkM7EMe4TbXxxfK0X5tv92macYuU7
 5DyTX9xppsNa3VtyUi80E+chTCznDTCJ00HHa4VQAbBO+pTD+w2cvMO76HJWbm59s+bTV5
 ghhIvcIY9wq4IUS/k8m5TFohkJSpjKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-oBzCslRgNDmwzYEC3rOJ1Q-1; Tue, 12 Oct 2021 01:20:02 -0400
X-MC-Unique: oBzCslRgNDmwzYEC3rOJ1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E097835DE0;
 Tue, 12 Oct 2021 05:20:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C53010016FE;
 Tue, 12 Oct 2021 05:19:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC7EE113865F; Tue, 12 Oct 2021 07:19:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v4 08/20] vhost: Route guest->host notification
 through shadow virtqueue
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-9-eperezma@redhat.com>
Date: Tue, 12 Oct 2021 07:19:53 +0200
In-Reply-To: <20211001070603.307037-9-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 1 Oct 2021 09:05:51 +0200")
Message-ID: <8735p6hlae.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Shadow virtqueue notifications forwarding is disabled when vhost_dev
> stops, so code flow follows usual cleanup.
>
> Also, host notifiers must be disabled at SVQ start, and they will not
> start if SVQ has been enabled when device is stopped. This is trivial
> to address, but it is left out for simplicity at this moment.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json                      |   2 +-
>  hw/virtio/vhost-shadow-virtqueue.h |   8 ++
>  include/hw/virtio/vhost-vdpa.h     |   4 +
>  hw/virtio/vhost-shadow-virtqueue.c | 138 ++++++++++++++++++++++++++++-
>  hw/virtio/vhost-vdpa.c             | 116 +++++++++++++++++++++++-
>  5 files changed, 264 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index a2c30fd455..fe546b0e7c 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -88,7 +88,7 @@
>  #
>  # @enable: true to use the alternate shadow VQ notifications
>  #
> -# Returns: Always error, since SVQ is not implemented at the moment.
> +# Returns: Error if failure, or 'no error' for success.

Delete the whole line, please.

>  #
>  # Since: 6.2
>  #
[...]


