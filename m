Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACE340F62
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:49:06 +0100 (CET)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMzZp-00047n-Co
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMzXs-0003Qg-Jx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMzXp-0002pZ-3M
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616100419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1k+BGkZdITeWXGqrY9iyhuq2RV95UjrN2ntKR6haLI=;
 b=TXD6R3lJ1+6JlNn0wYXsZ6rQsfahYvFIuRqu5PBqcd31DMrcbz6jZcmzk0ClPjqOI0IP+L
 TqVj0IKYD2KJXUcXZxoJ8DK+GMJldODoQV50bsqtWqZ9Fk2VKHR87ozVUOXKoIgchvykVl
 AzjvFwe5G26UTLlT3QN9v9MRtuD4hP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-owbzKqv4Pz25Af75YqtwMg-1; Thu, 18 Mar 2021 16:46:55 -0400
X-MC-Unique: owbzKqv4Pz25Af75YqtwMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46B6E801596;
 Thu, 18 Mar 2021 20:46:53 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDB75C1D1;
 Thu, 18 Mar 2021 20:46:30 +0000 (UTC)
Subject: Re: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
 <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com>
Date: Thu, 18 Mar 2021 15:46:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, jasowang@redhat.com, david@redhat.com,
 armbru@redhat.com, amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:29 AM, Jonah Palmer wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> This new command lists all the instances of VirtIODevice with
> their path and virtio type
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---

We've missed soft freeze for 6.0, and this feels like a new feature;
therefore...

> +++ b/hw/virtio/virtio.c

>  
> +VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
> +{
> +    VirtioInfoList *list = NULL;
> +    VirtioInfoList *node;
> +    VirtIODevice *vdev;
> +
> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
> +        DeviceState *dev = DEVICE(vdev);
> +        node = g_new0(VirtioInfoList, 1);
> +        node->value = g_new(VirtioInfo, 1);
> +        node->value->path = g_strdup(dev->canonical_path);
> +        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
> +                                            VIRTIO_TYPE_UNKNOWN, NULL);
> +        node->next = list;
> +        list = node;

This should be updated to use QAPI_LIST_PREPEND rather than open coding.

> +    }
> +
> +    return list;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b7ece7a..2470e09 100644
> --- a/include/hw/virtio/virtio.h

> +++ b/qapi/virtio.json
> @@ -0,0 +1,68 @@
> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioType:
> +#
> +# An enumeration of Virtio device types.
> +#
> +# Since: 6.0

...this now needs to reference 6.1.

> +##
> +{ 'enum': 'VirtioType',
> +  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
> +            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
> +            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
> +            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
> +}
> +
> +##
> +# @VirtioInfo:
> +#
> +# Information about a given VirtIODevice
> +#
> +# @path: VirtIO device canonical path.
> +#
> +# @type: VirtIO device type.
> +#
> +# Since: 6.0

and throughout the series (I'll quit pointing it out)

> +##
> +# @x-debug-query-virtio:
> +#
> +# Return the list of all VirtIO devices
> +#
> +# Returns: list of @VirtioInfo
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-query-virtio" }

That said, adding an 'x-' experimental feature is NOT locking us down,
so if some maintainer still wants to include this in -rc1 on the grounds
that it will help debugging other things, rather than pushing it out to
6.1 as a new feature, then keeping things as 6.0 is tolerable in that
border-line case.  (If it misses -rc1, then I will become more adamant
that it does not belong in 6.0)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


