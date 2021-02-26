Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DE32678A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:43:40 +0100 (CET)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFj1X-0004kO-AQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFj0N-0004F4-4S
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFj0K-0007tg-ML
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614368543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XKlGLfEQATtO1oe+t930gnVLOBj4PxGsH21+s4MXnM=;
 b=Vjo8cO2yncMidFWpc78ZAg0lU3BUwXCnMN5rHtwluAhjn8+DMyfI3AyJqsBW+uWBcL1Lz5
 xW574i6+I83oVPfJr+ZMvlKv/aKKA4rM5LC4O0qwuaePFpYNE2Z9vXnXAcf1hIWBHgLOqN
 HvCS11545Lin5rz6X9G2wQ6T2/PFu10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Ty39DOGtM-qh0MhkkDbDIQ-1; Fri, 26 Feb 2021 14:42:21 -0500
X-MC-Unique: Ty39DOGtM-qh0MhkkDbDIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC108107ACE4;
 Fri, 26 Feb 2021 19:42:19 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEE1E100239A;
 Fri, 26 Feb 2021 19:42:12 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-13-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 12/31] qapi/qom: Add ObjectOptions for can-*
Message-ID: <0250da61-515d-cd41-d680-25431da87373@redhat.com>
Date: Fri, 26 Feb 2021 13:42:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-13-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> This adds a QAPI schema for the properties of the can-* objects.
> 
> can-bus doesn't have any properties, so it only needs to be added to the
> ObjectType enum without adding a new branch to ObjectOptions.

I somewhat prefer

'can-bus': {},

to make it explicit that we thought about it, but since we allow
defaulted union branches, your approach works too.

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index f22b7aa99b..4b1cd4b8dc 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -207,6 +207,21 @@
>    'returns': [ 'ObjectPropertyInfo' ],
>    'allow-preconfig': true }
>  
> +##
> +# @CanHostSocketcanProperties:
> +#
> +# Properties for can-host-socketcan objects.
> +#
> +# @if: interface name of the host system CAN bus to connect to
> +#
> +# @canbus: object ID of the can-bus object to connect to the host interface
> +#
> +# Since: 2.12
> +##
> +{ 'struct': 'CanHostSocketcanProperties',
> +  'data': { 'if': 'str',
> +            'canbus': 'str' } }
> +

Okay, matches net/can/can_socketcan.c:can_host_socketcan_class_init()
(after chasing down the parent class in
net/can/can_host.c:can_host_class_init() to find "canbus").

>  ##
>  # @CryptodevBackendProperties:
>  #
> @@ -439,6 +454,8 @@
>      'authz-listfile',
>      'authz-pam',
>      'authz-simple',
> +    'can-bus',
> +    'can-host-socketcan',
>      'cryptodev-backend',
>      'cryptodev-backend-builtin',
>      'cryptodev-vhost-user',
> @@ -479,6 +496,7 @@
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',
>        'authz-simple':               'AuthZSimpleProperties',
> +      'can-host-socketcan':         'CanHostSocketcanProperties',
>        'cryptodev-backend':          'CryptodevBackendProperties',
>        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>        'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


