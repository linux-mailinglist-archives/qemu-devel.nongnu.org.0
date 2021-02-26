Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B4326777
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:35:45 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFits-0001Yn-AQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFirq-0000mI-Ih
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFirn-0003wg-BK
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614368014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgpbPE+P0h0hQcmI+ZcjRGJpCWjZN6gP6+L03JAqWM8=;
 b=Ex54DyZm9xfZx4rGdJbhTQY3BLjnpTUK1XuxTMC1gcsAQSI47jjChzNLkdguKgRHb4De5y
 Mthc3rsRhlheZbYtGSe34uYBPeHGvyRkxRzyRzQkIcFpMY0DlUjiOUw6Nn+Lt+Zd1nJSDI
 39CLDXknK1FpAG9dROD74bRSK+lTN+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-vNM0y3BHOvC17s0x9EwnHQ-1; Fri, 26 Feb 2021 14:33:30 -0500
X-MC-Unique: vNM0y3BHOvC17s0x9EwnHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753231936B60;
 Fri, 26 Feb 2021 19:33:29 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19EF359453;
 Fri, 26 Feb 2021 19:33:22 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-12-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 11/31] qapi/qom: Add ObjectOptions for tls-*, deprecate
 'loaded'
Message-ID: <3f1ff9c1-0e96-e4d7-9c69-a78893a98a12@redhat.com>
Date: Fri, 26 Feb 2021 13:33:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-12-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> This adds a QAPI schema for the properties of the tls-* objects.
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
>  qapi/crypto.json | 98 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/qom.json    | 12 +++++-
>  2 files changed, 108 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 0fef3de66d..7116ae9a46 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -442,3 +442,101 @@
>  { 'struct': 'SecretKeyringProperties',
>    'base': 'SecretCommonProperties',
>    'data': { 'serial': 'int32' } }
> +
> +##
> +# @TlsCredsProperties:
> +#
> +# Properties for objects of classes derived from tls-creds.
> +#
> +# @verify-peer: if true the peer credentials will be verified once the
> +#               handshake is completed.  This is a no-op for anonymous
> +#               credentials. (default: true)
> +#
> +# @dir: the path of the directory that contains the credential files
> +#
> +# @endpoint: whether the QEMU network backend that uses the credentials will be
> +#            acting as a client or as a server (default: client)
> +#
> +# @priority: a gnutls priority string as described at
> +#            https://gnutls.org/manual/html_node/Priority-Strings.html
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'TlsCredsProperties',
> +  'data': { '*verify-peer': 'bool',
> +            '*dir': 'str',
> +            '*endpoint': 'QCryptoTLSCredsEndpoint',
> +            '*priority': 'str' } }

Matches crypto/tlscreds.c:qcrypto_tls_creds_class_init().

> +
> +##
> +# @TlsCredsAnonProperties:
> +#
> +# Properties for tls-creds-anon objects.
> +#
> +# @loaded: if true, the credentials are loaded immediately when applying this
> +#          option and will ignore options that are processed later. Don't use;
> +#          only provided for compatibility. (default: false)
> +#
> +# Features:
> +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> +#              and false is already the default.
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'TlsCredsAnonProperties',
> +  'base': 'TlsCredsProperties',
> +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] } } }

Since we documented that 'verify-peer' is a no-op for this struct, is it
worth altering our type hierarchy to make it explicit, as in:

TlsCredsCommonProperties - dir, endpoint, priority
TlsCredsProperties - TlsCredsCommonProperties + verify-peer
TlsCredsAnonProperties - TlsCredsCommonProperties + loaded
TlsCredsPskProperties - TlsCredsProperties + loaded, username

But even if not, this matches
crypto/tlscredsanon.c:qcrypto_tls_creds_anon_class_init().

> +
> +##
> +# @TlsCredsPskProperties:
> +#
> +# Properties for tls-creds-psk objects.
> +#
> +# @loaded: if true, the credentials are loaded immediately when applying this
> +#          option and will ignore options that are processed later. Don't use;
> +#          only provided for compatibility. (default: false)
> +#
> +# @username: the username which will be sent to the server.  For clients only.
> +#            If absent, "qemu" is sent and the property will read back as an
> +#            empty string.
> +#
> +# Features:
> +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> +#              and false is already the default.
> +#
> +# Since: 3.0
> +##
> +{ 'struct': 'TlsCredsPskProperties',
> +  'base': 'TlsCredsProperties',
> +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
> +            '*username': 'str' } }

This matches crypto/tlscredspsk.c:qcrypto_tls_creds_psk_class_init().

Do we want to use QAPI type inheritance to declare a union where
'endpoint' is the union discriminator, and 'username' is only present
for 'endpoint':'client'?  (Hmm, we'd have to improve the QAPI code
generator to allow a flat union as the branch of yet another flat union...)

> +
> +##
> +# @TlsCredsX509Properties:
> +#
> +# Properties for tls-creds-x509 objects.
> +#
> +# @loaded: if true, the credentials are loaded immediately when applying this
> +#          option and will ignore options that are processed later. Don't use;
> +#          only provided for compatibility. (default: false)
> +#
> +# @sanity-check: if true, perform some sanity checks before using the
> +#                credentials (default: true)
> +#
> +# @passwordid: For the server-key.pem and client-key.pem files which contain
> +#              sensitive private keys, it is possible to use an encrypted
> +#              version by providing the @passwordid parameter.  This provides
> +#              the ID of a previously created secret object containing the
> +#              password for decryption.
> +#
> +# Features:
> +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> +#              and false is already the default.
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'TlsCredsX509Properties',
> +  'base': 'TlsCredsProperties',
> +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
> +            '*sanity-check': 'bool',
> +            '*passwordid': 'str' } }

This matches crypto/tlscredsx509.c:qcrypto_tls_creds_x509_class_init().

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 2668ad8369..f22b7aa99b 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -452,7 +452,11 @@
>      'rng-random',
>      'secret',
>      'secret_keyring',
> -    'throttle-group'
> +    'throttle-group',
> +    'tls-creds-anon',
> +    'tls-creds-psk',
> +    'tls-creds-x509',
> +    'tls-cipher-suites'

Matches crypto/tls-cipher-suites.c:qcrypto_tls_cipher_suites_class_init().

>    ] }
>  
>  ##
> @@ -488,7 +492,11 @@
>        'rng-random':                 'RngRandomProperties',
>        'secret':                     'SecretProperties',
>        'secret_keyring':             'SecretKeyringProperties',
> -      'throttle-group':             'ThrottleGroupProperties'
> +      'throttle-group':             'ThrottleGroupProperties',
> +      'tls-creds-anon':             'TlsCredsAnonProperties',
> +      'tls-creds-psk':              'TlsCredsPskProperties',
> +      'tls-creds-x509':             'TlsCredsX509Properties',
> +      'tls-cipher-suites':          'TlsCredsProperties'

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


