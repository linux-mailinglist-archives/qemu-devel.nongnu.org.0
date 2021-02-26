Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592F32678D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:48:23 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFj65-0006qm-W8
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFj4v-0006Gm-2O
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFj4t-0001tK-83
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614368826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1VvP3dj7mOeJF5j/NgzgsI7yqpay8Ltx5s1XcXjkcA=;
 b=V/JsghiuApRWuDBND5BGrfih8QY0H5ILTQ7YADMeMjrIGSmYc5haCgHeQhOnX3RSkjDK6B
 nR3RYBl4RRZj/q+IKUJ7u2W0zTWwmzgpM94XyH53B+mbTf3j9n1yXB0HYyymwR2DtxfZIR
 ZOue+gxqS/nAL8ZH9Q030JXKMgnJOEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-g6yERN4xOE2u9ieSVt_H9w-1; Fri, 26 Feb 2021 14:47:04 -0500
X-MC-Unique: g6yERN4xOE2u9ieSVt_H9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E88AC286;
 Fri, 26 Feb 2021 19:47:03 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F9659453;
 Fri, 26 Feb 2021 19:46:56 +0000 (UTC)
Subject: Re: [PATCH v2 13/31] qapi/qom: Add ObjectOptions for colo-compare
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-14-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c570f92c-cbb3-9b0b-a6e1-4dbf36a6b10e@redhat.com>
Date: Fri, 26 Feb 2021 13:46:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-14-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> This adds a QAPI schema for the properties of the colo-compare object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 4b1cd4b8dc..8e4414f843 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -222,6 +222,53 @@
>    'data': { 'if': 'str',
>              'canbus': 'str' } }
>  
> +##
> +# @ColoCompareProperties:
> +#
> +# Properties for colo-compare objects.
> +#
> +# @primary_in: name of the character device backend to use for the primary
> +#              input (incoming packets are redirected to @outdev)
> +#
> +# @secondary_in: name of the character device backend to use for secondary
> +#                input (incoming packets are only compared to the input on
> +#                @primary_in and then dropped)
> +#

Idea for future improvement: use aliases to shift over to 'primary-in',
'secondary-in', and so on as our preferred name.  But not for this
patch, which is a mechanical conversion of what exists.

> +# @outdev: name of the character device backend to use for output
> +#
> +# @iothread: name of the iothread to run in
> +#
> +# @notify_dev: name of the character device backend to be used to communicate
> +#              with the remote colo-frame (only for Xen COLO)
> +#
> +# @compare_timeout: the maximum time to hold a packet from @primary_in for
> +#                   comparison with an incoming packet on @secondary_in in
> +#                   milliseconds (default: 3000)
> +#
> +# @expired_scan_cycle: the interval at which colo-compare checks whether
> +#                      packets from @primary have timed out, in milliseconds
> +#                      (default: 3000)
> +#
> +# @max_queue_size: the maximum number of packets to keep in the queue for
> +#                  comparing with incoming packets from @secondary_in.  If the
> +#                  queue is full and addtional packets are received, the
> +#                  addtional packets are dropped. (default: 1024)
> +#
> +# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
> +#
> +# Since: 2.8
> +##
> +{ 'struct': 'ColoCompareProperties',
> +  'data': { 'primary_in': 'str',
> +            'secondary_in': 'str',
> +            'outdev': 'str',
> +            'iothread': 'str',
> +            '*notify_dev': 'str',
> +            '*compare_timeout': 'uint64',
> +            '*expired_scan_cycle': 'uint32',
> +            '*max_queue_size': 'uint32',
> +            '*vnet_hdr_support': 'bool' } }

Matches net/colo-compare.c:colo_compare_init().

> +
>  ##
>  # @CryptodevBackendProperties:
>  #
> @@ -456,6 +503,7 @@
>      'authz-simple',
>      'can-bus',
>      'can-host-socketcan',
> +    'colo-compare',
>      'cryptodev-backend',
>      'cryptodev-backend-builtin',
>      'cryptodev-vhost-user',
> @@ -497,6 +545,7 @@
>        'authz-pam':                  'AuthZPAMProperties',
>        'authz-simple':               'AuthZSimpleProperties',
>        'can-host-socketcan':         'CanHostSocketcanProperties',
> +      'colo-compare':               'ColoCompareProperties',
>        'cryptodev-backend':          'CryptodevBackendProperties',
>        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>        'cryptodev-vhost-user':       'CryptodevVhostUserProperties',

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


