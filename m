Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C24429D08
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:21:10 +0200 (CEST)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maADs-00006m-ON
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maABs-00079R-6x
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maABo-0000uX-JN
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634015938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/StBYMWqiV8Q2kbwq+6f9oCKl48f07WZE+HgktIQS3Y=;
 b=EP2FddScgVceNYeSliNoP3vj5AciigMNxH5a6hiSfAoLXg5Y6JikOmZmeOivCoLTh1ZAs+
 JErxaktd5um6Mpq4A3O5lOWpMp3clJYEtNI+nNsj6BwsA5g7Q44RPv1M39eKQVKjmN72vq
 pIgcSmOxwde+A3UDtLttwRtiKs/VbPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-HgCYre0NOkKTTMNX0mRD8Q-1; Tue, 12 Oct 2021 01:18:55 -0400
X-MC-Unique: HgCYre0NOkKTTMNX0mRD8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC5919253C2;
 Tue, 12 Oct 2021 05:18:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A748C10016FE;
 Tue, 12 Oct 2021 05:18:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F267113865F; Tue, 12 Oct 2021 07:18:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v4 05/20] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-6-eperezma@redhat.com>
Date: Tue, 12 Oct 2021 07:18:42 +0200
In-Reply-To: <20211001070603.307037-6-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 1 Oct 2021 09:05:48 +0200")
Message-ID: <877deihlcd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

> Command to enable shadow virtqueue.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json          | 23 +++++++++++++++++++++++
>  hw/virtio/vhost-vdpa.c |  8 ++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..a2c30fd455 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -79,6 +79,29 @@
>  { 'command': 'netdev_del', 'data': {'id': 'str'},
>    'allow-preconfig': true }
> =20
> +##
> +# @x-vhost-enable-shadow-vq:
> +#
> +# Use vhost shadow virtqueue.
> +#
> +# @name: the device name of the VirtIO device

Is this a qdev ID?  A network client name?

> +#
> +# @enable: true to use the alternate shadow VQ notifications
> +#
> +# Returns: Always error, since SVQ is not implemented at the moment.
> +#
> +# Since: 6.2
> +#
> +# Example:
> +#
> +# -> { "execute": "x-vhost-enable-shadow-vq",
> +#     "arguments": { "name": "virtio-net", "enable": false } }
> +#
> +##
> +{ 'command': 'x-vhost-enable-shadow-vq',
> +  'data': {'name': 'str', 'enable': 'bool'},
> +  'if': 'defined(CONFIG_VHOST_KERNEL)' }
> +

Adding an command just for controlling a flag in some object is fine for
quick experiments.  As a permanent interface, it's problematic: one
command per flag would result in way too many commands.  Better: one
command to control a set of related properties.

I hesitate to suggest qom-set, because qom-set is not introspectable.
Recurring complaint about QOM: poor integration with QAPI/QMP.

Naming nitpick: since the command can both enable and disable, I'd call
it -set-vq instead of -enable-vq.

>  ##
>  # @NetLegacyNicOptions:
>  #
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4fa414feea..c63e311d7c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -23,6 +23,8 @@
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu-common.h"
> +#include "qapi/qapi-commands-net.h"
> +#include "qapi/error.h"
> =20
>  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *sec=
tion)
>  {
> @@ -656,6 +658,12 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev=
 *dev)
>      return true;
>  }
> =20
> +
> +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error *=
*errp)
> +{
> +    error_setg(errp, "Shadow virtqueue still not implemented");
> +}
> +
>  const VhostOps vdpa_ops =3D {
>          .backend_type =3D VHOST_BACKEND_TYPE_VDPA,
>          .vhost_backend_init =3D vhost_vdpa_init,


