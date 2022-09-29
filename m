Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5D5EF4C2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:54:11 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ods7F-0002Fb-C3
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrTA-0004uj-8c
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrT2-0003kD-Gs
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQh6tF7xdLjN3X5oTrmfGOaAr5vVIbZm+7rku597Ou4=;
 b=LkPDA4mDEXV1jjZ1k1zUnLBn6Gbbfv74R6JZ8QOSo6CmfybnYpmc00TpxWKR9KgXLyh2Sd
 WtZdgpN/xZQhfelBU0x2Lz6b6AgcpnjtKHrmkvWVAAjuwhYXh+wTY932Ew8tbo+OHXuuor
 B95luWa9XTjGlyYyZzIvukib9zdV9e4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-aO5CkUGLPqOpaG30WhLIOw-1; Thu, 29 Sep 2022 07:12:30 -0400
X-MC-Unique: aO5CkUGLPqOpaG30WhLIOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D2FD296A62D;
 Thu, 29 Sep 2022 11:12:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6606240FF706;
 Thu, 29 Sep 2022 11:12:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 279EF21E691D; Thu, 29 Sep 2022 13:12:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v1 3/7] util: Introduce ThreadContext user-creatable object
References: <20220928164542.117952-1-david@redhat.com>
 <20220928164542.117952-4-david@redhat.com>
Date: Thu, 29 Sep 2022 13:12:28 +0200
In-Reply-To: <20220928164542.117952-4-david@redhat.com> (David Hildenbrand's
 message of "Wed, 28 Sep 2022 18:45:38 +0200")
Message-ID: <87fsgatowz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Setting the CPU affinity of QEMU threads is a bit problematic, because
> QEMU doesn't always have permissions to set the CPU affinity itself,
> for example, with seccomp after initialized by QEMU:
>     -sandbox enable=on,resourcecontrol=deny
>
> While upper layers are already aware how to handl;e CPU affinities for

Typo in handle.

> long-lived threads like iothreads or vcpu threads, especially short-lived
> threads, as used for memory-backend preallocation, are more involved to
> handle. These threads are created on demand and upper layers are not even
> able to identify and configure them.
>
> Introduce the concept of a ThreadContext, that is essentially a thread
> used for creating new threads. All threads created via that context
> thread inherit the configured CPU affinity. Consequently, it's
> sufficient to create a ThreadContext and configure it once, and have all
> threads created via that ThreadContext inherit the same CPU affinity.
>
> The CPU affinity of a ThreadContext can be configured two ways:
>
> (1) Obtaining the thread id via the "thread-id" property and setting the
>     CPU affinity manually.
>
> (2) Setting the "cpu-affinity" property and letting QEMU try set the
>     CPU affinity itself. This will fail if QEMU doesn't have permissions
>     to do so anymore after seccomp was initialized.

Could you provide usage examples?

>
> A ThreadContext can be reused, simply be reconfiguring the CPU affinity.
>
> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 80dd419b39..4775a333ed 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -830,6 +830,20 @@
>              'reduced-phys-bits': 'uint32',
>              '*kernel-hashes': 'bool' } }
>  
> +##
> +# @ThreadContextProperties:
> +#
> +# Properties for thread context objects.
> +#
> +# @cpu-affinity: the CPU affinity for all threads created in the thread
> +#                context (default: QEMU main thread affinity)
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'ThreadContextProperties',
> +  'data': { '*cpu-affinity': ['uint16'] } }

I understand this is a list of affinities.  What I poor ignorant me
doesn't understand is the meaning of the list index.  Or in other words,
the list maps some range [0:N] to affinities, but what are the numbers
being mapped there?

> +
> +
>  ##
>  # @ObjectType:
>  #
> @@ -882,6 +896,7 @@
>      { 'name': 'secret_keyring',
>        'if': 'CONFIG_SECRET_KEYRING' },
>      'sev-guest',
> +    'thread-context',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -948,6 +963,7 @@
>        'secret_keyring':             { 'type': 'SecretKeyringProperties',
>                                        'if': 'CONFIG_SECRET_KEYRING' },
>        'sev-guest':                  'SevGuestProperties',
> +      'thread-context':             'ThreadContextProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',

[...]


