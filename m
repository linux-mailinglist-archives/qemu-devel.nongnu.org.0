Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4B32675D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:21:19 +0100 (CET)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFifu-0004HQ-Bu
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFicx-0003Oa-GT
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFicr-0005yk-Tq
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614367088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9hQRXlV384egLib5OsQvnXe6PlvUg5A68JfajTU1Yg=;
 b=h9x1/FJaIgIj9NhGOTPiPWY4VKjXHMxEiOmUl+CLPvnB4mrj2AeFVwgaDIGUQI/2so4DM3
 2FzZIT/dgHkutYTaZyVKp2LtxdBUMF/95MwfWbH10pR4pAfdAOESLd0ZtOtdfXpBXAfQpU
 BhbYdAhTBO9sb0oyAIvvkomdtVIQBlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-4ISA4tmqP-2RMJqW3dMluA-1; Fri, 26 Feb 2021 14:18:04 -0500
X-MC-Unique: 4ISA4tmqP-2RMJqW3dMluA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941B3804023;
 Fri, 26 Feb 2021 19:18:03 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C66060BE2;
 Fri, 26 Feb 2021 19:17:54 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-11-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 10/31] qapi/qom: Add ObjectOptions for secret*,
 deprecate 'loaded'
Message-ID: <1d1735c1-2780-4d9a-78dd-b8730c4df553@redhat.com>
Date: Fri, 26 Feb 2021 13:17:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-11-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> This adds a QAPI schema for the properties of the secret* objects.
> 
> The 'loaded' property doesn't seem to make sense as an external
> interface: It is automatically set to true in ucc->complete, and
> explicitly setting it to true earlier just means that additional options
> will be silently ignored.
> 
> In other words, the 'loaded' property is useless. Mark it as deprecated
> in the schema from the start.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/crypto.json           | 61 ++++++++++++++++++++++++++++++++++++++
>  qapi/qom.json              |  5 ++++
>  docs/system/deprecated.rst | 11 +++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 2aebe6fa20..0fef3de66d 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -381,3 +381,64 @@
>    'discriminator': 'format',
>    'data': {
>            'luks': 'QCryptoBlockAmendOptionsLUKS' } }
> +
> +##
> +# @SecretCommonProperties:
> +#
> +# Properties for objects of classes derived from secret-common.
> +#
> +# @loaded: if true, the secret is loaded immediately when applying this option
> +#          and will probably fail when processing the next option. Don't use;
> +#          only provided for compatibility. (default: false)
> +#
> +# @format: the data format that the secret is provided in (default: raw)
> +#
> +# @keyid: the name of another secret that should be used to decrypt the
> +#         provided data. If not present, the data is assumed to be unencrypted.
> +#
> +# @iv: the random initialization vector used for encryption of this particular
> +#      secret. Should be a base64 encrypted string of the 16-byte IV. Mandatory
> +#      if @keyid is given. Ignored if @keyid is absent.
> +#
> +# Features:
> +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> +#              and false is already the default.
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'SecretCommonProperties',
> +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
> +            '*format': 'QCryptoSecretFormat',
> +            '*keyid': 'str',
> +            '*iv': 'str' } }

Matches crypto/secret_common.c:qcrypto_secret_class_init(), and I concur
with the deprecation.

> +
> +##
> +# @SecretProperties:
> +#
> +# Properties for secret objects.
> +#
> +# Either @data or @file must be provided, but not both.
> +#
> +# @data: the associated with the secret from
> +#
> +# @file: the filename to load the data associated with the secret from
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'SecretProperties',
> +  'base': 'SecretCommonProperties',
> +  'data': { '*data': 'str',
> +            '*file': 'str' } }

Matches crypto/secret.c:qcrypto_secret_class_init() (ugh, we really do
reuse the same static function name in two different files, but not your
fault)

> +
> +##
> +# @SecretKeyringProperties:
> +#
> +# Properties for secret_keyring objects.
> +#
> +# @serial: serial number that identifies a key to get from the kernel
> +#
> +# Since: 5.1
> +##
> +{ 'struct': 'SecretKeyringProperties',
> +  'base': 'SecretCommonProperties',
> +  'data': { 'serial': 'int32' } }

Matches crypto/secret_keyring.c:qcrypto_secret_keyring_class_init().

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 449dca8ec5..2668ad8369 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -7,6 +7,7 @@
>  { 'include': 'authz.json' }
>  { 'include': 'block-core.json' }
>  { 'include': 'common.json' }
> +{ 'include': 'crypto.json' }
>  
>  ##
>  # = QEMU Object Model (QOM)
> @@ -449,6 +450,8 @@
>      'rng-builtin',
>      'rng-egd',
>      'rng-random',
> +    'secret',
> +    'secret_keyring',

What is stopping us from naming this 'secret-keyring'?

>      'throttle-group'
>    ] }
>  
> @@ -483,6 +486,8 @@
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
>        'rng-random':                 'RngRandomProperties',
> +      'secret':                     'SecretProperties',
> +      'secret_keyring':             'SecretKeyringProperties',
>        'throttle-group':             'ThrottleGroupProperties'
>    } }
>  
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 79991c2893..78b175cb59 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -155,6 +155,17 @@ other options have been processed.  This will either have no effect (if
>  ``opened`` was the last option) or cause errors.  The property is therefore
>  useless and should not be specified.
>  
> +``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The only effect of specifying ``loaded=on`` in the command line or QMP
> +``object-add`` is that the secret is loaded immediately, possibly before all
> +other options have been processed.  This will either have no effect (if
> +``loaded`` was the last option) or cause options to be effectively ignored as
> +if they were not given.  The property is therefore useless and should not be
> +specified.

May be impacted if we rename to secret-keyring (in fact, if we rename,
the new name wouldn't even need the deprecated field), but that may be
trickier to coordinate.  So with regards to just the mechanical conversion,

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


