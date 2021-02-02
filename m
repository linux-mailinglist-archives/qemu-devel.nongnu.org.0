Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3BC30C48C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:55:53 +0100 (CET)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6y1w-0003sP-QO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6xlS-0005FE-Av
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6xlQ-00023y-2z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/91RGQPkdsH61MPGcn8nrqsfZFX35ZsXexa1fyd3QRw=;
 b=dV5FOO6HMqGLQy5KPvJ+YFPrMH+nPbL+V7x0hyPARL30RWg9KOPBa/3AV+RqQVCJ3EXit+
 seRCSXy/LHl1xYGyo1px9Tm33uMtgFUve5Zgte+4TsBCbqjjHaRTYdv3Ppt0BGkkZPCgzd
 ULKyrcvK3eJ5pG39DAuGNa/aOQVpVbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-_Hi5P4vSPHKnnGsVZ1csNg-1; Tue, 02 Feb 2021 10:38:43 -0500
X-MC-Unique: _Hi5P4vSPHKnnGsVZ1csNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB71F835E24;
 Tue,  2 Feb 2021 15:38:41 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74DB660CE7;
 Tue,  2 Feb 2021 15:38:34 +0000 (UTC)
Subject: Re: [RFC 08/10] vhost: Add x-vhost-enable-shadow-vq qmp
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-9-eperezma@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4ab76cf6-401b-97de-6154-2e025cb1ebc6@redhat.com>
Date: Tue, 2 Feb 2021 09:38:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129205415.876290-9-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 2:54 PM, Eugenio Pérez wrote:
> Command to enable shadow virtqueue looks like:
> 
> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "dev0", "enable": true } }
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  qapi/net.json     | 23 +++++++++++++++++++++++
>  hw/virtio/vhost.c |  6 ++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..6170d69798 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -77,6 +77,29 @@
>  ##
>  { 'command': 'netdev_del', 'data': {'id': 'str'} }
>  
> +##
> +# @x-vhost-enable-shadow-vq:

This spelling is the preferred form...[1]

> +#
> +# Use vhost shadow virtqueue.
> +#
> +# @name: the device name of the virtual network adapter
> +#
> +# @enable: true to use he alternate shadow VQ notification path
> +#
> +# Returns: Error if failure, or 'no error' for success

This line...[2]

> +#
> +# Since: 5.3

The next release is 6.0, not 5.3.

> +#
> +# Example:
> +#
> +# -> { "execute": "x-vhost_enable_shadow_vq", "arguments": {"enable": true} }

[1]...but doesn't match the example.

> +# <- { "return": { "enabled" : true } }

[2]...doesn't match this comment.  I'd just drop the line, since there
is no explicit return listed.

> +#
> +##
> +{ 'command': 'x-vhost-enable-shadow-vq',
> +  'data': {'name': 'str', 'enable': 'bool'},
> +  'if': 'defined(CONFIG_VHOST_KERNEL)' }
> +
>  ##
>  # @NetLegacyNicOptions:
>  #
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 040f68ff2e..42836e45f3 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -15,6 +15,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-net.h"
>  #include "hw/virtio/vhost.h"
>  #include "qemu/atomic.h"
>  #include "qemu/range.h"
> @@ -1841,3 +1842,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>  
>      return -1;
>  }
> +
> +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
> +{
> +    error_setg(errp, "Shadow virtqueue still not implemented.");

error_setg() should not be passed a trailing '.'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


