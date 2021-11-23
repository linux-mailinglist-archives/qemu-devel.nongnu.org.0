Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BF45A38C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:18:37 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVgy-00078W-6o
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpVeG-0005tb-69
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpVeC-0007Rg-Ej
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637673343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tA9/xQQC7RA/XysaU7jm+fmo64pd1mVXQdTHeoLwuB0=;
 b=HirIVL+seQATSTgRDhl1JIWNjRhXl6eb2FDJ1800VI6ndggVa9vSV8GUd8nszIILiWpS2R
 hDNuhBjwIsMWRcWb11TiVOEMH/LZeECOBSB/wV1qgPMmb0HtZT/lirR42c4qKWJzKuHY+c
 VlMox57SFs/TIGFczK7pIezUYwOdToE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-HIpzPVPSO9K3IEssW5rulQ-1; Tue, 23 Nov 2021 08:15:42 -0500
X-MC-Unique: HIpzPVPSO9K3IEssW5rulQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E78D1927802
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 13:15:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A935F4EA;
 Tue, 23 Nov 2021 13:15:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11A0711380A7; Tue, 23 Nov 2021 14:15:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 09/12] qapi/qom: Convert rng-backend/random to class
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-10-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 14:15:33 +0100
In-Reply-To: <20211103173002.209906-10-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:29:59 +0100")
Message-ID: <87bl2b6miy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index ccd1167808..a167e91f67 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -721,6 +721,16 @@
>  { 'struct': 'RngProperties',
>    'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }
>  
> +##
> +# @rng-backend:
> +#
> +# Base class for random number generator backends
> +#
> +# Since: 1.3
> +##
> +{ 'class': 'rng-backend',
> +  'config': 'RngProperties' }
> +
>  ##
>  # @RngEgdProperties:
>  #
> @@ -736,18 +746,18 @@
>    'data': { 'chardev': 'str' } }
>  
>  ##
> -# @RngRandomProperties:
> +# @rng-random:
>  #
> -# Properties for rng-random objects.
> +# Random number generator backend using a host random number device
>  #
>  # @filename: the filename of the device on the host to obtain entropy from
>  #            (default: "/dev/urandom")
>  #
>  # Since: 1.3
>  ##
> -{ 'struct': 'RngRandomProperties',
> -  'base': 'RngProperties',
> -  'data': { '*filename': 'str' } }
> +{ 'class': 'rng-random',
> +  'parent': 'rng-backend',
> +  'config': { '*filename': 'str' } }
>  
>  ##
>  # @SevGuestProperties:
> @@ -889,7 +899,7 @@
>        'qtest':                      'QtestProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
> -      'rng-random':                 { 'type': 'RngRandomProperties',
> +      'rng-random':                 { 'type': 'qom-config:rng-random',
>                                        'if': 'CONFIG_POSIX' },
>        'secret':                     'SecretProperties',
>        'secret_keyring':             { 'type': 'SecretKeyringProperties',

This generates struct q_obj_rng_random_config and struct
qom_config_rng_random.  Their names violate coding style.

The former struct appears to be unused.  Hmm, the next patch will use
it.  Okay.


