Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79033D502
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:39:11 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9ug-0006ZZ-52
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9tU-00066N-4n
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9tS-0007sC-Gd
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615901873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32Ozy+oFD/uqS3a2w0ZBo9N3EccYioe/8gLdagjbvFw=;
 b=gp+8E+tmBKj6K5LeAmsJRT8Vndqw7lNeduwnUmik8QD8urENEhMm6V8abJvMhu5oSFJMVP
 FLbpg5mqy/yQOjxWoZ3z5nyIVYCPiY17OR+8Y8FvvfGavYJECJuM8HJj+iUZHgOCxAAy5e
 IxU3Wb9AakaTAlvQbeiUi3k5/F9w9NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-WbdpTnM0M8mbVS2TGK7NQQ-1; Tue, 16 Mar 2021 09:37:52 -0400
X-MC-Unique: WbdpTnM0M8mbVS2TGK7NQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 719978CE1CE;
 Tue, 16 Mar 2021 13:37:34 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40ADB62AF8;
 Tue, 16 Mar 2021 13:37:28 +0000 (UTC)
Subject: Re: [RFC v2 04/13] vhost: Add x-vhost-enable-shadow-vq qmp
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-5-eperezma@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9040df60-b931-4973-f302-bc5ef9c91152@redhat.com>
Date: Tue, 16 Mar 2021 08:37:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-5-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 2:48 PM, Eugenio Pérez wrote:
> Command to enable shadow virtqueue looks like:
> 
> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "dev0", "enable": true } }
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  qapi/net.json     | 22 ++++++++++++++++++++++
>  hw/virtio/vhost.c |  6 ++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..4c5f65d021 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -77,6 +77,28 @@
>  ##
>  { 'command': 'netdev_del', 'data': {'id': 'str'} }
>  
> +##
> +# @x-vhost-enable-shadow-vq:
> +#
> +# Use vhost shadow virtqueue.
> +#
> +# @name: the device name of the VirtIO device
> +#
> +# @enable: true to use he alternate shadow VQ notification path
> +#
> +# Returns: Error if failure, or 'no error' for success. Not found if vhost is not enabled.
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "virtio-net", "enable": false } }

Long lines; please wrap to keep under 80 columns.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


