Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DD32642B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:38:49 +0100 (CET)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeGV-0003qg-Tj
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFeEU-00020D-3b
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFeEP-0007WR-8O
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614350196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kpinj8ZTzP13iT24XdNfJB5OtjrQ32G0Q9CwULjYWME=;
 b=H/RO+NwiXbc1cOqB0O6QatCVHVoqNnmjZbg6hqkwCRo7UClzDS3zYzQYmUUyeVI/zsqGNT
 dtIWEaCqQ89uy7zdolKgeT8a1bXDHTKf0ss+PHR9eTGRj6SxxqrRoJefVO3QxDVUpInVPo
 UBuCEb/lOYbhg1zdMNG8VnOVK+o0lvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-fLx_bXysN-uDmNzSOkfExw-1; Fri, 26 Feb 2021 09:36:33 -0500
X-MC-Unique: fLx_bXysN-uDmNzSOkfExw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F6D6D4E3;
 Fri, 26 Feb 2021 14:36:32 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BAAD5C233;
 Fri, 26 Feb 2021 14:36:25 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-6-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 05/31] qapi/qom: Add ObjectOptions for cryptodev-*
Message-ID: <6ac49c47-8310-71e8-7e5c-7d66805c8d1c@redhat.com>
Date: Fri, 26 Feb 2021 08:36:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-6-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the cryptodev-* objects.
> 
> These interfaces have some questionable aspects (cryptodev-backend is
> really an abstract base class without function, and the queues option
> only makes sense for cryptodev-vhost-user), but as the goal is to
> represent the existing interface in QAPI, leave these things in place.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 30ed179bc1..1dbc95fb53 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -204,6 +204,34 @@
>    'returns': [ 'ObjectPropertyInfo' ],
>    'allow-preconfig': true }
>  
> +##
> +# @CryptodevBackendProperties:
> +#
> +# Properties for cryptodev-backend and cryptodev-backend-builtin objects.
> +#
> +# @queues: the number of queues for the cryptodev backend. Ignored for
> +#          cryptodev-backend and must be 1 for cryptodev-backend-builtin.
> +#          (default: 1)
> +#
> +# Since: 2.8
> +##
> +{ 'struct': 'CryptodevBackendProperties',
> +  'data': { '*queues': 'uint32' } }

Matches backend/cryptodev.c:cryptodev_backend_class_init() and
backend/cryptodev-builtin.c:cryptodev_builtin_class_init().

> +
> +##
> +# @CryptodevVhostUserProperties:
> +#
> +# Properties for cryptodev-vhost-user objects.
> +#
> +# @chardev: the name of a unix domain socket character device that connects to

Should that b s/unix/Unix/ ?

> +#           the vhost-user server
> +#
> +# Since: 2.12
> +##
> +{ 'struct': 'CryptodevVhostUserProperties',
> +  'base': 'CryptodevBackendProperties',
> +  'data': { 'chardev': 'str' } }

Matches backend/cryptodev-vhost-user.c:cryptodev_vhost_user_init_class().

> +
>  ##
>  # @IothreadProperties:
>  #
> @@ -239,6 +267,9 @@
>      'authz-listfile',
>      'authz-pam',
>      'authz-simple',
> +    'cryptodev-backend',
> +    'cryptodev-backend-builtin',
> +    'cryptodev-vhost-user',
>      'iothread'
>    ] }
>  
> @@ -262,6 +293,9 @@
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',
>        'authz-simple':               'AuthZSimpleProperties',
> +      'cryptodev-backend':          'CryptodevBackendProperties',
> +      'cryptodev-backend-builtin':  'CryptodevBackendProperties',
> +      'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
>        'iothread':                   'IothreadProperties'
>    } }
>  
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


