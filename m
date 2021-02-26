Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FD3263A5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:04:33 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdjM-0008Ih-Ul
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFdi1-0007GH-Cp
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFdhy-0000nh-7Y
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614348183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdVvXdmVDLvVKUVZGGGulzV9RkBQBDDSWx4oNuJPw8o=;
 b=UfDdH69q0H3gNTDQsFCGRX6dLJk2ktImcn9cL422UWYe9dbKPSs9gTRt2ljlOyI8FXcR3z
 +zEhNi10k4kAHCw6sUqSZ8+SkBfOjl3V5Fs4sofVnJsvB9TeHZYokMroMyGVTtVG3PkZsI
 oh6UDuQjs17Xq+R+3/rZF/pDHRxtlVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-6hcpKCt5OXiLEtzVtWaefA-1; Fri, 26 Feb 2021 09:03:01 -0500
X-MC-Unique: 6hcpKCt5OXiLEtzVtWaefA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08D2835E21;
 Fri, 26 Feb 2021 14:02:58 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B01935447F;
 Fri, 26 Feb 2021 14:02:51 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-5-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 04/31] qapi/qom: Add ObjectOptions for authz-*
Message-ID: <2fc50625-7010-0f15-04b7-3c3467c9649a@redhat.com>
Date: Fri, 26 Feb 2021 08:02:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-5-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> This adds a QAPI schema for the properties of the authz-* objects.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/authz.json                      | 62 ++++++++++++++++++++++++++++
>  qapi/qom.json                        | 10 +++++
>  storage-daemon/qapi/qapi-schema.json |  1 +
>  3 files changed, 73 insertions(+)
> 
> diff --git a/qapi/authz.json b/qapi/authz.json
> index 42afe752d1..99d49aa563 100644
> --- a/qapi/authz.json
> +++ b/qapi/authz.json
> @@ -59,3 +59,65 @@
>  ##
>  { 'struct': 'QAuthZListRuleListHack',
>    'data': { 'unused': ['QAuthZListRule'] } }

This hack is no longer necessary...

> +
> +##
> +# @AuthZListProperties:
> +#
> +# Properties for authz-list objects.
> +#
> +# @policy: Default policy to apply when no rule matches (default: deny)
> +#
> +# @rules: Authorization rules based on matching user
> +#
> +# Since: 4.0
> +##
> +{ 'struct': 'AuthZListProperties',
> +  'data': { '*policy': 'QAuthZListPolicy',
> +            '*rules': ['QAuthZListRule'] } }

...now that we have a real type using the same array and forcing the
QAPI generator to instantiate it.

Matches authz/list.c:qauthz_list_class_init().

> +
> +##
> +# @AuthZListFileProperties:
> +#
> +# Properties for authz-listfile objects.
> +#
> +# @filename: File name to load the configuration from. The file must
> +#            contain valid JSON for AuthZListProperties.
> +#
> +# @refresh: If true, inotify is used to monitor the file, automatically
> +#           reloading changes. If an error occurs during reloading, all
> +#           authorizations will fail until the file is next successfully
> +#           loaded. (default: true if the binary was built with
> +#           CONFIG_INOTIFY1, false otherwise)
> +#
> +# Since: 4.0
> +##
> +{ 'struct': 'AuthZListFileProperties',
> +  'data': { 'filename': 'str',
> +            '*refresh': 'bool' } }

Matches authz/listfile.c:qauthz_list_file_class_init().

> +
> +##
> +# @AuthZPAMProperties:
> +#
> +# Properties for authz-pam objects.
> +#
> +# @service: PAM service name to use for authorization
> +#
> +# Since: 4.0
> +##
> +{ 'struct': 'AuthZPAMProperties',
> +  'data': { 'service': 'str' } }

Matches authz/pamacct.c:qauthz_pam_class_init().

> +
> +##
> +# @AuthZSimpleProperties:
> +#
> +# Properties for authz-simple objects.
> +#
> +# @identity: Identifies the allowed user. Its format depends on the network
> +#            service that authorization object is associated with. For
> +#            authorizing based on TLS x509 certificates, the identity must be
> +#            the x509 distinguished name.
> +#
> +# Since: 4.0
> +##
> +{ 'struct': 'AuthZSimpleProperties',
> +  'data': { 'identity': 'str' } }

Matches authz/simple.c:qauthz_simple_class_init().

> diff --git a/qapi/qom.json b/qapi/qom.json
> index bf2ecb34be..30ed179bc1 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -4,6 +4,8 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or later.
>  # See the COPYING file in the top-level directory.
>  
> +{ 'include': 'authz.json' }
> +
>  ##
>  # = QEMU Object Model (QOM)
>  ##
> @@ -233,6 +235,10 @@
>  ##
>  { 'enum': 'ObjectType',
>    'data': [
> +    'authz-list',
> +    'authz-listfile',
> +    'authz-pam',
> +    'authz-simple',
>      'iothread'
>    ] }
>  
> @@ -252,6 +258,10 @@
>              'id': 'str' },
>    'discriminator': 'qom-type',
>    'data': {
> +      'authz-list':                 'AuthZListProperties',
> +      'authz-listfile':             'AuthZListFileProperties',
> +      'authz-pam':                  'AuthZPAMProperties',
> +      'authz-simple':               'AuthZSimpleProperties',
>        'iothread':                   'IothreadProperties'
>    } }
>  
> diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
> index 28117c3aac..67749d1101 100644
> --- a/storage-daemon/qapi/qapi-schema.json
> +++ b/storage-daemon/qapi/qapi-schema.json
> @@ -26,6 +26,7 @@
>  { 'include': '../../qapi/crypto.json' }
>  { 'include': '../../qapi/introspect.json' }
>  { 'include': '../../qapi/job.json' }
> +{ 'include': '../../qapi/authz.json' }
>  { 'include': '../../qapi/qom.json' }
>  { 'include': '../../qapi/sockets.json' }
>  { 'include': '../../qapi/transaction.json' }
> 

Once you delete the dead QAPI hack,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


