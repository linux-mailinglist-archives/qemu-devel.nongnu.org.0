Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB9326639
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:19:17 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFglo-0004Er-EV
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFgNo-000766-QV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFgNm-0005r4-6I
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614358464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzrwdwMPBydc2660BliBProsKDdYvPB4aAiQYPglEBE=;
 b=LxXpr8WJU99KW+T5bYc5KujjDpkKs9PbBrSXdDHpbNZTWCGxlwZvUjChipf7y7pMLd1qy/
 UNDaQlL+hvM9Lfn1WbWVeafm+kgNyTzUOheNI8PbfKxFi+/Os5SAGTTxERXIzqp12SP7z0
 i4gb9btPqD5th79NEsuuRh1V/QgzqRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-SxVceEvAOLqCv2iaD64n4Q-1; Fri, 26 Feb 2021 11:54:21 -0500
X-MC-Unique: SxVceEvAOLqCv2iaD64n4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5379180196E;
 Fri, 26 Feb 2021 16:54:20 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42B1412D7E;
 Fri, 26 Feb 2021 16:54:13 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-9-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 08/31] qapi/qom: Add ObjectOptions for rng-*, deprecate
 'opened'
Message-ID: <3dd29b8f-c5d8-da45-b3b4-fc1a6c29a7ac@redhat.com>
Date: Fri, 26 Feb 2021 10:54:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-9-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the rng-* objects.
> 
> The 'opened' property doesn't seem to make sense as an external
> interface: It is automatically set to true in ucc->complete, and
> explicitly setting it to true earlier just means that trying to set
> additional options will result in an error. After the property has once
> been set to true (i.e. when the object construction has completed), it
> can never be reset to false. In other words, the 'opened' property is
> useless. Mark it as deprecated in the schema from the start.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json              | 56 ++++++++++++++++++++++++++++++++++++--
>  docs/system/deprecated.rst |  9 ++++++
>  2 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 1a869006a1..73f28f9608 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -380,6 +380,52 @@
>              '*hugetlbsize': 'size',
>              '*seal': 'bool' } }
>  
> +##
> +# @RngProperties:
> +#
> +# Properties for objects of classes derived from rng.
> +#
> +# @opened: if true, the device is opened immediately when applying this option
> +#          and will probably fail when processing the next option. Don't use;
> +#          only provided for compatibility. (default: false)
> +#
> +# Features:
> +# @deprecated: Member @opened is deprecated.  Setting true doesn't make sense,
> +#              and false is already the default.
> +#
> +# Since: 1.3
> +##
> +{ 'struct': 'RngProperties',
> +  'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }

Matches backends/rng.c:rng_backend_class_init(), and I concur with the
deprecation.

> +
> +##
> +# @RngEgdProperties:
> +#
> +# Properties for rng-egd objects.
> +#
> +# @chardev: the name of a character device backend that provides the connection
> +#           to the RNG daemon
> +#
> +# Since: 1.3
> +##
> +{ 'struct': 'RngEgdProperties',
> +  'base': 'RngProperties',
> +  'data': { 'chardev': 'str' } }

Matches backends/rng-egd.c:rng_egd_class_init().

> +
> +##
> +# @RngRandomProperties:
> +#
> +# Properties for rng-random objects.
> +#
> +# @filename: the filename of the device on the host to obtain entropy from
> +#            (default: "/dev/urandom")
> +#
> +# Since: 1.3
> +##
> +{ 'struct': 'RngRandomProperties',
> +  'base': 'RngProperties',
> +  'data': { '*filename': 'str' } }

Matches backends/rng-random.c:rng_random_class_init().

> +
>  ##
>  # @ObjectType:
>  #
> @@ -398,7 +444,10 @@
>      'iothread',
>      'memory-backend-file',
>      'memory-backend-memfd',
> -    'memory-backend-ram'
> +    'memory-backend-ram',
> +    'rng-builtin',
> +    'rng-egd',
> +    'rng-random'
>    ] }
>  
>  ##
> @@ -428,7 +477,10 @@
>        'iothread':                   'IothreadProperties',
>        'memory-backend-file':        'MemoryBackendFileProperties',
>        'memory-backend-memfd':       'MemoryBackendMemfdProperties',
> -      'memory-backend-ram':         'MemoryBackendProperties'
> +      'memory-backend-ram':         'MemoryBackendProperties',
> +      'rng-builtin':                'RngProperties',
> +      'rng-egd':                    'RngEgdProperties',
> +      'rng-random':                 'RngRandomProperties'
>    } }
>  
>  ##
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 00b694e053..79991c2893 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,15 @@ library enabled as a cryptography provider.
>  Neither the ``nettle`` library, or the built-in cryptography provider are
>  supported on FIPS enabled hosts.
>  
> +``opened`` property of ``rng-*`` objects (since 6.0.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The only effect of specifying ``opened=on`` in the command line or QMP
> +``object-add`` is that the device is opened immediately, possibly before all
> +other options have been processed.  This will either have no effect (if
> +``opened`` was the last option) or cause errors.  The property is therefore
> +useless and should not be specified.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


