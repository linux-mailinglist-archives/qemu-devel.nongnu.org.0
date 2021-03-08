Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8F331741
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:28:02 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLXt-0004Xo-FX
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLVl-0003nq-KC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLVi-0004oL-KF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615231546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/Qb6fCTb8Aowcrl4k8YO14qg+ycH0EzIgOUwwQz5Pg=;
 b=CtLrj6sNDVbeVOGc9O/vlIYZMJ1MqRzMmZH5dc5y5eZuQ8hEbCPnVUdWQISXcwBNwk09gL
 JSGoUtGhcVGTs5d3cJk90jZC1sVsHs1i5cgG3gE9dHIhP3JmDzqpyLp6+Z8J+iaAUvWCBb
 NO1x9/JMBqiYjJl364ERjuw4hbmQ3Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-0jWhEKB6NsSBVlm46Pm7gw-1; Mon, 08 Mar 2021 14:25:42 -0500
X-MC-Unique: 0jWhEKB6NsSBVlm46Pm7gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CF1801814;
 Mon,  8 Mar 2021 19:25:40 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABD8D10013D7;
 Mon,  8 Mar 2021 19:25:33 +0000 (UTC)
Subject: Re: [PATCH v3 06/30] qapi/qom: Add ObjectOptions for memory-backend-*
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-7-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f19708f4-2c4e-7140-7ee6-4fff34aaecad@redhat.com>
Date: Mon, 8 Mar 2021 13:25:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-7-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:54 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the memory-backend-*
> objects.
> 
> HostMemPolicy has to be moved to an include file that can be used by the
> storage daemon, too, because ObjectOptions must be the same in all
> binaries if we don't want to compile the whole code multiple times.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  qapi/common.json  |  20 ++++++++
>  qapi/machine.json |  22 +--------
>  qapi/qom.json     | 121 +++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 141 insertions(+), 22 deletions(-)
> 

> @@ -287,7 +397,10 @@
>      'cryptodev-backend-builtin',
>      'cryptodev-vhost-user',
>      'dbus-vmstate',
> -    'iothread'
> +    'iothread',
> +    'memory-backend-file',
> +    'memory-backend-memfd',
> +    'memory-backend-ram'

Another leaked enum value...

>    ] }
>  
>  ##
> @@ -315,7 +428,11 @@
>        'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
>                                        'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
>        'dbus-vmstate':               'DBusVMStateProperties',
> -      'iothread':                   'IothreadProperties'
> +      'iothread':                   'IothreadProperties',
> +      'memory-backend-file':        'MemoryBackendFileProperties',
> +      'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
> +                                      'if': 'defined(CONFIG_LINUX)' },
> +      'memory-backend-ram':         'MemoryBackendProperties'
>    } }

...when compared to the union branches.

Once fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


